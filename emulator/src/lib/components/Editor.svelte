<script lang="ts">
	import { onMount } from 'svelte';
	import { basicSetup } from 'codemirror';
	import { Compartment, EditorState, RangeSet, StateEffect, StateField } from '@codemirror/state';
	import { Decoration, EditorView, GutterMarker, gutter, keymap } from '@codemirror/view';
	import { indentWithTab } from '@codemirror/commands';
	import { HighlightStyle, StreamLanguage, syntaxHighlighting } from '@codemirror/language';
	import { setDiagnostics, type Diagnostic as CmDiagnostic } from '@codemirror/lint';
	import { tags } from '@lezer/highlight';
	import { INSTRUCTIONS_BY_NAME, PSEUDO_INSTRUCTIONS } from '#lib/core/isa.ts';
	import type { Diagnostic } from '#lib/core/assembler.ts';
	import { CLOCK_HZ } from '#lib/core/isa.ts';
	import type { LineProfile } from '#lib/core/profile.ts';

	interface Props {
		initialDoc: string;
		/** 1-based line to highlight as the next instruction, 0 for none. */
		currentLine: number;
		diagnostics: Diagnostic[];
		/** Execution counts per line to show as a heat map, or null for none. */
		heat?: LineProfile | null;
		/** Show the document as a non-editable listing (breakpoints still work). */
		readOnly?: boolean;
		onDocChange: (doc: string) => void;
		onBreakpointsChange: (lines: number[]) => void;
	}
	let {
		initialDoc,
		currentLine,
		diagnostics,
		heat = null,
		readOnly = false,
		onDocChange,
		onBreakpointsChange
	}: Props = $props();

	const readOnlyCompartment = new Compartment();
	const readOnlyExtension = (on: boolean) => [EditorState.readOnly.of(on), EditorView.editable.of(!on)];

	let host: HTMLDivElement;
	let view: EditorView | undefined;

	// --- breakpoints -------------------------------------------------------------------------
	const toggleBreakpoint = StateEffect.define<{ pos: number; on: boolean }>({
		map: (value, mapping) => ({ pos: mapping.mapPos(value.pos), on: value.on })
	});
	const clearBreakpoints = StateEffect.define<null>();

	class BreakpointMarker extends GutterMarker {
		toDOM() {
			const dot = document.createElement('div');
			dot.className = 'cm-breakpoint-dot';
			return dot;
		}
	}
	const breakpointMarker = new BreakpointMarker();

	const breakpointField = StateField.define<RangeSet<GutterMarker>>({
		create: () => RangeSet.empty,
		update(set, tr) {
			set = set.map(tr.changes);
			for (const effect of tr.effects) {
				if (effect.is(toggleBreakpoint)) {
					set = effect.value.on
						? set.update({ add: [breakpointMarker.range(effect.value.pos)] })
						: set.update({ filter: (from) => from !== effect.value.pos });
				} else if (effect.is(clearBreakpoints)) set = RangeSet.empty;
			}
			return set;
		}
	});

	function toggleAt(v: EditorView, pos: number) {
		const lineStart = v.state.doc.lineAt(pos).from;
		let has = false;
		v.state.field(breakpointField).between(lineStart, lineStart, () => {
			has = true;
		});
		v.dispatch({ effects: toggleBreakpoint.of({ pos: lineStart, on: !has }) });
	}

	function breakpointLines(state: EditorState): number[] {
		const lines = new Set<number>();
		const cursor = state.field(breakpointField).iter();
		while (cursor.value) {
			lines.add(state.doc.lineAt(cursor.from).number);
			cursor.next();
		}
		return [...lines];
	}

	const breakpointGutter = [
		breakpointField,
		gutter({
			class: 'cm-breakpoint-gutter',
			markers: (v) => v.state.field(breakpointField),
			initialSpacer: () => breakpointMarker,
			domEventHandlers: {
				mousedown(v, line) {
					toggleAt(v, line.from);
					return true;
				}
			}
		})
	];

	// --- current instruction highlight -----------------------------------------------------
	const setCurrentLine = StateEffect.define<number>();
	const currentLineDeco = Decoration.line({ class: 'cm-pc-line' });
	const currentLineField = StateField.define({
		create: () => Decoration.none,
		update(deco, tr) {
			deco = deco.map(tr.changes);
			for (const effect of tr.effects) {
				if (effect.is(setCurrentLine)) {
					const n = effect.value;
					deco =
						n >= 1 && n <= tr.state.doc.lines
							? Decoration.set([currentLineDeco.range(tr.state.doc.line(n).from)])
							: Decoration.none;
				}
			}
			return deco;
		},
		provide: (field) => EditorView.decorations.from(field)
	});

	// --- heat map ---------------------------------------------------------------------------
	// Lines are shaded by how often they ran (square root scale, so that lines well below the
	// hottest one still show), with their share of all executed instructions in a gutter.
	const HEAT_LEVELS = 24;
	const heatDecos = Array.from({ length: HEAT_LEVELS + 1 }, (_, level) =>
		Decoration.line({
			attributes: {
				style: `background-color: rgba(255, 82, 48, ${(0.05 + 0.5 * (level / HEAT_LEVELS)).toFixed(3)})`
			}
		})
	);

	class HeatMarker extends GutterMarker {
		readonly text: string;
		readonly title: string;
		constructor(text: string, title: string) {
			super();
			this.text = text;
			this.title = title;
		}
		eq(other: HeatMarker) {
			return other.text === this.text && other.title === this.title;
		}
		toDOM() {
			const el = document.createElement('div');
			el.textContent = this.text;
			el.title = this.title;
			return el;
		}
	}
	const heatSpacer = new HeatMarker('100.0%', '');

	const setHeat = StateEffect.define<LineProfile | null>();
	const noHeat = { lines: Decoration.none, markers: RangeSet.empty as RangeSet<GutterMarker> };
	const heatField = StateField.define({
		create: () => noHeat,
		update(value, tr) {
			if (tr.docChanged) value = { lines: value.lines.map(tr.changes), markers: value.markers.map(tr.changes) };
			for (const effect of tr.effects) {
				if (!effect.is(setHeat)) continue;
				const profile = effect.value;
				if (!profile || profile.total === 0) {
					value = noHeat;
					continue;
				}
				const doc = tr.state.doc;
				const lines = [];
				const markers = [];
				const last = Math.min(doc.lines, profile.counts.length - 1);
				for (let n = 1; n <= last; n++) {
					const count = profile.counts[n];
					if (count === 0) continue;
					const from = doc.line(n).from;
					const level = Math.round(Math.sqrt(count / profile.max) * HEAT_LEVELS);
					lines.push(heatDecos[level].range(from));
					const share = (count / profile.total) * 100;
					let title = `Ran ${count.toLocaleString('en-US')} times: ${share.toPrecision(3)}% of all instructions`;
					if (profile.stall[n] > 0) {
						title += `, and waited ${(profile.stall[n] / CLOCK_HZ).toPrecision(3)} s in STL`;
					}
					markers.push(new HeatMarker(share < 0.05 ? '<0.1%' : share.toFixed(1) + '%', title).range(from));
				}
				value = { lines: Decoration.set(lines), markers: RangeSet.of(markers) };
			}
			return value;
		},
		provide: (field) => EditorView.decorations.from(field, (value) => value.lines)
	});
	const heatGutter = gutter({
		class: 'cm-heat-gutter',
		markers: (v) => v.state.field(heatField).markers,
		initialSpacer: () => heatSpacer
	});
	const heatGutterCompartment = new Compartment();

	// --- syntax highlighting ---------------------------------------------------------------
	const language = StreamLanguage.define<{ first: boolean }>({
		startState: () => ({ first: true }),
		token(stream, state) {
			if (stream.sol()) state.first = true;
			if (stream.eatSpace()) return null;
			if (stream.peek() === ';') {
				stream.skipToEnd();
				return 'comment';
			}
			const first = state.first;
			state.first = false;
			stream.match(/^\S+/);
			const word = stream.current().toLowerCase();
			if (first) {
				if (word.startsWith('.')) return 'labelName';
				if (word === '@define' || word === '#define') return 'meta';
				if (INSTRUCTIONS_BY_NAME.has(word) || PSEUDO_INSTRUCTIONS.includes(word)) return 'keyword';
				return null;
			}
			if (word.startsWith('.') || word.startsWith('~')) return 'labelName';
			if (/^[$r]\d+$/.test(word) || word === 'sp') return 'variableName';
			if (/^[%#mp]?(0x[0-9a-f_]+|0b[01_]+|0o[0-7_]+|[+-]?\d[\d_]*)$/.test(word)) return 'number';
			return 'atom';
		}
	});

	const highlight = HighlightStyle.define([
		{ tag: tags.comment, color: '#6b7689', fontStyle: 'italic' },
		{ tag: tags.keyword, color: '#7cb7ff' },
		{ tag: tags.labelName, color: '#f2c14e' },
		{ tag: tags.meta, color: '#c792ea' },
		{ tag: tags.variableName, color: '#7ee0a3' },
		{ tag: tags.number, color: '#ff9d7a' },
		{ tag: tags.atom, color: '#9ad1d4' }
	]);

	const theme = EditorView.theme(
		{
			'&': { height: '100%', backgroundColor: 'var(--panel)', color: 'var(--text)' },
			'.cm-scroller': { fontFamily: 'var(--mono)', fontSize: '13px', lineHeight: '1.45' },
			'.cm-gutters': {
				backgroundColor: 'var(--panel)',
				color: 'var(--muted)',
				border: 'none',
				borderRight: '1px solid var(--border)'
			},
			'.cm-activeLine, .cm-activeLineGutter': { backgroundColor: 'rgba(255,255,255,0.04)' },
			'.cm-cursor': { borderLeftColor: 'var(--text)' },
			'&.cm-focused .cm-selectionBackground, .cm-selectionBackground, ::selection': {
				backgroundColor: 'rgba(124,183,255,0.25)'
			},
			'.cm-breakpoint-gutter': { width: '16px', cursor: 'pointer' },
			'.cm-breakpoint-gutter .cm-gutterElement': {
				display: 'flex',
				alignItems: 'center',
				justifyContent: 'center'
			},
			'.cm-breakpoint-dot': {
				width: '10px',
				height: '10px',
				borderRadius: '50%',
				backgroundColor: 'var(--red)'
			},
			'.cm-heat-gutter': { color: '#ff9d7a', fontSize: '11px' },
			'.cm-heat-gutter .cm-gutterElement': { padding: '0 4px 0 6px', textAlign: 'right' },
			'.cm-pc-line': { backgroundColor: 'rgba(242,193,78,0.22) !important' },
			'.cm-tooltip': { backgroundColor: 'var(--panel-2)', border: '1px solid var(--border)' }
		},
		{ dark: true }
	);

	onMount(() => {
		view = new EditorView({
			parent: host,
			state: EditorState.create({
				doc: initialDoc,
				extensions: [
					breakpointGutter,
					basicSetup,
					readOnlyCompartment.of(readOnlyExtension(false)),
					keymap.of([indentWithTab]),
					EditorState.tabSize.of(4),
					language,
					syntaxHighlighting(highlight),
					heatField,
					heatGutterCompartment.of([]),
					currentLineField,
					theme,
					EditorView.updateListener.of((update) => {
						if (update.docChanged) onDocChange(update.state.doc.toString());
						const bpChanged = update.transactions.some((tr) =>
							tr.effects.some((e) => e.is(toggleBreakpoint) || e.is(clearBreakpoints))
						);
						if (bpChanged || update.docChanged) {
							const before = breakpointLines(update.startState);
							const after = breakpointLines(update.state);
							if (bpChanged || before.join() !== after.join()) onBreakpointsChange(after);
						}
					})
				]
			})
		});
		return () => view?.destroy();
	});

	/** Replace the whole document (also clears breakpoints). */
	export function setDoc(doc: string) {
		if (!view) return;
		view.dispatch({
			changes: { from: 0, to: view.state.doc.length, insert: doc },
			effects: clearBreakpoints.of(null)
		});
		view.scrollDOM.scrollTop = 0;
	}

	$effect(() => {
		const on = readOnly;
		view?.dispatch({ effects: readOnlyCompartment.reconfigure(readOnlyExtension(on)) });
	});

	$effect(() => {
		const line = currentLine;
		if (!view) return;
		const effects: StateEffect<unknown>[] = [setCurrentLine.of(line)];
		if (line >= 1 && line <= view.state.doc.lines) {
			effects.push(EditorView.scrollIntoView(view.state.doc.line(line).from, { y: 'nearest', yMargin: 60 }));
		}
		view.dispatch({ effects });
	});

	let heatGutterShown = false;
	$effect(() => {
		const profile = heat;
		if (!view) return;
		const effects: StateEffect<unknown>[] = [setHeat.of(profile)];
		if (heatGutterShown !== !!profile) {
			heatGutterShown = !!profile;
			effects.push(heatGutterCompartment.reconfigure(profile ? heatGutter : []));
		}
		view.dispatch({ effects });
	});

	$effect(() => {
		const list = diagnostics;
		if (!view) return;
		const doc = view.state.doc;
		const mapped: CmDiagnostic[] = list
			.filter((d) => d.line >= 1 && d.line <= doc.lines)
			.map((d) => {
				const line = doc.line(d.line);
				return { from: line.from, to: line.to, severity: d.severity, message: d.message };
			});
		view.dispatch(setDiagnostics(view.state, mapped));
	});
</script>

<div class="editor" bind:this={host}></div>

<style>
	.editor {
		height: 100%;
		min-height: 0;
		overflow: hidden;
	}
</style>
