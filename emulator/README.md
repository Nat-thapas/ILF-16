# ILF-16 Emulator

Browser emulator, debugger, assembler and C compiler for the ILF-16 CPU and ILF-GFX display. It
assembles `.asm` source directly, compiles `.c` source (see [C](#c)), saves the `.rom.coe` /
`.ram.coe` memory files for the FPGA (replacing `../assembler-deprecated.py`), and can also
load existing `.coe` images.

## Usage

```sh
pnpm install
pnpm dev        # development server
pnpm build      # static site in ./build (works from any sub-path)
pnpm preview    # serve the production build
pnpm test       # unit tests (assembler output is checked against reference .coe files)
pnpm check      # type check
```

- **Save .coe** assembles the source and downloads `<name>.rom.coe` and `<name>.ram.coe`. The
  browser may ask once to allow multiple downloads.
- The name box next to the save buttons is the `<name>` used for saved files. Opening a file or
  an example fills it in, and it can be changed at any time.
- The language box next to it says whether the source is assembly or C. Opening a `.c` file or
  a C example switches it.
- **Examples** (from `../examples`, each one in assembly and in C): `vga-demo`, `bad-apple`, `mandelbrot` (fixed point maths with
  the multiplier), `mandelbrot-zoom` (the same, animated), `game-of-life` (hold any bit of input 0
  to reseed), `snake` (set input 0 to *Game controller*, steer with d-pad 1, run in real time),
  `cube` (3D wireframe; set input 0 to *Analog stick* to turn it yourself), `numbers` (Fibonacci
  and prime numbers printed in decimal and hexadecimal; hold any bit of input 0 to skip the pauses),
  `raycaster` (first-person maze; set input 0 to *Game controller*, walk and turn with d-pad 1),
  `blocks` (falling-block puzzle; same controls, run in real time) and `fire` (flame effect; hold
  any bit of input 0 to put it out).
- **Run / Pause** (F8), **Step** (F10), **Reset**. Click the editor gutter to set breakpoints.
  In C, Step runs to the next line of the source, and a breakpoint stops wherever its line is
  entered (for a loop that is every time round).
- **View assembly** (C only) shows the assembly the compiler generated, with the C lines as
  comments. While it is on show, breakpoints, stepping and the heat map work on the
  instructions, and `Save .asm` saves it.
- **Heat map** shades each line by how often it has run since the last reset and shows its share
  of all executed instructions next to the line number (hover for the exact count, and for `STL`
  lines the time spent waiting). Every instruction takes the same time, so the share is also the
  share of CPU time, not counting `STL` waits.
- **Speed**: *Real time* emulates the 48 MHz clock (12 MIPS, `STL` stalls for its true duration);
  *Unlimited* runs as fast as the machine allows and `STL` takes no time.
- Each of the 16 input ports can be switches, push buttons, a game controller, an analog stick or
  an integer field. Each of the 16 output ports can be LEDs, a 4×4 LED matrix or an integer.
- The display palette is editable (defaults to the ILF-GFX palette).

## C

The compiler takes a subset of C and produces assembly, which then goes through the assembler.
The C examples draw exactly what the assembly ones do, in about the same number of
instructions (`pnpm test` checks both).

**Everything is one 16-bit word**: `int`, `unsigned`, `char`, `short` and pointers, so
`sizeof(int)` is 1 and a string takes one word per character. There is no `long` and no
floating point. Shifting a signed number right keeps its sign; use `unsigned` where you can,
as its shifts, divisions and comparisons are cheaper.

**The hardware** is reached through built-in functions, each a single instruction:

| Function               | Does                                                                |
|------------------------|---------------------------------------------------------------------|
| `pixel(x, y, color)`   | sets a pixel (`GFXSP`)                                              |
| `in(port)`             | reads an input port                                                 |
| `out(port, value)`     | writes an output port                                               |
| `stall(clocks)`        | waits that many clock cycles, 48000 per millisecond (`STL`)         |
| `halt()`               | stops the CPU                                                       |
| `mulhi(a, b)`          | upper word of the signed 32-bit product (`SUMUL`), for fixed point  |
| `umulhi(a, b)`         | the same, unsigned (`UMUL`)                                         |

**Supported**: global and local variables with initial values, arrays (of any dimensions),
pointers and pointer arithmetic, `struct`, `enum`, `typedef`, strings, functions (recursion,
any number of parameters, function pointers), every operator, `if`, `while`, `do`, `for`,
`switch`, `break`, `continue`, `goto`, `static`, and in the preprocessor `#define` (with or
without parameters), `#undef`, `#ifdef`, `#ifndef`, `#else` and `#endif`. Number literals can
also be binary (`0b1010`).

**Not supported**: `long`, `float`, `double`, `union`, bit fields, structs passed to or
returned from functions or assigned as a whole (use pointers and members), functions with a
variable number of arguments, `#include` (there is nothing to include) and `#if`. A function
has to be defined, or declared with a prototype, before it is called.

**How it uses the machine**, which matters when making a program fast:

- Local variables live in registers: up to 11 in a function that calls no other function, 8
  otherwise. The rest, and any variable whose address is taken, go on the stack, where each
  use costs two or three instructions. Global variables cost one instruction to read or write.
- A call costs a few instructions plus four for every register the called function has to
  save. Functions that call nothing and use few variables save nothing. Use a `#define` with
  parameters for something tiny that is needed in an inner loop.
- `*` is one instruction. `/` and `%` are one or two instructions by a constant power of two
  (or, for `unsigned`, by most other constants), and otherwise a routine of about 170
  instructions.
- A constant above 4095 has to be loaded into a register first. In an inner loop, keep it in a
  local variable; the same goes for the colour given to `pixel`.
- Globals with initial values are part of the RAM image, so they are only set when the FPGA is
  configured, not when the CPU restarts. Globals without one start as 0 and are not in the
  image. The stack grows down from the top of RAM.

## I/O bit layouts

| Widget          | Layout                                                                                         |
|-----------------|------------------------------------------------------------------------------------------------|
| Game controller | bits 0–3 / 4–7 / 8–11: up, down, left, right of d-pad 1 / 2 / 3; bits 12–15: buttons A, B, X, Y |
| Analog stick    | low byte: signed X, −127…+127 (right positive); high byte: signed Y, −127…+127 (up positive)                    |
| 4×4 LED matrix  | bit 0 top-left, left to right, top to bottom                                                    |

## Hardware details the emulator follows

Taken from the schematics (`ILF-16/*.sch`, via the generated netlists) where they differ from or
add to the top-level README:

- `STL`, `HLT`, `LOD`, `STR`, `IN`, `OUT`, `GFXSP` decode on the top 6 opcode bits only; any other
  undocumented opcode is a NOP.
- Immediates are zero-extended. With one argument B is 0.
- Flags are latched only by opcodes `0x10`–`0x1F`. Carry is the carry of A+B for even ALU ops and
  the borrow of A−B for odd ones, whatever the operation.
- Shifts by 16 or more give 0. RAM addresses wrap at 8192 words.
