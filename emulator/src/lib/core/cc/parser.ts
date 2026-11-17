// Parser for the ILF-16 C compiler: tokens in, typed syntax tree out.

import { CompileError, type Token } from './lexer';
import {
	BUILTINS,
	CHAR,
	INT,
	UCHAR,
	UINT,
	VOID,
	isInt,
	isPtr,
	isScalar,
	isUnsigned,
	ptrTo,
	sizeOf,
	typeName,
	type Func,
	type FuncType,
	type InitEntry,
	type Node,
	type NodeKind,
	type Stmt,
	type StmtKind,
	type StructType,
	type Type,
	type Unit,
	type Var
} from './ast';

const TYPE_WORDS = new Set([
	'void',
	'char',
	'short',
	'int',
	'long',
	'signed',
	'unsigned',
	'float',
	'double',
	'struct',
	'union',
	'enum',
	'const',
	'volatile',
	'static',
	'extern',
	'register',
	'typedef',
	'inline',
	'auto',
	'_Bool'
]);
const KEYWORDS = new Set([
	...TYPE_WORDS,
	'if',
	'else',
	'while',
	'do',
	'for',
	'return',
	'break',
	'continue',
	'switch',
	'case',
	'default',
	'goto',
	'sizeof'
]);

type Sym =
	| { kind: 'var'; v: Var }
	| { kind: 'func'; f: Func }
	| { kind: 'typedef'; type: Type }
	| { kind: 'enum'; value: number };

const sext = (x: number) => (x & 0x8000 ? x - 0x10000 : x);

/** Value of `x op y` on 16-bit numbers, or null when it has none (division by zero). */
export function foldBin(op: string, x: number, y: number, uns: boolean): number | null {
	const sx = uns ? x : sext(x);
	const sy = uns ? y : sext(y);
	let r: number;
	switch (op) {
		case '+':
			r = x + y;
			break;
		case '-':
			r = x - y;
			break;
		case '*':
			r = Math.imul(x, y);
			break;
		case '&':
			r = x & y;
			break;
		case '|':
			r = x | y;
			break;
		case '^':
			r = x ^ y;
			break;
		case '<<':
			r = y >= 16 ? 0 : x << y;
			break;
		case '>>':
			r = uns ? (y >= 16 ? 0 : x >>> y) : sx >> Math.min(y, 15);
			break;
		case '/':
			if (y === 0) return null;
			r = uns ? Math.floor(x / y) : Math.trunc(sx / sy);
			break;
		case '%':
			if (y === 0) return null;
			r = uns ? x % y : sx % sy;
			break;
		default:
			return null;
	}
	return r & 0xffff;
}

export function foldCmp(op: string, x: number, y: number, uns: boolean): number {
	const a = uns ? x : sext(x);
	const b = uns ? y : sext(y);
	switch (op) {
		case '==':
			return +(a === b);
		case '!=':
			return +(a !== b);
		case '<':
			return +(a < b);
		case '<=':
			return +(a <= b);
		case '>':
			return +(a > b);
		default:
			return +(a >= b);
	}
}

const FLIP: Record<string, string> = { '<': '>', '>': '<', '<=': '>=', '>=': '<=', '==': '==', '!=': '!=' };
const INVERT: Record<string, string> = {
	'<': '>=',
	'>=': '<',
	'>': '<=',
	'<=': '>',
	'==': '!=',
	'!=': '=='
};

class Parser {
	private pos = 0;
	private tok: Token;
	/** Line of the token consumed last. */
	private line = 0;
	private scopes: Map<string, Sym>[] = [new Map()];
	private tags: Map<string, StructType>[] = [new Map()];
	private labels = new Set<string>();
	private strings = new Map<string, Var>();
	private fn: Func | null = null;
	private loopDepth = 0;
	private switches: Stmt[] = [];

	readonly funcs: Func[] = [];
	readonly globals: Var[] = [];

	constructor(
		private tokens: Token[],
		private warn: (line: number, message: string) => void
	) {
		this.tok = tokens[0];
	}

	// --- tokens ------------------------------------------------------------------------------

	private error(message: string, line = this.tok.line): never {
		throw new CompileError(line, message);
	}
	private next(): Token {
		const t = this.tok;
		this.line = t.line;
		if (t.kind !== 'eof') this.tok = this.tokens[++this.pos];
		return t;
	}
	private seek(pos: number): void {
		this.pos = pos;
		this.tok = this.tokens[pos];
	}
	private peek(n: number): Token {
		return this.tokens[Math.min(this.pos + n, this.tokens.length - 1)];
	}
	private is(text: string): boolean {
		return this.tok.kind === 'punct' && this.tok.text === text;
	}
	private isWord(text: string): boolean {
		return this.tok.kind === 'id' && this.tok.text === text;
	}
	private eat(text: string): boolean {
		if (!this.is(text)) return false;
		this.next();
		return true;
	}
	private eatWord(text: string): boolean {
		if (!this.isWord(text)) return false;
		this.next();
		return true;
	}
	private describe(): string {
		return this.tok.kind === 'eof' ? 'the end of the file' : `"${this.tok.text}"`;
	}
	private expect(text: string): void {
		if (!this.eat(text)) {
			// A missing ";" is best reported on the line it should have been on.
			const line = text === ';' && this.line ? this.line : this.tok.line;
			this.error(`Expected "${text}" but found ${this.describe()}`, line);
		}
	}
	private ident(what = 'a name'): string {
		if (this.tok.kind !== 'id' || KEYWORDS.has(this.tok.text))
			this.error(`Expected ${what} but found ${this.describe()}`);
		return this.next().text;
	}

	// --- scopes ------------------------------------------------------------------------------

