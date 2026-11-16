<script lang="ts">
	import { emulator } from '#lib/emulator.svelte.ts';
	import { hex } from '#lib/format.ts';
	import { settings, type InputKind, type OutputKind } from '#lib/settings.svelte.ts';
	import BitRow from './io/BitRow.svelte';
	import Gamepad from './io/Gamepad.svelte';
	import InfoTip from './io/InfoTip.svelte';
	import IntField from './io/IntField.svelte';
	import Joystick from './io/Joystick.svelte';
	import LedMatrix from './io/LedMatrix.svelte';

	const INPUT_KINDS: { value: InputKind; label: string }[] = [
		{ value: 'switches', label: 'Switches' },
		{ value: 'buttons', label: 'Buttons' },
		{ value: 'gamepad', label: 'Game controller' },
		{ value: 'joystick', label: 'Analog stick' },
		{ value: 'integer', label: 'Integer' }
	];
	const OUTPUT_KINDS: { value: OutputKind; label: string }[] = [
		{ value: 'leds', label: 'LEDs' },
		{ value: 'matrix', label: '4×4 matrix' },
		{ value: 'integer', label: 'Integer' }
	];

	/** How each widget maps onto the 16 bits of its port. */
	const INPUT_INFO: Record<InputKind, string[]> = {
		switches: [
			'One switch per bit: bit 15 (MSB) on the left, bit 0 (LSB) on the right.',
			'The label under each switch is its bit number in hex (F = 15).',
			'Up / green = 1.'
		],
		buttons: [
			'One push button per bit: bit 15 (MSB) on the left, bit 0 (LSB) on the right.',
			'The label under each button is its bit number in hex (F = 15).',
			'A bit is 1 only while its button is held.'
		],
		gamepad: [
			'D-pads, left to right: pad 1 = bits 0–3, pad 2 = bits 4–7, pad 3 = bits 8–11.',
			'Within a pad: up = lowest bit, then down, left, right (pad 1: up 0, down 1, left 2, right 3).',
			'Buttons: A = bit 12, B = bit 13, X = bit 14, Y = bit 15.',
			'A bit is 1 while pressed. The small text on each control is its keyboard key.'
		],
		joystick: [
			'Bits 0–7 (low byte): X axis, signed 8-bit, left −127 … right +127.',
			'Bits 8–15 (high byte): Y axis, signed 8-bit, down −127 … up +127.',
			'Centre = 0x0000. Example: full right + full up = 0x7F7F; full left = 0x0081.'
		],
		integer: [
			'The number is the 16-bit port value.',
			'Signed: two’s complement, −32768 … 32767. Unsigned: 0 … 65535.',
			'Prefixes 0b / 0o / 0x are optional when typing.'
		]
	};
	const OUTPUT_INFO: Record<OutputKind, string[]> = {
		leds: [
			'One LED per bit: bit 15 (MSB) on the left, bit 0 (LSB) on the right.',
			'The label under each LED is its bit number in hex (F = 15).'
		],
		matrix: [
			'Bit 0 is the top-left LED; bits run left to right, then top to bottom.',
			'Row 1 = bits 0–3, row 2 = bits 4–7, row 3 = bits 8–11, row 4 = bits 12–15.',
			'So bit 15 is the bottom-right LED.'
		],
		integer: [
			'The number is the 16-bit port value.',
			'Signed: shown as two’s complement (0xFFFF = −1).'
		]
	};

	const outputs = $derived.by(() => {
		void emulator.frame;
		return Array.from(emulator.cpu.outputs);
	});

	const ports = Array.from({ length: 16 }, (_, i) => i);

	function setAllInputs(kind: InputKind) {
		for (const port of settings.inputs) port.kind = kind;
		for (const i of ports) emulator.setInput(i, 0);
	}
	function setAllOutputs(kind: OutputKind) {
		for (const port of settings.outputs) port.kind = kind;
	}
</script>

