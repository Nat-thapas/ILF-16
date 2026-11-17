// Types and syntax tree of the ILF-16 C compiler.

import { CompileError } from './lexer';

export interface StructType {
	kind: 'struct';
	name: string;
	members: Member[];
	size: number;
	complete: boolean;
}
export interface FuncType {
	kind: 'func';
	ret: Type;
	params: Param[];
}
export type Type =
	| { kind: 'void' }
	/** `char` is a word like any other; it is only told apart to show values as characters. */
	| { kind: 'int'; unsigned: boolean; char?: boolean }
	| { kind: 'ptr'; to: Type }
	/** `len` is -1 while the length is not known yet. */
	| { kind: 'array'; of: Type; len: number }
	| FuncType
	| StructType;

export interface Member {
	name: string;
	type: Type;
	offset: number;
}
export interface Param {
	name: string;
	type: Type;
}

export const VOID: Type = { kind: 'void' };
export const INT: Type = { kind: 'int', unsigned: false };
export const UINT: Type = { kind: 'int', unsigned: true };
export const CHAR: Type = { kind: 'int', unsigned: false, char: true };
export const UCHAR: Type = { kind: 'int', unsigned: true, char: true };
export const ptrTo = (to: Type): Type => ({ kind: 'ptr', to });

export const isPtr = (t: Type): t is { kind: 'ptr'; to: Type } => t.kind === 'ptr';
export const isInt = (t: Type): t is { kind: 'int'; unsigned: boolean; char?: boolean } => t.kind === 'int';
export const isScalar = (t: Type) => t.kind === 'int' || t.kind === 'ptr';
/** Values of this type compare and shift as unsigned numbers. */
export const isUnsigned = (t: Type) => t.kind === 'ptr' || (t.kind === 'int' && t.unsigned);

/** Size in words. Every scalar is one 16-bit word. */
export function sizeOf(t: Type, line: number): number {
	switch (t.kind) {
		case 'int':
		case 'ptr':
			return 1;
		case 'void':
			return 1; // so that void pointers step by one word
		case 'array':
			if (t.len < 0) throw new CompileError(line, 'The size of this array is not known');
			return t.len * sizeOf(t.of, line);
		case 'struct':
			if (!t.complete) throw new CompileError(line, `struct ${t.name} is not defined yet`);
			return t.size;
		case 'func':
			throw new CompileError(line, 'A function has no size');
	}
}

export function typeName(t: Type): string {
	switch (t.kind) {
		case 'void':
			return 'void';
		case 'int':
			if (t.char) return t.unsigned ? 'unsigned char' : 'char';
			return t.unsigned ? 'unsigned' : 'int';
		case 'ptr':
			return typeName(t.to) + '*';
		case 'array':
			return `${typeName(t.of)}[${t.len < 0 ? '' : t.len}]`;
		case 'struct':
			return `struct ${t.name}`;
		case 'func':
			return `${typeName(t.ret)}(${t.params.map((p) => typeName(p.type)).join(', ')})`;
	}
}

/** One word of an initialised global: a number, the address of a global, or of a function. */
export type InitEntry = number | { v: Var; offset: number } | { f: Func };

export interface Var {
	name: string;
	type: Type;
	line: number;
	/** Lives at a fixed RAM address: globals, static locals and string literals. */
	global: boolean;

	// --- globals ---
	/** Name in the generated assembly, without the leading dot. */
	label: string;
	/** RAM address, known once all globals have been laid out. */
	addr: number;
	/** Initial contents, one entry per word, or null when not initialised. */
	init: InitEntry[] | null;

	// --- locals ---
	/** Index in the parameter list, or -1. */
	param: number;
	/** Its address is used (or it is an array or struct), so it cannot live in a register. */
	addrTaken: boolean;
	/** How often it is used, counting uses inside loops as more. */
	weight: number;
	/** Register it lives in, or -1 when it is on the stack. */
	reg: number;
	/** Offset from the stack pointer, when on the stack. */
	stackOff: number;
}

export interface Func {
	name: string;
	label: string;
	type: FuncType;
	line: number;
	params: Var[];
	/** Every local variable, parameters included. */
	locals: Var[];
	body: Stmt | null;
}

export type NodeKind =
	| 'num'
	| 'var'
	| 'gaddr'
	| 'laddr'
	| 'faddr'
	| 'builtin'
	| 'deref'
	| 'assign'
	| 'opassign'
	| 'incdec'
	| 'bin'
	| 'cmp'
	| 'neg'
	| 'bitnot'
	| 'lognot'
	| 'logand'
	| 'logor'
	| 'cond'
	| 'comma'
	| 'call'
	| 'cast';

/**
 * An expression. Which fields are used depends on `kind`:
 *  num      value
 *  var      v                        a variable (an lvalue)
 *  gaddr    v, value                 address of global v plus `value` words
 *  laddr    v, value                 address of stack variable v plus `value` words
 *  faddr    f                        address of a function
 *  builtin  name                     a built-in function, only valid when called
 *  deref    a                        the word at address a (an lvalue)
 *  assign   a = b
 *  opassign a op= b                  op, uns
 *  incdec   a += value               post: the result is the old value
 *  bin      a op b                   op is one of + - * / % & | ^ << >>, uns
 *  cmp      a op b                   op is one of == != < <= > >=, uns
 *  neg, bitnot, lognot, cast         a
 *  logand, logor, comma              a, b
 *  cond     a ? b : c
 *  call     f (direct), name (built-in) or a (through a pointer), args
 */
export interface Node {
	kind: NodeKind;
	type: Type;
	line: number;
	value: number;
	v: Var;
	f: Func | null;
	name: string;
	op: string;
	/** The operation is unsigned. */
	uns: boolean;
	post: boolean;
	a: Node;
	b: Node;
	c: Node;
	args: Node[];
}

export type StmtKind =
	| 'block'
	| 'expr'
	| 'if'
	| 'while'
	| 'do'
	| 'for'
	| 'return'
	| 'break'
	| 'continue'
	| 'switch'
	| 'case'
	| 'goto'
	| 'label'
	| 'empty';

/**
 * A statement:
 *  block     body
 *  expr      expr
 *  if        expr, then, otherwise
 *  while, do expr, then
 *  for       init, expr, step, then
 *  return    expr
 *  switch    expr, then, cases (the case statements inside it)
 *  case      value, isDefault
 *  goto, label  name
 */
export interface Stmt {
	kind: StmtKind;
	line: number;
	body: Stmt[];
	expr: Node | null;
	init: Stmt | null;
	step: Node | null;
	then: Stmt | null;
	otherwise: Stmt | null;
	cases: Stmt[];
	value: number;
	isDefault: boolean;
	name: string;
	/** case: the label the code generator gave it. */
	asmLabel: string;
}

export interface Unit {
	funcs: Func[];
	globals: Var[];
}

/** Built-in functions, which compile to single instructions. */
export const BUILTINS: Record<string, { params: number; ret: Type; help: string }> = {
	pixel: { params: 3, ret: VOID, help: 'pixel(x, y, color)' },
	in: { params: 1, ret: UINT, help: 'in(port)' },
	out: { params: 2, ret: VOID, help: 'out(port, value)' },
	stall: { params: 1, ret: VOID, help: 'stall(clocks)' },
	halt: { params: 0, ret: VOID, help: 'halt()' },
	mulhi: { params: 2, ret: INT, help: 'mulhi(a, b)' },
	umulhi: { params: 2, ret: UINT, help: 'umulhi(a, b)' }
};
