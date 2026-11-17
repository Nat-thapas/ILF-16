// Lexer and preprocessor for the ILF-16 C compiler.

export class CompileError extends Error {
	line: number;
	constructor(line: number, message: string) {
		super(message);
		this.line = line;
	}
}

export interface Token {
	kind: 'id' | 'num' | 'str' | 'punct' | 'eof';
	text: string;
	/** 1-based source line. Tokens that come from a macro get the line the macro was used on. */
	line: number;
	/** num: the value, 0 to 65535. */
	value: number;
	/** num: the literal has unsigned type. */
	unsigned: boolean;
	/** str: the characters, without the terminating zero. */
	chars: number[];
	/** Macros that must not be expanded again inside this token. */
	hide: Set<string> | null;
}

interface Macro {
	/** Parameter names, or null for an object-like macro. */
	params: string[] | null;
	body: Token[];
}

const PUNCTUATORS = [
	'<<=',
	'>>=',
	'...',
	'->',
	'++',
	'--',
	'<<',
	'>>',
	'<=',
	'>=',
	'==',
	'!=',
	'&&',
	'||',
	'+=',
	'-=',
	'*=',
	'/=',
	'%=',
	'&=',
	'|=',
	'^='
];

const ESCAPES: Record<string, number> = {
	n: 10,
	t: 9,
	r: 13,
	'0': 0,
	a: 7,
	b: 8,
	f: 12,
	v: 11,
	e: 27,
	'\\': 92,
	"'": 39,
	'"': 34,
	'?': 63
};

/** Replace comments by spaces, keeping every newline so that line numbers stay right. */
function stripComments(source: string): string {
	let out = '';
	let i = 0;
	const n = source.length;
	while (i < n) {
		const c = source[i];
		if (c === '"' || c === "'") {
			let j = i + 1;
			while (j < n && source[j] !== c && source[j] !== '\n') j += source[j] === '\\' ? 2 : 1;
			out += source.slice(i, Math.min(j + 1, n));
			i = j + 1;
		} else if (c === '/' && source[i + 1] === '/') {
			while (i < n && source[i] !== '\n') i++;
		} else if (c === '/' && source[i + 1] === '*') {
			let j = source.indexOf('*/', i + 2);
			if (j < 0) j = n;
			out += ' ' + source.slice(i, j).replace(/[^\n]/g, '');
			i = j + 2;
		} else {
			out += c;
			i++;
		}
	}
	return out;
}

function token(kind: Token['kind'], text: string, line: number): Token {
	return { kind, text, line, value: 0, unsigned: false, chars: [], hide: null };
}

function readEscape(text: string, i: number, line: number): [number, number] {
	// text[i] is the character after the backslash
	const c = text[i];
	if (c === 'x') {
		const m = /^[0-9a-fA-F]+/.exec(text.slice(i + 1));
		if (!m) throw new CompileError(line, 'Invalid \\x escape');
		return [parseInt(m[0], 16) & 0xffff, i + 1 + m[0].length];
	}
	if (c >= '0' && c <= '7') {
		const m = /^[0-7]{1,3}/.exec(text.slice(i))!;
		return [parseInt(m[0], 8), i + m[0].length];
	}
	if (c in ESCAPES) return [ESCAPES[c], i + 1];
	throw new CompileError(line, `Unknown escape \\${c}`);
}

