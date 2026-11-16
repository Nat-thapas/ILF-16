// ILF-16 CPU core. Behaviour follows the schematic netlists (cu / idu / alu / cpu), which
// differ from the README in a few details:
//  - special instructions decode on the top 6 opcode bits only
//  - all immediates are zero-extended, register numbers are the low 4 bits
//  - ALU op 8 passes A (TEST), op 9 is NOT A
//  - flags are latched only by opcodes 0x10-0x1F

import { CLOCKS_PER_INSTRUCTION, RAM_SIZE } from './isa';
import type { Program } from './assembler';

const ROM_ADDR_SPACE = 1 << 14;
const ROM_ADDR_MASK = ROM_ADDR_SPACE - 1;
const RAM_MASK = RAM_SIZE - 1;

const K_NOP = 0;
const K_STL = 1;
const K_HLT = 2;
const K_ALU = 3;
const K_BRANCH = 4;
const K_SET = 5;
const K_LOD = 6;
const K_STR = 7;
const K_IN = 8;
const K_OUT = 9;
const K_GFX = 10;

export type StopReason = 'clocks' | 'instructions' | 'deadline' | 'breakpoint' | 'halted';

export const DISPLAY_SIZE = 256;

export class Cpu {
	readonly regs = new Uint16Array(16);
	readonly ram = new Uint16Array(RAM_SIZE);
	readonly inputs = new Uint16Array(16);
	readonly outputs = new Uint16Array(16);
	/** One colour index (0-15) per pixel, row-major. */
	readonly vram = new Uint8Array(DISPLAY_SIZE * DISPLAY_SIZE);
	readonly breakpoints = new Uint8Array(ROM_ADDR_SPACE);

	pc = 0;
	halted = false;
	/** 48 MHz clock ticks since reset (includes STL time). */
	clocks = 0;
	instructions = 0;
	vramDirty = true;

	program: Program | null = null;

	// Flags are evaluated lazily from the operands/result of the last flag-setting instruction.
	private fA = 0;
	private fB = 0;
	private fO = 0;
	private fOp = 0;

	// Pre-decoded ROM.
	private readonly kind = new Uint8Array(ROM_ADDR_SPACE);
	private readonly sub = new Uint8Array(ROM_ADDR_SPACE);
	private readonly dest = new Uint8Array(ROM_ADDR_SPACE);
	private readonly aReg = new Uint8Array(ROM_ADDR_SPACE);
	private readonly bReg = new Uint8Array(ROM_ADDR_SPACE);
	private readonly aVal = new Uint16Array(ROM_ADDR_SPACE);
	private readonly bVal = new Uint16Array(ROM_ADDR_SPACE);

	load(program: Program): void {
		this.program = program;
		this.kind.fill(0);
		this.sub.fill(0);
		this.dest.fill(0);
		this.aReg.fill(0);
		this.bReg.fill(0);
		this.aVal.fill(0);
		this.bVal.fill(0);
		for (let i = 0; i < program.rom.length; i++) this.decode(i, program.rom[i]);
		this.reset();
	}

	private decode(addr: number, word: number): void {
		const id = word >>> 24;
		const argc = (word >>> 22) & 3;
		const x = (word >>> 21) & 1;
		const y = (word >>> 20) & 1;
		const data = word & 0xffff;
		this.dest[addr] = (word >>> 16) & 15;

		let a = 0;
		let b = 0;
		if (argc === 1) {
			a = data;
		} else if (argc === 2) {
			if (x && !y) {
				a = data >>> 12;
				b = data & 0xfff;
			} else if (!x && y) {
				a = data >>> 4;
				b = data & 0xf;
			} else {
				a = data >>> 8;
				b = data & 0xff;
			}
		}
		// With argc 0 or 3 the decoder outputs zero, which also selects R0 if a reg bit is set.
		this.aReg[addr] = x;
		this.bReg[addr] = y;
		this.aVal[addr] = x ? a & 15 : a;
		this.bVal[addr] = y ? b & 15 : b;

		const top6 = id >>> 2;
		let kind = K_NOP;
		let sub = 0;
		if (top6 === 0x01) kind = K_STL;
		else if (top6 === 0x02) kind = K_HLT;
		else if (id >>> 4 === 0x1) {
			kind = K_ALU;
			sub = id & 15;
		} else if (id >>> 5 === 0x1) {
			kind = K_BRANCH;
			sub = id & 0x1f;
		} else if (id >>> 5 === 0x2) {
			kind = K_SET;
			sub = id & 0x1f;
		} else if (top6 === 0x30) kind = K_LOD;
		else if (top6 === 0x31) kind = K_STR;
		else if (top6 === 0x32) kind = K_IN;
		else if (top6 === 0x33) kind = K_OUT;
		else if (top6 === 0x34 || top6 === 0x35) kind = K_GFX;
		this.kind[addr] = kind;
		this.sub[addr] = sub;
	}

	/** Reset CPU state and reload RAM from the program image. Inputs and breakpoints are kept. */
	reset(): void {
		this.regs.fill(0);
		this.outputs.fill(0);
		this.vram.fill(0);
		this.vramDirty = true;
		this.ram.fill(0);
		if (this.program) this.ram.set(this.program.ram);
		this.pc = 0;
		this.halted = false;
		this.clocks = 0;
		this.instructions = 0;
		// Before start the flag register free-runs on the ALU output for the first instruction
		// with both argument buffers cleared.
		const firstOp = this.program && this.program.rom.length ? (this.program.rom[0] >>> 24) & 15 : 0;
		this.fA = 0;
		this.fB = 0;
		this.fOp = firstOp;
		this.fO = alu(firstOp, 0, 0);
	}

