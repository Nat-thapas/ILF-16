; Fire: the classic demo effect.
;
; Input port 0: hold any bit (a switch or a button) to put the fire out. Let go to light it again.
;
; The fire is a grid of 128 x 48 heat values in RAM (from address 1024), drawn as blocks of
; 2 x 4 pixels at the bottom of the screen. The two bottom rows are not shown: they are the fuel,
; set at random to hot (3 times in 4) or cold every frame. Every other cell becomes the average
; of the three cells below it and the one two rows down, minus a little random cooling, so the
; heat rises and fades. Rows are done from the top down, so each cell still sees last frame's
; heat below it.
;
; Heat is 0 to 255 and its upper 4 bits pick the colour. A block is only drawn again when its
; colour changes. For better looking flames, change the palette in the emulator to a smooth
; ramp from black through red and yellow to white (colours 0, 2, 8, 9, 10 and 7 are used).

@define p $1
@define q $2
@define heat $3
@define t $4
@define old $5
@define rng $6
@define multiplier $7
@define px $8
@define py $9
@define color $10
@define fuel $11

@define buffer 1024             ; 128 x 48 words: RAM 1024 - 7167
@define fuel_rows 6912          ; address of the two bottom rows
@define top 72                  ; screen y of the first row: 46 rows of 4 pixels end at 256

; Colour for every 16 steps of heat
.ramp
DW 0 0 2 2 2 8 8 8 8 9 9 9 10 10 10 7

LDI multiplier 25173
LDI rng 1

; clear the screen and the heat
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
LDI p buffer
LDI t 6144
.clear_heat
    STR $0 p
    ADD p p 1
    SUB t t 1
    BNZ .clear_heat

.frame
    ; fuel: every cell of the two bottom rows is hot or cold at random (all cold if a bit of
    ; input port 0 is on)
    IN t %0
    TEST $0 t
    SZ fuel 255 0
    LDI p fuel_rows
    LDI t 256
    .fuel_cell
        MUL rng rng multiplier  ; random numbers: multiply and add 1, and use the upper bits
        ADD rng rng 1
        RSHIFT $0 rng 14        ; hot 3 times out of 4
        SNZ heat fuel $0
        STR heat p
        ADD p p 1
        SUB t t 1
        BNZ .fuel_cell

    LDI p buffer
    LDI py top
    .row
        LDI px 0
        .cell
            ; add up the cells below left, below, below right and two below
            ADD q p 127
            LOD heat q
            ADD q q 1
            LOD t q
            ADD heat heat t
            ADD q q 1
            LOD t q
            ADD heat heat t
            ADD q q 127
            LOD t q
            ADD heat heat t
            RSHIFT heat heat 2
            ; cool down by 2 to 9
            MUL rng rng multiplier
            ADD rng rng 1
            RSHIFT t rng 13
            ADD t t 2
            SUB heat heat t
            BNC .not_cold
            LDI heat 0
            .not_cold
            LOD old p
            STR heat p
            ; has the colour changed?
            RSHIFT color heat 4
            RSHIFT old old 4
            ADD $0 color old
            BEQ .drawn
            ADD color color .ramp
            LOD color color
            GFXSP color px py
            ADD px px 1
            GFXSP color px py
            ADD py py 1
            GFXSP color px py
            SUB px px 1
            GFXSP color px py
            ADD py py 1
            GFXSP color px py
            ADD px px 1
            GFXSP color px py
            ADD py py 1
            GFXSP color px py
            SUB px px 1
            GFXSP color px py
            SUB py py 3
            .drawn
            ADD p p 1
            ADD px px 2
            ADD $0 px 256
            BLT .cell
        ADD py py 4
        ADD $0 py 256
        BLT .row

    ; wait about 16 ms: with the work above that is roughly 30 frames per second
    LDI t 12
    .pace
        STL 0xFFFF
        SUB t t 1
        BNZ .pace
    BRN .frame
