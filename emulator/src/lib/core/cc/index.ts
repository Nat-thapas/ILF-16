// C compiler for the ILF-16. It turns a subset of C into assembly, which the assembler then
// turns into the memory images. See the emulator README for the language it accepts.

import { assemble, type AssembleResult, type Diagnostic } from '../assembler';
import { generate } from './codegen';
import { CompileError, lex } from './lexer';
import { parse } from './parser';

export interface CompileResult {
	/** The generated assembly, or null when there were errors. */
	asm: string | null;
	/** For each line of `asm` (index 0 is line 1), the C line it came from, or 0. */
	lineMap: number[];
	diagnostics: Diagnostic[];
}

/** Compile C source to ILF-16 assembly. */
export function compileC(source: string): CompileResult {
	const diagnostics: Diagnostic[] = [];
	const warn = (line: number, message: string) => diagnostics.push({ severity: 'warning', line, message });
	try {
		const unit = parse(lex(source, warn), warn);
		const { asm, lineMap } = generate(unit, source, warn);
		return { asm, lineMap, diagnostics };
	} catch (e) {
		if (!(e instanceof CompileError)) throw e;
		diagnostics.push({ severity: 'error', line: e.line, message: e.message });
		return { asm: null, lineMap: [], diagnostics };
	}
}

/**
 * Compile and assemble C source. In the resulting program the "source lines" are lines of the
 * C source, so breakpoints, the current line and the heat map all work on the C code.
 */
export function buildC(source: string): AssembleResult {
	const compiled = compileC(source);
	if (compiled.asm === null) return { program: null, diagnostics: compiled.diagnostics };
	const { asm, lineMap } = compiled;
	const assembled = assemble(asm);
	const diagnostics = [...compiled.diagnostics];
	for (const d of assembled.diagnostics) {
		// The compiler should never produce assembly that does not assemble, except for a
		// program that is simply too large.
		const where = d.line ? ` (line ${d.line} of the generated assembly)` : '';
		diagnostics.push({ severity: d.severity, line: lineMap[d.line - 1] ?? 0, message: d.message + where });
	}
	const program = assembled.program;
	if (!program) return { program: null, diagnostics };
	const addrOfLine = new Map<number, number>();
	const lineOfAddr = program.lineOfAddr.map((asmLine, addr) => {
		const line = lineMap[asmLine - 1] ?? 0;
		if (line > 0 && !addrOfLine.has(line)) addrOfLine.set(line, addr);
		return line;
	});
	return { program: { ...program, lineOfAddr, addrOfLine, lineStep: true, asm }, diagnostics };
}