	flag(index: number): boolean {
		const a = this.fA;
		const b = this.fB;
		const o = this.fO;
		switch (index) {
			case 0:
				return a > b;
			case 1:
				return a < b;
			case 2:
				return ((a << 16) >> 16) > ((b << 16) >> 16);
			case 3:
				return ((a << 16) >> 16) < ((b << 16) >> 16);
			case 4:
				return a === b;
			case 5:
				return o === 0;
			case 6:
				return (o & 0x8000) !== 0;
			case 7:
				return o !== 0 && (o & 0x8000) === 0;
			case 8:
				return (o & 1) === 0;
			case 9: {
				let v = o ^ (o >>> 8);
				v ^= v >>> 4;
				v ^= v >>> 2;
				v ^= v >>> 1;
				return (v & 1) === 0;
			}
			case 10:
				return this.fOp & 1 ? a < b : a + b > 0xffff;
			case 11:
				return this.fOp & 1
					? ((a ^ b) & (a ^ (a - b)) & 0x8000) !== 0
					: (~(a ^ b) & (a ^ (a + b)) & 0x8000) !== 0;
			case 15:
				return true;
			default:
				return false;
		}
	}

	get flags(): number {
		let word = 0;
		for (let i = 0; i < 16; i++) if (this.flag(i)) word |= 1 << i;
		return word;
	}

	/** Execute exactly one instruction (ignores breakpoints). */
	step(): StopReason {
		return this.run(Infinity, 1, Infinity, true);
	}

	/**
	 * Run until the clock counter reaches `clockLimit`, `maxInstructions` have executed,
	 * `deadline` (performance.now() time) passes, a breakpoint is hit or the CPU halts.
	 * A breakpoint on the very first instruction is skipped when `skipFirstBreakpoint` is set.
	 */
	run(
		clockLimit: number,
		maxInstructions: number,
		deadline: number,
		skipFirstBreakpoint = false
	): StopReason {
		if (this.halted) return 'halted';
		const { regs, ram, inputs, outputs, vram, breakpoints } = this;
		const { kind, sub, dest, aReg, bReg, aVal, bVal } = this;
		let pc = this.pc;
		let clocks = this.clocks;
		let executed = 0;
		let skip = skipFirstBreakpoint;
		let reason: StopReason = 'clocks';

		while (clocks < clockLimit) {
			if (executed >= maxInstructions) {
				reason = 'instructions';
				break;
			}
			const addr = pc & ROM_ADDR_MASK;
			if (breakpoints[addr] !== 0 && !skip) {
				reason = 'breakpoint';
				break;
			}
			skip = false;
			if ((executed & 0x3fff) === 0x3fff && performance.now() >= deadline) {
				reason = 'deadline';
				break;
			}

			const a = aReg[addr] !== 0 ? regs[aVal[addr]] : aVal[addr];
			const b = bReg[addr] !== 0 ? regs[bVal[addr]] : bVal[addr];
			const d = dest[addr];
			executed++;
			clocks += CLOCKS_PER_INSTRUCTION;
			pc = (pc + 1) & 0xffff;

			switch (kind[addr]) {
				case K_ALU: {
					const op = sub[addr];
					const o = alu(op, a, b);
					this.fA = a;
					this.fB = b;
					this.fO = o;
					this.fOp = op;
					if (d !== 0) regs[d] = o;
					break;
				}
				case K_BRANCH: {
					const s = sub[addr];
					if (this.flag(s & 15) !== ((s & 16) !== 0)) pc = a;
					break;
				}
				case K_SET: {
					const s = sub[addr];
					if (d !== 0) regs[d] = this.flag(s & 15) !== ((s & 16) !== 0) ? a : b;
					break;
				}
				case K_LOD:
					if (d !== 0) regs[d] = ram[a & RAM_MASK];
					break;
				case K_STR:
					ram[a & RAM_MASK] = regs[d];
					break;
				case K_IN:
					if (d !== 0) regs[d] = inputs[a & 15];
					break;
				case K_OUT:
					outputs[a & 15] = regs[d];
					break;
				case K_GFX:
					vram[((b & 0xff) << 8) | (a & 0xff)] = regs[d] & 15;
					this.vramDirty = true;
					break;
				case K_STL:
					clocks += a;
					break;
				case K_HLT:
					this.halted = true;
					pc = (pc - 1) & 0xffff; // keep the debugger pointing at the HLT
					break;
			}
			if (this.halted) {
				reason = 'halted';
				break;
			}
		}

		this.pc = pc;
		this.clocks = clocks;
		this.instructions += executed;
		return reason;
	}
}

export function alu(op: number, a: number, b: number): number {
	switch (op) {
		case 0:
			return (a + b) & 0xffff;
		case 1:
			return (a - b) & 0xffff;
		case 2:
			return b > 15 ? 0 : a >>> b;
		case 3:
			return b > 15 ? 0 : (a << b) & 0xffff;
		case 4:
		case 5:
			return Math.imul(a, b) & 0xffff;
		case 6:
			return ((a * b) >>> 16) & 0xffff;
		case 7:
			return ((((a << 16) >> 16) * ((b << 16) >> 16)) >> 16) & 0xffff;
		case 8:
			return a;
		case 9:
			return ~a & 0xffff;
		case 10:
			return a & b;
		case 11:
			return a | b;
		case 12:
			return a ^ b;
		case 13:
			return ~(a & b) & 0xffff;
		case 14:
			return ~(a | b) & 0xffff;
		default:
			return ~(a ^ b) & 0xffff;
	}
}