/** Tokenise one logical line. */
function tokenizeLine(text: string, line: number, out: Token[]): void {
	let i = 0;
	const n = text.length;
	while (i < n) {
		const c = text[i];
		if (c === ' ' || c === '\t' || c === '\r' || c === '\f' || c === '\v') {
			i++;
			continue;
		}
		const rest = text.slice(i);
		let m: RegExpExecArray | null;
		if ((m = /^[A-Za-z_][A-Za-z0-9_]*/.exec(rest))) {
			out.push(token('id', m[0], line));
			i += m[0].length;
		} else if ((m = /^(0[xX][0-9a-fA-F]+|0[bB][01]+|[0-9]+)([uUlL]*)/.exec(rest))) {
			const after = rest[m[0].length] ?? '';
			if (after === '.' || /[A-Za-z0-9_]/.test(after) || (/^[0-9]+$/.test(m[1]) && /^[eE]/.test(after)))
				throw new CompileError(line, `Invalid number "${/^[0-9A-Za-z_.]+/.exec(rest)![0]}" (there is no floating point)`);
			const digits = m[1];
			let value: number;
			if (/^0[xX]/.test(digits)) value = parseInt(digits.slice(2), 16);
			else if (/^0[bB]/.test(digits)) value = parseInt(digits.slice(2), 2);
			else if (digits.length > 1 && digits[0] === '0') {
				if (/[89]/.test(digits)) throw new CompileError(line, `Invalid octal number "${digits}"`);
				value = parseInt(digits, 8);
			} else value = parseInt(digits, 10);
			if (value > 0xffff)
				throw new CompileError(line, `Number ${m[0]} does not fit in 16 bits`);
			const t = token('num', m[0], line);
			t.value = value;
			t.unsigned = /[uU]/.test(m[2]) || value > 0x7fff;
			out.push(t);
			i += m[0].length;
		} else if (c === "'") {
			let j = i + 1;
			let value: number;
			if (text[j] === '\\') [value, j] = readEscape(text, j + 1, line);
			else if (j < n && text[j] !== "'") value = text.charCodeAt(j++);
			else throw new CompileError(line, 'Empty character literal');
			if (text[j] !== "'") throw new CompileError(line, 'Unterminated character literal');
			const t = token('num', text.slice(i, j + 1), line);
			t.value = value & 0xffff;
			out.push(t);
			i = j + 1;
		} else if (c === '"') {
			let j = i + 1;
			const chars: number[] = [];
			while (j < n && text[j] !== '"') {
				if (text[j] === '\\') {
					let value: number;
					[value, j] = readEscape(text, j + 1, line);
					chars.push(value);
				} else chars.push(text.charCodeAt(j++));
			}
			if (j >= n) throw new CompileError(line, 'Unterminated string');
			const t = token('str', text.slice(i, j + 1), line);
			t.chars = chars;
			out.push(t);
			i = j + 1;
		} else {
			const p = PUNCTUATORS.find((p) => rest.startsWith(p));
			if (p) {
				out.push(token('punct', p, line));
				i += p.length;
			} else if ('+-*/%&|^~!<>=?:;,.()[]{}'.includes(c)) {
				out.push(token('punct', c, line));
				i++;
			} else throw new CompileError(line, `Unexpected character "${c}"`);
		}
	}
}

/**
 * Turn C source into tokens, with comments removed and the preprocessor applied. Supported
 * directives: #define (with or without parameters), #undef, #ifdef, #ifndef, #else, #endif.
 */
