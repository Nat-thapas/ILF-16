// Execution profile per source line, built from the per-address counters the CPU keeps.

import type { Program } from './assembler';
import type { Cpu } from './cpu';

export interface LineProfile {
	/** Instructions executed for each 1-based source line (index 0 is unused). */
	counts: Float64Array;
	/** Extra clocks spent stalled by STL for each line. */
	stall: Float64Array;
	/** Instructions executed on all source lines together. */
	total: number;
	/** The largest value in `counts`. */
	max: number;
}

/**
 * Add up the CPU's counters by source line. A line that assembles to several instructions
 * (CAL, PSH, POP) gets the sum of them; instructions the assembler generated itself are left out.
 */
export function profileLines(cpu: Cpu, program: Program): LineProfile {
	const { lineOfAddr } = program;
	let lines = 0;
	for (let addr = 0; addr < lineOfAddr.length; addr++) if (lineOfAddr[addr] > lines) lines = lineOfAddr[addr];
	const counts = new Float64Array(lines + 1);
	const stall = new Float64Array(lines + 1);
	let total = 0;
	let max = 0;
	for (let addr = 0; addr < lineOfAddr.length; addr++) {
		const line = lineOfAddr[addr];
		if (line <= 0) continue;
		const n = cpu.execCount[addr];
		counts[line] += n;
		stall[line] += cpu.stallClocks[addr];
		total += n;
		if (counts[line] > max) max = counts[line];
	}
	return { counts, stall, total, max };
}
