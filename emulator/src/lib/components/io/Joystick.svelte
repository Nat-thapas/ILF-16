<script lang="ts">
	// Analog stick: low byte = signed X (right positive), high byte = signed Y (up positive),
	// each in the symmetric range -127..+127.
	import { onMount } from 'svelte';
	import { signed16 } from '#lib/format.ts';

	interface Props {
		value: number;
		onchange: (value: number) => void;
	}
	let { value, onchange }: Props = $props();

	const SIZE = 104;
	let hold = $state(false);
	let dragging = $state(false);

	const x = $derived(((value & 0xff) << 24) >> 24);
	const y = $derived(signed16(value) >> 8);

	onMount(() => onchange(0));

	function update(event: PointerEvent) {
		const rect = (event.currentTarget as HTMLElement).getBoundingClientRect();
		// Symmetric range: -127..+127 on both axes, 0 in the centre.
		const axis = (fraction: number) => Math.max(-127, Math.min(127, Math.round((fraction * 2 - 1) * 127)));
		const nx = axis((event.clientX - rect.left) / rect.width);
		const ny = -axis((event.clientY - rect.top) / rect.height);
		onchange(((ny & 0xff) << 8) | (nx & 0xff));
	}
	function down(event: PointerEvent) {
		(event.currentTarget as HTMLElement).setPointerCapture(event.pointerId);
		dragging = true;
		update(event);
	}
	function move(event: PointerEvent) {
		if (dragging) update(event);
	}
	function up() {
		if (!dragging) return;
		dragging = false;
		if (!hold) onchange(0);
	}
</script>

<div class="joystick">
	<div
		class="pad"
		style:width="{SIZE}px"
		style:height="{SIZE}px"
		role="slider"
		aria-label="Analog stick"
		aria-valuenow={x}
		tabindex="-1"
		onpointerdown={down}
		onpointermove={move}
		onpointerup={up}
		onpointercancel={up}
	>
		<span class="knob" style:left="{((x + 127) / 254) * 100}%" style:top="{((127 - y) / 254) * 100}%"></span>
	</div>
	<div class="info mono">
		<span>X {x}</span>
		<span>Y {y}</span>
		<label title="Keep the position when the mouse is released">
			<input type="checkbox" bind:checked={hold} onchange={() => !hold && onchange(0)} /> hold
		</label>
	</div>
</div>

<style>
	.joystick {
		display: flex;
		gap: 10px;
		align-items: center;
	}
	.pad {
		position: relative;
		border-radius: 4px;
		background:
			linear-gradient(var(--border), var(--border)) center / 1px 100% no-repeat,
			linear-gradient(var(--border), var(--border)) center / 100% 1px no-repeat,
			#0b0e14;
		border: 1px solid var(--border);
		cursor: crosshair;
		touch-action: none;
		flex: none;
	}
	.knob {
		position: absolute;
		width: 22px;
		height: 22px;
		margin: -11px 0 0 -11px;
		border-radius: 50%;
		background: var(--accent);
		pointer-events: none;
	}
	.info {
		display: flex;
		flex-direction: column;
		gap: 2px;
		font-size: 12px;
	}
</style>
