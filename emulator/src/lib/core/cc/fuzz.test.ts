// Random expressions, compiled and run, checked against the same expression worked out here.

import { describe, expect, it } from 'vitest';
import { Cpu } from '../cpu';
import { buildC } from './index';

/** Small deterministic random number generator, so that failures can be reproduced. */
function rng(seed: number) {
	let s = seed >>> 0;
	return (n: number) => {
		s = (Math.imul(s, 1664525) + 1013904223) >>> 0;
		return Math.floor((s / 0x100000000) * n);
	};
}

interface Value {
	text: string;
	value: number;
	uns: boolean;
}

const sext = (x: number) => (x & 0x8000 ? x - 0x10000 : x);
const u16 = (x: number) => x & 0xffff;

const VARS: Value[] = [
	{ text: 'a', value: 1234, uns: false },
	{ text: 'b', value: u16(-77), uns: false },
	{ text: 'c', value: 40000, uns: true },
	{ text: 'd', value: 9, uns: true },
	{ text: 'ga', value: u16(-20000), uns: false },
	{ text: 'gu', value: 513, uns: true },
	{ text: 'e', value: 3, uns: false },
	{ text: 'f', value: u16(-1), uns: false }
];
const ARR = [5, u16(-3), 100, 32767, u16(-32768), 0, 1, 2];
const CONSTS = [0, 1, 2, 3, 7, 8, 15, 16, 100, 255, 256, 1000, 4095, 4096, 5000, 32767, 32768, 40000, 65535];
const DIVISORS = [1, 2, 3, 4, 7, 8, 10, 16, 100, 255, 256, 1000, 4096, 16384];

function make(rand: (n: number) => number, depth: number, calls: boolean): Value {
	const sub = () => make(rand, depth - 1, calls);
	const kind = depth <= 0 ? rand(3) : 3 + rand(calls ? 14 : 13);
	switch (kind) {
		case 0: {
			const value = CONSTS[rand(CONSTS.length)];
			return { text: String(value), value, uns: value > 32767 };
		}
		case 1:
			return VARS[rand(VARS.length)];
		case 2: {
			if (rand(2)) {
				const i = rand(8);
				return { text: `arr[${i}]`, value: ARR[i], uns: false };
			}
			const index = make(rand, 0, calls);
			return { text: `arr[${index.text} & 7]`, value: ARR[index.value & 7], uns: false };
		}
		case 3: {
			const x = sub();
			const op = '-~!'[rand(3)];
			if (op === '!') return { text: `!(${x.text})`, value: +!x.value, uns: false };
			return { text: `${op}(${x.text})`, value: u16(op === '-' ? -x.value : ~x.value), uns: x.uns };
		}
		case 4:
		case 5:
		case 6: {
			const x = sub();
			const y = sub();
			const op = '+-*&|^'[rand(6)];
			let value: number;
			if (op === '+') value = x.value + y.value;
			else if (op === '-') value = x.value - y.value;
			else if (op === '*') value = Math.imul(x.value, y.value);
			else if (op === '&') value = x.value & y.value;
			else if (op === '|') value = x.value | y.value;
			else value = x.value ^ y.value;
			return { text: `(${x.text} ${op} ${y.text})`, value: u16(value), uns: x.uns || y.uns };
		}
		case 7: {
			const x = sub();
			const left = rand(2) === 0;
			let n: number;
			let amount: string;
			if (rand(3)) {
				n = rand(16);
				amount = String(n);
			} else {
				const y = sub();
				n = y.value & 15;
				amount = `(${y.text} & 15)`;
			}
			let value: number;
			if (left) value = x.value << n;
			else value = x.uns ? x.value >>> n : sext(x.value) >> n;
			return { text: `(${x.text} ${left ? '<<' : '>>'} ${amount})`, value: u16(value), uns: x.uns };
		}
		case 8: {
			const x = sub();
			let y: Value;
			if (rand(3)) {
				const c = DIVISORS[rand(DIVISORS.length)];
				y = { text: String(c), value: c, uns: false };
			} else {
				const inner = sub();
				y = { text: `((${inner.text} & 127) + 1)`, value: (inner.value & 127) + 1, uns: inner.uns };
			}
			const uns = x.uns || y.uns;
			const mod = rand(2) === 0;
			const p = uns ? x.value : sext(x.value);
			const q = uns ? y.value : sext(y.value);
			const value = mod ? p % q : Math.trunc(p / q);
			return { text: `(${x.text} ${mod ? '%' : '/'} ${y.text})`, value: u16(value), uns };
		}
		case 9:
		case 10: {
			const x = sub();
			const y = rand(4) ? sub() : { text: '0', value: 0, uns: false };
			const op = ['<', '<=', '>', '>=', '==', '!='][rand(6)];
			const uns = x.uns || y.uns;
			const p = uns ? x.value : sext(x.value);
			const q = uns ? y.value : sext(y.value);
			const value = op === '<' ? p < q : op === '<=' ? p <= q : op === '>' ? p > q : op === '>=' ? p >= q : op === '==' ? p === q : p !== q;
			return { text: `(${x.text} ${op} ${y.text})`, value: +value, uns: false };
		}
		case 11: {
			const x = sub();
			const y = sub();
			const and = rand(2) === 0;
			return {
				text: `(${x.text} ${and ? '&&' : '||'} ${y.text})`,
				value: +(and ? !!x.value && !!y.value : !!x.value || !!y.value),
				uns: false
			};
		}
		case 12: {
			const c = sub();
			const x = sub();
			const y = sub();
			return { text: `(${c.text} ? ${x.text} : ${y.text})`, value: c.value ? x.value : y.value, uns: x.uns || y.uns };
		}
		case 13:
		case 14: {
			const x = sub();
			if (!calls) return x;
			if (rand(3) === 0) {
				const y = sub();
				if (rand(2)) return { text: `sum(${x.text}, ${y.text})`, value: u16(x.value + y.value), uns: false };
				const z = sub();
				const w = sub();
				return {
					text: `mix(${x.text}, ${y.text}, ${z.text}, ${w.text}, ${y.text})`,
					value: u16(x.value - 2 * y.value + 3 * z.value - 4 * w.value + 5 * y.value),
					uns: true
				};
			}
			return rand(2) ? { text: `id(${x.text})`, value: x.value, uns: false } : { text: `idu(${x.text})`, value: x.value, uns: true };
		}
	}
	return VARS[0];
}

