export type Base = 2 | 8 | 10 | 16;

export interface IntFormat {
	signed: boolean;
	base: Base;
}

export const BASE_PREFIX: Record<Base, string> = { 2: '0b', 8: '0o', 10: '', 16: '0x' };
const BASE_DIGITS: Record<Base, number> = { 2: 16, 8: 6, 10: 1, 16: 4 };

/** Format a 16-bit word. Unsigned non-decimal values are zero-padded to the full width. */
export function formatWord(value: number, format: IntFormat): string {
	value &= 0xffff;
	if (format.signed && value & 0x8000) {
		return '-' + BASE_PREFIX[format.base] + (0x10000 - value).toString(format.base).toUpperCase();
	}
	const digits = value.toString(format.base).toUpperCase();
	return BASE_PREFIX[format.base] + (format.signed ? digits : digits.padStart(BASE_DIGITS[format.base], '0'));
}

/** Parse user text as a 16-bit word; returns null if it is not valid for the format. */
export function parseWord(text: string, format: IntFormat): number | null {
	let s = text.trim().replaceAll('_', '').replaceAll(' ', '').toLowerCase();
	if (!s) return null;
	let negative = false;
	if (s.startsWith('-')) {
		negative = true;
		s = s.slice(1);
	} else if (s.startsWith('+')) s = s.slice(1);
	const prefix = BASE_PREFIX[format.base];
	if (prefix && s.startsWith(prefix)) s = s.slice(2);
	const valid = { 2: /^[01]+$/, 8: /^[0-7]+$/, 10: /^[0-9]+$/, 16: /^[0-9a-f]+$/ }[format.base];
	if (!valid.test(s)) return null;
	let value = parseInt(s, format.base);
	if (negative) value = -value;
	const min = format.signed ? -0x8000 : 0;
	const max = format.signed ? 0x7fff : 0xffff;
	if (value < min || value > max) return null;
	return value & 0xffff;
}

export const hex = (value: number, digits = 4) =>
	value.toString(16).toUpperCase().padStart(digits, '0');

export const signed16 = (value: number) => (value << 16) >> 16;
