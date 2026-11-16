<script lang="ts">
	// 4x4 LED matrix: bit 0 is top-left, bits run left to right, top to bottom.
	let { value }: { value: number } = $props();
	const bits = Array.from({ length: 16 }, (_, i) => i);
</script>

<div class="matrix">
	{#each bits as bit (bit)}
		<span class="led" class:on={(value >> bit) & 1} title="bit {bit}"></span>
	{/each}
</div>

<style>
	.matrix {
		display: grid;
		grid-template-columns: repeat(4, 14px);
		gap: 4px;
		padding: 5px;
		background: #0b0e14;
		border: 1px solid var(--border);
		border-radius: 4px;
		width: max-content;
	}
	.led {
		width: 14px;
		height: 14px;
		border-radius: 50%;
		box-sizing: border-box;
		background: #2b2f38;
		border: 1px solid #454c5a;
	}
	.led.on {
		background: #ff3b4e;
		border-color: #ffb3ba;
		box-shadow: 0 0 7px 1px #ff3b4e;
	}
</style>