<section class="panel">
	<header>
		<h2>Inputs <span class="dim">IN $d %n</span></h2>
		<label>
			Set all
			<select
				onchange={(e) => {
					if (e.currentTarget.value) setAllInputs(e.currentTarget.value as InputKind);
					e.currentTarget.value = '';
				}}
			>
				<option value="">…</option>
				{#each INPUT_KINDS as kind (kind.value)}
					<option value={kind.value}>{kind.label}</option>
				{/each}
			</select>
		</label>
	</header>
	<div class="ports">
		{#each ports as i (i)}
			{@const value = emulator.inputValues[i]}
			{@const set = (v: number) => emulator.setInput(i, v)}
			<div class="port">
				<div class="head">
					<b class="mono">%{i}</b>
					<select
						bind:value={settings.inputs[i].kind}
						onchange={() => emulator.setInput(i, 0)}
						aria-label="Input {i} method"
					>
						{#each INPUT_KINDS as kind (kind.value)}
							<option value={kind.value}>{kind.label}</option>
						{/each}
					</select>
					<span class="mono dim">{hex(value)}</span>
					<InfoTip lines={INPUT_INFO[settings.inputs[i].kind]} label="Bit mapping of input {i}" />
				</div>
				{#if settings.inputs[i].kind === 'switches'}
					<BitRow mode="switch" {value} onchange={set} />
				{:else if settings.inputs[i].kind === 'buttons'}
					<BitRow mode="button" {value} onchange={set} />
				{:else if settings.inputs[i].kind === 'gamepad'}
					<Gamepad {value} onchange={set} />
				{:else if settings.inputs[i].kind === 'joystick'}
					<Joystick {value} onchange={set} />
				{:else}
					<IntField {value} bind:signed={settings.inputs[i].signed} bind:base={settings.inputs[i].base} onchange={set} />
				{/if}
			</div>
		{/each}
	</div>
</section>

<section class="panel">
	<header>
		<h2>Outputs <span class="dim">OUT $d %n</span></h2>
		<label>
			Set all
			<select
				onchange={(e) => {
					if (e.currentTarget.value) setAllOutputs(e.currentTarget.value as OutputKind);
					e.currentTarget.value = '';
				}}
			>
				<option value="">…</option>
				{#each OUTPUT_KINDS as kind (kind.value)}
					<option value={kind.value}>{kind.label}</option>
				{/each}
			</select>
		</label>
	</header>
	<div class="ports">
		{#each ports as i (i)}
			{@const value = outputs[i]}
			<div class="port">
				<div class="head">
					<b class="mono">%{i}</b>
					<select bind:value={settings.outputs[i].kind} aria-label="Output {i} method">
						{#each OUTPUT_KINDS as kind (kind.value)}
							<option value={kind.value}>{kind.label}</option>
						{/each}
					</select>
					<span class="mono dim">{hex(value)}</span>
					<InfoTip lines={OUTPUT_INFO[settings.outputs[i].kind]} label="Bit mapping of output {i}" />
				</div>
				{#if settings.outputs[i].kind === 'leds'}
					<BitRow mode="led" {value} />
				{:else if settings.outputs[i].kind === 'matrix'}
					<LedMatrix {value} />
				{:else}
					<IntField {value} bind:signed={settings.outputs[i].signed} bind:base={settings.outputs[i].base} />
				{/if}
			</div>
		{/each}
	</div>
</section>

<style>
	.ports {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
		gap: 8px;
	}
	.port {
		border: 1px solid var(--border);
		border-radius: 6px;
		padding: 6px 8px;
		background: var(--panel-2);
		display: flex;
		flex-direction: column;
		gap: 6px;
		min-width: 0;
	}
	.head {
		display: flex;
		align-items: center;
		gap: 6px;
		font-size: 12px;
	}
	.head b {
		min-width: 3ch;
	}
	.head select {
		flex: 1;
		min-width: 0;
	}
</style>