	private push(): void {
		this.scopes.push(new Map());
		this.tags.push(new Map());
	}
	private pop(): void {
		this.scopes.pop();
		this.tags.pop();
	}
	private find(name: string): Sym | undefined {
		for (let i = this.scopes.length - 1; i >= 0; i--) {
			const sym = this.scopes[i].get(name);
			if (sym) return sym;
		}
		return undefined;
	}
	private define(name: string, sym: Sym, line: number): void {
		const scope = this.scopes[this.scopes.length - 1];
		if (scope.has(name)) this.error(`"${name}" is already declared`, line);
		scope.set(name, sym);
	}

	/** A name for the generated assembly that is not in use yet. The assembler ignores case. */
	private uniqueLabel(name: string): string {
		let base = name.toLowerCase();
		if (/^l\d+$/.test(base) || base.startsWith('__')) base += '_';
		let label = base;
		for (let n = 2; this.labels.has(label); n++) label = `${base}_${n}`;
		this.labels.add(label);
		return label;
	}

	// --- node helpers ------------------------------------------------------------------------

	private node(kind: NodeKind, type: Type, fields: Partial<Node> = {}): Node {
		return { kind, type, line: this.line, ...fields } as Node;
	}
	private stmt(kind: StmtKind, line: number, fields: Partial<Stmt> = {}): Stmt {
		return {
			kind,
			line,
			body: [],
			expr: null,
			init: null,
			step: null,
			then: null,
			otherwise: null,
			cases: [],
			value: 0,
			isDefault: false,
			name: '',
			asmLabel: '',
			...fields
		};
	}
	private num(value: number, type: Type = INT): Node {
		return this.node('num', type, { value: value & 0xffff });
	}
	private varNode(v: Var): Node {
		if (!v.global) v.weight += 10 ** Math.min(this.loopDepth, 4);
		return this.node('var', v.type, { v });
	}

	private newVar(name: string, type: Type, line: number, global: boolean): Var {
		return {
			name,
			type,
			line,
			global,
			label: '',
			addr: 0,
			init: null,
			param: -1,
			addrTaken: false,
			weight: 0,
			reg: -1,
			stackOff: 0
		};
	}
	private newLocal(name: string, type: Type, line: number): Var {
		if (type.kind === 'void') this.error(`Variable "${name}" cannot be void`, line);
		sizeOf(type, line);
		const v = this.newVar(name, type, line, false);
		if (!isScalar(type)) v.addrTaken = true;
		this.fn!.locals.push(v);
		this.define(name, { kind: 'var', v }, line);
		return v;
	}
	private newGlobal(name: string, type: Type, line: number, labelName = name): Var {
		const v = this.newVar(name, type, line, true);
		v.label = this.uniqueLabel(labelName);
		this.globals.push(v);
		return v;
	}
	private stringVar(chars: number[]): Var {
		const key = chars.join(',');
		let v = this.strings.get(key);
		if (!v) {
			v = this.newGlobal('', { kind: 'array', of: CHAR, len: chars.length + 1 }, this.line, 'str');
			v.init = [...chars, 0];
			this.strings.set(key, v);
		}
		return v;
	}

	/** Use a node for its value: arrays and functions turn into pointers. */
	private rv(n: Node): Node {
		const t = n.type;
		if (n.kind === 'builtin') this.error(`Built-in function ${n.name} can only be called`, n.line);
		if (t.kind === 'array') {
			const type = ptrTo(t.of);
			if (n.kind === 'var') {
				if (n.v.global) return this.node('gaddr', type, { v: n.v, value: 0, line: n.line });
				n.v.addrTaken = true;
				return this.node('laddr', type, { v: n.v, value: 0, line: n.line });
			}
			if (n.kind === 'deref') return { ...n.a, type };
			this.error('This array cannot be used here', n.line);
		}
		if (t.kind === 'struct')
			this.error('A struct cannot be used as a value: use its members, or a pointer to it', n.line);
		return n;
	}
	private scalar(n: Node, what: string): Node {
		n = this.rv(n);
		if (!isScalar(n.type)) this.error(`${what} must be a number or a pointer, not ${typeName(n.type)}`, n.line);
		return n;
	}
	private isLvalue(n: Node): boolean {
		return (n.kind === 'var' && n.type.kind !== 'array') || n.kind === 'deref';
	}
	private lvalue(n: Node, what: string): Node {
		if (!this.isLvalue(n)) this.error(`${what} needs something that can be assigned to`, n.line);
		if (!isScalar(n.type))
			this.error(`${what} does not work on a whole ${n.type.kind}: do it member by member`, n.line);
		return n;
	}
	private addrOf(n: Node): Node {
		const type = ptrTo(n.type);
		if (n.kind === 'var') {
			if (n.v.global) return this.node('gaddr', type, { v: n.v, value: 0, line: n.line });
			n.v.addrTaken = true;
			return this.node('laddr', type, { v: n.v, value: 0, line: n.line });
		}
		if (n.kind === 'deref') return { ...n.a, type };
		if (n.kind === 'faddr') return n;
		this.error('Cannot take the address of this', n.line);
	}

	// --- expressions: building -----------------------------------------------------------

	private common(a: Type, b: Type): Type {
		return isUnsigned(a) || isUnsigned(b) ? UINT : INT;
	}

