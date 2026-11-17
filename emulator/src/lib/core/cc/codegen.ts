// Code generator for the ILF-16 C compiler: syntax tree in, assembly text out.
//
// Registers:
//   $0        always zero
//   $1 - $4   arguments, $1 also the returned value
//   $1 - $5   temporaries, not kept across a call
//   $6 - $13  local variables, kept across a call (a function saves the ones it uses)
//   $14       return address
//   $15       stack pointer (the stack grows down from the top of RAM)
//
// A function that calls nothing (a "leaf") keeps its parameters where they arrive and may put
// its variables and temporaries in any register, saving only those from $6 up.

import { CompileError } from './lexer';
import { isScalar, sizeOf, typeName, type Func, type Node, type Stmt, type Type, type Unit, type Var } from './ast';
import { declaration, type DebugVariable } from './debug';
import { foldCmp } from './parser';
import { RAM_SIZE } from '../isa';

interface Ins {
	op: string;
	args: string[];
	line: number;
	note: string;
	/** A BRN that calls a function: execution continues after it. */
	call: boolean;
}
interface Label {
	label: string;
}
type Item = Ins | Label;
const isLabel = (item: Item): item is Label => 'label' in item;

interface RegOpd {
	reg: number;
	/** A temporary that whoever holds it must release. */
	temp: boolean;
}
interface ImmOpd {
	imm: number;
	/** How to write it in the assembly, when not as a plain number. */
	text: string;
	note: string;
}
type Opd = RegOpd | ImmOpd;
const reg = (r: number, temp = false): RegOpd => ({ reg: r, temp });
const imm = (v: number, text = '', note = ''): ImmOpd => ({ imm: v & 0xffff, text, note });
const isImm = (o: Opd): o is ImmOpd => 'imm' in o;
const fmt = (o: Opd) => (isImm(o) ? o.text || String(o.imm) : `$${o.reg}`);
const SP = reg(15);

const ALU_OPS = new Set([
	'add',
	'sub',
	'rshift',
	'lshift',
	'mul',
	'smul',
	'umul',
	'sumul',
	'test',
	'not',
	'and',
	'or',
	'xor',
	'nand',
	'nor',
	'xnor'
]);
const BIN_OPS: Record<string, string> = { '+': 'add', '*': 'mul', '&': 'and', '|': 'or', '^': 'xor' };

/** Condition codes: the suffix of the branch (B..) and set (S..) instructions. */
const CC_INVERSE: Record<string, string> = {
	eq: 'neq',
	neq: 'eq',
	z: 'nz',
	nz: 'z',
	lt: 'ge',
	ge: 'lt',
	gt: 'le',
	le: 'gt',
	slt: 'sge',
	sge: 'slt',
	sgt: 'sle',
	sle: 'sgt',
	neg: 'posz',
	posz: 'neg',
	pos: 'negz',
	negz: 'pos'
};
const CC_SIGNED: Record<string, string> = { '==': 'eq', '!=': 'neq', '<': 'slt', '<=': 'sle', '>': 'sgt', '>=': 'sge' };
const CC_UNSIGNED: Record<string, string> = { '==': 'eq', '!=': 'neq', '<': 'lt', '<=': 'le', '>': 'gt', '>=': 'ge' };
/** Comparing with zero only needs the flags of the value itself. */
const CC_ZERO_SIGNED: Record<string, string> = { '==': 'z', '!=': 'nz', '<': 'neg', '>=': 'posz', '>': 'pos', '<=': 'negz' };
const CC_ZERO_UNSIGNED: Record<string, string> = { '==': 'z', '!=': 'nz' };
const SET_OPS = new Set(Object.keys(CC_INVERSE).map((cc) => 's' + cc));
/** Instructions that write their destination register (the others read it, or have none). */
const writesDest = (op: string) => ALU_OPS.has(op) || SET_OPS.has(op) || op === 'mov' || op === 'ldi' || op === 'lod' || op === 'in';

const isPow2 = (c: number) => c > 0 && (c & (c - 1)) === 0;
const log2 = (c: number) => 31 - Math.clz32(c);

const magicCache = new Map<number, { mul: number; shift: number } | null>();
/**
 * A multiplier and shift with (x * mul) >> (16 + shift) == x / c for every 16-bit x, or null if
 * no 16-bit multiplier does it. Checked against all 65536 values of x.
 */
function magic(c: number): { mul: number; shift: number } | null {
	let found = magicCache.get(c);
	if (found !== undefined) return found;
	found = null;
	for (let shift = 0; shift < 16 && !found; shift++) {
		const scale = 2 ** (16 + shift);
		const mul = Math.ceil(scale / c);
		if (mul > 0xffff) break;
		let ok = true;
		for (let x = 0; x <= 0xffff && ok; x++) ok = Math.floor((x * mul) / scale) === Math.floor(x / c);
		if (ok) found = { mul, shift };
	}
	magicCache.set(c, found);
	return found;
}

/** Does this division or remainder have to call the runtime routine? */
function divNeedsCall(uns: boolean, divisor: Node): boolean {
	if (divisor.kind !== 'num' || divisor.value === 0) return true;
	const c = divisor.value;
	if (c === 1) return false;
	if (uns) return !isPow2(c) && !magic(c);
	return !(c <= 0x4000 && isPow2(c));
}

function children(e: Node): Node[] {
	switch (e.kind) {
		case 'deref':
		case 'neg':
		case 'bitnot':
		case 'lognot':
		case 'cast':
		case 'incdec':
			return [e.a];
		case 'assign':
		case 'opassign':
		case 'bin':
		case 'cmp':
		case 'logand':
		case 'logor':
		case 'comma':
			return [e.a, e.b];
		case 'cond':
			return [e.a, e.b, e.c];
		case 'call':
			return e.f || e.name ? e.args : [e.a, ...e.args];
		default:
			return [];
	}
}

/** Does evaluating this expression call a function (the division routine counts)? */
function hasCall(e: Node): boolean {
	if (e.kind === 'call' && !e.name) return true;
	if ((e.kind === 'bin' || e.kind === 'opassign') && (e.op === '/' || e.op === '%') && divNeedsCall(e.uns, e.b))
		return true;
	return children(e).some(hasCall);
}

function stmtHasCall(s: Stmt | null): boolean {
	if (!s) return false;
	if (s.expr && hasCall(s.expr)) return true;
	if (s.step && hasCall(s.step)) return true;
	return s.body.some(stmtHasCall) || stmtHasCall(s.init) || stmtHasCall(s.then) || stmtHasCall(s.otherwise);
}

/** No side effects: evaluating it twice, or not at all, changes nothing. */
function pure(e: Node): boolean {
	if (e.kind === 'assign' || e.kind === 'opassign' || e.kind === 'incdec' || e.kind === 'call') return false;
	return children(e).every(pure);
}

const strip = (n: Node): Node => (n.kind === 'cast' ? strip(n.a) : n);

/** Number of operations in an expression. */
function size(e: Node): number {
	return (e.kind === 'cast' ? 0 : 1) + children(e).reduce((sum, c) => sum + size(c), 0);
}

/** Is the condition of this for loop certainly true the first time? (for (i = 0; i < 10; ...)) */
function trueAtEntry(s: Stmt): boolean {
	let init = s.init;
	if (init?.kind === 'block') init = init.body[init.body.length - 1] ?? null;
	const set = init?.kind === 'expr' ? init.expr : null;
	const cond = s.expr;
	if (!set || set.kind !== 'assign' || set.a.kind !== 'var' || set.b.kind !== 'num') return false;
	if (!cond) return false;
	// for (n = 10; n; n--)
	const plain = strip(cond);
	if (plain.kind === 'var') return plain.v === set.a.v && set.b.value !== 0;
	if (cond.kind !== 'cmp' || cond.b.kind !== 'num') return false;
	const v = strip(cond.a);
	if (v.kind !== 'var' || v.v !== set.a.v) return false;
	return foldCmp(cond.op, set.b.value, cond.b.value, cond.uns) === 1;
}

