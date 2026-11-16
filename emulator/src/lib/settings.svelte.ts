import type { Base } from './format';

export type InputKind = 'switches' | 'buttons' | 'gamepad' | 'joystick' | 'integer';
export type OutputKind = 'leds' | 'matrix' | 'integer';
export type SpeedMode = 'realtime' | 'unlimited';

export interface PortSettings<K> {
	kind: K;
	signed: boolean;
	base: Base;
}

export interface Settings {
	palette: string[];
	inputs: PortSettings<InputKind>[];
	outputs: PortSettings<OutputKind>[];
	/** KeyboardEvent.code for each of the 16 game controller bits. */
	keys: string[];
	speed: SpeedMode;
	displayScale: number;
	/** Shade source lines by how often they run. */
	heatmap: boolean;
}

/** ILF-GFX default palette (PICO-8 mapped to RGB222), from the README. */
export const DEFAULT_PALETTE = [
	'#000000',
	'#000062',
	'#620062',
	'#006200',
	'#ba6200',
	'#626262',
	'#bababa',
	'#ffffff',
	'#ff0062',
	'#ff6200',
	'#ffff62',
	'#00ff62',
	'#00baff',
	'#ba62ba',
	'#ff62ba',
	'#ffbaba'
];

export const PALETTE_NAMES = [
	'Black',
	'Dark Blue',
	'Dark Purple',
	'Dark Green',
	'Brown',
	'Dark Gray',
	'Light Gray',
	'White',
	'Red',
	'Orange',
	'Yellow',
	'Green',
	'Blue',
	'Purple',
	'Pink',
	'Light Pink'
];

/** Bits 0-3 / 4-7 / 8-11: up, down, left, right of d-pad 1 / 2 / 3. Bits 12-15: buttons A B X Y. */
export const DEFAULT_KEYS = [
	'KeyW',
	'KeyS',
	'KeyA',
	'KeyD',
	'ArrowUp',
	'ArrowDown',
	'ArrowLeft',
	'ArrowRight',
	'KeyI',
	'KeyK',
	'KeyJ',
	'KeyL',
	'KeyZ',
	'KeyX',
	'KeyC',
	'KeyV'
];

function defaults(): Settings {
	return {
		palette: [...DEFAULT_PALETTE],
		inputs: Array.from({ length: 16 }, () => ({ kind: 'switches', signed: false, base: 10 })),
		outputs: Array.from({ length: 16 }, () => ({ kind: 'leds', signed: false, base: 10 })),
		keys: [...DEFAULT_KEYS],
		speed: 'realtime',
		displayScale: 2,
		heatmap: false
	};
}

const STORAGE_KEY = 'ilf16.settings.v1';

function load(): Settings {
	const base = defaults();
	try {
		const raw = localStorage.getItem(STORAGE_KEY);
		if (!raw) return base;
		const saved = JSON.parse(raw) as Partial<Settings>;
		const okArray = (a: unknown): a is unknown[] => Array.isArray(a) && a.length === 16;
		if (okArray(saved.palette)) base.palette = saved.palette as string[];
		if (okArray(saved.inputs)) base.inputs = saved.inputs as Settings['inputs'];
		if (okArray(saved.outputs)) base.outputs = saved.outputs as Settings['outputs'];
		if (okArray(saved.keys)) base.keys = saved.keys as string[];
		if (saved.speed === 'realtime' || saved.speed === 'unlimited') base.speed = saved.speed;
		if (typeof saved.displayScale === 'number') base.displayScale = saved.displayScale;
		if (typeof saved.heatmap === 'boolean') base.heatmap = saved.heatmap;
	} catch {
		// Storage unavailable or corrupt: fall back to defaults.
	}
	return base;
}

export const settings: Settings = $state(load());

$effect.root(() => {
	$effect(() => {
		const json = JSON.stringify(settings);
		try {
			localStorage.setItem(STORAGE_KEY, json);
		} catch {
			// Ignore: settings just won't persist.
		}
	});
});
