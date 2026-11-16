@define x_pos $6
@define y_pos $7
@define color $8
@define square_color $9

LDI square_color 15

.frame
    LDI y_pos 0
    .line
        LDI x_pos 0
        .line_loop
            AND $1 x_pos 0x60
            AND $2 y_pos 0x60
            AND $1 $1 $2
            ADD $0 $1 0x60
            BEQ .draw_square
            GFXSP color x_pos y_pos
            BRN .draw_end
            .draw_square
            GFXSP square_color x_pos y_pos
            .draw_end
            ADD color color 1
            AND color color 0xF
            ADD x_pos x_pos 1
            ADD $0 x_pos 256
            BLT .line_loop
        ADD color color 1
        AND color color 0xF
        ADD y_pos y_pos 1
        ADD $0 y_pos 256
        BLT .line
    ADD color color 1
    AND color color 0xF
    BRN .frame