/** A condition that one flag test decides, without branching between its parts. */
function simpleCond(e: Node): boolean {
	if (e.kind === 'logand' || e.kind === 'logor') return false;
	if (e.kind === 'lognot') return simpleCond(e.a);
	return true;
}

/** The registers for temporaries ran out. With fewer variables in registers it may still work. */
class OutOfRegisters extends CompileError {}

class CodeGen {
	private labelCount = 0;
	usesUdiv = false;
	usesSdiv = false;
	/** Functions that are used, in the order they were first referenced. */
	readonly queue: Func[] = [];
	readonly symbols = new Map<Var, string>();

	newLabel(): string {
		return `.L${++this.labelCount}`;
	}
	reference(f: Func, line: number): void {
		if (!f.body) throw new CompileError(line, `Function ${f.name} is declared but has no body`);
		if (!this.queue.includes(f)) this.queue.push(f);
	}
	symbol(v: Var): string {
		return this.symbols.get(v) ?? String(v.addr);
	}
}

class FnGen {
	private items: Item[] = [];
	private line: number;
	/** Words pushed on the stack since the function's own frame was set up. */
	private adj = 0;
	/** Register whose value the flags currently describe (set by an ALU instruction), or -1. */
	private flagsReg = -1;
	private busy = new Array<boolean>(16).fill(false);
	private temps: number[] = [];
	private isTemp = new Array<boolean>(16).fill(false);
	/** Registers from $6 up that this function writes, and so has to save. */
	private saved = new Set<number>();
	private leaf = false;
	private entry: boolean;
	private calls: boolean;
	private frame = 0;
	private retLabel: string;
	private loops: { brk: string; cont: string; contUsed: boolean; isSwitch: boolean }[] = [];
	private userLabels = new Map<string, { label: string; defined: boolean; line: number }>();

	constructor(
		private cg: CodeGen,
		private f: Func,
		/** Most variables a leaf function keeps in registers; the rest are for temporaries. */
		private limit: number
	) {
		this.line = f.line;
		this.entry = f.name === 'main';
		this.calls = stmtHasCall(f.body);
		this.retLabel = cg.newLabel();
	}

	private error(message: string, line = this.line): never {
		throw new CompileError(line, message);
	}

	// --- registers ---------------------------------------------------------------------------

	private assignRegisters(): void {
		const f = this.f;
		const eligible = (v: Var) => !v.addrTaken && isScalar(v.type);
		for (const v of f.locals) v.reg = -1;
		this.leaf = !this.calls && f.params.length <= 8 && f.params.every(eligible);
		const byWeight = (a: Var, b: Var) => b.weight - a.weight;
		const all = Array.from({ length: 13 }, (_, i) => i + 1);
		if (this.leaf) {
			// Parameters 5 to 8 arrive on the stack and are loaded into the next registers.
			f.params.forEach((p, i) => (p.reg = i + 1));
			const pool = all.slice(f.params.length);
			let count = f.params.length;
			for (const v of f.locals.filter((v) => v.param < 0 && eligible(v) && v.weight > 0).sort(byWeight)) {
				if (count++ >= this.limit) break;
				v.reg = pool.shift()!;
			}
			this.temps = pool;
		} else {
			const pool = [6, 7, 8, 9, 10, 11, 12, 13];
			for (const v of f.locals.filter((v) => eligible(v) && v.weight > 0).sort(byWeight)) {
				if (!pool.length) break;
				v.reg = pool.shift()!;
			}
			this.temps = [1, 2, 3, 4, 5];
		}
		for (const r of this.temps) this.isTemp[r] = true;
		let off = 0;
		for (const v of f.locals) {
			if (v.reg >= 6) this.saved.add(v.reg);
			if (v.reg >= 0 || (v.weight === 0 && !v.addrTaken)) continue;
			v.stackOff = off;
			off += sizeOf(v.type, v.line);
		}
		if (off > 4000) this.error(`The local variables of ${f.name} do not fit on the stack: make the large ones global`, f.line);
		this.frame = off;
	}

	private alloc(): number {
		for (const r of this.temps) {
			if (this.busy[r]) continue;
			this.busy[r] = true;
			if (r >= 6) this.saved.add(r);
			return r;
		}
		throw new OutOfRegisters(this.line, 'This expression is too complicated: split it into smaller statements');
	}
	/** A temporary that is not `dest`, for code that writes `dest` before it is done with the temporary. */
	private allocOther(dest: number | null): number {
		if (dest === null || this.busy[dest]) return this.alloc();
		this.busy[dest] = true;
		const t = this.alloc();
		this.busy[dest] = false;
		return t;
	}
	private free(r: number): void {
		this.busy[r] = false;
	}
	private freeCount(): number {
		let n = 0;
		for (const r of this.temps) if (!this.busy[r]) n++;
		return n;
	}
	private release(o: Opd): void {
		if (!isImm(o) && o.temp) this.busy[o.reg] = false;
	}

	// --- emitting ----------------------------------------------------------------------------

	private ins(op: string, d: number | null, ...opds: Opd[]): Ins {
		const args = opds.map(fmt);
		if (d !== null) args.unshift(`$${d}`);
		if (ALU_OPS.has(op)) {
			if (d) this.flagsReg = d;
			else this.flagsReg = op === 'test' && !isImm(opds[0]) ? opds[0].reg : -1;
		} else if (d !== null && d === this.flagsReg && writesDest(op)) this.flagsReg = -1;
		const note = opds
			.map((o) => (isImm(o) ? o.note : ''))
			.filter(Boolean)
			.join(', ');
		const item: Ins = { op, args, line: this.line, note, call: false };
		this.items.push(item);
		return item;
	}
	private label(label: string): void {
		this.items.push({ label });
		this.flagsReg = -1;
	}
	private jump(label: string): void {
		this.ins('brn', null, imm(0, label));
	}

	/** Make a pair of operands fit one of the two-argument instruction layouts. */
	private legal(a: Opd, b: Opd): [Opd, Opd] {
		if (isImm(a) && isImm(b)) {
			if (a.imm <= 255 && b.imm <= 255) return [a, b];
			a = this.toReg(a);
		}
		if (isImm(a)) return [a.imm <= 4095 ? a : this.toReg(a), b];
		if (isImm(b)) return [a, b.imm <= 4095 ? b : this.toReg(b)];
		return [a, b];
	}
	private toReg(o: Opd): RegOpd {
		if (!isImm(o)) return o;
		if (o.imm === 0 && !o.text) return reg(0);
		const t = this.alloc();
		this.ins('ldi', t, o);
		return reg(t, true);
	}
	/** d = a op b, where d is chosen by the caller. The operands are not released. */
	private aluTo(op: string, d: number, a: Opd, b: Opd): void {
		const [la, lb] = this.legal(a, b);
		this.ins(op, d, la, lb);
		if (la !== a) this.release(la);
		if (lb !== b) this.release(lb);
	}
	/** a op b into `dest`, or into a new temporary. Releases the operands. */
	private alu(op: string, dest: number | null, a: Opd, b: Opd): number {
		const [la, lb] = this.legal(a, b);
		this.release(la);
		this.release(lb);
		const d = dest ?? this.alloc();
		this.ins(op, d, la, lb);
		return d;
	}
	private move(dest: number | null, a: Opd): number {
		if (isImm(a)) {
			if (dest === null && a.imm === 0 && !a.text) return 0;
			const d = dest ?? this.alloc();
			this.ins('ldi', d, a);
			return d;
		}
		if (dest === null) return a.reg;
		if (dest !== a.reg) this.ins('mov', dest, a);
		this.release(a);
		return dest;
	}
	private load(r: number, o: Opd): void {
		if (isImm(o)) this.ins('ldi', r, o);
		else if (o.reg !== r) this.ins('mov', r, o);
	}
	/** Set the flags from the value in a register, unless they already describe it. */
	private testReg(r: number): void {
		if (this.flagsReg !== r) this.ins('test', 0, reg(r));
	}
	private addConst(r: number, delta: number): void {
		if (delta > 0) this.aluTo('add', r, reg(r), imm(delta));
		else if (delta < 0) this.aluTo('sub', r, reg(r), imm(-delta));
	}
	private push(r: number): void {
		this.ins('sub', 15, SP, imm(1));
		this.ins('str', r, SP);
		this.adj++;
	}
	private pop(r: number): void {
		this.ins('lod', r, SP);
		this.ins('add', 15, SP, imm(1));
		this.adj--;
	}

