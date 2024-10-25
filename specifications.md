# ILF-16
ILF-16 is a 16-bit cpu that runs on Spartan-6 FPGA.
The ILF-16 have 16 registers indexed with a 4-bit register identifier where R0 is the zero (readonly) register and R1-R15 are general purpose registers.


## ISA

### Instructions Layout
ILF-16 uses fixed length instruction where an instruction is 2 words (32 bits) long. The instruction layout for the first 16 bits is IIIIIIIIAAXYDDDD where:
- I is the 8-bit instuction identifier.
- A is the argument count, can be 0, 1 or 2. 3 arguments is not supported.
- X is the type of the first argument, 0 = immediate, 1 = value at that register. If this argument is not used this is ignored.
- Y is the type of the second argument, 0 = immediate, 1 = value at that register. If this argument is not used this is ignored.
- D is the destination identifier for the operation.

The instruction layout for the second 16 bits is dependent on the type of the 2 arguments and can either be:
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

### Instruction Identifiers
The ILF-16 supports a total of 256 instructions. Currently, the following is available/planned:
- D  : Destination identifier
- A  : First argument (can be either an immediate value or the value in the register at this identifier)
- B  : Second argument (can be either an immediate value or the value in the register at this identifier)
- $X : Value of the register number X
- #X : Value of the memory at address X
- %X : Value of the I/O port number X