	/** `a op b` where the result type is already decided. Folds constants. */
	private arith(op: string, a: Node, b: Node, type: Type, uns: boolean): Node {
		if (a.kind === 'num' && b.kind === 'num') {
			const value = foldBin(op, a.value, b.value, uns);
			if (value === null) this.error('Division by zero', b.line);
			return this.num(value, type);
		}
		const rank = (n: Node) => (n.kind === 'num' ? 2 : n.kind === 'gaddr' || n.kind === 'laddr' ? 1 : 0);
		if ('+*&|^'.includes(op) && rank(a) > rank(b)) [a, b] = [b, a];
		const isAddr = (n: Node) => n.kind === 'gaddr' || n.kind === 'laddr';
		const plusMinus = (n: Node) => n.kind === 'bin' && (n.op === '+' || n.op === '-') && n.b.kind === 'num';
		const signed = (o: string, n: Node) => (o === '+' ? sext(n.value) : -sext(n.value));
		if (b.kind === 'num') {
			const c = b.value;
			if (c === 0 && ['+', '-', '|', '^', '<<', '>>'].includes(op)) return this.retype(a, type);
			if (c === 1 && (op === '*' || op === '/')) return this.retype(a, type);
			if ((op === '/' || op === '%') && c === 0) this.error('Division by zero', b.line);
			if (op === '+' || op === '-') {
				// address + constant
				if (isAddr(a)) return { ...a, type, value: a.value + signed(op, b) };
				// (x + c1) + c2
				if (plusMinus(a))
					return this.arith('+', a.a, this.num(signed(a.op, a.b) + signed(op, b), b.type), type, uns);
			}
		}
		// (x + c) + address  ->  x + (address + c), so that a[i + 1] costs the same as a[i]
		if (op === '+' && isAddr(b) && plusMinus(a))
			return this.arith('+', a.a, { ...b, value: b.value + signed(a.op, a.b) }, type, uns);
		return this.node('bin', type, { op, a, b, uns });
	}
	private retype(n: Node, type: Type): Node {
		return this.node('cast', type, { a: n, line: n.line });
	}

	private ptrAdd(p: Node, i: Node, sign: 1 | -1): Node {
		if (!isPtr(p.type)) this.error('Internal error: not a pointer');
		if (!isInt(i.type)) this.error('Only a number can be added to a pointer', i.line);
		if (p.type.to.kind === 'func') this.error('Arithmetic on a function pointer', p.line);
		const size = sizeOf(p.type.to, p.line);
		const scaled = size === 1 ? i : this.arith('*', i, this.num(size), INT, false);
		return this.arith(sign > 0 ? '+' : '-', p, scaled, p.type, true);
	}

	private binary(op: string, a: Node, b: Node): Node {
		a = this.scalar(a, `The left side of ${op}`);
		b = this.scalar(b, `The right side of ${op}`);
		const ap = isPtr(a.type);
		const bp = isPtr(b.type);
		if (op === '+') {
			if (ap && bp) this.error('Two pointers cannot be added', a.line);
			if (bp) return this.ptrAdd(b, a, 1);
			if (ap) return this.ptrAdd(a, b, 1);
		} else if (op === '-') {
			if (ap && bp) {
				const size = sizeOf((a.type as { to: Type }).to, a.line);
				const diff = this.arith('-', a, b, INT, false);
				return size > 1 ? this.arith('/', diff, this.num(size), INT, false) : diff;
			}
			if (bp) this.error('A pointer cannot be subtracted from a number', b.line);
			if (ap) return this.ptrAdd(a, b, -1);
		} else if (ap || bp) this.error(`Operator ${op} needs numbers, not pointers`, a.line);
		if (op === '<<' || op === '>>') return this.arith(op, a, b, a.type, isUnsigned(a.type));
		const type = this.common(a.type, b.type);
		return this.arith(op, a, b, type, isUnsigned(type));
	}

	private compare(op: string, a: Node, b: Node): Node {
		a = this.scalar(a, `The left side of ${op}`);
		b = this.scalar(b, `The right side of ${op}`);
		const uns = isUnsigned(a.type) || isUnsigned(b.type);
		if (a.kind === 'num' && b.kind === 'num') return this.num(foldCmp(op, a.value, b.value, uns));
		if (a.kind === 'num') {
			[a, b] = [b, a];
			op = FLIP[op];
		}
		// Unsigned numbers are never below zero
		if (uns && b.kind === 'num' && b.value === 0) {
			if (op === '>') op = '!=';
			else if (op === '<=') op = '==';
		}
		return this.node('cmp', INT, { op, a, b, uns });
	}

	private lognot(a: Node): Node {
		a = this.scalar(a, 'The operand of !');
		if (a.kind === 'num') return this.num(+!a.value);
		if (a.kind === 'cmp') return { ...a, op: INVERT[a.op] };
		if (a.kind === 'lognot') {
			// !!x stays as it is: it turns x into 0 or 1
		}
		return this.node('lognot', INT, { a });
	}

	private assignNode(a: Node, b: Node): Node {
		a = this.lvalue(a, 'Assignment');
		b = this.scalar(b, 'The assigned value');
		return this.node('assign', a.type, { a, b });
	}

	private opAssign(op: string, a: Node, b: Node): Node {
		a = this.lvalue(a, `${op}=`);
		b = this.scalar(b, `The right side of ${op}=`);
		if (isPtr(b.type)) this.error(`The right side of ${op}= cannot be a pointer`, b.line);
		if (isPtr(a.type)) {
			if (op !== '+' && op !== '-') this.error(`${op}= does not work on a pointer`, a.line);
			const size = sizeOf(a.type.to, a.line);
			if (size !== 1) b = this.arith('*', b, this.num(size), INT, false);
		}
		const uns = op === '<<' || op === '>>' ? isUnsigned(a.type) : isUnsigned(a.type) || isUnsigned(b.type);
		if ((op === '/' || op === '%') && b.kind === 'num' && b.value === 0) this.error('Division by zero', b.line);
		return this.node('opassign', a.type, { op, a, b, uns });
	}

	private incDec(a: Node, delta: number, post: boolean): Node {
		a = this.lvalue(a, delta > 0 ? '++' : '--');
		const size = isPtr(a.type) ? sizeOf(a.type.to, a.line) : 1;
		return this.node('incdec', a.type, { a, value: delta * size, post });
	}

	private cast(type: Type, n: Node): Node {
		if (type.kind === 'void') return this.node('cast', type, { a: n });
		if (!isScalar(type)) this.error(`Cannot cast to ${typeName(type)}`);
		n = this.scalar(n, 'The value that is cast');
		if (n.kind === 'num') return this.num(n.value, type);
		return this.node('cast', type, { a: n });
	}