	// --- operands ----------------------------------------------------------------------------

	private gaddr(e: Node): ImmOpd {
		const v = e.v;
		if (e.value === 0) return imm(v.addr, this.cg.symbol(v));
		return imm(v.addr + e.value, '', `${v.name || 'string'}${e.value < 0 ? '' : '+'}${e.value}`);
	}

	/**
	 * How many temporaries evaluating `e` needs at once. It must never be too low: `many` relies
	 * on it to decide when to move a value out of the way. Anything with a call in it counts as
	 * needing them all.
	 */
	private need(e: Node): number {
		// two values held at once: the one that needs more goes first
		const two = (x: number, y: number) => Math.max(x, y, Math.min(x, y) + 1, 1);
		// temporaries an operator uses on top of its operands
		const extra = (op: string, uns: boolean) => (op === '/' || op === '%' ? 2 : op === '>>' && !uns ? 1 : 0);
		switch (e.kind) {
			case 'num':
				return e.value > 4095 ? 1 : 0;
			case 'var':
				return !e.v.global && e.v.reg >= 0 ? 0 : 1;
			case 'gaddr':
			case 'laddr':
			case 'faddr':
				return 1;
			case 'cast':
				return this.need(e.a);
			case 'deref':
			case 'neg':
			case 'bitnot':
			case 'lognot':
				return Math.max(this.need(e.a), 1);
			case 'bin':
				if (hasCall(e)) return 99;
				// these operators want their left side in a register, even a constant
				if (extra(e.op, e.uns)) return two(Math.max(this.need(e.a), 1), this.need(e.b)) + extra(e.op, e.uns);
				return two(this.need(e.a), this.need(e.b));
			case 'cmp':
				return two(this.need(e.a), this.need(e.b));
			case 'logand':
			case 'logor':
			case 'comma':
				return Math.max(this.need(e.a), this.need(e.b), 1);
			case 'cond':
				// a constant on either side may need loading
				return Math.max(this.need(e.a), this.need(e.b), this.need(e.c), 3);
			case 'assign':
			case 'opassign':
			case 'incdec': {
				if (hasCall(e)) return 99;
				const more = e.kind === 'opassign' ? extra(e.op, e.uns) : 0;
				if (e.a.kind === 'var' && !e.a.v.global && e.a.v.reg >= 0)
					return e.kind === 'incdec' ? 1 : Math.max(this.need(e.b), 1) + more;
				if (e.kind === 'incdec') return this.needAddr(e.a) + 2;
				return two(this.needAddr(e.a), this.need(e.b)) + (e.kind === 'assign' ? 1 : 2 + more);
			}
			case 'call': {
				if (!e.name) return 99;
				const needs = e.args.map((a) => this.need(a)).sort((x, y) => y - x);
				return Math.max(1, ...needs.map((n, i) => n + i)) + 1;
			}
			default:
				return 1;
		}
	}
	private needAddr(lhs: Node): number {
		if (lhs.kind === 'var') return lhs.v.global || lhs.v.reg >= 0 ? 0 : 1;
		return this.need(lhs.a);
	}

	/** The value of `e` as an operand: a constant, the register of a variable, or a temporary. */
	private operand(e: Node): Opd {
		switch (e.kind) {
			case 'num':
				return imm(e.value);
			case 'gaddr':
				return this.gaddr(e);
			case 'cast':
				return this.operand(e.a);
			case 'var':
				if (!e.v.global && e.v.reg >= 0) return reg(e.v.reg);
		}
		const r = this.gen(e, null);
		return reg(r, this.isTemp[r]);
	}

	/**
	 * Evaluate several things, the most demanding first. When the temporaries would run out,
	 * results already held are pushed on the stack and brought back at the end.
	 */
	private many(list: { need: number; get: () => Opd }[]): Opd[] {
		const order = list.map((_, i) => i).sort((x, y) => list[y].need - list[x].need);
		const result: Opd[] = new Array(list.length);
		const done: number[] = [];
		const pushed: number[] = [];
		for (const i of order) {
			if (this.freeCount() < list[i].need) {
				for (const j of done) {
					const o = result[j];
					if (isImm(o) || !o.temp || pushed.includes(j)) continue;
					this.push(o.reg);
					this.release(o);
					pushed.push(j);
				}
			}
			result[i] = list[i].get();
			done.push(i);
		}
		for (let k = pushed.length - 1; k >= 0; k--) {
			const r = this.alloc();
			this.pop(r);
			result[pushed[k]] = reg(r, true);
		}
		return result;
	}
	private pair(a: Node, b: Node): [Opd, Opd] {
		const [x, y] = this.many([
			{ need: this.need(a), get: () => this.operand(a) },
			{ need: this.need(b), get: () => this.operand(b) }
		]);
		return [x, y];
	}

	private stackOffset(v: Var, extra: number): number {
		return v.stackOff + extra + this.adj;
	}

	/** Where an lvalue in memory is: a fixed address, or an address in a register. */
	private lvalAddr(lhs: Node): Opd {
		if (lhs.kind !== 'var') return this.operand(lhs.a);
		const v = lhs.v;
		if (v.global) return imm(v.addr, this.cg.symbol(v));
		const off = this.stackOffset(v, 0);
		if (off === 0) return SP;
		const t = this.alloc();
		this.aluTo('add', t, SP, imm(off));
		return reg(t, true);
	}

	// --- expressions -------------------------------------------------------------------------

	/**
	 * Evaluate `e` and return the register that holds the result: `dest` if one is given,
	 * otherwise the variable's own register, $0 for zero, or a new temporary. `dest` is only
	 * written by the last instruction, so it may also be one of the values `e` reads.
	 */
	private gen(e: Node, dest: number | null): number {
		if (e.line) this.line = e.line;
		switch (e.kind) {
			case 'num':
				return this.move(dest, imm(e.value));
			case 'gaddr':
				return this.move(dest, this.gaddr(e));
			case 'faddr': {
				this.cg.reference(e.f!, e.line);
				return this.move(dest, imm(0, '.' + e.f!.label));
			}
			case 'laddr': {
				const off = this.stackOffset(e.v, e.value);
				const d = dest ?? this.alloc();
				if (off === 0) this.ins('mov', d, SP);
				else this.aluTo('add', d, SP, imm(off));
				return d;
			}
			case 'var': {
				const v = e.v;
				if (v.global) {
					const d = dest ?? this.alloc();
					this.ins('lod', d, imm(v.addr, this.cg.symbol(v)));
					return d;
				}
				if (v.reg >= 0) return this.move(dest, reg(v.reg));
				const off = this.stackOffset(v, 0);
				const d = dest ?? this.alloc();
				if (off === 0) this.ins('lod', d, SP);
				else {
					this.aluTo('add', d, SP, imm(off));
					this.ins('lod', d, reg(d));
				}
				return d;
			}
			case 'deref': {
				const inc = this.postIncrement(e.a);
				if (inc) {
					// *p++: read through p, then move it on
					const d = dest ?? this.alloc();
					this.ins('lod', d, reg(inc.r));
					if (d !== inc.r) this.addConst(inc.r, inc.delta);
					return d;
				}
				const a = this.operand(e.a);
				this.release(a);
				const d = dest ?? this.alloc();
				this.line = e.line;
				this.ins('lod', d, a);
				return d;
			}
			case 'cast':
				return this.gen(e.a, dest);
			case 'neg':
				return this.alu('sub', dest, imm(0), this.toReg(this.operand(e.a)));
			case 'bitnot': {
				const a = this.toReg(this.operand(e.a));
				this.release(a);
				const d = dest ?? this.alloc();
				this.ins('not', d, a);
				return d;
			}
			case 'bin': {
				const [a, b] = this.pair(e.a, e.b);
				this.line = e.line;
				return this.binary(e.op, e.uns, a, b, dest);
			}
			case 'cmp':
			case 'lognot':
			case 'logand':
			case 'logor':
				return this.genBool(e, dest);
			case 'cond':
				return this.genSelect(e, dest);
			case 'comma':
				this.discard(e.a);
				return this.gen(e.b, dest);
			case 'assign':
			case 'opassign':
			case 'incdec':
				return this.genAssign(e, dest, true);
			case 'call':
				return this.genCall(e, dest, true);
			case 'builtin':
				this.error(`Built-in function ${e.name} can only be called`, e.line);
		}
	}

