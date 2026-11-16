; Raycaster: walk around a maze seen in first person.
;
; Input port 0: game controller, d-pad 1 (bits 0-3). Up and down walk forwards and backwards,
;               left and right turn. Switches on bits 0-3 work as well.
;
; For each of 128 screen columns (2 pixels wide) a ray is sent out from the player and stepped
; from one grid line of the map to the next until it enters a wall. How far it went decides how
; tall the wall is drawn in that column; which kind of grid line it crossed picks the lighter or
; darker shade of the wall's colour.
;
; Positions and distances are Q8.8 (256 = one map square), directions are signed Q14
; (16384 = 1.0). There is no division, so 1/x comes from two tables that are filled in when
; the program starts:
;   recip[n]  = 131072 / n : how far a ray travels between two grid lines, by its direction / 32
;   height[n] = 16384 / n  : half the height of a wall on screen, by its distance / 2

@define x $1
@define ray_x $2
@define ray_y $3
@define cell $4
@define side_x $5
@define side_y $6
@define delta_x $7
@define delta_y $8
@define step_x $9
@define step_y $10
@define t $11
@define u $12
@define v $13

; The same registers under other names while a column is drawn
@define x_right $4
@define top $5
@define bottom $6
@define color $7
@define y $8

@define recip 1024              ; RAM 1024 - 1663
@define height 2048             ; RAM 2048 - 4095
@define sky_color 1
@define floor_color 5

; sin(2 * pi * n / 256) * 16384
.sine
DW 0 402 804 1205 1606 2006 2404 2801 3196 3590 3981 4370 4756 5139 5520 5897
DW 6270 6639 7005 7366 7723 8076 8423 8765 9102 9434 9760 10080 10394 10702 11003 11297
DW 11585 11866 12140 12406 12665 12916 13160 13395 13623 13842 14053 14256 14449 14635 14811 14978
DW 15137 15286 15426 15557 15679 15791 15893 15986 16069 16143 16207 16261 16305 16340 16364 16379
DW 16384 16379 16364 16340 16305 16261 16207 16143 16069 15986 15893 15791 15679 15557 15426 15286
DW 15137 14978 14811 14635 14449 14256 14053 13842 13623 13395 13160 12916 12665 12406 12140 11866
DW 11585 11297 11003 10702 10394 10080 9760 9434 9102 8765 8423 8076 7723 7366 7005 6639
DW 6270 5897 5520 5139 4756 4370 3981 3590 3196 2801 2404 2006 1606 1205 804 402
DW 0 -402 -804 -1205 -1606 -2006 -2404 -2801 -3196 -3590 -3981 -4370 -4756 -5139 -5520 -5897
DW -6270 -6639 -7005 -7366 -7723 -8076 -8423 -8765 -9102 -9434 -9760 -10080 -10394 -10702 -11003 -11297
DW -11585 -11866 -12140 -12406 -12665 -12916 -13160 -13395 -13623 -13842 -14053 -14256 -14449 -14635 -14811 -14978
DW -15137 -15286 -15426 -15557 -15679 -15791 -15893 -15986 -16069 -16143 -16207 -16261 -16305 -16340 -16364 -16379
DW -16384 -16379 -16364 -16340 -16305 -16261 -16207 -16143 -16069 -15986 -15893 -15791 -15679 -15557 -15426 -15286
DW -15137 -14978 -14811 -14635 -14449 -14256 -14053 -13842 -13623 -13395 -13160 -12916 -12665 -12406 -12140 -11866
DW -11585 -11297 -11003 -10702 -10394 -10080 -9760 -9434 -9102 -8765 -8423 -8076 -7723 -7366 -7005 -6639
DW -6270 -5897 -5520 -5139 -4756 -4370 -3981 -3590 -3196 -2801 -2404 -2006 -1606 -1205 -804 -402