	private deref(a: Node): Node {
		a = this.rv(a);
		if (!isPtr(a.type)) this.error(`Only a pointer can be dereferenced, not ${typeName(a.type)}`, a.line);
		const to = a.type.to;
		if (to.kind === 'func') return a;
		if (to.kind === 'void') this.error('A void pointer cannot be dereferenced: cast it first', a.line);
		return this.node('deref', to, { a });
	}

	private member(base: Node, name: string): Node {
		const t = base.type;
		if (t.kind !== 'struct') this.error(`"${name}" is used on something that is not a struct`);
		if (!t.complete) this.error(`struct ${t.name} is not defined yet`);
		const m = t.members.find((m) => m.name === name);
		if (!m) this.error(`struct ${t.name} has no member "${name}"`);
		const addr = this.addrOf(base);
		return this.node('deref', m.type, { a: this.arith('+', addr, this.num(m.offset), ptrTo(m.type), true) });
	}

	private call(callee: Node, args: Node[]): Node {
		const check = (expected: number, name: string) => {
			if (args.length !== expected)
				this.error(`${name} takes ${expected} argument(s), ${args.length} given`);
		};
		if (callee.kind === 'builtin') {
			const b = BUILTINS[callee.name];
			check(b.params, callee.name);
			return this.node('call', b.ret, { name: callee.name, f: null, args });
		}
		if (callee.kind === 'faddr') {
			const f = callee.f!;
			check(f.type.params.length, f.name);
			return this.node('call', f.type.ret, { name: '', f, args });
		}
		const c = this.rv(callee);
		if (!isPtr(c.type) || c.type.to.kind !== 'func') this.error('This is not a function', callee.line);
		const ft = c.type.to as FuncType;
		check(ft.params.length, 'The function');
		return this.node('call', ft.ret, { name: '', f: null, a: c, args });
	}

	// --- expressions: parsing ------------------------------------------------------------

	private expr(): Node {
		let n = this.assign();
		while (this.eat(',')) {
			const b = this.assign();
			n = this.node('comma', b.type, { a: n, b });
		}
		return n;
	}

	private constExpr(): number {
		const n = this.conditional();
		if (n.kind !== 'num') this.error('A constant is needed here', n.line);
		return n.value;
	}

	private assign(): Node {
		const a = this.conditional();
		if (this.tok.kind !== 'punct') return a;
		const op = this.tok.text;
		if (op === '=') {
			this.next();
			return this.assignNode(a, this.assign());
		}
		if (['+=', '-=', '*=', '/=', '%=', '&=', '|=', '^=', '<<=', '>>='].includes(op)) {
			this.next();
			return this.opAssign(op.slice(0, -1), a, this.assign());
		}
		return a;
	}

	private conditional(): Node {
		const c = this.logOr();
		if (!this.eat('?')) return c;
		const cond = this.scalar(c, 'The condition');
		let a = this.expr();
		this.expect(':');
		let b = this.conditional();
		let type: Type;
		if (a.type.kind === 'void' || b.type.kind === 'void') type = VOID;
		else {
			a = this.scalar(a, 'The value');
			b = this.scalar(b, 'The value');
			type = isPtr(a.type) ? a.type : isPtr(b.type) ? b.type : this.common(a.type, b.type);
		}
		if (cond.kind === 'num') return this.retype(cond.value ? a : b, type);
		return this.node('cond', type, { a: cond, b: a, c: b });
	}

	private logOr(): Node {
		let a = this.logAnd();
		while (this.eat('||')) {
			a = this.scalar(a, 'The left side of ||');
			const b = this.scalar(this.logAnd(), 'The right side of ||');
			a = a.kind === 'num' && b.kind === 'num' ? this.num(+!!(a.value || b.value)) : this.node('logor', INT, { a, b });
		}
		return a;
	}
	private logAnd(): Node {
		let a = this.bitOr();
		while (this.eat('&&')) {
			a = this.scalar(a, 'The left side of &&');
			const b = this.scalar(this.bitOr(), 'The right side of &&');
			a = a.kind === 'num' && b.kind === 'num' ? this.num(+!!(a.value && b.value)) : this.node('logand', INT, { a, b });
		}
		return a;
	}
	private bitOr(): Node {
		let a = this.bitXor();
		while (this.eat('|')) a = this.binary('|', a, this.bitXor());
		return a;
	}
	private bitXor(): Node {
		let a = this.bitAnd();
		while (this.eat('^')) a = this.binary('^', a, this.bitAnd());
		return a;
	}
	private bitAnd(): Node {
		let a = this.equality();
		while (this.eat('&')) a = this.binary('&', a, this.equality());
		return a;
	}
	private equality(): Node {
		let a = this.relational();
		for (;;) {
			if (this.eat('==')) a = this.compare('==', a, this.relational());
			else if (this.eat('!=')) a = this.compare('!=', a, this.relational());
			else return a;
		}
	}
	private relational(): Node {
		let a = this.shift();
		for (;;) {
			const op = this.tok.kind === 'punct' ? this.tok.text : '';
			if (op !== '<' && op !== '<=' && op !== '>' && op !== '>=') return a;
			this.next();
			a = this.compare(op, a, this.shift());
		}
	}
	private shift(): Node {
		let a = this.additive();
		for (;;) {
			if (this.eat('<<')) a = this.binary('<<', a, this.additive());
			else if (this.eat('>>')) a = this.binary('>>', a, this.additive());
			else return a;
		}
	}
	private additive(): Node {
		let a = this.multiplicative();
		for (;;) {
			if (this.eat('+')) a = this.binary('+', a, this.multiplicative());
			else if (this.eat('-')) a = this.binary('-', a, this.multiplicative());
			else return a;
		}
	}
	private multiplicative(): Node {
		let a = this.castExpr();
		for (;;) {
			if (this.eat('*')) a = this.binary('*', a, this.castExpr());
			else if (this.eat('/')) a = this.binary('/', a, this.castExpr());
			else if (this.eat('%')) a = this.binary('%', a, this.castExpr());
			else return a;
		}
	}