	/** Is this `p++` or `p--` on a pointer that lives in a register? */
	private postIncrement(a: Node): { r: number; delta: number } | null {
		a = strip(a);
		if (a.kind !== 'incdec' || !a.post) return null;
		const v = a.a;
		if (v.kind !== 'var' || v.v.global || v.v.reg < 0) return null;
		return { r: v.v.reg, delta: a.value };
	}

	/** a op b on operands already evaluated. Releases them. */
	private binary(op: string, uns: boolean, a: Opd, b: Opd, dest: number | null): number {
		switch (op) {
			case '+':
			case '*':
			case '&':
			case '|':
			case '^':
				if (isImm(a) && !isImm(b)) [a, b] = [b, a];
				// adding a number just below 65536 is subtracting a small one
				if (op === '+' && isImm(b) && !b.text && b.imm > 4095 && 0x10000 - b.imm <= 4095)
					return this.alu('sub', dest, a, imm(0x10000 - b.imm));
				return this.alu(BIN_OPS[op], dest, a, b);
			case '-':
				if (isImm(b) && !b.text && b.imm > 4095 && 0x10000 - b.imm <= 4095)
					return this.alu('add', dest, a, imm(0x10000 - b.imm));
				return this.alu('sub', dest, a, b);
			case '<<':
				return this.alu('lshift', dest, a, b);
			case '>>':
				if (uns) return this.alu('rshift', dest, a, b);
				if (isImm(b)) return this.shiftRightSigned(dest, a, b.imm);
				return this.shiftRightSignedBy(dest, a, b);
			case '/':
			case '%':
				return this.divide(op, uns, a, b, dest);
		}
		this.error(`Internal error: operator ${op}`);
	}

	/** Arithmetic shift right by a constant. There is no instruction for it. */
	private shiftRightSigned(dest: number | null, a0: Opd, n: number): number {
		n = Math.min(n, 15);
		if (n === 0) return this.move(dest, a0);
		const a = this.toReg(a0);
		// The upper word of a * 2^(16 - n) is a >> n, sign included.
		if (n >= 5) return this.alu('sumul', dest, a, imm(1 << (16 - n)));
		const t = this.allocOther(dest);
		if (n >= 2) {
			this.ins('ldi', t, imm(1 << (16 - n)));
			return this.alu('sumul', dest, a, reg(t, true));
		}
		// By one: shift, then put the sign bit back.
		this.testReg(a.reg);
		this.ins('sneg', t, imm(0x8000));
		this.release(a);
		const d = dest ?? this.alloc();
		this.ins('rshift', d, a, imm(1));
		this.ins('or', d, reg(d), reg(t));
		this.free(t);
		return d;
	}

	/** Arithmetic shift right by a variable amount: a negative number is inverted around it. */
	private shiftRightSignedBy(dest: number | null, a0: Opd, n: Opd): number {
		const a = this.toReg(a0);
		const t = this.alloc();
		const positive = this.cg.newLabel();
		const end = this.cg.newLabel();
		this.testReg(a.reg);
		this.ins('bposz', null, imm(0, positive));
		this.ins('not', t, a);
		this.ins('rshift', t, reg(t), n);
		this.ins('not', t, reg(t));
		this.jump(end);
		this.label(positive);
		this.ins('rshift', t, a, n);
		this.label(end);
		this.release(a);
		this.release(n);
		if (dest === null) return t;
		if (dest !== t) this.ins('mov', dest, reg(t));
		this.free(t);
		return dest;
	}

	private divide(op: string, uns: boolean, a0: Opd, b: Opd, dest: number | null): number {
		const c = isImm(b) && !b.text ? b.imm : 0;
		if (c === 1) {
			if (op === '/') return this.move(dest, a0);
			this.release(a0);
			return this.move(dest, imm(0));
		}
		if (c && uns) {
			if (isPow2(c))
				return op === '/' ? this.alu('rshift', dest, a0, imm(log2(c))) : this.alu('and', dest, a0, imm(c - 1));
			const m = magic(c);
			if (m) {
				// Multiply by 65536 / c (rounded up) and keep the upper word.
				const a = this.toReg(a0);
				if (op === '/') {
					if (!m.shift) return this.alu('umul', dest, a, imm(m.mul));
					const q = this.alu('umul', null, a, imm(m.mul));
					return this.alu('rshift', dest, reg(q, true), imm(m.shift));
				}
				const t = this.alloc();
				this.aluTo('umul', t, a, imm(m.mul));
				if (m.shift) this.aluTo('rshift', t, reg(t), imm(m.shift));
				this.aluTo('mul', t, reg(t), imm(c));
				this.release(a);
				const d = dest ?? t;
				this.ins('sub', d, a, reg(t));
				if (dest !== null) this.free(t);
				return d;
			}
		} else if (c && c <= 0x4000 && isPow2(c)) {
			// Signed division by a power of two rounds towards zero: add c - 1 to negative numbers.
			const n = log2(c);
			const a = this.toReg(a0);
			const t = this.alloc();
			this.testReg(a.reg);
			this.ins('sneg', t, imm(c - 1));
			this.ins('add', t, reg(t), a);
			if (op === '/') {
				this.release(a);
				return this.shiftRightSigned(dest, reg(t, true), n);
			}
			const q = this.shiftRightSigned(null, reg(t, true), n);
			this.ins('lshift', q, reg(q), imm(n));
			this.release(a);
			const d = dest ?? q;
			this.ins('sub', d, a, reg(q));
			if (dest !== null) this.free(q);
			return d;
		}
		// The general case is a routine: quotient in $1, remainder in $2.
		if (uns) this.cg.usesUdiv = true;
		else this.cg.usesSdiv = true;
		this.release(a0);
		this.release(b);
		const saved = this.saveTemps(dest);
		if (!isImm(b) && b.reg === 1) {
			if (!isImm(a0) && a0.reg === 2) {
				this.ins('mov', 3, reg(1));
				this.ins('mov', 1, reg(2));
				this.ins('mov', 2, reg(3));
			} else {
				this.ins('mov', 2, reg(1));
				this.load(1, a0);
			}
		} else {
			this.load(1, a0);
			this.load(2, b);
		}
		this.callTo(imm(0, uns ? '.__udivmod' : '.__sdivmod'));
		return this.afterCall(op === '/' ? 1 : 2, saved, dest, true);
	}

	// --- conditions --------------------------------------------------------------------------

	/**
	 * Set the flags for a simple condition and return the condition code that is true when the
	 * condition holds.
	 */
	private flags(e: Node): string {
		if (e.kind === 'lognot') return CC_INVERSE[this.flags(e.a)];
		if (e.kind === 'cast') return this.flags(e.a);
		if (e.kind === 'cmp') {
			const [a, b] = this.pair(e.a, e.b);
			this.line = e.line;
			if (isImm(b) && b.imm === 0 && !b.text && !isImm(a)) {
				const cc = (e.uns ? CC_ZERO_UNSIGNED : CC_ZERO_SIGNED)[e.op];
				if (cc) {
					this.testReg(a.reg);
					this.release(a);
					return cc;
				}
			}
			const [la, lb] = this.legal(a, b);
			this.ins('sub', 0, la, lb);
			this.release(la);
			this.release(lb);
			return (e.uns ? CC_UNSIGNED : CC_SIGNED)[e.op];
		}
		const o = this.toReg(this.operand(e));
		this.testReg(o.reg);
		this.release(o);
		return 'nz';
	}

