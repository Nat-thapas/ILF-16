<script lang="ts">
	import { formatWord, parseWord, type Base } from '#lib/format.ts';

	interface Props {
		value: number;
		signed: boolean;
		base: Base;
		/** Omit for a read-only (output) field. */
		onchange?: (value: number) => void;
	}
	let { value, signed = $bindable(), base = $bindable(), onchange }: Props = $props();

	const format = $derived({ signed, base });
	let text = $state('');
	let editing = $state(false);
	const invalid = $derived(editing && parseWord(text, format) === null);

	// Show the live value unless the user is in the middle of typing.
	$effect(() => {
		const formatted = formatWord(value, format);
		if (!editing) text = formatted;
	});

	function input() {
		const parsed = parseWord(text, format);
		if (parsed !== null) onchange?.(parsed);
	}

	const bases: { value: Base; label: string }[] = [
		{ value: 2, label: 'bin' },
		{ value: 8, label: 'oct' },
		{ value: 10, label: 'dec' },
		{ value: 16, label: 'hex' }
	];
</script>

<div class="int">
	{#if onchange}
		<input
			class="value"
			class:invalid
			bind:value={text}
			oninput={input}
			onfocus={() => (editing = true)}
			onblur={() => (editing = false)}
			spellcheck="false"
		/>
	{:else}
		<output class="value">{formatWord(value, format)}</output>
	{/if}
	<select bind:value={base} title="Number base">
		{#each bases as option (option.value)}
			<option value={option.value}>{option.label}</option>
		{/each}
	</select>
	<label title="Interpret as two's complement"><input type="checkbox" bind:checked={signed} /> signed</label>
</div>

<style>
	.int {
		display: flex;
		flex-wrap: wrap;
		gap: 6px;
		align-items: center;
		font-size: 12px;
	}
	.value {
		font-family: var(--mono);
		font-size: 13px;
		width: 19ch;
		box-sizing: border-box;
	}
	output.value {
		padding: 3px 6px;
		background: #0b0e14;
		border: 1px solid var(--border);
		border-radius: 4px;
		color: var(--green);
	}
	.invalid {
		border-color: var(--red);
		outline: none;
	}
</style>
