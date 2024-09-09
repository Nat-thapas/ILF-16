# ILF-16
ILF-16 is a 16-bit cpu that runs on Spartan-6 FPGA.
## Internals
### ALU
The ALU or arithmatic logic unit have 2 16-bit input registers (A, B) and 3 16-bit non-register outputs. The 3 outputs are L, H and F. L is the lower 16 bits of the output of the operation, this is used for most operation. H is the upper 16 bits of the output of the operation, this is only used for multiplication. F is the flag output. 
1. Op codes:
    The ALU takes in a 5-bit op code, which tells the ALU with operation to perform.
    - 00000 : ADD    (L = A + B)
    - 00011 : ADC    (L = A + B + 1) Add with Carry
    - 00010 : SUB    (L = A - B)
    - 00011 : SBB    (L = A - B - 1) Subtract with borrow
    - 00100 : MUL    (H, L = A * B) This is an unsigned multiplication
    - 00101 : SMUL   (H, L = A * B) This is a signed multiplication
    - 00110 : DIV    (L = A / B) This is an unsigned, integer division
    - 00111 : SDIV   (L = A / B) This is a signed, integer division
    - 01000 : MOD    (L = A % B) This is an unsigned (C-like) modulo operation
    - 01001 : SMOD   (L = A % B) This is a signed (Python-like) modulo operation
    - 10000 : NOT A  (L = ~A)
    - 10001 : NOT B  (L = ~B)
    - 10010 : AND    (L = A & B)
    - 10011 : OR     (L = A | B)
    - 10100 : XOR    (L = A ^ B)
    - 10101 : NAND   (L = ~(A & B))
    - 10110 : NOR    (L = ~(A | B))
    - 11000 : XNOR   (L = ~(A ^ B))
2. Flags:
    The ALU have 1 16-bit output flag. From LSB to MSB they are the following.
    - G    : A > B   Greater than (unsinged)
    - GE   : A >= B  Greater than or Equal to (unsinged)
    - L    : A < B   Less than (unsinged)
    - LE   : A <= B  Less than or Equal to (unsinged)
    - SG   : A > B   Signed Greater than
    - SGE  : A >= B  Signed Greater than or Equal to
    - SL   : A < B   Signed Less than
    - SLE  : A <= B  Signed Less than or Equal to
    - ZA   : A = 0   Zero(A)
    - ZB   : B = 0   Zero(B)
    - SA   : A < 0   Sign(A)
    - SB   : B < 0   Sign(B)
    - EQ   : A = B   Equal
    - C    :         Carry
    - OF   :         Overflow
    - PA   :         Parity(A) Even = 1, Odd = 0