	/**
	 * Jump to `T` if the condition holds and to `F` if not. `next` is the one of the two that
	 * comes right after this code, so no jump to it is needed.
	 */
	private branch(e: Node, T: string, F: string, next: string): void {
		if (e.kind === 'num') {
			const target = e.value ? T : F;
			if (target !== next) this.jump(target);
		} else if (e.kind === 'lognot') this.branch(e.a, F, T, next);
		else if (e.kind === 'cast') this.branch(e.a, T, F, next);
		else if (e.kind === 'comma') {
			this.discard(e.a);
			this.branch(e.b, T, F, next);
		} else if (e.kind === 'logand') {
			const mid = this.cg.newLabel();
			this.branch(e.a, mid, F, mid);
			this.label(mid);
			this.branch(e.b, T, F, next);
		} else if (e.kind === 'logor') {
			const mid = this.cg.newLabel();
			this.branch(e.a, T, mid, mid);
			this.label(mid);
			this.branch(e.b, T, F, next);
		} else {
			const cc = this.flags(e);
			if (next === T) this.ins('b' + CC_INVERSE[cc], null, imm(0, F));
			else {
				this.ins('b' + cc, null, imm(0, T));
				if (next !== F) this.jump(F);
			}
		}
	}

	/** The value (0 or 1) of a comparison or logical operator. */
	private genBool(e: Node, dest: number | null): number {
		if (simpleCond(e)) {
			const cc = this.flags(e);
			const d = dest ?? this.alloc();
			this.ins('s' + cc, d, imm(1));
			return d;
		}
		const T = this.cg.newLabel();
		const F = this.cg.newLabel();
		const end = this.cg.newLabel();
		this.branch(e, T, F, T);
		const d = dest ?? this.alloc();
		this.label(T);
		this.ins('ldi', d, imm(1));
		this.jump(end);
		this.label(F);
		this.ins('ldi', d, imm(0));
		this.label(end);
		return d;
	}

	/** c ? x : y */
	private genSelect(e: Node, dest: number | null): number {
		const plain = (n: Node) => {
			n = strip(n);
			return n.kind === 'num' || n.kind === 'gaddr' || (n.kind === 'var' && !n.v.global && n.v.reg >= 0);
		};
		if (simpleCond(e.a) && plain(e.b) && plain(e.c)) {
			// One conditional set instruction picks between two registers or constants.
			const cc = this.flags(e.a);
			const x = this.operand(e.b);
			const y = this.operand(e.c);
			if (isImm(y) && y.imm === 0 && !y.text) {
				const d = dest ?? this.alloc();
				this.ins('s' + cc, d, x);
				return d;
			}
			const [lx, ly] = this.legal(x, y);
			this.release(lx);
			this.release(ly);
			const d = dest ?? this.alloc();
			this.ins('s' + cc, d, lx, ly);
			return d;
		}
		const T = this.cg.newLabel();
		const F = this.cg.newLabel();
		const end = this.cg.newLabel();
		// The result register holds nothing until the last instruction of either side, so it
		// stays free for working things out in until then.
		const d = dest ?? this.alloc();
		if (dest === null) this.busy[d] = false;
		this.branch(e.a, T, F, T);
		this.label(T);
		this.gen(e.b, d);
		this.jump(end);
		this.label(F);
		this.gen(e.c, d);
		this.label(end);
		if (dest === null) this.busy[d] = true;
		return d;
	}

	/** Evaluate an expression whose value is not used. */
	private discard(e: Node): void {
		if (e.line) this.line = e.line;
		switch (e.kind) {
			case 'assign':
			case 'opassign':
			case 'incdec':
				this.genAssign(e, null, false);
				return;
			case 'call':
				this.genCall(e, null, false);
				return;
			case 'comma':
				this.discard(e.a);
				this.discard(e.b);
				return;
			case 'cast':
				this.discard(e.a);
				return;
			case 'cond': {
				const T = this.cg.newLabel();
				const F = this.cg.newLabel();
				const end = this.cg.newLabel();
				this.branch(e.a, T, F, T);
				this.label(T);
				this.discard(e.b);
				this.jump(end);
				this.label(F);
				this.discard(e.c);
				this.label(end);
				return;
			}
			case 'logand':
			case 'logor': {
				const more = this.cg.newLabel();
				const end = this.cg.newLabel();
				if (e.kind === 'logand') this.branch(e.a, more, end, more);
				else this.branch(e.a, end, more, more);
				this.label(more);
				this.discard(e.b);
				this.label(end);
				return;
			}
			default:
				if (!pure(e)) this.release(this.operand(e));
		}
	}

	// --- assignment --------------------------------------------------------------------------

	private genAssign(e: Node, dest: number | null, wanted: boolean): number {
		const lhs = e.a;
		const finish = (v: RegOpd): number => {
			if (!wanted) {
				this.release(v);
				return -1;
			}
			if (dest === null) return v.reg;
			if (dest !== v.reg) this.ins('mov', dest, v);
			this.release(v);
			return dest;
		};

		if (lhs.kind === 'var' && !lhs.v.global && lhs.v.reg >= 0) {
			const r = lhs.v.reg;
			if (e.kind === 'assign') this.gen(e.b, r);
			else if (e.kind === 'opassign') {
				const b = this.operand(e.b);
				this.line = e.line;
				this.binary(e.op, e.uns, reg(r), b, r);
			} else if (e.post && wanted) {
				const d = dest ?? this.alloc();
				this.ins('mov', d, reg(r));
				this.addConst(r, e.value);
				return d;
			} else this.addConst(r, e.value);
			return finish(reg(r));
		}

		const inc = e.kind === 'assign' && lhs.kind === 'deref' ? this.postIncrement(lhs.a) : null;
		if (inc) {
			// *p++ = value: write through p, then move it on
			const v = this.toReg(this.operand(e.b));
			this.line = e.line;
			this.ins('str', v.reg, reg(inc.r));
			this.addConst(inc.r, inc.delta);
			return finish(v);
		}

		const address = { need: this.needAddr(lhs), get: () => this.lvalAddr(lhs) };
		if (e.kind === 'incdec') {
			const addr = this.lvalAddr(lhs);
			const t = this.alloc();
			this.ins('lod', t, addr);
			if (e.post && wanted) {
				const u = this.alloc();
				if (e.value > 0) this.aluTo('add', u, reg(t), imm(e.value));
				else this.aluTo('sub', u, reg(t), imm(-e.value));
				this.ins('str', u, addr);
				this.free(u);
			} else {
				this.addConst(t, e.value);
				this.ins('str', t, addr);
			}
			this.release(addr);
			return finish(reg(t, true));
		}
		const [addr, b] = this.many([address, { need: this.need(e.b), get: () => this.operand(e.b) }]);
		this.line = e.line;
		if (e.kind === 'assign') {
			const v = this.toReg(b);
			this.ins('str', v.reg, addr);
			this.release(addr);
			return finish(v);
		}
		const t = this.alloc();
		this.ins('lod', t, addr);
		const r = this.binary(e.op, e.uns, reg(t, true), b, null);
		this.ins('str', r, addr);
		this.release(addr);
		return finish(reg(r, this.isTemp[r]));
	}

	// --- calls -------------------------------------------------------------------------------

	/** Push the temporaries in use (a call overwrites them) and return which ones. */
	private saveTemps(dest: number | null): number[] {
		const saved = this.temps.filter((r) => this.busy[r] && r !== dest);
		for (const r of saved) {
			this.push(r);
			this.busy[r] = false;
		}
		return saved;
	}
	private callTo(target: Opd): void {
		if (!this.calls) this.error('Internal error: a call in a function that was found to have none');
		this.ins('ldi', 14, imm(0, '~+2'));
		this.ins('brn', null, target).call = true;
		this.flagsReg = -1;
	}
	/** Take the result of a call out of `from` and bring back the saved temporaries. */
	private afterCall(from: number, saved: number[], dest: number | null, wanted: boolean): number {
		let result = -1;
		if (wanted) {
			if (dest !== null) {
				if (dest !== from) this.ins('mov', dest, reg(from));
				result = dest;
			} else if (!saved.length) {
				this.busy[from] = true;
				result = from;
			} else {
				for (const r of saved) this.busy[r] = true;
				result = this.alloc();
				if (result !== from) this.ins('mov', result, reg(from));
				for (const r of saved) this.busy[r] = false;
			}
		}
		for (let i = saved.length - 1; i >= 0; i--) {
			this.pop(saved[i]);
			this.busy[saved[i]] = true;
		}
		return result;
	}

