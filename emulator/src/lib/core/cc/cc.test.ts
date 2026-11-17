import { describe, expect, it } from 'vitest';
import { Cpu } from '../cpu';
import { buildC, compileC } from './index';

/** Compile and run a program until it halts. Output ports hold the results. */
function run(source: string, maxInstructions = 2_000_000, inputs: number[] = []): Cpu {
	const result = buildC(source);
	const errors = result.diagnostics.filter((d) => d.severity === 'error');
	expect(errors).toEqual([]);
	const cpu = new Cpu();
	cpu.load(result.program!);
	inputs.forEach((v, i) => (cpu.inputs[i] = v));
	const reason = cpu.run(Infinity, maxInstructions, Infinity);
	expect(reason).toBe('halted');
	return cpu;
}

/** The values a program wrote to output ports 0, 1, 2... */
function outputs(source: string, count: number, inputs: number[] = []): number[] {
	return Array.from(run(source, 2_000_000, inputs).outputs.slice(0, count));
}

/** Evaluate expressions inside main: each one goes to the next output port. */
function evaluate(setup: string, ...exprs: string[]): number[] {
	const body = exprs.map((e, i) => `out(${i}, ${e});`).join('\n');
	return outputs(`${setup}\nint main() {\n${body}\nreturn 0; }`, exprs.length);
}

const u = (x: number) => x & 0xffff;

describe('C compiler: expressions', () => {
	it('does arithmetic on variables', () => {
		const setup = 'int a = 1000; int b = -7; unsigned c = 50000; int z = 0;';
		expect(
			evaluate(setup, 'a + b', 'a - b', 'a * b', 'b * b', 'a & 0xF0', 'a | 5', 'a ^ b', '~a', '-a', '!a', '!z', 'a << 3', 'c >> 4')
		).toEqual([993, 1007, u(-7000), 49, 1000 & 0xf0, 1005, u(1000 ^ -7), u(~1000), u(-1000), 0, 1, 8000, 3125]);
	});

	it('shifts signed numbers arithmetically', () => {
		const setup = 'int a = -1000; int b = 1000; int n = 3; int one = 1;';
		const shifts = [1, 2, 3, 4, 5, 8, 15];
		expect(evaluate(setup, ...shifts.map((s) => `a >> ${s}`))).toEqual(shifts.map((s) => u(-1000 >> s)));
		expect(evaluate(setup, ...shifts.map((s) => `b >> ${s}`))).toEqual(shifts.map((s) => 1000 >> s));
		expect(evaluate(setup, 'a >> n', 'b >> n', 'a >> one', '(a + b) >> n')).toEqual([u(-125), 125, u(-500), 0]);
	});

	it('divides', () => {
		const setup = 'int a = -1000; int b = 37; unsigned c = 50000; unsigned d = 7; int n = 16;';
		expect(
			evaluate(setup, 'c / d', 'c % d', 'a / b', 'a % b', 'b / a', 'c / 10', 'c % 10', 'c / 7', 'c % 7', 'c / 100', 'c / 8', 'c % 8')
		).toEqual([7142, 6, u(-27), u(-1), 0, 5000, 0, 7142, 6, 500, 6250, 0]);
		expect(evaluate(setup, 'a / 2', 'a / 16', 'a % 16', 'a / n', '(a + 1) / 2', '(a + 1) % 2', 'b / 4', 'b % 4', 'a / -3')).toEqual([
			u(-500),
			u(-62),
			u(-8),
			u(-62),
			u(-499),
			u(-1),
			9,
			1,
			333
		]);
		expect(evaluate('unsigned c = 60000; unsigned big = 40000;', 'c / big', 'c % big', 'big / c', 'big % c')).toEqual([1, 20000, 0, 40000]);
	});

	it('divides by every small constant correctly', () => {
		const tests: string[] = [];
		const expected: number[] = [];
		for (const c of [3, 5, 6, 7, 9, 10, 11, 12, 13, 25, 100, 255, 1000, 10000]) {
			tests.push(`x / ${c}`, `x % ${c}`, `y / ${c}`, `y % ${c}`);
			expected.push(Math.floor(65535 / c), 65535 % c, Math.floor(12345 / c), 12345 % c);
		}
		const body = tests.map((t, i) => `r[${i}] = ${t};`).join('\n');
		const cpu = run(`unsigned x = 65535; unsigned y = 12345; unsigned r[${tests.length}];\nint main() {\n${body}\nreturn 0; }`);
		const base = 3; // address 0 is unused, then x and y
		expect(Array.from(cpu.ram.slice(base, base + tests.length))).toEqual(expected);
	});

	it('compares signed and unsigned', () => {
		const setup = 'int a = -5; int b = 3; unsigned c = 65531; unsigned d = 3;';
		expect(
			evaluate(setup, 'a < b', 'a > b', 'a <= b', 'a >= b', 'a == b', 'a != b', 'c < d', 'c > d', 'c <= d', 'c >= d', 'a < 0', 'a >= 0', 'b > 0', 'b <= 0', 'a == -5')
		).toEqual([1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1]);
	});

	it('handles logical operators and the conditional operator', () => {
		const setup = 'int a = 5; int b = 0; int count = 0; int bump() { count++; return 1; }';
		expect(
			evaluate(setup, 'a && b', 'a || b', 'b || a', 'b && bump()', 'a || bump()', 'count', 'a ? 10 : 20', 'b ? 10 : 20', 'a > 3 ? a : b', 'a > 3 && a < 9 ? a * 2 : bump()', 'b && a || !b')
		).toEqual([0, 1, 1, 0, 1, 0, 10, 20, 5, 10, 1]);
	});

	it('assigns, increments and decrements', () => {
		expect(
			outputs(
				`int g = 10; int arr[4] = {1, 2, 3, 4};
				int main() {
					int x = 5;
					int *p = arr;
					out(0, x++); out(1, x); out(2, ++x); out(3, x--); out(4, --x);
					x += 10; out(5, x); x -= 3; x *= 2; x /= 5; x %= 4; out(6, x);
					x = 3; x <<= 4; x |= 1; x ^= 0xff; x &= 0xfc; x >>= 2; out(7, x);
					out(8, g++); out(9, ++g); g += x; out(10, g);
					out(11, *p++); out(12, *p); *p += 5; out(13, arr[1]); (*p)++; out(14, arr[1]);
					out(15, p[1]-- + (arr[3] = 9));
					return 0;
				}`,
				16
			)
		).toEqual([5, 6, 7, 7, 5, 15, 0, ((((3 << 4) | 1) ^ 0xff) & 0xfc) >> 2, 10, 12, 12 + 51, 1, 2, 7, 8, 12]);
	});
});

