; Printing numbers on the display: the Fibonacci numbers, then the prime numbers.
;
; Every line shows a count, then the number in decimal and in hexadecimal. Numbers are 32 bits,
; kept as two words. The list goes back to the top when it reaches the bottom of the screen.
;
;   Fibonacci numbers: F0 to F47, the largest that fits in 32 bits.
;   Prime numbers:     all 12251 primes below 131072, found with the sieve of Eratosthenes.
;
; Input port 0:  hold any bit (a switch or a button) to skip the pauses and go at full speed.
; Output port 0: lower word of the number.   Output port 1: upper word.   Output port 2: count.
;
; Text is drawn with a 3x5 pixel font, each font pixel 2x2 on the screen, in 8x12 character
; cells (32 columns, 21 rows). A character is one word: 15 pixels from the top bit down, row by
; row, and a 1 in the lowest bit that tells the drawing loop where the pixels end.
; Characters 0-15 are the hexadecimal digits, the letters carry on to Z = 35, and 36 is a space.
;
; There is no division, so decimal digits are found by counting how many times each power of
; ten can be subtracted.

@define hi $1
@define lo $2
@define ptr $3
@define ph $4
@define pl $5
@define digit $6
@define seen $7
@define col $8
@define color $9
@define ch $10
@define px $11
@define py $12
@define c $13

; The same registers under other names while the sieve is being built
@define i $1
@define j $2
@define p $3
@define t $4
@define u $5
@define v $6
@define w $7

@define space 36
@define first_row 3             ; rows 0 and 1 are the title and the column names
@define rows 21
@define count_col 3
@define decimal_col 9
@define hex_col 20
@define line_end 28
@define sieve 2048              ; the sieve takes RAM 2048 to 6143: one bit for every odd number

.font
DW 0xF6DF 0x592F 0xE7CF 0xE79F  ; 0 1 2 3
DW 0xB793 0xF39F 0xF3DF 0xE493  ; 4 5 6 7
DW 0xF7DF 0xF79F 0xF7DB 0xD75D  ; 8 9 A B
DW 0xF24F 0xD6DD 0xF3CF 0xF3C9  ; C D E F
DW 0xF2DF 0xB7DB 0xE92F 0x24DF  ; G H I J
DW 0xB75B 0x924F 0xBFDB 0xD6DB  ; K L M N
DW 0x56D5 0xF7C9 0xF6F3 0xF75B  ; O P Q R
DW 0x711D 0xE925 0xB6DF 0xB6D5  ; S T U V
DW 0xB7FB 0xB55B 0xB525 0xE54F  ; W X Y Z
DW 0x0001                       ; space

; Powers of ten as upper word, lower word. Printing starts at .pow10 for 10 digits and at
; .pow10_4 for 5 digits. The last digit is whatever is left, so 1 is not in the table.
.pow10
DW 0x3B9A 0xCA00                ; 1000000000
DW 0x05F5 0xE100                ; 100000000
DW 0x0098 0x9680                ; 10000000
DW 0x000F 0x4240                ; 1000000
DW 0x0001 0x86A0                ; 100000
.pow10_4
DW 0 10000
DW 0 1000
DW 0 100
DW 0 10

; Text, as character numbers ending with 0xFFFF
.pow10_end
.text_fibonacci
; "FIBONACCI NUMBERS"
DW 15 18 11 24 23 10 12 12 18 36 23 30 22 11 14 27
DW 28 0xFFFF
.text_primes
; "PRIME NUMBERS"
DW 25 27 18 22 14 36 23 30 22 11 14 27 28 0xFFFF
.text_columns
; "N    DECIMAL      HEX"
DW 23 36 36 36 36 13 14 12 18 22 10 21 36 36 36 36
DW 36 36 17 14 33 0xFFFF

.row
DW 0                            ; text row that is being printed
.count
DW 0
.value_hi
DW 0                            ; the number to print
.value_lo
DW 0
.next_hi
DW 0                            ; the Fibonacci number after it
.next_lo
DW 0
.prime_i
DW 0                            ; the last prime printed is 2 * prime_i + 1

.start
; ---------------------------------------------------------------------------------------------
; Fibonacci numbers
; ---------------------------------------------------------------------------------------------
CAL .clear_screen
STR $0 .row
LDI color 10
LDI col 7
LDI ptr .text_fibonacci
CAL .put_string
CAL .put_columns