; The map, 16 x 16 squares. 0 is empty, 1 to 4 are walls of different colours.
.map
DW 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
DW 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
DW 1 0 2 2 0 0 0 0 0 3 0 3 0 3 0 1
DW 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 1
DW 1 0 0 0 0 4 4 4 0 0 0 0 0 3 0 1
DW 1 0 0 0 0 4 0 4 0 0 2 0 0 0 0 1
DW 1 0 3 0 0 4 0 4 0 0 2 0 0 3 0 1
DW 1 0 3 0 0 0 0 0 0 0 2 0 0 0 0 1
DW 1 0 3 0 0 0 0 0 0 0 0 0 0 0 0 1
DW 1 0 0 0 0 2 2 0 2 2 0 0 4 4 0 1
DW 1 0 0 0 0 2 0 0 0 2 0 0 4 0 0 1
DW 1 0 4 4 0 2 0 0 0 2 0 0 0 0 0 1
DW 1 0 4 0 0 2 2 2 2 2 0 3 0 3 0 1
DW 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
DW 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
DW 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

; Two colours for every kind of wall: for the sides facing east/west, and north/south
.wall_colors
DW 0 0
DW 8 2
DW 11 3
DW 10 9
DW 7 6

.pos_x
DW 0x0480                       ; the player starts at (4.5, 8.5), looking east
.pos_y
DW 0x0880
.angle
DW 0                            ; 65536 is a full turn; 0 is east and it grows clockwise
.ray_step_x
DW 0                            ; how much the ray direction changes from one column to the next
.ray_step_y
DW 0

; ---------------------------------------------------------------------------------------------
; Fill in the tables. Both get smaller as n grows, so instead of dividing, the previous value
; is lowered until value * n is small enough.
; ---------------------------------------------------------------------------------------------
LDI t 32767                     ; recip[n] = 131072 / n, at most 32767
STR t recip
LDI x 1
.recip_entry
    .recip_lower
        UMUL u t x              ; upper word of t * x: below 2 means t * x < 131072
        ADD $0 u 2
        BLT .recip_store
        SUB t t 1
        BRN .recip_lower
    .recip_store
    ADD u x recip
    STR t u
    ADD x x 1
    ADD $0 x 640
    BLT .recip_entry

LDI t 128                       ; height[n] = 16384 / n, at most 128 (the whole screen)
STR t height
LDI x 1
.height_entry
    .height_lower
        UMUL u t x              ; lower t until t * x < 16384
        BNZ .height_too_big
        MUL u t x
        RSHIFT $0 u 14
        BZ .height_store
        .height_too_big
        SUB t t 1
        BRN .height_lower
    .height_store
    ADD u x height
    STR t u
    ADD x x 1
    ADD $0 x 2048
    BLT .height_entry

