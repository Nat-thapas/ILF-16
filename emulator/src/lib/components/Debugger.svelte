<script lang="ts">
	import { disassemble } from '#lib/core/disasm.ts';
	import { CLOCK_HZ, FLAG_NAMES, RAM_SIZE } from '#lib/core/isa.ts';
	import { emulator } from '#lib/emulator.svelte.ts';
	import { hex, signed16 } from '#lib/format.ts';

	const cpu = emulator.cpu;

	let tab = $state<'rom' | 'ram'>('rom');
	let followPc = $state(true);
	let romBase = $state(0);
	let ramBaseText = $state('0');

	const ROM_ROWS = 16;
	const RAM_ROWS = 12;
	const RAM_COLS = 8;

	const snapshot = $derived.by(() => {
		void emulator.frame;
		return {
			regs: Array.from(cpu.regs),
			pc: cpu.pc,
			flags: cpu.flags,
			clocks: cpu.clocks,
			instructions: cpu.instructions
		};
	});

	const program = $derived(emulator.program);
	const pcLine = $derived(program?.lineOfAddr[snapshot.pc] ?? 0);

	const romStart = $derived(
		followPc ? Math.max(0, snapshot.pc - 4) : Math.max(0, Math.min(romBase, 0xffff))
	);
	const romRows = $derived.by(() => {
		void emulator.breakLines; // breakpoint markers depend on it
		const rows = [];
		const rom = program?.rom;
		for (let addr = romStart; addr < romStart + ROM_ROWS; addr++) {
			const word = rom && addr < rom.length ? rom[addr] : 0;
			rows.push({
				addr,
				word,
				text: disassemble(word),
				line: program?.lineOfAddr[addr] ?? 0,
				breakpoint: cpu.breakpoints[addr & 0x3fff] !== 0
			});
		}
		return rows;
	});

	const ramBase = $derived.by(() => {
		const text = ramBaseText.trim().toLowerCase();
		const value = text.startsWith('0x') ? parseInt(text.slice(2), 16) : parseInt(text, 10);
		if (Number.isNaN(value)) return 0;
		return Math.max(0, Math.min(value, RAM_SIZE - RAM_COLS)) & ~(RAM_COLS - 1);
	});
	const ramRows = $derived.by(() => {
		void emulator.frame;
		const rows = [];
		for (let r = 0; r < RAM_ROWS; r++) {
			const addr = ramBase + r * RAM_COLS;
			if (addr >= RAM_SIZE) break;
			rows.push({ addr, words: Array.from(cpu.ram.subarray(addr, addr + RAM_COLS)) });
		}
		return rows;
	});

	function moveRam(delta: number) {
		ramBaseText = '0x' + hex(Math.max(0, Math.min(ramBase + delta, RAM_SIZE - RAM_COLS)));
	}

	const REG_NOTES: Record<number, string> = { 0: 'zero', 14: 'tmp', 15: 'sp' };
</script>

<section class="panel">
	<header>
		<h2>CPU</h2>
		<span class="dim mono">
			{snapshot.instructions.toLocaleString()} instr · {(snapshot.clocks / CLOCK_HZ).toFixed(3)} s
		</span>
	</header>

	<div class="pc mono">
		<span class="dim">PC</span>
		<b>{hex(snapshot.pc)}</b>
		<span class="dim">{snapshot.pc}{pcLine ? ` · line ${pcLine}` : ''}</span>
	</div>

	<div class="regs mono">
		{#each snapshot.regs as value, i (i)}
			<div class="reg" title="R{i}{REG_NOTES[i] ? ` (${REG_NOTES[i]})` : ''} = {value} / {signed16(value)}">
				<span class="dim">${i}</span>
				<b>{hex(value)}</b>
				<span class="dim dec">{value}</span>
			</div>
		{/each}
	</div>

	<div class="flags mono">
		{#each FLAG_NAMES as name, i (i)}
			{#if name !== '-'}
				<span class="flag" class:on={(snapshot.flags >> i) & 1} title="flag bit {i}">{name}</span>
			{/if}
		{/each}
	</div>

	<div class="tabs">
		<button class:active={tab === 'rom'} onclick={() => (tab = 'rom')}>Instructions</button>
		<button class:active={tab === 'ram'} onclick={() => (tab = 'ram')}>RAM</button>
		<span class="spacer"></span>
		{#if tab === 'rom'}
			<label><input type="checkbox" bind:checked={followPc} /> follow PC</label>
			{#if !followPc}
				<input class="addr" type="number" min="0" max="13311" bind:value={romBase} />
			{/if}
		{:else}
			<button onclick={() => moveRam(-RAM_ROWS * RAM_COLS)}>▲</button>
			<button onclick={() => moveRam(RAM_ROWS * RAM_COLS)}>▼</button>
			<input class="addr" bind:value={ramBaseText} title="RAM address (decimal or 0x hex)" />
			<button onclick={() => (ramBaseText = '0x' + hex(snapshot.regs[15] & (RAM_SIZE - 1)))}>SP</button>
		{/if}
	</div>

	{#if tab === 'rom'}
		<table class="mono listing">
			<tbody>
				{#each romRows as row (row.addr)}
					<tr class:current={row.addr === snapshot.pc}>
						<td class="bp">{row.breakpoint ? '●' : ''}</td>
						<td class="dim">{hex(row.addr)}</td>
						<td class="dim">{hex(row.word, 8)}</td>
						<td>{row.text}</td>
						<td class="dim">{row.line ? `:${row.line}` : ''}</td>
					</tr>
				{/each}
			</tbody>
		</table>
	{:else}
		<table class="mono listing">
			<tbody>
				{#each ramRows as row (row.addr)}
					<tr>
						<td class="dim">{hex(row.addr)}</td>
						{#each row.words as word, i (i)}
							<td class:zero={word === 0} title="#{row.addr + i} = {word}">{hex(word)}</td>
						{/each}
					</tr>
				{/each}
			</tbody>
		</table>
	{/if}
</section>

<style>
	.pc {
		display: flex;
		gap: 8px;
		align-items: baseline;
		margin-bottom: 6px;
	}
	.regs {
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 2px 10px;
	}
	.reg {
		display: flex;
		gap: 6px;
		align-items: baseline;
		white-space: nowrap;
	}
	.reg .dim:first-child {
		width: 3ch;
		text-align: right;
	}
	.dec {
		font-size: 11px;
	}
	.flags {
		display: flex;
		flex-wrap: wrap;
		gap: 4px;
		margin: 8px 0;
	}
	.flag {
		padding: 1px 5px;
		border-radius: 3px;
		border: 1px solid var(--border);
		color: var(--muted);
		font-size: 11px;
	}
	.flag.on {
		background: var(--accent);
		border-color: var(--accent);
		color: #08111f;
	}
	.tabs {
		display: flex;
		gap: 4px;
		align-items: center;
		margin-bottom: 4px;
		font-size: 12px;
	}
	.tabs button.active {
		background: var(--accent);
		color: #08111f;
		border-color: var(--accent);
	}
	.spacer {
		flex: 1;
	}
	.addr {
		width: 8ch;
	}
	.listing {
		border-collapse: collapse;
		font-size: 12px;
	}
	.listing td {
		padding: 0 12px 0 0;
		white-space: nowrap;
	}
	.listing tr.current {
		background: rgba(242, 193, 78, 0.22);
	}
	.bp {
		color: var(--red);
		width: 1ch;
	}
	.zero {
		color: var(--muted);
	}
</style>
