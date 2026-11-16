; Mandelbrot zoom: keeps zooming in on one point of the Mandelbrot set (the branching
; filaments above the main body), then starts again.
;
; Drawn at 128x128 (2x2 pixel blocks): a frame takes about half a second at real speed, and
; the whole zoom about 40 seconds. Try the unlimited speed mode as well.
; See mandelbrot.asm for how the fixed point arithmetic works: numbers are signed Q4.12.
;
; The distance between two blocks is kept in 1/256ths of the smallest Q4.12 step, and gets
; 1/16 smaller every frame. It starts at 96 (the whole set) and the zoom ends when it reaches
; 1, where neighbouring blocks would land on the same number: a magnification of 96 times.
;
; Output port 0 shows the frame number.

@define px $1
@define py $2
@define cx $3
@define cy $4
@define zx $5
@define zy $6
@define iter $7
@define x2 $8
@define y2 $9
@define hi $10
@define lo $11
@define step $12
@define origin_x $13

@define max_iter 48
@define first_step 0x6000       ; 96 * 256
@define target_x 0xFE62         ; -0.1011
@define target_y 3917           ;  0.9563 (drawn towards the bottom, as y grows downwards)

; Colours for points outside the set, indexed by (iterations mod 16)
.palette
DW 1 2 13 14 8 9 10 7 15 6 12 11 3 5 4 2
.origin_y
DW 0
.frame_number
DW 0

.restart
LDI step first_step
.frame
    LOD lo .frame_number
    ADD lo lo 1
    STR lo .frame_number
    OUT lo %0

    ; the top left corner is 64 blocks up and left of the target: 64 * step / 256 = step / 4
    RSHIFT lo step 2
    LDI origin_x target_x
    SUB origin_x origin_x lo
    LDI hi target_y
    SUB hi hi lo
    STR hi .origin_y

    LDI py 0
    .row
        ; cy = origin_y + py * step / 256, using both halves of the 32-bit product
        MUL lo py step
        UMUL hi py step
        RSHIFT lo lo 8
        LSHIFT hi hi 8
        OR lo lo hi
        LOD cy .origin_y
        ADD cy cy lo
        LDI px 0
        .pixel
            ; cx = origin_x + px * step / 256
            MUL lo px step
            UMUL hi px step
            RSHIFT lo lo 8
            LSHIFT hi hi 8
            OR lo lo hi
            ADD cx origin_x lo

            MOV zx cx
            MOV zy cy
            LDI iter 0
            .iterate
                ; x2 = zx * zx
                SUMUL hi zx zx
                ADD $0 hi 0x400
                BGE .escaped
                MUL lo zx zx
                LSHIFT hi hi 4
                RSHIFT lo lo 12
                OR x2 hi lo
                ; y2 = zy * zy
                SUMUL hi zy zy
                ADD $0 hi 0x400
                BGE .escaped
                MUL lo zy zy
                LSHIFT hi hi 4
                RSHIFT lo lo 12
                OR y2 hi lo
                ; escaped if x2 + y2 >= 4.0 (0x4000, so any of the top two bits is set)
                ADD hi x2 y2
                RSHIFT $0 hi 14
                BNZ .escaped
                ; zy = 2 * zx * zy + cy
                SUMUL hi zx zy
                MUL lo zx zy
                LSHIFT hi hi 5
                RSHIFT lo lo 11
                OR zy hi lo
                ADD zy zy cy
                ; zx = x2 - y2 + cx
                SUB zx x2 y2
                ADD zx zx cx
                ADD iter iter 1
                ADD $0 iter max_iter
                BLT .iterate
            LDI hi 0            ; never escaped: inside the set
            BRN .plot
            .escaped
            AND hi iter 15
            ADD hi hi .palette
            LOD hi hi
            .plot
            ; draw the 2x2 block in colour hi
            LSHIFT lo px 1
            LSHIFT zx py 1
            GFXSP hi lo zx
            ADD lo lo 1
            GFXSP hi lo zx
            ADD zx zx 1
            GFXSP hi lo zx
            SUB lo lo 1
            GFXSP hi lo zx

            ADD px px 1
            ADD $0 px 128
            BLT .pixel
        ADD py py 1
        ADD $0 py 128
        BLT .row

    ; zoom in by 1/16 for the next frame
    RSHIFT lo step 4
    SUB step step lo
    ADD $0 step 256
    BGE .frame

    ; fully zoomed in: hold the last frame for about a second, then start again
    LDI lo 700
    .hold
        STL 0xFFFF
        SUB lo lo 1
        BNZ .hold
    BRN .restart