; ---------------------------------------------------------------------------------------------
.frame
    ; turn
    IN t %0
    LOD u .angle
    AND $0 t 4
    BZ .no_left
    SUB u u 768
    .no_left
    AND $0 t 8
    BZ .no_right
    ADD u u 768
    .no_right
    STR u .angle

    ; the direction the player faces: (cos, sin) of the angle
    RSHIFT u u 8
    ADD v u .sine
    LOD ray_y v
    ADD u u 64
    AND u u 255
    ADD u u .sine
    LOD ray_x u

    ; walk: about 0.08 of a square per frame, forwards or backwards
    AND $0 t 3
    BZ .no_walk
    SUMUL side_x ray_x 80
    SUMUL side_y ray_y 80
    AND $0 t 1
    BNZ .forwards
    SUB side_x $0 side_x
    SUB side_y $0 side_y
    .forwards
    LOD u .pos_x
    LOD v .pos_y
    ; x and y are moved separately, so the player slides along a wall instead of stopping.
    ; The square 4 steps ahead must be empty: that keeps a little distance from the walls.
    LSHIFT cell side_x 2
    ADD cell cell u
    RSHIFT cell cell 8
    RSHIFT delta_x v 8
    LSHIFT delta_x delta_x 4
    ADD cell cell delta_x
    ADD cell cell .map
    LOD cell cell
    TEST $0 cell
    BNZ .blocked_x
    ADD u u side_x
    STR u .pos_x
    .blocked_x
    LSHIFT cell side_y 2
    ADD cell cell v
    RSHIFT cell cell 8
    LSHIFT cell cell 4
    RSHIFT delta_x u 8
    ADD cell cell delta_x
    ADD cell cell .map
    LOD cell cell
    TEST $0 cell
    BNZ .blocked_y
    ADD v v side_y
    STR v .pos_y
    .blocked_y
    .no_walk

    ; The screen is a line across the view, at right angles to the direction: 0.66 of its
    ; length to either side, which gives a 66 degree field of view. The ray for the left edge
    ; is direction - plane, and each column adds plane / 64.
    LDI u 21627                 ; 0.66 in Q15
    SUMUL side_x ray_y u
    LSHIFT side_x side_x 1
    SUB side_x $0 side_x        ; plane x = -sin * 0.66
    SUMUL side_y ray_x u
    LSHIFT side_y side_y 1      ; plane y = cos * 0.66
    SUMUL t side_x 1024
    STR t .ray_step_x
    SUMUL t side_y 1024
    STR t .ray_step_y
    SUB ray_x ray_x side_x
    SUB ray_y ray_y side_y

    LDI x 0
    .column
        ; For x: which way the ray steps through the map (step_x), how far it travels between
        ; two grid lines (delta_x), and how far it is to the first one (side_x).
        LOD t .pos_x
        AND u t 255             ; how far the player is into the square
        TEST $0 ray_x
        BNEG .ray_west
        LDI step_x 1
        SUB u 256 u             ; going east: the rest of the square is ahead
        RSHIFT v ray_x 5
        BRN .ray_x_done
        .ray_west
        LDI step_x 0xFFFF
        SUB v $0 ray_x
        RSHIFT v v 5
        .ray_x_done
        ADD v v recip
        LOD delta_x v
        MUL v u delta_x         ; side_x = (part of the square ahead) * delta_x
        UMUL u u delta_x
        RSHIFT v v 8
        LSHIFT u u 8
        OR side_x u v
        RSHIFT cell t 8

        ; the same for y, where a step is a whole row of the map
        LOD t .pos_y
        AND u t 255
        TEST $0 ray_y
        BNEG .ray_north
        LDI step_y 16
        SUB u 256 u
        RSHIFT v ray_y 5
        BRN .ray_y_done
        .ray_north
        LDI step_y 0xFFF0
        SUB v $0 ray_y
        RSHIFT v v 5
        .ray_y_done
        ADD v v recip
        LOD delta_y v
        MUL v u delta_y
        UMUL u u delta_y
        RSHIFT v v 8
        LSHIFT u u 8
        OR side_y u v
        RSHIFT t t 8
        LSHIFT t t 4
        ADD cell cell t         ; the map square the player is in

        ; step to whichever grid line is nearer, until the square entered is a wall
        .step
            ADD $0 side_x side_y
            BGE .step_in_y
            ADD side_x side_x delta_x
            ADD cell cell step_x
            ADD t cell .map
            LOD t t
            TEST $0 t
            BZ .step
            SUB u side_x delta_x    ; distance to the wall, measured straight ahead
            LSHIFT t t 1
            BRN .hit
            .step_in_y
            ADD side_y side_y delta_y
            ADD cell cell step_y
            ADD t cell .map
            LOD t t
            TEST $0 t
            BZ .step
            SUB u side_y delta_y
            LSHIFT t t 1
            ADD t t 1
        .hit
        ADD t t .wall_colors
        LOD color t
        RSHIFT u u 1
        AND u u 2047
        ADD u u height
        LOD u u                 ; half the height of the wall
        SUB top 128 u
        ADD bottom u 128

        ; draw the column: sky, wall, floor
        ADD x_right x 1
        LDI v sky_color
        LDI t floor_color
        LDI y 0
        TEST $0 top
        BZ .wall
        .sky
            GFXSP v x y
            GFXSP v x_right y
            ADD y y 1
            ADD $0 y top
            BLT .sky
        .wall
            GFXSP color x y
            GFXSP color x_right y
            ADD y y 1
            ADD $0 y bottom
            BLT .wall
        ADD $0 y 256
        BGE .column_done
        .floor
            GFXSP t x y
            GFXSP t x_right y
            ADD y y 1
            ADD $0 y 256
            BLT .floor
        .column_done

        LOD t .ray_step_x
        ADD ray_x ray_x t
        LOD t .ray_step_y
        ADD ray_y ray_y t
        ADD x x 2
        ADD $0 x 256
        BLT .column

    ; a frame takes about 15 ms to draw: wait 19 ms more for roughly 30 frames per second
    LDI t 14
    .pace
        STL 0xFFFF
        SUB t t 1
        BNZ .pace
    BRN .frame
