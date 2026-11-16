import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';
import { describe, expect, it } from 'vitest';
import { assemble, parseCoe, type Program } from './assembler';
import { Cpu } from './cpu';
import { disassemble } from './disasm';

const root = resolve(import.meta.dirname, '../../../..');
const read = (name: string) => readFileSync(resolve(root, name), 'utf-8');

function asm(source: string): Program {
	const result = assemble(source);
	const errors = result.diagnostics.filter((d) => d.severity === 'error');
	expect(errors).toEqual([]);
	return result.program!;
}

function runProgram(source: string, maxInstructions = 100000): Cpu {
	const cpu = new Cpu();
	cpu.load(asm(source));
	cpu.run(Infinity, maxInstructions, Infinity);
	return cpu;
}

describe('assembler matches assembler.py output', () => {
	for (const name of ['vga-demo', 'bad-apple']) {
		it(name, () => {
			const program = asm(read(`${name}.asm`));
			// The committed bad-apple.rom.coe encodes GFXSP as 0xD1 (older opcode); the hardware
			// treats 0xD0-0xD7 identically, so compare with that opcode normalised.
			const normalise = (w: number) => (w >>> 27 === 0xd0 >>> 3 ? (w & 0x00ffffff) | 0xd0000000 : w) >>> 0;
			expect(Array.from(program.rom)).toEqual(parseCoe(read(`${name}.rom.coe`)).map(normalise));
			expect(Array.from(program.ram)).toEqual(parseCoe(read(`${name}.ram.coe`)));
		});
	}
});

describe('assembler', () => {
	it('reports errors with line numbers', () => {
		const result = assemble('NOP\nFOO $1 2\n');
		expect(result.program).toBeNull();
		expect(result.diagnostics[0]).toMatchObject({ severity: 'error', line: 2 });
	});
	it('reports undefined labels', () => {
		const result = assemble('BRN .nowhere');
		expect(result.diagnostics[0].message).toContain('.nowhere');
	});
	it('encodes immediate-then-register per the hardware layout', () => {
		const result = assemble('SUB $1 100 $2');
		expect(result.program!.rom[1]).toBe(0x11910642);
		expect(result.diagnostics).toEqual([]);
	});
	it('maps addresses to source lines', () => {
		const program = asm('NOP\nCAL .f\nHLT\n.f\nRET');
		// addr 0 = generated LDI, 1 = NOP, 2-5 = CAL, 6 = HLT, 7-9 = RET
		expect(Array.from(program.lineOfAddr)).toEqual([0, 1, 2, 2, 2, 2, 3, 5, 5, 5]);
		expect(program.romLabels.get('.f')).toBe(7);
	});
	it('round-trips through the disassembler', () => {
		const program = asm('ADD $1 $2 5\nGFXSP $3 $1 $2\nBLT .x\n.x\nSNZ $13 7 0\nHLT');
		expect(Array.from(program.rom.slice(1), disassemble)).toEqual([
			'ADD $1 $2 5',
			'GFXSP $3 $1 $2',
			'BLT 4',
			'SNZ $13 7 0',
			'HLT'
		]);
	});
});

