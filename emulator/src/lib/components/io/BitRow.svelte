<script lang="ts">
	// 16 bits, MSB on the left. Used for switches (toggle), buttons (momentary) and LEDs (read-only).
	interface Props {
		value: number;
		mode: 'switch' | 'button' | 'led';
		onchange?: (value: number) => void;
	}
	let { value, mode, onchange }: Props = $props();

	const bits = Array.from({ length: 16 }, (_, i) => 15 - i);

	function press(event: PointerEvent, bit: number) {
		(event.currentTarget as HTMLElement).setPointerCapture(event.pointerId);
		onchange?.(value | (1 << bit));
	}
	function release(bit: number) {
		onchange?.(value & ~(1 << bit));
	}
</script>

<div class="row">
	{#each bits as bit (bit)}
		{@const on = ((value >> bit) & 1) === 1}
		<div class="cell" class:gap={bit % 4 === 0 && bit !== 0}>
			{#if mode === 'led'}
				<span class="led" class:on title="bit {bit}"></span>
			{:else if mode === 'switch'}
				<button
					class="switch"
					class:on
					role="switch"
					aria-checked={on}
					aria-label="bit {bit}"
					title="bit {bit}"
					onclick={() => onchange?.(value ^ (1 << bit))}
				>
					<span class="knob"></span>
				</button>
			{:else}
				<button
					class="push"
					class:on
					aria-label="bit {bit}"
					title="bit {bit}"
					onpointerdown={(e) => press(e, bit)}
					onpointerup={() => release(bit)}
					onpointercancel={() => release(bit)}
					onlostpointercapture={() => release(bit)}
				></button>
			{/if}
			<span class="label">{bit.toString(16).toUpperCase()}</span>
		</div>
	{/each}
</div>

<style>
	.row {
		display: flex;
		gap: 2px;
	}
	.cell {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1px;
	}
	.cell.gap {
		margin-right: 5px;
	}
	.label {
		font-family: var(--mono);
		font-size: 9px;
		color: var(--muted);
		line-height: 1;
	}
	.led {
		box-sizing: border-box;
		width: 12px;
		height: 12px;
		border-radius: 50%;
		background: #2b2f38;
		border: 1px solid #454c5a;
	}
	.led.on {
		background: #ff3b4e;
		border-color: #ffb3ba;
		box-shadow: 0 0 6px 1px #ff3b4e;
	}
	.switch {
		width: 11px;
		height: 22px;
		padding: 1px;
		border-radius: 3px;
		background: #11161f;
		display: flex;
		align-items: flex-end;
	}
	.switch .knob {
		width: 100%;
		height: 9px;
		border-radius: 2px;
		background: var(--muted);
	}
	.switch.on {
		align-items: flex-start;
		border-color: var(--green);
	}
	.switch.on .knob {
		background: var(--green);
	}
	.push {
		width: 11px;
		height: 16px;
		padding: 0;
		border-radius: 3px;
		background: #2a3242;
		touch-action: none;
	}
	.push.on {
		background: var(--accent);
		border-color: var(--accent);
		transform: translateY(1px);
	}
</style>