export function lex(source: string, warn: (line: number, message: string) => void): Token[] {
	const physical = stripComments(source).split('\n');
	const macros = new Map<string, Macro>();
	const out: Token[] = [];
	/** Tokens waiting for macro expansion. */
	let raw: Token[] = [];
	/** One entry per open #if: is this branch taken, and was the enclosing code active. */
	const conds: { taken: boolean; outer: boolean; line: number }[] = [];
	const active = () => conds.every((c) => c.taken);

	const expand = () => {
		const stack = raw.reverse();
		raw = [];
		while (stack.length) {
			const t = stack.pop()!;
			const macro = t.kind === 'id' ? macros.get(t.text) : undefined;
			if (!macro || t.hide?.has(t.text)) {
				out.push(t);
				continue;
			}
			const hide = new Set(t.hide ?? []);
			hide.add(t.text);
			const replacement: Token[] = [];
			if (!macro.params) {
				for (const b of macro.body) replacement.push({ ...b, line: t.line, hide });
			} else {
				const next = stack[stack.length - 1];
				if (!next || next.kind !== 'punct' || next.text !== '(') {
					out.push(t);
					continue;
				}
				stack.pop();
				let args: Token[][] = [[]];
				let depth = 0;
				for (;;) {
					const a = stack.pop();
					if (!a) throw new CompileError(t.line, `Missing ")" after the arguments of macro ${t.text}`);
					if (a.kind === 'punct') {
						if (a.text === '(') depth++;
						else if (a.text === ')') {
							if (depth === 0) break;
							depth--;
						} else if (a.text === ',' && depth === 0) {
							args.push([]);
							continue;
						}
					}
					args[args.length - 1].push(a);
				}
				if (macro.params.length === 0 && args.length === 1 && args[0].length === 0) args = [];
				if (args.length !== macro.params.length)
					throw new CompileError(
						t.line,
						`Macro ${t.text} takes ${macro.params.length} argument(s), ${args.length} given`
					);
				for (const b of macro.body) {
					const index = b.kind === 'id' ? macro.params.indexOf(b.text) : -1;
					if (index >= 0) for (const a of args[index]) replacement.push({ ...a, line: t.line });
					else replacement.push({ ...b, line: t.line, hide });
				}
			}
			for (let i = replacement.length - 1; i >= 0; i--) stack.push(replacement[i]);
		}
	};

	for (let i = 0; i < physical.length; i++) {
		const line = i + 1;
		let text = physical[i];
		// A backslash at the end of a line continues it on the next one.
		while (/\\\s*$/.test(text) && i + 1 < physical.length) {
			text = text.replace(/\\\s*$/, ' ') + physical[++i];
		}
		const directive = /^\s*#\s*([A-Za-z_]*)\s*(.*)$/.exec(text);
		if (!directive) {
			if (active()) tokenizeLine(text, line, raw);
			continue;
		}
		const [, name, rest] = directive;
		const arg = rest.trim();
		if (name === 'ifdef' || name === 'ifndef') {
			if (!/^[A-Za-z_]\w*$/.test(arg)) throw new CompileError(line, `Expected a name after #${name}`);
			conds.push({ taken: macros.has(arg) === (name === 'ifdef'), outer: active(), line });
		} else if (name === 'else') {
			const c = conds[conds.length - 1];
			if (!c) throw new CompileError(line, '#else without #ifdef');
			c.taken = !c.taken;
		} else if (name === 'endif') {
			if (!conds.pop()) throw new CompileError(line, '#endif without #ifdef');
		} else if (!active()) {
			continue;
		} else if (name === 'define') {
			const m = /^([A-Za-z_]\w*)(\(([^)]*)\))?(.*)$/.exec(arg);
			if (!m) throw new CompileError(line, 'Expected: #define NAME value');
			expand();
			let params: string[] | null = null;
			if (m[2] !== undefined) {
				params = m[3].trim() ? m[3].split(',').map((p) => p.trim()) : [];
				for (const p of params)
					if (!/^[A-Za-z_]\w*$/.test(p))
						throw new CompileError(line, `Invalid macro parameter "${p}"`);
			}
			const body: Token[] = [];
			tokenizeLine(m[4], line, body);
			if (macros.has(m[1])) warn(line, `Macro ${m[1]} is defined again`);
			macros.set(m[1], { params, body });
		} else if (name === 'undef') {
			expand();
			macros.delete(arg);
		} else if (name === 'include') {
			warn(line, '#include is ignored: there are no header files, and the built-in functions need none');
		} else if (name === 'pragma' || name === '') {
			// ignored
		} else if (name === 'error') {
			throw new CompileError(line, `#error ${arg}`);
		} else {
			throw new CompileError(line, `#${name} is not supported`);
		}
	}
	if (conds.length) throw new CompileError(conds[conds.length - 1].line, 'Missing #endif');
	expand();
	out.push(token('eof', '', physical.length));
	return out;
}