	private isTypeStart(t: Token): boolean {
		return t.kind === 'id' && (TYPE_WORDS.has(t.text) || this.find(t.text)?.kind === 'typedef');
	}

	private castExpr(): Node {
		if (this.is('(') && this.isTypeStart(this.peek(1))) {
			this.next();
			const type = this.typeName();
			this.expect(')');
			return this.cast(type, this.castExpr());
		}
		return this.unary();
	}

	private unary(): Node {
		if (this.eat('+')) return this.scalar(this.castExpr(), 'The operand of +');
		if (this.eat('-')) {
			const a = this.scalar(this.castExpr(), 'The operand of -');
			if (!isInt(a.type)) this.error('A pointer cannot be negated', a.line);
			if (a.kind === 'num') return this.num(-a.value, a.type);
			return this.node('neg', a.type, { a });
		}
		if (this.eat('~')) {
			const a = this.scalar(this.castExpr(), 'The operand of ~');
			if (!isInt(a.type)) this.error('~ needs a number', a.line);
			if (a.kind === 'num') return this.num(~a.value, a.type);
			return this.node('bitnot', a.type, { a });
		}
		if (this.eat('!')) return this.lognot(this.castExpr());
		if (this.eat('*')) return this.deref(this.castExpr());
		if (this.eat('&')) {
			const a = this.castExpr();
			if (!this.isLvalue(a) && a.kind !== 'faddr' && !(a.kind === 'var' && a.type.kind === 'array'))
				this.error('& needs a variable', a.line);
			return this.addrOf(a);
		}
		if (this.eat('++')) return this.incDec(this.unary(), 1, false);
		if (this.eat('--')) return this.incDec(this.unary(), -1, false);
		if (this.eatWord('sizeof')) {
			let type: Type;
			if (this.is('(') && this.isTypeStart(this.peek(1))) {
				this.next();
				type = this.typeName();
				this.expect(')');
			} else type = this.unary().type;
			return this.num(sizeOf(type, this.line));
		}
		return this.postfix();
	}

	private postfix(): Node {
		let n = this.primary();
		for (;;) {
			if (this.eat('[')) {
				const index = this.expr();
				this.expect(']');
				n = this.deref(this.binary('+', n, index));
			} else if (this.eat('(')) {
				const args: Node[] = [];
				if (!this.is(')')) {
					do args.push(this.scalar(this.assign(), 'An argument'));
					while (this.eat(','));
				}
				this.expect(')');
				n = this.call(n, args);
			} else if (this.eat('.')) {
				n = this.member(n, this.ident('a member name'));
			} else if (this.eat('->')) {
				const p = this.rv(n);
				if (!isPtr(p.type)) this.error('-> needs a pointer to a struct', p.line);
				n = this.member(this.node('deref', p.type.to, { a: p }), this.ident('a member name'));
			} else if (this.eat('++')) n = this.incDec(n, 1, true);
			else if (this.eat('--')) n = this.incDec(n, -1, true);
			else return n;
		}
	}

	private primary(): Node {
		const t = this.tok;
		if (this.eat('(')) {
			const n = this.expr();
			this.expect(')');
			return n;
		}
		if (t.kind === 'num') {
			this.next();
			return this.num(t.value, t.unsigned ? UINT : INT);
		}
		if (t.kind === 'str') {
			const chars: number[] = [];
			while (this.tok.kind === 'str') chars.push(...this.next().chars);
			return this.node('var', { kind: 'array', of: CHAR, len: chars.length + 1 }, { v: this.stringVar(chars) });
		}
		if (t.kind === 'id' && !KEYWORDS.has(t.text)) {
			this.next();
			const sym = this.find(t.text);
			if (!sym) {
				if (t.text in BUILTINS) return this.node('builtin', VOID, { name: t.text });
				if (this.is('('))
					this.error(
						`Function "${t.text}" is not declared yet: define it earlier in the file, or add a prototype`,
						t.line
					);
				this.error(`"${t.text}" is not declared`, t.line);
			}
			if (sym.kind === 'var') return this.varNode(sym.v);
			if (sym.kind === 'func') return this.node('faddr', ptrTo(sym.f.type), { f: sym.f });
			if (sym.kind === 'enum') return this.num(sym.value);
			this.error(`"${t.text}" is a type, not a value`, t.line);
		}
		this.error(`Expected an expression but found ${this.describe()}`);
	}

	// --- types and declarators -----------------------------------------------------------

	private declSpec(): { type: Type; typedef: boolean; isStatic: boolean } {
		let typedef = false;
		let isStatic = false;
		let base: Type | null = null;
		let unsigned = false;
		let sawInt = false;
		let sawChar = false;
		let sawSign = false;
		let any = false;
		for (;;) {
			const t = this.tok;
			if (t.kind !== 'id') break;
			const w = t.text;
			if (w === 'typedef') typedef = true;
			else if (w === 'static') isStatic = true;
			else if (['const', 'volatile', 'extern', 'register', 'inline', 'auto'].includes(w)) {
				// accepted and ignored
			} else if (w === 'void') base = VOID;
			else if (w === 'char' || w === 'short' || w === 'int' || w === '_Bool') {
				sawInt = true;
				if (w === 'char') sawChar = true;
			}
			else if (w === 'signed' || w === 'unsigned') {
				sawSign = true;
				unsigned = w === 'unsigned';
			} else if (w === 'long') this.error('long is not supported: every number is 16 bits (use mulhi() for wide products)');
			else if (w === 'float' || w === 'double') this.error('There is no floating point: use fixed point numbers');
			else if (w === 'union') this.error('union is not supported');
			else if (w === 'struct') {
				this.next();
				base = this.structSpec();
				any = true;
				continue;
			} else if (w === 'enum') {
				this.next();
				this.enumSpec();
				sawInt = true;
				any = true;
				continue;
			} else {
				const sym: Sym | undefined = !base && !sawInt && !sawSign ? this.find(w) : undefined;
				if (sym?.kind !== 'typedef') break;
				base = sym.type;
			}
			any = true;
			this.next();
		}
		if (!any) this.error(`Expected a type but found ${this.describe()}`);
		if (base && (sawInt || sawSign)) this.error('These type names cannot be combined');
		const plain = sawChar ? (unsigned ? UCHAR : CHAR) : unsigned ? UINT : INT;
		return { type: base ?? plain, typedef, isStatic };
	}