	private genCall(e: Node, dest: number | null, wanted: boolean): number {
		if (e.name) return this.genBuiltin(e, dest, wanted);
		if (e.f) this.cg.reference(e.f, e.line);
		// `dest` may be a temporary the caller holds, and also one of the argument registers
		const destHeld = dest !== null && this.busy[dest];
		const saved = this.saveTemps(dest);
		// It holds nothing yet, so the arguments may be worked out in it
		if (destHeld) this.busy[dest] = false;
		const args = e.args;
		const inRegs = Math.min(args.length, 4);
		// Arguments after the fourth go on the stack, the last one first.
		for (let i = args.length - 1; i >= 4; i--) {
			const o = this.toReg(this.operand(args[i]));
			this.push(o.reg);
			this.release(o);
		}
		// The arguments are put in their registers from the last to the first. One that would
		// not have the temporaries it needs by then (the registers of the later arguments are
		// taken) is worked out beforehand and waits on the stack. The same goes for the
		// address of a function called through a pointer, which is fetched last.
		const total = this.temps.length;
		const early = (need: number, taken: number) => taken > 0 && need > total - taken;
		const targetEarly = !e.f && early(this.need(e.a), inRegs);
		if (targetEarly) {
			const o = this.toReg(this.operand(e.a));
			this.push(o.reg);
			this.release(o);
		}
		const waiting: boolean[] = [];
		for (let i = 0; i < inRegs; i++) {
			waiting[i] = early(this.need(args[i]), inRegs - 1 - i);
			if (!waiting[i]) continue;
			const o = this.toReg(this.operand(args[i]));
			this.push(o.reg);
			this.release(o);
		}
		for (let i = inRegs - 1; i >= 0; i--) {
			if (waiting[i]) this.pop(i + 1);
			else this.gen(args[i], i + 1);
			this.busy[i + 1] = true;
		}
		let target: Opd;
		if (e.f) target = imm(0, '.' + e.f.label);
		else if (targetEarly) {
			// $5 is a temporary that never holds an argument
			this.pop(5);
			target = reg(5);
		} else {
			const through = this.operand(e.a);
			if (isImm(through) || through.temp) {
				this.load(5, through);
				this.release(through);
				target = reg(5);
			} else target = through;
		}
		this.line = e.line;
		this.callTo(target);
		for (let i = 0; i < inRegs; i++) this.busy[i + 1] = false;
		if (destHeld) this.busy[dest] = true;
		if (args.length > 4) {
			this.aluTo('add', 15, SP, imm(args.length - 4));
			this.adj -= args.length - 4;
		}
		return this.afterCall(1, saved, dest, wanted && e.type.kind !== 'void');
	}

	private genBuiltin(e: Node, dest: number | null, wanted: boolean): number {
		const A = e.args;
		const port = (o: Opd): Opd => (isImm(o) ? imm(o.imm, `%${o.imm}`) : o);
		const done = (r: number) => {
			if (!wanted && r > 0 && this.isTemp[r]) this.free(r);
			return r;
		};
		switch (e.name) {
			case 'pixel': {
				const [x, y, c0] = this.many(A.map((n) => ({ need: this.need(n), get: () => this.operand(n) })));
				const c = this.toReg(c0);
				const [lx, ly] = this.legal(x, y);
				this.line = e.line;
				this.ins('gfxsp', c.reg, lx, ly);
				this.release(lx);
				this.release(ly);
				this.release(c);
				return -1;
			}
			case 'in': {
				const p = this.operand(A[0]);
				this.release(p);
				if (!wanted) return -1;
				const d = dest ?? this.alloc();
				this.ins('in', d, port(p));
				return d;
			}
			case 'out': {
				const [p, v0] = this.pair(A[0], A[1]);
				const v = this.toReg(v0);
				this.line = e.line;
				this.ins('out', v.reg, port(p));
				this.release(p);
				this.release(v);
				return -1;
			}
			case 'stall': {
				const n = this.operand(A[0]);
				this.ins('stl', null, n);
				this.release(n);
				return -1;
			}
			case 'halt':
				this.ins('hlt', null);
				return -1;
			case 'mulhi':
			case 'umulhi': {
				const [a, b] = this.pair(A[0], A[1]);
				this.line = e.line;
				return done(this.alu(e.name === 'mulhi' ? 'sumul' : 'umul', dest, a, b));
			}
		}
		this.error(`Internal error: built-in ${e.name}`);
	}

	// --- statements --------------------------------------------------------------------------

	private userLabel(name: string, line: number, define: boolean): string {
		let entry = this.userLabels.get(name);
		if (!entry) {
			entry = { label: this.cg.newLabel(), defined: false, line };
			this.userLabels.set(name, entry);
		}
		if (define) {
			if (entry.defined) this.error(`Label ${name} is defined twice`, line);
			entry.defined = true;
		}
		return entry.label;
	}

	private stmt(s: Stmt): void {
		this.line = s.line;
		// Between statements no temporary holds anything.
		const held = this.temps.filter((r) => this.busy[r]);
		if (held.length || this.adj) this.error(`Internal error: register $${held[0]} or the stack was left in use`);
		const L = () => this.cg.newLabel();
		switch (s.kind) {
			case 'block':
				for (const c of s.body) this.stmt(c);
				break;
			case 'expr':
				this.discard(s.expr!);
				break;
			case 'if': {
				const T = L();
				const F = L();
				this.branch(s.expr!, T, F, T);
				this.label(T);
				this.stmt(s.then!);
				if (s.otherwise) {
					const end = L();
					this.jump(end);
					this.label(F);
					this.stmt(s.otherwise);
					this.label(end);
				} else this.label(F);
				break;
			}
			case 'while':
			case 'for': {
				// The condition is tested at the bottom, so that each round takes one branch. A
				// label there would hide what the flags hold, so the first test is done apart:
				// not at all when it is sure to pass, as a copy when the condition is small, and
				// otherwise by jumping to the bottom.
				if (s.init) this.stmt(s.init);
				const top = L();
				const cond = L();
				const end = L();
				const always = !s.expr || (s.expr.kind === 'num' && s.expr.value !== 0);
				let jumped = false;
				if (!always && !trueAtEntry(s)) {
					this.line = s.line;
					const e = s.expr!;
					if (simpleCond(e) && pure(e) && !hasCall(e) && size(e) <= 4) this.branch(e, top, end, top);
					else {
						this.jump(cond);
						jumped = true;
					}
				}
				this.label(top);
				const loop = { brk: end, cont: L(), contUsed: false, isSwitch: false };
				this.loops.push(loop);
				this.stmt(s.then!);
				this.loops.pop();
				if (loop.contUsed) this.label(loop.cont);
				this.line = s.line;
				if (s.step) this.discard(s.step);
				if (always) this.jump(top);
				else {
					if (jumped) this.label(cond);
					this.branch(s.expr!, top, end, end);
				}
				this.label(end);
				break;
			}
			case 'do': {
				const top = L();
				const end = L();
				this.label(top);
				const loop = { brk: end, cont: L(), contUsed: false, isSwitch: false };
				this.loops.push(loop);
				this.stmt(s.then!);
				this.loops.pop();
				if (loop.contUsed) this.label(loop.cont);
				this.line = s.expr!.line || s.line;
				this.branch(s.expr!, top, end, end);
				this.label(end);
				break;
			}
			case 'return':
				if (s.expr && !this.entry) this.gen(s.expr, 1);
				else if (s.expr) this.discard(s.expr);
				this.line = s.line;
				this.jump(this.retLabel);
				break;
			case 'break': {
				const loop = this.loops[this.loops.length - 1];
				if (!loop) this.error('break outside a loop or switch', s.line);
				this.jump(loop.brk);
				break;
			}
			case 'continue': {
				const loop = this.loops.findLast((l) => !l.isSwitch);
				if (!loop) this.error('continue outside a loop', s.line);
				loop.contUsed = true;
				this.jump(loop.cont);
				break;
			}
			case 'switch': {
				const end = L();
				const v = this.toReg(this.operand(s.expr!));
				let fallback = end;
				for (const c of s.cases) {
					c.asmLabel = L();
					if (c.isDefault) {
						fallback = c.asmLabel;
						continue;
					}
					const [a, b] = this.legal(v, imm(c.value));
					this.ins('sub', 0, a, b);
					this.release(b);
					this.ins('beq', null, imm(0, c.asmLabel));
				}
				this.release(v);
				this.jump(fallback);
				this.loops.push({ brk: end, cont: '', contUsed: false, isSwitch: true });
				this.stmt(s.then!);
				this.loops.pop();
				this.label(end);
				break;
			}
			case 'case':
				this.label(s.asmLabel);
				break;
			case 'goto':
				this.jump(this.userLabel(s.name, s.line, false));
				break;
			case 'label':
				this.label(this.userLabel(s.name, s.line, true));
				break;
			case 'empty':
				break;
		}
	}