STR $0 .count
STR $0 .value_hi
STR $0 .value_lo                ; F0 = 0
STR $0 .next_hi
LDI lo 1
STR lo .next_lo                 ; F1 = 1
.fibonacci
    CAL .print_line
    ; (value, next) = (next, value + next), adding the upper words with the carry of the lower
    LOD lo .value_lo
    LOD pl .next_lo
    LOD hi .value_hi
    LOD ph .next_hi
    STR pl .value_lo
    STR ph .value_hi
    ADD ph ph hi
    ADD pl pl lo
    BNC .fibonacci_no_carry
    ADD ph ph 1
    .fibonacci_no_carry
    STR pl .next_lo
    STR ph .next_hi
    LDI ptr 150
    CAL .pause
    LOD lo .count
    ADD lo lo 1
    STR lo .count
    ADD $0 lo 48
    BLT .fibonacci
LDI ptr 2000
CAL .pause

; ---------------------------------------------------------------------------------------------
; Prime numbers
; ---------------------------------------------------------------------------------------------
CAL .clear_screen
STR $0 .row
LDI color 10
LDI col 9
LDI ptr .text_primes
CAL .put_string
CAL .put_columns

; Sieve of Eratosthenes over the odd numbers only: bit i of the sieve stands for 2i + 1, and is
; set once that number is known not to be prime. 65536 bits cover every odd number below 131072.
LDI t sieve
LDI u 4096
.sieve_clear
    STR $0 t
    ADD t t 1
    SUB u u 1
    BNZ .sieve_clear

LDI i 1                         ; start with 3
.sieve_number
    RSHIFT t i 4                ; is bit i set? Then 2i + 1 is not prime: nothing to do
    ADD t t sieve
    LOD u t
    AND v i 15
    RSHIFT u u v
    AND $0 u 1
    BNZ .sieve_next
    ; p = 2i + 1 is prime: mark its odd multiples from p * p up. Moving p bits along the sieve
    ; is the next odd multiple, and p * p is bit 2i(i + 1).
    LSHIFT p i 1
    ADD p p 1
    ADD j i 1
    MUL j j i
    LSHIFT j j 1
    .sieve_mark
        RSHIFT t j 4
        ADD t t sieve
        LOD u t
        AND v j 15
        LDI w 1
        LSHIFT w w v
        OR u u w
        STR u t
        ADD j j p
        BNC .sieve_mark         ; until j goes past the last bit
    .sieve_next
    ADD i i 1
    ADD $0 i 181                ; 363 * 363 is more than 131072, so the sieve is complete
    BLT .sieve_number

; 2 is the only even prime, so it is printed by hand
LDI lo 1
STR lo .count
STR $0 .value_hi
LDI lo 2
STR lo .value_lo
STR $0 .prime_i
.prime_print
    CAL .print_line
    LDI ptr 30
    CAL .pause
    ; look for the next bit that is not set
    LOD ptr .prime_i
    .prime_search
        ADD ptr ptr 1
        BC .primes_done         ; past the last bit
        RSHIFT ph ptr 4
        ADD ph ph sieve
        LOD ph ph
        AND pl ptr 15
        RSHIFT ph ph pl
        AND $0 ph 1
        BNZ .prime_search
    STR ptr .prime_i
    RSHIFT hi ptr 15            ; the prime is 2 * ptr + 1, which can need 17 bits
    STR hi .value_hi
    LSHIFT lo ptr 1
    ADD lo lo 1
    STR lo .value_lo
    LOD lo .count
    ADD lo lo 1
    STR lo .count
    BRN .prime_print
.primes_done
LDI ptr 4000
CAL .pause
BRN .start

; ---------------------------------------------------------------------------------------------
; Subroutines
; ---------------------------------------------------------------------------------------------

