# ILF-16
ILF-16 is a 16-bit cpu that runs on Spartan-6 FPGA.
The ILF-16 have 16 registers indexed with a 4-bit register identifier where R0 is the zero (readonly) register and R1-R15 are general purpose registers.
If assembly macros is used, R14 and R15 becomes temporary register and stack pointer register respectively.

## Specification And Details
ILF-16 is a load-store, harvard architecture 16 bits CPU. The CPU runs on a reduced instruction set with a flag register.
- 52 kiB (13,312 words) of instruction ROM.
- 16 kiB (8,192 words) of general purpose RAM (addressable 1 word at a time).
- 48 MHz clock
- 4 clocks per instruction (this is true for all instructions, including LOD STR and branch instructions, there is no pipelining or any other kind of performance optimization)
- 16x 16-bit general purpose input ports
- 16x 16-bit general purpose output ports
- 480 Mbps Spacewire transmitter dedicated for communication with ILF-GFX

## ISA

### Instructions Layout
ILF-16 uses fixed length instruction where an instruction is 2 words (32 bits) long. The instruction layout for the first (upper) 16 bits is IIIIIIIIAAXYDDDD where:
- I is the 8-bit instuction identifier.
- A is the argument count, can be 0, 1 or 2. 3 arguments is not supported.
- X is the type of the first argument, 0 = immediate, 1 = value at that register. If this argument is not used this is ignored.
- Y is the type of the second argument, 0 = immediate, 1 = value at that register. If this argument is not used this is ignored.
- D is the destination identifier for the operation.

The instruction layout for the second (lower) 16 bits is dependent on the type of the 2 arguments and can either be:
- 0 argument
    - This 16 bits of the instruction is ignored
- 1 argument
    - 000000000000AAAA : A is a register
    - AAAAAAAAAAAAAAAA : A is a 16-bit immediate value
- 2 arguments
    - AAAAAAAABBBBBBBB : A, B is an 8-bit immediate value
    - AAAABBBBBBBBBBBB : A is a register, B is a 12-bit immediate value
    - AAAAAAAAAAAABBBB : A is a 12-bit immediate value, B is a register
    - 0000AAAA0000BBBB : A, B is a register

