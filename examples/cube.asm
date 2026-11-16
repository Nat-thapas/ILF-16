; Rotating 3D wireframe cube, drawn in perspective.
;
; Input port 0: analog stick (optional). While it is off centre it turns the cube: left/right
;               about the vertical axis, up/down about the horizontal one. Left alone, the
;               cube spins by itself.
;
; Every frame the 8 corners are rotated about two axes and projected onto the screen, the 12
; edges of the previous frame are erased and the new ones drawn with Bresenham's line algorithm.
;
; Coordinates are signed Q8.8 (256 = 1 pixel). Sines are signed Q15 (32767 = 1.0), so the
; upper word of a product (SUMUL) is half the answer and gets doubled afterwards.
; The CPU has no division, so the perspective divide is a table of 256 * 160 / (160 + z)
; in Q8.8, indexed by the whole part of z.

; Registers while the corners are being calculated
@define i $1
@define x $2
@define y $3
@define z $4
@define sin_a $5
@define cos_a $6
@define sin_b $7
@define cos_b $8
@define t $9
@define u $10
@define v $11
@define pos $12
@define neg $13

; Registers while the lines are being drawn (t, u and v above become err, e2 and color)
@define x0 $1
@define y0 $2
@define x1 $3
@define y1 $4
@define dx $5
@define dy $6
@define step_x $7
@define step_y $8
@define err $9
@define e2 $10
@define color $11
@define edge $12
@define base $13

@define half_size 0x3400        ;  52.0: half the length of an edge
@define minus_half_size 0xCC00  ; -52.0

; sin(2 * pi * n / 256) * 32767
.sine
DW 0 804 1608 2410 3212 4011 4808 5602 6393 7179 7962 8739 9512 10278 11039 11793
DW 12539 13279 14010 14732 15446 16151 16846 17530 18204 18868 19519 20159 20787 21403 22005 22594
DW 23170 23731 24279 24811 25329 25832 26319 26790 27245 27683 28105 28510 28898 29268 29621 29956
DW 30273 30571 30852 31113 31356 31580 31785 31971 32137 32285 32412 32521 32609 32678 32728 32757
DW 32767 32757 32728 32678 32609 32521 32412 32285 32137 31971 31785 31580 31356 31113 30852 30571
DW 30273 29956 29621 29268 28898 28510 28105 27683 27245 26790 26319 25832 25329 24811 24279 23731
DW 23170 22594 22005 21403 20787 20159 19519 18868 18204 17530 16846 16151 15446 14732 14010 13279
DW 12539 11793 11039 10278 9512 8739 7962 7179 6393 5602 4808 4011 3212 2410 1608 804
DW 0 -804 -1608 -2410 -3212 -4011 -4808 -5602 -6393 -7179 -7962 -8739 -9512 -10278 -11039 -11793
DW -12539 -13279 -14010 -14732 -15446 -16151 -16846 -17530 -18204 -18868 -19519 -20159 -20787 -21403 -22005 -22594
DW -23170 -23731 -24279 -24811 -25329 -25832 -26319 -26790 -27245 -27683 -28105 -28510 -28898 -29268 -29621 -29956
DW -30273 -30571 -30852 -31113 -31356 -31580 -31785 -31971 -32137 -32285 -32412 -32521 -32609 -32678 -32728 -32757
DW -32767 -32757 -32728 -32678 -32609 -32521 -32412 -32285 -32137 -31971 -31785 -31580 -31356 -31113 -30852 -30571
DW -30273 -29956 -29621 -29268 -28898 -28510 -28105 -27683 -27245 -26790 -26319 -25832 -25329 -24811 -24279 -23731
DW -23170 -22594 -22005 -21403 -20787 -20159 -19519 -18868 -18204 -17530 -16846 -16151 -15446 -14732 -14010 -13279
DW -12539 -11793 -11039 -10278 -9512 -8739 -7962 -7179 -6393 -5602 -4808 -4011 -3212 -2410 -1608 -804

