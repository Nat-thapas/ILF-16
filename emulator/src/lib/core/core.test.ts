import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';
import { describe, expect, it } from 'vitest';
import { assemble, parseCoe, toCoe, type Program } from './assembler';
import { Cpu } from './cpu';
import { disassemble } from './disasm';
import { profileLines } from './profile';

const root = resolve(import.meta.dirname, '../../../..');
/** Read an example program from the repository's examples folder. */
const read = (name: string) => readFileSync(resolve(root, 'examples', name), 'utf-8');
/** Read a .coe file written by the Python assembler, kept as a reference for the output format. */
const fixture = (name: string) => readFileSync(resolve(import.meta.dirname, 'fixtures', name), 'utf-8');

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

describe('assembler matches assembler-deprecated.py output', () => {
	for (const name of ['colors', 'bad-apple']) {
		it(name, () => {
			const program = asm(read(`${name}.asm`));
			expect(Array.from(program.rom)).toEqual(parseCoe(fixture(`${name}.rom.coe`)));
			expect(Array.from(program.ram)).toEqual(parseCoe(fixture(`${name}.ram.coe`)));
			// The exported .coe text is identical to what assembler-deprecated.py wrote (bar line endings).
			const text = (file: string) => fixture(file).replace(/\r\n/g, '\n');
			expect(toCoe(program.ram, 4)).toBe(text(`${name}.ram.coe`));
			expect(toCoe(program.rom, 8)).toBe(text(`${name}.rom.coe`));
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
	it('warns about labels used with the wrong kind of memory, and repeated defines', () => {
		const messages = (source: string) => assemble(source).diagnostics.map((d) => d.message);
		expect(messages('.data\nDW 1\nBRN .data')[0]).toContain('data (DW) label');
		expect(messages('.code\nNOP\nLOD $1 .code')[0]).toContain('code label');
		expect(messages('@define a $1\n@define a $2\nNOP')[0]).toContain('already defined');
		expect(messages('.data\nDW 1\n.code\nLOD $1 .data\nBRN .code')).toEqual([]);
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

	it('colors draws a full frame', () => {
		const cpu = new Cpu();
		cpu.load(asm(read('colors.asm')));
		cpu.run(Infinity, 700000, Infinity);
		// first pixels of the first frame: colour increments per pixel
		expect(Array.from(cpu.vram.slice(0, 5))).toEqual([1, 2, 3, 4, 5]);
		expect(cpu.vram[1 * 256]).toBe(2);
	});
});

describe('examples', () => {
	const load = (name: string) => {
		const result = assemble(read(name));
		expect(result.diagnostics).toEqual([]);
		const cpu = new Cpu();
		cpu.load(result.program!);
		return { cpu, program: result.program! };
	};

	it('mandelbrot draws the set', () => {
		const { cpu } = load('mandelbrot.asm');
		expect(cpu.run(Infinity, 100_000_000, Infinity)).toBe('halted');
		const at = (re: number, im: number) =>
			cpu.vram[Math.round((im + 1.5) / (3 / 256)) * 256 + Math.round((re + 2.25) / (3 / 256))];
		// inside: main cardioid, period-2 bulb
		expect(at(0, 0)).toBe(0);
		expect(at(-1, 0)).toBe(0);
		expect(at(-0.1, 0.7)).toBe(0);
		// outside
		expect(at(-2.2, 1.4)).not.toBe(0);
		expect(at(0.5, 0.5)).not.toBe(0);
		expect(at(-0.75, 0.5)).not.toBe(0);
		expect(cpu.outputs[0]).toBe(255);
	});

	it('mandelbrot-zoom zooms in 2x2 blocks and starts again', () => {
		const { cpu, program } = load('mandelbrot-zoom.asm');
		cpu.breakpoints[program.romLabels.get('.frame')!] = 1;
		expect(cpu.run(Infinity, 1e9, Infinity)).toBe('breakpoint');
		expect(cpu.run(Infinity, 1e9, Infinity, true)).toBe('breakpoint');
		// first frame: the whole set at half resolution, centred on the target point
		const at = (re: number, im: number) =>
			cpu.vram[2 * Math.round((im - 3917 / 4096) / (96 / 4096) + 64) * 256 + 2 * Math.round((re + 414 / 4096) / (96 / 4096) + 64)];
		expect(at(0, 0)).toBe(0);
		expect(at(-1, 0)).toBe(0);
		expect(at(0.5, 0.5)).not.toBe(0);
		// every block is 2x2 pixels of one colour
		expect(cpu.vram.every((colour, i) => colour === cpu.vram[i & ~257])).toBe(true);
		expect(cpu.outputs[0]).toBe(1);
		// the step ($12) shrinks by 1/16 per frame...
		expect(cpu.regs[12]).toBe(23040);
		expect(cpu.run(Infinity, 1e9, Infinity, true)).toBe('breakpoint');
		expect(cpu.regs[12]).toBe(21600);
		// ...and goes back to 96.0 once it would drop below 1.0
		cpu.regs[12] = 270;
		expect(cpu.run(Infinity, 1e9, Infinity, true)).toBe('breakpoint');
		expect(cpu.regs[12]).toBe(0x6000);
		expect(cpu.outputs[0]).toBe(3); // frames drawn so far
	});

	it('cube draws 12 connected edges and erases the previous frame', () => {
		const { cpu, program } = load('cube.asm');
		cpu.breakpoints[program.romLabels.get('.frame')!] = 1;
		expect(cpu.run(Infinity, 1e9, Infinity)).toBe('breakpoint');
		const points = () => {
			const at = program.ramLabels.get('.new_points')!;
			return Array.from({ length: 8 }, (_, i) => [cpu.ram[at + i * 2], cpu.ram[at + i * 2 + 1]]);
		};
		const angle = () => cpu.ram[program.ramLabels.get('.angle_a')!];
		for (let frame = 1; frame <= 40; frame++) {
			expect(cpu.run(Infinity, 1e9, Infinity, true)).toBe('breakpoint');
			const corners = points();
			for (const [x, y] of corners) {
				expect(x).toBeLessThan(256);
				expect(y).toBeLessThan(256);
				expect(cpu.vram[y * 256 + x]).not.toBe(0);
			}
			// a 104 pixel cube in perspective: every edge is somewhere between 40 and 200 pixels,
			// and nothing is left behind from earlier frames
			const lit = cpu.vram.reduce((n, colour) => n + (colour ? 1 : 0), 0);
			expect(lit).toBeGreaterThan(600);
			expect(lit).toBeLessThan(1500);
			// opposite corners (numbers 0 and 7) are on opposite sides of the screen centre
			expect((corners[0][0] - 128) * (corners[7][0] - 128)).toBeLessThanOrEqual(0);
			expect((corners[0][1] - 128) * (corners[7][1] - 128)).toBeLessThanOrEqual(0);
		}
		expect(angle()).toBe(40 * 300);
		// the analog stick takes over: fully left turns the other way, 127 * 8 per frame
		cpu.inputs[0] = 0x0081;
		cpu.run(Infinity, 1e9, Infinity, true);
		expect(angle()).toBe(40 * 300 - 127 * 8);
	});

	it('numbers prints the Fibonacci numbers and then the primes', () => {
		const { cpu, program } = load('numbers.asm');
		cpu.inputs[0] = 1; // skip the pauses
		cpu.breakpoints[program.romLabels.get('.print_line')!] = 1;
		expect(cpu.run(Infinity, 1e9, Infinity)).toBe('breakpoint');
		const printed: number[][] = [];
		for (let line = 0; line < 48 + 300; line++) {
			expect(cpu.run(Infinity, 1e9, Infinity, true)).toBe('breakpoint');
			printed.push([cpu.outputs[2], cpu.outputs[1] * 65536 + cpu.outputs[0]]);
		}
		const fibonacci = [0, 1];
		while (fibonacci.length < 48) fibonacci.push(fibonacci.at(-1)! + fibonacci.at(-2)!);
		expect(fibonacci[47]).toBe(2971215073);
		expect(printed.slice(0, 48)).toEqual(fibonacci.map((value, n) => [n, value]));
		const primes: number[] = [];
		for (let n = 2; primes.length < 300; n++) if (primes.every((p) => n % p)) primes.push(n);
		expect(printed.slice(48)).toEqual(primes.map((value, n) => [n + 1, value]));

		// the text on screen: the last line printed reads "  300       1987 000007C3"
		const font = Array.from(cpu.ram.slice(0, 37));
		const row = cpu.ram[program.ramLabels.get('.row')!] - 1;
		const read = (col: number) => {
			let bits = 0;
			for (let i = 0; i < 15; i++)
				bits = (bits << 1) | (cpu.vram[(row * 12 + 2 * Math.floor(i / 3)) * 256 + col * 8 + 2 + 2 * (i % 3)] ? 1 : 0);
			return '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ '[font.indexOf((bits << 1) | 1)];
		};
		expect(Array.from({ length: 25 }, (_, i) => read(3 + i)).join('')).toBe('  300       1987 000007C3');

		// the sieve itself: every odd number below 131072, of which 12250 are prime
		const sieve = cpu.ram.slice(2048, 2048 + 4096);
		const isPrime = (n: number) => !((sieve[n >> 5] >> ((n >> 1) & 15)) & 1);
		let count = 0;
		for (let n = 3; n < 131072; n += 2) if (isPrime(n)) count++;
		expect(count).toBe(12250);
		expect(isPrime(131071)).toBe(true);
		expect(isPrime(131069)).toBe(false);
	});

	it('raycaster builds its tables, draws the view and stops at walls', () => {
		const { cpu, program } = load('raycaster.asm');
		const ram = (name: string) => cpu.ram[program.ramLabels.get(name)!];
		cpu.breakpoints[program.romLabels.get('.frame')!] = 1;
		expect(cpu.run(Infinity, 1e9, Infinity)).toBe('breakpoint');
		// recip[n] = largest value with value * n < 131072 (at most 32767), height[n] likewise for 16384
		for (const n of [1, 4, 5, 100, 256, 639])
			expect(cpu.ram[1024 + n]).toBe(Math.min(32767, Math.ceil(131072 / n) - 1));
		for (const n of [1, 64, 128, 129, 1000, 2047])
			expect(cpu.ram[2048 + n]).toBe(Math.min(128, Math.ceil(16384 / n) - 1));

		// first frame: looking east from (4.5, 8.5) down a corridor to the outer wall 10.5 squares away
		expect(cpu.run(Infinity, 1e9, Infinity, true)).toBe('breakpoint');
		const column = (x: number) => Array.from({ length: 256 }, (_, y) => cpu.vram[y * 256 + x]);
		const middle = column(128);
		expect(middle.filter((colour) => colour === 8).length).toBe(24); // 2 * 16384 / (10.5 * 128)
		expect(middle.indexOf(8)).toBe(116);
		expect(middle.slice(0, 116).every((colour) => colour === 1)).toBe(true);
		expect(middle.slice(140).every((colour) => colour === 5)).toBe(true);
		expect(column(129)).toEqual(middle);
		// every column is sky, then one wall colour, then floor
		for (let x = 0; x < 256; x += 2) {
			const runs = column(x).filter((colour, y, all) => y === 0 || colour !== all[y - 1]);
			expect(runs.length).toBeLessThanOrEqual(3);
			expect(runs.at(-1) === 5 || runs.length === 1).toBe(true);
		}

		// walking forwards moves east and stops short of the wall at x = 15
		cpu.inputs[0] = 1;
		for (let frame = 0; frame < 10; frame++) cpu.run(Infinity, 1e9, Infinity, true);
		expect(ram('.pos_x')).toBe(0x480 + 10 * 20);
		expect(ram('.pos_y')).toBe(0x880);
		for (let frame = 0; frame < 200; frame++) cpu.run(Infinity, 1e9, Infinity, true);
		expect(ram('.pos_x')).toBeGreaterThan(14.5 * 256);
		expect(ram('.pos_x')).toBeLessThan(14.8 * 256);
		expect(column(128).filter((colour) => colour === 8).length).toBe(256); // the wall fills the view
		// turning right
		cpu.inputs[0] = 8;
		cpu.run(Infinity, 1e9, Infinity, true);
		expect(ram('.angle')).toBe(768);
	});

	it('blocks drops pieces, clears full rows and ends when the well is full', () => {
		const { cpu, program } = load('blocks.asm');
		const ram = (name: string) => cpu.ram[program.ramLabels.get(name)!];
		const frame = program.romLabels.get('.frame')!;
		const square = (x: number, y: number) => cpu.ram[2048 + y * 32 + x];
		cpu.breakpoints[frame] = 1;
		cpu.breakpoints[program.romLabels.get('.wait_release')!] = 1;
		expect(cpu.run(Infinity, 1e9, Infinity)).toBe('breakpoint');
		// the wall around the well
		for (let y = 4; y < 28; y++) expect([square(2, y), square(3, y), square(14, y), square(15, y)]).toEqual([5, 0, 0, 5]);
		for (let x = 2; x < 16; x++) expect(square(x, 28)).toBe(5);

		// fill the bottom row by hand, then let the first piece drop onto it
		for (let x = 3; x < 15; x++) cpu.ram[2048 + 27 * 32 + x] = 7;
		cpu.inputs[0] = 2;
		let frames = 0;
		while (ram('.score') === 0 && frames++ < 200) cpu.run(Infinity, 1e9, Infinity, true);
		expect(ram('.rows')).toBe(1);
		expect(ram('.score')).toBe(11); // 1 for the piece, 10 for the row
		expect([cpu.outputs[0], cpu.outputs[1]]).toEqual([11, 1]);
		// the piece is all that is left, now resting on the bottom
		let squares = 0;
		for (let y = 4; y < 28; y++) for (let x = 3; x < 15; x++) if (square(x, y)) squares++;
		expect(squares).toBeGreaterThanOrEqual(2);
		expect(squares).toBeLessThanOrEqual(5);
		expect(Array.from({ length: 12 }, (_, x) => square(x + 3, 27)).some(Boolean)).toBe(true);
		// what is on the screen matches the board (below the new piece coming in at the top)
		for (let y = 8; y < 28; y++)
			for (let x = 3; x < 15; x++) expect(cpu.vram[(y * 8 + 4) * 256 + x * 8 + 4]).toBe(square(x, y));

		// moving: left takes the piece one square left
		cpu.inputs[0] = 0;
		cpu.run(Infinity, 1e9, Infinity, true);
		const pos = cpu.regs[12];
		cpu.inputs[0] = 4;
		cpu.run(Infinity, 1e9, Infinity, true);
		expect(cpu.regs[12] === pos - 1 || cpu.regs[12] === pos + 31).toBe(true);

		// keep dropping pieces in the middle until they reach the top
		cpu.inputs[0] = 2;
		frames = 0;
		while (cpu.pc === frame && frames++ < 5000) cpu.run(Infinity, 1e9, Infinity, true);
		expect(cpu.pc).toBe(program.romLabels.get('.wait_release'));
		expect(ram('.score')).toBeGreaterThan(8);
	});

	it('fire burns at the bottom of the screen and goes out when asked', () => {
		const { cpu, program } = load('fire.asm');
		cpu.breakpoints[program.romLabels.get('.frame')!] = 1;
		expect(cpu.run(Infinity, 1e9, Infinity)).toBe('breakpoint');
		const lit = (y: number) => Array.from({ length: 256 }, (_, x) => cpu.vram[y * 256 + x]).filter(Boolean).length;
		for (let frame = 0; frame < 80; frame++) cpu.run(Infinity, 1e9, Infinity, true);
		expect(lit(254)).toBeGreaterThan(240);
		expect(lit(200)).toBeGreaterThan(100);
		expect(lit(76)).toBe(0);
		expect(lit(40)).toBe(0);
		// heat only ever falls with height
		const heat = (row: number) => cpu.ram.slice(1024 + row * 128, 1152 + row * 128).reduce((a, b) => a + b, 0);
		expect(heat(45)).toBeGreaterThan(heat(35));
		expect(heat(35)).toBeGreaterThan(heat(25));
		// any input bit stops the fuel, and the fire dies down
		cpu.inputs[0] = 1;
		for (let frame = 0; frame < 80; frame++) cpu.run(Infinity, 1e9, Infinity, true);
		expect(cpu.vram.some(Boolean)).toBe(false);
	});

	it('game of life follows the rules on a wrapping grid', () => {
		const { cpu, program } = load('game-of-life.asm');
		cpu.breakpoints[program.romLabels.get('.generation')!] = 1;
		const grid = () =>
			Array.from({ length: 64 * 64 }, (_, i) => cpu.ram[((i >> 6) + 1) * 66 + (i & 63) + 1]);
		expect(cpu.run(Infinity, 10_000_000, Infinity)).toBe('breakpoint');
		let expected = grid();
		const alive = expected.reduce((a, b) => a + b, 0);
		expect(alive).toBeGreaterThan(700);
		expect(alive).toBeLessThan(1400);
		for (let gen = 0; gen < 4; gen++) {
			expected = expected.map((cell, i) => {
				const x = i & 63;
				const y = i >> 6;
				let count = 0;
				for (let dy = -1; dy <= 1; dy++)
					for (let dx = -1; dx <= 1; dx++)
						if (dx || dy) count += expected[(((y + dy) & 63) << 6) | ((x + dx) & 63)];
				return count === 3 || (count === 2 && cell) ? 1 : 0;
			});
			expect(cpu.run(Infinity, 10_000_000, Infinity, true)).toBe('breakpoint');
			expect(grid()).toEqual(expected);
			// every cell is drawn as a 3x3 square
			expect(Array.from(expected, (_, i) => (cpu.vram[(i >> 6) * 4 * 256 + (i & 63) * 4 + 257] ? 1 : 0))).toEqual(expected);
		}
		expect(cpu.outputs[0]).toBe(3);
	});

	it('snake can be steered to the food and crashes into the wall', () => {
		const { cpu, program } = load('snake.asm');
		cpu.breakpoints[program.romLabels.get('.tick')!] = 1;
		expect(cpu.run(Infinity, 10_000_000, Infinity)).toBe('breakpoint');
		const UP = 1, DOWN = 2, LEFT = 4, RIGHT = 8;
		let head = 528;
		let dir = RIGHT;
		for (let moves = 0; moves < 400 && cpu.outputs[0] < 3; moves++) {
			const board = Array.from(cpu.ram.slice(0, 1024));
			expect(board[head]).toBe(1);
			const food = board.indexOf(2);
			expect(food).toBeGreaterThanOrEqual(0);
			const dx = (food & 31) - (head & 31);
			const dy = (food >> 5) - (head >> 5);
			// go vertically first, then horizontally; never ask for a reversal
			let want = dy < 0 ? UP : dy > 0 ? DOWN : dx < 0 ? LEFT : RIGHT;
			if ((want | dir) === 3 || (want | dir) === 12) want = dx < 0 ? LEFT : dx > 0 ? RIGHT : dir;
			if ((want | dir) === 3 || (want | dir) === 12) want = want & 3 ? RIGHT : DOWN;
			cpu.inputs[0] = want;
			expect(cpu.run(Infinity, 10_000_000, Infinity, true)).toBe('breakpoint');
			dir = want;
			head += { [UP]: -32, [DOWN]: 32, [LEFT]: -1, [RIGHT]: 1 }[dir]!;
		}
		expect(cpu.outputs[0]).toBe(3);
		// 3 cells at the start plus 3 eaten, and one piece of food
		const board = Array.from(cpu.ram.slice(0, 1024));
		expect(board.filter((c) => c === 1).length).toBe(6);
		expect(board.filter((c) => c === 2).length).toBe(1);

		// run into the top wall: the game waits there for a key, without moving the head
		cpu.inputs[0] = dir === DOWN ? LEFT : UP;
		cpu.run(Infinity, 3_000_000, Infinity, true);
		cpu.inputs[0] = UP;
		cpu.breakpoints.fill(0);
		cpu.breakpoints[program.romLabels.get('.wait_release')!] = 1;
		expect(cpu.run(Infinity, 30_000_000, Infinity)).toBe('breakpoint');
	});
});

describe('profile', () => {
	it('counts executions and STL time per source line', () => {
		const source = [
			'LDI $1 5', // line 1
			'.loop', // line 2
			'    PSH $1', // line 3: three instructions
			'    POP $2', // line 4: two instructions
			'    STL 100', // line 5
			'    SUB $1 $1 1', // line 6
			'    BNZ .loop', // line 7
			'HLT', // line 8
			'NOP' // line 9: never reached
		].join('\n');
		const program = asm(source);
		const cpu = new Cpu();
		cpu.load(program);
		expect(cpu.run(Infinity, 1000, Infinity)).toBe('halted');
		const profile = profileLines(cpu, program);
		expect(Array.from(profile.counts)).toEqual([0, 1, 0, 15, 10, 5, 5, 5, 1, 0]);
		expect(profile.stall[5]).toBe(500);
		expect(profile.max).toBe(15);
		// everything but the stack pointer set-up the assembler adds
		expect(profile.total).toBe(cpu.instructions - 1);

		cpu.reset();
		expect(profileLines(cpu, program).total).toBe(0);
	});
});
