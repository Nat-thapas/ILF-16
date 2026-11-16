// ILF-16 instruction set, mirroring the table in the project README.

export interface InstructionInfo {
	name: string;
	opcode: number;
	hasDest: boolean;
	minArgs: number;
	maxArgs: number;
}

const FLAG_SUFFIXES = ['gt', 'lt', 'sgt', 'slt', 'eq', 'z', 'neg', 'pos', 'ev', 'bev', 'c', 'of'];
const INV_FLAG_SUFFIXES = [
	'le',
	'ge',
	'sle',
	'sge',
	'neq',
	'nz',
	'posz',
	'negz',
	'od',
	'bod',
	'nc',
	'nof'
];

function build(): InstructionInfo[] {
	const list: InstructionInfo[] = [];
	const add = (name: string, opcode: number, hasDest: boolean, minArgs: number, maxArgs = minArgs) =>
		list.push({ name, opcode, hasDest, minArgs, maxArgs });

	add('nop', 0x00, false, 0);
	add('stl', 0x04, false, 1);
	add('hlt', 0x08, false, 0);

	const alu2 = ['add', 'sub', 'rshift', 'lshift', 'mul', 'smul', 'umul', 'sumul'];
	alu2.forEach((n, i) => add(n, 0x10 + i, true, 2));
	add('test', 0x18, true, 1);
	add('not', 0x19, true, 1);
	['and', 'or', 'xor', 'nand', 'nor', 'xnor'].forEach((n, i) => add(n, 0x1a + i, true, 2));

	FLAG_SUFFIXES.forEach((s, i) => add('b' + s, 0x20 + i, false, 1));
	add('brn', 0x2f, false, 1);
	INV_FLAG_SUFFIXES.forEach((s, i) => add('b' + s, 0x30 + i, false, 1));

	FLAG_SUFFIXES.forEach((s, i) => add('s' + s, 0x40 + i, true, 1, 2));
	add('mov', 0x4f, true, 1);
	add('ldi', 0x4f, true, 1);
	INV_FLAG_SUFFIXES.forEach((s, i) => add('s' + s, 0x50 + i, true, 1, 2));

	add('lod', 0xc0, true, 1);
	add('str', 0xc4, true, 1);
	add('in', 0xc8, true, 1);
	add('out', 0xcc, true, 1);
	add('gfxsp', 0xd0, true, 2);
	return list;
}

export const INSTRUCTIONS: InstructionInfo[] = build();

export const INSTRUCTIONS_BY_NAME: Map<string, InstructionInfo> = new Map(
	INSTRUCTIONS.map((i) => [i.name, i])
);

/** First match wins, so 0x4F disassembles as MOV. */
export const INSTRUCTIONS_BY_OPCODE: Map<number, InstructionInfo> = (() => {
	const m = new Map<number, InstructionInfo>();
	for (const i of INSTRUCTIONS) if (!m.has(i.opcode)) m.set(i.opcode, i);
	return m;
})();

export const PSEUDO_INSTRUCTIONS = ['psh', 'pop', 'cal', 'ret', 'dw'];

export const FLAG_NAMES = [
	'GT',
	'LT',
	'SGT',
	'SLT',
	'EQ',
	'Z',
	'S',
	'POS',
	'P',
	'BP',
	'C',
	'OF',
	'-',
	'-',
	'-',
	'TR'
];

export const ROM_SIZE = 13312;
export const RAM_SIZE = 8192;
export const CLOCK_HZ = 48_000_000;
export const CLOCKS_PER_INSTRUCTION = 4;
