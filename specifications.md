# ILF-16
ILF-16 is a 16-bit cpu that runs on Spartan-6 FPGA.
The ILF-16 have 16 registers indexed with a 4-bit register identifier where R0 is the zero (readonly) register and R1-R15 are general purpose registers.


## ISA

### Instructions Layout
ILF-16 uses a variable length instruction where an instruction could be either 16 or 32 bits long. The instruction layout for the first 16 bits is IIIIIIIISABCTTTT where:
- I is the instuction identifier.
- S is the size of the instruction, 0 = 1 word instruction, 1 = 2 words instruction.
All instructions with argument are 2 words long.
- A is the argument count, 0 = 1 argument, 1 = 2 arguments. For instructions with no argument this is ignored.
- B is the type of the first argument, 0 = immediate, 1 = value at that register. For instructions with no argument this is ignored.
- C is the type of the second argument, 0 = immediate, 1 = value at that register. For instructions with no argument this is ignored.
- T is the target/destination register/port for the operation.

The instruction layout for the second 16 bits (where applicable) is dependent on the type of the 2 arguments and can either be:
- 1 argument
    - 000000000000AAAA : A is a register
    - AAAAAAAAAAAAAAAA : A is a 16-bit immediate value
- 2 arguments
    - AAAAAAAABBBBBBBB : A, B is an 8-bit immediate value
    - AAAABBBBBBBBBBBB : A is a register, B is a 12-bit immediate value
    - AAAAAAAAAAAABBBB : A is a 12-bit immediate value, B is a register
    - 0000AAAA0000BBBB : A, B is a register

### Instruction Identifiers
The ILF-16 supports a total of 256 instructions. Currently, the following is available/planned:
(T = target/destination register/port. A, B are the first and second argument)
| Binary Identifier | Hex Identifier | Name     | Length (words) | Arguments | Description                  |
|------------------:|---------------:|----------|----------------|-----------|------------------------------|
| 00000000          | 00             | NOP      | 1              | -         | Do nothing (takes 2 cycles)  |
| 00000001          | 01             | STL      | 1              | -         | Stall for 4 cycles           |
| 00000010          | 02             | LST      | 1              | -         | Stall for 6 cycles           |
| 00000011          | 03             | XLST     | 1              | -         | Stall for 10 cycles          |
| 00010000          | 10             | ADD      | 2              | 2         | T = A + B                    |
| 00010001          | 11             | ADC      | 2              | 2         | T = A + B + 1                |
| 00010010          | 12             | SUB      | 2              | 2         | T = A - B                    |
| 00010011          | 13             | SBB      | 2              | 2         | T = A - B - 1                |
| 00010100          | 14             | MUL      | 2              | 2         | T+1, T = A * B               |
| 00010101          | 15             | SMUL     | 2              | 2         | T+1, T = A * B               |
| 00010110          | 16             | RSHIFT   | 2              | 2         | T = A >> B                   |
| 00010111          | 17             | LSHIFT   | 2              | 2         | T = A << B                   |
| 00011000          | 18             | NOT      | 2              | 1         | T = ~A                       |
| 00011001          | 19             | FLG      | 2              | 2         | Set ALU flags, T must be R0  |
| 00011010          | 1A             | AND      | 2              | 2         | T = A & B                    |
| 00011011          | 1B             | OR       | 2              | 2         | T = A | B                    |
| 00011100          | 1C             | XOR      | 2              | 2         | T = A ^ B                    |
| 00011101          | 1D             | NAND     | 2              | 2         | T = ~(A & B)                 |
| 00011110          | 1E             | NOR      | 2              | 2         | T = ~(A | B)                 |
| 00011111          | 1F             | XNOR     | 2              | 2         | T = ~(A ^ B)                 |
| 00100000          | 20             | BGT      | 2              | 1         | Branch if greater than (unsigned) |
| 00100001          | 21             | BGE      | 2              | 1         | Branch if greater than or equal (unsigned) |
| 00100010          | 22             | BLT      | 2              | 1         | Branch if less than (unsigned) |
| 00100011          | 23             | BLE      | 2              | 1         | Branch if less than or equal (unsigned) |
| 00100100          | 24             | BSGT     | 2              | 1         | Branch if greater than (signed) |
| 00100101          | 25             | BSGE     | 2              | 1         | Branch if greater than or equal (signed) |
| 00100110          | 26             | BSLT     | 2              | 1         | Branch if less than (signed) |
| 00100111          | 27             | BSLE     | 2              | 1         | Branch if less than or equal (signed) |
| 00101000          | 28             | BEQ      | 2              | 1         | Branch if equal              |
| 00101001          | 29             | BZ       | 2              | 1         | Branch if zero               |
| 00101010          | 2A             | BNEG     | 2              | 1         | Branch if negative           |
| 00101011          | 2B             | BEVN     | 2              | 1         | Branch if even               |
| 00101100          | 2C             | BBEVN    | 2              | 1         | Branch if bitwise even       |
| 00101101          | 2D             | BC       | 2              | 1         | Branch if carry/borrow       |
| 00101110          | 2E             | BOF      | 2              | 1         | Branch if overflow           |
| 00101111          | 2F             | BRN      | 2              | 1         | Branch                       |
| 00110000          | 30             | Reserved | 2              | 1         | -                            |
| 00110001          | 31             | Reserved | 2              | 1         | -                            |
| 00110010          | 32             | Reserved | 2              | 1         | -                            |
| 00110011          | 33             | Reserved | 2              | 1         | -                            |
| 00110100          | 34             | Reserved | 2              | 1         | -                            |
| 00110101          | 35             | Reserved | 2              | 1         | -                            |
| 00110110          | 36             | Reserved | 2              | 1         | -                            |
| 00110111          | 37             | Reserved | 2              | 1         | -                            |
| 00111000          | 38             | BNEQ     | 2              | 1         | Branch if not equal          |
| 00111001          | 39             | BNZ      | 2              | 1         | Branch if not zero           |
| 00111010          | 4A             | BPOS     | 2              | 1         | Branch if positive           |
| 00111011          | 4B             | BODD     | 2              | 1         | Branch if odd                |
| 00111100          | 4C             | BBODD    | 2              | 1         | Branch if bitwise odd        |
| 00111101          | 4D             | BNC      | 2              | 1         | Branch if not carry/borrow   |
| 00111110          | 4E             | BNOF     | 2              | 1         | Branch if not overflow       |
| 00111111          | 4F             | Reserved | 2              | 1         | -                            |
| 10000000          | 80             | MOV      | 2              | 1         | T = A (A can be IMM/Reg)     |
| 10000001          | 81             | Reserved | 2              | 1         | -                            |
| 10000010          | 82             | LOD      | 2              | 1         | T = RAM @ A                  |
| 10000011          | 83             | STR      | 2              | 1         | RAM @ T = A                  |
| 10000100          | 84             | IN       | 2              | 1         | T = INPUT #A                 |
| 10000101          | 85             | OUT      | 2              | 1         | OUTPUT #T = A                |

