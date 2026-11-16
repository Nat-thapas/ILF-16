# ILF-16 Emulator

Browser emulator, debugger and assembler for the ILF-16 CPU and ILF-GFX display. It assembles
`.asm` source directly, saves the `.rom.coe` / `.ram.coe` memory files for the FPGA (replacing
`../assembler-deprecated.py`), and can also load existing `.coe` images.

## Usage

```sh
pnpm install
pnpm dev        # development server
pnpm build      # static site in ./build (works from any sub-path)
pnpm preview    # serve the production build
pnpm test       # unit tests (assembler output is checked against the committed .coe files)
pnpm check      # type check
```

- **Save .coe** assembles the source and downloads `<name>.rom.coe` and `<name>.ram.coe`. The
  browser may ask once to allow multiple downloads.
- The name box next to the save buttons is the `<name>` used for saved files. Opening a file or
  an example fills it in, and it can be changed at any time.
- **Examples**: `vga-demo`, `bad-apple`, `mandelbrot` (fixed point maths with the multiplier),
  `game-of-life` (hold any bit of input 0 to reseed) and `snake` (set input 0 to *Game controller*,
  steer with d-pad 1, run in real time).
- **Run / Pause** (F8), **Step** (F10), **Reset**. Click the editor gutter to set breakpoints.
- **Speed**: *Real time* emulates the 48 MHz clock (12 MIPS, `STL` stalls for its true duration);
  *Unlimited* runs as fast as the machine allows and `STL` takes no time.
- Each of the 16 input ports can be switches, push buttons, a game controller, an analog stick or
  an integer field. Each of the 16 output ports can be LEDs, a 4×4 LED matrix or an integer.
- The display palette is editable (defaults to the ILF-GFX palette).

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