describe('C compiler: statements', () => {
	it('runs loops, break and continue', () => {
		expect(
			outputs(
				`int main() {
					int i, sum = 0, n = 0;
					for (i = 0; i < 10; i++) { if (i == 3) continue; if (i == 8) break; sum += i; }
					out(0, sum);
					while (sum > 0) { sum -= 7; n++; }
					out(1, n);
					do { n--; } while (n > 10);
					out(2, n);
					for (;;) { n += 5; if (n > 20) break; }
					out(3, n);
					return 0;
				}`,
				4
			)
		).toEqual([25, 4, 3, 23]);
	});

	it('runs switch and goto', () => {
		expect(
			outputs(
				`int kind(int x) {
					switch (x) {
						case 1: return 10;
						case 2:
						case 3: x += 100;
						case 4: return x;
						case 5000: return 1;
						default: break;
					}
					return -1;
				}
				int main() {
					int i = 0;
					out(0, kind(1)); out(1, kind(2)); out(2, kind(3)); out(3, kind(4)); out(4, kind(5000)); out(5, kind(7));
				again:
					i++;
					if (i < 5) goto again;
					out(6, i);
					return 0;
				}`,
				7
			)
		).toEqual([10, 102, 103, 4, 1, 0xffff, 5]);
	});
});