; 256 * 160 / (160 + z) for z = -128 to 127
.scale
DW 1280 1241 1205 1170 1138 1107 1078 1050 1024 999 975 953 931 910 890 871
DW 853 836 819 803 788 773 759 745 731 719 706 694 683 671 661 650
DW 640 630 621 611 602 594 585 577 569 561 554 546 539 532 525 518
DW 512 506 500 493 488 482 476 471 465 460 455 450 445 440 436 431
DW 427 422 418 414 410 406 402 398 394 390 386 383 379 376 372 369
DW 366 362 359 356 353 350 347 344 341 339 336 333 330 328 325 323
DW 320 318 315 313 310 308 306 303 301 299 297 295 293 290 288 286
DW 284 282 281 279 277 275 273 271 269 268 266 264 263 261 259 258
DW 256 254 253 251 250 248 247 245 244 242 241 240 238 237 235 234
DW 233 231 230 229 228 226 225 224 223 221 220 219 218 217 216 214
DW 213 212 211 210 209 208 207 206 205 204 203 202 201 200 199 198
DW 197 196 195 194 193 192 191 191 190 189 188 187 186 185 185 184
DW 183 182 181 180 180 179 178 177 177 176 175 174 174 173 172 171
DW 171 170 169 169 168 167 167 166 165 164 164 163 163 162 161 161
DW 160 159 159 158 158 157 156 156 155 155 154 153 153 152 152 151
DW 151 150 149 149 148 148 147 147 146 146 145 145 144 144 143 143

; The 12 edges: offsets of the two corners in the point lists (corner number * 2), and colour.
; Bit 0 of a corner number is its x side, bit 1 its y side and bit 2 its z side.
.edges
DW 0 2 8
DW 4 6 8
DW 8 10 8
DW 12 14 8
DW 0 4 11
DW 2 6 11
DW 8 12 11
DW 10 14 11
DW 0 8 12
DW 2 10 12
DW 4 12 12
DW 6 14 12
DW 0x8000                       ; end of the list

; Screen x and y of the 8 corners, for this frame and the previous one
.new_points
DW 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.old_points
DW 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.angle_a
DW 0
.angle_b
DW 0
.mask
DW 0

; clear the screen
LDI y0 0
.clear_row
    LDI x0 0
    .clear_pixel
        GFXSP $0 x0 y0
        ADD x0 x0 1
        ADD $0 x0 256
        BLT .clear_pixel
    ADD y0 y0 1
    ADD $0 y0 256
    BLT .clear_row

