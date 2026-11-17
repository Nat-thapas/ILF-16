import { describe, expect, it } from 'vitest';
import { Cpu } from '../cpu';
import { formatScalar, formatValue, functionAt } from './debug';
import { buildC } from './index';

const SOURCE = `struct point { int x, y; };
int count = -3;
unsigned big = 50000;
char name[8] = "ILF";
char *title = "hello";
int grid[2][3] = {{1, 2, 3}, {4, 5, 6}};
struct point corner = {7, -8};
int table[40];
int *nothing;

int twice(int value) {
	int result = value * 2;
	out(1, result);
	return result;
}

int main() {
	int local = 21;
	int numbers[3] = {10, 20, 30};
	numbers[1] = twice(local);
	count = numbers[1];
	return 0;
}
`;

describe('C compiler: debug information', () => {
	const program = buildC(SOURCE).program!;
	const debug = program.debug!;

	it('lists the globals and shows their values', () => {
		const cpu = new Cpu();
		cpu.load(program);
		const word = (addr: number) => cpu.ram[addr];
		const show = () => Object.fromEntries(debug.globals.map((v) => [v.text, formatValue(v.type, word, v.addr)]));
		expect(show()).toMatchObject({
			'int count': '-3',
			'unsigned big': '50000',
			'char name[8]': '"ILF"',
			'int grid[2][3]': '{{1, 2, 3}, {4, 5, 6}}',
			'struct point corner': '{x: 7, y: -8}',
			'int *nothing': '0 (null)'
		});
		expect(show()['char *title']).toMatch(/^0x[0-9A-F]{4} "hello"$/);
		expect(show()['int table[40]']).toMatch(/^\{0, 0, .*\.\.\.\}$/);
		cpu.run(Infinity, 10000, Infinity);
		expect(show()['int count']).toBe('42');
	});

	it('knows which function an address is in, and where its variables are', () => {
		expect(debug.functions.map((f) => f.name)).toEqual(['main', 'twice']);
		const [main, twice] = debug.functions;
		expect(main.start).toBe(1);
		expect(main.end).toBe(twice.start);
		expect(twice.end).toBe(program.rom.length);
		expect(functionAt(debug, twice.start + 1)?.name).toBe('twice');
		expect(functionAt(debug, 0)).toBeUndefined();

		// Stop inside twice(), after its second line: its variables hold what the source says.
		const cpu = new Cpu();
		cpu.load(program);
		while (cpu.outputs[1] === 0) cpu.step();
		const fn = functionAt(debug, cpu.pc)!;
		expect(fn.name).toBe('twice');
		const word = (addr: number) => cpu.ram[addr];
		const values = Object.fromEntries(
			fn.locals.map((v) => [v.text, v.reg >= 0 ? formatScalar(v.type, cpu.regs[v.reg], word) : formatValue(v.type, word, cpu.regs[15] + v.addr)])
		);
		expect(values).toEqual({ 'int value': '21', 'int result': '42' });

		// main keeps its array on the stack
		const numbers = main.locals.find((v) => v.name === 'numbers')!;
		expect(numbers.reg).toBe(-1);
		cpu.run(Infinity, 10000, Infinity);
		expect(formatValue(numbers.type, word, cpu.regs[15] + numbers.addr)).toBe('{10, 42, 30}');
	});

	it('shows characters and signs', () => {
		const word = () => 0;
		expect(formatScalar({ kind: 'int', unsigned: false, char: true }, 65, word)).toBe("65 'A'");
		expect(formatScalar({ kind: 'int', unsigned: false }, 0xffff, word)).toBe('-1');
		expect(formatScalar({ kind: 'int', unsigned: true }, 0xffff, word)).toBe('65535');
	});
});
