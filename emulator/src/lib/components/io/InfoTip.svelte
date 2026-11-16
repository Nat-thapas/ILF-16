<script lang="ts">
	// Small "i" button that shows explanatory lines on hover or keyboard focus.
	let { lines, label }: { lines: string[]; label: string } = $props();
</script>

<span class="info">
	<button type="button" aria-label={label}>i</button>
	<span class="tip" role="tooltip">
		{#each lines as line, i (i)}
			<span>{line}</span>
		{/each}
	</span>
</span>

<style>
	.info {
		position: relative;
		display: inline-flex;
	}
	button {
		width: 16px;
		height: 16px;
		padding: 0;
		border-radius: 50%;
		font: italic 600 11px/1 Georgia, serif;
		color: var(--accent);
		cursor: help;
	}
	.tip {
		display: none;
		position: absolute;
		top: 20px;
		right: -4px;
		z-index: 20;
		width: 236px;
		padding: 6px 8px;
		flex-direction: column;
		gap: 3px;
		background: #0b0e14;
		border: 1px solid var(--accent);
		border-radius: 6px;
		box-shadow: 0 4px 14px rgba(0, 0, 0, 0.5);
		font-size: 11.5px;
		line-height: 1.35;
		color: var(--text);
	}
	.info:hover .tip,
	button:focus-visible + .tip {
		display: flex;
	}
</style>