.frame
    ; turn: by the stick if it is being used, otherwise at a steady speed.
    ; Angles are 16 bits for a full turn; the upper 8 bits index the sine table.
    IN t %0
    TEST $0 t
    BNZ .stick
    LOD u .angle_a
    ADD u u 300
    STR u .angle_a
    LOD u .angle_b
    ADD u u 190
    STR u .angle_b
    BRN .turned
    .stick
    AND u t 255                 ; low byte: signed x
    ADD $0 u 128
    BLT .stick_x_positive
    SUB u u 256
    .stick_x_positive
    LSHIFT u u 3
    LOD v .angle_a
    ADD v v u
    STR v .angle_a
    RSHIFT u t 8                ; high byte: signed y
    ADD $0 u 128
    BLT .stick_y_positive
    SUB u u 256
    .stick_y_positive
    LSHIFT u u 3
    LOD v .angle_b
    ADD v v u
    STR v .angle_b
    .turned

    ; look up the sine and cosine (the sine a quarter turn later) of both angles
    LOD t .angle_a
    RSHIFT t t 8
    ADD u t .sine
    LOD sin_a u
    ADD t t 64
    AND t t 255
    ADD t t .sine
    LOD cos_a t
    LOD t .angle_b
    RSHIFT t t 8
    ADD u t .sine
    LOD sin_b u
    ADD t t 64
    AND t t 255
    ADD t t .sine
    LOD cos_b t

    LDI pos half_size
    LDI neg minus_half_size
    LDI i 0
    .corner
        ; the corner's position before turning comes from the bits of its number
        AND $0 i 1
        SNZ x pos neg
        AND $0 i 2
        SNZ y pos neg
        AND $0 i 4
        SNZ z pos neg
        ; turn about the vertical axis: (x, z) = (x cos a + z sin a, z cos a - x sin a)
        SUMUL t x cos_a
        SUMUL u z sin_a
        ADD t t u
        LSHIFT t t 1
        SUMUL u z cos_a
        SUMUL v x sin_a
        SUB z u v
        LSHIFT z z 1
        MOV x t
        ; turn about the horizontal axis: (y, z) = (y cos b - z sin b, y sin b + z cos b)
        SUMUL t y cos_b
        SUMUL u z sin_b
        SUB t t u
        LSHIFT t t 1
        SUMUL u y sin_b
        SUMUL v z cos_b
        ADD z u v
        LSHIFT z z 1
        MOV y t
        ; perspective: scale x and y by the table entry for z, then move to the screen centre
        RSHIFT t z 8
        XOR t t 128             ; whole part of z, -128..127 -> table index 0..255
        ADD t t .scale
        LOD t t
        SUMUL x x t
        ADD x x 128
        SUMUL y y t
        ADD y y 128
        LSHIFT u i 1
        ADD u u .new_points
        STR x u
        ADD u u 1
        STR y u
        ADD i i 1
        ADD $0 i 8
        BLT .corner

    ; erase the previous frame's edges, then draw the new ones
    LDI base .old_points
    STR $0 .mask
    CAL .draw_edges
    LDI base .new_points
    LDI t 15
    STR t .mask
    CAL .draw_edges

    ; remember where the corners are so they can be erased next frame
    LDI t 0
    .remember
        ADD u t .new_points
        LOD v u
        ADD u t .old_points
        STR v u
        ADD t t 1
        ADD $0 t 16
        BLT .remember

    ; wait about 27 ms: together with the drawing that gives roughly 30 frames per second
    LDI t 20
    .pace
        STL 0xFFFF
        SUB t t 1
        BNZ .pace
    BRN .frame

; Draw every edge between the points at base. Colours are ANDed with .mask (0 erases).
.draw_edges
    LDI edge .edges
    .next_edge
        LOD x1 edge
        ADD x1 x1 base
        LOD x0 x1
        ADD x1 x1 1
        LOD y0 x1
        ADD edge edge 1
        LOD y1 edge
        ADD y1 y1 base
        LOD x1 y1
        ADD y1 y1 1
        LOD y1 y1
        ADD edge edge 1
        LOD color edge
        ADD edge edge 1
        LOD e2 .mask
        AND color color e2
        CAL .line
        LOD e2 edge
        TEST $0 e2
        BPOSZ .next_edge
RET

; Bresenham's line algorithm: draw from (x0, y0) to (x1, y1) in color
.line
    SUB dx x1 x0                ; dx = |x1 - x0|, step_x = direction of x
    LDI step_x 1
    BGE .dx_done
    SUB dx x0 x1
    LDI step_x 0xFFFF
    .dx_done
    SUB dy y0 y1                ; dy = -|y1 - y0|, step_y = direction of y
    LDI step_y 1
    BLE .dy_done
    SUB dy y1 y0
    LDI step_y 0xFFFF
    .dy_done
    ADD err dx dy
    .line_pixel
        GFXSP color x0 y0
        ADD $0 x0 x1
        BNEQ .line_step
        ADD $0 y0 y1
        BEQ .line_done
        .line_step
        LSHIFT e2 err 1
        ADD $0 e2 dy
        BSLT .line_no_x
        ADD err err dy
        ADD x0 x0 step_x
        .line_no_x
        ADD $0 e2 dx
        BSGT .line_pixel
        ADD err err dx
        ADD y0 y0 step_y
        BRN .line_pixel
    .line_done
RET
