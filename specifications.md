# ILF-16
ILF-16 is a 16-bit cpu that runs on Spartan-6 FPGA.
## Internals
### ALU
The ALU or arithmatic logic unit have 2 16-bit input registers (A, B) and 3 16-bit non-register outputs. The 3 outputs are L, H and F. L is the lower 16 bits of the output of the operation, this is used for most operation. H is the upper 16 bits of the output of the operation, this is only used for multiplication. F is the flag output. 
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
    - 08 : ZA   : A = 0   Zero(A)
    - 09 : ZB   : B = 0   Zero(B)
    - 10 : SA   : A < 0   Sign(A)
    - 11 : SB   : B < 0   Sign(B)
    - 12 : EQ   : A = B   Equal
    - 13 : CB   :         Carry / Borrow
    - 14 : OF   :         Overflow
    - 15 : PA   :         Parity(A) Even = 1, Odd = 0
