; Blocks: a falling-block puzzle. Fit the pieces together; every full row disappears.
;
; Input port 0: game controller, d-pad 1 (bits 0-3):
;               left / right move the piece, up turns it, down drops it faster.
;               After the game is over, release everything and press any button to play again.
; Output port 0: score.    Output port 1: rows cleared.
;
; Run it in real time: the game is paced with STL, which takes no time in unlimited mode.
;
; The whole screen is a grid of 32 x 32 squares of 8 pixels, kept in RAM from address 2048,
; one word per square (0 = empty, otherwise its colour). A square's number is y * 32 + x.
; The well is 12 squares wide and 24 deep (columns 3-14, rows 4-27), with a wall around it
; that is simply more non-empty squares, so a piece can never leave the well.
;
; A piece is a word: 16 bits for a 4 x 4 block of squares, top bit first, row by row.
; There are 12 pieces, each stored in its 4 orientations.

@define m $1                    ; a piece's 16 bits
@define p $2                    ; a square number or an address
@define k $3                    ; a counter
@define t $4
@define u $5
@define color $6
@define px $7
@define py $8
@define cell $9
@define type $10                ; the falling piece: which one,
@define rot $11                 ; which way round,
@define pos $12                 ; and the square of its top left corner
@define act $13                 ; the buttons to act on this frame

@define board 2048
@define wall_color 5
@define text_color 12
@define number_color 7

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

.pow10
DW 10000 1000 100 10

.pow10_end
.text_title
; "BLOCKS"
DW 11 21 24 12 20 28 0xFFFF
.text_score
; "SCORE"
DW 28 12 24 27 14 0xFFFF
.text_rows
; "ROWS"
DW 27 24 32 28 0xFFFF
.text_level
; "LEVEL"
DW 21 14 31 14 21 0xFFFF
.text_next
; "NEXT"
DW 23 14 33 29 0xFFFF
.text_game
; "GAME"
DW 16 10 22 14 0xFFFF
.text_over
; "OVER"
DW 24 31 14 27 0xFFFF

; The 12 pieces, 4 orientations each
.pieces
DW 0xC000 0x8800 0xC000 0x8800  ; two in a row
DW 0x0E00 0x4440 0x0E00 0x4440  ; three in a row
DW 0x8C00 0xC800 0xC400 0x4C00  ; small corner
DW 0x0F00 0x4444 0x0F00 0x4444  ; four in a row
DW 0xCC00 0xCC00 0xCC00 0xCC00  ; square
DW 0xE400 0x4C40 0x4E00 0x8C80  ; T
DW 0x88C0 0xE800 0xC440 0x2E00  ; L
DW 0x44C0 0x8E00 0xC880 0xE200  ; J
DW 0x6C00 0x8C40 0x6C00 0x8C40  ; S
DW 0xC600 0x4C80 0xC600 0x4C80  ; Z
DW 0x4E40 0x4E40 0x4E40 0x4E40  ; plus
DW 0xAE00 0xC8C0 0xEA00 0xC4C0  ; U

.piece_colors
DW 12 11 10 9 8 14 13 15 7 6 4 3

.next
DW 0                            ; the piece that comes after this one
.score
DW 0
.rows
DW 0
.level
DW 0
.period
DW 0                            ; frames between two steps down
.gravity
DW 0                            ; frames since the last step down
.held
DW 0                            ; the buttons that were down last frame
.repeat
DW 0                            ; frames since the buttons last changed
.rng
DW 0x1D2B

