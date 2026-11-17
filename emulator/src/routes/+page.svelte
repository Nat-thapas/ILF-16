<script lang="ts">
	import { onMount } from 'svelte';
	import vgaDemo from '../../../examples/vga-demo.asm?raw';
	import badApple from '../../../examples/bad-apple.asm?raw';
	import blocks from '../../../examples/blocks.asm?raw';
	import cube from '../../../examples/cube.asm?raw';
	import fire from '../../../examples/fire.asm?raw';
	import gameOfLife from '../../../examples/game-of-life.asm?raw';
	import mandelbrot from '../../../examples/mandelbrot.asm?raw';
	import mandelbrotZoom from '../../../examples/mandelbrot-zoom.asm?raw';
	import numbers from '../../../examples/numbers.asm?raw';
	import raycaster from '../../../examples/raycaster.asm?raw';
	import snake from '../../../examples/snake.asm?raw';
	import badAppleC from '../../../examples/bad-apple.c?raw';
	import blocksC from '../../../examples/blocks.c?raw';
	import cubeC from '../../../examples/cube.c?raw';
	import fireC from '../../../examples/fire.c?raw';
	import gameOfLifeC from '../../../examples/game-of-life.c?raw';
	import mandelbrotC from '../../../examples/mandelbrot.c?raw';
	import mandelbrotZoomC from '../../../examples/mandelbrot-zoom.c?raw';
	import numbersC from '../../../examples/numbers.c?raw';
	import raycasterC from '../../../examples/raycaster.c?raw';
	import snakeC from '../../../examples/snake.c?raw';
	import vgaDemoC from '../../../examples/vga-demo.c?raw';
	import Debugger from '#lib/components/Debugger.svelte';
	import Display from '#lib/components/Display.svelte';
	import Editor from '#lib/components/Editor.svelte';
	import IoPanel from '#lib/components/IoPanel.svelte';
	import { assemble, parseCoe, programFromImages, toCoe } from '#lib/core/assembler.ts';
	import { disassembleListing } from '#lib/core/disasm.ts';
	import { profileLines, type LineProfile } from '#lib/core/profile.ts';
	import { emulator, type Language } from '#lib/emulator.svelte.ts';
	import { settings } from '#lib/settings.svelte.ts';

	const EXAMPLES: Record<string, string> = {
		'vga-demo.asm': vgaDemo,
		'bad-apple.asm': badApple,
		'mandelbrot.asm': mandelbrot,
		'mandelbrot-zoom.asm': mandelbrotZoom,
		'game-of-life.asm': gameOfLife,
		'snake.asm': snake,
		'cube.asm': cube,
		'numbers.asm': numbers,
		'raycaster.asm': raycaster,
		'blocks.asm': blocks,
		'fire.asm': fire
	};
	const C_EXAMPLES: Record<string, string> = {
		'vga-demo.c': vgaDemoC,
		'bad-apple.c': badAppleC,
		'mandelbrot.c': mandelbrotC,
		'mandelbrot-zoom.c': mandelbrotZoomC,
		'game-of-life.c': gameOfLifeC,
		'snake.c': snakeC,
		'cube.c': cubeC,
		'numbers.c': numbersC,
		'raycaster.c': raycasterC,
		'blocks.c': blocksC,
		'fire.c': fireC
	};
	const SOURCE_KEY = 'ilf16.source.v1';
	const NAME_KEY = 'ilf16.name.v1';
	const LANGUAGE_KEY = 'ilf16.language.v1';

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

	function loadSavedLanguage(): Language {
		try {
			return localStorage.getItem(LANGUAGE_KEY) === 'c' ? 'c' : 'asm';
		} catch {
			return 'asm';
		}
	}

	let source = loadSavedSource();
	/** Language of the source: assembly, or C that is compiled to assembly first. */
	let language = $state<Language>(loadSavedLanguage());
	const extension = $derived(language === 'c' ? 'c' : 'asm');
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

	function setLanguage(next: Language) {
		language = next;
		stale = true;
		try {
			localStorage.setItem(LANGUAGE_KEY, next);
		} catch {
			// Ignore: the language just won't persist.
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
	 * What the editor shows instead of the source, or '' when it shows the source: the name of a
	 * loaded .coe image (as its disassembly), or of the C program whose generated assembly is
	 * on show. Either is read-only, and `source` keeps the user's program meanwhile.
	 */
	let rawImage = $state('');
	/** The listing on show is assembly generated from the C source (not a .coe image). */
	let generated = $state(false);
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
		const ok = emulator.build(source, language);
		if (ok) {
			stale = false;
			const p = emulator.program!;
			const warnings = emulator.diagnostics.length;
			message =
				`${language === 'c' ? 'Compiled' : 'Assembled'}: ${p.rom.length} instructions, ${p.ram.length} RAM words` +
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

	const baseName = (fileName: string) => fileName.replace(/\.(asm|c|txt|(rom\.|ram\.)?coe)$/i, '') || 'program';
	const languageOf = (fileName: string): Language => (/\.c$/i.test(fileName) ? 'c' : 'asm');

	/** Put source in the editor (leaving a listing if one is on show) and assemble or compile it. */
	function showSource(text: string, name = sourceName, lang = language) {
		rawImage = '';
		generated = false;
		sourceName = name;
		saveName(name);
		setLanguage(lang);
		editor.setDoc(text);
		assembleSource();
	}

	function loadExample(name: string) {
		const text = EXAMPLES[name] ?? C_EXAMPLES[name];
		if (text) showSource(text, baseName(name), languageOf(name));
	}

	/** Show the assembly the C compiler generated, read-only, and run that. */
	function viewAssembly() {
		if (stale && !assembleSource()) return;
		const asm = emulator.program?.asm;
		if (!asm) return;
		const result = assemble(asm);
		if (!result.program) return;
		// the same code at the same addresses, so the variables are where they were
		result.program.debug = emulator.program?.debug;
		rawImage = `${saveAs()}.c`;
		generated = true;
		imageName = sourceName;
		editor.setDoc(asm);
		emulator.diagnostics = result.diagnostics;
		emulator.loadProgram(result.program);
		stale = false;
		message = `Assembly generated from ${rawImage}: ${result.program.rom.length} instructions`;
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
				generated = false;
				imageName = baseName(rom.name);
				editor.setDoc(disassembleListing(program.rom));
				emulator.diagnostics = [];
				emulator.loadProgram(program);
				stale = false;
				message = `Loaded ${rom.name}${ram ? ' + ' + ram.name : ' (no RAM image)'}: ${program.rom.length} instructions`;
			} else {
				showSource(await list[0].text(), baseName(list[0].name), languageOf(list[0].name));
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
		// With the generated assembly on show, that is what gets saved.
		if (generated) download(`${saveAs()}.asm`, editor.getDoc());
		else download(`${saveAs()}.${extension}`, source);
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

	// Heat map: how often each line has run since reset. Refreshed a few times a second while
	// running, and hidden while the source no longer matches the assembled program.
	let heat = $state.raw<LineProfile | null>(null);
	let heatTime = 0;
	$effect(() => {
		void emulator.frame;
		if (!settings.heatmap || stale || !emulator.program) {
			heat = null;
			return;
		}
		const now = performance.now();
		if (emulator.status === 'running' && now - heatTime < 250) return;
		heatTime = now;
		heat = profileLines(emulator.cpu, emulator.program);
	});

	// The bar between the editor and the rest can be dragged to resize the editor.
	let main: HTMLDivElement;
	let resizing = $state(false);
	function resizeEditor(event: PointerEvent) {
		if (!resizing) return;
		const box = main.getBoundingClientRect();
		// keep room for both sides
		const width = Math.max(240, Math.min(event.clientX - box.left, box.width - 360));
		settings.editorWidth = width / box.width;
	}

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
			<optgroup label="Assembly">
				{#each Object.keys(EXAMPLES) as name (name)}
					<option value={name}>{name}</option>
				{/each}
			</optgroup>
			<optgroup label="C">
				{#each Object.keys(C_EXAMPLES) as name (name)}
					<option value={name}>{name}</option>
				{/each}
			</optgroup>
		</select>
		<button onclick={() => fileInput.click()} title="Open an .asm or .c file, or .rom.coe (+ .ram.coe) images">
			Open…
		</button>
		<input
			bind:this={fileInput}
			type="file"
			accept=".asm,.c,.txt,.coe"
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
		<select
			aria-label="Language"
			title="Language of the source. C is compiled to assembly first."
			value={language}
			disabled={!!rawImage}
			onchange={(e) => setLanguage(e.currentTarget.value as Language)}
		>
			<option value="asm">Assembly</option>
			<option value="c">C</option>
		</select>
		<button onclick={saveSource} disabled={!!rawImage && !generated}>
			Save .{generated ? 'asm' : extension}
		</button>
		<button
			onclick={saveCoe}
			title="Assemble and save the .rom.coe and .ram.coe memory files for the FPGA block memories"
		>
			Save .coe
		</button>

		<span class="sep"></span>

		<button
			onclick={assembleSource}
			disabled={!!rawImage}
			title="{language === 'c' ? 'Compile' : 'Assemble'} the source and reset the CPU"
		>
			{language === 'c' ? 'Compile' : 'Assemble'}
		</button>
		{#if language === 'c' && !rawImage}
			<button onclick={viewAssembly} title="Show the assembly generated from the C source">
				View assembly
			</button>
		{/if}
		<button class="primary" onclick={runOrPause} title="Run / pause (F8)">
			{emulator.status === 'running' ? '⏸ Pause' : '▶ Run'}
		</button>
		<button
			onclick={step}
			disabled={emulator.status === 'running'}
			title={language === 'c' && !rawImage ? 'Run to the next line of the source (F10)' : 'Execute one instruction (F10)'}
		>
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

		<label
			title="Shade each line by how often it has run since the last reset, with its share of all executed instructions in the margin. Hover over a number for the exact count."
		>
			<input type="checkbox" bind:checked={settings.heatmap} />
			Heat map
		</label>

		<span class="status {emulator.status}">{STATUS_TEXT[emulator.status]}</span>
		{#if emulator.status === 'running'}
			<span class="mono dim">
				{emulator.mips.toFixed(2)} MIPS · {(emulator.realtimeRatio * 100).toFixed(0)}% of real time
			</span>
		{/if}
		{#if !rawImage && stale && emulator.program}
			<span class="dim">source changed — will {language === 'c' ? 're-compile' : 're-assemble'} on run</span>
		{/if}
	</div>

	<div class="main" bind:this={main} style:--editor-width="{settings.editorWidth * 100}%">
		<div class="left">
			{#if rawImage}
				<div class="image-banner">
					<span>
						{#if generated}
							<b>Assembly generated from {rawImage}</b> (read-only). Breakpoints, stepping and
							the heat map now work on these instructions.
						{:else}
							<b>Disassembly of {rawImage}</b> (read-only). This image is what is running;
							your source is kept and not in use.
						{/if}
					</span>
					<button onclick={() => showSource(source)}>Back to source</button>
				</div>
			{/if}
			<div class="editor-wrap">
				<Editor
					readOnly={!!rawImage}
					language={rawImage ? 'asm' : language}
					bind:this={editor}
					{initialDoc}
					{currentLine}
					{heat}
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

		<!-- svelte-ignore a11y_no_noninteractive_element_interactions -->
		<div
			class="splitter"
			class:active={resizing}
			role="separator"
			aria-orientation="vertical"
			title="Drag to resize the editor. Double-click for the usual width."
			onpointerdown={(e) => {
				resizing = true;
				e.currentTarget.setPointerCapture(e.pointerId);
				e.preventDefault();
			}}
			onpointermove={resizeEditor}
			onpointerup={() => (resizing = false)}
			onpointercancel={() => (resizing = false)}
			ondblclick={() => (settings.editorWidth = 0.4)}
		></div>

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
		grid-template-columns: var(--editor-width, 40%) 5px minmax(0, 1fr);
	}
	.left {
		display: flex;
		flex-direction: column;
		min-height: 0;
		min-width: 0;
	}
	.splitter {
		background: var(--border);
		cursor: col-resize;
		touch-action: none;
	}
	.splitter:hover,
	.splitter.active {
		background: var(--accent);
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
		.splitter {
			display: none;
		}
		.right {
			overflow: visible;
		}
		.top {
			grid-template-columns: 1fr;
		}
	}
</style>
