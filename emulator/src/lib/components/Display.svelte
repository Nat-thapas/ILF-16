<script lang="ts">
	import { onMount } from 'svelte';
	import { DISPLAY_SIZE } from '#lib/core/cpu.ts';
	import { emulator } from '#lib/emulator.svelte.ts';
	import { DEFAULT_PALETTE, PALETTE_NAMES, settings } from '#lib/settings.svelte.ts';

	let canvas: HTMLCanvasElement;
	let ctx: CanvasRenderingContext2D | null = null;
	let image: ImageData | undefined;
	let pixels: Uint32Array | undefined;

	/** Palette as little-endian ABGR words for direct ImageData writes. */
	const lut = $derived.by(() => {
		const table = new Uint32Array(16);
		settings.palette.forEach((colour, i) => {
			const rgb = parseInt(colour.slice(1), 16);
			table[i] = 0xff000000 | ((rgb & 0xff) << 16) | (rgb & 0xff00) | (rgb >>> 16);
		});
		return table;
	});

	let lastLut: Uint32Array | undefined;

	onMount(() => {
		ctx = canvas.getContext('2d');
		image = ctx!.createImageData(DISPLAY_SIZE, DISPLAY_SIZE);
		pixels = new Uint32Array(image.data.buffer);
	});

	$effect(() => {
		void emulator.frame;
		const table = lut;
		if (!ctx || !image || !pixels) return;
		const cpu = emulator.cpu;
		if (!cpu.vramDirty && table === lastLut) return;
		cpu.vramDirty = false;
		lastLut = table;
		const vram = cpu.vram;
		for (let i = 0; i < vram.length; i++) pixels[i] = table[vram[i]];
		ctx.putImageData(image, 0, 0);
	});

	const size = $derived(DISPLAY_SIZE * settings.displayScale);
</script>

<section class="panel">
	<header>
		<h2>Display <span class="dim">256×256</span></h2>
		<label>
			Scale
			<select bind:value={settings.displayScale}>
				{#each [1, 2, 3, 4] as scale (scale)}
					<option value={scale}>{scale}×</option>
				{/each}
			</select>
		</label>
	</header>
	<div class="screen">
		<canvas
			bind:this={canvas}
			width={DISPLAY_SIZE}
			height={DISPLAY_SIZE}
			style:width="{size}px"
			style:height="{size}px"
		></canvas>
	</div>
	<details>
		<summary>Colour palette</summary>
		<div class="palette">
			{#each settings.palette as _, i (i)}
				<label title="{i} (0x{i.toString(16).toUpperCase()}) {PALETTE_NAMES[i]}">
					<input type="color" bind:value={settings.palette[i]} />
					<span>{i.toString(16).toUpperCase()}</span>
				</label>
			{/each}
		</div>
		<button onclick={() => (settings.palette = [...DEFAULT_PALETTE])}>Reset to ILF-GFX default</button>
	</details>
</section>

<style>
	.screen {
		display: flex;
		justify-content: center;
		overflow: auto;
	}
	canvas {
		image-rendering: pixelated;
		background: #000;
		border: 1px solid var(--border);
		flex: none;
	}
	details {
		margin-top: 8px;
	}
	summary {
		cursor: pointer;
		color: var(--muted);
	}
	.palette {
		display: grid;
		grid-template-columns: repeat(8, 1fr);
		gap: 6px;
		margin: 8px 0;
	}
	.palette label {
		display: flex;
		flex-direction: column;
		align-items: center;
		font-family: var(--mono);
		font-size: 11px;
		color: var(--muted);
	}
	input[type='color'] {
		width: 28px;
		height: 24px;
		padding: 0;
		border: 1px solid var(--border);
		background: none;
		cursor: pointer;
	}
</style>