	// --- the whole function ------------------------------------------------------------------

	generate(): Item[] {
		const f = this.f;
		this.assignRegisters();
		this.stmt(f.body!);
		for (const [name, entry] of this.userLabels)
			if (!entry.defined) this.error(`Label ${name} is not defined in ${f.name}`, entry.line);
		const body = this.items;

		// Entry code: save registers, make room for the variables on the stack, and move the
		// parameters to where they live.
		this.items = [];
		this.line = f.line;
		this.adj = 0;
		const saves = this.entry ? [] : [...(this.calls ? [14] : []), ...[...this.saved].sort((a, b) => a - b)];
		for (const r of saves) this.push(r);
		this.adj = 0;
		if (this.frame) this.ins('sub', 15, SP, imm(this.frame));
		if (this.leaf) {
			f.params.forEach((p, i) => {
				if (i < 4 || p.weight === 0) return;
				this.ins('add', p.reg, SP, imm(this.frame + saves.length + (i - 4)));
				this.ins('lod', p.reg, reg(p.reg));
			});
		} else {
			f.params.forEach((p, i) => {
				if (p.weight === 0 && !p.addrTaken) return;
				if (i < 4) {
					if (p.reg >= 0) this.ins('mov', p.reg, reg(i + 1));
					else if (p.stackOff === 0) this.ins('str', i + 1, SP);
					else {
						this.ins('add', 5, SP, imm(p.stackOff));
						this.ins('str', i + 1, reg(5));
					}
					return;
				}
				// passed on the stack, above this function's own frame
				const from = this.frame + saves.length + (i - 4);
				const r = p.reg >= 0 ? p.reg : 5;
				this.ins('add', r, SP, imm(from));
				this.ins('lod', r, reg(r));
				if (p.reg >= 0) return;
				if (p.stackOff === 0) this.ins('str', 5, SP);
				else {
					this.ins('add', 4, SP, imm(p.stackOff));
					this.ins('str', 5, reg(4));
				}
			});
		}
		const prologue = this.items;

		this.items = [];
		if (this.entry) this.ins('hlt', null);
		else {
			if (this.frame) this.ins('add', 15, SP, imm(this.frame));
			for (let i = saves.length - 1; i >= 0; i--) this.pop(saves[i]);
			this.ins('brn', null, reg(14));
		}
		const epilogue = this.items as Ins[];

		let items: Item[] = [...prologue, ...body, { label: this.retLabel }, ...epilogue];
		// A one-instruction exit replaces every jump to it.
		if (epilogue.length === 1) {
			items = items.map((item) =>
				!isLabel(item) && item.op === 'brn' && item.args[0] === this.retLabel
					? { ...epilogue[0], line: item.line }
					: item
			);
		}
		return peephole(items);
	}
}

const isBranch = (item: Item): item is Ins => !isLabel(item) && item.op[0] === 'b';
/** Execution never continues after this instruction. */
const isStop = (item: Item) => !isLabel(item) && ((item.op === 'brn' && !item.call) || item.op === 'hlt');

/** Tidy up jumps: remove dead code, jumps to the next instruction and jumps to jumps. */
function peephole(items: Item[]): Item[] {
	for (let round = 0; round < 20; round++) {
		let changed = false;
		const out: Item[] = [];
		// The labels right before position i, and the instruction that follows them.
		const labelsAt = (i: number) => {
			const labels: string[] = [];
			while (i < items.length && isLabel(items[i])) labels.push((items[i++] as Label).label);
			return { labels, next: items[i] as Ins | undefined };
		};
		// Where a jump to each label really ends up, following jumps to jumps.
		const forward = new Map<string, string>();
		for (let i = 0; i < items.length; i++) {
			const item = items[i];
			if (!isLabel(item)) continue;
			const { next } = labelsAt(i);
			if (next && next.op === 'brn' && !next.call && next.args[0].startsWith('.') && next.args[0] !== item.label)
				forward.set(item.label, next.args[0]);
		}
		const resolve = (label: string) => {
			let target = label;
			for (let hops = 0; hops < 10 && forward.has(target); hops++) target = forward.get(target)!;
			return forward.has(target) ? label : target;
		};

		let dead = false;
		/** Memory words whose value is known to be in a register: address (as written) -> register. */
		const held = new Map<string, string>();
		const forget = (r: string) => {
			for (const [address, value] of held) if (address === r || value === r) held.delete(address);
		};
		for (let i = 0; i < items.length; i++) {
			const item = items[i];
			if (isLabel(item)) {
				dead = false;
				held.clear();
				out.push(item);
				continue;
			}
			if (dead) {
				changed = true;
				continue;
			}
			if (item.op === 'str') {
				// A store through a register may change any word; one to a fixed address only that word.
				const [value, address] = item.args;
				if (address[0] === '$') held.clear();
				else for (const a of held.keys()) if (a[0] === '$') held.delete(a);
				held.set(address, value);
			} else if (item.op === 'lod') {
				const [d, address] = item.args;
				const value = held.get(address);
				if (value !== undefined) {
					// The word was just stored or loaded: copy the register instead of reading memory.
					changed = true;
					if (value === d) continue;
					forget(d);
					out.push({ ...item, op: 'mov', args: [d, value] });
					continue;
				}
				forget(d);
				if (address !== d) held.set(address, d);
			} else if (item.call) held.clear();
			else if (writesDest(item.op)) forget(item.args[0]);
			if (item.op === 'mov' && item.args[0] === item.args[1]) {
				changed = true;
				continue;
			}
			if (isBranch(item) && !item.call && item.args[0].startsWith('.')) {
				const target = resolve(item.args[0]);
				if (target !== item.args[0]) {
					item.args[0] = target;
					changed = true;
				}
				const after = labelsAt(i + 1);
				// a jump to the very next instruction
				if (after.labels.includes(item.args[0])) {
					changed = true;
					continue;
				}
				// a conditional branch around a jump: branch on the opposite condition instead
				const cc = item.op.slice(1);
				const following = items[i + 1];
				if (
					cc in CC_INVERSE &&
					following &&
					!isLabel(following) &&
					following.op === 'brn' &&
					!following.call &&
					labelsAt(i + 2).labels.includes(item.args[0])
				) {
					out.push({ ...following, op: 'b' + CC_INVERSE[cc], line: item.line });
					i++;
					changed = true;
					continue;
				}
			}
			out.push(item);
			if (isStop(item)) dead = true;
		}
		// Labels nothing jumps to any more
		const used = new Set<string>();
		for (const item of out) if (!isLabel(item)) for (const arg of item.args) if (arg.startsWith('.')) used.add(arg);
		items = out.filter((item) => !isLabel(item) || used.has(item.label) || !/^\.L\d+$/.test(item.label));
		if (items.length !== out.length) changed = true;
		if (!changed) break;
	}
	return items;
}

/**
 * Generate a function. A function that calls nothing first tries to keep nearly all of its
 * variables in registers, and falls back to fewer if an expression then runs out of
 * temporaries.
 */