	private structSpec(): StructType {
		const line = this.tok.line;
		const tag = this.tok.kind === 'id' && !KEYWORDS.has(this.tok.text) ? this.next().text : '';
		const scope = this.tags[this.tags.length - 1];
		if (!this.eat('{')) {
			if (!tag) this.error('Expected a struct name or "{"');
			for (let i = this.tags.length - 1; i >= 0; i--) {
				const found = this.tags[i].get(tag);
				if (found) return found;
			}
			const st: StructType = { kind: 'struct', name: tag, members: [], size: 0, complete: false };
			scope.set(tag, st);
			return st;
		}
		let st = tag ? scope.get(tag) : undefined;
		if (st?.complete) this.error(`struct ${tag} is already defined`, line);
		if (!st) {
			st = { kind: 'struct', name: tag || '(unnamed)', members: [], size: 0, complete: false };
			if (tag) scope.set(tag, st);
		}
		let offset = 0;
		while (!this.eat('}')) {
			const spec = this.declSpec();
			do {
				const d = this.declarator(spec.type);
				if (!d.name) this.error('Expected a member name');
				if (d.type.kind === 'func' || d.type.kind === 'void') this.error(`Member "${d.name}" has an invalid type`, d.line);
				if (st.members.some((m) => m.name === d.name)) this.error(`Member "${d.name}" is declared twice`, d.line);
				st.members.push({ name: d.name, type: d.type, offset });
				offset += sizeOf(d.type, d.line);
			} while (this.eat(','));
			this.expect(';');
		}
		st.size = offset;
		st.complete = true;
		return st;
	}

	private enumSpec(): void {
		if (this.tok.kind === 'id' && !KEYWORDS.has(this.tok.text)) this.next();
		if (!this.eat('{')) return;
		let value = 0;
		while (!this.is('}')) {
			const line = this.tok.line;
			const name = this.ident();
			if (this.eat('=')) value = sext(this.constExpr());
			this.define(name, { kind: 'enum', value: value & 0xffff }, line);
			value++;
			if (!this.eat(',')) break;
		}
		this.expect('}');
	}

	private declarator(base: Type): { type: Type; name: string; line: number } {
		while (this.eat('*')) {
			base = ptrTo(base);
			while (this.isWord('const') || this.isWord('volatile')) this.next();
		}
		if (this.eat('(')) {
			// A declarator in parentheses, as in int (*f)(int): what follows the ")" applies first.
			const start = this.pos;
			this.declarator(INT);
			this.expect(')');
			base = this.typeSuffix(base);
			const end = this.pos;
			this.seek(start);
			const d = this.declarator(base);
			this.seek(end);
			return d;
		}
		const line = this.tok.line;
		let name = '';
		if (this.tok.kind === 'id' && !KEYWORDS.has(this.tok.text)) name = this.next().text;
		return { type: this.typeSuffix(base), name, line };
	}

	private typeSuffix(t: Type): Type {
		if (this.eat('(')) {
			if (t.kind === 'array' || t.kind === 'func' || t.kind === 'struct')
				this.error('A function can only return a number, a pointer or nothing');
			return { kind: 'func', ret: t, params: this.paramList() };
		}
		if (this.eat('[')) {
			let len = -1;
			if (!this.is(']')) {
				len = this.constExpr();
				if (len === 0) this.error('An array needs at least one element');
			}
			this.expect(']');
			const of = this.typeSuffix(t);
			if (of.kind === 'void' || of.kind === 'func') this.error('Invalid array element type');
			return { kind: 'array', of, len };
		}
		return t;
	}

	private paramList(): { name: string; type: Type }[] {
		const params: { name: string; type: Type }[] = [];
		if (this.isWord('void') && this.peek(1).kind === 'punct' && this.peek(1).text === ')') {
			this.next();
			this.next();
			return params;
		}
		if (this.eat(')')) return params;
		do {
			if (this.is('...')) this.error('Functions with a variable number of arguments are not supported');
			const spec = this.declSpec();
			const d = this.declarator(spec.type);
			let type = d.type;
			if (type.kind === 'array') type = ptrTo(type.of);
			else if (type.kind === 'func') type = ptrTo(type);
			else if (type.kind === 'struct')
				this.error('A struct cannot be passed to a function: pass a pointer to it', d.line);
			else if (type.kind === 'void') this.error('A parameter cannot be void', d.line);
			params.push({ name: d.name, type });
		} while (this.eat(','));
		this.expect(')');
		return params;
	}

	private typeName(): Type {
		const spec = this.declSpec();
		const d = this.declarator(spec.type);
		if (d.name) this.error('Expected a type, without a name', d.line);
		return d.type;
	}

	// --- initialisers ------------------------------------------------------------------------

