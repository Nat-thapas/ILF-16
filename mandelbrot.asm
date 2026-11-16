; Mandelbrot set, drawn with 16-bit fixed point arithmetic.
;
; Numbers are signed Q4.12 (4096 = 1.0). A product of two of them is a 32-bit Q8.24 value:
; SUMUL gives its upper word and MUL its lower word, which are then stitched back into Q4.12.
; The view is 3.0 wide (real -2.25 to 0.75, imaginary -1.5 to 1.5), so one pixel is 48/4096.
;
; Output port 0 shows the row being drawn. Takes a few seconds at real speed.

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
@define color $12
@define four $13

@define max_iter 64
@define pixel_step 48

; Colours for points outside the set, indexed by (iterations mod 16)
.palette
DW 1 2 13 14 8 9 10 7 15 6 12 11 3 5 4 2

LDI four 0x4000
LDI cy 0xE800                   ; -1.5
LDI py 0
.row
    OUT py %0
    LDI cx 0xDC00               ; -2.25
    LDI px 0
    .pixel
        MOV zx cx               ; z = c (the result of the first iteration from z = 0)
        MOV zy cy
        LDI iter 0
        .iterate
            ; x2 = zx * zx. The upper word is Q8.8: if it is already 4.0 or more, |z| > 2.
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
            ; escaped if x2 + y2 > 4.0
            ADD hi x2 y2
            ADD $0 hi four
            BGT .escaped
            ; zy = 2 * zx * zy + cy (one bit less of shift does the doubling)
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
        LDI color 0             ; never escaped: inside the set
        BRN .plot
        .escaped
        AND color iter 15
        ADD color color .palette
        LOD color color
        .plot
        GFXSP color px py
        ADD cx cx pixel_step
        ADD px px 1
        ADD $0 px 256
        BLT .pixel
    ADD cy cy pixel_step
    ADD py py 1
    ADD $0 py 256
    BLT .row
HLT