/** A statement that changes a variable, and the value the variable has afterwards. */
function mutate(rand: (n: number) => number, calls: boolean): { text: string; check: string; value: number } {
	// a variable, or an element of the array
	let target: Value;
	let store: (value: number) => void;
	if (rand(4)) {
		const v = VARS[rand(VARS.length)];
		target = v;
		store = (value) => (v.value = value);
	} else {
		const i = rand(8);
		const index = rand(2) ? String(i) : `(${VARS[3].text} + ${u16(i - VARS[3].value)}) & 7`;
		const viaPointer = rand(3) === 0;
		target = { text: viaPointer ? `(*(arr + ${i}))` : `arr[${index}]`, value: ARR[i], uns: false };
		store = (value) => (ARR[i] = value);
	}
	const kind = rand(12);
	if (kind < 2) {
		// ++ and --, before or after
		const up = rand(2) === 0;
		const post = rand(2) === 0;
		const before = target.value;
		const after = u16(before + (up ? 1 : -1));
		store(after);
		const op = up ? '++' : '--';
		const text = post ? `${target.text}${op}` : `${op}${target.text}`;
		// used as a value half of the time
		if (rand(2) && target !== VARS[5]) return { text: `gu = ${text};`, check: `${target.text} + gu`, value: u16(after + (VARS[5].value = post ? before : after)) };
		return { text: `${text};`, check: target.text, value: after };
	}
	const rhs = make(rand, 1 + rand(3), calls);
	let value: number;
	let op: string;
	let rhsText = rhs.text;
	if (kind < 5) {
		op = '=';
		value = rhs.value;
	} else if (kind < 9) {
		op = ['+=', '-=', '*=', '&=', '|=', '^='][rand(6)];
		const x = target.value;
		const y = rhs.value;
		value = op === '+=' ? x + y : op === '-=' ? x - y : op === '*=' ? Math.imul(x, y) : op === '&=' ? x & y : op === '|=' ? x | y : x ^ y;
	} else if (kind < 10) {
		const left = rand(2) === 0;
		const n = rand(2) ? rand(16) : rhs.value & 15;
		rhsText = rand(2) ? String(n) : `((${rhs.text}) & 15) + ${n - (rhs.value & 15)}`;
		op = left ? '<<=' : '>>=';
		value = left ? target.value << n : target.uns ? target.value >>> n : sext(target.value) >> n;
	} else {
		const mod = rand(2) === 0;
		const c = rand(2) ? DIVISORS[rand(DIVISORS.length)] : (rhs.value & 127) + 1;
		const fixed = rand(2) === 0;
		rhsText = fixed ? String(c) : `((${rhs.text}) & 127) + ${c - (rhs.value & 127)}`;
		const uns = target.uns || (!fixed && rhs.uns);
		const p = uns ? target.value : sext(target.value);
		op = mod ? '%=' : '/=';
		value = mod ? p % c : Math.trunc(p / c);
	}
	value = u16(value);
	store(value);
	return { text: `${target.text} ${op} ${rhsText};`, check: target.text, value };
}

