// The C examples: each must compile cleanly, and draw exactly what the assembly example of
// the same name draws.

import { readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { resolve } from 'node:path';
import { describe, expect, it } from 'vitest';
import { assemble } from '../assembler';
import { Cpu } from '../cpu';
import { buildC } from './index';

const examples = resolve(import.meta.dirname, '../../../../../examples');
const read = (name: string) => readFileSync(resolve(examples, name), 'utf-8');

function load(name: string): Cpu {
	const result = name.endsWith('.c') ? buildC(read(name)) : assemble(read(name));
	expect(result.diagnostics.filter((d) => d.severity === 'error')).toEqual([]);
	const cpu = new Cpu();
	cpu.load(result.program!);
	return cpu;
}

/** Run until `done` says so, looking every few instructions. */
function runUntil(cpu: Cpu, done: (cpu: Cpu) => boolean, limit = 400_000_000): void {
	while (!done(cpu) && !cpu.halted) {
		if (cpu.instructions > limit) throw new Error('The program did not get there');
		cpu.run(Infinity, 4, Infinity);
	}
}

/** Number of STL 0xFFFF instructions executed: everything else takes 4 clocks. */
const stalls = (cpu: Cpu) => (cpu.clocks - 4 * cpu.instructions) / 0xffff;

/**
 * Where to stop each pair of programs to compare them. The animated ones pace themselves with
 * a fixed number of stalls per frame, and draw nothing straight after the last of them, so
 * "after so many stalls" is the same moment in both versions.
 */
const STOP: Record<string, (cpu: Cpu) => boolean> = {
	mandelbrot: () => false, // runs until it halts
	'mandelbrot-zoom': (cpu) => cpu.outputs[0] === 3,
	fire: (cpu) => stalls(cpu) >= 12 * 15,
	'game-of-life': (cpu) => stalls(cpu) >= 30 * 8,
	cube: (cpu) => stalls(cpu) >= 20 * 40,
	raycaster: (cpu) => stalls(cpu) >= 14 * 3,
	snake: (cpu) => stalls(cpu) >= 60 * 12,
	blocks: (cpu) => stalls(cpu) >= 16 * 500,
	numbers: (cpu) => stalls(cpu) >= 150 * 12,
	'bad-apple': (cpu) => stalls(cpu) >= 320 * 3
};

describe('C examples', () => {
	const names = readdirSync(examples)
		.filter((name) => name.endsWith('.c'))
		.map((name) => name.slice(0, -2));
	const report: string[] = [];

	it('there is a C version of every assembly example', () => {
		const asm = readdirSync(examples)
			.filter((name) => name.endsWith('.asm'))
			.map((name) => name.slice(0, -4));
		expect(names.sort()).toEqual(asm.sort());
	});

	for (const name of names) {
		it(`${name}.c compiles without errors or warnings`, () => {
			expect(buildC(read(`${name}.c`)).diagnostics).toEqual([]);
		});

		const stop = STOP[name];
		if (!stop) continue;
		it(`${name}.c draws what ${name}.asm draws`, { timeout: 120_000 }, () => {
			const c = load(`${name}.c`);
			const asm = load(`${name}.asm`);
			runUntil(c, stop);
			runUntil(asm, stop);
			expect(Array.from(c.outputs)).toEqual(Array.from(asm.outputs));
			// compared as text, which fails with a short message instead of 65536 numbers
			const picture = (cpu: Cpu) => Array.from(cpu.vram, (v) => v.toString(16)).join('');
			expect(picture(c) === picture(asm)).toBe(true);
			const ratio = c.instructions / asm.instructions;
			report.push(
				`${name.padEnd(16)} asm ${String(asm.instructions).padStart(10)}  C ${String(c.instructions).padStart(10)}  x${ratio.toFixed(2)}` +
					`   ROM asm ${asm.program!.rom.length} C ${c.program!.rom.length}`
			);
			// the compiled code should stay within reach of the hand-written assembly
			expect(ratio).toBeLessThan(2);
		});
	}

	it('writes the comparison when asked to', () => {
		if (process.env.CC_REPORT) writeFileSync(process.env.CC_REPORT, report.join('\n') + '\n');
	});
});