; ---------------------------------------------------------------------------------------------
.new_game
    CAL .clear_screen
    LDI p board
    LDI k 1024
    .clear_board
        STR $0 p
        ADD p p 1
        SUB k k 1
        BNZ .clear_board

    ; the wall: down both sides of the well (columns 2 and 15), then along the bottom (row 28)
    LDI color wall_color
    LDI cell 130
    .wall_sides
        ADD t cell board
        STR color t
        CAL .draw_cell
        ADD cell cell 13
        ADD t cell board
        STR color t
        CAL .draw_cell
        ADD cell cell 19
        ADD $0 cell 898
        BLT .wall_sides
    .wall_bottom
        ADD t cell board
        STR color t
        CAL .draw_cell
        ADD cell cell 1
        ADD $0 cell 912
        BLT .wall_bottom

    LDI color 10
    LDI px 106
    LDI py 12
    LDI p .text_title
    CAL .put_string
    LDI color text_color
    LDI px 146
    LDI py 40
    LDI p .text_score
    CAL .put_string
    LDI px 146
    LDI py 76
    LDI p .text_rows
    CAL .put_string
    LDI px 146
    LDI py 112
    LDI p .text_level
    CAL .put_string
    LDI px 146
    LDI py 148
    LDI p .text_next
    CAL .put_string

    STR $0 .score
    STR $0 .rows
    STR $0 .level
    LDI t 24
    STR t .period
    CAL .show_numbers
    CAL .random_piece
    STR t .next

; Bring in the next piece at the top of the well
.new_piece
    LOD type .next
    CAL .random_piece
    STR t .next
    LDI rot 0
    LDI pos 135                 ; row 4, column 7

    ; show the piece after this one, under NEXT (rows 20-23, columns 18-21)
    LDI m 0xFFFF
    LDI p 658
    LDI color 0
    CAL .draw_piece
    LOD t .next
    LSHIFT u t 2
    ADD u u .pieces
    LOD m u
    ADD t t .piece_colors
    LOD color t
    LDI p 658
    CAL .draw_piece

    STR $0 .gravity
    CAL .fits_current
    MOV act u
    CAL .show_piece
    TEST $0 act
    BNZ .game_over              ; no room for it: the well is full

; One frame is about 22 ms
.frame
    LDI k 16
    .frame_wait
        STL 0xFFFF
        SUB k k 1
        BNZ .frame_wait

    ; Act on a button when it goes down. Left, right and down also repeat every other frame
    ; once they have been held for 8 frames.
    IN u %0
    AND u u 15
    LOD t .held
    STR u .held
    NOT t t
    AND act u t
    BNZ .buttons_changed
    LOD t .repeat
    ADD t t 1
    STR t .repeat
    ADD $0 t 8
    BLT .buttons_done
    AND $0 t 1
    BNZ .buttons_done
    AND act u 14
    BRN .buttons_done
    .buttons_changed
    LOD t .repeat               ; when buttons are pressed makes the pieces less predictable
    LOD m .rng
    ADD m m t
    STR m .rng
    STR $0 .repeat
    .buttons_done

    ; Every move is tried the same way: take the piece off the screen, move it, and put it
    ; back where it was if it does not fit there.
    AND $0 act 4
    BZ .no_left
    CAL .erase_piece
    SUB pos pos 1
    CAL .fits_current
    TEST $0 u
    BZ .left_done
    ADD pos pos 1
    .left_done
    CAL .show_piece
    .no_left

    AND $0 act 8
    BZ .no_right
    CAL .erase_piece
    ADD pos pos 1
    CAL .fits_current
    TEST $0 u
    BZ .right_done
    SUB pos pos 1
    .right_done
    CAL .show_piece
    .no_right

    AND $0 act 1
    BZ .no_turn
    CAL .erase_piece
    ADD rot rot 1
    AND rot rot 3
    CAL .fits_current           ; if it does not fit turned, try one square left, then right
    TEST $0 u
    BZ .turn_done
    SUB pos pos 1
    CAL .fits_current
    TEST $0 u
    BZ .turn_done
    ADD pos pos 2
    CAL .fits_current
    TEST $0 u
    BZ .turn_done
    SUB pos pos 1               ; no: leave it as it was
    SUB rot rot 1
    AND rot rot 3
    .turn_done
    CAL .show_piece
    .no_turn

    ; one step down, if down is pressed or it is time
    AND $0 act 2
    BNZ .fall
    LOD t .gravity
    ADD t t 1
    STR t .gravity
    LOD u .period
    ADD $0 t u
    BLT .frame
    .fall
    STR $0 .gravity
    CAL .erase_piece
    ADD pos pos 32
    CAL .fits_current
    TEST $0 u
    BNZ .landed
    CAL .show_piece
    BRN .frame