function program(seed: number, perFunction: number, functions: number): { source: string; expected: number[] } {
	const rand = rng(seed);
	const expected: number[] = [];
	const initial = [1234, u16(-77), 40000, 9, u16(-20000), 513, 3, u16(-1)];
	const initialArr = [5, u16(-3), 100, 32767, u16(-32768), 0, 1, 2];
	VARS.forEach((v, i) => (v.value = initial[i]));
	initialArr.forEach((v, i) => (ARR[i] = v));
	let source = `
int ga = -20000; unsigned gu = 513;
int arr[8] = {5, -3, 100, 32767, -32768, 0, 1, 2};
unsigned r[${perFunction * functions}] = {0};
int id(int x) { return x; }
unsigned idu(unsigned x) { return x; }
int sum(int x, int y) { return x + y; }
unsigned mix(int x, int y, int z, int w, int v) { return x - 2 * y + 3 * z - 4 * w + 5 * v; }
`;
	for (let k = 0; k < functions; k++) {
		// Every other function calls nothing, which makes it use the registers differently.
		const calls = k % 2 === 1;
		// Some take the address of a variable, which moves it from a register to the stack.
		const onStack = rand(3) === 0;
		source += `void test${k}(int a, int b, unsigned c, unsigned d) {\n\tint e = 3, f = -1;\n`;
		if (onStack) source += `\tint *pe = &e; unsigned *pc = &c;\n\t*pe = 3; *pc = 40000;\n`;
		// More variables than there are registers for leaves few registers for temporaries.
		const spare = rand(3) === 0 ? 5 : 0;
		for (let i = 0; i < spare; i++) source += `\tint s${i} = ${i};\n`;
		if (spare) source += `\tfor (s0 = 0; s0 < 3; s0++) { s1 += s0; s2 += s1; s3 ^= s2; s4 += s3; }\n`;
		// The parameters and locals start afresh in every function; the globals carry on.
		[0, 1, 2, 3, 6, 7].forEach((i) => (VARS[i].value = initial[i]));
		for (let i = 0; i < perFunction; i++) {
			if (rand(3) === 0) {
				const m = mutate(rand, calls);
				source += `\t${m.text}\n\tr[${expected.length}] = ${m.check};\n`;
				expected.push(m.value);
				continue;
			}
			const v = make(rand, 1 + rand(4), calls);
			source += `\tr[${expected.length}] = ${v.text};\n`;
			expected.push(v.value);
		}
		source += '}\n';
	}
	source += 'int main() {\n';
	for (let k = 0; k < functions; k++) source += `\ttest${k}(1234, -77, 40000, 9);\n`;
	source += '\treturn 0;\n}\n';
	return { source, expected };
}

describe('C compiler: random expressions', () => {
	it('gives the same results as working them out directly', { timeout: 120_000 }, () => {
		const seeds = Number(process.env.FUZZ ?? 150);
		for (let seed = 1; seed <= seeds; seed++) {
			const { source, expected } = program(seed, 8, 4);
			const result = buildC(source);
			const errors = result.diagnostics.filter((d) => d.severity === 'error');
			if (errors.length)
				throw new Error(`seed ${seed}: ${errors[0].message} (line ${errors[0].line})\n${source.split('\n')[errors[0].line - 1]}`);
			const cpu = new Cpu();
			cpu.load(result.program!);
			expect(cpu.run(Infinity, 5_000_000, Infinity)).toBe('halted');
			const base = result.program!.ramLabels.get('.r')!;
			const got = Array.from(cpu.ram.slice(base, base + expected.length));
			for (let i = 0; i < expected.length; i++) {
				if (got[i] !== expected[i]) {
					const lines = source.split('\n');
					const at = lines.findIndex((l) => l.includes(`r[${i}] =`));
					throw new Error(`seed ${seed}: expected ${expected[i]}, got ${got[i]} for\n${lines.slice(Math.max(0, at - 1), at + 1).join('\n')}`);
				}
			}
		}
	});
});