Notes: 
- Reserved instructions are side effect instructions from how the CPU decode instructions, these may or may not work and have undefined behavior.
- All instructions from 0x10 to 0x1F (ALU instructions) will set all the ALU flags according to the arguments provided, the FLG instruction simply load the arguments into the ALU - thus setting the flags - and do nothing with the ALU output (by sending it to R0, which is read-only).
- All branch instructions branch to the first argument.
- IN and out instructions (0x84, 0x85) uses the T value as a port identifier, not a register identifier

## Internals

### ALU
The ALU or arithmatic logic unit have 2 16-bit input registers (A, B) and 3 16-bit non-register outputs. The 3 outputs are L, H and F. L is the lower 16 bits of the output of the operation, this is used for most operation. H is the upper 16 bits of the output of the operation, this is only used for multiplication. F is the flag output, the flags are asynchronously updated, there is no flag register.
1. Op codes:
    The ALU takes in a 4-bit op code, which tells the ALU with operation to perform.
    - 0000 : ADD    (L = A + B)
    - 0001 : ADC    (L = A + B + 1) Add with Carry
    - 0010 : SUB    (L = A - B)
    - 0011 : SBB    (L = A - B - 1) Subtract with borrow
    - 0100 : MUL    (H, L = A * B) Unsigned multiply
    - 0101 : SMUL   (H, L = A * B) Signed multiply
    - 0110 : RSHIFT (L = A >> B) Unsigned bitwise right shift, non-cyclic, the shifted out bit is lost
    - 0111 : LSHIFT (L = A << B) Unsigned bitwise left shift, non-cyclic, the shifted out bit is lost
    - 1000 : NOT A  (L = ~A)
    - 1001 : NOT B  (L = ~B)
    - 1010 : AND    (L = A & B)
    - 1011 : OR     (L = A | B)
    - 1100 : XOR    (L = A ^ B)
    - 1101 : NAND   (L = ~(A & B))
    - 1110 : NOR    (L = ~(A | B))
    - 1111 : XNOR   (L = ~(A ^ B))
2. Flags:
    The ALU have 1 16-bit output flag. From LSB to MSB they are the following.
    - 00 : GT   : A > B   Greater than (unsinged)
    - 01 : GE   : A >= B  Greater than or Equal to (unsinged)
    - 02 : LT   : A < B   Less than (unsinged)
    - 03 : LE   : A <= B  Less than or Equal to (unsinged)
    - 04 : SGT  : A > B   Signed Greater than
    - 05 : SGE  : A >= B  Signed Greater than or Equal to
    - 06 : SLT  : A < B   Signed Less than
    - 07 : SLE  : A <= B  Signed Less than or Equal to
    - 08 : EQ   : A = B   Equal
    - 09 : Z    : A = 0   Zero(A)
    - 10 : S    : A < 0   Sign(A)
    - 11 : P    :         Parity(A) Even = 1, Odd = 0
    - 12 : BP   :         BitwiseParity(A) Even = 1, Odd = 0
    - 13 : C    :         Carry / Borrow
    - 14 : OF   :         Overflow
    - 15 : TR   : 1       True
