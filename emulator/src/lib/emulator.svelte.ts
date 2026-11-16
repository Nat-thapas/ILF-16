import { assemble, type Diagnostic, type Program } from './core/assembler';
import { Cpu } from './core/cpu';
import { CLOCK_HZ } from './core/isa';
import { settings } from './settings.svelte';

export type Status = 'empty' | 'ready' | 'running' | 'paused' | 'halted';

/** Longest slice of emulated time made up in one animation frame (real-time mode). */
const MAX_CATCH_UP_MS = 100;
/** Wall-clock budget per animation frame spent emulating. */
const FRAME_BUDGET_MS = 12;

class Emulator {
	readonly cpu = new Cpu();

	status = $state<Status>('empty');
	/** Bumped whenever CPU state may have changed; UI reads CPU state reactively through it. */
	frame = $state(0);
	program = $state.raw<Program | null>(null);
	diagnostics = $state.raw<Diagnostic[]>([]);
	/** Source lines (1-based) with a breakpoint. */
	breakLines = $state.raw<number[]>([]);
	inputValues = $state<number[]>(new Array(16).fill(0));

	/** Measured speed while running. */
	mips = $state(0);
	realtimeRatio = $state(0);

	private raf = 0;
	private lastTime = 0;
	private clockTarget = 0;
	private skipBreakpoint = false;
	private statTime = 0;
	private statClocks = 0;
	private statInstructions = 0;

	/** Assemble source and load it. Returns true on success. */
	assembleAndLoad(source: string): boolean {
		const result = assemble(source);
		this.diagnostics = result.diagnostics;
		if (!result.program) return false;
		this.loadProgram(result.program);
		return true;
	}

	loadProgram(program: Program): void {
		this.stopLoop();
		this.cpu.load(program);
		this.program = program;
		this.syncBreakpoints();
		this.status = 'ready';
		this.mips = 0;
		this.realtimeRatio = 0;
		this.frame++;
	}

	setBreakLines(lines: number[]): void {
		this.breakLines = lines;
		this.syncBreakpoints();
	}

	private syncBreakpoints(): void {
		this.cpu.breakpoints.fill(0);
		const program = this.program;
		if (!program) return;
		const codeLines = [...program.addrOfLine.keys()].sort((a, b) => a - b);
		for (const line of this.breakLines) {
			// A breakpoint on a line without code applies to the next line that has some.
			const target = codeLines.find((l) => l >= line);
			if (target !== undefined) this.cpu.breakpoints[program.addrOfLine.get(target)!] = 1;
		}
	}

	setInput(port: number, value: number): void {
		value &= 0xffff;
		this.cpu.inputs[port] = value;
		this.inputValues[port] = value;
	}

	get canRun(): boolean {
		return this.status === 'ready' || this.status === 'paused';
	}

	run(): void {
		if (!this.canRun) return;
		this.status = 'running';
		this.skipBreakpoint = true;
		this.lastTime = performance.now();
		this.clockTarget = this.cpu.clocks;
		this.statTime = this.lastTime;
		this.statClocks = this.cpu.clocks;
		this.statInstructions = this.cpu.instructions;
		this.raf = requestAnimationFrame(this.loop);
	}

	pause(): void {
		if (this.status !== 'running') return;
		this.stopLoop();
		this.status = 'paused';
		this.frame++;
	}

	step(): void {
		if (!this.canRun) return;
		const reason = this.cpu.step();
		this.status = reason === 'halted' ? 'halted' : 'paused';
		this.frame++;
	}

	reset(): void {
		if (!this.program) return;
		this.stopLoop();
		this.cpu.reset();
		this.status = 'ready';
		this.mips = 0;
		this.realtimeRatio = 0;
		this.frame++;
	}

	private stopLoop(): void {
		cancelAnimationFrame(this.raf);
		this.raf = 0;
	}

	private loop = (now: number): void => {
		const cpu = this.cpu;
		const deadline = performance.now() + FRAME_BUDGET_MS;
		let reason;
		if (settings.speed === 'realtime') {
			const elapsed = Math.min(now - this.lastTime, MAX_CATCH_UP_MS);
			this.clockTarget += (elapsed * CLOCK_HZ) / 1000;
			reason = cpu.run(this.clockTarget, Infinity, deadline, this.skipBreakpoint);
			// Too slow to keep up: drop the backlog instead of spiralling.
			if (reason === 'deadline') this.clockTarget = cpu.clocks;
		} else {
			reason = cpu.run(Infinity, Infinity, deadline, this.skipBreakpoint);
			this.clockTarget = cpu.clocks;
		}
		this.lastTime = now;
		this.skipBreakpoint = false;

		const statElapsed = now - this.statTime;
		if (statElapsed >= 500) {
			this.mips = (cpu.instructions - this.statInstructions) / statElapsed / 1000;
			this.realtimeRatio = ((cpu.clocks - this.statClocks) / CLOCK_HZ / statElapsed) * 1000;
			this.statTime = now;
			this.statClocks = cpu.clocks;
			this.statInstructions = cpu.instructions;
		}

		this.frame++;
		if (reason === 'breakpoint') this.status = 'paused';
		else if (reason === 'halted') this.status = 'halted';
		else this.raf = requestAnimationFrame(this.loop);
	};
}

export const emulator = new Emulator();