function generateFunction(cg: CodeGen, f: Func): Item[] {
	const limits = [11, 9, 7];
	for (const limit of limits.slice(0, -1)) {
		try {
			return new FnGen(cg, f, limit).generate();
		} catch (e) {
			if (!(e instanceof OutOfRegisters)) throw e;
		}
	}
	return new FnGen(cg, f, limits[limits.length - 1]).generate();
}

const RUNTIME_UDIV = `
; Unsigned division: $1 / $2. Returns the quotient in $1 and the remainder in $2.
.__udivmod
    TEST   $0 $2
    BNEG   .__udiv_big
    LDI    $3 0
    LDI    $4 16
.__udiv_loop
    RSHIFT $5 $1 15
    LSHIFT $3 $3 1
    OR     $3 $3 $5
    LSHIFT $1 $1 1
    SUB    $0 $3 $2
    BLT    .__udiv_next
    SUB    $3 $3 $2
    ADD    $1 $1 1
.__udiv_next
    SUB    $4 $4 1
    BNZ    .__udiv_loop
    MOV    $2 $3
    BRN    $14
.__udiv_big
    SUB    $0 $1 $2
    BLT    .__udiv_small
    SUB    $2 $1 $2
    LDI    $1 1
    BRN    $14
.__udiv_small
    MOV    $2 $1
    LDI    $1 0
    BRN    $14`;

const RUNTIME_SDIV = `
; Signed division: $1 / $2, rounding towards zero. Quotient in $1, remainder in $2.
.__sdivmod
    SUB    $15 $15 3
    STR    $14 $15
    ADD    $3 $15 1
    STR    $1 $3
    XOR    $4 $1 $2
    ADD    $3 $15 2
    STR    $4 $3
    TEST   $0 $1
    BPOSZ  .__sdiv_a
    SUB    $1 $0 $1
.__sdiv_a
    TEST   $0 $2
    BPOSZ  .__sdiv_b
    SUB    $2 $0 $2
.__sdiv_b
    LDI    $14 .__sdiv_back
    BRN    .__udivmod
.__sdiv_back
    ADD    $3 $15 2
    LOD    $4 $3
    TEST   $0 $4
    BPOSZ  .__sdiv_q
    SUB    $1 $0 $1
.__sdiv_q
    ADD    $3 $15 1
    LOD    $4 $3
    TEST   $0 $4
    BPOSZ  .__sdiv_r
    SUB    $2 $0 $2
.__sdiv_r
    LOD    $14 $15
    ADD    $15 $15 3
    BRN    $14`;

/** Globals without initial values larger than this are not written out as DW. */
const SMALL_DATA = 16;

/** Where the variables are, for the debugger. Functions are known by their label for now. */
export interface GeneratedDebug {
	globals: DebugVariable[];
	functions: { name: string; label: string; locals: DebugVariable[] }[];
	/** Labels of the routines that come after the last function. */
	runtime: string[];
}

export interface Generated {
	asm: string;
	/** For each line of `asm` (index 0 is line 1), the C line it came from, or 0. */
	lineMap: number[];
	debug: GeneratedDebug;
}

export function generate(unit: Unit, source: string, warn: (line: number, message: string) => void): Generated {
	const main = unit.funcs.find((f) => f.name === 'main');
	if (!main || !main.body) throw new CompileError(0, 'There is no main function');
	if (main.type.params.length) throw new CompileError(main.line, 'main takes no parameters');

	const sourceLines = source.split('\n');
	const cg = new CodeGen();
	const out: string[] = [];
	const lineMap: number[] = [];
	const put = (text: string, line = 0) => {
		out.push(text);
		lineMap.push(line);
	};

	// --- lay out the data ------------------------------------------------------------------
	// Address 0 stays empty, so that no variable has the address a null pointer has.
	const inData = unit.globals.filter((v) => v.init || sizeOf(v.type, v.line) <= SMALL_DATA);
	const noData = unit.globals.filter((v) => !inData.includes(v));
	let addr = 1;
	for (const v of [...inData, ...noData]) {
		v.addr = addr;
		addr += sizeOf(v.type, v.line);
		cg.symbols.set(v, (inData.includes(v) ? '.' : '&') + v.label);
	}
	if (addr > RAM_SIZE)
		throw new CompileError(0, `The global variables take ${addr} words, but RAM has ${RAM_SIZE}`);
	if (addr > RAM_SIZE - 128)
		warn(0, `The global variables take ${addr} of the ${RAM_SIZE} words of RAM, which leaves little for the stack`);

	// --- code ----------------------------------------------------------------------------------
	const code: { f: Func; items: Item[] }[] = [];
	cg.queue.push(main);
	for (let i = 0; i < cg.queue.length; i++) {
		const f = cg.queue[i];
		code.push({ f, items: generateFunction(cg, f) });
	}

	put('; Generated by the ILF-16 C compiler.');
	put(`; Globals use RAM 0 - ${addr - 1}; the stack grows down from ${RAM_SIZE}.`);
	put('');
	put('DW 0');
	const describe = (v: Var) => {
		if (!v.name) return 'string';
		let t: Type = v.type;
		let dims = '';
		for (; t.kind === 'array'; t = t.of) dims += `[${t.len}]`;
		return `${typeName(t)} ${v.name}${dims}`;
	};
	for (const v of inData) {
		put(`${cg.symbols.get(v)}`.padEnd(24) + `; ${describe(v)}`);
		const size = sizeOf(v.type, v.line);
		const words: string[] = [];
		for (let i = 0; i < size; i++) {
			const entry = v.init ? v.init[i] : 0;
			if (typeof entry === 'number') words.push(String(entry));
			else if ('f' in entry) {
				cg.reference(entry.f, v.line);
				words.push('.' + entry.f.label);
			} else words.push(String((entry.v.addr + entry.offset) & 0xffff));
		}
		for (let i = 0; i < words.length; i += 16) put('DW ' + words.slice(i, i + 16).join(' '));
	}
	for (const v of noData) put(`@define ${cg.symbols.get(v)} ${v.addr}`.padEnd(24) + `; ${describe(v)}`);
	// Functions only used in initial values are generated last.
	for (let i = code.length; i < cg.queue.length; i++) {
		const f = cg.queue[i];
		code.push({ f, items: generateFunction(cg, f) });
	}

	for (const { f, items } of code) {
		put('');
		put(`; ${'-'.repeat(60)}`);
		put(`; ${f.name}`);
		put(`; ${'-'.repeat(60)}`);
		put('.' + f.label);
		let shown = 0;
		for (const item of items) {
			if (isLabel(item)) {
				put(item.label);
				continue;
			}
			if (item.line !== shown && item.line > 0) {
				shown = item.line;
				const text = (sourceLines[shown - 1] ?? '').trim().replace(/\s+/g, ' ');
				put(`    ; ${shown}: ${text.length > 90 ? text.slice(0, 87) + '...' : text}`);
			}
			const text = `    ${item.op.toUpperCase().padEnd(6)} ${item.args.join(' ')}`;
			put(item.note ? `${text.padEnd(32)}; ${item.note}` : text, item.line);
		}
	}
	if (cg.usesSdiv) for (const line of RUNTIME_SDIV.split('\n')) put(line);
	if (cg.usesUdiv || cg.usesSdiv) for (const line of RUNTIME_UDIV.split('\n')) put(line);

	const variable = (v: Var, addr: number): DebugVariable => ({
		name: v.name,
		type: v.type,
		text: declaration(v.type, v.name),
		reg: v.global ? -1 : v.reg,
		addr
	});
	const debug: GeneratedDebug = {
		// string literals have no name
		globals: unit.globals.filter((v) => v.name).map((v) => variable(v, v.addr)),
		functions: code.map(({ f }) => ({
			name: f.name,
			label: '.' + f.label,
			// a variable that is never used has no place at all
			locals: f.locals.filter((v) => v.reg >= 0 || v.addrTaken || v.weight > 0).map((v) => variable(v, v.stackOff))
		})),
		runtime: ['.__sdivmod', '.__udivmod']
	};
	return { asm: out.join('\n') + '\n', lineMap, debug };
}