	/**
	 * Parse an initialiser for `type` placed `off` words into its variable, reporting each value
	 * to `sink`. Returns the type, with the length filled in for an array declared without one.
	 */
	private initializer(type: Type, off: number, sink: (off: number, type: Type, n: Node) => void): Type {
		const moreInList = (i: number, count: number) => {
			if (i + 1 >= count || !this.is(',')) return false;
			const after = this.peek(1);
			if (after.kind === 'punct' && after.text === '}') return false;
			this.next();
			return true;
		};
		if (type.kind === 'array') {
			const size = sizeOf(type.of, this.tok.line);
			const braceStr = this.is('{') && this.peek(1).kind === 'str';
			if (type.of.kind === 'int' && (this.tok.kind === 'str' || braceStr)) {
				if (braceStr) this.next();
				const chars: number[] = [];
				while (this.tok.kind === 'str') chars.push(...this.next().chars);
				if (braceStr) {
					this.eat(',');
					this.expect('}');
				}
				const len = type.len < 0 ? chars.length + 1 : type.len;
				if (chars.length > len) this.error('The string is longer than the array');
				chars.forEach((c, i) => sink(off + i, type.of, this.num(c)));
				return { kind: 'array', of: type.of, len };
			}
			if (this.eat('{')) {
				let i = 0;
				while (!this.is('}')) {
					if (type.len >= 0 && i >= type.len) this.error('More values than the array has elements');
					this.initializer(type.of, off + i * size, sink);
					i++;
					if (!this.eat(',')) break;
				}
				this.expect('}');
				return type.len < 0 ? { kind: 'array', of: type.of, len: Math.max(i, 1) } : type;
			}
			if (type.len < 0) this.error('Expected "{"');
			for (let i = 0; i < type.len; i++) {
				this.initializer(type.of, off + i * size, sink);
				if (!moreInList(i, type.len)) break;
			}
			return type;
		}
		if (type.kind === 'struct') {
			if (!type.complete) this.error(`struct ${type.name} is not defined yet`);
			const braces = this.eat('{');
			for (let i = 0; i < type.members.length; i++) {
				if (braces && this.is('}')) break;
				const m = type.members[i];
				this.initializer(m.type, off + m.offset, sink);
				if (braces) {
					if (!this.eat(',')) break;
				} else if (!moreInList(i, type.members.length)) break;
			}
			if (braces) this.expect('}');
			return type;
		}
		const braces = this.eat('{');
		const n = this.scalar(this.assign(), 'An initial value');
		if (braces) {
			this.eat(',');
			this.expect('}');
		}
		sink(off, type, n);
		return type;
	}

	private constEntry(n: Node): InitEntry {
		while (n.kind === 'cast') n = n.a;
		if (n.kind === 'num') return n.value;
		if (n.kind === 'gaddr') return { v: n.v, offset: n.value };
		if (n.kind === 'faddr') return { f: n.f! };
		this.error('The initial value of a global must be a constant', n.line);
	}

	// --- declarations --------------------------------------------------------------------

	private declareFunc(d: { type: Type; name: string; line: number }): Func {
		const type = d.type as FuncType;
		const sym = this.find(d.name);
		if (sym && sym.kind === 'func') {
			if (sym.f.type.params.length !== type.params.length)
				this.error(`${d.name} was declared with a different number of parameters`, d.line);
			return sym.f;
		}
		const f: Func = {
			name: d.name,
			label: this.uniqueLabel(d.name),
			type,
			line: d.line,
			params: [],
			locals: [],
			body: null
		};
		this.scopes[0].set(d.name, { kind: 'func', f });
		if (sym) this.error(`"${d.name}" is already declared`, d.line);
		this.funcs.push(f);
		return f;
	}

	private globalDecl(d: { type: Type; name: string; line: number }, labelName: string): void {
		let type = d.type;
		if (type.kind === 'void') this.error(`Variable "${d.name}" cannot be void`, d.line);
		let init: InitEntry[] | null = null;
		if (this.eat('=')) {
			init = [];
			type = this.initializer(type, 0, (off, _t, n) => (init![off] = this.constEntry(n)));
			const size = sizeOf(type, d.line);
			for (let i = 0; i < size; i++) init[i] ??= 0;
		}
		sizeOf(type, d.line);
		const v = this.newGlobal(d.name, type, d.line, labelName);
		v.init = init;
		this.define(d.name, { kind: 'var', v }, d.line);
	}

	private functionBody(f: Func, d: { type: Type; line: number }): void {
		if (f.body) this.error(`Function ${f.name} is already defined`, d.line);
		f.type = d.type as FuncType;
		f.line = d.line;
		this.fn = f;
		this.push();
		f.type.params.forEach((p, i) => {
			if (!p.name) this.error(`Parameter ${i + 1} of ${f.name} has no name`, d.line);
			const v = this.newLocal(p.name, p.type, d.line);
			v.param = i;
			f.params.push(v);
		});
		this.expect('{');
		f.body = this.block(false);
		this.pop();
		this.fn = null;
	}

	parseUnit(): Unit {
		while (this.tok.kind !== 'eof') {
			if (this.eat(';')) continue;
			const spec = this.declSpec();
			if (this.eat(';')) continue;
			for (let first = true; ; first = false) {
				const d = this.declarator(spec.type);
				if (!d.name) this.error(`Expected a name but found ${this.describe()}`);
				if (spec.typedef) this.define(d.name, { kind: 'typedef', type: d.type }, d.line);
				else if (d.type.kind === 'func') {
					const f = this.declareFunc(d);
					if (first && this.is('{')) {
						this.functionBody(f, d);
						break;
					}
				} else this.globalDecl(d, d.name);
				if (this.eat(',')) continue;
				this.expect(';');
				break;
			}
		}
		return { funcs: this.funcs, globals: this.globals };
	}