; Print .count and .value on the current row, send them to the output ports, and move to the
; next row (clearing it, so it is easy to see where the list has got to)
.print_line
    LDI color 6
    LDI col count_col
    LDI hi 0
    LOD lo .count
    LDI ptr .pow10_4
    CAL .put_decimal

    LDI color 7
    LDI col decimal_col
    LOD hi .value_hi
    LOD lo .value_lo
    LDI ptr .pow10
    CAL .put_decimal

    LDI color 11
    LDI col hex_col
    LOD ph .value_hi
    CAL .put_hex_word
    LOD ph .value_lo
    CAL .put_hex_word

    LOD lo .value_lo
    OUT lo %0
    LOD hi .value_hi
    OUT hi %1
    LOD lo .count
    OUT lo %2

    LOD lo .row
    ADD lo lo 1
    ADD $0 lo rows
    BLT .print_line_row
    LDI lo first_row
    .print_line_row
    STR lo .row
    LDI col count_col
    .print_line_clear
        LDI ch space
        CAL .put_char
        ADD $0 col line_end
        BLT .print_line_clear
RET

; Print the 32-bit number hi:lo in decimal, without leading zeros. ptr is where to start in
; the table of powers of ten: .pow10 prints 10 characters, .pow10_4 prints 5.
.put_decimal
    LDI seen 0
    .decimal_digit
        LOD ph ptr
        ADD ptr ptr 1
        LOD pl ptr
        ADD ptr ptr 1
        LDI digit 0
        .decimal_subtract
            ; stop when hi:lo is less than ph:pl
            ADD $0 hi ph
            BLT .decimal_digit_done
            BGT .decimal_fits
            ADD $0 lo pl
            BLT .decimal_digit_done
            .decimal_fits
            SUB hi hi ph
            SUB lo lo pl
            BGE .decimal_no_borrow
            SUB hi hi 1
            .decimal_no_borrow
            ADD digit digit 1
            BRN .decimal_subtract
        .decimal_digit_done
        OR seen seen digit      ; stays 0 until the first digit that is not 0
        BNZ .decimal_show
        LDI ch space
        BRN .decimal_put
        .decimal_show
        MOV ch digit
        .decimal_put
        CAL .put_char
        ADD $0 ptr .pow10_end
        BLT .decimal_digit
    MOV ch lo                   ; what is left is the last digit
    CAL .put_char
RET

; Print ph as 4 hexadecimal digits
.put_hex_word
    LDI digit 4
    .hex_digit
        RSHIFT ch ph 12
        LSHIFT ph ph 4
        CAL .put_char
        SUB digit digit 1
        BNZ .hex_digit
RET

; Print the text at ptr
.put_string
    LOD ch ptr
    ADD ptr ptr 1
    TEST $0 ch
    BNEG .put_string_done
    CAL .put_char
    BRN .put_string
    .put_string_done
RET

; Print the column names on row 1 and make the first row of the list the current one
.put_columns
    LDI lo 1
    STR lo .row
    LDI color 12
    LDI col 7
    LDI ptr .text_columns
    CAL .put_string
    LDI lo first_row
    STR lo .row
RET

; Draw character ch in color at column col of the current row, and move col on by one
.put_char
    ADD ch ch .font
    LOD ch ch
    LSHIFT px col 3
    ADD px px 2                 ; the 6 pixels of a character are at x = 2..7 of its cell
    LOD py .row
    MUL py py 12
    .put_char_pixel
        TEST $0 ch              ; the top bit is the next font pixel
        SNEG c color $0
        LSHIFT ch ch 1
        GFXSP c px py
        ADD px px 1
        GFXSP c px py
        ADD py py 1
        GFXSP c px py
        SUB px px 1
        GFXSP c px py
        SUB py py 1
        ADD px px 2
        AND $0 px 7
        BNZ .put_char_same_row
        SUB px px 6             ; past the right edge of the cell: start the next row
        ADD py py 2
        .put_char_same_row
        LSHIFT $0 ch 1          ; done when only the marker bit is left, at the top
        BNZ .put_char_pixel
    ADD col col 1
RET

; Wait for ptr * 1.4 ms. Any bit of input port 0 ends the wait straight away.
.pause
    IN ph %0
    TEST $0 ph
    BNZ .pause_done
    STL 0xFFFF
    SUB ptr ptr 1
    BNZ .pause
    .pause_done
RET

.clear_screen
    LDI py 0
    .clear_row
        LDI px 0
        .clear_pixel
            GFXSP $0 px py
            ADD px px 1
            ADD $0 px 256
            BLT .clear_pixel
        ADD py py 1
        ADD $0 py 256
        BLT .clear_row
RET
