; Snake on a 32x32 board.
;
; Input port 0: game controller. D-pad 1 (bits 0-3: up, down, left, right) steers the snake.
;               After a crash, release everything and press any button to play again.
; Output port 0: score.
;
; Run it in real time: the game is paced with STL, which takes no time in unlimited mode.
;
; RAM layout:
;   0    - 1023 : the board, one word per cell (0 = empty, 1 = snake, 2 = food).
;                 A cell number is y * 32 + x.
;   1024 - 2047 : cell numbers of the snake's body, as a ring buffer from tail_ptr to head_ptr.

@define head $1
@define dir $2
@define want $3
@define head_ptr $4
@define tail_ptr $5
@define score $6
@define rng $7
@define timer $8
@define t $9
@define u $10
@define color $11
@define px $12
@define py $13

@define body 1024
@define snake_color 11
@define food_color 8
@define crash_color 9

LDI rng 0x1D2B

.new_game
    ; clear the screen
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

    ; clear the board
    LDI t 0
    .clear_board
        STR $0 t
        ADD t t 1
        ADD $0 t 1024
        BLT .clear_board

    ; start 3 cells long in the middle of the board (cells 526 to 528), moving right
    LDI head 526
    LDI head_ptr 0
    LDI tail_ptr 0
    .start_snake
        LDI t 1
        STR t head
        ADD u head_ptr body
        STR head u
        MOV t head
        LDI color snake_color
        CAL .draw_cell
        ADD $0 head 528
        BEQ .start_done
        ADD head head 1
        ADD head_ptr head_ptr 1
        BRN .start_snake
    .start_done
    LDI dir 8
    LDI want 8
    LDI score 0
    OUT score %0
    CAL .place_food

.tick
    ; Time between moves: 60 stalls of 1.4 ms, getting shorter as the score goes up
    RSHIFT t score 1
    LDI timer 60
    SUB timer timer t
    ADD $0 timer 20
    BSGE .wait
    LDI timer 20
    .wait
        STL 0xFFFF
        IN t %0
        AND t t 15
        BZ .no_key
        ADD rng rng timer       ; when keys are pressed makes the food less predictable
        SUB u $0 t              ; keep only the lowest pressed direction: t & -t
        AND t t u
        OR u t dir              ; ignore it if it is the opposite of the current direction
        ADD $0 u 3              ; up | down
        BEQ .no_key
        ADD $0 u 12             ; left | right
        BEQ .no_key
        MOV want t
        .no_key
        SUB timer timer 1
        BNZ .wait

    ; move the head one cell, crashing if that leaves the board
    MOV dir want
    ADD $0 dir 1
    BEQ .up
    ADD $0 dir 2
    BEQ .down
    ADD $0 dir 4
    BEQ .left
    .right
        AND t head 31
        ADD $0 t 31
        BEQ .game_over
        ADD head head 1
        BRN .moved
    .left
        AND t head 31
        BZ .game_over
        SUB head head 1
        BRN .moved
    .up
        ADD $0 head 32
        BLT .game_over
        SUB head head 32
        BRN .moved
    .down
        ADD $0 head 992
        BGE .game_over
        ADD head head 32
    .moved

    LOD t head
    ADD $0 t 2
    BEQ .eat
    ; not food: the tail moves on (before the crash test, so the snake can follow its tail)
    ADD u tail_ptr body
    LOD t u
    STR $0 t
    LDI color 0
    CAL .draw_cell
    ADD tail_ptr tail_ptr 1
    AND tail_ptr tail_ptr 1023
    LOD t head
    TEST $0 t
    BNZ .game_over
    BRN .advance
    .eat
    ADD score score 1
    OUT score %0
    CAL .place_food
    .advance
    LDI t 1
    STR t head
    ADD head_ptr head_ptr 1
    AND head_ptr head_ptr 1023
    ADD u head_ptr body
    STR head u
    MOV t head
    LDI color snake_color
    CAL .draw_cell
    BRN .tick

.game_over
    MOV t head
    LDI color crash_color
    CAL .draw_cell
    .wait_release
        IN t %0
        TEST $0 t
        BNZ .wait_release
    .wait_press
        ADD rng rng 1
        IN t %0
        TEST $0 t
        BZ .wait_press
    BRN .new_game

; Put food on a random empty cell
.place_food
    TEST $0 rng                 ; the random number generator must never be 0
    BNZ .next_random
    LDI rng 0xACE1
    .next_random
    LSHIFT t rng 7              ; 16-bit xorshift
    XOR rng rng t
    RSHIFT t rng 9
    XOR rng rng t
    LSHIFT t rng 8
    XOR rng rng t
    AND t rng 1023
    LOD u t
    TEST $0 u
    BNZ .next_random
    LDI u 2
    STR u t
    LDI color food_color
    CAL .draw_cell
RET

; Draw cell number t in color: a 7x7 square, leaving a 1 pixel gap between cells
.draw_cell
    RSHIFT py t 5
    LSHIFT py py 3
    ADD py py 1
    AND px t 31
    LSHIFT px px 3
    ADD px px 1
    .draw_row
        .draw_pixel
            GFXSP color px py
            ADD px px 1
            AND $0 px 7
            BNZ .draw_pixel
        SUB px px 7
        ADD py py 1
        AND $0 py 7
        BNZ .draw_row
RET