; The piece cannot go down any further: it becomes part of the board
.landed
    SUB pos pos 32
    CAL .show_piece
    CAL .piece_mask
    ADD t type .piece_colors
    LOD color t
    ADD p pos board
    LDI k 4
    .land_bit
        TEST $0 m
        BPOSZ .land_skip
        STR color p
        .land_skip
        LSHIFT m m 1
        BZ .land_done
        ADD p p 1
        SUB k k 1
        BNZ .land_bit
        LDI k 4
        ADD p p 28
        BRN .land_bit
    .land_done
    LOD t .score
    ADD t t 1
    STR t .score

    ; look for full rows, from the bottom of the well (row 27) up
    LDI act 0                   ; how many were found
    LDI p 2915                  ; address of row 27, column 3
    .row
        MOV t p
        LDI k 12
        .row_square
            LOD u t
            TEST $0 u
            BZ .row_not_full
            ADD t t 1
            SUB k k 1
            BNZ .row_square
        ; full: every square from here up to row 5 becomes the one above it...
        ADD act act 1
        ADD t p 11
        .row_drop
            SUB u t 32
            LOD u u
            STR u t
            SUB t t 1
            ADD $0 t 2211       ; address of row 5, column 3
            BGE .row_drop
        LDI t 2179              ; ...and the top row of the well (row 4) is emptied
        LDI k 12
        .row_top
            STR $0 t
            ADD t t 1
            SUB k k 1
            BNZ .row_top
        BRN .row                ; look at this row again: it has new squares in it
        .row_not_full
        SUB p p 32
        ADD $0 p 2179
        BGE .row

    TEST $0 act
    BZ .no_rows
    LOD t .rows
    ADD t t act
    STR t .rows
    RSHIFT u t 3                ; a level for every 8 rows,
    STR u .level
    LSHIFT u u 1                ; and 2 frames faster per level: 24 - 2 * level, at least 2
    SUB u 24 u
    ADD $0 u 2
    BSGE .period_done
    LDI u 2
    .period_done
    STR u .period
    MUL t act act               ; 10, 40, 90 or 160 points for 1 to 4 rows at once
    MUL t t 10
    LOD u .score
    ADD u u t
    STR u .score
    ; draw the well again from the board
    LDI cell 131
    .redraw_row
        LDI k 12
        .redraw_square
            ADD t cell board
            LOD color t
            CAL .draw_cell
            ADD cell cell 1
            SUB k k 1
            BNZ .redraw_square
        ADD cell cell 20
        ADD $0 cell 896
        BLT .redraw_row
    .no_rows
    CAL .show_numbers
    BRN .new_piece

.game_over
    LDI color 8
    LDI px 146
    LDI py 208
    LDI p .text_game
    CAL .put_string
    LDI px 146
    LDI py 220
    LDI p .text_over
    CAL .put_string
    .wait_release
        IN t %0
        TEST $0 t
        BNZ .wait_release
    .wait_press
        IN t %0
        TEST $0 t
        BZ .wait_press
    BRN .new_game

; ---------------------------------------------------------------------------------------------
; Subroutines
; ---------------------------------------------------------------------------------------------

; m = the falling piece, the way round it is now
.piece_mask
    LSHIFT t type 2
    ADD t t rot
    ADD t t .pieces
    LOD m t
RET

; u = 1 if the falling piece overlaps anything on the board where it is now, otherwise 0
.fits_current
    CAL .piece_mask
    MOV p pos
    CAL .fits
RET

; u = 1 if piece m with its top left corner on square p overlaps anything on the board
.fits
    LDI u 1
    LDI k 4
    .fits_bit
        TEST $0 m               ; the top bit is the next square of the piece
        BPOSZ .fits_skip
        ADD t p board
        LOD t t
        TEST $0 t
        BNZ .fits_done
        .fits_skip
        LSHIFT m m 1
        BZ .fits_clear          ; no squares left
        ADD p p 1
        SUB k k 1
        BNZ .fits_bit
        LDI k 4                 ; next row of the piece
        ADD p p 28
        BRN .fits_bit
    .fits_clear
    LDI u 0
    .fits_done
RET