describe('cpu', () => {
	it('initialises the stack pointer and keeps R0 at zero', () => {
		const cpu = runProgram('LDI $0 123\nADD $0 5 5\nHLT');
		expect(cpu.regs[15]).toBe(8192);
		expect(cpu.regs[0]).toBe(0);
		expect(cpu.halted).toBe(true);
	});

	it('arithmetic and logic', () => {
		const cpu = runProgram(`
			LDI $1 0xFFFF
			LDI $2 3
			ADD $3 $1 $2
			SUB $4 $2 $1
			MUL $5 $1 $2
			UMUL $6 $1 $2
			SUMUL $7 $1 $2
			RSHIFT $8 $1 4
			LSHIFT $9 $1 4
			LSHIFT $10 $1 16
			NOT $11 $2
			TEST $12 $1
			XNOR $13 $1 $2
			HLT`);
		expect(Array.from(cpu.regs.slice(3, 14))).toEqual([
			2, 4, 0xfffd, 2, 0xffff, 0x0fff, 0xfff0, 0, 0xfffc, 0xffff, 3
		]);
	});

	it('flags', () => {
		const flagsAfter = (line: string) => runProgram(`LDI $1 0xFFFF\nLDI $2 1\n${line}\nHLT`).flags;
		const bit = (n: number) => 1 << n;
		// 0xFFFF + 1: A > B unsigned, A < B signed, zero result, even, bitwise even, carry
		expect(flagsAfter('ADD $0 $1 $2')).toBe(bit(0) | bit(3) | bit(5) | bit(8) | bit(9) | bit(10) | bit(15));
		// 1 - 0xFFFF = 2: borrow, positive, even
		expect(flagsAfter('SUB $0 $2 $1')).toBe(bit(1) | bit(2) | bit(7) | bit(8) | bit(10) | bit(15));
		// 0x7FFF + 1 overflows
		expect(flagsAfter('LDI $3 0x7FFF\nADD $0 $3 $2') & bit(11)).toBe(bit(11));
		// flags are only latched by ALU instructions
		expect(flagsAfter('ADD $0 $1 $2\nLDI $4 5\nLOD $5 0')).toBe(flagsAfter('ADD $0 $1 $2'));
	});

	it('branches and conditional sets', () => {
		const cpu = runProgram(`
			LDI $1 0
			.loop
			ADD $1 $1 1
			ADD $0 $1 10
			BLT .loop
			SEQ $2 111 222
			SNEQ $3 111 222
			SGT $4 7
			HLT`);
		expect(cpu.regs[1]).toBe(10);
		expect(cpu.regs[2]).toBe(111);
		expect(cpu.regs[3]).toBe(222);
		expect(cpu.regs[4]).toBe(0);
	});

	it('memory, stack and subroutines', () => {
		const cpu = runProgram(`
			DW 0x10 0x20
			.data
			DW 0x1234
			LOD $1 .data
			STR $1 100
			LOD $2 100
			PSH 77
			PSH $2
			POP $3
			POP $4
			CAL .sub
			HLT
			.sub
			LDI $5 9
			RET`);
		expect(cpu.regs[1]).toBe(0x1234);
		expect(cpu.regs[2]).toBe(0x1234);
		expect(cpu.regs[3]).toBe(0x1234);
		expect(cpu.regs[4]).toBe(77);
		expect(cpu.regs[5]).toBe(9);
		expect(cpu.regs[15]).toBe(8192);
		expect(cpu.halted).toBe(true);
	});

	it('I/O ports and display', () => {
		const cpu = new Cpu();
		cpu.load(asm('IN $1 %3\nADD $1 $1 1\nOUT $1 %5\nLDI $2 9\nGFXSP $2 10 20\nHLT'));
		cpu.inputs[3] = 41;
		cpu.run(Infinity, 100, Infinity);
		expect(cpu.outputs[5]).toBe(42);
		expect(cpu.vram[20 * 256 + 10]).toBe(9);
	});

	it('timing: 4 clocks per instruction, STL adds its argument', () => {
		const cpu = runProgram('NOP\nSTL 1000\nHLT');
		expect(cpu.instructions).toBe(4);
		expect(cpu.clocks).toBe(4 * 4 + 1000);
	});

	it('breakpoints and stepping', () => {
		const cpu = new Cpu();
		const program = asm('LDI $1 1\nLDI $1 2\nLDI $1 3\nHLT');
		cpu.load(program);
		cpu.breakpoints[program.addrOfLine.get(3)!] = 1;
		expect(cpu.run(Infinity, 100, Infinity)).toBe('breakpoint');
		expect(cpu.regs[1]).toBe(2);
		expect(cpu.step()).toBe('instructions');
		expect(cpu.regs[1]).toBe(3);
		expect(cpu.run(Infinity, 100, Infinity, true)).toBe('halted');
	});

	it('vga-demo draws a full frame with the four reference squares', () => {
		const cpu = new Cpu();
		cpu.load(asm(read('vga-demo.asm')));
		cpu.run(Infinity, 700000, Infinity);
		// squares where both x and y have bits 0x60 set
		expect(cpu.vram[0x60 * 256 + 0x60]).toBe(15);
		expect(cpu.vram[0xe0 * 256 + 0x7f]).toBe(15);
		// first pixels of the first frame: colour increments per pixel
		expect(Array.from(cpu.vram.slice(0, 5))).toEqual([0, 1, 2, 3, 4]);
		expect(cpu.vram[1 * 256]).toBe(1);
	});
});
