; Conway's Game of Life on a 64x64 grid that wraps around at the edges.
;
; Hold any bit of input port 0 (a switch or a button) to start again from a new random grid.
; Output port 0 shows the generation number.
;
; The grid is stored in RAM, one word per cell, with a one cell border on every side
; (66 words per row). Before each generation the opposite edge is copied into the border,
; so the neighbour counting never has to deal with wrapping.
; Bit 0 of a cell is its current state. The next state is first written to bit 1, and
; only moved down to bit 0 once every cell has been counted.

@define ptr $1
@define n $2
@define count $3
@define cell $4
@define t $5
@define x $6
@define y $7
@define color $8
@define px $9
@define py $10
@define gen $11
@define rng $12
@define step $13
; arguments of .copy, sharing registers with n, count and cell
@define src $2
@define dst $3
@define cnt $4

@define alive_color 11

LDI rng 0xACE1

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

.restart
; fill the grid at random, about one cell in four alive
LDI ptr 67                      ; address of cell (0, 0): one row and one column in
LDI y 0
.seed_row
    LDI x 0
    .seed_cell
        LSHIFT t rng 7          ; 16-bit xorshift random number generator
        XOR rng rng t
        RSHIFT t rng 9
        XOR rng rng t
        LSHIFT t rng 8
        XOR rng rng t
        AND $0 rng 3
        SZ cell 1 0
        SZ color alive_color 0
        STR cell ptr
        CAL .draw_cell
        ADD ptr ptr 1
        ADD x x 1
        ADD $0 x 64
        BLT .seed_cell
    ADD ptr ptr 2               ; skip the right and left border
    ADD y y 1
    ADD $0 y 64
    BLT .seed_row
LDI gen 0

.generation
    OUT gen %0
    ADD gen gen 1
    IN t %0
    TEST $0 t
    BNZ .restart

    ; copy the edges into the opposite border: rows first, then columns (with the corners)
    LDI step 1
    LDI src 4225                ; bottom row -> top border
    LDI dst 1
    LDI cnt 64
    CAL .copy
    LDI src 67                  ; top row -> bottom border
    LDI dst 4291
    LDI cnt 64
    CAL .copy
    LDI step 66
    LDI src 64                  ; right column -> left border
    LDI dst 0
    LDI cnt 66
    CAL .copy
    LDI src 1                   ; left column -> right border
    LDI dst 65
    LDI cnt 66
    CAL .copy

    ; pass 1: count the neighbours of every cell and store its next state in bit 1
    LDI ptr 67
    LDI y 64
    .count_row
        LDI x 64
        .count_cell
            ; the three above and the one to the left may already have their bit 1 set
            SUB n ptr 67
            LOD count n
            AND count count 1
            ADD n n 1
            LOD t n
            AND t t 1
            ADD count count t
            ADD n n 1
            LOD t n
            AND t t 1
            ADD count count t
            ADD n n 64
            LOD t n
            AND t t 1
            ADD count count t
            ; the one to the right and the three below are still 0 or 1
            ADD n n 2
            LOD t n
            ADD count count t
            ADD n n 64
            LOD t n
            ADD count count t
            ADD n n 1
            LOD t n
            ADD count count t
            ADD n n 1
            LOD t n
            ADD count count t
            ; alive next if it has 3 neighbours, or 2 and is alive now: (count | cell) = 3
            LOD cell ptr
            OR t count cell
            ADD $0 t 3
            SEQ t 2 0
            OR cell cell t
            STR cell ptr
            ADD ptr ptr 1
            SUB x x 1
            BNZ .count_cell
        ADD ptr ptr 2
        SUB y y 1
        BNZ .count_row

    ; pass 2: make the next state current, redrawing only the cells that changed
    LDI ptr 67
    LDI y 0
    .update_row
        LDI x 0
        .update_cell
            LOD cell ptr
            RSHIFT t cell 1
            STR t ptr
            AND cell cell 1
            ADD $0 t cell
            BEQ .unchanged
            TEST $0 t
            SNZ color alive_color 0
            CAL .draw_cell
            .unchanged
            ADD ptr ptr 1
            ADD x x 1
            ADD $0 x 64
            BLT .update_cell
        ADD ptr ptr 2
        ADD y y 1
        ADD $0 y 64
        BLT .update_row

    ; wait about 40 ms so it does not run too fast to follow
    LDI t 30
    .pace
        STL 0xFFFF
        SUB t t 1
        BNZ .pace
    BRN .generation

; Copy cnt words from src to dst, moving both by step after every word
.copy
    LOD t src
    STR t dst
    ADD src src step
    ADD dst dst step
    SUB cnt cnt 1
    BNZ .copy
RET

; Draw cell (x, y) in color: a 3x3 square, leaving a 1 pixel gap between cells
.draw_cell
    LSHIFT px x 2
    LSHIFT py y 2
    GFXSP color px py
    ADD px px 1
    GFXSP color px py
    ADD px px 1
    GFXSP color px py
    ADD py py 1
    GFXSP color px py
    SUB px px 1
    GFXSP color px py
    SUB px px 1
    GFXSP color px py
    ADD py py 1
    GFXSP color px py
    ADD px px 1
    GFXSP color px py
    ADD px px 1
    GFXSP color px py
RET
