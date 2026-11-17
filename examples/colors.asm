@define x_pos $6
@define y_pos $7
@define color $8

.frame
    LDI y_pos 0
    .line
        LDI x_pos 0
        .line_loop
            GFXSP color x_pos y_pos
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