describe('C compiler: functions', () => {
	it('calls functions with arguments, recursion and many parameters', () => {
		expect(
			outputs(
				`int fib(int n) { return n < 2 ? n : fib(n - 1) + fib(n - 2); }
				int gcd(int a, int b) { while (b) { int t = a % b; a = b; b = t; } return a; }
				int six(int a, int b, int c, int d, int e, int f) { return a + 2 * b + 3 * c + 4 * d + 5 * e + 6 * f; }
				int add(int a, int b) { return a + b; }
				int nested(int x) { return add(add(x, 1), add(x, add(2, 3))) * add(x, x); }
				int main() {
					out(0, fib(15));
					out(1, gcd(1071, 462));
					out(2, six(1, 2, 3, 4, 5, 6));
					out(3, nested(4));
					out(4, add(fib(5), 1) + add(2, fib(6)) - fib(3));
					return 0;
				}`,
				5
			)
		).toEqual([610, 21, 91, (5 + 9) * 8, 6 + 10 - 2]);
	});

	it('keeps values across calls and deep expressions', () => {
		expect(
			outputs(
				`int id(int x) { return x; }
				int g[8] = {1, 2, 3, 4, 5, 6, 7, 8};
				int deep(int a, int b, int c, int d) {
					return ((a + b) * (c + d) + (a - b) * (c - d)) * ((a * b + c * d) - (g[a] + g[b]) * (g[c] - g[d]))
						+ (((a ^ b) + (c ^ d)) * ((a | b) + (c & d)) - ((g[a] * g[b]) + (g[c] * g[d])) * ((a + g[d]) - (b + g[c])));
				}
				int main() {
					int a = 3, b = 4;
					g[id(2)] = id(a) + id(b) * id(5);
					out(0, g[2]);
					g[id(1)] += id(7);
					out(1, g[1]);
					out(2, deep(1, 2, 3, 4));
					out(3, id(a) + (id(b) + (id(a) * (id(b) - id(1)))));
					return 0;
				}`,
				4
			)
		).toEqual([
			23,
			9,
			(() => {
				const g = [1, 9, 23, 4, 5, 6, 7, 8];
				const [a, b, c, d] = [1, 2, 3, 4];
				return u(
					((a + b) * (c + d) + (a - b) * (c - d)) * (a * b + c * d - (g[a] + g[b]) * (g[c] - g[d])) +
						(((a ^ b) + (c ^ d)) * ((a | b) + (c & d)) - (g[a] * g[b] + g[c] * g[d]) * (a + g[d] - (b + g[c])))
				);
			})(),
			3 + (4 + 3 * 3)
		]);
	});

	it('calls through function pointers', () => {
		expect(
			outputs(
				`int twice(int x) { return x * 2; }
				int negate(int x) { return -x; }
				int (*table[2])(int) = { twice, negate };
				int apply(int (*f)(int), int x) { return f(x); }
				int main() {
					int (*f)(int) = negate;
					out(0, apply(twice, 21));
					out(1, f(5));
					out(2, table[0](7) + table[1](3));
					return 0;
				}`,
				3
			)
		).toEqual([42, u(-5), 11]);
	});
});

