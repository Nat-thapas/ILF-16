// What the debugger needs to show the variables of a compiled C program by name.

import { sizeOf, typeName, type Type } from './ast';

export interface DebugVariable {
	name: string;
	type: Type;
	/** The declaration, as in `int grid[3][4]`. */
	text: string;
	/** Register it lives in, or -1 when it is in memory. */
	reg: number;
	/** In memory: the RAM address of a global, or the offset from the stack pointer of a local. */
	addr: number;
}

export interface DebugFunction {
	name: string;
	/** ROM addresses of its code: from `start` up to, not including, `end`. */
	start: number;
	end: number;
	locals: DebugVariable[];
}

export interface DebugInfo {
	globals: DebugVariable[];
	functions: DebugFunction[];
}

/** A declaration as text: `int grid[3][4]`, `char *name`. */
export function declaration(type: Type, name: string): string {
	let dims = '';
	for (; type.kind === 'array'; type = type.of) dims += `[${type.len}]`;
	if (type.kind === 'ptr' && type.to.kind === 'func') return `${typeName(type.to.ret)} (*${name}${dims})()`;
	let stars = '';
	for (; type.kind === 'ptr'; type = type.to) stars += '*';
	return `${typeName(type)} ${stars}${name}${dims}`;
}

const isChar = (t: Type) => t.kind === 'int' && t.char === true;
const hex4 = (value: number) => '0x' + value.toString(16).toUpperCase().padStart(4, '0');

function character(c: number): string {
	if (c === 39 || c === 34 || c === 92) return '\\' + String.fromCharCode(c);
	if (c >= 32 && c < 127) return String.fromCharCode(c);
	if (c === 10) return '\\n';
	return '\\x' + c.toString(16);
}

/** The characters from `addr` up to a zero, or null if that is not readable text. */
function text(word: (addr: number) => number, addr: number, max: number): string | null {
	let out = '';
	for (let i = 0; i < max; i++) {
		const c = word(addr + i);
		if (c === 0) return `"${out}"`;
		if (c > 255) return null;
		if (i >= 40) return `"${out}"...`;
		out += character(c);
	}
	return `"${out}"`;
}

/** A number or pointer whose word is `value`, as text. `word` reads RAM, to follow strings. */
export function formatScalar(type: Type, value: number, word: (addr: number) => number): string {
	value &= 0xffff;
	if (type.kind === 'ptr') {
		if (value === 0) return '0 (null)';
		const target = isChar(type.to) ? text(word, value, 4096) : null;
		return target ? `${hex4(value)} ${target}` : hex4(value);
	}
	const unsigned = type.kind === 'int' && type.unsigned;
	const number = String(unsigned || !(value & 0x8000) ? value : value - 0x10000);
	if (isChar(type) && value >= 32 && value < 127) return `${number} '${character(value)}'`;
	return number;
}

/**
 * The value of a variable in memory at `addr`, as text. Arrays and structs are written out
 * with their elements, up to a limit.
 */
export function formatValue(type: Type, word: (addr: number) => number, addr: number, budget = { left: 24 }): string {
	if (type.kind === 'array') {
		if (isChar(type.of)) {
			const s = text(word, addr, type.len);
			if (s) return s;
		}
		const size = sizeOf(type.of, 0);
		const parts: string[] = [];
		for (let i = 0; i < type.len; i++) {
			if (budget.left <= 0) {
				parts.push('...');
				break;
			}
			parts.push(formatValue(type.of, word, addr + i * size, budget));
		}
		return `{${parts.join(', ')}}`;
	}
	if (type.kind === 'struct') {
		const parts: string[] = [];
		for (const m of type.members) {
			if (budget.left <= 0) {
				parts.push('...');
				break;
			}
			parts.push(`${m.name}: ${formatValue(m.type, word, addr + m.offset, budget)}`);
		}
		return `{${parts.join(', ')}}`;
	}
	budget.left--;
	return formatScalar(type, word(addr), word);
}

/** The function whose code the address is in, if any. */
export function functionAt(debug: DebugInfo, pc: number): DebugFunction | undefined {
	return debug.functions.find((f) => pc >= f.start && pc < f.end);
}