	private localDecl(body: Stmt[]): void {
		const spec = this.declSpec();
		if (this.eat(';')) return;
		do {
			const d = this.declarator(spec.type);
			if (!d.name) this.error(`Expected a name but found ${this.describe()}`);
			if (spec.typedef) {
				this.define(d.name, { kind: 'typedef', type: d.type }, d.line);
				continue;
			}
			if (d.type.kind === 'func') {
				this.declareFunc(d);
				continue;
			}
			if (spec.isStatic) {
				this.globalDecl(d, `${this.fn!.name}_${d.name}`);
				continue;
			}
			if (!this.eat('=')) {
				this.newLocal(d.name, d.type, d.line);
				continue;
			}
			const exprStmt = (n: Node) => body.push(this.stmt('expr', d.line, { expr: n }));
			if (isScalar(d.type)) {
				const value = this.assign();
				const v = this.newLocal(d.name, d.type, d.line);
				exprStmt(this.assignNode(this.varNode(v), value));
				continue;
			}
			const items: { off: number; type: Type; n: Node }[] = [];
			const type = this.initializer(d.type, 0, (off, t, n) => items.push({ off, type: t, n }));
			const v = this.newLocal(d.name, type, d.line);
			const size = sizeOf(type, d.line);
			const given = new Set(items.map((it) => it.off));
			for (let off = 0; off < size; off++) if (!given.has(off)) items.push({ off, type: INT, n: this.num(0) });
			for (const it of items) {
				const addr = this.node('laddr', ptrTo(it.type), { v, value: it.off });
				exprStmt(this.assignNode(this.node('deref', it.type, { a: addr }), it.n));
			}
		} while (this.eat(','));
		this.expect(';');
	}

	// --- statements --------------------------------------------------------------------------

	private block(scope = true): Stmt {
		const line = this.line;
		if (scope) this.push();
		const body: Stmt[] = [];
		while (!this.eat('}')) {
			if (this.tok.kind === 'eof') this.error('Missing "}"');
			const label = this.peek(1).kind === 'punct' && this.peek(1).text === ':';
			if (this.isTypeStart(this.tok) && !label) this.localDecl(body);
			else body.push(this.statement());
		}
		if (scope) this.pop();
		return this.stmt('block', line, { body });
	}

	private condition(): Node {
		this.expect('(');
		const n = this.scalar(this.expr(), 'A condition');
		this.expect(')');
		return n;
	}

	private statement(): Stmt {
		const line = this.tok.line;
		if (this.eat('{')) return this.block();
		if (this.eat(';')) return this.stmt('empty', line);
		if (this.tok.kind === 'id') {
			const word = this.tok.text;
			if (word === 'if') {
				this.next();
				const expr = this.condition();
				const then = this.statement();
				const otherwise = this.eatWord('else') ? this.statement() : null;
				return this.stmt('if', line, { expr, then, otherwise });
			}
			if (word === 'while') {
				this.next();
				this.loopDepth++;
				const expr = this.condition();
				const then = this.statement();
				this.loopDepth--;
				return this.stmt('while', line, { expr, then });
			}
			if (word === 'do') {
				this.next();
				this.loopDepth++;
				const then = this.statement();
				if (!this.eatWord('while')) this.error('Expected "while" after the body of do');
				const expr = this.condition();
				this.loopDepth--;
				this.expect(';');
				return this.stmt('do', line, { expr, then });
			}
			if (word === 'for') {
				this.next();
				this.expect('(');
				this.push();
				let init: Stmt | null = null;
				if (this.isTypeStart(this.tok)) {
					const body: Stmt[] = [];
					this.localDecl(body);
					init = this.stmt('block', line, { body });
				} else if (!this.eat(';')) {
					init = this.stmt('expr', line, { expr: this.expr() });
					this.expect(';');
				}
				this.loopDepth++;
				const expr = this.is(';') ? null : this.scalar(this.expr(), 'A condition');
				this.expect(';');
				const step = this.is(')') ? null : this.expr();
				this.expect(')');
				const then = this.statement();
				this.loopDepth--;
				this.pop();
				return this.stmt('for', line, { init, expr, step, then });
			}
			if (word === 'return') {
				this.next();
				const ret = this.fn!.type.ret;
				let expr: Node | null = null;
				if (!this.is(';')) {
					expr = this.scalar(this.expr(), 'The returned value');
					if (ret.kind === 'void') this.error(`${this.fn!.name} returns nothing, so return cannot have a value`, line);
				} else if (ret.kind !== 'void' && this.fn!.name !== 'main')
					this.error(`${this.fn!.name} must return a value`, line);
				this.expect(';');
				return this.stmt('return', line, { expr });
			}
			if (word === 'break' || word === 'continue') {
				this.next();
				this.expect(';');
				return this.stmt(word, line);
			}
			if (word === 'switch') {
				this.next();
				const expr = this.condition();
				const s = this.stmt('switch', line, { expr });
				this.switches.push(s);
				s.then = this.statement();
				this.switches.pop();
				return s;
			}
			if (word === 'case' || word === 'default') {
				this.next();
				const sw = this.switches[this.switches.length - 1];
				if (!sw) this.error(`${word} outside a switch`, line);
				const s = this.stmt('case', line, { isDefault: word === 'default' });
				if (!s.isDefault) {
					s.value = this.constExpr();
					if (sw.cases.some((c) => !c.isDefault && c.value === s.value)) this.error('This case is already there', line);
				} else if (sw.cases.some((c) => c.isDefault)) this.error('This switch already has a default', line);
				this.expect(':');
				sw.cases.push(s);
				return s;
			}
			if (word === 'goto') {
				this.next();
				const name = this.ident('a label');
				this.expect(';');
				return this.stmt('goto', line, { name });
			}
			if (word === 'else') this.error('else without a matching if');
			const after = this.peek(1);
			if (!KEYWORDS.has(word) && after.kind === 'punct' && after.text === ':') {
				this.next();
				this.next();
				return this.stmt('label', line, { name: word });
			}
		}
		const expr = this.expr();
		this.expect(';');
		if (['cmp', 'bin', 'num', 'var', 'neg', 'bitnot', 'lognot'].includes(expr.kind))
			this.warn(line, 'This statement does nothing');
		return this.stmt('expr', line, { expr });
	}
}

export function parse(tokens: Token[], warn: (line: number, message: string) => void): Unit {
	return new Parser(tokens, warn).parseUnit();
}
