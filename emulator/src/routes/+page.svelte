<script lang="ts">
	import { onMount } from 'svelte';
	import vgaDemo from '../../../examples/vga-demo.asm?raw';
	import badApple from '../../../examples/bad-apple.asm?raw';
	import gameOfLife from '../../../examples/game-of-life.asm?raw';
	import mandelbrot from '../../../examples/mandelbrot.asm?raw';
	import snake from '../../../examples/snake.asm?raw';
	import Debugger from '#lib/components/Debugger.svelte';
	import Display from '#lib/components/Display.svelte';
	import Editor from '#lib/components/Editor.svelte';
	import IoPanel from '#lib/components/IoPanel.svelte';
	import { parseCoe, programFromImages, toCoe } from '#lib/core/assembler.ts';
	import { disassembleListing } from '#lib/core/disasm.ts';
	import { emulator } from '#lib/emulator.svelte.ts';
	import { settings } from '#lib/settings.svelte.ts';

	const EXAMPLES: Record<string, string> = {
		'vga-demo.asm': vgaDemo,
		'bad-apple.asm': badApple,
		'mandelbrot.asm': mandelbrot,
		'game-of-life.asm': gameOfLife,
		'snake.asm': snake
	};
	const SOURCE_KEY = 'ilf16.source.v1';
	const NAME_KEY = 'ilf16.name.v1';

	function loadSavedSource(): string {
		try {
			return localStorage.getItem(SOURCE_KEY) ?? vgaDemo;
		} catch {
			return vgaDemo;
		}
	}

	function loadSavedName(): string {
		try {
			return localStorage.getItem(NAME_KEY) ?? 'vga-demo';
		} catch {
			return 'vga-demo';
		}
	}

	let source = loadSavedSource();
	/** File name (without extension) of the source, used to name saved files. */
	let sourceName = $state(loadSavedName());
	/** Same for the loaded .coe image, when there is one. */
	let imageName = $state('');

	function saveName(name: string) {
		try {
			localStorage.setItem(NAME_KEY, name);
		} catch {
			// Ignore: the name just won't persist.
		}
	}

	/** The name shown in the toolbar: opening a file or example sets it, and it can be edited. */
	const fileName = {
		get value() {
			return rawImage ? imageName : sourceName;
		},
		set value(name: string) {
			if (rawImage) imageName = name;
			else {
				sourceName = name;
				saveName(name);
			}
		}
	};
	/** Name to save under: the field's text without characters that file names cannot have. */
	const saveAs = () => fileName.value.replace(/[\\/:*?"<>|]/g, '').trim() || 'program';
	const initialDoc = source;
	let editor: Editor;
	let fileInput: HTMLInputElement;

	/** Source edited since it was last assembled. */
	let stale = $state(true);
	/**
	 * Name of the loaded .coe image, or '' when running the editor's source. While an image is
	 * loaded the editor shows its read-only disassembly and `source` keeps the user's program.
	 */
	let rawImage = $state('');
	let message = $state('');
	let saveTimer = 0;

	function onDocChange(doc: string) {
		if (rawImage) return; // the editor is showing a disassembly, not the user's source
		source = doc;
		stale = true;
		clearTimeout(saveTimer);
		saveTimer = window.setTimeout(() => {
			try {
				localStorage.setItem(SOURCE_KEY, source);
			} catch {
				// Ignore: the source just won't persist.
			}
		}, 500);
	}

	function assembleSource(): boolean {
		const ok = emulator.assembleAndLoad(source);
		if (ok) {
			stale = false;
			const p = emulator.program!;
			const warnings = emulator.diagnostics.length;
			message =
				`Assembled: ${p.rom.length} instructions, ${p.ram.length} RAM words` +
				(warnings ? `, ${warnings} warning(s)` : '');
		} else {
			message = '';
		}
		return ok;
	}

	// Assemble whatever source was restored so the emulator is ready to run straight away.
	onMount(() => {
		assembleSource();
	});

	function runOrPause() {
		if (emulator.status === 'running') return emulator.pause();
		if (emulator.status === 'halted') emulator.reset();
		if (stale && !rawImage && !assembleSource()) return;
		emulator.run();
	}

	function step() {
		if (stale && !rawImage && !assembleSource()) return;
		emulator.step();
	}

	function reset() {
		if (stale && !rawImage) assembleSource();
		else emulator.reset();
	}

	const baseName = (fileName: string) => fileName.replace(/\.(asm|txt|(rom\.|ram\.)?coe)$/i, '') || 'program';

	/** Put assembly source in the editor (leaving disassembly view if needed) and assemble it. */
	function showSource(text: string, name = sourceName) {
		rawImage = '';
		sourceName = name;
		saveName(name);
		editor.setDoc(text);
		assembleSource();
	}

	function loadExample(name: string) {
		if (EXAMPLES[name]) showSource(EXAMPLES[name], baseName(name));
	}

	async function openFiles(files: FileList | null) {
		if (!files?.length) return;
		const list = Array.from(files);
		try {
			const coe = list.filter((f) => f.name.toLowerCase().endsWith('.coe'));
			if (coe.length) {
				const rom = coe.find((f) => !f.name.toLowerCase().includes('.ram.')) ?? null;
				const ram = coe.find((f) => f.name.toLowerCase().includes('.ram.')) ?? null;
				if (!rom) throw new Error('Select the .rom.coe file (optionally together with the .ram.coe)');
				const program = programFromImages(
					parseCoe(await rom.text()),
					ram ? parseCoe(await ram.text()) : []
				);
				rawImage = rom.name + (ram ? ' + ' + ram.name : '');
				imageName = baseName(rom.name);
				editor.setDoc(disassembleListing(program.rom));
				emulator.diagnostics = [];
				emulator.loadProgram(program);
				stale = false;
				message = `Loaded ${rom.name}${ram ? ' + ' + ram.name : ' (no RAM image)'}: ${program.rom.length} instructions`;
			} else {
				showSource(await list[0].text(), baseName(list[0].name));
			}
		} catch (e) {
			message = '';
			emulator.diagnostics = [{ severity: 'error', line: 0, message: (e as Error).message }];
		}
		fileInput.value = '';
	}

	function download(fileName: string, text: string) {
		const url = URL.createObjectURL(new Blob([text], { type: 'text/plain' }));
		const link = document.createElement('a');
		link.href = url;
		link.download = fileName;
		link.click();
		URL.revokeObjectURL(url);
	}

	function saveSource() {
		download(`${saveAs()}.asm`, source);
	}

	/** Save the assembled program as <name>.rom.coe and <name>.ram.coe, like assembler-deprecated.py did. */
	function saveCoe() {
		if (stale && !rawImage && !assembleSource()) return;
		const program = emulator.program;
		if (!program) return;
		const name = saveAs();
		download(`${name}.rom.coe`, toCoe(program.rom, 8));
		download(`${name}.ram.coe`, toCoe(program.ram, 4));
		message = `Saved ${name}.rom.coe (${program.rom.length} instructions) and ${name}.ram.coe (${program.ram.length} words)`;
	}

	// Highlight the next instruction whenever the CPU is stopped on valid, current source.
	const currentLine = $derived.by(() => {
		void emulator.frame;
		if (stale || !emulator.program) return 0;
		if (emulator.status !== 'paused' && emulator.status !== 'halted') return 0;
		return emulator.program.lineOfAddr[emulator.cpu.pc] ?? 0;
	});

	const STATUS_TEXT = {
		empty: 'No program',
		ready: 'Ready',
		running: 'Running',
		paused: 'Paused',
		halted: 'Halted'
	};

	function shortcuts(event: KeyboardEvent) {
		if (event.key === 'F8') {
			event.preventDefault();
			runOrPause();
		} else if (event.key === 'F10') {
			event.preventDefault();
			if (emulator.status !== 'running') step();
		}
	}
</script>

<svelte:window onkeydown={shortcuts} />

<div class="app">
	<div class="toolbar">
		<strong class="title">ILF-16 Emulator</strong>

		<select
			aria-label="Load example"
			onchange={(e) => {
				loadExample(e.currentTarget.value);
				e.currentTarget.value = '';
			}}
		>
			<option value="">Examples…</option>
			{#each Object.keys(EXAMPLES) as name (name)}
				<option value={name}>{name}</option>
			{/each}
		</select>
		<button onclick={() => fileInput.click()} title="Open an .asm file, or .rom.coe (+ .ram.coe) images">
			Open…
		</button>
		<input
			bind:this={fileInput}
			type="file"
			accept=".asm,.txt,.coe"
			multiple
			hidden
			onchange={(e) => openFiles(e.currentTarget.files)}
		/>
		<input
			class="file-name mono"
			type="text"
			aria-label="File name"
			title="Name used for saved files (without extension). Opening a file or an example replaces it."
			placeholder="program"
			spellcheck="false"
			bind:value={fileName.value}
		/>
		<button onclick={saveSource} disabled={!!rawImage}>Save .asm</button>
		<button
			onclick={saveCoe}
			title="Assemble and save the .rom.coe and .ram.coe memory files for the FPGA block memories"
		>
			Save .coe
		</button>

		<span class="sep"></span>

		<button onclick={assembleSource} disabled={!!rawImage} title="Assemble the source and reset the CPU">
			Assemble
		</button>
		<button class="primary" onclick={runOrPause} title="Run / pause (F8)">
			{emulator.status === 'running' ? '⏸ Pause' : '▶ Run'}
		</button>
		<button onclick={step} disabled={emulator.status === 'running'} title="Execute one instruction (F10)">
			Step
		</button>
		<button onclick={reset} title="Reset the CPU, RAM, outputs and display">Reset</button>

		<span class="sep"></span>

		<label title="Real time: 48 MHz clock, 12 MIPS, STL stalls for its true duration. Unlimited: as fast as this machine can go, STL takes no time.">
			Speed
			<select bind:value={settings.speed}>
				<option value="realtime">Real time (12 MIPS)</option>
				<option value="unlimited">Unlimited</option>
			</select>
		</label>

		<span class="status {emulator.status}">{STATUS_TEXT[emulator.status]}</span>
		{#if emulator.status === 'running'}
			<span class="mono dim">
				{emulator.mips.toFixed(2)} MIPS · {(emulator.realtimeRatio * 100).toFixed(0)}% of real time
			</span>
		{/if}
		{#if !rawImage && stale && emulator.program}
			<span class="dim">source changed — will re-assemble on run</span>
		{/if}
	</div>

	<div class="main">
		<div class="left">
			{#if rawImage}
				<div class="image-banner">
					<span>
						<b>Disassembly of {rawImage}</b> (read-only). This image is what is running;
						your source is kept and not in use.
					</span>
					<button onclick={() => showSource(source)}>Back to source</button>
				</div>
			{/if}
			<div class="editor-wrap">
				<Editor
					readOnly={!!rawImage}
					bind:this={editor}
					{initialDoc}
					{currentLine}
					diagnostics={emulator.diagnostics}
					{onDocChange}
					onBreakpointsChange={(lines) => emulator.setBreakLines(lines)}
				/>
			</div>
			<div class="messages mono">
				{#each emulator.diagnostics as d, i (i)}
					<div class={d.severity}>
						{d.severity}{d.line ? ` (line ${d.line})` : ''}: {d.message}
					</div>
				{:else}
					<div class="dim">{message || 'Click the gutter to set breakpoints. F8 run/pause, F10 step.'}</div>
				{/each}
				{#if emulator.diagnostics.length && message}
					<div class="dim">{message}</div>
				{/if}
			</div>
		</div>

		<div class="right">
			<div class="top">
				<Display />
				<Debugger />
			</div>
			<IoPanel />
		</div>
	</div>
</div>

<style>
	.app {
		height: 100vh;
		display: flex;
		flex-direction: column;
	}
	.toolbar {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		gap: 8px;
		padding: 8px 12px;
		border-bottom: 1px solid var(--border);
		background: var(--panel);
	}
	.title {
		margin-right: 8px;
	}
	.file-name {
		width: 130px;
	}
	.sep {
		width: 1px;
		height: 20px;
		background: var(--border);
	}
	.primary {
		background: var(--accent);
		border-color: var(--accent);
		color: #08111f;
		font-weight: 600;
		min-width: 86px;
	}
	.status {
		padding: 2px 8px;
		border-radius: 10px;
		border: 1px solid var(--border);
		font-size: 12px;
	}
	.status.running {
		color: var(--green);
		border-color: var(--green);
	}
	.status.paused {
		color: var(--yellow);
		border-color: var(--yellow);
	}
	.status.halted {
		color: var(--red);
		border-color: var(--red);
	}
	.main {
		flex: 1;
		min-height: 0;
		display: grid;
		grid-template-columns: minmax(320px, 2fr) minmax(0, 3fr);
	}
	.left {
		display: flex;
		flex-direction: column;
		min-height: 0;
		min-width: 0;
		border-right: 1px solid var(--border);
	}
	.image-banner {
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 10px;
		padding: 6px 10px;
		background: rgba(242, 193, 78, 0.14);
		border-bottom: 1px solid var(--yellow);
		color: var(--yellow);
		font-size: 12px;
	}
	.image-banner button {
		white-space: nowrap;
	}
	.editor-wrap {
		flex: 1;
		min-height: 0;
	}
	.messages {
		max-height: 130px;
		overflow: auto;
		padding: 6px 10px;
		border-top: 1px solid var(--border);
		background: var(--panel);
		font-size: 12px;
	}
	.messages .error {
		color: var(--red);
	}
	.messages .warning {
		color: var(--yellow);
	}
	.right {
		overflow: auto;
		padding: 10px;
		display: flex;
		flex-direction: column;
		gap: 10px;
		min-width: 0;
	}
	.top {
		display: grid;
		grid-template-columns: auto minmax(300px, 1fr);
		gap: 10px;
		align-items: start;
	}
	@media (max-width: 1100px) {
		.main {
			grid-template-columns: 1fr;
			grid-template-rows: 50vh auto;
			overflow: auto;
		}
		.right {
			overflow: visible;
		}
		.top {
			grid-template-columns: 1fr;
		}
	}
</style>