| Binary Identifier | Hex Identifier | Name     | Arguments | Description                                  |
|------------------:|---------------:|----------|-----------|----------------------------------------------|
| 00000000          | 00             | NOP      | -         | Do nothing (takes 2 cycles)                  |
| 00000001          | 01             | STL      | 1         | Do nothing for A * 2 cycles                  |
| 00010000          | 10             | ADD      | 2         | $D = A + B                                   |
| 00010001          | 11             | SUB      | 2         | $D = A - B                                   |
| 00010010          | 12             | RSHIFT   | 2         | $D = A >> B                                  |
| 00010011          | 13             | LSHIFT   | 2         | $D = A << B                                  |
| 00010100          | 14             | MUL      | 2         | $D = A * B (unsigned, result is lower 16 bits) |
| 00010101          | 15             | SMUL     | 2         | $D = A * B (signed, result is lower 16 bits) |
| 00010110          | 16             | UMUL     | 2         | $D = A * B (unsigned, result is upper 16 bits) |
| 00010111          | 17             | SUMUL    | 2         | $D = A * B (signed, result is upper 16 bits) |
| 00011000          | 18             | NOT      | 1         | $D = ~A                                      |
| 00011001          | 19             | Reserved | -         | -                                            |
| 00011010          | 1A             | AND      | 2         | $D = A & B                                   |
| 00011011          | 1B             | OR       | 2         | $D = A | B                                   |
| 00011100          | 1C             | XOR      | 2         | $D = A ^ B                                   |
| 00011101          | 1D             | NAND     | 2         | $D = ~(A & B)                                |
| 00011110          | 1E             | NOR      | 2         | $D = ~(A | B)                                |
| 00011111          | 1F             | XNOR     | 2         | $D = ~(A ^ B)                                |
| 00100000          | 20             | BGT      | 1         | Branch to A if greater than (unsigned)       |
| 00100001          | 21             | BLT      | 1         | Branch to A if less than (unsigned)          |
| 00100010          | 24             | BSGT     | 1         | Branch to A if greater than (signed)         |
| 00100011          | 26             | BSLT     | 1         | Branch to A if less than (signed)            |
| 00100100          | 24             | BEQ      | 1         | Branch to A if equal                         |
| 00100101          | 29             | BZ       | 1         | Branch to A if zero                          |
| 00100110          | 26             | BNEG     | 1         | Branch to A if negative                      |
| 00100111          | 27             | BPOS     | 1         | Branch to A if positive                      |
| 00101000          | 28             | BEV      | 1         | Branch to A if even                          |
| 00101001          | 29             | BBEV     | 1         | Branch to A if bitwise even                  |
| 00101010          | 2A             | BC       | 1         | Branch to A if carry/borrow                  |
| 00101011          | 2B             | BOF      | 1         | Branch to A if overflow                      |
| 00101100          | 2C             | Reserved | -         | -                                            |
| 00101101          | 2D             | Reserved | -         | -                                            |
| 00101110          | 2E             | Reserved | -         | -                                            |
| 00101111          | 2F             | BRN      | 1         | Branch to A                                  |
| 00110000          | 30             | BLE      | 1         | Branch to A if less than or equal (unsigned) |
| 00110001          | 31             | BGE      | 1         | Branch to A if greater than or equal (unsigned) |
| 00110010          | 32             | BSLE     | 1         | Branch to A if less than or equal (signed)   |
| 00110011          | 33             | BSGE     | 1         | Branch to A if greater than or equal (signed) |
| 00110100          | 34             | BNEQ     | 1         | Branch to A if not equal                     |
| 00110101          | 35             | BNZ      | 1         | Branch to A if not zero                      |
| 00110110          | 36             | BPOSZ    | 1         | Branch to A if positive or zero              |
| 00110111          | 37             | BNEGZ    | 1         | Branch to A if negative or zero              |
| 00111000          | 38             | BOD      | 1         | Branch to A if odd                           |
| 00111001          | 39             | BBOD     | 1         | Branch to A if bitwise odd                   |
| 00111010          | 3A             | BNC      | 1         | Branch to A if not carry/borrow              |
| 00111011          | 3B             | BNOF     | 1         | Branch to A if not overflow                  |
| 00111100          | 3C             | Reserved | -         | -                                            |
| 00111101          | 3D             | Reserved | -         | -                                            |
| 00111110          | 3E             | Reserved | -         | -                                            |
| 00111111          | 3F             | Reserved | -         | -                                            |
| 01000000          | 40             | SGT      | 1-2       | $D = A if greater than (unsigned) else B     |
| 01000001          | 41             | SLT      | 1-2       | $D = A if less than (unsigned) else B        |
| 01000010          | 44             | SSGT     | 1-2       | $D = A if greater than (signed) else B       |
| 01000011          | 46             | SSLT     | 1-2       | $D = A if less than (signed) else B          |
| 01000100          | 44             | SEQ      | 1-2       | $D = A if equal else B                       |
| 01000101          | 49             | SZ       | 1-2       | $D = A if zero else B                        |
| 01000110          | 46             | SNEG     | 1-2       | $D = A if negative else B                    |
| 01000111          | 47             | SPOS     | 1-2       | $D = A if positive else B                    |
| 01001000          | 48             | SEV      | 1-2       | $D = A if even else B                        |
| 01001001          | 49             | SBEV     | 1-2       | $D = A if bitwise even else B                |
| 01001010          | 4A             | SC       | 1-2       | $D = A if carry/borrow else B                |
| 01001011          | 4B             | SOF      | 1-2       | $D = A if overflow else B                    |
| 01001100          | 4C             | Reserved | -         | -                                            |
| 01001101          | 4D             | Reserved | -         | -                                            |
| 01001110          | 4E             | Reserved | -         | -                                            |
| 01001111          | 4F             | MOV      | 1         | $D = A                                       |
| 01010000          | 50             | SLE      | 1-2       | $D = A if less than or equal (unsigned) else B |
| 01010001          | 51             | SGE      | 1-2       | $D = A if greater than or equal (unsigned) else B |
| 01010010          | 52             | SSLE     | 1-2       | $D = A if less than or equal (signed) else B |
| 01010011          | 53             | SSGE     | 1-2       | $D = A if greater than or equal (signed) else B |
| 01010100          | 54             | SNEQ     | 1-2       | $D = A if not equal else B                   |
| 01010101          | 55             | SNZ      | 1-2       | $D = A if not zero else B                    |
| 01010110          | 56             | SPOSZ    | 1-2       | $D = A if positive or zero else B            |
| 01010111          | 57             | SNEGZ    | 1-2       | $D = A if negative or zero else B            |
| 01011000          | 58             | SOD      | 1-2       | $D = A if odd else B                         |
| 01011001          | 59             | SBOD     | 1-2       | $D = A if bitwise odd else B                 |
| 01011010          | 5A             | SNC      | 1-2       | $D = A if not carry/borrow else B            |
| 01011011          | 5B             | SNOF     | 1-2       | $D = A if not overflow else B                |
| 01011100          | 5C             | Reserved | -         | -                                            |
| 01011101          | 5D             | Reserved | -         | -                                            |
| 01011110          | 5E             | Reserved | -         | -                                            |
| 01011111          | 5F             | Reserved | -         | -                                            |
| 10000000          | 80             | LOD      | 1         | $D = #A                                      |
| 10000001          | 81             | STR      | 1         | #A = $D                                      |
| 10000010          | 82             | IN       | 1         | $D = %A                                      |
| 10000011          | 83             | OUT      | 1         | %A = $D                                      |

Notes: 
- Reserved instructions are side effect instructions from how the CPU decode instructions, these may or may not work and have undefined behavior.
- All instructions from 0x10 to 0x1F (ALU instructions) will set all the ALU flags according to the arguments provided, the TEST instruction simply set the ALU inputs, load the resulting flag into the flag register and do nothing with the ALU output (by sending it to R0, which is read-only).
- Set instructions set the destination register to A if the condition is true, otherwise set the register to B. If only one argument is provided B is replaced with 0.

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