describe('C compiler: data', () => {
	it('handles arrays, pointers, strings and structs', () => {
		expect(
			outputs(
				`struct point { int x, y; };
				struct shape { struct point at; int sides[3]; char *name; };
				struct shape shapes[2] = { { {1, 2}, {3, 4, 5}, "tri" }, { {6, 7}, {8, 9, 10}, "sq" } };
				int grid[3][4] = { {1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12} };
				char text[] = "hello";
				int len(char *s) { int n = 0; while (*s++) n++; return n; }
				void move(struct point *p, int dx) { p->x += dx; p->y -= dx; }
				int main() {
					int local[4] = {4, 3, 2};
					struct point p;
					struct shape *s = &shapes[1];
					int i, sum = 0;
					out(0, len(text) + len("abc") + sizeof(text) + sizeof(grid) + sizeof(struct shape));
					out(1, grid[2][1] * grid[1][3]);
					for (i = 0; i < 4; i++) sum += local[i] * (i + 1);
					out(2, sum);
					p.x = 10; p.y = 20;
					move(&p, 3);
					out(3, p.x * 100 + p.y);
					move(&s->at, 1);
					out(4, shapes[1].at.x + s->sides[2] + s->name[1] + shapes[0].name[0]);
					out(5, &grid[2][1] - &grid[0][0]);
					out(6, text[1] == 'e' && *(text + 4) == 'o');
					return 0;
				}`,
				7
			)
		).toEqual([5 + 3 + 6 + 12 + 6, 80, 4 + 6 + 6, 1317, 7 + 10 + 'q'.charCodeAt(0) + 't'.charCodeAt(0), 9, 1]);
	});

	it('supports enum, typedef, static and macros', () => {
		expect(
			outputs(
				`#define SIZE 8
				#define SQUARE(x) ((x) * (x))
				#define MAX(a, b) ((a) > (b) ? (a) : (b))
				typedef unsigned word;
				typedef struct { word lo, hi; } pair;
				enum { RED, GREEN = 5, BLUE };
				int counter() { static int n = 100; return n++; }
				#ifdef SIZE
				int have = 1;
				#else
				int have = 0;
				#endif
				int main() {
					pair p;
					word w = 65535;
					p.lo = SQUARE(SIZE + 1); p.hi = MAX(BLUE, RED);
					counter(); counter();
					out(0, p.lo + p.hi);
					out(1, counter());
					out(2, w / 2);
					out(3, have + GREEN);
					return 0;
				}`,
				4
			)
		).toEqual([87, 102, 32767, 6]);
	});

	it('provides the hardware as built-in functions', () => {
		const cpu = run(
			`int main() {
				int x = in(1);
				unsigned y = in(2);
				pixel(3, 4, 5);
				pixel(x, y & 255, x + 2);
				pixel(x + 200, 255, 0);
				pixel(255, x, 15);
				out(0, mulhi(-20000, 3000));
				out(1, umulhi(50000, 3000));
				out(x - 5, y);
				stall(1000);
				halt();
				out(0, 99);
				return 0;
			}`,
			1000,
			[0, 7, 0x1234]
		);
		expect(cpu.vram[4 * 256 + 3]).toBe(5);
		expect(cpu.vram[0x34 * 256 + 7]).toBe(9);
		expect(cpu.vram[7 * 256 + 255]).toBe(15);
		expect(cpu.outputs[0]).toBe(u(Math.floor((-20000 * 3000) / 65536)));
		expect(cpu.outputs[1]).toBe(Math.floor((50000 * 3000) / 65536));
		expect(cpu.outputs[2]).toBe(0x1234);
		expect(cpu.clocks).toBeGreaterThan(1000);
	});
});

describe('C compiler: output', () => {
	it('reports errors with the line they are on', () => {
		const check = (source: string, line: number, text: string) => {
			const result = compileC(source);
			expect(result.asm).toBeNull();
			expect(result.diagnostics[0]).toMatchObject({ severity: 'error', line });
			expect(result.diagnostics[0].message).toContain(text);
		};
		check('int main() {\n  x = 1;\n}', 2, 'not declared');
		check('int main() {\n  int x = 1\n  return x;\n}', 2, 'Expected ";"');
		check('int f(int a);\nint main() { return f(1, 2); }', 2, 'argument');
		check('long x;\nint main() {}', 1, 'long');
		check('int main() {\n  return 1.5;\n}', 2, 'floating point');
		check('int f() { return 1; }', 0, 'main');
		check('int main() {\n  int a[3];\n  a = 0;\n}', 3, 'assigned');
		check('int f(int);\nint main() { return f(1); }', 2, 'no body');
	});

	it('maps instructions back to C lines', () => {
		const result = buildC('int main() {\n  int i;\n  for (i = 0; i < 3; i++)\n    out(0, i);\n  return 0;\n}\n');
		const program = result.program!;
		const lines = new Set(Array.from(program.lineOfAddr));
		expect(lines.has(3)).toBe(true);
		expect(lines.has(4)).toBe(true);
		expect(program.addrOfLine.get(4)).toBeGreaterThan(0);
		expect(program.lineStep).toBe(true);
	});

	it('keeps a simple loop as tight as hand-written assembly', () => {
		const { asm } = compileC(
			`int main() {
				int x, y;
				for (y = 0; y < 256; y++)
					for (x = 0; x < 256; x++)
						pixel(x, y, (x ^ y) & 15);
				return 0;
			}`
		);
		const count = asm!.split('\n').filter((l) => /^\s+[A-Z]/.test(l)).length;
		// 2 to start the loops, 2 jumps to the conditions, 3 in the body, 3 + 3 for the loop ends, HLT
		expect(count).toBeLessThanOrEqual(14);
	});
});