; Take the falling piece off the screen / draw it
.erase_piece
    CAL .piece_mask
    MOV p pos
    LDI color 0
    CAL .draw_piece
RET

.show_piece
    CAL .piece_mask
    MOV p pos
    ADD t type .piece_colors
    LOD color t
    CAL .draw_piece
RET

; Draw piece m in color with its top left corner on square p
.draw_piece
    LDI k 4
    .draw_piece_bit
        TEST $0 m
        BPOSZ .draw_piece_skip
        MOV cell p
        CAL .draw_cell
        .draw_piece_skip
        LSHIFT m m 1
        BZ .draw_piece_done
        ADD p p 1
        SUB k k 1
        BNZ .draw_piece_bit
        LDI k 4
        ADD p p 28
        BRN .draw_piece_bit
    .draw_piece_done
RET

; Draw square number cell in color: 7x7 pixels, leaving a 1 pixel gap between squares
.draw_cell
    RSHIFT py cell 5
    LSHIFT py py 3
    ADD py py 1
    AND px cell 31
    LSHIFT px px 3
    ADD px px 1
    .draw_cell_row
        .draw_cell_pixel
            GFXSP color px py
            ADD px px 1
            AND $0 px 7
            BNZ .draw_cell_pixel
        SUB px px 7
        ADD py py 1
        AND $0 py 7
        BNZ .draw_cell_row
RET

; t = a random piece, 0 to 11
.random_piece
    LOD u .rng
    TEST $0 u                   ; the random number generator must never be 0
    BNZ .random_next
    LDI u 0xACE1
    .random_next
    LSHIFT t u 7                ; 16-bit xorshift
    XOR u u t
    RSHIFT t u 9
    XOR u u t
    LSHIFT t u 8
    XOR u u t
    AND t u 15
    ADD $0 t 12
    BGE .random_next
    STR u .rng
RET

; Show the score, rows and level, on the screen and on the output ports
.show_numbers
    LDI color number_color
    LDI px 146
    LDI py 52
    LOD t .score
    CAL .put_number
    LDI px 146
    LDI py 88
    LOD t .rows
    CAL .put_number
    LDI px 146
    LDI py 124
    LOD t .level
    CAL .put_number
    LOD t .score
    OUT t %0
    LOD t .rows
    OUT t %1
RET

; Print t as 5 decimal digits at (px, py) in color
.put_number
    LDI p .pow10
    .number_digit
        LOD m p
        ADD p p 1
        LDI k 0
        .number_subtract        ; the digit is how many times the power of ten can be taken off
            ADD $0 t m
            BLT .number_put
            SUB t t m
            ADD k k 1
            BRN .number_subtract
        .number_put
        MOV cell k
        CAL .put_char
        ADD $0 p .pow10_end
        BLT .number_digit
    MOV cell t                  ; what is left is the last digit
    CAL .put_char
RET

; Print the text at p (character numbers ending with 0xFFFF) at (px, py) in color
.put_string
    LOD cell p
    ADD p p 1
    TEST $0 cell
    BNEG .put_string_done
    CAL .put_char
    BRN .put_string
    .put_string_done
RET

; Draw character number cell at (px, py) in color and move px on to the next character.
; A character is 3 x 5 font pixels of 2 x 2 screen pixels: 15 bits from the top bit down, and
; a 1 in the lowest bit to mark the end. px must be 2 more than a multiple of 8.
.put_char
    ADD cell cell .font
    LOD cell cell
    .put_char_pixel
        TEST $0 cell            ; the top bit is the next font pixel
        SNEG u color $0
        LSHIFT cell cell 1
        GFXSP u px py
        ADD px px 1
        GFXSP u px py
        ADD py py 1
        GFXSP u px py
        SUB px px 1
        GFXSP u px py
        SUB py py 1
        ADD px px 2
        AND $0 px 7
        BNZ .put_char_same_row
        SUB px px 6             ; start the next row of the character
        ADD py py 2
        .put_char_same_row
        LSHIFT $0 cell 1        ; done when only the marker bit is left, at the top
        BNZ .put_char_pixel
    ADD px px 8
    SUB py py 10
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