### Instruction Format For Assembling
The format for assembly written for ILF-16 is: <INST> <DEST> <ARG_A> <ARG_B>
- INST is the instruction name.
- DEST is the destination identifier. This is not always used as the destination, see [Instuction Identifiers](#instruction-identifiers) for more details. Leave blank if not used.
- ARG_A is the A argument. Leave blank if not used
- ARG_B is the B argument. Leave blank if not used

Example of instructions and their descriptions:
- ADD $1 $2 5  : Add $2 (the value in register 2) and 5 (the literal number 5) together and store the result in $1 (register 1)
- NOP          : Do nothing
- BRN .label   : Branch to label
- BGT ~+2      : Branch to instruction at address 2 greater than the current instruction if the greater than flag is set
- NOT $2 $1    : Invert the bits in $1 (register 1) and store the result in $2 (register 2)
- More example of instruction usage can be found in bad-apple.asm and vga-demo.asm

Macros and pseudo instructions
- Apart from the instructions specified in the [Instuction Identifiers](#instruction-identifiers) section, there are 5 included psuedo instructions that can be used:
    1. PSH A : Push the value A on to the stack. A can be immediate value or a register
    2. POP R : Pop the value from the stack and store it to register R
    3. CAL   : Call a subroutine (branch to a label, when RET instruction is encounter, jump back to the next instruction after CAL)
    4. RET   : Return from a subroutine (branch back to the instruction after the CAL instruction that called this subroutine)
    5. DW I  : Define word, put the immediate value I into the next available memory space. DW instruction put data into memory sequentially, starting at #0. Any label defined for this instruction will point to the RAM location of the stored data. To define multiple words, use DW A B C D . . . (eg. DW 0x5 0x9 0x15 0xF8)

Special Directives
- @define A B : define A to be B, for example:
    - @define x_position R1 : define x_position to equal R1, anytime x_position is used as an argument in an instruction, it will automatically be converted to R1 by the assembler
- .name : define a label at that location, lable name can include any alphabets, numbers and not that special characters (_-!@/? etc.). Spaces is not allowed since it will make the argument have no termination, more special characters are not allowed cause I don't know how many of them are there and such can't account for them in testing.

### Instruction Identifiers
The ILF-16 supports a total of 256 instructions. Currently, the following is available:
- D  : Destination identifier (this is not always used as the destination)
- A  : First argument (can be either an immediate value or the value in the register at this identifier)
- B  : Second argument (can be either an immediate value or the value in the register at this identifier)
- $X : Value of the register number X
- #X : Value of the memory at address X
- %X : Value of the I/O port number X

| Binary Identifier | Hex Identifier | Name     | Have Dest | Arguments | Full name                     | Description                                  |
|------------------:|---------------:|----------|-----------|-----------|-------------------------------|----------------------------------------------|
| 00000000          | 00             | NOP      | False     | 0         | No operation                  | Do nothing (takes 4 cycles)                  |
| 00000100          | 04             | STL      | False     | 1         | Stall                         | Do nothing for A clock cycles (not CPU cycle) |
| 00001000          | 08             | HLT      | False     | 0         | Halt                          | Stop the CPU until restart                   |
| 00010000          | 10             | ADD      | True      | 2         | Add                           | $D = A + B                                   |
| 00010001          | 11             | SUB      | True      | 2         | Subtract                      | $D = A - B                                   |
| 00010010          | 12             | RSHIFT   | True      | 2         | Right shift                   | $D = A >> B                                  |
| 00010011          | 13             | LSHIFT   | True      | 2         | Left shift                    | $D = A << B                                  |
| 00010100          | 14             | MUL      | True      | 2         | Multiply                      | $D = A * B (unsigned, result is lower 16 bits) |
| 00010101          | 15             | SMUL     | True      | 2         | Signed multiply               | $D = A * B (signed, result is lower 16 bits) |
| 00010110          | 16             | UMUL     | True      | 2         | Upper multiply                | $D = A * B (unsigned, result is upper 16 bits) |
| 00010111          | 17             | SUMUL    | True      | 2         | Signed Upper multiply         | $D = A * B (signed, result is upper 16 bits) |
| 00011000          | 18             | PASS     | True      | 1         | Passthrough                   | $D = A                                       |
| 00011001          | 19             | NOT      | True      | 1         | Not                           | $D = ~A                                      |
| 00011010          | 1A             | AND      | True      | 2         | And                           | $D = A & B                                   |
| 00011011          | 1B             | OR       | True      | 2         | Or                            | $D = A | B                                   |
| 00011100          | 1C             | XOR      | True      | 2         | Xor                           | $D = A ^ B                                   |
| 00011101          | 1D             | NAND     | True      | 2         | Nand                          | $D = ~(A & B)                                |
| 00011110          | 1E             | NOR      | True      | 2         | Nor                           | $D = ~(A | B)                                |
| 00011111          | 1F             | XNOR     | True      | 2         | Xnor                          | $D = ~(A ^ B)                                |
| 00100000          | 20             | BGT      | False     | 1         | Branch if greater than        | Branch to A if greater than (unsigned)       |
| 00100001          | 21             | BLT      | False     | 1         | Branch if less than           | Branch to A if less than (unsigned)          |
| 00100010          | 22             | BSGT     | False     | 1         | Branch if signed greater than | Branch to A if greater than (signed)         |
| 00100011          | 23             | BSLT     | False     | 1         | Branch if signed less than    | Branch to A if less than (signed)            |
| 00100100          | 24             | BEQ      | False     | 1         | Branch if equal               | Branch to A if equal                         |
| 00100101          | 25             | BZ       | False     | 1         | Branch if zero                | Branch to A if zero                          |
| 00100110          | 26             | BNEG     | False     | 1         | Branch if negative            | Branch to A if negative                      |
| 00100111          | 27             | BPOS     | False     | 1         | Branch if positive            | Branch to A if positive                      |
| 00101000          | 28             | BEV      | False     | 1         | Branch if even                | Branch to A if even                          |
| 00101001          | 29             | BBEV     | False     | 1         | Branch if bitwise even        | Branch to A if bitwise even                  |
| 00101010          | 2A             | BC       | False     | 1         | Branch if carry               | Branch to A if carry/borrow                  |
| 00101011          | 2B             | BOF      | False     | 1         | Branch if overflow            | Branch to A if overflow                      |
| 00101100          | 2C             | Reserved | -         | -         | -                             | -                                            |
| 00101101          | 2D             | Reserved | -         | -         | -                             | -                                            |
| 00101110          | 2E             | Reserved | -         | -         | -                             | -                                            |
| 00101111          | 2F             | BRN      | False     | 1         | Branch                        | Branch to A                                  |
| 00110000          | 30             | BLE      | False     | 1         | Branch if less than or equal  | Branch to A if less than or equal (unsigned) |
| 00110001          | 31             | BGE      | False     | 1         | Branch if greater than or equal | Branch to A if greater than or equal (unsigned) |
| 00110010          | 32             | BSLE     | False     | 1         | Branch if signed less than or equal | Branch to A if less than or equal (signed) |
| 00110011          | 33             | BSGE     | False     | 1         | Branch if signed greater than or equal | Branch to A if greater than or equal (signed) |
| 00110100          | 34             | BNEQ     | False     | 1         | Branch if not equal           | Branch to A if not equal                     |
| 00110101          | 35             | BNZ      | False     | 1         | Branch if not zero            | Branch to A if not zero                      |
| 00110110          | 36             | BPOSZ    | False     | 1         | Branch if positive or zero    | Branch to A if positive or zero              |
| 00110111          | 37             | BNEGZ    | False     | 1         | Branch if negative or zero    | Branch to A if negative or zero              |
| 00111000          | 38             | BOD      | False     | 1         | Branch if odd                 | Branch to A if odd                           |
| 00111001          | 39             | BBOD     | False     | 1         | Branch if bitwise odd         | Branch to A if bitwise odd                   |
| 00111010          | 3A             | BNC      | False     | 1         | Branch if not carry           | Branch to A if not carry/borrow              |
| 00111011          | 3B             | BNOF     | False     | 1         | Branch if not overflow        | Branch to A if not overflow                  |
| 00111100          | 3C             | Reserved | -         | -         | -                             | -                                            |
| 00111101          | 3D             | Reserved | -         | -         | -                             | -                                            |
| 00111110          | 3E             | Reserved | -         | -         | -                             | -                                            |
| 00111111          | 3F             | Reserved | -         | -         | -                             | -                                            |
| 01000000          | 40             | SGT      | True      | 1-2       | Set if greater than           | $D = A if greater than (unsigned) else B     |
| 01000001          | 41             | SLT      | True      | 1-2       | Set if less than              | $D = A if less than (unsigned) else B        |
| 01000010          | 42             | SSGT     | True      | 1-2       | Set if signed greater than    | $D = A if greater than (signed) else B       |
| 01000011          | 43             | SSLT     | True      | 1-2       | Set if signed less than       | $D = A if less than (signed) else B          |
| 01000100          | 44             | SEQ      | True      | 1-2       | Set if equal                  | $D = A if equal else B                       |
| 01000101          | 45             | SZ       | True      | 1-2       | Set if zero                   | $D = A if zero else B                        |
| 01000110          | 46             | SNEG     | True      | 1-2       | Set if negative               | $D = A if negative else B                    |
| 01000111          | 47             | SPOS     | True      | 1-2       | Set if positive               | $D = A if positive else B                    |
| 01001000          | 48             | SEV      | True      | 1-2       | Set if even                   | $D = A if even else B                        |
| 01001001          | 49             | SBEV     | True      | 1-2       | Set if bitwise even           | $D = A if bitwise even else B                |
| 01001010          | 4A             | SC       | True      | 1-2       | Set if carry                  | $D = A if carry/borrow else B                |
| 01001011          | 4B             | SOF      | True      | 1-2       | Set if overflow               | $D = A if overflow else B                    |
| 01001100          | 4C             | Reserved | -         | -         | -                             | -                                            |
| 01001101          | 4D             | Reserved | -         | -         | -                             | -                                            |
| 01001110          | 4E             | Reserved | -         | -         | -                             | -                                            |
| 01001111          | 4F             | MOV      | True      | 1         | Move                          | $D = A (this instruction is the same as LDI) |
| 01001111          | 4F             | LDI      | True      | 1         | Load immediate                | $D = A (this instruction is the same as MOV) |
| 01010000          | 50             | SLE      | True      | 1-2       | Set if less than or equal     | $D = A if less than or equal (unsigned) else B |
| 01010001          | 51             | SGE      | True      | 1-2       | Set if greater than or equal  | $D = A if greater than or equal (unsigned) else B |
| 01010010          | 52             | SSLE     | True      | 1-2       | Set if signed less than or equal | $D = A if less than or equal (signed) else B |
| 01010011          | 53             | SSGE     | True      | 1-2       | Set if signed greater than or equal | $D = A if greater than or equal (signed) else B |
| 01010100          | 54             | SNEQ     | True      | 1-2       | Set if not equal              | $D = A if not equal else B                   |
| 01010101          | 55             | SNZ      | True      | 1-2       | Set if not zero               | $D = A if not zero else B                    |
| 01010110          | 56             | SPOSZ    | True      | 1-2       | Set if positive or zero       | $D = A if positive or zero else B            |
| 01010111          | 57             | SNEGZ    | True      | 1-2       | Set if negative or zero       | $D = A if negative or zero else B            |
| 01011000          | 58             | SOD      | True      | 1-2       | Set if odd                    | $D = A if odd else B                         |
| 01011001          | 59             | SBOD     | True      | 1-2       | Set if bitwise odd            | $D = A if bitwise odd else B                 |
| 01011010          | 5A             | SNC      | True      | 1-2       | Set if not carry              | $D = A if not carry/borrow else B            |
| 01011011          | 5B             | SNOF     | True      | 1-2       | Set if not overflow           | $D = A if not overflow else B                |
| 01011100          | 5C             | Reserved | -         | -         | -                             | -                                            |
| 01011101          | 5D             | Reserved | -         | -         | -                             | -                                            |
| 01011110          | 5E             | Reserved | -         | -         | -                             | -                                            |
| 01011111          | 5F             | Reserved | -         | -         | -                             | -                                            |
| 11000000          | C0             | LOD      | True      | 1         | Load                          | $D = #A                                      |
| 11000100          | C4             | STR      | True      | 1         | Store                         | #A = $D                                      |
| 11001000          | C8             | IN       | True      | 1         | Input                         | $D = %A                                      |
| 11001100          | CC             | OUT      | True      | 1         | Output                        | %A = $D                                      |
| 11010000          | D0             | GFXSP    | True      | 2         | GFX set pixel                 | Set pixel at (x: A, y: B) to color $D        |

Notes: 
- Reserved instructions are side effect instructions from how the CPU decode instructions, these may or may not do anything and have undefined behavior.
- All instructions from 0x10 to 0x1F (ALU instructions) will set all the ALU flags according to the arguments provided, the TEST instruction simply set the ALU inputs, load the resulting flag into the flag register and do nothing with the ALU output (by sending it to R0, which is read-only).
- Set instructions set the destination register to A if the condition is true, otherwise set the register to B. If only one argument is provided B will be set to 0.

## Buttons
The ILF-16 by default have 3 buttons that have the following functions:
- Button 1 clears the Spacewire input (from ILF-EXTIO, if attached) buffer.
- Button 2 start the operation, ILF-16 will not do anything before this button is pressed. Pressing it again have no effect.
- Button 3 temporarily stalls the ILF-16, ILF-16 will stop in its current state when this button is held. Releasing the button will resume the operation. Holding this button before starting have no effect.

## Internals

### ALU
The ALU or arithmatic logic unit is a purely combinational component with no register or accumulator.
1. Inputs:
    - OP: 4-bits operation selector
    - A : 16-bit operand
    - B : 16-bit operand
2. Outputs:
    - O : 16-bit result of the operation
    - F : 16-bit flag output, the flag is directly derived from the input and/or O, there is no flag register
3. Op codes:
    The ALU takes in a 4-bit op code, which tells the ALU with operation to perform.
    - 0000 : ADD    (O = A + B)
    - 0001 : SUB    (O = A - B)
    - 0010 : RSHIFT (O = A >> B) Unsigned bitwise right shift, non-cyclic, the shifted out bit is lost
    - 0011 : LSHIFT (O = A << B) Unsigned bitwise left shift, non-cyclic, the shifted out bit is lost
    - 0100 : MUL    (O = A * B) Unsigned multiply, result is the lower 16 bits
    - 0101 : SMUL   (O = A * B) Signed multiply, result is the lower 16 bits
    - 0110 : UMUL   (O = A * B) Unsigned multiply, result is the upper 16 bits
    - 0111 : SUMUL  (O = A * B) Signed multiply, result is the upper 16 bits
    - 1000 : NOT A  (O = ~A)
    - 1001 : NOT B  (O = ~B)
    - 1010 : AND    (O = A & B)
    - 1011 : OR     (O = A | B)
    - 1100 : XOR    (O = A ^ B)
    - 1101 : NAND   (O = ~(A & B))
    - 1110 : NOR    (O = ~(A | B))
    - 1111 : XNOR   (O = ~(A ^ B))
4. Flags:
    The ALU have 1 16-bit output flag. From LSB to MSB they are the following.
    - 00 : GT   : A > B   Greater than (unsinged)
    - 01 : LT   : A < B   Less than (unsinged)
    - 02 : SGT  : A > B   Signed Greater than
    - 03 : SLT  : A < B   Signed Less than
    - 04 : EQ   : A = B   Equal
    - 05 : Z    : O = 0   Zero(O)
    - 06 : S    : O < 0   Sign(O)
    - 07 : POS  : O > 0   Positive(O)
    - 08 : P    :         Parity(O) Even = 1, Odd = 0
    - 09 : BP   :         BitwiseParity(O) Even = 1, Odd = 0
    - 10 : C    :         Carry / Borrow, this flag is undefined when operation is not add or subtract
    - 11 : OF   :         Overflow, this flag is undefined when operation is not add or subtract
    - 12 : N/A  :         Not Available (always 0)
    - 13 : N/A  :         Not Available (always 0)
    - 14 : N/A  :         Not Available (always 0)
    - 15 : TR   : 1       True


# ILF-GFX
ILF-GFX is a "graphic processor" that is designed to be used with ILF-16, in its current state, it's basically an external dual port RAM with vga driver attached to it, no other function is supported except set pixel.

## Communication
The ILF-16 and ILF-GFX communicate with each other via 2 lanes of 240 Mbps Spacewire link (totaling 480 Mbps). The communication does not use the full Spacewire protocol but only the physical layer of it, since the ILF-GFX is connected on a dedicated port and will be the only device to connect to that port, any higher layer of the protocol is unnecessary.
The data link have no redundancy, no error checking, no synchronization. As such the link will break with only a single bit of error on either lane. In case of an error, the ILF-GFX will not display the expected output, there are 2 ways to fix this.
1. Temporarily stall the ILF-16 outside of any draw loop by holding push button 3, then clear the buffer of the ILF-GFX by pressing button 1, then resume the ILF-16.
2. Reset both the ILF-16 and the ILF-GFX

## Buttons
The ILF-GFX by default have 2 buttons that have the following functions:
- Button 1 clears the Spacewire input (from ILF-16) buffer.
- Button 2 start the operation, ILF-GFX will not do anything before this button is pressed. Pressing it again have no effect.

## Startup Sequence
The recommended start sequence for ILF-16 attached to an ILF-GFX is to first reset the ILF-GFX board when the ILF-16 have powered up (but not started) then start the ILF-GFX by pressing button 2, then start the ILF-16 by pressing button 2.

## Output
The ILF-GFX have 2 bits per color output. External DAC must be connected to this. The sync output can be used directly if the monitor supports 3.3v sync signals.

## Color palette
The default palette of ILF-GFX is the palette used on the [PICO-8](https://pico-8.fandom.com/wiki/Palette) mapped to RGB222 on a best-effort basis:

| Color Index | Color Name  | R  | G  | B  | Equivalent RGB888 |
|-------------|-------------|----|----|----|-------------------|
| 0000  (0x0) | Black       | 00 | 00 | 00 | #000000           |
| 0001  (0x1) | Dark Blue   | 00 | 00 | 01 | #000062           |
| 0010  (0x2) | Dark Purple | 01 | 00 | 01 | #620062           |
| 0011  (0x3) | Dark Green  | 00 | 01 | 00 | #006200           |
| 0100  (0x4) | Brown       | 10 | 01 | 00 | #ba6200           |
| 0101  (0x5) | Dark Gray   | 01 | 01 | 01 | #626262           |
| 0110  (0x6) | Light Gray  | 10 | 10 | 10 | #bababa           |
| 0111  (0x7) | White       | 11 | 11 | 11 | #ffffff           |
| 1000  (0x8) | Red         | 11 | 00 | 01 | #ff0062           |
| 1001  (0x9) | Orange      | 11 | 01 | 00 | #ff6200           |
| 1010  (0xA) | Yellow      | 11 | 11 | 01 | #ffff62           |
| 1011  (0xB) | Green       | 00 | 11 | 01 | #00ff62           |
| 1100  (0xC) | Blue        | 00 | 10 | 11 | #00baff           |
| 1101  (0xD) | Purple      | 10 | 01 | 10 | #ba62ba           |
| 1110  (0xE) | Pink        | 11 | 01 | 10 | #ff62ba           |
| 1111  (0xF) | Light Pink  | 11 | 10 | 10 | #ffbaba           |


# ILF-EXTIO
ILF-EXTIO is an unfinished and untested IO extension for the ILF-16. In its current state, only the on-board buttons are used.
No more information about the ILF-EXTIO is available at this time.

# Assembler

The current version of the assembler is quite hastily thrown together, expect bugs during real usage. The warning and error system is not well implemented, do not rely on the assembler to catch your mistake, even something as bad and simple as wrong argument type usage will NOT be detected. There are plans to improve this in the future, including partial support for transpilation from [URCL](https://github.com/ModPunchtree/URCL)

## Usage
To use the assembler, simply call the assembler with the path to assembly file as the argument, the assembler will that assemble the code into 2 files:
1. <name>.rom.coe : this is the memory coefficient file for the instruction ROM. Load this file into rom.xco
2. <name>.ram.coe : this is the memory coefficient file for the general purpose RAM. This file will not contain memory data if no DW instruction is used. Load this file into ram.xco if neccessary.

