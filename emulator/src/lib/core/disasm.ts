import { INSTRUCTIONS_BY_OPCODE } from './isa';

/** Disassemble one 32-bit instruction word. */
export function disassemble(word: number): string {
	const id = word >>> 24;
	const argc = (word >>> 22) & 3;
	const x = (word >>> 21) & 1;
	const y = (word >>> 20) & 1;
	const dest = (word >>> 16) & 15;
	const data = word & 0xffff;

	// Special instructions only decode on the top 6 bits; normalise to the documented opcode.
	let lookup = id;
	if (id < 0x10 || id >= 0xc0) lookup = id & 0xfc;
	if (lookup >= 0xd0 && lookup <= 0xd7) lookup = 0xd0;
	const info = INSTRUCTIONS_BY_OPCODE.get(lookup);
	if (!info) return `??? 0x${(word >>> 0).toString(16).padStart(8, '0')}`;

	const parts: string[] = [info.name.toUpperCase()];
	if (info.hasDest) parts.push(`$${dest}`);
	const fmt = (value: number, reg: number) => (reg ? `$${value & 15}` : String(value));
	if (argc === 1) {
		parts.push(fmt(data, x));
	} else if (argc === 2) {
		if (x && !y) parts.push(fmt(data >>> 12, 1), fmt(data & 0xfff, 0));
		else if (!x && y) parts.push(fmt(data >>> 4, 0), fmt(data & 0xf, 1));
		else parts.push(fmt(data >>> 8, x), fmt(data & 0xff, y));
	}
	return parts.join(' ');
}

/** One line per ROM word (line N = address N - 1), with address and raw word as a comment. */
export function disassembleListing(rom: ArrayLike<number>): string {
	const hex = (value: number, digits: number) => value.toString(16).toUpperCase().padStart(digits, '0');
	return Array.from(
		rom,
		(word, addr) => `${disassemble(word).padEnd(22)}; ${hex(addr, 4)}  ${hex(word >>> 0, 8)}`
	).join('\n');
}
