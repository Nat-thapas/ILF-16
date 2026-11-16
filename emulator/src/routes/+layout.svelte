<script lang="ts">
	import favicon from '#lib/assets/favicon.svg';
	import type { LayoutProps } from './$types';

	let { children }: LayoutProps = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<title>ILF-16 Emulator</title>
</svelte:head>

{@render children()}

<style>
	:global(:root) {
		--bg: #0f131a;
		--panel: #171c26;
		--panel-2: #1d2430;
		--border: #2c3545;
		--text: #d8dee9;
		--muted: #7b879b;
		--accent: #7cb7ff;
		--green: #7ee0a3;
		--red: #ff5d6c;
		--yellow: #f2c14e;
		--mono: ui-monospace, 'Cascadia Mono', 'Cascadia Code', Consolas, 'SF Mono', Menlo, monospace;
		color-scheme: dark;
	}
	:global(html, body) {
		height: 100%;
		margin: 0;
	}
	:global(body) {
		background: var(--bg);
		color: var(--text);
		font: 13px/1.4 system-ui, 'Segoe UI', sans-serif;
	}
	:global(button, select, input) {
		font: inherit;
		color: var(--text);
		background: var(--panel-2);
		border: 1px solid var(--border);
		border-radius: 4px;
		padding: 3px 8px;
	}
	:global(button) {
		cursor: pointer;
	}
	:global(button:hover:not(:disabled)) {
		border-color: var(--accent);
	}
	:global(button:disabled) {
		opacity: 0.45;
		cursor: default;
	}
	:global(input[type='checkbox']) {
		padding: 0;
		vertical-align: -2px;
	}
	:global(.mono) {
		font-family: var(--mono);
	}
	:global(.dim) {
		color: var(--muted);
		font-weight: normal;
	}
	:global(.panel) {
		background: var(--panel);
		border: 1px solid var(--border);
		border-radius: 8px;
		padding: 10px 12px;
		min-width: 0;
	}
	:global(.panel > header) {
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 8px;
		margin-bottom: 8px;
		font-size: 12px;
	}
	:global(.panel h2) {
		margin: 0;
		font-size: 13px;
		font-weight: 600;
	}
</style>
