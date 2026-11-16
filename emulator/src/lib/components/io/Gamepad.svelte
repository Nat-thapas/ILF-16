<script lang="ts">
	// Digital controller: three d-pads (bits 0-3, 4-7, 8-11 = up, down, left, right) and four
	// buttons (bits 12-15 = A, B, X, Y). Every control can be bound to a keyboard key.
	import { onMount } from 'svelte';
	import { DEFAULT_KEYS, settings } from '#lib/settings.svelte.ts';

	interface Props {
		value: number;
		onchange: (value: number) => void;
	}
	let { value, onchange }: Props = $props();

	let binding = $state(false);
	let bindTarget = $state(-1);
	// Bits held by the pointer and by the keyboard are tracked separately.
	let pointerBits = 0;
	let keyBits = 0;

	const emit = () => onchange(pointerBits | keyBits);

	onMount(() => onchange(0));

	function keyLabel(code: string): string {
		if (!code) return '—';
		const arrows: Record<string, string> = { ArrowUp: '↑', ArrowDown: '↓', ArrowLeft: '←', ArrowRight: '→' };
		if (arrows[code]) return arrows[code];
		if (code === 'Space') return '␣';
		return code.replace(/^(Key|Digit)/, '').replace(/^Numpad/, 'N');
	}

	function isTyping(target: EventTarget | null): boolean {
		const el = target as HTMLElement | null;
		return !!el && (el.isContentEditable || ['INPUT', 'TEXTAREA', 'SELECT'].includes(el.tagName));
	}

	function keydown(event: KeyboardEvent) {
		if (binding && bindTarget >= 0) {
			event.preventDefault();
			if (event.code !== 'Escape') {
				// A key drives one control only: take it away from any other control.
				settings.keys.forEach((code, i) => {
					if (code === event.code) settings.keys[i] = '';
				});
				settings.keys[bindTarget] = event.code;
			}
			bindTarget = -1;
			return;
		}
		if (binding || isTyping(event.target) || event.ctrlKey || event.metaKey || event.altKey) return;
		const bit = settings.keys.indexOf(event.code);
		if (bit < 0) return;
		event.preventDefault();
		keyBits |= 1 << bit;
		emit();
	}

	function keyup(event: KeyboardEvent) {
		const bit = settings.keys.indexOf(event.code);
		if (bit < 0 || !(keyBits & (1 << bit))) return;
		keyBits &= ~(1 << bit);
		emit();
	}

	function blur() {
		keyBits = 0;
		emit();
	}

	function press(event: PointerEvent, bit: number) {
		if (binding) {
			bindTarget = bit;
			return;
		}
		(event.currentTarget as HTMLElement).setPointerCapture(event.pointerId);
		pointerBits |= 1 << bit;
		emit();
	}
	function release(bit: number) {
		if (!(pointerBits & (1 << bit))) return;
		pointerBits &= ~(1 << bit);
		emit();
	}

	const DIRECTIONS = [
		{ offset: 0, area: 'up', symbol: '▲' },
		{ offset: 1, area: 'down', symbol: '▼' },
		{ offset: 2, area: 'left', symbol: '◀' },
		{ offset: 3, area: 'right', symbol: '▶' }
	];
	const BUTTONS = ['A', 'B', 'X', 'Y'];
</script>

<svelte:window onkeydown={keydown} onkeyup={keyup} onblur={blur} />

{#snippet control(bit: number, symbol: string, area: string)}
	<button
		class="ctl"
		class:on={(value >> bit) & 1}
		class:target={bindTarget === bit}
		style:grid-area={area}
		title="bit {bit} · key {keyLabel(settings.keys[bit])}"
		onpointerdown={(e) => press(e, bit)}
		onpointerup={() => release(bit)}
		onpointercancel={() => release(bit)}
		onlostpointercapture={() => release(bit)}
	>
		<span>{symbol}</span>
		<small>{bindTarget === bit ? '?' : keyLabel(settings.keys[bit])}</small>
	</button>
{/snippet}

<div class="gamepad">
	<div class="controls">
		{#each [0, 1, 2] as pad (pad)}
			<div class="dpad">
				{#each DIRECTIONS as dir (dir.offset)}
					{@render control(pad * 4 + dir.offset, dir.symbol, dir.area)}
				{/each}
			</div>
		{/each}
		<div class="buttons">
			{#each BUTTONS as name, i (name)}
				{@render control(12 + i, name, 'auto')}
			{/each}
		</div>
	</div>
	<div class="bind">
		<button class:active={binding} onclick={() => ((binding = !binding), (bindTarget = -1))}>
			{binding ? 'Done' : 'Bind keys'}
		</button>
		{#if binding}
			<span class="dim">
				{bindTarget >= 0 ? 'Press a key (Esc cancels)…' : 'Click a control, then press a key'}
			</span>
			<button onclick={() => (settings.keys = [...DEFAULT_KEYS])}>Defaults</button>
		{/if}
	</div>
</div>

<style>
	.gamepad {
		display: flex;
		flex-direction: column;
		gap: 6px;
	}
	.controls {
		display: flex;
		flex-wrap: wrap;
		gap: 10px;
		align-items: center;
	}
	.dpad {
		display: grid;
		grid-template-areas: '. up .' 'left . right' '. down .';
		grid-template-columns: repeat(3, 24px);
		grid-template-rows: repeat(3, 24px);
	}
	.buttons {
		display: grid;
		grid-template-columns: repeat(2, 26px);
		gap: 4px;
	}
	.ctl {
		width: 24px;
		height: 24px;
		padding: 0;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		line-height: 1;
		font-size: 9px;
		background: #2a3242;
		touch-action: none;
	}
	.buttons .ctl {
		width: 26px;
		height: 26px;
		border-radius: 50%;
	}
	.ctl small {
		font-family: var(--mono);
		font-size: 8px;
		color: var(--muted);
	}
	.ctl.on {
		background: var(--accent);
		border-color: var(--accent);
		color: #08111f;
	}
	.ctl.on small {
		color: #08111f;
	}
	.ctl.target {
		border-color: var(--yellow);
		box-shadow: 0 0 0 1px var(--yellow);
	}
	.bind {
		display: flex;
		gap: 6px;
		align-items: center;
		font-size: 11px;
	}
	.bind button {
		font-size: 11px;
		padding: 1px 6px;
	}
	.bind button.active {
		background: var(--accent);
		color: #08111f;
		border-color: var(--accent);
	}
</style>
