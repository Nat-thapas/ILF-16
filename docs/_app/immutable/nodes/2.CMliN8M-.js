import{A as e,B as t,E as n,F as r,G as i,H as a,I as o,J as s,K as c,L as l,O as u,Q as d,S as f,T as p,U as m,V as h,W as g,X as _,Y as v,Z as y,_ as b,a as x,c as S,d as C,f as w,g as T,h as E,i as ee,j as D,k as O,l as te,n as ne,o as re,q as k,r as ie,s as ae,t as oe,u as se,v as ce,w as A,z as le}from"../chunks/CD24Q8V1.js";var ue=`@define x_pos $6\r
@define y_pos $7\r
@define color $8\r
@define square_color $9\r
\r
LDI square_color 15\r
\r
.frame\r
    LDI y_pos 0\r
    .line\r
        LDI x_pos 0\r
        .line_loop\r
            AND $1 x_pos 0x60\r
            AND $2 y_pos 0x60\r
            AND $1 $1 $2\r
            ADD $0 $1 0x60\r
            BEQ .draw_square\r
            GFXSP color x_pos y_pos\r
            BRN .draw_end\r
            .draw_square\r
            GFXSP square_color x_pos y_pos\r
            .draw_end\r
            ADD color color 1\r
            AND color color 0xF\r
            ADD x_pos x_pos 1\r
            ADD $0 x_pos 256\r
            BLT .line_loop\r
        ADD color color 1\r
        AND color color 0xF\r
        ADD y_pos y_pos 1\r
        ADD $0 y_pos 256\r
        BLT .line\r
    ADD color color 1\r
    AND color color 0xF\r
    BRN .frame`,de=`@define msb $5\r
@define line_address $6\r
@define line_data $7\r
@define temp_line_data $8\r
@define block_x $9\r
@define block_y $10\r
@define pixel_x $11\r
@define pixel_y $12\r
@define color $13\r
\r
LDI msb 0x8000\r
LDI line_address 0\r
\r
.frame\r
    LDI block_y 0\r
    .block_line_loop\r
        LOD line_data line_address\r
        LDI pixel_y 0\r
        .draw_line_group\r
            MOV temp_line_data line_data\r
            CAL .draw_line\r
            ADD pixel_y pixel_y 1\r
            ADD $0 pixel_y 16\r
            BLT .draw_line_group\r
        ADD block_y block_y 16\r
        ADD line_address line_address 1\r
        RSHIFT $4 line_address 4\r
        OUT $4 %0\r
        ADD $0 block_y 256\r
        BLT .block_line_loop\r
    CAL .stall\r
    BRN .frame\r
\r
.draw_line\r
    LDI block_x 0\r
    .draw_line_outer_loop\r
        AND $0 temp_line_data msb\r
        SNZ color 7 0\r
        LSHIFT temp_line_data temp_line_data 1\r
        LDI pixel_x 0\r
        .draw_line_inner_loop\r
            ADD $1 pixel_x block_x\r
            ADD $2 pixel_y block_y\r
            GFXSP color $1 $2\r
            ADD pixel_x pixel_x 1\r
            ADD $0 pixel_x 16\r
            BLT .draw_line_inner_loop\r
        ADD block_x block_x 16\r
        ADD $0 block_x 256\r
        BLT .draw_line_outer_loop\r
RET\r
\r
.stall\r
    LDI $1 320\r
    .stall_loop\r
        STL 0xFFFF\r
        SUB $1 $1 1\r
        BNZ .stall_loop\r
RET\r
\r
\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x1f 0x3f 0x1f 0x1f 0x3f 0x1f 0x1f 0x1f 0x1f 0x1f 0x1f 0x1f 0xf 0xf 0x7 0x7\r
DW 0xf003 0xf007 0xf007 0xf007 0xf007 0xf007 0xf007 0xf007 0xf003 0xf003 0xe003 0xe001 0xc001 0xc000 0xc000 0x8000\r
DW 0xfc07 0xfc0f 0xfc0f 0xfe07 0xfe0f 0xfe07 0xfc0f 0xfc07 0xf807 0xf807 0xf807 0xf803 0xf807 0xf013 0xf023 0xf013\r
DW 0xf01f 0xf83f 0xf83f 0xf87f 0xf83f 0xf87f 0xf83f 0xf07f 0xf83f 0xf01f 0xf03f 0xe01f 0xe01f 0xe01f 0xc00f 0xc01f\r
DW 0xf83f 0xf83f 0xfc3f 0xfc7f 0xfc7f 0xf87f 0xfc3f 0xf83f 0xf81f 0xf83f 0xf01f 0xf81f 0xf81f 0xf20f 0xf81f 0xf00f\r
DW 0xfc1f 0xfc1f 0xfe3f 0xfe1f 0xfe3f 0xfe3f 0xfe1f 0xfe1f 0xfe1f 0xfc1f 0xfc0f 0xfc1f 0xfc0f 0xf80f 0xfc0f 0xfe0f\r
DW 0xffff 0xfc3f 0xfc3f 0xfc3f 0xfe7f 0xfe7f 0xfc3f 0xfc3f 0xfc3f 0xf83f 0xf81f 0xf83f 0xf81f 0xf85f 0xf81f 0xf83f\r
DW 0xffff 0xf87f 0xf87f 0xfc7f 0xfcff 0xfcff 0xfc7f 0xf87f 0xf87f 0xf87f 0xf83f 0xf03f 0xf83f 0xf03f 0xf87f 0xf03f\r
DW 0xffff 0xfd3f 0xfc3f 0xfe3f 0xfe3f 0xfe3f 0xfe3f 0xfc3f 0xfc3f 0xfc1f 0xf81f 0xfc1f 0xf81f 0xfc0f 0xfc1f 0xfc1f\r
DW 0xffff 0xfc1f 0xfe3f 0xfe3f 0xfe3f 0xfe3f 0xfe3f 0xfc3f 0xfc3f 0xfc3f 0xfc5f 0xf81f 0xf81f 0xfc1f 0xfc2f 0xfc1f\r
DW 0xfdff 0xfc1f 0xfc1f 0xfc3f 0xfe3f 0xfe3f 0xfc7f 0xfc3f 0xfc3f 0xfc1f 0xf81f 0xf81f 0xf81f 0xf80f 0xf81f 0xf81f\r
DW 0xff83 0xff03 0xff03 0xff03 0xff03 0xff03 0xff03 0xff83 0xff07 0xff87 0xff07 0xff03 0xff03 0xff01 0xff01 0xfe08\r
DW 0xffff 0xffdf 0xff87 0xff87 0xff07 0xff03 0xff83 0xff83 0xff83 0xffc7 0xfb87 0xf387 0xf807 0xf807 0xfc07 0xf803\r
DW 0xffff 0xffbf 0xff8f 0xff07 0xff07 0xff07 0xff07 0xff87 0xff87 0xff87 0xfb8f 0xf387 0xf80f 0xfc07 0xf807 0xfc07\r
DW 0xffbf 0xff8f 0xff87 0xff07 0xff03 0xff07 0xff03 0xff83 0xff83 0xfd83 0xf9c7 0xf987 0xfc07 0xfc07 0xfc07 0xfc03\r
DW 0xffcf 0xff83 0xff03 0xff03 0xff03 0xff01 0xff03 0xff81 0xfd81 0xfc81 0xf8c3 0xfc43 0xfe07 0xfc03 0xfc03 0xfc03\r
DW 0xffc7 0xff83 0xff03 0xff03 0xff01 0xff03 0xff01 0xff81 0xfc01 0xfc81 0xfc41 0xfe03 0xfe07 0xfe03 0xfc03 0xfe03\r
DW 0xffcf 0xff83 0xff03 0xff03 0xfe03 0xff01 0xff01 0xff01 0xfc81 0xfc81 0xfc83 0xfc43 0xfe03 0xfc07 0xfc03 0xfc81\r
DW 0xff0f 0xff07 0xff07 0xfe07 0xfe03 0xfe03 0xfe03 0xff03 0xff03 0xf983 0xf983 0xf887 0xfc07 0xfc07 0xfc07 0xfc03\r
DW 0xfd9f 0xf81f 0xf80f 0xfc07 0xfc07 0xfc07 0xfc07 0xfc03 0xff07 0xfe03 0xff47 0xff43 0xff83 0xff83 0xff81 0xff81\r
DW 0xffff 0xfff8 0xfff8 0xfff0 0xfff0 0xfff0 0xfff0 0xfff8 0xfff8 0xfff8 0xfff8 0xfff8 0xfff8 0xfff8 0xfff0 0xfff8\r
DW 0xfcff 0xfdff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0xfe3f 0xfe1f 0xfe3f 0xfe3f 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfe3f 0xfe1f 0xfe1f 0xfe1f 0xfe3f 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xfe3f 0xfc1f 0xfc3f 0xfc1f 0xfe3f 0xff7f 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xff3f 0xfe1f 0xfe0f 0xfe0f 0xfe1f 0xfe1f 0xffbf 0xffff 0xffff 0xffff 0xffff\r
DW 0x0 0x0 0xffc0 0xff80 0xffe0 0xfffe 0xfe3c 0xfe1e 0xfc1e 0xfc1f 0xfe1f 0xff3f 0xffff 0xffff 0xffff 0xffff      \r
DW 0x3ff 0x1ff 0x3ff 0x9f 0x87 0x1c6 0x1c2 0x1c0 0x3e0 0x3e0 0x1e0 0x1c0 0x0 0x0 0x0 0x0\r
DW 0xc000 0xc000 0xe000 0xe000 0x7000 0xf000 0xf000 0xfc00 0xf77c 0xfffe 0xffff 0xffff 0xffff 0xffff 0xf8ff 0x781e\r
DW 0x3ff 0x1ff 0xff 0x7f 0x3f 0x11f 0x33f 0x3bf 0x1be 0xff 0x7f 0x3f 0x6f 0x47 0x4f 0xcf\r
DW 0x7ff 0x7ff 0x3ff 0x1ff 0xff 0x7f 0x7f 0x1ff 0x1bf 0x39f 0x1df 0x5f 0x7f 0x7f 0x7f 0x7f\r
DW 0x38 0x7c 0x8ff 0x1ff9 0xff8 0x1ffe 0x7ff 0x1ff 0xff 0x1ff 0x1bf 0xff 0x7e 0x7d 0x7e 0x3f\r
DW 0x0 0x0 0x0 0x1e0 0x3c0 0x1e0 0xf0 0x170 0xe8 0xf0 0x7c 0x40ff 0xffff 0x10ff 0x4bb 0x0\r
DW 0x0 0x0 0x0 0x80 0x180 0xc0 0xc0 0xc0 0xdfc 0x7c 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x180 0xc0 0x80 0x2f0 0x10 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x80 0x180 0x80 0xe0 0x2f0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x100 0x180 0x80 0x1d0 0x4f0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x100 0x180 0x80 0x5f0 0xb0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x180 0x80 0xc0 0x5f0 0x20 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x80 0xc0 0x80 0xe0 0x2f8 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x30 0x38 0x18 0x19 0x5f 0xbf 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x20 0x20 0x30 0x30 0x38 0x38 0x4000 0x6000 0xec00 0xfc00 0xfc00 0xfc00\r
DW 0x0 0x0 0x0 0x0 0x20 0x20 0x30 0x38 0x78 0x0 0x4000 0x6000 0xf600 0xfc00 0xfe00 0xfc00\r
DW 0x0 0x0 0x0 0x0 0x60 0x20 0x30 0x38 0x70 0x0 0x4000 0x6200 0xfa00 0xfe00 0xfe00 0xfe00\r
DW 0x0 0x0 0x0 0x0 0x20 0x60 0x20 0x30 0x70 0x30 0x4000 0x7000 0xf600 0xfe00 0xfe00 0xfe00\r
DW 0x0 0x0 0x0 0x0 0x40 0x60 0x20 0x30 0x70 0x20 0x6000 0x6100 0xfd00 0xfe00 0xff00 0xfe00\r
DW 0x0 0x0 0x0 0x0 0x60 0x40 0x30 0x70 0x70 0x2000 0x6000 0x6900 0xfa00 0xff00 0xff00 0xff00\r
DW 0x0 0x10 0x10 0x3c 0x18 0x38 0x3d 0x1f 0x1f 0x3f 0x3f 0x17 0x4 0x0 0x0 0x0\r
DW 0xf 0x4 0x0 0x0 0x3 0x103 0x3cf 0x67f 0x23f 0x100 0x100 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0xc0 0x1f3 0x33f 0x39f 0x8c 0x80 0x80 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x600 0x200 0x300 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x380 0x300 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0xff9f 0xffbf 0xffbf 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffcf 0xffc7 0xffc7 0xffcf 0xffcf 0xff9f 0xff8f 0xff9f\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xfcff 0xf8ff 0xf3ff 0xf3ff 0xf7ff 0xe7ff 0xf7ff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xcfff 0xcfff 0xefff 0xc7ff 0xcfff 0xcfff 0xcfff 0xcfff 0xcfff 0xc7ff 0xd7ff 0xefff\r
DW 0xffff 0xffff 0xe7ff 0xe3ff 0xe7ff 0xe3ff 0xe3ff 0xe3ff 0xc7ff 0xc3ff 0xe7ff 0xe3ff 0xe3ff 0xe3ff 0xe3ff 0xc3ff\r
DW 0xffff 0xfdff 0xf9ff 0xf8ff 0xf9ff 0xf8ff 0xf8ff 0xf8ff 0xf8ff 0xf0ff 0xf8ff 0xf8ff 0xf8ff 0xf8ff 0xf8ff 0xf0ff\r
DW 0xffff 0xffff 0xfe3f 0xfe3f 0xfe7f 0xfe3f 0xfe1f 0xfe3f 0xfe3f 0xfe7f 0xfe7f 0xfe3f 0xfe3f 0xfe3f 0xfc3f 0xfe3f\r
DW 0xffff 0xffff 0xfe3f 0xff1f 0xff3f 0xfe1f 0xfc1f 0xff1f 0xfe3f 0xff3f 0xfe1f 0xff3f 0xff1f 0xff3f 0xfe1f 0xff1f\r
DW 0xffff 0xffdf 0xff1f 0xff1f 0xff1f 0xff1f 0xf00f 0xf00f 0xff0f 0xff1f 0xff1f 0xff9f 0xff0f 0xff1f 0xff0f 0xff0f\r
DW 0xffff 0xffbf 0xff1f 0xff1f 0xff0f 0xff0f 0xff8f 0xff0f 0xfe0f 0xfc0f 0xfe07 0xff0f 0xff07 0xff07 0xff07 0xff1f\r
DW 0xffff 0xffff 0xff1f 0xff0f 0xff0f 0xff0f 0xff8f 0xff8f 0xff8f 0xff07 0xff0f 0xff07 0xfe07 0xfe07 0xfe0f 0xfe07\r
DW 0xffff 0xffbf 0xff8f 0xff0f 0xff0f 0xff8f 0xff8f 0xff0f 0xf80f 0xf00f 0xfb0f 0xfb0f 0xff0f 0xff0f 0xff8f 0xff0f\r
DW 0xffff 0xffcf 0xfb87 0xfd87 0xfcc3 0xfc07 0xfc07 0xff87 0xff87 0xff07 0xff07 0xff03 0xff03 0xff03 0xff03 0xff03\r
DW 0xffe0 0xffe0 0xffc0 0xff80 0xff00 0xff80 0xffc0 0xffc0 0xfdc0 0xfdc0 0xf8d0 0xfd80 0xfcc0 0xfc00 0xfe00 0xfe00\r
DW 0xfff3 0xffc1 0xffc0 0xff80 0xff00 0xff00 0xff80 0xff80 0xf380 0xfba0 0xf3a0 0xf980 0xf900 0xfc00 0xfe00 0xfc00\r
DW 0xfff8 0xfff8 0xfff0 0xffe0 0xffc0 0xfde0 0xfdf0 0xfdf8 0xf9f8 0xf8f8 0xf8f9 0xf8fc 0xfcf8 0xfc78 0xfe00 0xfe00\r
DW 0xffff 0xffff 0xffef 0xffcf 0xffdf 0xffdf 0xffdf 0xfe1f 0xfc0f 0xfc1f 0xfc0f 0xfe1f 0xfc1f 0xfe1f 0xfe1f 0xfe0f\r
DW 0xffff 0xffff 0xffff 0xffff 0xfbff 0xfdff 0xfebf 0xfc3f 0xfc1f 0xfc1f 0xfc1f 0xfc1f 0xfe0f 0xff03 0xff01 0xff80\r
DW 0xff83 0xff81 0xff01 0xff87 0xff03 0xff07 0xff87 0xffcf 0xfb87 0xf003 0xf003 0xe400 0xfe02 0xff07 0xff87 0xff07\r
DW 0xffff 0xffff 0xfe3f 0xfc1f 0xfc3f 0xfc3f 0xfc3f 0xfe7f 0xbc7f 0x8833 0x1 0x7c04 0xfc3e 0xfc7f 0xfc7f 0xfc7f   \r
DW 0xffff 0xffff 0xfe7f 0xfc1f 0xfc3f 0xf83f 0xfc3f 0xfc7f 0xbe7f 0x1833 0x3 0xec01 0xfc3c 0xfc7f 0xfc7f 0xfc7f   \r
DW 0xffff 0xffff 0xff7f 0xfc1f 0xfc3f 0xfc3f 0xfc3f 0xfe7f 0xee7f 0xcc39 0x8000 0x3022 0xfc3f 0xfe3f 0xfe3f 0xfc3f\r
DW 0xffff 0xffff 0xfebf 0xfe0f 0xfc1f 0xfc3f 0xfe3f 0xfe3f 0xee7e 0xc418 0x8000 0xf832 0xfc1f 0xfc3f 0xfe3f 0xfc3f\r
DW 0xfe07 0xfe03 0xfe07 0xf807 0xfc1f 0xfe0f 0xfe1f 0xfe3f 0xfc3f 0xf41f 0xe01e 0xe000 0xf830 0xfc39 0xfc7f 0xfc3f\r
DW 0xfff0 0xffe1 0xffc0 0xffc0 0xff01 0xff81 0xffc0 0xffe1 0xfff2 0xf1e6 0xf8c2 0xfc40 0xfe01 0xff04 0xff06 0xffc7\r
DW 0xfffa 0xfff0 0xffe0 0xffc0 0xffc0 0xffc0 0xffe0 0xf7e0 0xe1f0 0xf1f8 0xf8e3 0xfc01 0xfe00 0xff00 0xffe0 0xffc3\r
DW 0xfcff 0xf03f 0xf00f 0xf007 0xfc03 0xfc00 0xfdc0 0xffe0 0xfff8 0xffff 0xffff 0xfaff 0xf0ff 0xf8ff 0xf9ff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xfeff 0xf81f 0xf83f 0xfc3f 0xfc7f 0xfe7f 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xfc7f 0xf83f 0xfc1f 0xfc3f 0xfc7f 0xfeff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x400 0x6c0 0x7c0 0x7f0 0x3f0 0x3e8 0x380\r
DW 0x0 0x0 0x0 0x0 0x1800 0x1800 0x0 0x0 0x0 0x40 0x1020 0x1888 0xed8 0x6d8 0x37c 0x740\r
DW 0x0 0x0 0x0 0x1800 0x800 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x4 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x100 0x80 0x80 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x40 0x80 0x180 0x180 0x180 0x200 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x200 0x0 0x300 0x380 0x180 0x1e0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x20 0x20 0xc0 0x380 0x180 0x380 0x180 0x100 0x200 0x200 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x100 0x380 0x380 0x180 0x100 0x380 0x180 0x1c0 0x180 0x3c0 0x380 0x1c0 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x180 0x380 0x180 0x300 0x180 0x3c0 0x1c0 0x1c0 0x3c0 0x380 0x1c0 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x1c0 0x180 0x1c0 0x80 0x380 0x380 0x780 0x180 0x3c0 0x380 0x380 0x3c0\r
DW 0x0 0x0 0x0 0x80 0x9c0 0xcc0 0x3c0 0x380 0x380 0x380 0x100 0x380 0x1c0 0x380 0x3c0 0x180\r
DW 0x0 0x0 0x0 0x180 0x5c0 0x5c0 0x580 0x380 0x380 0x380 0x300 0x380 0x1c0 0x380 0x3c0 0x1c0\r
DW 0x0 0x0 0x380 0x3c0 0x3c0 0x7d0 0x1f0 0x1d8 0x1d8 0x3f0 0x1f0 0x1e0 0x1f0 0x1f0 0x3f0 0x3e0\r
DW 0x0 0x40 0xf2 0xf8 0xf2 0xfa 0x7b 0x32 0x7e 0x7e 0x7c 0x3c 0x3c 0xbc 0xfc 0xf8\r
DW 0x0 0x0 0x0 0x0 0xe 0x1f 0x1f 0xf 0xf 0xf 0x3 0x3 0x7 0x3 0x1 0x1\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x140 0x40 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x5f 0xfff 0x30 0x31 0x7b 0x79 0x7b 0x71 0x39\r
DW 0xe 0x3f 0x3f 0x3f 0x3f 0x7f 0x86e 0x142c 0xf60f 0x5b1f 0x4dff 0x535f 0x41df 0x15f 0x5f 0x3f\r
DW 0x0 0x50 0xf0 0x1f8 0x1f8 0xf8 0x1f0 0x6130 0x9870 0x68f8 0x56fe 0x15fa 0x67b 0x1f8 0xfa 0xf8\r
DW 0x0 0x70 0xf0 0xf0 0x1f8 0x1f8 0x11f0 0x6820 0xa870 0xacfa 0xabfd 0x857a 0x5fa 0xf8 0xf8 0xf8\r
DW 0x0 0xf0 0xf0 0xf0 0x1f0 0xf8 0x1060 0x6860 0xac70 0xb4fb 0x4bfb 0x6fa 0x1f8 0x1f0 0xf8 0xf0\r
DW 0x0 0x380 0x7c0 0x7c0 0x780 0x380 0x180 0x1e0 0x3e0 0x380 0x780 0x780 0xf80 0x1f80 0x3f80 0x780\r
DW 0x0 0x0 0x3c0 0x3e0 0x3e0 0x1a0 0x1a0 0x2184 0xd7da 0x5bf3 0x3c1 0x3c0 0x7c0 0x3c0 0x7c0 0x7e0\r
DW 0x0 0x100 0x3c0 0x3e0 0x3c0 0x3e0 0x120 0x2184 0x57fb 0xd7c5 0x3d1 0x7c0 0x9c0 0x1bc0 0x3e0 0x3c0\r
DW 0x0 0x100 0x3c0 0x1e0 0x3e0 0x3e0 0x1a0 0x4180 0xb7ce 0xd7f5 0xbc9 0x3c0 0xdb0 0x13d0 0x3c0 0x3c0\r
DW 0x0 0x180 0x3e0 0x3e0 0x3e0 0x1e0 0x1a0 0x4182 0xb7cd 0x5bf5 0x8bd2 0x7e1 0x5a0 0x1bd8 0x23c4 0x3c0\r
DW 0x0 0x3c0 0x3e0 0x3e0 0x3e0 0x3a0 0x1a0 0x4182 0xa7d5 0xb7eb 0x4bd4 0x7e0 0x7a0 0x19d8 0x23c8 0x3c0\r
DW 0x100 0x3c0 0x3e0 0x3e0 0x3e0 0x3e0 0x120 0x4182 0xa7cd 0xb7f5 0x57d2 0x7c8 0x5e0 0x1bb0 0x33cc 0x3c0\r
DW 0xfeff 0xfe3f 0xfc1f 0xfc0f 0xfc1f 0xfc1b 0x1e48 0x524a 0xc817 0xf81f 0xf83f 0xf81f 0xf81f 0xd24b 0x8421 0xfc3f\r
DW 0xfc1f 0xfc0f 0xf80f 0xfc0f 0xfc2f 0x5e28 0x5646 0x4812 0xd017 0xf81f 0xf81f 0xf81f 0xf01f 0xf42d 0x420 0x1c30 \r
DW 0xf807 0xf813 0xfc07 0x7e32 0x5e62 0x2022 0x2004 0xa00a 0xffff 0xffff 0xf00f 0xf00f 0xe00f 0xe407 0xc823 0x810 \r
DW 0xfc3c 0x5010 0x8004 0x8001 0x8001 0x8001 0x8001 0x8003 0xffff 0xfdfb 0x8003 0x8001 0x8001 0x8001 0x1000 0x2008\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x1557 0xffff 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x2 0x0 0x1 0x1 0x0 0x4 0x1c 0x5ffc 0x1e 0xc 0xe 0xc 0xe 0x46 0x2e 0x1f\r
DW 0x10 0x38 0x18 0x6 0x0 0x0 0x42e0 0x4860 0x4060 0x4060 0x4040 0x4070 0xe0 0x3e8 0xf0 0x1f0\r
DW 0x40 0x20 0x10 0x0 0x0 0x0 0x2ac0 0x20e0 0x2040 0x2040 0x6060 0xc0 0x1e0 0x1e0 0x1e0 0x3f0\r
DW 0x7c 0x38 0x0 0xb00 0x600 0x200 0x2300 0x2600 0x2680 0x2700 0x2b00 0x4380 0x780 0x200 0x100 0x0\r
DW 0x8 0x38 0x8 0x100 0x180 0x180 0x2180 0x2380 0x2340 0x2720 0x2380 0x3c8 0x3c0 0x382 0x0 0x280\r
DW 0x74 0x5a 0x12b 0x314 0x360 0x180 0x2300 0x2300 0x2300 0x2700 0x6b80 0x380 0x380 0x280 0x0 0x280\r
DW 0xe 0x6 0x82 0x188 0x1d8 0x1d0 0x1a0 0x4380 0x6580 0x2300 0x4780 0x5b80 0x63c0 0x780 0x3c0 0x280\r
DW 0x0 0xc0 0x1c0 0x180 0x180 0x180 0x3c3 0x43f4 0x6398 0x53a0 0x47c0 0x4380 0x43c0 0xfd0 0x33c8 0x47e0\r
DW 0x1ff 0x1ff 0x1ff 0x3ff 0x3ff 0x3ff 0x1ff 0x3ff 0x1ff 0x3ff 0x5b0 0x3a0 0x3c0 0x3e0 0x380 0x3c0\r
DW 0x0 0x0 0x380 0x380 0x3c0 0xf90 0x1fc8 0x1fc2 0x1fd4 0x3fc8 0x3fe4 0x3fe2 0x5f42 0x4043 0x4040 0x4042\r
DW 0xe000 0xe000 0xf000 0xe000 0xf000 0xf800 0xf800 0xf800 0xfe00 0xfc00 0xf800 0xf800 0xf800 0xf800 0xf800 0xf800\r
DW 0x1000 0x7800 0x7c00 0x7c00 0xfc00 0xfc00 0xfc00 0x7c00 0xfc00 0x7c00 0xfc00 0xfc00 0xfe00 0xfe00 0xfe00 0xff00\r
DW 0x0 0x800 0x3e00 0x3e00 0x3e00 0x7e00 0x3e00 0x3f00 0x3f00 0x3f00 0x3e00 0x3f00 0x3f00 0x3f00 0x3f00 0x3f80    \r
DW 0x0 0x600 0xf00 0x1f80 0x1f00 0x1f80 0x1f80 0x1f80 0x1f80 0x1f80 0x1f00 0xf80 0x1f80 0x1f80 0x3f80 0x3f80      \r
DW 0x0 0x1400 0x3c00 0x3e00 0x7e00 0x7e00 0x7e00 0x3e00 0x7e00 0x7e00 0x3e00 0x7ec0 0x7ec0 0x7ec0 0xfe80 0x7f80   \r
DW 0x800 0x3800 0x3c00 0x7e00 0x7c00 0xfe00 0x7c00 0x7e00 0x7e00 0x5c00 0x7e00 0x7e00 0x7f60 0x7ff0 0xfffc 0x7ffc\r
DW 0x0 0xe00 0x1f00 0x1f00 0x3f00 0x3f00 0x1f00 0x1f00 0x3f80 0x1f00 0x1f00 0x1f00 0x1fe0 0x3ff0 0x1ff8 0x3ffc    \r
DW 0x0 0x1c00 0x3e00 0x3e00 0x3e00 0x7e00 0x7e00 0x3e00 0x3e00 0x7c00 0x3e00 0x3f00 0x3f00 0x7fe0 0x3ff8 0x7ffc   \r
DW 0x0 0x2800 0x7800 0xf800 0xfc00 0xfc00 0xfc00 0xf800 0xf800 0xf000 0xfc00 0xfc00 0xfc00 0xfe80 0xfff0 0xfff8   \r
DW 0x0 0x0 0xc00 0x3e00 0x3e00 0x7f00 0x3e00 0x3e00 0x3e00 0x3c00 0x3c00 0x3fc0 0x3ff0 0x3ff8 0x3ffc 0x3ffc       \r
DW 0x0 0x400 0xe00 0x1e00 0x3f80 0x3f00 0x1f00 0x1f00 0x1f00 0x1e00 0x1e00 0x1ff0 0x1ff8 0x3ffc 0x1ffc 0x3ffc     \r
DW 0x0 0x800 0x3800 0x7c00 0xfe00 0x7e00 0x7c00 0x7c00 0x7c00 0x7800 0x7c00 0x7fe0 0x7ff0 0xfff8 0xfff8 0xfffc    \r
DW 0x4000 0xe000 0xe000 0xf000 0xf800 0xf800 0xf880 0xf000 0xf800 0xf000 0xe000 0xf000 0xf800 0xf800 0xffe0 0xfff0\r
DW 0x0 0x0 0x0 0x0 0xa000 0xe000 0xe000 0xe000 0xe000 0xc000 0xc000 0xc000 0xc000 0xc000 0xc000 0x8000\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x200 0x380 0x3c0 0x100 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x300 0x100 0x380 0x180 0x180 0x1c0 0xc0 0xc0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x6a0 0xff0 0xff0 0x740 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x100 0x1c0 0x3c0 0x3c0 0x380 0x380 0x300 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x40 0x40 0x40 0x40 0xff0 0x7f0 0x3e0 0x140 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0xc0 0x40 0x40 0x40 0xe4 0x7078 0x7ff8 0x1ff0 0xff0 0x0 0x0 0x0 0x0\r
DW 0x440 0x4c0 0x4e0 0x1c0 0x3e0 0x1c7 0x7f 0x17ff 0xffff 0xffff 0xfffe 0xfffc 0x1ffc 0x7f0 0xa0 0x0\r
DW 0x10c0 0x11c0 0x13c0 0x7c0 0x17c0 0x7c3 0x9f 0x1ff 0x5fff 0xffff 0xffff 0xfffe 0xfffc 0xfff8 0xff80 0xfe00     \r
DW 0x61c0 0x419a 0x41f1 0x61c0 0x4180 0x61c0 0x21c0 0x27c0 0x27c0 0xfc0 0x27c1 0xf8f 0x7ff 0x2fff 0xffff 0xffff   \r
DW 0x0 0x0 0x41c0 0x63c0 0xcb80 0xc380 0xc0c0 0x81d8 0xc1db 0x81e0 0xc180 0x40c0 0x41c0 0x43e0 0x47c0 0x4fe0      \r
DW 0x0 0x0 0x0 0x41c0 0x61c0 0xcb80 0xc180 0xc1c0 0xc1d8 0x81cd 0xc1f0 0xc0c0 0x40c0 0x41e0 0x41e0 0x43e0\r
DW 0x0 0x0 0x180 0x4380 0x6380 0xcb80 0xc3c0 0xc1dc 0xc1c9 0x81f0 0xc0c0 0x40c0 0x41e0 0x61e0 0x23e0 0x47e0       \r
DW 0x0 0x0 0x1c0 0x4380 0x77c0 0x6380 0x41e0 0x60ee 0x40e8 0x41f0 0x60e0 0x4060 0x61e0 0x23f0 0x2fe0 0x2ff0       \r
DW 0x2 0xf 0x80f 0xe1f 0x1d7e 0xc1f 0x1c0f 0x180f 0x1807 0x180f 0x1c0b 0x807 0x1c07 0xc07 0xc07 0x41f\r
DW 0x7c0 0x7c0 0x7c0 0x780 0x7c0 0x780 0x780 0x780 0x780 0x780 0x780 0x780 0x780 0x780 0x780 0x3c0\r
DW 0xff 0xff 0xff 0x1ff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff\r
DW 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x37f 0x33f 0x33f\r
DW 0xff 0xff 0xff 0xff 0xff 0xff 0x17f 0x33f 0x33f 0x33f 0x33f 0x33f 0x13f 0x37f 0x13f 0x33f\r
DW 0xff 0xff 0xff 0xff 0x17f 0x33f 0x33f 0x17f 0x17f 0x33f 0x33f 0x13f 0x37f 0x13f 0x33f 0x33f\r
DW 0xff 0xff 0xff 0xff 0x17f 0x13f 0x37f 0x13f 0x17f 0x33f 0x33f 0x33f 0x13f 0x37f 0x13f 0x33f\r
DW 0xff 0xff 0xff 0xff 0xff 0x13f 0x13f 0x13f 0x13f 0x17f 0x33f 0x30f 0x31f 0x33f 0x13f 0x33f\r
DW 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x9f 0x11f 0x33f 0x13f 0x17f 0x13f 0x13f 0x13f 0x13f\r
DW 0xff 0xff 0x1ff 0x2ff 0x1ff 0x1ff 0x1ff 0x1ff 0x1ff 0x3ff 0x2ff 0x37f 0x37f 0x37f 0x37f 0x37f\r
DW 0x1ff 0x1ff 0x1ff 0x1ff 0x3ff 0x1ff 0x1ff 0x3ff 0x3ff 0x3ff 0x67f 0x6ff 0x67f 0x2ff 0x6ff 0x27f\r
DW 0x7ff 0x7ff 0x3ff 0x7ff 0x6ff 0xff 0x7f 0x4ff 0x45f 0x43f 0x47f 0x7f 0x47f 0xbf 0x5f 0x7f\r
DW 0x1ff 0x1ff 0xff 0x27f 0x27f 0x67f 0x7ebf 0x863f 0x73f 0x37f 0x7bf 0x6ff 0xeff 0xe7f 0x6ff 0x67f\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x4 0xb 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x18 0x1c 0x1e 0xf 0x3 0x3 0x0 0x0\r
DW 0x0 0x0 0x100 0x180 0x180 0x1c0 0x1c0 0x1c0 0xc0 0x1c0 0xc0 0x1c0 0xc0 0x1c0 0xc0 0x1c0\r
DW 0x0 0x100 0x300 0x380 0x180 0x180 0x1c0 0x1c0 0x1c0 0x180 0x1c0 0x180 0x180 0x180 0x180 0x3c0\r
DW 0x0 0x100 0x300 0x380 0x380 0x180 0x1c0 0x1c0 0x3c0 0x1c0 0x3c0 0x7c0 0x9c0 0x980 0x1c0 0x380\r
DW 0x0 0x100 0x180 0x380 0x380 0x180 0x1c0 0x1c0 0x3c0 0x3c0 0x1fc0 0x1c0 0x1c0 0x180 0x180 0x1c0\r
DW 0x0 0x100 0x180 0x380 0x380 0x1c0 0x180 0x1c0 0x3c0 0x1fc0 0x5c0 0x1c0 0x1c0 0x180 0x1c0 0x180\r
DW 0x0 0x100 0x180 0x380 0x380 0x1c0 0x180 0x1c0 0x13c0 0xfc0 0x1c0 0x1c0 0x1c0 0x1c0 0x180 0x3c0\r
DW 0x0 0x180 0x380 0x380 0x1c0 0x180 0x1c0 0x13c0 0x13c0 0x1fc0 0x3c0 0x1c0 0x3c0 0x1c0 0x3c0 0x3c0\r
DW 0x0 0x100 0x3c0 0x1c0 0x1c0 0x1380 0x1380 0x1bc0 0x13c0 0x1fc0 0x7e0 0x1b0 0x1d0 0x3c0 0x3c0 0x3c0\r
DW 0x0 0x100 0x1c0 0x1c0 0x3c0 0x1180 0x1380 0x1bc0 0x13c0 0x1bc0 0x7f8 0x180 0x1c0 0x3c0 0x3c0 0x3c0\r
DW 0x0 0x100 0x1c0 0x1c0 0x3c0 0x1180 0x1b80 0x13c0 0x13c0 0x1fc0 0x7f0 0x388 0x180 0x3c0 0x3c0 0x3c0\r
DW 0x0 0x240 0x3c0 0x1c0 0x11c0 0x1380 0x1b88 0x13c8 0x1bc8 0xfc8 0x7f8 0x380 0x180 0x3c0 0x3c0 0x3c0\r
DW 0x0 0x440 0x7e0 0x7f0 0x7e0 0x7a0 0x5e0 0x7e0 0x7e0 0x3c0 0x3c0 0x3c0 0x180 0x3c0 0x3c0 0x3c0\r
DW 0x3d38 0x3e38 0x3ef8 0x3ebe 0x3efc 0x7ffc 0x3ff8 0x3ff8 0x3ff8 0x1bd8 0xff0 0xff0 0xfe0 0xff0 0x7e0 0x3c0      \r
DW 0xf77e 0xff7f 0xbf7f 0xbf7f 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0x7f7f 0x7f7f 0x7fff 0x3ffe 0x1ffc 0x3c4 \r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xbbff 0xffff 0x3fff 0xbfff 0x7fff 0x7fff 0x7fff 0xfdff 0x7fff 0x7bff 0x11ff\r
DW 0x9ff 0x3ff 0xe9ff 0x63ff 0x63ff 0x77ff 0xf3ff 0xfbff 0xb7ff 0x5bff 0x3bff 0x3bff 0x7dff 0x79ff 0x39ff 0x10ff  \r
DW 0x3ff 0xbff 0x43ff 0x6bff 0x67ff 0x73ff 0x73ff 0xfbff 0xd3ff 0x7fff 0x3bff 0x3fff 0x7bff 0x7fff 0x7bff 0x15ff  \r
DW 0x3ff 0x7ff 0x63ff 0x63ff 0x65ff 0x72ff 0x71fe 0x787e 0xf17e 0x787f 0x382f 0x783f 0x387f 0x7cbf 0x785f 0x3178  \r
DW 0x0 0x0 0x6004 0x200c 0x300e 0x700e 0x781f 0x7019 0xd81c 0x781c 0x381e 0x381e 0x781e 0x781f 0x7c1c 0x1008      \r
DW 0x0 0x410 0xc30 0xc38 0x1c3c 0x7c17 0x6c33 0xec31 0x8c38 0xc10 0xc3c 0x1c3c 0x1c1f 0x3c3f 0x7c3f 0xfc1f        \r
DW 0x0 0x0 0x240 0x660 0xe70 0xef0 0xe70 0x1c38 0x1c38 0x1df8 0x1ff8 0x3ff8 0x1e7c 0x1d18 0x1c3e 0x3c3e\r
DW 0x0 0x200 0x6a0 0x660 0xe70 0xe70 0x1e78 0xc70 0x1e38 0x1df8 0x1ff8 0x1f78 0x1e7c 0x3c38 0x1c3c 0x1c3e\r
DW 0x400 0xc00 0x418 0x660 0xef0 0xe60 0x670 0xf70 0xff0 0xff0 0xff0 0xe70 0xe70 0xe78 0x1c3c 0x1e7c\r
DW 0xc00 0x400 0xe4c 0x620 0xe70 0xf70 0xe70 0xf70 0xff0 0xff0 0xff0 0xfe0 0xef0 0xee0 0x1e70 0x1c7c\r
DW 0xfe0 0x1fc0 0x1fe0 0x3fe0 0x3fe0 0x7fe4 0xfee0 0xfc4c 0xfe0e 0xff3e 0x7fff 0x3ffc 0x1ffc 0x1ff8 0xff0 0x7f0   \r
DW 0x1ff0 0xffe 0x1ffe 0x3ffe 0x3ffe 0x38fe 0x7a7e 0x767e 0x767e 0x767c 0x77fc 0x7ff8 0x73f0 0x7de0 0x3c00 0xf20  \r
DW 0xffe0 0xfff0 0xfff0 0xfff0 0xfff2 0xfff0 0xfff4 0xfff0 0xffe0 0xfff4 0xffc0 0xffe0 0x7f88 0x3ea0 0x200 0x1080 \r
DW 0xf800 0xfc00 0xf800 0xfa04 0xf806 0xf007 0xc003 0x107 0x1003 0x3 0x7 0x803 0x7 0x3 0x7 0x7\r
DW 0xf800 0xfc00 0xf800 0xfa20 0xf818 0xf018 0xc00c 0x11c 0x101c 0xc 0x1e 0x81c 0x1c 0x1c 0x1e 0x3e\r
DW 0xf800 0xfc00 0xf800 0xfa20 0xf830 0xf038 0xc018 0x38 0x1218 0x34 0x18 0x38 0x1038 0x38 0x3c 0x3c\r
DW 0xf800 0xfc00 0xf800 0xf960 0xf830 0xf030 0xc030 0x230 0x1030 0x30 0x70 0x30 0x70 0x870 0x78 0x78\r
DW 0xf800 0xfc00 0xf800 0xf960 0xf860 0xf020 0xc270 0x1f0 0x1030 0x30 0x70 0x38 0x70 0x470 0x78 0x78\r
DW 0xf800 0xfc00 0xf800 0xf940 0xf860 0xf060 0xc6e0 0xb0 0x70 0x1030 0x30 0x70 0x70 0x70 0x78 0x78\r
DW 0xf800 0xfc00 0xf800 0xf940 0xf860 0xf060 0xc6e0 0xf0 0x30 0x2070 0x30 0x70 0x70 0x70 0x78 0xf8\r
DW 0xf800 0xfc00 0xf800 0xf960 0xf860 0xf020 0xc5f0 0xe0 0x1030 0x30 0x70 0x30 0x870 0x70 0x78 0x78\r
DW 0xf800 0xfc00 0xf800 0xfa40 0xf860 0xf070 0xc030 0x7f0 0x1030 0x30 0x30 0x70 0x30 0x1070 0x78 0x78\r
DW 0xf800 0xfc00 0xf800 0xfa30 0xf810 0xf038 0xc010 0x38 0x1278 0x30 0x18 0x38 0x1038 0x38 0x78 0x78\r
DW 0xfc00 0xfc00 0xfc00 0xfc00 0xf847 0xf006 0xd20c 0x6 0xe 0x100e 0xe 0x7 0x107 0x40f 0xf 0xf\r
DW 0x7fe0 0x3fc0 0x7fe0 0x3fc0 0x3f80 0xf80 0x2a20 0x100 0x800 0x2000 0x0 0x0 0x80 0x200 0x0 0x0\r
DW 0x1ff 0x1ff 0xff 0x5ff 0x7e 0x80fe 0x8018 0x8420 0x8080 0x8004 0xc000 0x8000 0xc110 0xc000 0x8000 0xc000       \r
DW 0xf 0xf 0x7 0x17 0x7 0x303 0x311 0x180 0x302 0x180 0x300 0x180 0x380 0x180 0x380 0x380\r
DW 0x7 0xf 0x7 0xf 0x23 0x183 0x180 0x82 0x180 0x1c0 0x184 0xc0 0x180 0x1c0 0x180 0x1c0\r
DW 0x7 0xf 0x7 0xf 0x83 0x183 0x181 0x88 0x180 0x1c0 0x180 0x182 0x1c0 0x180 0x180 0x1c0\r
DW 0x1 0x2 0x1 0x8 0x180 0x1c2 0x180 0xc0 0x1c0 0x1c2 0x1c0 0xc0 0x1c0 0x1c0 0x1c0 0x1c0\r
DW 0x0 0x0 0x0 0x1c2 0x1c0 0x1e0 0xc0 0xe0 0x1c0 0x1e0 0x1c0 0x1e0 0x1c0 0x1e0 0x1e0 0x1c0\r
DW 0x0 0x0 0xc0 0x1e0 0x1e0 0x1e0 0xe0 0xe0 0xe0 0x1e0 0x1e0 0x1f0 0x1e0 0x1e0 0x1f0 0x1e0\r
DW 0x0 0x0 0x80 0x3c0 0x3c0 0x3c0 0x1e0 0x1c0 0x1e0 0x1c0 0x1e0 0x3c0 0x1e0 0x3e0 0x3f0 0x3f0\r
DW 0x0 0x4 0x1 0x310 0xf82 0xf80 0x1f80 0x1fc2 0x1fc0 0x1f80 0x3f80 0x1f80 0x1fe0 0x1fe0 0x1ff0 0xbff0\r
DW 0x5 0x22 0x9 0x24 0x1 0x12 0x0 0x9 0x20 0x0 0x0 0xf0 0xf0 0x1f8 0x1f8 0x3f0\r
DW 0x2f 0x155 0x17 0x155 0x15 0x54a 0x625 0x512 0x709 0xf20 0x605 0xe10 0xe00 0x1c04 0x3e00 0x7e00\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfeff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xef7b 0xcf39 0xdf79 0xcf7b\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xef7b 0xdf79 0xcf39 0xdf7b 0xe79 \r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xef7f 0xec7b 0xeef9 0xeef1 0xe7b 0x8ef3 0xce7b 0xeff1 0xeeff \r
DW 0xffff 0xffff 0xffff 0xffff 0xfffb 0xef7b 0xef63 0xee77 0x4f73 0x8777 0xc673 0xef73 0xefff 0xfe77 0xe773 0x2ff7\r
DW 0xffff 0xffff 0xffff 0xff7b 0xe73b 0xf798 0xe77b 0x17b9 0xc73b 0xe333 0xeffb 0xf77f 0xf7b3 0xa7fb 0x9ff9 0xcfff\r
DW 0xffff 0xffff 0xef7f 0xee79 0xee7b 0xef78 0xf7b 0x867b 0xe771 0xfffb 0xf73b 0xe77b 0xb7fb 0x8ff9 0xefff 0xefff \r
DW 0xffff 0xffff 0xdef7 0x9ef7 0xdcc7 0x9ee7 0x5ef7 0xc67 0x8ee7 0xdef7 0xdeff 0xcde7 0x5fd7 0x3ff7 0xbfff 0x9fff \r
DW 0xffff 0xffff 0x2cff 0xcff 0x1cff 0x147f 0x20ff 0x90ff 0xb0ff 0x167f 0x1cff 0xc7f 0x1c7f 0x587f 0x587f 0xdcff  \r
DW 0xf3ff 0xe3ff 0xa31f 0x803f 0xb07f 0x807f 0xc1ff 0xf1ff 0xf1ff 0xf1ff 0xf1ff 0xf1ff 0xf1ff 0xf1ff 0xe0ff 0xe0ff\r
DW 0xff7f 0xfe3f 0xfe3f 0xfe2f 0xea07 0xe603 0xf407 0xf01f 0xfa3f 0xfe7f 0xfe3f 0xfe7f 0xfe3f 0xfc3f 0xfe1f 0xfe0f\r
DW 0xfffe 0xfffc 0xf7f8 0xf3fc 0xf3fc 0xf390 0xe390 0xc1e0 0xe1fc 0xf1f8 0xfbfc 0xf1fc 0xf1f8 0xe1f8 0xe3f0 0xe1f0\r
DW 0xffff 0x7fff 0x7fff 0x3fef 0x3fe7 0x3fe7 0x3fc5 0x3fe0 0x3fc1 0x3fe5 0x3fe7 0x3fe7 0x3fe7 0x3fc7 0x1fe3 0x1fc3\r
DW 0xffff 0xfdff 0xf8fe 0xf8fc 0xf8fc 0xf8fe 0xfcfc 0xf8fc 0xf8fc 0xf8fc 0xf0fc 0xe1fe 0x1fc 0x1c 0x1c 0xe03c     \r
DW 0xffff 0xffff 0xff3f 0xfe7f 0xfe3f 0xfe3f 0xfe3f 0xfe3f 0xfe3f 0xfe7f 0xfc3f 0xf03f 0xaa3f 0x1e3f 0x3f 0x3e    \r
DW 0xffff 0xffe7 0xffe3 0xffc3 0xff83 0xffc3 0xffc1 0xffc3 0xf1e3 0xf9c1 0xfc80 0xfc01 0xfe40 0xffe0 0x7e0 0x1e0  \r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfebf 0xf81f 0xf00f 0xf00f 0xc007 0x8001 0xc003 0xe003\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfc3f 0xe007 0xe003 0xe007 0xe007 0xf00f 0xf00f 0xf00f\r
DW 0x0 0x0 0xc30 0x10 0xc20 0xc70 0xe70 0x8ff0 0xcff0 0xcff1 0xcff0 0xdff9 0xfff8 0xeff4 0xfff8 0xfffc\r
DW 0x0 0x18 0x38 0x1b8 0x1f8 0x3f8 0x7f8 0x7f8 0xff8 0x1ff0 0xff8 0xff0 0x7f8 0x3f0 0x3f0 0x3f0\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xff8 0x7e0 0x8000 0xf81f 0xf81f 0xf80f 0xf00f 0xf80f  \r
DW 0xffff 0xffff 0xf8ff 0xf01f 0xe00f 0xe00f 0xe007 0xe007 0xf003 0xf80f 0xfc3f 0xfc3f 0xfc3f 0xfff7 0xffe7 0xffe7\r
DW 0x0 0x0 0x3800 0x3800 0x1c08 0x1c3c 0x67e 0x640 0x660 0x240 0x3c0 0x7e0 0x7e0 0x7f0 0xff0 0xff0\r
DW 0x700 0x380 0x100 0x1c0 0x3e0 0x7f0 0x7f0 0x7f0 0x3f0 0x3f8 0x3f0 0x1f8 0x1f8 0x1f8 0x3f8 0x3f8\r
DW 0x0 0x0 0x100 0x80 0xc0 0x1c0 0xc0 0x3c0 0x3c0 0x3c0 0x1c0 0xe0 0x1e0 0x1e0 0x1e0 0x1f0\r
DW 0x0 0x0 0x0 0x0 0x30 0x10 0x98 0xf0 0x18 0x18 0x18 0x18 0x3c 0x18 0x10 0x28\r
DW 0x0 0x0 0x0 0x0 0x8 0xc 0x4 0x7c 0x6 0x6 0xe 0x6 0xe 0xc 0xa 0x4\r
DW 0x3000 0x3800 0x3800 0x3200 0x7100 0xfd00 0xfe80 0xfa88 0xf000 0x3000 0x3000 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x200 0x1c0 0x3c0 0x180 0x4baa 0x300 0x780 0xf80 0x780 0x780 0x100 0x40 0x40\r
DW 0x603 0x200 0x200 0x600 0x300 0x301 0x9fe5 0xffff 0x39d2 0x1c6 0x83ee 0x3fe 0x3b8 0x3f8 0x1f8 0x40fc\r
DW 0x787 0x703 0x600 0x700 0x780 0x781 0xdff7 0xffff 0xbff7 0xb991 0x8380 0x83c0 0x780 0xf80 0x8384 0x43ce        \r
DW 0xffff 0x3ff7 0xff2 0xff8 0xff0 0xff0 0x1ff0 0xfe0 0x3ff0 0x3ff5 0xffff 0xf7f5 0x4ff0 0xfc0 0x8fc0 0x3c0       \r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0x7fff 0x7fff 0x3fff 0x3fff 0x3efe 0x3e72 0x3e7f 0x7e7f 0xfeff 0xfe7f 0xfe7f\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xfeff 0xfc7f 0xfeff 0xfeff 0xfe7f 0xfcff 0xfc7f 0xfdff 0xffff 0xfffe 0xfffe\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0xfe7f 0xfe7f 0xff3f 0xff7f 0xfe7f 0xff7f 0xff3f 0xff3f 0xff9f 0xffdf\r
DW 0xffff 0xffff 0xffff 0xffff 0xffbf 0xfe9f 0xff1f 0xfe1f 0xff3f 0xff9f 0xfe1f 0xff1f 0xff3f 0xff1f 0xfe9f 0xfe1f\r
DW 0xffff 0xffff 0xffff 0xff6f 0xff8f 0xff87 0xff47 0xfe47 0xff47 0xff07 0xfe07 0xff0f 0xff87 0xfc07 0xfe0f 0xfc0f\r
DW 0xffff 0xffff 0xffff 0xff47 0xff87 0xff43 0xff83 0xfec3 0xfe43 0xff03 0xfe03 0xff07 0xfe03 0xfe03 0xfe03 0xfc03\r
DW 0xffff 0xffff 0xffff 0xffc7 0xff07 0xff83 0xff43 0xff43 0xf983 0xfcc7 0xfc83 0xfc07 0xfc03 0xfc03 0xfc03 0xfe03\r
DW 0xffff 0x7fff 0x3fff 0x7fc7 0x7f07 0xfe87 0xf783 0x7e83 0x27c7 0xa83 0x207 0x7 0x1003 0x7107 0xf883 0xf983     \r
DW 0xf3ff 0xf3ff 0xf1ff 0xf38f 0xf10f 0xf907 0xf907 0xf187 0xf187 0xe00f 0x8007 0x800f 0x8007 0xc007 0xf907 0xf907\r
DW 0xfe7f 0xff3f 0xfe7f 0xfe3f 0xff7f 0xfe3f 0xff7f 0xfe3f 0xfe3f 0xfc3f 0xf81f 0xf00f 0xf007 0xf00f 0xf81f 0xfe7f\r
DW 0xffdf 0xff9f 0xffcf 0xff87 0xffcf 0xff07 0xffc7 0xfea7 0xff27 0xfe47 0xff47 0xffc7 0xff83 0xff83 0xff83 0xff81\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfefe 0xff7e 0xfefc 0xfefc 0xfe7a 0xfffe 0xfffe 0xfffa 0xffe1 0xfffd\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xfcff 0xffff 0xfcff 0xfdff 0xfcff 0xfcff 0xfcff 0xfcff 0xfdff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xfbff 0xf3ff 0xfbff 0xf3ff 0xfbff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xf1ff 0xf3ff 0xe1ff 0xf1ff\r
DW 0xffff 0xffff 0xffff 0xf3ff 0xf3ff 0xfbff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xe3ff 0xf3ff 0xe1ff 0xe3f9\r
DW 0xffff 0xffff 0xffff 0xf7ff 0xf3ff 0xfbff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xe3ff 0xf3ff 0xe3e7 0xe1e7\r
DW 0xffff 0xffff 0xffff 0xf7ff 0xf3ff 0xfbff 0xf3ff 0xf3ff 0xf3ff 0xf3ff 0xf3ef 0xf3ef 0xe3c7 0xf3cf 0xe3e7 0xe1cf\r
DW 0xffff 0xffff 0xffff 0xf3ff 0xfbff 0xfbff 0xf3ff 0xf3cf 0xf303 0xf7cf 0xf3ef 0xf3ef 0xf3ef 0xe1c7 0xf3ef 0xe1cf\r
DW 0xffff 0xffff 0xffff 0xf7ff 0xf3ff 0xfbff 0xf3df 0xf3cf 0xf30b 0xf7c7 0xf3ef 0xf3ef 0xe3ef 0xf3c7 0xe1ef 0xf3c7\r
DW 0xffff 0xffff 0xffff 0xf7ff 0xf3ff 0xf3ff 0xf7ef 0xf3e7 0xf7ef 0xf3cf 0xe7cf 0xf3cf 0xe3ef 0xe3cf 0xe3cf 0xe3ef\r
DW 0xffff 0xffff 0xffff 0xf7ff 0xf3ff 0xf3ff 0xf7f7 0xf3e7 0xf3e7 0xf7ef 0xe3cf 0xe7cf 0xe3cf 0xe3ef 0xe3cf 0xe3ef\r
DW 0xffff 0xffff 0xfbff 0xf3ff 0xf1ff 0xf3ef 0xf3cf 0xf187 0xf1c7 0xf5cf 0xf1cf 0xe38f 0xe387 0xe38f 0xe3cf 0xe1cf\r
DW 0xffff 0xfbff 0xf0ff 0xf0ff 0xf00f 0xf09f 0xf00f 0xf80f 0xf007 0xf017 0xf01f 0xf03f 0xf01f 0xf01f 0xf11f 0xe01f\r
DW 0xf5ff 0xf1ff 0xf0ff 0xf09f 0xf00f 0xe08f 0xf01f 0xf80f 0xf007 0xf003 0xe01f 0xe01f 0xf01f 0xf21f 0xf01f 0xe00f\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0x4095 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xfe7f 0xf98f 0xe3c7 0xc183 0xf1cf 0xfd3f 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xf01f 0xc183 0x3c0 0x3c0 0xc387 0xf99f 0xffff 0xffff 0xffff 0xffff 0xffff  \r
DW 0xf000 0xc000 0x8000 0x0 0x1c0 0x3e0 0x7e0 0x7e0 0x7e0 0xbe0 0x1c3 0x3 0xf 0x1f 0x7f 0x1ff\r
DW 0x3fc 0x3f8 0x1f8 0x1f0 0xc0 0x0 0x0 0x80 0x380 0x3c0 0x7e0 0x300 0x300 0x300 0x200 0x700\r
DW 0x180 0x380 0x180 0x180 0x100 0x0 0x0 0x180 0x1e0 0x3c0 0x100 0x80 0x180 0x180 0x180 0x1c0\r
DW 0x180 0x380 0x180 0x100 0x0 0x0 0x180 0x3c0 0x380 0x100 0x180 0x100 0x180 0x300 0x180 0x0\r
DW 0x180 0x180 0x180 0x0 0x0 0x1c0 0x1c0 0x380 0x180 0x180 0x180 0x180 0x180 0x100 0x80 0x0\r
DW 0x100 0x80 0x0 0x0 0x80 0xc0 0x1e0 0x180 0x80 0x180 0x80 0x180 0x1c0 0x80 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x1c0 0x3c0 0x380 0x100 0x180 0x100 0x180 0x380 0x100 0x0 0x0\r
DW 0x0 0x20 0x70 0x3f0 0x7f0 0x1f8 0x1f8 0xfc 0x1c4 0x1c4 0xc0 0x1c0 0x1c0 0x1e0 0x1c0 0x1c0\r
DW 0x7ff 0x3ff 0xff 0x1ff 0x1ff 0x1ff 0xff 0xef 0xff7 0x7e1 0x7f2 0x3e0 0x3f0 0x3f0 0x3f0 0x1f0\r
DW 0x3ff 0x3ff 0xff 0x2ff 0xfff 0xfff 0x1def 0x8ef 0x4e3 0x5f1 0x5e0 0x7f0 0x3f0 0x3f0 0x1f0 0x1f8\r
DW 0x7 0x7 0x7 0x1007 0x1007 0x3803 0x3c03 0x3c0b 0x3fff 0x3faf 0x3e03 0x3c03 0x3807 0x180f 0x100b 0xb\r
DW 0x1e0 0x3e0 0x3f0 0x3f8 0x3fc 0x3fc 0x7ff 0x3ff 0x7ff 0x3fb 0x7f0 0x3e0 0x3c0 0x300 0x100 0x0\r
DW 0x0 0x0 0x0 0x0 0x100 0x100 0x100 0x100 0x180 0x380 0x100 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x100 0x100 0x300 0x300 0x780 0x300 0x300 0x380 0x380 0x780 0x780 0x780 0x200\r
DW 0x0 0x0 0x0 0x80 0xc0 0x180 0x180 0x1c0 0x1c0 0x180 0x1c0 0x1c0 0x3c0 0x3c0 0x1c0 0x140\r
DW 0x0 0x0 0x0 0x40 0xc0 0xc0 0xc0 0xe0 0x1c0 0xc0 0xe0 0xe0 0xe0 0x1e0 0x1e0 0x40\r
DW 0x0 0x0 0x100 0x300 0x300 0x7e0 0x700 0x180 0x180 0x3d0 0x3f8 0xff0 0x340 0x100 0x100 0x100\r
DW 0x0 0x0 0x0 0x300 0x300 0x300 0x300 0x380 0x780 0x700 0x780 0x700 0x700 0x780 0x700 0xf80\r
DW 0x0 0x0 0x2c0 0x3e0 0x3e0 0x3c0 0x1c0 0x3c0 0x1c0 0x3e0 0x3e0 0x3e0 0x3e0 0x7e0 0x3f0 0x3e0\r
DW 0x0 0x0 0x140 0x3f0 0x3f0 0x1e0 0x1e0 0x1c0 0x1e0 0x1e0 0x3e0 0x7e0 0x7e0 0x7e0 0x5f0 0x3e0\r
DW 0x0 0x0 0x140 0x7c0 0x7c0 0x780 0xc7c0 0xc9c0 0x5380 0x7fc0 0x7fc0 0x3be0 0x23c0 0x7e0 0x3e0 0x7e0\r
DW 0x0 0x0 0xe000 0xe800 0xe000 0xc000 0xe000 0xd000 0xe000 0xd000 0xe400 0xf000 0xe800 0xf000 0xe000 0xf800      \r
DW 0x0 0x0 0x380 0x3c0 0x3c0 0x7c0 0x3c0 0x3c0 0x3c0 0x7c0 0x7e0 0xfe0 0xfc0 0xbe0 0x7c0 0x7e0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x7c0 0xfe0 0x7c0 0x780 0x3c0 0x380 0x3c0 0x7c0 0xfc0 0xfe0 0x1bc0 0x17c0 0xfc0\r
DW 0x0 0xe000 0xf800 0xf800 0xf800 0xf800 0xf000 0xf000 0xf000 0xe000 0xe000 0xf000 0xf000 0xf000 0xf000 0xf000   \r
DW 0xe00f 0xf01f 0xf83f 0xfc3f 0xf83f 0xf01f 0xf00f 0xf007 0xf007 0xe00f 0xe003 0x8003 0xc007 0xc007 0xe007 0xf00f\r
DW 0xf03f 0xe03f 0xe03f 0xe03f 0xe01f 0xf01f 0xf01f 0xf01f 0xf81f 0xf01f 0xf81f 0xf81f 0xf81f 0xfc1f 0xfc1f 0xfc1f\r
DW 0x3ff 0x1ff 0xff 0x403f 0x703f 0x601f 0x701f 0x601f 0xf00f 0xe00f 0xf00f 0xf8cf 0xf06f 0xf8ff 0xf8ff 0xf8ff\r
DW 0xffff 0xefff 0xe3ff 0xc3ff 0xc3ff 0xe1ff 0xe0ff 0x7207 0x2007 0x3 0x4001 0x301 0x8603 0xc303 0xc301 0xc181    \r
DW 0xffff 0xff7f 0xfe3f 0xfe1f 0xfe1f 0xfe1f 0xff0f 0xf727 0xf301 0xf100 0xf000 0xf810 0xfc30 0xfc30 0xfe18 0xfe18\r
DW 0xffff 0xff3f 0xff1f 0xff0f 0xff0f 0xff0f 0xff8b 0xff91 0xf980 0xf880 0xf800 0xfc08 0xfe18 0xff1c 0xff0c 0xff0c\r
DW 0xffff 0xff3f 0xff1f 0xff0f 0xff0f 0xff0f 0xff8b 0xff91 0xfb80 0xf880 0xf880 0xfc08 0xfe18 0xfe0c 0xff0c 0xff0c\r
DW 0xffff 0xffcf 0xff87 0xff87 0xff87 0xff87 0xffc3 0xffc1 0xf580 0xfa80 0xfa00 0xf808 0xfc1c 0xfe0c 0xff1c 0xff0c\r
DW 0xffff 0xffcf 0xff8f 0xff87 0xff87 0xff87 0xff83 0xffc3 0xfc80 0xfe80 0xe600 0xf208 0xf818 0xfc08 0xff1c 0xff0c\r
DW 0xfff1 0xffc1 0xffc0 0xffc0 0xffc0 0xfde0 0xfcc0 0xfe60 0xfef0 0xfee0 0xfc80 0xfe00 0xfc00 0xfe80 0xffc0 0xffc3\r
DW 0xbfff 0xc7ff 0xf9ff 0xfeff 0xffff 0xffff 0xffff 0xffff 0xfdff 0xfdfe 0xfe3e 0xfc7f 0xfc3f 0xfe3f 0xff1f 0xff9f\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xff3f 0xfcff 0xf7ff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffbf 0xffdf 0xffdf 0xffdf 0xffcf 0xffef 0xffef 0xffef 0xfff7 0xfff7 0xfff3 0xfff7 0xfffb\r
DW 0xffff 0xffff 0xf7ff 0xfbff 0xf9ff 0xfcff 0xfe7f 0xfe1f 0xff00 0xff80 0xffc0 0xffc0 0xffc0 0xffe0 0xffe0 0xffe0\r
DW 0xffbf 0xffbf 0xffbf 0xfd3f 0xfe1f 0xfc1f 0xfe3f 0xfe3f 0xfe3f 0xfe3f 0xfc3f 0xf23f 0xf03f 0xe01f 0xe03f 0xc01f\r
DW 0xfdff 0xfdff 0xfdff 0xf8ff 0xf87f 0xf8ff 0xf87f 0xf87f 0xc0ff 0x807f 0x807f 0x807f 0xc03f 0xfc3f 0xfc3f 0xfa3f\r
DW 0xffff 0xffff 0xffe7 0xe7df 0xc30f 0xc00f 0xe00f 0xe01f 0xf71f 0xfa1f 0xf83f 0xfa1f 0xfc1f 0xfe0f 0xfc5f 0xfc1f\r
DW 0xffff 0xffff 0xf7f7 0xe3e7 0xe11f 0xe00f 0xe00f 0xf10f 0xf71f 0xfa1f 0xf83f 0xfa1f 0xfc1f 0xfe0f 0xfc2f 0xfc1f\r
DW 0xffff 0xffff 0xf3fb 0xe3f7 0xe18f 0xe00f 0xf007 0xf90f 0xf71f 0xfa1f 0xf81f 0xfa1f 0xfc1f 0xfc4f 0xfe4f 0xfc5f\r
DW 0xffff 0xffff 0xf3ff 0xe3f3 0xe1d7 0xf00f 0xf007 0xf80f 0xf30f 0xfb1f 0xf81f 0xf81f 0xfe1f 0xfc4f 0xfc4f 0xfc4f\r
DW 0xffff 0xffff 0xf3ff 0xf1fb 0xe1f3 0xf08f 0xf807 0xf007 0xfb0f 0xfb0f 0xf81f 0xfa1f 0xfc1f 0xfc1f 0xfccf 0xfc4f\r
DW 0xffff 0xf7ff 0xf1ff 0xe1fd 0xe0fb 0xf083 0xf88f 0xf307 0xfb07 0xfb0f 0xf81f 0xfc1f 0xfe1f 0xf81f 0xfe4f 0xfc4f\r
DW 0xf8ff 0xf8ff 0xf87f 0xf87f 0xf8f7 0xfb8f 0xfb03 0xfb0f 0xfc07 0xfe0f 0xfb0f 0xfe1f 0xfe1f 0xf60f 0xfe0f 0xfe1f\r
DW 0xf8ff 0xf8ff 0xfc7f 0xf87f 0xf877 0xfb0f 0xfb0f 0xfb07 0xf90f 0xfe0f 0xfe0f 0xfe1f 0xfa1f 0xfe3f 0xfc1f 0xfe1f\r
DW 0xfc7f 0xfc7f 0xf87f 0xf87f 0xf87f 0xfa93 0xfb85 0xf901 0xf907 0xfe03 0xfe07 0xfa07 0xfe0f 0xfc1f 0xf41f 0xfc1f\r
DW 0xe03f 0xe01f 0xe43f 0xe43f 0xf67f 0xe3c3 0xe7c3 0xe380 0xf300 0xe900 0xe800 0xfc00 0xde00 0xee00 0xde00 0xfc00\r
DW 0x7c1f 0x7e3f 0x7f3e 0x7f7c 0x3ffc 0x7f78 0x3fe4 0x7fe0 0x3f80 0x1f80 0x1f00 0xe00 0x400 0x200 0x0 0x8000      \r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0xfe7f 0xfe7f 0xff7f 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfe7f 0xfe7f 0xff7f 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0xfeff 0xfe7f 0xfe7f 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0xfeff 0xff7f 0xfe7f 0xfe7f 0xff7f 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xff7f 0xff7f 0xff7f 0xfe7f 0xff7f 0xfe7f 0xff3f 0xfe3f 0xfe3f 0xfe3f 0xff7f\r
DW 0xffff 0xffff 0xff1f 0xff1f 0xff9f 0xff9f 0xfebf 0xfe9f 0xfc3f 0xfebf 0xfe1f 0xfc9f 0xff1f 0xff0f 0xff0f 0xff0f\r
DW 0xffff 0xffff 0xff1f 0xff1f 0xff1f 0xff9f 0xffbf 0xfd1f 0xfd3f 0xfc3f 0xfc9f 0xfc9f 0xfd1f 0xff1f 0xff0f 0xff0f\r
DW 0xffff 0xff9f 0xff0f 0xff1f 0xff8f 0xff8f 0xff9f 0xfd1f 0xfb1f 0xf93f 0xf83f 0xf91f 0xfd1f 0xf91f 0xf81f 0xff0f\r
DW 0xffc7 0xff87 0xff87 0xff87 0xff87 0xffc7 0xff87 0xff8f 0xff0f 0xfb1f 0xfb1f 0xf31f 0xf01f 0xf81f 0xf10f 0xf90f\r
DW 0xffc3 0xffc1 0xffc3 0xffc3 0xffe3 0xffc3 0xff87 0xff87 0xff8f 0xff8f 0xfb8f 0xfb8f 0xf30f 0xf807 0xf007 0xf187\r
DW 0xfff0 0xfff0 0xfff0 0xffe1 0xffe1 0xffe3 0xffe3 0xfde3 0xfdc3 0xf9c1 0xfc81 0xf801 0xf860 0xfc40 0xfe20 0xfe00\r
DW 0xfffc 0xfff8 0xfff0 0xffe2 0xfefa 0xfc7c 0xfe3c 0xfe3c 0xff00 0xff80 0xff80 0xffc0 0xffc0 0xfff0 0xfff0 0xfff0\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfdff 0xfcff 0xfc2f 0xfe0f 0xff07 0xff8f 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xf8ff 0xfcff 0xfc1f 0xfe3f 0xff07 0xff7f 0xffaf 0xffff\r
DW 0xffff 0xffff 0xffff 0xfdff 0xfcff 0xfcff 0xfeff 0xfc7f 0xfe7f 0xff3f 0xfe1f 0xfe1f 0xfe3f 0xff9f 0xffdf 0xffff\r
DW 0xffff 0xffff 0xffff 0xfcff 0xfe7f 0xfe7f 0xfc7f 0xfe7f 0xfe7f 0xfe7f 0xfc3f 0xfc3f 0xfcff 0xff5f 0xfebf 0xffff\r
DW 0xffff 0xff7f 0xfe7f 0xfe7f 0xff3f 0xfe3f 0xff1f 0xfe3f 0xff3f 0xfe3f 0xfe1f 0xf81f 0xf80f 0xf81f 0xfe5f 0xffdf\r
DW 0xffff 0xff7f 0xfe1f 0xff1f 0xff0f 0xff1f 0xff8f 0xff07 0xf803 0xfe03 0xff83 0xff8f 0xff87 0xff0f 0xff07 0xfe03\r
DW 0xffff 0xffff 0xff9f 0xff1f 0xff0f 0xff87 0xe78f 0xf347 0xfc03 0xfe81 0xfc81 0xfe01 0xffc3 0xffc7 0xffc3 0xffc3\r
DW 0xfff8 0xfff0 0xfff8 0xfff8 0xfff8 0xfffc 0xf3fc 0xf9fe 0xfc20 0xfe00 0xffd4 0xfffe 0xfffc 0xfffe 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xf9ff 0xfc3f 0xfc03 0xfe80 0xffc0 0xfff4 0xfffe 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfffb 0xfffc 0xfffe 0xffff\r
DW 0xff0f 0xfc1f 0xf83f 0xfc7f 0xfc7f 0xfc7f 0xf8ff 0xfcff 0xf8ff 0xffff 0xfeff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xfeff 0xfc7f 0xfcff 0xfeff 0xfcff 0xfdff 0xfdff 0xfdff 0xfdff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xffff 0xfeff 0xffff 0xfd7f 0xff7f 0xabaa 0x100 0x300 0x300 0x300    \r
DW 0xf01f 0xd01b 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x80 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x10 0x0 0x0 0x40 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x8 0x0 0x0 0x100\r
DW 0x0 0x0 0x0 0x0 0x4000 0xe000 0xe000 0xe000 0xe000 0xc000 0xc000 0xc000 0xc000 0xc000 0xc000 0x0\r
DW 0x0 0x0 0x1e00 0x3f00 0x3f00 0x3f00 0x7e00 0x3e00 0x1c00 0x800 0x1c00 0x1800 0x3c00 0x7800 0x7c00 0x7c00       \r
DW 0x200 0xf00 0x1f80 0x1f00 0x3f00 0x3e00 0x3c00 0x3c00 0xf00 0xc00 0xc00 0x1e00 0x7c00 0x7c00 0x7e00 0x1c00     \r
DW 0x0 0xe00 0x1e00 0x3c00 0x3e00 0x3c00 0x7600 0x2600 0x700 0x600 0x600 0xe00 0x1e00 0x3e00 0x7e00 0x1e00        \r
DW 0x0 0x700 0xe00 0x1e00 0x1f00 0x3e00 0x1a00 0x3300 0x1380 0x300 0x300 0x700 0xf00 0x1f00 0x3f00 0x1f00\r
DW 0x0 0x1e0 0x3f0 0x3f8 0x3f8 0x250 0x340 0x380 0x180 0x180 0x300 0x380 0xf00 0x1f80 0x1f80 0xf80\r
DW 0x0 0x0 0x0 0x100 0x180 0x300 0x180 0x1a0 0x1f0 0x1f8 0x1f0 0x3b0 0x380 0xf80 0xf80 0x780\r
DW 0x0 0x0 0x0 0x80 0xc0 0x180 0x80 0xc0 0x80 0xc0 0x1e0 0x198 0x3c4 0x7c0 0x780 0x7c0\r
DW 0x0 0x0 0x20 0x40 0xc0 0xc0 0x40 0xc0 0x40 0xc0 0xc0 0x1e0 0x3c0 0x7e0 0x3e0 0x1e0\r
DW 0x0 0x0 0x180 0x180 0x180 0x380 0xff80 0xfec0 0xc0 0xc0 0xc0 0xe0 0x1c0 0x1e0 0x7e0 0xfe0\r
DW 0x0 0x0 0x0 0x18 0x18 0x3c 0x1c 0x298 0xfffc 0x481c 0xe 0xe 0xf 0xc 0x1e 0x1e\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x3 0x7fff 0xffff 0xb84 0x0 0x0 0x0 0x0 0x0\r
DW 0xe3 0xe7 0x1c3 0x3cf 0x383 0x382 0x302 0x606 0x60c 0x600 0x1ffc 0xffff 0x2bff 0x0 0x0 0x0\r
DW 0x3dc 0x3ce 0xcc 0xdc 0xcc 0x1dc 0x198 0x398 0x738 0x738 0x738 0xfff8 0xfffc 0xf 0x1 0x0\r
DW 0x3c 0x3c 0x7c 0x3e 0x3e 0x3c 0x2e 0x2e 0xa3e 0x35ef 0xc03f 0x801f 0x801f 0x801f 0xc01f 0xc01f\r
DW 0x0 0x0 0x0 0xc 0xe41c 0x7b9c 0x607c 0xe03c 0x403c 0xe03c 0xc03c 0x407e 0xc03a 0x4031 0x4039 0x6079\r
DW 0x0 0x0 0xe0 0xe0 0x1c0 0x5de0 0x60e0 0x60f0 0x6078 0x60ec 0x6072 0x20c2 0x60c0 0x20e1 0x31c0 0x21e0\r
DW 0x0 0x0 0x180 0x380 0x180 0x780 0x5580 0xe1c0 0xc1f0 0xc1d0 0xc0f8 0xc184 0xc180 0xc182 0x43c2 0x4380\r
DW 0x0 0x0 0x380 0x380 0x380 0x380 0x3f80 0xc180 0x81e0 0x1e0 0x81d8 0x1f8 0x8184 0x182 0x8380 0x3c3\r
DW 0x0 0x300 0x780 0x780 0x780 0xf80 0x5700 0xdf00 0x780 0x3e0 0x3e0 0x3f8 0x3d8 0x1fc 0x392 0x382\r
DW 0x200 0x780 0xf00 0xf80 0xf00 0xf00 0xff00 0x1f00 0xf00 0x7c0 0x3e0 0x7f8 0x3c8 0x3fc 0x3f6 0x382\r
DW 0x0 0x780 0xf00 0xf80 0xf80 0x4f00 0xff80 0xf00 0xf00 0x7c0 0x3e0 0x3f0 0x3e8 0x3fc 0x3fc 0x392\r
DW 0x80 0x1c0 0x3e0 0x3e0 0x7e0 0xe7c0 0x3fc0 0x380 0x3c0 0x1e0 0x3f0 0x1f8 0x1ec 0x1f4 0x1fe 0x1da\r
DW 0x7e 0xfc 0xfc 0x8f8 0xfff8 0xc1f8 0x70 0x78 0x7e 0x7b 0x7f 0x7f 0x7e 0x7f 0x7f 0x78\r
DW 0xe00f 0xe00f 0xe00f 0xe007 0xe007 0xc007 0xe003 0xc007 0xc003 0xc007 0xc003 0xc007 0x8003 0xc007 0x8007 0xc00f\r
DW 0xf000 0xe000 0xe000 0xe000 0xe000 0xe000 0xe000 0xe000 0xe000 0xe000 0x6000 0x6000 0x6000 0x7000 0x3000 0x3000\r
DW 0x1c00 0x1c00 0xc00 0xc00 0xc00 0xe00 0x400 0x600 0x200 0x100 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x200 0x100 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x80 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x180 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x40 0x810 0x910 0x7e0 0x7e0 0x1428 0x13c4 0x2388 0x1008 0x820\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x2 0x100 0x47c2 0x3e0 0x4102\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x180 0x180 0x100 0x180 0x180 0x180 0x7c0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x100 0x180 0x180 0x180 0x180 0x180 0x180 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x80 0x180 0x180 0x180 0x180 0x180 0x180 0x3c0 0x180 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x180 0x180 0x180 0x180 0x180 0x180 0x3c0 0x180 0x3c0 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x0 0x180 0x180 0x180 0x180 0x180 0x180 0x3c0 0x380 0x1c0 0x380 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x180 0x380 0x180 0x100 0x380 0x180 0x380 0x3c0 0x7c0 0x380 0x3c0 0x3c0\r
DW 0x0 0x0 0x0 0x0 0x780 0x700 0x300 0x300 0x380 0x780 0x7c0 0x5c0 0xdc0 0x1b80 0x3c0 0x380\r
DW 0x0 0x0 0x0 0x100 0xf80 0x700 0x780 0x700 0x380 0x380 0x7c0 0x7c0 0x7c0 0xfc0 0xfc0 0x1dc0\r
DW 0x0 0x0 0x0 0x1e0 0x1e0 0xf0 0xe0 0x1e0 0x1f0 0x1f0 0xf8 0x1f8 0x3f8 0x3fc 0x3f8 0x3f8\r
DW 0x340 0x240 0x240 0x240 0x3c0 0x240 0x240 0x340 0x3c0 0x3c0 0x3c0 0x3c1 0x3c1 0x3c1 0x3c3 0x3c1\r
DW 0x1e38 0x1e78 0x3e7c 0x1f78 0x1e38 0x3a18 0x1e78 0x1e7c 0x3f78 0x1ff8 0x1ff8 0x3ffc 0x1ff8 0x1ff8 0x3ff8 0x1ffc\r
DW 0xfe3f 0xfe0f 0xfe1f 0xfe1f 0xfe3f 0xfe1f 0xfd1f 0xfb3f 0xfa1f 0xfa1f 0xf7df 0xffff 0xffff 0xffff 0xffff 0xffff\r
DW 0xfe1e 0xfe1e 0xfe0f 0xfe0e 0xfe0e 0xfe9e 0xfc8b 0xfd06 0xfb02 0xfa07 0xfb7e 0xfbfe 0xfbff 0xfffe 0xfffe 0xffff\r
DW 0xe3f8 0xe3f0 0xe3f8 0xf3f0 0xe1f8 0xe1f0 0xe1f8 0xc1f0 0xeff8 0xdff0 0xfff8 0xfff0 0xfff8 0xfff0 0xfff8 0xfff0\r
DW 0x8f80 0xdf80 0x9f80 0x8f80 0xcf80 0x9f80 0x9f80 0xff80 0xff80 0xff80 0xff83 0xff86 0xff8f 0xff87 0xff86 0xff83\r
DW 0x9f00 0x9f00 0xbf00 0x9f00 0x9f00 0xdf00 0xbf00 0xff00 0xff00 0xff02 0xff02 0xff06 0xff06 0xff06 0xff02 0xff06\r
DW 0x9f00 0x9f00 0xbf00 0x9f00 0x9f00 0xbf00 0xbf00 0xff00 0xff00 0xff02 0xff04 0xff06 0xff06 0xff06 0xff02 0xff02\r
DW 0x9f00 0x9f00 0x9f00 0xbf00 0x9f00 0x9f00 0xbf00 0xff00 0xff00 0xff02 0xff04 0xff06 0xff06 0xff02 0xff02 0xff02\r
DW 0x1f00 0x3f00 0x3f00 0x3f00 0xbf00 0x1f00 0x1f00 0xff00 0xff00 0xff02 0xff02 0xff06 0xff07 0xff02 0xff03 0xff03\r
DW 0xff00 0xff00 0xff00 0x3f00 0x9f00 0x6f00 0x7700 0x3f00 0xff00 0xff00 0xff00 0xff04 0xff0f 0xff0f 0xff00 0xff01\r
DW 0x38 0x138 0x718 0xf90 0x3f10 0xffe0 0xffc0 0xff80 0xfe00 0xf800 0xf982 0xf187 0xf1df 0xe1ff 0xe0ff 0xe07f     \r
DW 0xf01e 0xf00e 0xf007 0xf006 0xf806 0xf606 0xef46 0xdf66 0x9f04 0xbb04 0x9988 0xbf80 0x1fe0 0x9ff0 0x9ff8 0x8ff8\r
DW 0xdf87 0xbfc7 0x3dc3 0x7cc1 0x7dc1 0x7fc1 0x7f81 0xff81 0x7e01 0x7c01 0x7c01 0x7c41 0x78c3 0x3c43 0x1c04 0x1c04\r
DW 0xfc 0x7c 0x7e 0x847e 0xc7f 0x47f 0x7f 0xff 0xff 0x1ff 0x1df 0x81ce 0x81de 0x81ff 0xc1ff 0xc0ff\r
DW 0xbf83 0x7fc1 0x79c1 0xf9c0 0xfbc0 0xff80 0xff80 0xff00 0xfe00 0xfe00 0xfc00 0xfc40 0xfc60 0x7c61 0x7c01 0x3c02\r
DW 0x800e 0x18f 0x18f 0x10f 0xf 0x1f 0x1f 0x7f 0x1ff 0x7ff 0x7ff 0xfff 0xe7f 0xe7f 0xe7f 0x8ffe\r
DW 0xfffe 0xff9e 0xff9e 0xff9c 0xffde 0xfffc 0xfffc 0xf2f8 0xe040 0xc000 0xc000 0x8000 0x8600 0x8600 0x8400 0x8000\r
DW 0x41 0x60 0xe1 0x1 0x1 0x1 0x3 0xc07 0x1f97 0x3fff 0x7fff 0x7fff 0x79ff 0x78ff 0x79ff 0x7dff\r
DW 0xff00 0xff00 0xff00 0xff00 0xff80 0xff00 0xef0c 0xcf0c 0xc70c 0xce00 0xff00 0xfe00 0xff00 0xfe00 0xff00 0xff00\r
DW 0xf800 0xf800 0xf800 0xf800 0xf800 0xf800 0x7860 0x7874 0x78fc 0x7800 0xf800 0xf800 0xf800 0xf800 0xf800 0xf800\r
DW 0xe000 0xe000 0xe000 0xe000 0xe000 0xe040 0xe0c0 0xe060 0xe060 0xe6fc 0xe028 0xe000 0xe000 0xe000 0xe000 0xe000\r
DW 0xf000 0xe000 0xf000 0xe000 0xf000 0xe000 0xf020 0xe020 0xf030 0xe130 0xf078 0xe01e 0xf002 0xe000 0xf000 0xe000\r
DW 0xff02 0xfe06 0xff36 0xff0f 0xfe03 0xff00 0xcf00 0x8e00 0x8f00 0xdf00 0xfe00 0xff00 0xff00 0xfe00 0xff00 0xff00\r
DW 0xffff 0xffff 0xffff 0xffff 0xffff 0xfe7f 0xfe3f 0xfe1f 0xa83f 0x3f 0xff 0x1ff 0x1ff 0x1ff 0x1ff 0xff\r
DW 0xffff 0xffff 0xf9ff 0xf1ff 0xf0ff 0xf0ff 0xf1ff 0xf1ff 0xf1ef 0xf8ef 0xf80f 0xf81f 0xf91f 0xf81f 0xf11f 0xf93f\r
DW 0xffff 0xffff 0xffff 0xfc7f 0xf87f 0xf87f 0xf8ff 0xf8ff 0xfcff 0xfc9f 0xfc5f 0xfc3f 0xfc1f 0xfc1f 0xfc1f 0xf81f\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0\r
DW 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0`,fe=`; Blocks: a falling-block puzzle. Fit the pieces together; every full row disappears.
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
`,pe=`; Rotating 3D wireframe cube, drawn in perspective.
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
`,me=`; Fire: the classic demo effect.
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
`,he=`; Conway's Game of Life on a 64x64 grid that wraps around at the edges.
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
`,ge=`; Mandelbrot set, drawn with 16-bit fixed point arithmetic.
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
`,_e=`; Mandelbrot zoom: keeps zooming in on one point of the Mandelbrot set (the branching
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
`,ve=`; Printing numbers on the display: the Fibonacci numbers, then the prime numbers.
;
; Every line shows a count, then the number in decimal and in hexadecimal. Numbers are 32 bits,
; kept as two words. The list goes back to the top when it reaches the bottom of the screen.
;
;   Fibonacci numbers: F0 to F47, the largest that fits in 32 bits.
;   Prime numbers:     all 12251 primes below 131072, found with the sieve of Eratosthenes.
;
; Input port 0:  hold any bit (a switch or a button) to skip the pauses and go at full speed.
; Output port 0: lower word of the number.   Output port 1: upper word.   Output port 2: count.
;
; Text is drawn with a 3x5 pixel font, each font pixel 2x2 on the screen, in 8x12 character
; cells (32 columns, 21 rows). A character is one word: 15 pixels from the top bit down, row by
; row, and a 1 in the lowest bit that tells the drawing loop where the pixels end.
; Characters 0-15 are the hexadecimal digits, the letters carry on to Z = 35, and 36 is a space.
;
; There is no division, so decimal digits are found by counting how many times each power of
; ten can be subtracted.

@define hi $1
@define lo $2
@define ptr $3
@define ph $4
@define pl $5
@define digit $6
@define seen $7
@define col $8
@define color $9
@define ch $10
@define px $11
@define py $12
@define c $13

; The same registers under other names while the sieve is being built
@define i $1
@define j $2
@define p $3
@define t $4
@define u $5
@define v $6
@define w $7

@define space 36
@define first_row 3             ; rows 0 and 1 are the title and the column names
@define rows 21
@define count_col 3
@define decimal_col 9
@define hex_col 20
@define line_end 28
@define sieve 2048              ; the sieve takes RAM 2048 to 6143: one bit for every odd number

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

; Powers of ten as upper word, lower word. Printing starts at .pow10 for 10 digits and at
; .pow10_4 for 5 digits. The last digit is whatever is left, so 1 is not in the table.
.pow10
DW 0x3B9A 0xCA00                ; 1000000000
DW 0x05F5 0xE100                ; 100000000
DW 0x0098 0x9680                ; 10000000
DW 0x000F 0x4240                ; 1000000
DW 0x0001 0x86A0                ; 100000
.pow10_4
DW 0 10000
DW 0 1000
DW 0 100
DW 0 10

; Text, as character numbers ending with 0xFFFF
.pow10_end
.text_fibonacci
; "FIBONACCI NUMBERS"
DW 15 18 11 24 23 10 12 12 18 36 23 30 22 11 14 27
DW 28 0xFFFF
.text_primes
; "PRIME NUMBERS"
DW 25 27 18 22 14 36 23 30 22 11 14 27 28 0xFFFF
.text_columns
; "N    DECIMAL      HEX"
DW 23 36 36 36 36 13 14 12 18 22 10 21 36 36 36 36
DW 36 36 17 14 33 0xFFFF

.row
DW 0                            ; text row that is being printed
.count
DW 0
.value_hi
DW 0                            ; the number to print
.value_lo
DW 0
.next_hi
DW 0                            ; the Fibonacci number after it
.next_lo
DW 0
.prime_i
DW 0                            ; the last prime printed is 2 * prime_i + 1

.start
; ---------------------------------------------------------------------------------------------
; Fibonacci numbers
; ---------------------------------------------------------------------------------------------
CAL .clear_screen
STR $0 .row
LDI color 10
LDI col 7
LDI ptr .text_fibonacci
CAL .put_string
CAL .put_columns

STR $0 .count
STR $0 .value_hi
STR $0 .value_lo                ; F0 = 0
STR $0 .next_hi
LDI lo 1
STR lo .next_lo                 ; F1 = 1
.fibonacci
    CAL .print_line
    ; (value, next) = (next, value + next), adding the upper words with the carry of the lower
    LOD lo .value_lo
    LOD pl .next_lo
    LOD hi .value_hi
    LOD ph .next_hi
    STR pl .value_lo
    STR ph .value_hi
    ADD ph ph hi
    ADD pl pl lo
    BNC .fibonacci_no_carry
    ADD ph ph 1
    .fibonacci_no_carry
    STR pl .next_lo
    STR ph .next_hi
    LDI ptr 150
    CAL .pause
    LOD lo .count
    ADD lo lo 1
    STR lo .count
    ADD $0 lo 48
    BLT .fibonacci
LDI ptr 2000
CAL .pause

; ---------------------------------------------------------------------------------------------
; Prime numbers
; ---------------------------------------------------------------------------------------------
CAL .clear_screen
STR $0 .row
LDI color 10
LDI col 9
LDI ptr .text_primes
CAL .put_string
CAL .put_columns

; Sieve of Eratosthenes over the odd numbers only: bit i of the sieve stands for 2i + 1, and is
; set once that number is known not to be prime. 65536 bits cover every odd number below 131072.
LDI t sieve
LDI u 4096
.sieve_clear
    STR $0 t
    ADD t t 1
    SUB u u 1
    BNZ .sieve_clear

LDI i 1                         ; start with 3
.sieve_number
    RSHIFT t i 4                ; is bit i set? Then 2i + 1 is not prime: nothing to do
    ADD t t sieve
    LOD u t
    AND v i 15
    RSHIFT u u v
    AND $0 u 1
    BNZ .sieve_next
    ; p = 2i + 1 is prime: mark its odd multiples from p * p up. Moving p bits along the sieve
    ; is the next odd multiple, and p * p is bit 2i(i + 1).
    LSHIFT p i 1
    ADD p p 1
    ADD j i 1
    MUL j j i
    LSHIFT j j 1
    .sieve_mark
        RSHIFT t j 4
        ADD t t sieve
        LOD u t
        AND v j 15
        LDI w 1
        LSHIFT w w v
        OR u u w
        STR u t
        ADD j j p
        BNC .sieve_mark         ; until j goes past the last bit
    .sieve_next
    ADD i i 1
    ADD $0 i 181                ; 363 * 363 is more than 131072, so the sieve is complete
    BLT .sieve_number

; 2 is the only even prime, so it is printed by hand
LDI lo 1
STR lo .count
STR $0 .value_hi
LDI lo 2
STR lo .value_lo
STR $0 .prime_i
.prime_print
    CAL .print_line
    LDI ptr 30
    CAL .pause
    ; look for the next bit that is not set
    LOD ptr .prime_i
    .prime_search
        ADD ptr ptr 1
        BC .primes_done         ; past the last bit
        RSHIFT ph ptr 4
        ADD ph ph sieve
        LOD ph ph
        AND pl ptr 15
        RSHIFT ph ph pl
        AND $0 ph 1
        BNZ .prime_search
    STR ptr .prime_i
    RSHIFT hi ptr 15            ; the prime is 2 * ptr + 1, which can need 17 bits
    STR hi .value_hi
    LSHIFT lo ptr 1
    ADD lo lo 1
    STR lo .value_lo
    LOD lo .count
    ADD lo lo 1
    STR lo .count
    BRN .prime_print
.primes_done
LDI ptr 4000
CAL .pause
BRN .start

; ---------------------------------------------------------------------------------------------
; Subroutines
; ---------------------------------------------------------------------------------------------

; Print .count and .value on the current row, send them to the output ports, and move to the
; next row (clearing it, so it is easy to see where the list has got to)
.print_line
    LDI color 6
    LDI col count_col
    LDI hi 0
    LOD lo .count
    LDI ptr .pow10_4
    CAL .put_decimal

    LDI color 7
    LDI col decimal_col
    LOD hi .value_hi
    LOD lo .value_lo
    LDI ptr .pow10
    CAL .put_decimal

    LDI color 11
    LDI col hex_col
    LOD ph .value_hi
    CAL .put_hex_word
    LOD ph .value_lo
    CAL .put_hex_word

    LOD lo .value_lo
    OUT lo %0
    LOD hi .value_hi
    OUT hi %1
    LOD lo .count
    OUT lo %2

    LOD lo .row
    ADD lo lo 1
    ADD $0 lo rows
    BLT .print_line_row
    LDI lo first_row
    .print_line_row
    STR lo .row
    LDI col count_col
    .print_line_clear
        LDI ch space
        CAL .put_char
        ADD $0 col line_end
        BLT .print_line_clear
RET

; Print the 32-bit number hi:lo in decimal, without leading zeros. ptr is where to start in
; the table of powers of ten: .pow10 prints 10 characters, .pow10_4 prints 5.
.put_decimal
    LDI seen 0
    .decimal_digit
        LOD ph ptr
        ADD ptr ptr 1
        LOD pl ptr
        ADD ptr ptr 1
        LDI digit 0
        .decimal_subtract
            ; stop when hi:lo is less than ph:pl
            ADD $0 hi ph
            BLT .decimal_digit_done
            BGT .decimal_fits
            ADD $0 lo pl
            BLT .decimal_digit_done
            .decimal_fits
            SUB hi hi ph
            SUB lo lo pl
            BGE .decimal_no_borrow
            SUB hi hi 1
            .decimal_no_borrow
            ADD digit digit 1
            BRN .decimal_subtract
        .decimal_digit_done
        OR seen seen digit      ; stays 0 until the first digit that is not 0
        BNZ .decimal_show
        LDI ch space
        BRN .decimal_put
        .decimal_show
        MOV ch digit
        .decimal_put
        CAL .put_char
        ADD $0 ptr .pow10_end
        BLT .decimal_digit
    MOV ch lo                   ; what is left is the last digit
    CAL .put_char
RET

; Print ph as 4 hexadecimal digits
.put_hex_word
    LDI digit 4
    .hex_digit
        RSHIFT ch ph 12
        LSHIFT ph ph 4
        CAL .put_char
        SUB digit digit 1
        BNZ .hex_digit
RET

; Print the text at ptr
.put_string
    LOD ch ptr
    ADD ptr ptr 1
    TEST $0 ch
    BNEG .put_string_done
    CAL .put_char
    BRN .put_string
    .put_string_done
RET

; Print the column names on row 1 and make the first row of the list the current one
.put_columns
    LDI lo 1
    STR lo .row
    LDI color 12
    LDI col 7
    LDI ptr .text_columns
    CAL .put_string
    LDI lo first_row
    STR lo .row
RET

; Draw character ch in color at column col of the current row, and move col on by one
.put_char
    ADD ch ch .font
    LOD ch ch
    LSHIFT px col 3
    ADD px px 2                 ; the 6 pixels of a character are at x = 2..7 of its cell
    LOD py .row
    MUL py py 12
    .put_char_pixel
        TEST $0 ch              ; the top bit is the next font pixel
        SNEG c color $0
        LSHIFT ch ch 1
        GFXSP c px py
        ADD px px 1
        GFXSP c px py
        ADD py py 1
        GFXSP c px py
        SUB px px 1
        GFXSP c px py
        SUB py py 1
        ADD px px 2
        AND $0 px 7
        BNZ .put_char_same_row
        SUB px px 6             ; past the right edge of the cell: start the next row
        ADD py py 2
        .put_char_same_row
        LSHIFT $0 ch 1          ; done when only the marker bit is left, at the top
        BNZ .put_char_pixel
    ADD col col 1
RET

; Wait for ptr * 1.4 ms. Any bit of input port 0 ends the wait straight away.
.pause
    IN ph %0
    TEST $0 ph
    BNZ .pause_done
    STL 0xFFFF
    SUB ptr ptr 1
    BNZ .pause
    .pause_done
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
`,ye=`; Raycaster: walk around a maze seen in first person.
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
`,be=`; Snake on a 32x32 board.
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
`,xe=`// Bad Apple: plays a 16x16 animation, each block 16x16 pixels. The C version of bad-apple.asm.
//
// A frame is 16 words, one per row of blocks, with the leftmost block in the top bit.
// Output port 0 shows the number of the frame being drawn.

unsigned frames[] = {
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x1f, 0x3f, 0x1f, 0x1f, 0x3f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0xf, 0xf, 0x7, 0x7,
    0xf003, 0xf007, 0xf007, 0xf007, 0xf007, 0xf007, 0xf007, 0xf007, 0xf003, 0xf003, 0xe003, 0xe001, 0xc001, 0xc000, 0xc000, 0x8000,
    0xfc07, 0xfc0f, 0xfc0f, 0xfe07, 0xfe0f, 0xfe07, 0xfc0f, 0xfc07, 0xf807, 0xf807, 0xf807, 0xf803, 0xf807, 0xf013, 0xf023, 0xf013,
    0xf01f, 0xf83f, 0xf83f, 0xf87f, 0xf83f, 0xf87f, 0xf83f, 0xf07f, 0xf83f, 0xf01f, 0xf03f, 0xe01f, 0xe01f, 0xe01f, 0xc00f, 0xc01f,
    0xf83f, 0xf83f, 0xfc3f, 0xfc7f, 0xfc7f, 0xf87f, 0xfc3f, 0xf83f, 0xf81f, 0xf83f, 0xf01f, 0xf81f, 0xf81f, 0xf20f, 0xf81f, 0xf00f,
    0xfc1f, 0xfc1f, 0xfe3f, 0xfe1f, 0xfe3f, 0xfe3f, 0xfe1f, 0xfe1f, 0xfe1f, 0xfc1f, 0xfc0f, 0xfc1f, 0xfc0f, 0xf80f, 0xfc0f, 0xfe0f,
    0xffff, 0xfc3f, 0xfc3f, 0xfc3f, 0xfe7f, 0xfe7f, 0xfc3f, 0xfc3f, 0xfc3f, 0xf83f, 0xf81f, 0xf83f, 0xf81f, 0xf85f, 0xf81f, 0xf83f,
    0xffff, 0xf87f, 0xf87f, 0xfc7f, 0xfcff, 0xfcff, 0xfc7f, 0xf87f, 0xf87f, 0xf87f, 0xf83f, 0xf03f, 0xf83f, 0xf03f, 0xf87f, 0xf03f,
    0xffff, 0xfd3f, 0xfc3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfc3f, 0xfc3f, 0xfc1f, 0xf81f, 0xfc1f, 0xf81f, 0xfc0f, 0xfc1f, 0xfc1f,
    0xffff, 0xfc1f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfc3f, 0xfc3f, 0xfc3f, 0xfc5f, 0xf81f, 0xf81f, 0xfc1f, 0xfc2f, 0xfc1f,
    0xfdff, 0xfc1f, 0xfc1f, 0xfc3f, 0xfe3f, 0xfe3f, 0xfc7f, 0xfc3f, 0xfc3f, 0xfc1f, 0xf81f, 0xf81f, 0xf81f, 0xf80f, 0xf81f, 0xf81f,
    0xff83, 0xff03, 0xff03, 0xff03, 0xff03, 0xff03, 0xff03, 0xff83, 0xff07, 0xff87, 0xff07, 0xff03, 0xff03, 0xff01, 0xff01, 0xfe08,
    0xffff, 0xffdf, 0xff87, 0xff87, 0xff07, 0xff03, 0xff83, 0xff83, 0xff83, 0xffc7, 0xfb87, 0xf387, 0xf807, 0xf807, 0xfc07, 0xf803,
    0xffff, 0xffbf, 0xff8f, 0xff07, 0xff07, 0xff07, 0xff07, 0xff87, 0xff87, 0xff87, 0xfb8f, 0xf387, 0xf80f, 0xfc07, 0xf807, 0xfc07,
    0xffbf, 0xff8f, 0xff87, 0xff07, 0xff03, 0xff07, 0xff03, 0xff83, 0xff83, 0xfd83, 0xf9c7, 0xf987, 0xfc07, 0xfc07, 0xfc07, 0xfc03,
    0xffcf, 0xff83, 0xff03, 0xff03, 0xff03, 0xff01, 0xff03, 0xff81, 0xfd81, 0xfc81, 0xf8c3, 0xfc43, 0xfe07, 0xfc03, 0xfc03, 0xfc03,
    0xffc7, 0xff83, 0xff03, 0xff03, 0xff01, 0xff03, 0xff01, 0xff81, 0xfc01, 0xfc81, 0xfc41, 0xfe03, 0xfe07, 0xfe03, 0xfc03, 0xfe03,
    0xffcf, 0xff83, 0xff03, 0xff03, 0xfe03, 0xff01, 0xff01, 0xff01, 0xfc81, 0xfc81, 0xfc83, 0xfc43, 0xfe03, 0xfc07, 0xfc03, 0xfc81,
    0xff0f, 0xff07, 0xff07, 0xfe07, 0xfe03, 0xfe03, 0xfe03, 0xff03, 0xff03, 0xf983, 0xf983, 0xf887, 0xfc07, 0xfc07, 0xfc07, 0xfc03,
    0xfd9f, 0xf81f, 0xf80f, 0xfc07, 0xfc07, 0xfc07, 0xfc07, 0xfc03, 0xff07, 0xfe03, 0xff47, 0xff43, 0xff83, 0xff83, 0xff81, 0xff81,
    0xffff, 0xfff8, 0xfff8, 0xfff0, 0xfff0, 0xfff0, 0xfff0, 0xfff8, 0xfff8, 0xfff8, 0xfff8, 0xfff8, 0xfff8, 0xfff8, 0xfff0, 0xfff8,
    0xfcff, 0xfdff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0xfe3f, 0xfe1f, 0xfe3f, 0xfe3f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfe3f, 0xfe1f, 0xfe1f, 0xfe1f, 0xfe3f, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xfe3f, 0xfc1f, 0xfc3f, 0xfc1f, 0xfe3f, 0xff7f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff3f, 0xfe1f, 0xfe0f, 0xfe0f, 0xfe1f, 0xfe1f, 0xffbf, 0xffff, 0xffff, 0xffff, 0xffff,
    0x0, 0x0, 0xffc0, 0xff80, 0xffe0, 0xfffe, 0xfe3c, 0xfe1e, 0xfc1e, 0xfc1f, 0xfe1f, 0xff3f, 0xffff, 0xffff, 0xffff, 0xffff,
    0x3ff, 0x1ff, 0x3ff, 0x9f, 0x87, 0x1c6, 0x1c2, 0x1c0, 0x3e0, 0x3e0, 0x1e0, 0x1c0, 0x0, 0x0, 0x0, 0x0,
    0xc000, 0xc000, 0xe000, 0xe000, 0x7000, 0xf000, 0xf000, 0xfc00, 0xf77c, 0xfffe, 0xffff, 0xffff, 0xffff, 0xffff, 0xf8ff, 0x781e,
    0x3ff, 0x1ff, 0xff, 0x7f, 0x3f, 0x11f, 0x33f, 0x3bf, 0x1be, 0xff, 0x7f, 0x3f, 0x6f, 0x47, 0x4f, 0xcf,
    0x7ff, 0x7ff, 0x3ff, 0x1ff, 0xff, 0x7f, 0x7f, 0x1ff, 0x1bf, 0x39f, 0x1df, 0x5f, 0x7f, 0x7f, 0x7f, 0x7f,
    0x38, 0x7c, 0x8ff, 0x1ff9, 0xff8, 0x1ffe, 0x7ff, 0x1ff, 0xff, 0x1ff, 0x1bf, 0xff, 0x7e, 0x7d, 0x7e, 0x3f,
    0x0, 0x0, 0x0, 0x1e0, 0x3c0, 0x1e0, 0xf0, 0x170, 0xe8, 0xf0, 0x7c, 0x40ff, 0xffff, 0x10ff, 0x4bb, 0x0,
    0x0, 0x0, 0x0, 0x80, 0x180, 0xc0, 0xc0, 0xc0, 0xdfc, 0x7c, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x180, 0xc0, 0x80, 0x2f0, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x80, 0x180, 0x80, 0xe0, 0x2f0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x100, 0x180, 0x80, 0x1d0, 0x4f0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x100, 0x180, 0x80, 0x5f0, 0xb0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x180, 0x80, 0xc0, 0x5f0, 0x20, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x80, 0xc0, 0x80, 0xe0, 0x2f8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x30, 0x38, 0x18, 0x19, 0x5f, 0xbf, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x20, 0x20, 0x30, 0x30, 0x38, 0x38, 0x4000, 0x6000, 0xec00, 0xfc00, 0xfc00, 0xfc00,
    0x0, 0x0, 0x0, 0x0, 0x20, 0x20, 0x30, 0x38, 0x78, 0x0, 0x4000, 0x6000, 0xf600, 0xfc00, 0xfe00, 0xfc00,
    0x0, 0x0, 0x0, 0x0, 0x60, 0x20, 0x30, 0x38, 0x70, 0x0, 0x4000, 0x6200, 0xfa00, 0xfe00, 0xfe00, 0xfe00,
    0x0, 0x0, 0x0, 0x0, 0x20, 0x60, 0x20, 0x30, 0x70, 0x30, 0x4000, 0x7000, 0xf600, 0xfe00, 0xfe00, 0xfe00,
    0x0, 0x0, 0x0, 0x0, 0x40, 0x60, 0x20, 0x30, 0x70, 0x20, 0x6000, 0x6100, 0xfd00, 0xfe00, 0xff00, 0xfe00,
    0x0, 0x0, 0x0, 0x0, 0x60, 0x40, 0x30, 0x70, 0x70, 0x2000, 0x6000, 0x6900, 0xfa00, 0xff00, 0xff00, 0xff00,
    0x0, 0x10, 0x10, 0x3c, 0x18, 0x38, 0x3d, 0x1f, 0x1f, 0x3f, 0x3f, 0x17, 0x4, 0x0, 0x0, 0x0,
    0xf, 0x4, 0x0, 0x0, 0x3, 0x103, 0x3cf, 0x67f, 0x23f, 0x100, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0xc0, 0x1f3, 0x33f, 0x39f, 0x8c, 0x80, 0x80, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x600, 0x200, 0x300, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x380, 0x300, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0xff9f, 0xffbf, 0xffbf, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffcf, 0xffc7, 0xffc7, 0xffcf, 0xffcf, 0xff9f, 0xff8f, 0xff9f,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfcff, 0xf8ff, 0xf3ff, 0xf3ff, 0xf7ff, 0xe7ff, 0xf7ff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xcfff, 0xcfff, 0xefff, 0xc7ff, 0xcfff, 0xcfff, 0xcfff, 0xcfff, 0xcfff, 0xc7ff, 0xd7ff, 0xefff,
    0xffff, 0xffff, 0xe7ff, 0xe3ff, 0xe7ff, 0xe3ff, 0xe3ff, 0xe3ff, 0xc7ff, 0xc3ff, 0xe7ff, 0xe3ff, 0xe3ff, 0xe3ff, 0xe3ff, 0xc3ff,
    0xffff, 0xfdff, 0xf9ff, 0xf8ff, 0xf9ff, 0xf8ff, 0xf8ff, 0xf8ff, 0xf8ff, 0xf0ff, 0xf8ff, 0xf8ff, 0xf8ff, 0xf8ff, 0xf8ff, 0xf0ff,
    0xffff, 0xffff, 0xfe3f, 0xfe3f, 0xfe7f, 0xfe3f, 0xfe1f, 0xfe3f, 0xfe3f, 0xfe7f, 0xfe7f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfc3f, 0xfe3f,
    0xffff, 0xffff, 0xfe3f, 0xff1f, 0xff3f, 0xfe1f, 0xfc1f, 0xff1f, 0xfe3f, 0xff3f, 0xfe1f, 0xff3f, 0xff1f, 0xff3f, 0xfe1f, 0xff1f,
    0xffff, 0xffdf, 0xff1f, 0xff1f, 0xff1f, 0xff1f, 0xf00f, 0xf00f, 0xff0f, 0xff1f, 0xff1f, 0xff9f, 0xff0f, 0xff1f, 0xff0f, 0xff0f,
    0xffff, 0xffbf, 0xff1f, 0xff1f, 0xff0f, 0xff0f, 0xff8f, 0xff0f, 0xfe0f, 0xfc0f, 0xfe07, 0xff0f, 0xff07, 0xff07, 0xff07, 0xff1f,
    0xffff, 0xffff, 0xff1f, 0xff0f, 0xff0f, 0xff0f, 0xff8f, 0xff8f, 0xff8f, 0xff07, 0xff0f, 0xff07, 0xfe07, 0xfe07, 0xfe0f, 0xfe07,
    0xffff, 0xffbf, 0xff8f, 0xff0f, 0xff0f, 0xff8f, 0xff8f, 0xff0f, 0xf80f, 0xf00f, 0xfb0f, 0xfb0f, 0xff0f, 0xff0f, 0xff8f, 0xff0f,
    0xffff, 0xffcf, 0xfb87, 0xfd87, 0xfcc3, 0xfc07, 0xfc07, 0xff87, 0xff87, 0xff07, 0xff07, 0xff03, 0xff03, 0xff03, 0xff03, 0xff03,
    0xffe0, 0xffe0, 0xffc0, 0xff80, 0xff00, 0xff80, 0xffc0, 0xffc0, 0xfdc0, 0xfdc0, 0xf8d0, 0xfd80, 0xfcc0, 0xfc00, 0xfe00, 0xfe00,
    0xfff3, 0xffc1, 0xffc0, 0xff80, 0xff00, 0xff00, 0xff80, 0xff80, 0xf380, 0xfba0, 0xf3a0, 0xf980, 0xf900, 0xfc00, 0xfe00, 0xfc00,
    0xfff8, 0xfff8, 0xfff0, 0xffe0, 0xffc0, 0xfde0, 0xfdf0, 0xfdf8, 0xf9f8, 0xf8f8, 0xf8f9, 0xf8fc, 0xfcf8, 0xfc78, 0xfe00, 0xfe00,
    0xffff, 0xffff, 0xffef, 0xffcf, 0xffdf, 0xffdf, 0xffdf, 0xfe1f, 0xfc0f, 0xfc1f, 0xfc0f, 0xfe1f, 0xfc1f, 0xfe1f, 0xfe1f, 0xfe0f,
    0xffff, 0xffff, 0xffff, 0xffff, 0xfbff, 0xfdff, 0xfebf, 0xfc3f, 0xfc1f, 0xfc1f, 0xfc1f, 0xfc1f, 0xfe0f, 0xff03, 0xff01, 0xff80,
    0xff83, 0xff81, 0xff01, 0xff87, 0xff03, 0xff07, 0xff87, 0xffcf, 0xfb87, 0xf003, 0xf003, 0xe400, 0xfe02, 0xff07, 0xff87, 0xff07,
    0xffff, 0xffff, 0xfe3f, 0xfc1f, 0xfc3f, 0xfc3f, 0xfc3f, 0xfe7f, 0xbc7f, 0x8833, 0x1, 0x7c04, 0xfc3e, 0xfc7f, 0xfc7f, 0xfc7f,
    0xffff, 0xffff, 0xfe7f, 0xfc1f, 0xfc3f, 0xf83f, 0xfc3f, 0xfc7f, 0xbe7f, 0x1833, 0x3, 0xec01, 0xfc3c, 0xfc7f, 0xfc7f, 0xfc7f,
    0xffff, 0xffff, 0xff7f, 0xfc1f, 0xfc3f, 0xfc3f, 0xfc3f, 0xfe7f, 0xee7f, 0xcc39, 0x8000, 0x3022, 0xfc3f, 0xfe3f, 0xfe3f, 0xfc3f,
    0xffff, 0xffff, 0xfebf, 0xfe0f, 0xfc1f, 0xfc3f, 0xfe3f, 0xfe3f, 0xee7e, 0xc418, 0x8000, 0xf832, 0xfc1f, 0xfc3f, 0xfe3f, 0xfc3f,
    0xfe07, 0xfe03, 0xfe07, 0xf807, 0xfc1f, 0xfe0f, 0xfe1f, 0xfe3f, 0xfc3f, 0xf41f, 0xe01e, 0xe000, 0xf830, 0xfc39, 0xfc7f, 0xfc3f,
    0xfff0, 0xffe1, 0xffc0, 0xffc0, 0xff01, 0xff81, 0xffc0, 0xffe1, 0xfff2, 0xf1e6, 0xf8c2, 0xfc40, 0xfe01, 0xff04, 0xff06, 0xffc7,
    0xfffa, 0xfff0, 0xffe0, 0xffc0, 0xffc0, 0xffc0, 0xffe0, 0xf7e0, 0xe1f0, 0xf1f8, 0xf8e3, 0xfc01, 0xfe00, 0xff00, 0xffe0, 0xffc3,
    0xfcff, 0xf03f, 0xf00f, 0xf007, 0xfc03, 0xfc00, 0xfdc0, 0xffe0, 0xfff8, 0xffff, 0xffff, 0xfaff, 0xf0ff, 0xf8ff, 0xf9ff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfeff, 0xf81f, 0xf83f, 0xfc3f, 0xfc7f, 0xfe7f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xfc7f, 0xf83f, 0xfc1f, 0xfc3f, 0xfc7f, 0xfeff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x400, 0x6c0, 0x7c0, 0x7f0, 0x3f0, 0x3e8, 0x380,
    0x0, 0x0, 0x0, 0x0, 0x1800, 0x1800, 0x0, 0x0, 0x0, 0x40, 0x1020, 0x1888, 0xed8, 0x6d8, 0x37c, 0x740,
    0x0, 0x0, 0x0, 0x1800, 0x800, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x100, 0x80, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x80, 0x180, 0x180, 0x180, 0x200, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x200, 0x0, 0x300, 0x380, 0x180, 0x1e0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x20, 0x20, 0xc0, 0x380, 0x180, 0x380, 0x180, 0x100, 0x200, 0x200, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x100, 0x380, 0x380, 0x180, 0x100, 0x380, 0x180, 0x1c0, 0x180, 0x3c0, 0x380, 0x1c0, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x180, 0x380, 0x180, 0x300, 0x180, 0x3c0, 0x1c0, 0x1c0, 0x3c0, 0x380, 0x1c0, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x1c0, 0x180, 0x1c0, 0x80, 0x380, 0x380, 0x780, 0x180, 0x3c0, 0x380, 0x380, 0x3c0,
    0x0, 0x0, 0x0, 0x80, 0x9c0, 0xcc0, 0x3c0, 0x380, 0x380, 0x380, 0x100, 0x380, 0x1c0, 0x380, 0x3c0, 0x180,
    0x0, 0x0, 0x0, 0x180, 0x5c0, 0x5c0, 0x580, 0x380, 0x380, 0x380, 0x300, 0x380, 0x1c0, 0x380, 0x3c0, 0x1c0,
    0x0, 0x0, 0x380, 0x3c0, 0x3c0, 0x7d0, 0x1f0, 0x1d8, 0x1d8, 0x3f0, 0x1f0, 0x1e0, 0x1f0, 0x1f0, 0x3f0, 0x3e0,
    0x0, 0x40, 0xf2, 0xf8, 0xf2, 0xfa, 0x7b, 0x32, 0x7e, 0x7e, 0x7c, 0x3c, 0x3c, 0xbc, 0xfc, 0xf8,
    0x0, 0x0, 0x0, 0x0, 0xe, 0x1f, 0x1f, 0xf, 0xf, 0xf, 0x3, 0x3, 0x7, 0x3, 0x1, 0x1,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x140, 0x40, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x5f, 0xfff, 0x30, 0x31, 0x7b, 0x79, 0x7b, 0x71, 0x39,
    0xe, 0x3f, 0x3f, 0x3f, 0x3f, 0x7f, 0x86e, 0x142c, 0xf60f, 0x5b1f, 0x4dff, 0x535f, 0x41df, 0x15f, 0x5f, 0x3f,
    0x0, 0x50, 0xf0, 0x1f8, 0x1f8, 0xf8, 0x1f0, 0x6130, 0x9870, 0x68f8, 0x56fe, 0x15fa, 0x67b, 0x1f8, 0xfa, 0xf8,
    0x0, 0x70, 0xf0, 0xf0, 0x1f8, 0x1f8, 0x11f0, 0x6820, 0xa870, 0xacfa, 0xabfd, 0x857a, 0x5fa, 0xf8, 0xf8, 0xf8,
    0x0, 0xf0, 0xf0, 0xf0, 0x1f0, 0xf8, 0x1060, 0x6860, 0xac70, 0xb4fb, 0x4bfb, 0x6fa, 0x1f8, 0x1f0, 0xf8, 0xf0,
    0x0, 0x380, 0x7c0, 0x7c0, 0x780, 0x380, 0x180, 0x1e0, 0x3e0, 0x380, 0x780, 0x780, 0xf80, 0x1f80, 0x3f80, 0x780,
    0x0, 0x0, 0x3c0, 0x3e0, 0x3e0, 0x1a0, 0x1a0, 0x2184, 0xd7da, 0x5bf3, 0x3c1, 0x3c0, 0x7c0, 0x3c0, 0x7c0, 0x7e0,
    0x0, 0x100, 0x3c0, 0x3e0, 0x3c0, 0x3e0, 0x120, 0x2184, 0x57fb, 0xd7c5, 0x3d1, 0x7c0, 0x9c0, 0x1bc0, 0x3e0, 0x3c0,
    0x0, 0x100, 0x3c0, 0x1e0, 0x3e0, 0x3e0, 0x1a0, 0x4180, 0xb7ce, 0xd7f5, 0xbc9, 0x3c0, 0xdb0, 0x13d0, 0x3c0, 0x3c0,
    0x0, 0x180, 0x3e0, 0x3e0, 0x3e0, 0x1e0, 0x1a0, 0x4182, 0xb7cd, 0x5bf5, 0x8bd2, 0x7e1, 0x5a0, 0x1bd8, 0x23c4, 0x3c0,
    0x0, 0x3c0, 0x3e0, 0x3e0, 0x3e0, 0x3a0, 0x1a0, 0x4182, 0xa7d5, 0xb7eb, 0x4bd4, 0x7e0, 0x7a0, 0x19d8, 0x23c8, 0x3c0,
    0x100, 0x3c0, 0x3e0, 0x3e0, 0x3e0, 0x3e0, 0x120, 0x4182, 0xa7cd, 0xb7f5, 0x57d2, 0x7c8, 0x5e0, 0x1bb0, 0x33cc, 0x3c0,
    0xfeff, 0xfe3f, 0xfc1f, 0xfc0f, 0xfc1f, 0xfc1b, 0x1e48, 0x524a, 0xc817, 0xf81f, 0xf83f, 0xf81f, 0xf81f, 0xd24b, 0x8421, 0xfc3f,
    0xfc1f, 0xfc0f, 0xf80f, 0xfc0f, 0xfc2f, 0x5e28, 0x5646, 0x4812, 0xd017, 0xf81f, 0xf81f, 0xf81f, 0xf01f, 0xf42d, 0x420, 0x1c30,
    0xf807, 0xf813, 0xfc07, 0x7e32, 0x5e62, 0x2022, 0x2004, 0xa00a, 0xffff, 0xffff, 0xf00f, 0xf00f, 0xe00f, 0xe407, 0xc823, 0x810,
    0xfc3c, 0x5010, 0x8004, 0x8001, 0x8001, 0x8001, 0x8001, 0x8003, 0xffff, 0xfdfb, 0x8003, 0x8001, 0x8001, 0x8001, 0x1000, 0x2008,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1557, 0xffff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x2, 0x0, 0x1, 0x1, 0x0, 0x4, 0x1c, 0x5ffc, 0x1e, 0xc, 0xe, 0xc, 0xe, 0x46, 0x2e, 0x1f,
    0x10, 0x38, 0x18, 0x6, 0x0, 0x0, 0x42e0, 0x4860, 0x4060, 0x4060, 0x4040, 0x4070, 0xe0, 0x3e8, 0xf0, 0x1f0,
    0x40, 0x20, 0x10, 0x0, 0x0, 0x0, 0x2ac0, 0x20e0, 0x2040, 0x2040, 0x6060, 0xc0, 0x1e0, 0x1e0, 0x1e0, 0x3f0,
    0x7c, 0x38, 0x0, 0xb00, 0x600, 0x200, 0x2300, 0x2600, 0x2680, 0x2700, 0x2b00, 0x4380, 0x780, 0x200, 0x100, 0x0,
    0x8, 0x38, 0x8, 0x100, 0x180, 0x180, 0x2180, 0x2380, 0x2340, 0x2720, 0x2380, 0x3c8, 0x3c0, 0x382, 0x0, 0x280,
    0x74, 0x5a, 0x12b, 0x314, 0x360, 0x180, 0x2300, 0x2300, 0x2300, 0x2700, 0x6b80, 0x380, 0x380, 0x280, 0x0, 0x280,
    0xe, 0x6, 0x82, 0x188, 0x1d8, 0x1d0, 0x1a0, 0x4380, 0x6580, 0x2300, 0x4780, 0x5b80, 0x63c0, 0x780, 0x3c0, 0x280,
    0x0, 0xc0, 0x1c0, 0x180, 0x180, 0x180, 0x3c3, 0x43f4, 0x6398, 0x53a0, 0x47c0, 0x4380, 0x43c0, 0xfd0, 0x33c8, 0x47e0,
    0x1ff, 0x1ff, 0x1ff, 0x3ff, 0x3ff, 0x3ff, 0x1ff, 0x3ff, 0x1ff, 0x3ff, 0x5b0, 0x3a0, 0x3c0, 0x3e0, 0x380, 0x3c0,
    0x0, 0x0, 0x380, 0x380, 0x3c0, 0xf90, 0x1fc8, 0x1fc2, 0x1fd4, 0x3fc8, 0x3fe4, 0x3fe2, 0x5f42, 0x4043, 0x4040, 0x4042,
    0xe000, 0xe000, 0xf000, 0xe000, 0xf000, 0xf800, 0xf800, 0xf800, 0xfe00, 0xfc00, 0xf800, 0xf800, 0xf800, 0xf800, 0xf800, 0xf800,
    0x1000, 0x7800, 0x7c00, 0x7c00, 0xfc00, 0xfc00, 0xfc00, 0x7c00, 0xfc00, 0x7c00, 0xfc00, 0xfc00, 0xfe00, 0xfe00, 0xfe00, 0xff00,
    0x0, 0x800, 0x3e00, 0x3e00, 0x3e00, 0x7e00, 0x3e00, 0x3f00, 0x3f00, 0x3f00, 0x3e00, 0x3f00, 0x3f00, 0x3f00, 0x3f00, 0x3f80,
    0x0, 0x600, 0xf00, 0x1f80, 0x1f00, 0x1f80, 0x1f80, 0x1f80, 0x1f80, 0x1f80, 0x1f00, 0xf80, 0x1f80, 0x1f80, 0x3f80, 0x3f80,
    0x0, 0x1400, 0x3c00, 0x3e00, 0x7e00, 0x7e00, 0x7e00, 0x3e00, 0x7e00, 0x7e00, 0x3e00, 0x7ec0, 0x7ec0, 0x7ec0, 0xfe80, 0x7f80,
    0x800, 0x3800, 0x3c00, 0x7e00, 0x7c00, 0xfe00, 0x7c00, 0x7e00, 0x7e00, 0x5c00, 0x7e00, 0x7e00, 0x7f60, 0x7ff0, 0xfffc, 0x7ffc,
    0x0, 0xe00, 0x1f00, 0x1f00, 0x3f00, 0x3f00, 0x1f00, 0x1f00, 0x3f80, 0x1f00, 0x1f00, 0x1f00, 0x1fe0, 0x3ff0, 0x1ff8, 0x3ffc,
    0x0, 0x1c00, 0x3e00, 0x3e00, 0x3e00, 0x7e00, 0x7e00, 0x3e00, 0x3e00, 0x7c00, 0x3e00, 0x3f00, 0x3f00, 0x7fe0, 0x3ff8, 0x7ffc,
    0x0, 0x2800, 0x7800, 0xf800, 0xfc00, 0xfc00, 0xfc00, 0xf800, 0xf800, 0xf000, 0xfc00, 0xfc00, 0xfc00, 0xfe80, 0xfff0, 0xfff8,
    0x0, 0x0, 0xc00, 0x3e00, 0x3e00, 0x7f00, 0x3e00, 0x3e00, 0x3e00, 0x3c00, 0x3c00, 0x3fc0, 0x3ff0, 0x3ff8, 0x3ffc, 0x3ffc,
    0x0, 0x400, 0xe00, 0x1e00, 0x3f80, 0x3f00, 0x1f00, 0x1f00, 0x1f00, 0x1e00, 0x1e00, 0x1ff0, 0x1ff8, 0x3ffc, 0x1ffc, 0x3ffc,
    0x0, 0x800, 0x3800, 0x7c00, 0xfe00, 0x7e00, 0x7c00, 0x7c00, 0x7c00, 0x7800, 0x7c00, 0x7fe0, 0x7ff0, 0xfff8, 0xfff8, 0xfffc,
    0x4000, 0xe000, 0xe000, 0xf000, 0xf800, 0xf800, 0xf880, 0xf000, 0xf800, 0xf000, 0xe000, 0xf000, 0xf800, 0xf800, 0xffe0, 0xfff0,
    0x0, 0x0, 0x0, 0x0, 0xa000, 0xe000, 0xe000, 0xe000, 0xe000, 0xc000, 0xc000, 0xc000, 0xc000, 0xc000, 0xc000, 0x8000,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x200, 0x380, 0x3c0, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x300, 0x100, 0x380, 0x180, 0x180, 0x1c0, 0xc0, 0xc0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x6a0, 0xff0, 0xff0, 0x740, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x100, 0x1c0, 0x3c0, 0x3c0, 0x380, 0x380, 0x300, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x40, 0x40, 0x40, 0x40, 0xff0, 0x7f0, 0x3e0, 0x140, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0xc0, 0x40, 0x40, 0x40, 0xe4, 0x7078, 0x7ff8, 0x1ff0, 0xff0, 0x0, 0x0, 0x0, 0x0,
    0x440, 0x4c0, 0x4e0, 0x1c0, 0x3e0, 0x1c7, 0x7f, 0x17ff, 0xffff, 0xffff, 0xfffe, 0xfffc, 0x1ffc, 0x7f0, 0xa0, 0x0,
    0x10c0, 0x11c0, 0x13c0, 0x7c0, 0x17c0, 0x7c3, 0x9f, 0x1ff, 0x5fff, 0xffff, 0xffff, 0xfffe, 0xfffc, 0xfff8, 0xff80, 0xfe00,
    0x61c0, 0x419a, 0x41f1, 0x61c0, 0x4180, 0x61c0, 0x21c0, 0x27c0, 0x27c0, 0xfc0, 0x27c1, 0xf8f, 0x7ff, 0x2fff, 0xffff, 0xffff,
    0x0, 0x0, 0x41c0, 0x63c0, 0xcb80, 0xc380, 0xc0c0, 0x81d8, 0xc1db, 0x81e0, 0xc180, 0x40c0, 0x41c0, 0x43e0, 0x47c0, 0x4fe0,
    0x0, 0x0, 0x0, 0x41c0, 0x61c0, 0xcb80, 0xc180, 0xc1c0, 0xc1d8, 0x81cd, 0xc1f0, 0xc0c0, 0x40c0, 0x41e0, 0x41e0, 0x43e0,
    0x0, 0x0, 0x180, 0x4380, 0x6380, 0xcb80, 0xc3c0, 0xc1dc, 0xc1c9, 0x81f0, 0xc0c0, 0x40c0, 0x41e0, 0x61e0, 0x23e0, 0x47e0,
    0x0, 0x0, 0x1c0, 0x4380, 0x77c0, 0x6380, 0x41e0, 0x60ee, 0x40e8, 0x41f0, 0x60e0, 0x4060, 0x61e0, 0x23f0, 0x2fe0, 0x2ff0,
    0x2, 0xf, 0x80f, 0xe1f, 0x1d7e, 0xc1f, 0x1c0f, 0x180f, 0x1807, 0x180f, 0x1c0b, 0x807, 0x1c07, 0xc07, 0xc07, 0x41f,
    0x7c0, 0x7c0, 0x7c0, 0x780, 0x7c0, 0x780, 0x780, 0x780, 0x780, 0x780, 0x780, 0x780, 0x780, 0x780, 0x780, 0x3c0,
    0xff, 0xff, 0xff, 0x1ff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x37f, 0x33f, 0x33f,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x17f, 0x33f, 0x33f, 0x33f, 0x33f, 0x33f, 0x13f, 0x37f, 0x13f, 0x33f,
    0xff, 0xff, 0xff, 0xff, 0x17f, 0x33f, 0x33f, 0x17f, 0x17f, 0x33f, 0x33f, 0x13f, 0x37f, 0x13f, 0x33f, 0x33f,
    0xff, 0xff, 0xff, 0xff, 0x17f, 0x13f, 0x37f, 0x13f, 0x17f, 0x33f, 0x33f, 0x33f, 0x13f, 0x37f, 0x13f, 0x33f,
    0xff, 0xff, 0xff, 0xff, 0xff, 0x13f, 0x13f, 0x13f, 0x13f, 0x17f, 0x33f, 0x30f, 0x31f, 0x33f, 0x13f, 0x33f,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x9f, 0x11f, 0x33f, 0x13f, 0x17f, 0x13f, 0x13f, 0x13f, 0x13f,
    0xff, 0xff, 0x1ff, 0x2ff, 0x1ff, 0x1ff, 0x1ff, 0x1ff, 0x1ff, 0x3ff, 0x2ff, 0x37f, 0x37f, 0x37f, 0x37f, 0x37f,
    0x1ff, 0x1ff, 0x1ff, 0x1ff, 0x3ff, 0x1ff, 0x1ff, 0x3ff, 0x3ff, 0x3ff, 0x67f, 0x6ff, 0x67f, 0x2ff, 0x6ff, 0x27f,
    0x7ff, 0x7ff, 0x3ff, 0x7ff, 0x6ff, 0xff, 0x7f, 0x4ff, 0x45f, 0x43f, 0x47f, 0x7f, 0x47f, 0xbf, 0x5f, 0x7f,
    0x1ff, 0x1ff, 0xff, 0x27f, 0x27f, 0x67f, 0x7ebf, 0x863f, 0x73f, 0x37f, 0x7bf, 0x6ff, 0xeff, 0xe7f, 0x6ff, 0x67f,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0xb, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x18, 0x1c, 0x1e, 0xf, 0x3, 0x3, 0x0, 0x0,
    0x0, 0x0, 0x100, 0x180, 0x180, 0x1c0, 0x1c0, 0x1c0, 0xc0, 0x1c0, 0xc0, 0x1c0, 0xc0, 0x1c0, 0xc0, 0x1c0,
    0x0, 0x100, 0x300, 0x380, 0x180, 0x180, 0x1c0, 0x1c0, 0x1c0, 0x180, 0x1c0, 0x180, 0x180, 0x180, 0x180, 0x3c0,
    0x0, 0x100, 0x300, 0x380, 0x380, 0x180, 0x1c0, 0x1c0, 0x3c0, 0x1c0, 0x3c0, 0x7c0, 0x9c0, 0x980, 0x1c0, 0x380,
    0x0, 0x100, 0x180, 0x380, 0x380, 0x180, 0x1c0, 0x1c0, 0x3c0, 0x3c0, 0x1fc0, 0x1c0, 0x1c0, 0x180, 0x180, 0x1c0,
    0x0, 0x100, 0x180, 0x380, 0x380, 0x1c0, 0x180, 0x1c0, 0x3c0, 0x1fc0, 0x5c0, 0x1c0, 0x1c0, 0x180, 0x1c0, 0x180,
    0x0, 0x100, 0x180, 0x380, 0x380, 0x1c0, 0x180, 0x1c0, 0x13c0, 0xfc0, 0x1c0, 0x1c0, 0x1c0, 0x1c0, 0x180, 0x3c0,
    0x0, 0x180, 0x380, 0x380, 0x1c0, 0x180, 0x1c0, 0x13c0, 0x13c0, 0x1fc0, 0x3c0, 0x1c0, 0x3c0, 0x1c0, 0x3c0, 0x3c0,
    0x0, 0x100, 0x3c0, 0x1c0, 0x1c0, 0x1380, 0x1380, 0x1bc0, 0x13c0, 0x1fc0, 0x7e0, 0x1b0, 0x1d0, 0x3c0, 0x3c0, 0x3c0,
    0x0, 0x100, 0x1c0, 0x1c0, 0x3c0, 0x1180, 0x1380, 0x1bc0, 0x13c0, 0x1bc0, 0x7f8, 0x180, 0x1c0, 0x3c0, 0x3c0, 0x3c0,
    0x0, 0x100, 0x1c0, 0x1c0, 0x3c0, 0x1180, 0x1b80, 0x13c0, 0x13c0, 0x1fc0, 0x7f0, 0x388, 0x180, 0x3c0, 0x3c0, 0x3c0,
    0x0, 0x240, 0x3c0, 0x1c0, 0x11c0, 0x1380, 0x1b88, 0x13c8, 0x1bc8, 0xfc8, 0x7f8, 0x380, 0x180, 0x3c0, 0x3c0, 0x3c0,
    0x0, 0x440, 0x7e0, 0x7f0, 0x7e0, 0x7a0, 0x5e0, 0x7e0, 0x7e0, 0x3c0, 0x3c0, 0x3c0, 0x180, 0x3c0, 0x3c0, 0x3c0,
    0x3d38, 0x3e38, 0x3ef8, 0x3ebe, 0x3efc, 0x7ffc, 0x3ff8, 0x3ff8, 0x3ff8, 0x1bd8, 0xff0, 0xff0, 0xfe0, 0xff0, 0x7e0, 0x3c0,
    0xf77e, 0xff7f, 0xbf7f, 0xbf7f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0x7f7f, 0x7f7f, 0x7fff, 0x3ffe, 0x1ffc, 0x3c4,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xbbff, 0xffff, 0x3fff, 0xbfff, 0x7fff, 0x7fff, 0x7fff, 0xfdff, 0x7fff, 0x7bff, 0x11ff,
    0x9ff, 0x3ff, 0xe9ff, 0x63ff, 0x63ff, 0x77ff, 0xf3ff, 0xfbff, 0xb7ff, 0x5bff, 0x3bff, 0x3bff, 0x7dff, 0x79ff, 0x39ff, 0x10ff,
    0x3ff, 0xbff, 0x43ff, 0x6bff, 0x67ff, 0x73ff, 0x73ff, 0xfbff, 0xd3ff, 0x7fff, 0x3bff, 0x3fff, 0x7bff, 0x7fff, 0x7bff, 0x15ff,
    0x3ff, 0x7ff, 0x63ff, 0x63ff, 0x65ff, 0x72ff, 0x71fe, 0x787e, 0xf17e, 0x787f, 0x382f, 0x783f, 0x387f, 0x7cbf, 0x785f, 0x3178,
    0x0, 0x0, 0x6004, 0x200c, 0x300e, 0x700e, 0x781f, 0x7019, 0xd81c, 0x781c, 0x381e, 0x381e, 0x781e, 0x781f, 0x7c1c, 0x1008,
    0x0, 0x410, 0xc30, 0xc38, 0x1c3c, 0x7c17, 0x6c33, 0xec31, 0x8c38, 0xc10, 0xc3c, 0x1c3c, 0x1c1f, 0x3c3f, 0x7c3f, 0xfc1f,
    0x0, 0x0, 0x240, 0x660, 0xe70, 0xef0, 0xe70, 0x1c38, 0x1c38, 0x1df8, 0x1ff8, 0x3ff8, 0x1e7c, 0x1d18, 0x1c3e, 0x3c3e,
    0x0, 0x200, 0x6a0, 0x660, 0xe70, 0xe70, 0x1e78, 0xc70, 0x1e38, 0x1df8, 0x1ff8, 0x1f78, 0x1e7c, 0x3c38, 0x1c3c, 0x1c3e,
    0x400, 0xc00, 0x418, 0x660, 0xef0, 0xe60, 0x670, 0xf70, 0xff0, 0xff0, 0xff0, 0xe70, 0xe70, 0xe78, 0x1c3c, 0x1e7c,
    0xc00, 0x400, 0xe4c, 0x620, 0xe70, 0xf70, 0xe70, 0xf70, 0xff0, 0xff0, 0xff0, 0xfe0, 0xef0, 0xee0, 0x1e70, 0x1c7c,
    0xfe0, 0x1fc0, 0x1fe0, 0x3fe0, 0x3fe0, 0x7fe4, 0xfee0, 0xfc4c, 0xfe0e, 0xff3e, 0x7fff, 0x3ffc, 0x1ffc, 0x1ff8, 0xff0, 0x7f0,
    0x1ff0, 0xffe, 0x1ffe, 0x3ffe, 0x3ffe, 0x38fe, 0x7a7e, 0x767e, 0x767e, 0x767c, 0x77fc, 0x7ff8, 0x73f0, 0x7de0, 0x3c00, 0xf20,
    0xffe0, 0xfff0, 0xfff0, 0xfff0, 0xfff2, 0xfff0, 0xfff4, 0xfff0, 0xffe0, 0xfff4, 0xffc0, 0xffe0, 0x7f88, 0x3ea0, 0x200, 0x1080,
    0xf800, 0xfc00, 0xf800, 0xfa04, 0xf806, 0xf007, 0xc003, 0x107, 0x1003, 0x3, 0x7, 0x803, 0x7, 0x3, 0x7, 0x7,
    0xf800, 0xfc00, 0xf800, 0xfa20, 0xf818, 0xf018, 0xc00c, 0x11c, 0x101c, 0xc, 0x1e, 0x81c, 0x1c, 0x1c, 0x1e, 0x3e,
    0xf800, 0xfc00, 0xf800, 0xfa20, 0xf830, 0xf038, 0xc018, 0x38, 0x1218, 0x34, 0x18, 0x38, 0x1038, 0x38, 0x3c, 0x3c,
    0xf800, 0xfc00, 0xf800, 0xf960, 0xf830, 0xf030, 0xc030, 0x230, 0x1030, 0x30, 0x70, 0x30, 0x70, 0x870, 0x78, 0x78,
    0xf800, 0xfc00, 0xf800, 0xf960, 0xf860, 0xf020, 0xc270, 0x1f0, 0x1030, 0x30, 0x70, 0x38, 0x70, 0x470, 0x78, 0x78,
    0xf800, 0xfc00, 0xf800, 0xf940, 0xf860, 0xf060, 0xc6e0, 0xb0, 0x70, 0x1030, 0x30, 0x70, 0x70, 0x70, 0x78, 0x78,
    0xf800, 0xfc00, 0xf800, 0xf940, 0xf860, 0xf060, 0xc6e0, 0xf0, 0x30, 0x2070, 0x30, 0x70, 0x70, 0x70, 0x78, 0xf8,
    0xf800, 0xfc00, 0xf800, 0xf960, 0xf860, 0xf020, 0xc5f0, 0xe0, 0x1030, 0x30, 0x70, 0x30, 0x870, 0x70, 0x78, 0x78,
    0xf800, 0xfc00, 0xf800, 0xfa40, 0xf860, 0xf070, 0xc030, 0x7f0, 0x1030, 0x30, 0x30, 0x70, 0x30, 0x1070, 0x78, 0x78,
    0xf800, 0xfc00, 0xf800, 0xfa30, 0xf810, 0xf038, 0xc010, 0x38, 0x1278, 0x30, 0x18, 0x38, 0x1038, 0x38, 0x78, 0x78,
    0xfc00, 0xfc00, 0xfc00, 0xfc00, 0xf847, 0xf006, 0xd20c, 0x6, 0xe, 0x100e, 0xe, 0x7, 0x107, 0x40f, 0xf, 0xf,
    0x7fe0, 0x3fc0, 0x7fe0, 0x3fc0, 0x3f80, 0xf80, 0x2a20, 0x100, 0x800, 0x2000, 0x0, 0x0, 0x80, 0x200, 0x0, 0x0,
    0x1ff, 0x1ff, 0xff, 0x5ff, 0x7e, 0x80fe, 0x8018, 0x8420, 0x8080, 0x8004, 0xc000, 0x8000, 0xc110, 0xc000, 0x8000, 0xc000,
    0xf, 0xf, 0x7, 0x17, 0x7, 0x303, 0x311, 0x180, 0x302, 0x180, 0x300, 0x180, 0x380, 0x180, 0x380, 0x380,
    0x7, 0xf, 0x7, 0xf, 0x23, 0x183, 0x180, 0x82, 0x180, 0x1c0, 0x184, 0xc0, 0x180, 0x1c0, 0x180, 0x1c0,
    0x7, 0xf, 0x7, 0xf, 0x83, 0x183, 0x181, 0x88, 0x180, 0x1c0, 0x180, 0x182, 0x1c0, 0x180, 0x180, 0x1c0,
    0x1, 0x2, 0x1, 0x8, 0x180, 0x1c2, 0x180, 0xc0, 0x1c0, 0x1c2, 0x1c0, 0xc0, 0x1c0, 0x1c0, 0x1c0, 0x1c0,
    0x0, 0x0, 0x0, 0x1c2, 0x1c0, 0x1e0, 0xc0, 0xe0, 0x1c0, 0x1e0, 0x1c0, 0x1e0, 0x1c0, 0x1e0, 0x1e0, 0x1c0,
    0x0, 0x0, 0xc0, 0x1e0, 0x1e0, 0x1e0, 0xe0, 0xe0, 0xe0, 0x1e0, 0x1e0, 0x1f0, 0x1e0, 0x1e0, 0x1f0, 0x1e0,
    0x0, 0x0, 0x80, 0x3c0, 0x3c0, 0x3c0, 0x1e0, 0x1c0, 0x1e0, 0x1c0, 0x1e0, 0x3c0, 0x1e0, 0x3e0, 0x3f0, 0x3f0,
    0x0, 0x4, 0x1, 0x310, 0xf82, 0xf80, 0x1f80, 0x1fc2, 0x1fc0, 0x1f80, 0x3f80, 0x1f80, 0x1fe0, 0x1fe0, 0x1ff0, 0xbff0,
    0x5, 0x22, 0x9, 0x24, 0x1, 0x12, 0x0, 0x9, 0x20, 0x0, 0x0, 0xf0, 0xf0, 0x1f8, 0x1f8, 0x3f0,
    0x2f, 0x155, 0x17, 0x155, 0x15, 0x54a, 0x625, 0x512, 0x709, 0xf20, 0x605, 0xe10, 0xe00, 0x1c04, 0x3e00, 0x7e00,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfeff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xef7b, 0xcf39, 0xdf79, 0xcf7b,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xef7b, 0xdf79, 0xcf39, 0xdf7b, 0xe79,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xef7f, 0xec7b, 0xeef9, 0xeef1, 0xe7b, 0x8ef3, 0xce7b, 0xeff1, 0xeeff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xfffb, 0xef7b, 0xef63, 0xee77, 0x4f73, 0x8777, 0xc673, 0xef73, 0xefff, 0xfe77, 0xe773, 0x2ff7,
    0xffff, 0xffff, 0xffff, 0xff7b, 0xe73b, 0xf798, 0xe77b, 0x17b9, 0xc73b, 0xe333, 0xeffb, 0xf77f, 0xf7b3, 0xa7fb, 0x9ff9, 0xcfff,
    0xffff, 0xffff, 0xef7f, 0xee79, 0xee7b, 0xef78, 0xf7b, 0x867b, 0xe771, 0xfffb, 0xf73b, 0xe77b, 0xb7fb, 0x8ff9, 0xefff, 0xefff,
    0xffff, 0xffff, 0xdef7, 0x9ef7, 0xdcc7, 0x9ee7, 0x5ef7, 0xc67, 0x8ee7, 0xdef7, 0xdeff, 0xcde7, 0x5fd7, 0x3ff7, 0xbfff, 0x9fff,
    0xffff, 0xffff, 0x2cff, 0xcff, 0x1cff, 0x147f, 0x20ff, 0x90ff, 0xb0ff, 0x167f, 0x1cff, 0xc7f, 0x1c7f, 0x587f, 0x587f, 0xdcff,
    0xf3ff, 0xe3ff, 0xa31f, 0x803f, 0xb07f, 0x807f, 0xc1ff, 0xf1ff, 0xf1ff, 0xf1ff, 0xf1ff, 0xf1ff, 0xf1ff, 0xf1ff, 0xe0ff, 0xe0ff,
    0xff7f, 0xfe3f, 0xfe3f, 0xfe2f, 0xea07, 0xe603, 0xf407, 0xf01f, 0xfa3f, 0xfe7f, 0xfe3f, 0xfe7f, 0xfe3f, 0xfc3f, 0xfe1f, 0xfe0f,
    0xfffe, 0xfffc, 0xf7f8, 0xf3fc, 0xf3fc, 0xf390, 0xe390, 0xc1e0, 0xe1fc, 0xf1f8, 0xfbfc, 0xf1fc, 0xf1f8, 0xe1f8, 0xe3f0, 0xe1f0,
    0xffff, 0x7fff, 0x7fff, 0x3fef, 0x3fe7, 0x3fe7, 0x3fc5, 0x3fe0, 0x3fc1, 0x3fe5, 0x3fe7, 0x3fe7, 0x3fe7, 0x3fc7, 0x1fe3, 0x1fc3,
    0xffff, 0xfdff, 0xf8fe, 0xf8fc, 0xf8fc, 0xf8fe, 0xfcfc, 0xf8fc, 0xf8fc, 0xf8fc, 0xf0fc, 0xe1fe, 0x1fc, 0x1c, 0x1c, 0xe03c,
    0xffff, 0xffff, 0xff3f, 0xfe7f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe7f, 0xfc3f, 0xf03f, 0xaa3f, 0x1e3f, 0x3f, 0x3e,
    0xffff, 0xffe7, 0xffe3, 0xffc3, 0xff83, 0xffc3, 0xffc1, 0xffc3, 0xf1e3, 0xf9c1, 0xfc80, 0xfc01, 0xfe40, 0xffe0, 0x7e0, 0x1e0,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfebf, 0xf81f, 0xf00f, 0xf00f, 0xc007, 0x8001, 0xc003, 0xe003,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfc3f, 0xe007, 0xe003, 0xe007, 0xe007, 0xf00f, 0xf00f, 0xf00f,
    0x0, 0x0, 0xc30, 0x10, 0xc20, 0xc70, 0xe70, 0x8ff0, 0xcff0, 0xcff1, 0xcff0, 0xdff9, 0xfff8, 0xeff4, 0xfff8, 0xfffc,
    0x0, 0x18, 0x38, 0x1b8, 0x1f8, 0x3f8, 0x7f8, 0x7f8, 0xff8, 0x1ff0, 0xff8, 0xff0, 0x7f8, 0x3f0, 0x3f0, 0x3f0,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff8, 0x7e0, 0x8000, 0xf81f, 0xf81f, 0xf80f, 0xf00f, 0xf80f,
    0xffff, 0xffff, 0xf8ff, 0xf01f, 0xe00f, 0xe00f, 0xe007, 0xe007, 0xf003, 0xf80f, 0xfc3f, 0xfc3f, 0xfc3f, 0xfff7, 0xffe7, 0xffe7,
    0x0, 0x0, 0x3800, 0x3800, 0x1c08, 0x1c3c, 0x67e, 0x640, 0x660, 0x240, 0x3c0, 0x7e0, 0x7e0, 0x7f0, 0xff0, 0xff0,
    0x700, 0x380, 0x100, 0x1c0, 0x3e0, 0x7f0, 0x7f0, 0x7f0, 0x3f0, 0x3f8, 0x3f0, 0x1f8, 0x1f8, 0x1f8, 0x3f8, 0x3f8,
    0x0, 0x0, 0x100, 0x80, 0xc0, 0x1c0, 0xc0, 0x3c0, 0x3c0, 0x3c0, 0x1c0, 0xe0, 0x1e0, 0x1e0, 0x1e0, 0x1f0,
    0x0, 0x0, 0x0, 0x0, 0x30, 0x10, 0x98, 0xf0, 0x18, 0x18, 0x18, 0x18, 0x3c, 0x18, 0x10, 0x28,
    0x0, 0x0, 0x0, 0x0, 0x8, 0xc, 0x4, 0x7c, 0x6, 0x6, 0xe, 0x6, 0xe, 0xc, 0xa, 0x4,
    0x3000, 0x3800, 0x3800, 0x3200, 0x7100, 0xfd00, 0xfe80, 0xfa88, 0xf000, 0x3000, 0x3000, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x200, 0x1c0, 0x3c0, 0x180, 0x4baa, 0x300, 0x780, 0xf80, 0x780, 0x780, 0x100, 0x40, 0x40,
    0x603, 0x200, 0x200, 0x600, 0x300, 0x301, 0x9fe5, 0xffff, 0x39d2, 0x1c6, 0x83ee, 0x3fe, 0x3b8, 0x3f8, 0x1f8, 0x40fc,
    0x787, 0x703, 0x600, 0x700, 0x780, 0x781, 0xdff7, 0xffff, 0xbff7, 0xb991, 0x8380, 0x83c0, 0x780, 0xf80, 0x8384, 0x43ce,
    0xffff, 0x3ff7, 0xff2, 0xff8, 0xff0, 0xff0, 0x1ff0, 0xfe0, 0x3ff0, 0x3ff5, 0xffff, 0xf7f5, 0x4ff0, 0xfc0, 0x8fc0, 0x3c0,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0x7fff, 0x7fff, 0x3fff, 0x3fff, 0x3efe, 0x3e72, 0x3e7f, 0x7e7f, 0xfeff, 0xfe7f, 0xfe7f,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfeff, 0xfc7f, 0xfeff, 0xfeff, 0xfe7f, 0xfcff, 0xfc7f, 0xfdff, 0xffff, 0xfffe, 0xfffe,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0xfe7f, 0xfe7f, 0xff3f, 0xff7f, 0xfe7f, 0xff7f, 0xff3f, 0xff3f, 0xff9f, 0xffdf,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffbf, 0xfe9f, 0xff1f, 0xfe1f, 0xff3f, 0xff9f, 0xfe1f, 0xff1f, 0xff3f, 0xff1f, 0xfe9f, 0xfe1f,
    0xffff, 0xffff, 0xffff, 0xff6f, 0xff8f, 0xff87, 0xff47, 0xfe47, 0xff47, 0xff07, 0xfe07, 0xff0f, 0xff87, 0xfc07, 0xfe0f, 0xfc0f,
    0xffff, 0xffff, 0xffff, 0xff47, 0xff87, 0xff43, 0xff83, 0xfec3, 0xfe43, 0xff03, 0xfe03, 0xff07, 0xfe03, 0xfe03, 0xfe03, 0xfc03,
    0xffff, 0xffff, 0xffff, 0xffc7, 0xff07, 0xff83, 0xff43, 0xff43, 0xf983, 0xfcc7, 0xfc83, 0xfc07, 0xfc03, 0xfc03, 0xfc03, 0xfe03,
    0xffff, 0x7fff, 0x3fff, 0x7fc7, 0x7f07, 0xfe87, 0xf783, 0x7e83, 0x27c7, 0xa83, 0x207, 0x7, 0x1003, 0x7107, 0xf883, 0xf983,
    0xf3ff, 0xf3ff, 0xf1ff, 0xf38f, 0xf10f, 0xf907, 0xf907, 0xf187, 0xf187, 0xe00f, 0x8007, 0x800f, 0x8007, 0xc007, 0xf907, 0xf907,
    0xfe7f, 0xff3f, 0xfe7f, 0xfe3f, 0xff7f, 0xfe3f, 0xff7f, 0xfe3f, 0xfe3f, 0xfc3f, 0xf81f, 0xf00f, 0xf007, 0xf00f, 0xf81f, 0xfe7f,
    0xffdf, 0xff9f, 0xffcf, 0xff87, 0xffcf, 0xff07, 0xffc7, 0xfea7, 0xff27, 0xfe47, 0xff47, 0xffc7, 0xff83, 0xff83, 0xff83, 0xff81,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfefe, 0xff7e, 0xfefc, 0xfefc, 0xfe7a, 0xfffe, 0xfffe, 0xfffa, 0xffe1, 0xfffd,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfcff, 0xffff, 0xfcff, 0xfdff, 0xfcff, 0xfcff, 0xfcff, 0xfcff, 0xfdff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xfbff, 0xf3ff, 0xfbff, 0xf3ff, 0xfbff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf1ff, 0xf3ff, 0xe1ff, 0xf1ff,
    0xffff, 0xffff, 0xffff, 0xf3ff, 0xf3ff, 0xfbff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xe3ff, 0xf3ff, 0xe1ff, 0xe3f9,
    0xffff, 0xffff, 0xffff, 0xf7ff, 0xf3ff, 0xfbff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xe3ff, 0xf3ff, 0xe3e7, 0xe1e7,
    0xffff, 0xffff, 0xffff, 0xf7ff, 0xf3ff, 0xfbff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ff, 0xf3ef, 0xf3ef, 0xe3c7, 0xf3cf, 0xe3e7, 0xe1cf,
    0xffff, 0xffff, 0xffff, 0xf3ff, 0xfbff, 0xfbff, 0xf3ff, 0xf3cf, 0xf303, 0xf7cf, 0xf3ef, 0xf3ef, 0xf3ef, 0xe1c7, 0xf3ef, 0xe1cf,
    0xffff, 0xffff, 0xffff, 0xf7ff, 0xf3ff, 0xfbff, 0xf3df, 0xf3cf, 0xf30b, 0xf7c7, 0xf3ef, 0xf3ef, 0xe3ef, 0xf3c7, 0xe1ef, 0xf3c7,
    0xffff, 0xffff, 0xffff, 0xf7ff, 0xf3ff, 0xf3ff, 0xf7ef, 0xf3e7, 0xf7ef, 0xf3cf, 0xe7cf, 0xf3cf, 0xe3ef, 0xe3cf, 0xe3cf, 0xe3ef,
    0xffff, 0xffff, 0xffff, 0xf7ff, 0xf3ff, 0xf3ff, 0xf7f7, 0xf3e7, 0xf3e7, 0xf7ef, 0xe3cf, 0xe7cf, 0xe3cf, 0xe3ef, 0xe3cf, 0xe3ef,
    0xffff, 0xffff, 0xfbff, 0xf3ff, 0xf1ff, 0xf3ef, 0xf3cf, 0xf187, 0xf1c7, 0xf5cf, 0xf1cf, 0xe38f, 0xe387, 0xe38f, 0xe3cf, 0xe1cf,
    0xffff, 0xfbff, 0xf0ff, 0xf0ff, 0xf00f, 0xf09f, 0xf00f, 0xf80f, 0xf007, 0xf017, 0xf01f, 0xf03f, 0xf01f, 0xf01f, 0xf11f, 0xe01f,
    0xf5ff, 0xf1ff, 0xf0ff, 0xf09f, 0xf00f, 0xe08f, 0xf01f, 0xf80f, 0xf007, 0xf003, 0xe01f, 0xe01f, 0xf01f, 0xf21f, 0xf01f, 0xe00f,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0x4095, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfe7f, 0xf98f, 0xe3c7, 0xc183, 0xf1cf, 0xfd3f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xf01f, 0xc183, 0x3c0, 0x3c0, 0xc387, 0xf99f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xf000, 0xc000, 0x8000, 0x0, 0x1c0, 0x3e0, 0x7e0, 0x7e0, 0x7e0, 0xbe0, 0x1c3, 0x3, 0xf, 0x1f, 0x7f, 0x1ff,
    0x3fc, 0x3f8, 0x1f8, 0x1f0, 0xc0, 0x0, 0x0, 0x80, 0x380, 0x3c0, 0x7e0, 0x300, 0x300, 0x300, 0x200, 0x700,
    0x180, 0x380, 0x180, 0x180, 0x100, 0x0, 0x0, 0x180, 0x1e0, 0x3c0, 0x100, 0x80, 0x180, 0x180, 0x180, 0x1c0,
    0x180, 0x380, 0x180, 0x100, 0x0, 0x0, 0x180, 0x3c0, 0x380, 0x100, 0x180, 0x100, 0x180, 0x300, 0x180, 0x0,
    0x180, 0x180, 0x180, 0x0, 0x0, 0x1c0, 0x1c0, 0x380, 0x180, 0x180, 0x180, 0x180, 0x180, 0x100, 0x80, 0x0,
    0x100, 0x80, 0x0, 0x0, 0x80, 0xc0, 0x1e0, 0x180, 0x80, 0x180, 0x80, 0x180, 0x1c0, 0x80, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x1c0, 0x3c0, 0x380, 0x100, 0x180, 0x100, 0x180, 0x380, 0x100, 0x0, 0x0,
    0x0, 0x20, 0x70, 0x3f0, 0x7f0, 0x1f8, 0x1f8, 0xfc, 0x1c4, 0x1c4, 0xc0, 0x1c0, 0x1c0, 0x1e0, 0x1c0, 0x1c0,
    0x7ff, 0x3ff, 0xff, 0x1ff, 0x1ff, 0x1ff, 0xff, 0xef, 0xff7, 0x7e1, 0x7f2, 0x3e0, 0x3f0, 0x3f0, 0x3f0, 0x1f0,
    0x3ff, 0x3ff, 0xff, 0x2ff, 0xfff, 0xfff, 0x1def, 0x8ef, 0x4e3, 0x5f1, 0x5e0, 0x7f0, 0x3f0, 0x3f0, 0x1f0, 0x1f8,
    0x7, 0x7, 0x7, 0x1007, 0x1007, 0x3803, 0x3c03, 0x3c0b, 0x3fff, 0x3faf, 0x3e03, 0x3c03, 0x3807, 0x180f, 0x100b, 0xb,
    0x1e0, 0x3e0, 0x3f0, 0x3f8, 0x3fc, 0x3fc, 0x7ff, 0x3ff, 0x7ff, 0x3fb, 0x7f0, 0x3e0, 0x3c0, 0x300, 0x100, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x100, 0x100, 0x100, 0x100, 0x180, 0x380, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x100, 0x100, 0x300, 0x300, 0x780, 0x300, 0x300, 0x380, 0x380, 0x780, 0x780, 0x780, 0x200,
    0x0, 0x0, 0x0, 0x80, 0xc0, 0x180, 0x180, 0x1c0, 0x1c0, 0x180, 0x1c0, 0x1c0, 0x3c0, 0x3c0, 0x1c0, 0x140,
    0x0, 0x0, 0x0, 0x40, 0xc0, 0xc0, 0xc0, 0xe0, 0x1c0, 0xc0, 0xe0, 0xe0, 0xe0, 0x1e0, 0x1e0, 0x40,
    0x0, 0x0, 0x100, 0x300, 0x300, 0x7e0, 0x700, 0x180, 0x180, 0x3d0, 0x3f8, 0xff0, 0x340, 0x100, 0x100, 0x100,
    0x0, 0x0, 0x0, 0x300, 0x300, 0x300, 0x300, 0x380, 0x780, 0x700, 0x780, 0x700, 0x700, 0x780, 0x700, 0xf80,
    0x0, 0x0, 0x2c0, 0x3e0, 0x3e0, 0x3c0, 0x1c0, 0x3c0, 0x1c0, 0x3e0, 0x3e0, 0x3e0, 0x3e0, 0x7e0, 0x3f0, 0x3e0,
    0x0, 0x0, 0x140, 0x3f0, 0x3f0, 0x1e0, 0x1e0, 0x1c0, 0x1e0, 0x1e0, 0x3e0, 0x7e0, 0x7e0, 0x7e0, 0x5f0, 0x3e0,
    0x0, 0x0, 0x140, 0x7c0, 0x7c0, 0x780, 0xc7c0, 0xc9c0, 0x5380, 0x7fc0, 0x7fc0, 0x3be0, 0x23c0, 0x7e0, 0x3e0, 0x7e0,
    0x0, 0x0, 0xe000, 0xe800, 0xe000, 0xc000, 0xe000, 0xd000, 0xe000, 0xd000, 0xe400, 0xf000, 0xe800, 0xf000, 0xe000, 0xf800,
    0x0, 0x0, 0x380, 0x3c0, 0x3c0, 0x7c0, 0x3c0, 0x3c0, 0x3c0, 0x7c0, 0x7e0, 0xfe0, 0xfc0, 0xbe0, 0x7c0, 0x7e0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x7c0, 0xfe0, 0x7c0, 0x780, 0x3c0, 0x380, 0x3c0, 0x7c0, 0xfc0, 0xfe0, 0x1bc0, 0x17c0, 0xfc0,
    0x0, 0xe000, 0xf800, 0xf800, 0xf800, 0xf800, 0xf000, 0xf000, 0xf000, 0xe000, 0xe000, 0xf000, 0xf000, 0xf000, 0xf000, 0xf000,
    0xe00f, 0xf01f, 0xf83f, 0xfc3f, 0xf83f, 0xf01f, 0xf00f, 0xf007, 0xf007, 0xe00f, 0xe003, 0x8003, 0xc007, 0xc007, 0xe007, 0xf00f,
    0xf03f, 0xe03f, 0xe03f, 0xe03f, 0xe01f, 0xf01f, 0xf01f, 0xf01f, 0xf81f, 0xf01f, 0xf81f, 0xf81f, 0xf81f, 0xfc1f, 0xfc1f, 0xfc1f,
    0x3ff, 0x1ff, 0xff, 0x403f, 0x703f, 0x601f, 0x701f, 0x601f, 0xf00f, 0xe00f, 0xf00f, 0xf8cf, 0xf06f, 0xf8ff, 0xf8ff, 0xf8ff,
    0xffff, 0xefff, 0xe3ff, 0xc3ff, 0xc3ff, 0xe1ff, 0xe0ff, 0x7207, 0x2007, 0x3, 0x4001, 0x301, 0x8603, 0xc303, 0xc301, 0xc181,
    0xffff, 0xff7f, 0xfe3f, 0xfe1f, 0xfe1f, 0xfe1f, 0xff0f, 0xf727, 0xf301, 0xf100, 0xf000, 0xf810, 0xfc30, 0xfc30, 0xfe18, 0xfe18,
    0xffff, 0xff3f, 0xff1f, 0xff0f, 0xff0f, 0xff0f, 0xff8b, 0xff91, 0xf980, 0xf880, 0xf800, 0xfc08, 0xfe18, 0xff1c, 0xff0c, 0xff0c,
    0xffff, 0xff3f, 0xff1f, 0xff0f, 0xff0f, 0xff0f, 0xff8b, 0xff91, 0xfb80, 0xf880, 0xf880, 0xfc08, 0xfe18, 0xfe0c, 0xff0c, 0xff0c,
    0xffff, 0xffcf, 0xff87, 0xff87, 0xff87, 0xff87, 0xffc3, 0xffc1, 0xf580, 0xfa80, 0xfa00, 0xf808, 0xfc1c, 0xfe0c, 0xff1c, 0xff0c,
    0xffff, 0xffcf, 0xff8f, 0xff87, 0xff87, 0xff87, 0xff83, 0xffc3, 0xfc80, 0xfe80, 0xe600, 0xf208, 0xf818, 0xfc08, 0xff1c, 0xff0c,
    0xfff1, 0xffc1, 0xffc0, 0xffc0, 0xffc0, 0xfde0, 0xfcc0, 0xfe60, 0xfef0, 0xfee0, 0xfc80, 0xfe00, 0xfc00, 0xfe80, 0xffc0, 0xffc3,
    0xbfff, 0xc7ff, 0xf9ff, 0xfeff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfdff, 0xfdfe, 0xfe3e, 0xfc7f, 0xfc3f, 0xfe3f, 0xff1f, 0xff9f,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff3f, 0xfcff, 0xf7ff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffbf, 0xffdf, 0xffdf, 0xffdf, 0xffcf, 0xffef, 0xffef, 0xffef, 0xfff7, 0xfff7, 0xfff3, 0xfff7, 0xfffb,
    0xffff, 0xffff, 0xf7ff, 0xfbff, 0xf9ff, 0xfcff, 0xfe7f, 0xfe1f, 0xff00, 0xff80, 0xffc0, 0xffc0, 0xffc0, 0xffe0, 0xffe0, 0xffe0,
    0xffbf, 0xffbf, 0xffbf, 0xfd3f, 0xfe1f, 0xfc1f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xfc3f, 0xf23f, 0xf03f, 0xe01f, 0xe03f, 0xc01f,
    0xfdff, 0xfdff, 0xfdff, 0xf8ff, 0xf87f, 0xf8ff, 0xf87f, 0xf87f, 0xc0ff, 0x807f, 0x807f, 0x807f, 0xc03f, 0xfc3f, 0xfc3f, 0xfa3f,
    0xffff, 0xffff, 0xffe7, 0xe7df, 0xc30f, 0xc00f, 0xe00f, 0xe01f, 0xf71f, 0xfa1f, 0xf83f, 0xfa1f, 0xfc1f, 0xfe0f, 0xfc5f, 0xfc1f,
    0xffff, 0xffff, 0xf7f7, 0xe3e7, 0xe11f, 0xe00f, 0xe00f, 0xf10f, 0xf71f, 0xfa1f, 0xf83f, 0xfa1f, 0xfc1f, 0xfe0f, 0xfc2f, 0xfc1f,
    0xffff, 0xffff, 0xf3fb, 0xe3f7, 0xe18f, 0xe00f, 0xf007, 0xf90f, 0xf71f, 0xfa1f, 0xf81f, 0xfa1f, 0xfc1f, 0xfc4f, 0xfe4f, 0xfc5f,
    0xffff, 0xffff, 0xf3ff, 0xe3f3, 0xe1d7, 0xf00f, 0xf007, 0xf80f, 0xf30f, 0xfb1f, 0xf81f, 0xf81f, 0xfe1f, 0xfc4f, 0xfc4f, 0xfc4f,
    0xffff, 0xffff, 0xf3ff, 0xf1fb, 0xe1f3, 0xf08f, 0xf807, 0xf007, 0xfb0f, 0xfb0f, 0xf81f, 0xfa1f, 0xfc1f, 0xfc1f, 0xfccf, 0xfc4f,
    0xffff, 0xf7ff, 0xf1ff, 0xe1fd, 0xe0fb, 0xf083, 0xf88f, 0xf307, 0xfb07, 0xfb0f, 0xf81f, 0xfc1f, 0xfe1f, 0xf81f, 0xfe4f, 0xfc4f,
    0xf8ff, 0xf8ff, 0xf87f, 0xf87f, 0xf8f7, 0xfb8f, 0xfb03, 0xfb0f, 0xfc07, 0xfe0f, 0xfb0f, 0xfe1f, 0xfe1f, 0xf60f, 0xfe0f, 0xfe1f,
    0xf8ff, 0xf8ff, 0xfc7f, 0xf87f, 0xf877, 0xfb0f, 0xfb0f, 0xfb07, 0xf90f, 0xfe0f, 0xfe0f, 0xfe1f, 0xfa1f, 0xfe3f, 0xfc1f, 0xfe1f,
    0xfc7f, 0xfc7f, 0xf87f, 0xf87f, 0xf87f, 0xfa93, 0xfb85, 0xf901, 0xf907, 0xfe03, 0xfe07, 0xfa07, 0xfe0f, 0xfc1f, 0xf41f, 0xfc1f,
    0xe03f, 0xe01f, 0xe43f, 0xe43f, 0xf67f, 0xe3c3, 0xe7c3, 0xe380, 0xf300, 0xe900, 0xe800, 0xfc00, 0xde00, 0xee00, 0xde00, 0xfc00,
    0x7c1f, 0x7e3f, 0x7f3e, 0x7f7c, 0x3ffc, 0x7f78, 0x3fe4, 0x7fe0, 0x3f80, 0x1f80, 0x1f00, 0xe00, 0x400, 0x200, 0x0, 0x8000,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0xfe7f, 0xfe7f, 0xff7f, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfe7f, 0xfe7f, 0xff7f, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0xfeff, 0xfe7f, 0xfe7f, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0xfeff, 0xff7f, 0xfe7f, 0xfe7f, 0xff7f, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xff7f, 0xff7f, 0xff7f, 0xfe7f, 0xff7f, 0xfe7f, 0xff3f, 0xfe3f, 0xfe3f, 0xfe3f, 0xff7f,
    0xffff, 0xffff, 0xff1f, 0xff1f, 0xff9f, 0xff9f, 0xfebf, 0xfe9f, 0xfc3f, 0xfebf, 0xfe1f, 0xfc9f, 0xff1f, 0xff0f, 0xff0f, 0xff0f,
    0xffff, 0xffff, 0xff1f, 0xff1f, 0xff1f, 0xff9f, 0xffbf, 0xfd1f, 0xfd3f, 0xfc3f, 0xfc9f, 0xfc9f, 0xfd1f, 0xff1f, 0xff0f, 0xff0f,
    0xffff, 0xff9f, 0xff0f, 0xff1f, 0xff8f, 0xff8f, 0xff9f, 0xfd1f, 0xfb1f, 0xf93f, 0xf83f, 0xf91f, 0xfd1f, 0xf91f, 0xf81f, 0xff0f,
    0xffc7, 0xff87, 0xff87, 0xff87, 0xff87, 0xffc7, 0xff87, 0xff8f, 0xff0f, 0xfb1f, 0xfb1f, 0xf31f, 0xf01f, 0xf81f, 0xf10f, 0xf90f,
    0xffc3, 0xffc1, 0xffc3, 0xffc3, 0xffe3, 0xffc3, 0xff87, 0xff87, 0xff8f, 0xff8f, 0xfb8f, 0xfb8f, 0xf30f, 0xf807, 0xf007, 0xf187,
    0xfff0, 0xfff0, 0xfff0, 0xffe1, 0xffe1, 0xffe3, 0xffe3, 0xfde3, 0xfdc3, 0xf9c1, 0xfc81, 0xf801, 0xf860, 0xfc40, 0xfe20, 0xfe00,
    0xfffc, 0xfff8, 0xfff0, 0xffe2, 0xfefa, 0xfc7c, 0xfe3c, 0xfe3c, 0xff00, 0xff80, 0xff80, 0xffc0, 0xffc0, 0xfff0, 0xfff0, 0xfff0,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfdff, 0xfcff, 0xfc2f, 0xfe0f, 0xff07, 0xff8f, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xf8ff, 0xfcff, 0xfc1f, 0xfe3f, 0xff07, 0xff7f, 0xffaf, 0xffff,
    0xffff, 0xffff, 0xffff, 0xfdff, 0xfcff, 0xfcff, 0xfeff, 0xfc7f, 0xfe7f, 0xff3f, 0xfe1f, 0xfe1f, 0xfe3f, 0xff9f, 0xffdf, 0xffff,
    0xffff, 0xffff, 0xffff, 0xfcff, 0xfe7f, 0xfe7f, 0xfc7f, 0xfe7f, 0xfe7f, 0xfe7f, 0xfc3f, 0xfc3f, 0xfcff, 0xff5f, 0xfebf, 0xffff,
    0xffff, 0xff7f, 0xfe7f, 0xfe7f, 0xff3f, 0xfe3f, 0xff1f, 0xfe3f, 0xff3f, 0xfe3f, 0xfe1f, 0xf81f, 0xf80f, 0xf81f, 0xfe5f, 0xffdf,
    0xffff, 0xff7f, 0xfe1f, 0xff1f, 0xff0f, 0xff1f, 0xff8f, 0xff07, 0xf803, 0xfe03, 0xff83, 0xff8f, 0xff87, 0xff0f, 0xff07, 0xfe03,
    0xffff, 0xffff, 0xff9f, 0xff1f, 0xff0f, 0xff87, 0xe78f, 0xf347, 0xfc03, 0xfe81, 0xfc81, 0xfe01, 0xffc3, 0xffc7, 0xffc3, 0xffc3,
    0xfff8, 0xfff0, 0xfff8, 0xfff8, 0xfff8, 0xfffc, 0xf3fc, 0xf9fe, 0xfc20, 0xfe00, 0xffd4, 0xfffe, 0xfffc, 0xfffe, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xf9ff, 0xfc3f, 0xfc03, 0xfe80, 0xffc0, 0xfff4, 0xfffe, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfffb, 0xfffc, 0xfffe, 0xffff,
    0xff0f, 0xfc1f, 0xf83f, 0xfc7f, 0xfc7f, 0xfc7f, 0xf8ff, 0xfcff, 0xf8ff, 0xffff, 0xfeff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xfeff, 0xfc7f, 0xfcff, 0xfeff, 0xfcff, 0xfdff, 0xfdff, 0xfdff, 0xfdff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfeff, 0xffff, 0xfd7f, 0xff7f, 0xabaa, 0x100, 0x300, 0x300, 0x300,
    0xf01f, 0xd01b, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x40, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x8, 0x0, 0x0, 0x100,
    0x0, 0x0, 0x0, 0x0, 0x4000, 0xe000, 0xe000, 0xe000, 0xe000, 0xc000, 0xc000, 0xc000, 0xc000, 0xc000, 0xc000, 0x0,
    0x0, 0x0, 0x1e00, 0x3f00, 0x3f00, 0x3f00, 0x7e00, 0x3e00, 0x1c00, 0x800, 0x1c00, 0x1800, 0x3c00, 0x7800, 0x7c00, 0x7c00,
    0x200, 0xf00, 0x1f80, 0x1f00, 0x3f00, 0x3e00, 0x3c00, 0x3c00, 0xf00, 0xc00, 0xc00, 0x1e00, 0x7c00, 0x7c00, 0x7e00, 0x1c00,
    0x0, 0xe00, 0x1e00, 0x3c00, 0x3e00, 0x3c00, 0x7600, 0x2600, 0x700, 0x600, 0x600, 0xe00, 0x1e00, 0x3e00, 0x7e00, 0x1e00,
    0x0, 0x700, 0xe00, 0x1e00, 0x1f00, 0x3e00, 0x1a00, 0x3300, 0x1380, 0x300, 0x300, 0x700, 0xf00, 0x1f00, 0x3f00, 0x1f00,
    0x0, 0x1e0, 0x3f0, 0x3f8, 0x3f8, 0x250, 0x340, 0x380, 0x180, 0x180, 0x300, 0x380, 0xf00, 0x1f80, 0x1f80, 0xf80,
    0x0, 0x0, 0x0, 0x100, 0x180, 0x300, 0x180, 0x1a0, 0x1f0, 0x1f8, 0x1f0, 0x3b0, 0x380, 0xf80, 0xf80, 0x780,
    0x0, 0x0, 0x0, 0x80, 0xc0, 0x180, 0x80, 0xc0, 0x80, 0xc0, 0x1e0, 0x198, 0x3c4, 0x7c0, 0x780, 0x7c0,
    0x0, 0x0, 0x20, 0x40, 0xc0, 0xc0, 0x40, 0xc0, 0x40, 0xc0, 0xc0, 0x1e0, 0x3c0, 0x7e0, 0x3e0, 0x1e0,
    0x0, 0x0, 0x180, 0x180, 0x180, 0x380, 0xff80, 0xfec0, 0xc0, 0xc0, 0xc0, 0xe0, 0x1c0, 0x1e0, 0x7e0, 0xfe0,
    0x0, 0x0, 0x0, 0x18, 0x18, 0x3c, 0x1c, 0x298, 0xfffc, 0x481c, 0xe, 0xe, 0xf, 0xc, 0x1e, 0x1e,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3, 0x7fff, 0xffff, 0xb84, 0x0, 0x0, 0x0, 0x0, 0x0,
    0xe3, 0xe7, 0x1c3, 0x3cf, 0x383, 0x382, 0x302, 0x606, 0x60c, 0x600, 0x1ffc, 0xffff, 0x2bff, 0x0, 0x0, 0x0,
    0x3dc, 0x3ce, 0xcc, 0xdc, 0xcc, 0x1dc, 0x198, 0x398, 0x738, 0x738, 0x738, 0xfff8, 0xfffc, 0xf, 0x1, 0x0,
    0x3c, 0x3c, 0x7c, 0x3e, 0x3e, 0x3c, 0x2e, 0x2e, 0xa3e, 0x35ef, 0xc03f, 0x801f, 0x801f, 0x801f, 0xc01f, 0xc01f,
    0x0, 0x0, 0x0, 0xc, 0xe41c, 0x7b9c, 0x607c, 0xe03c, 0x403c, 0xe03c, 0xc03c, 0x407e, 0xc03a, 0x4031, 0x4039, 0x6079,
    0x0, 0x0, 0xe0, 0xe0, 0x1c0, 0x5de0, 0x60e0, 0x60f0, 0x6078, 0x60ec, 0x6072, 0x20c2, 0x60c0, 0x20e1, 0x31c0, 0x21e0,
    0x0, 0x0, 0x180, 0x380, 0x180, 0x780, 0x5580, 0xe1c0, 0xc1f0, 0xc1d0, 0xc0f8, 0xc184, 0xc180, 0xc182, 0x43c2, 0x4380,
    0x0, 0x0, 0x380, 0x380, 0x380, 0x380, 0x3f80, 0xc180, 0x81e0, 0x1e0, 0x81d8, 0x1f8, 0x8184, 0x182, 0x8380, 0x3c3,
    0x0, 0x300, 0x780, 0x780, 0x780, 0xf80, 0x5700, 0xdf00, 0x780, 0x3e0, 0x3e0, 0x3f8, 0x3d8, 0x1fc, 0x392, 0x382,
    0x200, 0x780, 0xf00, 0xf80, 0xf00, 0xf00, 0xff00, 0x1f00, 0xf00, 0x7c0, 0x3e0, 0x7f8, 0x3c8, 0x3fc, 0x3f6, 0x382,
    0x0, 0x780, 0xf00, 0xf80, 0xf80, 0x4f00, 0xff80, 0xf00, 0xf00, 0x7c0, 0x3e0, 0x3f0, 0x3e8, 0x3fc, 0x3fc, 0x392,
    0x80, 0x1c0, 0x3e0, 0x3e0, 0x7e0, 0xe7c0, 0x3fc0, 0x380, 0x3c0, 0x1e0, 0x3f0, 0x1f8, 0x1ec, 0x1f4, 0x1fe, 0x1da,
    0x7e, 0xfc, 0xfc, 0x8f8, 0xfff8, 0xc1f8, 0x70, 0x78, 0x7e, 0x7b, 0x7f, 0x7f, 0x7e, 0x7f, 0x7f, 0x78,
    0xe00f, 0xe00f, 0xe00f, 0xe007, 0xe007, 0xc007, 0xe003, 0xc007, 0xc003, 0xc007, 0xc003, 0xc007, 0x8003, 0xc007, 0x8007, 0xc00f,
    0xf000, 0xe000, 0xe000, 0xe000, 0xe000, 0xe000, 0xe000, 0xe000, 0xe000, 0xe000, 0x6000, 0x6000, 0x6000, 0x7000, 0x3000, 0x3000,
    0x1c00, 0x1c00, 0xc00, 0xc00, 0xc00, 0xe00, 0x400, 0x600, 0x200, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x200, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x180, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x40, 0x810, 0x910, 0x7e0, 0x7e0, 0x1428, 0x13c4, 0x2388, 0x1008, 0x820,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x100, 0x47c2, 0x3e0, 0x4102,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x180, 0x180, 0x100, 0x180, 0x180, 0x180, 0x7c0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x100, 0x180, 0x180, 0x180, 0x180, 0x180, 0x180, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x180, 0x180, 0x180, 0x180, 0x180, 0x180, 0x3c0, 0x180, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x180, 0x180, 0x180, 0x180, 0x180, 0x180, 0x3c0, 0x180, 0x3c0, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x180, 0x180, 0x180, 0x180, 0x180, 0x180, 0x3c0, 0x380, 0x1c0, 0x380, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x180, 0x380, 0x180, 0x100, 0x380, 0x180, 0x380, 0x3c0, 0x7c0, 0x380, 0x3c0, 0x3c0,
    0x0, 0x0, 0x0, 0x0, 0x780, 0x700, 0x300, 0x300, 0x380, 0x780, 0x7c0, 0x5c0, 0xdc0, 0x1b80, 0x3c0, 0x380,
    0x0, 0x0, 0x0, 0x100, 0xf80, 0x700, 0x780, 0x700, 0x380, 0x380, 0x7c0, 0x7c0, 0x7c0, 0xfc0, 0xfc0, 0x1dc0,
    0x0, 0x0, 0x0, 0x1e0, 0x1e0, 0xf0, 0xe0, 0x1e0, 0x1f0, 0x1f0, 0xf8, 0x1f8, 0x3f8, 0x3fc, 0x3f8, 0x3f8,
    0x340, 0x240, 0x240, 0x240, 0x3c0, 0x240, 0x240, 0x340, 0x3c0, 0x3c0, 0x3c0, 0x3c1, 0x3c1, 0x3c1, 0x3c3, 0x3c1,
    0x1e38, 0x1e78, 0x3e7c, 0x1f78, 0x1e38, 0x3a18, 0x1e78, 0x1e7c, 0x3f78, 0x1ff8, 0x1ff8, 0x3ffc, 0x1ff8, 0x1ff8, 0x3ff8, 0x1ffc,
    0xfe3f, 0xfe0f, 0xfe1f, 0xfe1f, 0xfe3f, 0xfe1f, 0xfd1f, 0xfb3f, 0xfa1f, 0xfa1f, 0xf7df, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
    0xfe1e, 0xfe1e, 0xfe0f, 0xfe0e, 0xfe0e, 0xfe9e, 0xfc8b, 0xfd06, 0xfb02, 0xfa07, 0xfb7e, 0xfbfe, 0xfbff, 0xfffe, 0xfffe, 0xffff,
    0xe3f8, 0xe3f0, 0xe3f8, 0xf3f0, 0xe1f8, 0xe1f0, 0xe1f8, 0xc1f0, 0xeff8, 0xdff0, 0xfff8, 0xfff0, 0xfff8, 0xfff0, 0xfff8, 0xfff0,
    0x8f80, 0xdf80, 0x9f80, 0x8f80, 0xcf80, 0x9f80, 0x9f80, 0xff80, 0xff80, 0xff80, 0xff83, 0xff86, 0xff8f, 0xff87, 0xff86, 0xff83,
    0x9f00, 0x9f00, 0xbf00, 0x9f00, 0x9f00, 0xdf00, 0xbf00, 0xff00, 0xff00, 0xff02, 0xff02, 0xff06, 0xff06, 0xff06, 0xff02, 0xff06,
    0x9f00, 0x9f00, 0xbf00, 0x9f00, 0x9f00, 0xbf00, 0xbf00, 0xff00, 0xff00, 0xff02, 0xff04, 0xff06, 0xff06, 0xff06, 0xff02, 0xff02,
    0x9f00, 0x9f00, 0x9f00, 0xbf00, 0x9f00, 0x9f00, 0xbf00, 0xff00, 0xff00, 0xff02, 0xff04, 0xff06, 0xff06, 0xff02, 0xff02, 0xff02,
    0x1f00, 0x3f00, 0x3f00, 0x3f00, 0xbf00, 0x1f00, 0x1f00, 0xff00, 0xff00, 0xff02, 0xff02, 0xff06, 0xff07, 0xff02, 0xff03, 0xff03,
    0xff00, 0xff00, 0xff00, 0x3f00, 0x9f00, 0x6f00, 0x7700, 0x3f00, 0xff00, 0xff00, 0xff00, 0xff04, 0xff0f, 0xff0f, 0xff00, 0xff01,
    0x38, 0x138, 0x718, 0xf90, 0x3f10, 0xffe0, 0xffc0, 0xff80, 0xfe00, 0xf800, 0xf982, 0xf187, 0xf1df, 0xe1ff, 0xe0ff, 0xe07f,
    0xf01e, 0xf00e, 0xf007, 0xf006, 0xf806, 0xf606, 0xef46, 0xdf66, 0x9f04, 0xbb04, 0x9988, 0xbf80, 0x1fe0, 0x9ff0, 0x9ff8, 0x8ff8,
    0xdf87, 0xbfc7, 0x3dc3, 0x7cc1, 0x7dc1, 0x7fc1, 0x7f81, 0xff81, 0x7e01, 0x7c01, 0x7c01, 0x7c41, 0x78c3, 0x3c43, 0x1c04, 0x1c04,
    0xfc, 0x7c, 0x7e, 0x847e, 0xc7f, 0x47f, 0x7f, 0xff, 0xff, 0x1ff, 0x1df, 0x81ce, 0x81de, 0x81ff, 0xc1ff, 0xc0ff,
    0xbf83, 0x7fc1, 0x79c1, 0xf9c0, 0xfbc0, 0xff80, 0xff80, 0xff00, 0xfe00, 0xfe00, 0xfc00, 0xfc40, 0xfc60, 0x7c61, 0x7c01, 0x3c02,
    0x800e, 0x18f, 0x18f, 0x10f, 0xf, 0x1f, 0x1f, 0x7f, 0x1ff, 0x7ff, 0x7ff, 0xfff, 0xe7f, 0xe7f, 0xe7f, 0x8ffe,
    0xfffe, 0xff9e, 0xff9e, 0xff9c, 0xffde, 0xfffc, 0xfffc, 0xf2f8, 0xe040, 0xc000, 0xc000, 0x8000, 0x8600, 0x8600, 0x8400, 0x8000,
    0x41, 0x60, 0xe1, 0x1, 0x1, 0x1, 0x3, 0xc07, 0x1f97, 0x3fff, 0x7fff, 0x7fff, 0x79ff, 0x78ff, 0x79ff, 0x7dff,
    0xff00, 0xff00, 0xff00, 0xff00, 0xff80, 0xff00, 0xef0c, 0xcf0c, 0xc70c, 0xce00, 0xff00, 0xfe00, 0xff00, 0xfe00, 0xff00, 0xff00,
    0xf800, 0xf800, 0xf800, 0xf800, 0xf800, 0xf800, 0x7860, 0x7874, 0x78fc, 0x7800, 0xf800, 0xf800, 0xf800, 0xf800, 0xf800, 0xf800,
    0xe000, 0xe000, 0xe000, 0xe000, 0xe000, 0xe040, 0xe0c0, 0xe060, 0xe060, 0xe6fc, 0xe028, 0xe000, 0xe000, 0xe000, 0xe000, 0xe000,
    0xf000, 0xe000, 0xf000, 0xe000, 0xf000, 0xe000, 0xf020, 0xe020, 0xf030, 0xe130, 0xf078, 0xe01e, 0xf002, 0xe000, 0xf000, 0xe000,
    0xff02, 0xfe06, 0xff36, 0xff0f, 0xfe03, 0xff00, 0xcf00, 0x8e00, 0x8f00, 0xdf00, 0xfe00, 0xff00, 0xff00, 0xfe00, 0xff00, 0xff00,
    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xfe7f, 0xfe3f, 0xfe1f, 0xa83f, 0x3f, 0xff, 0x1ff, 0x1ff, 0x1ff, 0x1ff, 0xff,
    0xffff, 0xffff, 0xf9ff, 0xf1ff, 0xf0ff, 0xf0ff, 0xf1ff, 0xf1ff, 0xf1ef, 0xf8ef, 0xf80f, 0xf81f, 0xf91f, 0xf81f, 0xf11f, 0xf93f,
    0xffff, 0xffff, 0xffff, 0xfc7f, 0xf87f, 0xf87f, 0xf8ff, 0xf8ff, 0xfcff, 0xfc9f, 0xfc5f, 0xfc3f, 0xfc1f, 0xfc1f, 0xfc1f, 0xf81f,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
};

int main() {
    unsigned *p = frames;
    unsigned row, bits;
    int x, y, y_end, color;

    for (;;) {
        for (y = 0; y < 256;) {
            // one row of blocks is the same 16 times over
            row = *p++;
            for (y_end = y + 16; y < y_end; y++) {
                bits = row;
                x = 0;
                do {
                    color = (int)bits < 0 ? 7 : 0;
                    bits <<= 1;
                    do pixel(x, y, color);
                    while (++x & 15);
                } while (x < 256);
            }
            out(0, (unsigned)(p - frames) >> 4);
        }
        // about 7 frames per second
        for (x = 320; x; x--) stall(0xFFFF);
        // after the last frame, start again
        if (p == frames + sizeof(frames)) p = frames;
    }
}
`,Se=`// Blocks: a falling-block puzzle. Fit the pieces together; every full row disappears.
// The C version of blocks.asm.
//
// Input port 0: game controller, d-pad 1 (bits 0-3):
//               left / right move the piece, up turns it, down drops it faster.
//               After the game is over, release everything and press any button to play again.
// Output port 0: score.    Output port 1: rows cleared.
//
// Run it in real time: the game is paced with stall(), which takes no time in unlimited mode.
//
// The whole screen is a grid of 32 x 32 squares of 8 pixels, kept in \`board\`, one word per
// square (0 = empty, otherwise its colour). A square's number is y * 32 + x.
// The well is 12 squares wide and 24 deep (columns 3-14, rows 4-27), with a wall around it
// that is simply more non-empty squares, so a piece can never leave the well.
//
// A piece is a word: 16 bits for a 4 x 4 block of squares, top bit first, row by row.
// There are 12 pieces, each stored in its 4 orientations.

#define WALL_COLOR 5
#define TEXT_COLOR 12
#define NUMBER_COLOR 7

enum { UP = 1, DOWN = 2, LEFT = 4, RIGHT = 8 };

// Squares of the board
#define ROW 32
#define WELL_TOP (4 * ROW + 3)          // row 4, column 3
#define WELL_BOTTOM (27 * ROW + 3)      // row 27, column 3
#define START (4 * ROW + 7)             // where a new piece appears
#define PREVIEW (20 * ROW + 18)         // where the piece after it is shown

// A 3x5 pixel font: 15 pixels from the top bit down, row by row, and a 1 in the lowest bit
// that marks the end. Characters 0-9 are the digits, then A = 10 to Z = 35.
unsigned font[36] = {
    0xF6DF, 0x592F, 0xE7CF, 0xE79F,     // 0 1 2 3
    0xB793, 0xF39F, 0xF3DF, 0xE493,     // 4 5 6 7
    0xF7DF, 0xF79F, 0xF7DB, 0xD75D,     // 8 9 A B
    0xF24F, 0xD6DD, 0xF3CF, 0xF3C9,     // C D E F
    0xF2DF, 0xB7DB, 0xE92F, 0x24DF,     // G H I J
    0xB75B, 0x924F, 0xBFDB, 0xD6DB,     // K L M N
    0x56D5, 0xF7C9, 0xF6F3, 0xF75B,     // O P Q R
    0x711D, 0xE925, 0xB6DF, 0xB6D5,     // S T U V
    0xB7FB, 0xB55B, 0xB525, 0xE54F      // W X Y Z
};

unsigned pieces[12][4] = {
    {0xC000, 0x8800, 0xC000, 0x8800},   // two in a row
    {0x0E00, 0x4440, 0x0E00, 0x4440},   // three in a row
    {0x8C00, 0xC800, 0xC400, 0x4C00},   // small corner
    {0x0F00, 0x4444, 0x0F00, 0x4444},   // four in a row
    {0xCC00, 0xCC00, 0xCC00, 0xCC00},   // square
    {0xE400, 0x4C40, 0x4E00, 0x8C80},   // T
    {0x88C0, 0xE800, 0xC440, 0x2E00},   // L
    {0x44C0, 0x8E00, 0xC880, 0xE200},   // J
    {0x6C00, 0x8C40, 0x6C00, 0x8C40},   // S
    {0xC600, 0x4C80, 0xC600, 0x4C80},   // Z
    {0x4E40, 0x4E40, 0x4E40, 0x4E40},   // plus
    {0xAE00, 0xC8C0, 0xEA00, 0xC4C0}    // U
};

int piece_colors[12] = {12, 11, 10, 9, 8, 14, 13, 15, 7, 6, 4, 3};

int board[32 * ROW];

// The falling piece: which one, which way round, and the square of its top left corner
int type, rot, pos;
int next;                       // the piece that comes after it

unsigned score, rows, level;
int period;                     // frames between two steps down
int gravity;                    // frames since the last step down
int held;                       // the buttons that were down last frame
int repeat;                     // frames since the buttons last changed
unsigned rng = 0x1D2B;

int text_x, text_y, text_color; // where the next character goes, and its colour

// Draw a square of the board in a colour: 7x7 pixels, leaving a 1 pixel gap between squares
void draw_cell(int cell, int color) {
    int x = ((cell & 31) << 3) + 1;
    int y = ((cell >> 5) << 3) + 1;
    do {
        do pixel(x, y, color);
        while (++x & 7);
        x -= 7;
    } while (++y & 7);
}

// Draw a piece in a colour with its top left corner on a square
void draw_piece(unsigned piece, int cell, int color) {
    int k = 4;
    for (;;) {
        if ((int)piece < 0) draw_cell(cell, color);     // the top bit is the next square
        piece <<= 1;
        if (!piece) return;                             // no squares left
        cell++;
        if (!--k) {                                     // next row of the piece
            k = 4;
            cell += ROW - 4;
        }
    }
}

// Does a piece with its top left corner on a square overlap anything on the board?
int overlaps(unsigned piece, int cell) {
    int k = 4;
    for (;;) {
        if ((int)piece < 0 && board[cell]) return 1;
        piece <<= 1;
        if (!piece) return 0;
        cell++;
        if (!--k) {
            k = 4;
            cell += ROW - 4;
        }
    }
}

// The same three things for the falling piece, where it is now
int blocked() {
    return overlaps(pieces[type][rot], pos);
}
void erase_piece() {
    draw_piece(pieces[type][rot], pos, 0);
}
void show_piece() {
    draw_piece(pieces[type][rot], pos, piece_colors[type]);
}

// A random piece, 0 to 11
int random_piece() {
    unsigned r = rng;
    if (!r) r = 0xACE1;         // the random number generator must never be 0
    do {
        r ^= r << 7;            // 16-bit xorshift
        r ^= r >> 9;
        r ^= r << 8;
    } while ((r & 15) >= 12);
    rng = r;
    return r & 15;
}

// Draw a character at the text position and move that on to the next character.
// text_x must be 2 more than a multiple of 8.
void put_char(int ch) {
    unsigned bits = font[ch];
    int x = text_x, y = text_y, ink = text_color;
    int c;
    do {
        c = (int)bits < 0 ? ink : 0;    // the top bit is the next font pixel
        bits <<= 1;
        pixel(x, y, c);
        pixel(x + 1, y, c);
        pixel(x, y + 1, c);
        pixel(x + 1, y + 1, c);
        x += 2;
        if (!(x & 7)) {         // start the next row of the character
            x -= 6;
            y += 2;
        }
    } while (bits << 1);        // done when only the marker bit is left, at the top
    text_x += 8;
}

// Print text made of capital letters
void put_string(int x, int y, char *s) {
    text_x = x;
    text_y = y;
    while (*s) put_char(*s++ - 'A' + 10);
}

// Print a number as 5 decimal digits
void put_number(int x, int y, unsigned n) {
    unsigned power;
    text_x = x;
    text_y = y;
    for (power = 10000; power; power /= 10) {
        put_char(n / power);
        n %= power;
    }
}

// Show the score, rows and level, on the screen and on the output ports
void show_numbers() {
    text_color = NUMBER_COLOR;
    put_number(146, 52, score);
    put_number(146, 88, rows);
    put_number(146, 124, level);
    out(0, score);
    out(1, rows);
}

void new_game() {
    int x, y, cell;
    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);
    for (cell = 0; cell < 32 * ROW; cell++) board[cell] = 0;

    // the wall: down both sides of the well (columns 2 and 15), then along the bottom (row 28)
    for (cell = WELL_TOP - 1; cell < 28 * ROW; cell += ROW - 13) {
        board[cell] = WALL_COLOR;
        draw_cell(cell, WALL_COLOR);
        cell += 13;
        board[cell] = WALL_COLOR;
        draw_cell(cell, WALL_COLOR);
    }
    for (; cell < 28 * ROW + 16; cell++) {
        board[cell] = WALL_COLOR;
        draw_cell(cell, WALL_COLOR);
    }

    text_color = 10;
    put_string(106, 12, "BLOCKS");
    text_color = TEXT_COLOR;
    put_string(146, 40, "SCORE");
    put_string(146, 76, "ROWS");
    put_string(146, 112, "LEVEL");
    put_string(146, 148, "NEXT");

    score = 0;
    rows = 0;
    level = 0;
    period = 24;
    show_numbers();
}

// One frame, about 22 ms: act on the buttons and let the piece fall. Returns 1 when the piece
// has landed.
int frame() {
    int keys, act, k;
    for (k = 16; k; k--) stall(0xFFFF);

    // Act on a button when it goes down. Left, right and down also repeat every other frame
    // once they have been held for 8 frames.
    keys = in(0) & 15;
    act = keys & ~held;
    held = keys;
    if (act) {
        rng += repeat;          // when buttons are pressed makes the pieces less predictable
        repeat = 0;
    } else {
        repeat++;
        if (repeat >= 8 && !(repeat & 1)) act = keys & (DOWN | LEFT | RIGHT);
    }

    // Every move is tried the same way: take the piece off the screen, move it, and put it
    // back where it was if it does not fit there.
    if (act & LEFT) {
        erase_piece();
        pos--;
        if (blocked()) pos++;
        show_piece();
    }
    if (act & RIGHT) {
        erase_piece();
        pos++;
        if (blocked()) pos--;
        show_piece();
    }
    if (act & UP) {
        erase_piece();
        rot = (rot + 1) & 3;
        // if it does not fit turned, try one square left, then right
        if (blocked()) {
            pos--;
            if (blocked()) {
                pos += 2;
                if (blocked()) {
                    pos--;      // no: leave it as it was
                    rot = (rot - 1) & 3;
                }
            }
        }
        show_piece();
    }

    // one step down, if down is pressed or it is time
    if (!(act & DOWN) && ++gravity < period) return 0;
    gravity = 0;
    erase_piece();
    pos += ROW;
    if (blocked()) {
        pos -= ROW;
        show_piece();
        return 1;
    }
    show_piece();
    return 0;
}

// The piece cannot go down any further: it becomes part of the board, and full rows go
void land() {
    unsigned piece = pieces[type][rot];
    int color = piece_colors[type];
    int *p = board + pos;
    int *q;
    int k = 4, full = 0, cell;

    for (;;) {
        if ((int)piece < 0) *p = color;
        piece <<= 1;
        if (!piece) break;
        p++;
        if (!--k) {
            k = 4;
            p += ROW - 4;
        }
    }
    score++;

    // look for full rows, from the bottom of the well up
    p = board + WELL_BOTTOM;
    while (p >= board + WELL_TOP) {
        for (k = 0; k < 12 && p[k]; k++) {
        }
        if (k < 12) {
            p -= ROW;
            continue;
        }
        // full: every square from here up to the second row of the well becomes the one
        // above it, and the top row of the well is emptied. Then this row is looked at
        // again: it has new squares in it.
        full++;
        for (q = p + 11; q >= board + WELL_TOP + ROW; q--) *q = q[-ROW];
        for (k = 0; k < 12; k++) board[WELL_TOP + k] = 0;
    }

    if (full) {
        rows += full;
        level = rows >> 3;              // a level for every 8 rows,
        period = 24 - 2 * level;        // and 2 frames faster per level, down to 2
        if (period < 2) period = 2;
        score += full * full * 10;      // 10, 40, 90 or 160 points for 1 to 4 rows at once
        // draw the well again from the board
        for (cell = WELL_TOP; cell < 28 * ROW; cell += ROW - 12)
            for (k = 12; k; k--) {
                draw_cell(cell, board[cell]);
                cell++;
            }
    }
    show_numbers();
}

int main() {
    int full;
    for (;;) {
        new_game();
        next = random_piece();
        for (;;) {
            // bring in the next piece at the top of the well
            type = next;
            next = random_piece();
            rot = 0;
            pos = START;
            // show the piece after this one, under NEXT
            draw_piece(0xFFFF, PREVIEW, 0);
            draw_piece(pieces[next][0], PREVIEW, piece_colors[next]);
            gravity = 0;
            full = blocked();
            show_piece();
            if (full) break;            // no room for it: the well is full
            while (!frame()) {
            }
            land();
        }

        text_color = 8;
        put_string(146, 208, "GAME");
        put_string(146, 220, "OVER");
        while (in(0)) {
        }
        while (!in(0)) {
        }
    }
}
`,Ce=`// Rotating 3D wireframe cube, drawn in perspective. The C version of cube.asm.
//
// Input port 0: analog stick (optional). While it is off centre it turns the cube: left/right
//               about the vertical axis, up/down about the horizontal one. Left alone, the
//               cube spins by itself.
//
// Every frame the 8 corners are rotated about two axes and projected onto the screen, the 12
// edges of the previous frame are erased and the new ones drawn with Bresenham's line algorithm.
//
// Coordinates are signed Q8.8 (256 = 1 pixel). Sines are signed Q15 (32767 = 1.0), so the
// upper word of a product (mulhi) is half the answer and gets doubled afterwards.
// Dividing is slow, so the perspective divide is a table of 256 * 160 / (160 + z) in Q8.8,
// indexed by the whole part of z.

#define HALF_SIZE 0x3400        // 52.0: half the length of an edge

// sin(2 * pi * n / 256) * 32767
int sine[256] = {
    0, 804, 1608, 2410, 3212, 4011, 4808, 5602, 6393, 7179, 7962, 8739, 9512, 10278, 11039, 11793,
    12539, 13279, 14010, 14732, 15446, 16151, 16846, 17530, 18204, 18868, 19519, 20159, 20787, 21403, 22005, 22594,
    23170, 23731, 24279, 24811, 25329, 25832, 26319, 26790, 27245, 27683, 28105, 28510, 28898, 29268, 29621, 29956,
    30273, 30571, 30852, 31113, 31356, 31580, 31785, 31971, 32137, 32285, 32412, 32521, 32609, 32678, 32728, 32757,
    32767, 32757, 32728, 32678, 32609, 32521, 32412, 32285, 32137, 31971, 31785, 31580, 31356, 31113, 30852, 30571,
    30273, 29956, 29621, 29268, 28898, 28510, 28105, 27683, 27245, 26790, 26319, 25832, 25329, 24811, 24279, 23731,
    23170, 22594, 22005, 21403, 20787, 20159, 19519, 18868, 18204, 17530, 16846, 16151, 15446, 14732, 14010, 13279,
    12539, 11793, 11039, 10278, 9512, 8739, 7962, 7179, 6393, 5602, 4808, 4011, 3212, 2410, 1608, 804,
    0, -804, -1608, -2410, -3212, -4011, -4808, -5602, -6393, -7179, -7962, -8739, -9512, -10278, -11039, -11793,
    -12539, -13279, -14010, -14732, -15446, -16151, -16846, -17530, -18204, -18868, -19519, -20159, -20787, -21403, -22005, -22594,
    -23170, -23731, -24279, -24811, -25329, -25832, -26319, -26790, -27245, -27683, -28105, -28510, -28898, -29268, -29621, -29956,
    -30273, -30571, -30852, -31113, -31356, -31580, -31785, -31971, -32137, -32285, -32412, -32521, -32609, -32678, -32728, -32757,
    -32767, -32757, -32728, -32678, -32609, -32521, -32412, -32285, -32137, -31971, -31785, -31580, -31356, -31113, -30852, -30571,
    -30273, -29956, -29621, -29268, -28898, -28510, -28105, -27683, -27245, -26790, -26319, -25832, -25329, -24811, -24279, -23731,
    -23170, -22594, -22005, -21403, -20787, -20159, -19519, -18868, -18204, -17530, -16846, -16151, -15446, -14732, -14010, -13279,
    -12539, -11793, -11039, -10278, -9512, -8739, -7962, -7179, -6393, -5602, -4808, -4011, -3212, -2410, -1608, -804
};

// 256 * 160 / (160 + z) for z = -128 to 127
int scale[256] = {
    1280, 1241, 1205, 1170, 1138, 1107, 1078, 1050, 1024, 999, 975, 953, 931, 910, 890, 871,
    853, 836, 819, 803, 788, 773, 759, 745, 731, 719, 706, 694, 683, 671, 661, 650,
    640, 630, 621, 611, 602, 594, 585, 577, 569, 561, 554, 546, 539, 532, 525, 518,
    512, 506, 500, 493, 488, 482, 476, 471, 465, 460, 455, 450, 445, 440, 436, 431,
    427, 422, 418, 414, 410, 406, 402, 398, 394, 390, 386, 383, 379, 376, 372, 369,
    366, 362, 359, 356, 353, 350, 347, 344, 341, 339, 336, 333, 330, 328, 325, 323,
    320, 318, 315, 313, 310, 308, 306, 303, 301, 299, 297, 295, 293, 290, 288, 286,
    284, 282, 281, 279, 277, 275, 273, 271, 269, 268, 266, 264, 263, 261, 259, 258,
    256, 254, 253, 251, 250, 248, 247, 245, 244, 242, 241, 240, 238, 237, 235, 234,
    233, 231, 230, 229, 228, 226, 225, 224, 223, 221, 220, 219, 218, 217, 216, 214,
    213, 212, 211, 210, 209, 208, 207, 206, 205, 204, 203, 202, 201, 200, 199, 198,
    197, 196, 195, 194, 193, 192, 191, 191, 190, 189, 188, 187, 186, 185, 185, 184,
    183, 182, 181, 180, 180, 179, 178, 177, 177, 176, 175, 174, 174, 173, 172, 171,
    171, 170, 169, 169, 168, 167, 167, 166, 165, 164, 164, 163, 163, 162, 161, 161,
    160, 159, 159, 158, 158, 157, 156, 156, 155, 155, 154, 153, 153, 152, 152, 151,
    151, 150, 149, 149, 148, 148, 147, 147, 146, 146, 145, 145, 144, 144, 143, 143
};

// The 12 edges: the two corners each one joins, and its colour.
// Bit 0 of a corner number is its x side, bit 1 its y side and bit 2 its z side.
int edges[12][3] = {
    {0, 1, 8},  {2, 3, 8},  {4, 5, 8},  {6, 7, 8},
    {0, 2, 11}, {1, 3, 11}, {4, 6, 11}, {5, 7, 11},
    {0, 4, 12}, {1, 5, 12}, {2, 6, 12}, {3, 7, 12}
};

struct point {
    int x, y;
};

// Where the 8 corners are on the screen, in this frame and in the previous one
struct point corners[8], previous[8];

unsigned angle_a, angle_b;      // 65536 is a full turn; the upper 8 bits index the sine table

// Bresenham's line algorithm
void line(int x0, int y0, int x1, int y1, int color) {
    int dx, dy, step_x, step_y, err, e2;
    dx = x1 - x0;               // dx = |x1 - x0|, step_x = direction of x
    step_x = 1;
    if (dx < 0) {
        dx = -dx;
        step_x = -1;
    }
    dy = y0 - y1;               // dy = -|y1 - y0|, step_y = direction of y
    step_y = 1;
    if (dy > 0) {
        dy = -dy;
        step_y = -1;
    }
    err = dx + dy;
    for (;;) {
        pixel(x0, y0, color);
        if (x0 == x1 && y0 == y1) break;
        e2 = err << 1;
        if (e2 >= dy) {
            err += dy;
            x0 += step_x;
        }
        if (e2 <= dx) {
            err += dx;
            y0 += step_y;
        }
    }
}

// Draw every edge between the given points. Colours are ANDed with \`mask\` (0 erases).
void draw_edges(struct point *points, int mask) {
    int *edge = edges[0];
    struct point *a, *b;
    int i;
    for (i = 12; i; i--) {
        a = points + *edge++;
        b = points + *edge++;
        line(a->x, a->y, b->x, b->y, *edge++ & mask);
    }
}

// Turn the corners of the cube and work out where they are on the screen
void place_corners(int sin_a, int cos_a, int sin_b, int cos_b) {
    int i, x, y, z, t;
    for (i = 0; i < 8; i++) {
        // the corner's position before turning comes from the bits of its number
        x = i & 1 ? HALF_SIZE : -HALF_SIZE;
        y = i & 2 ? HALF_SIZE : -HALF_SIZE;
        z = i & 4 ? HALF_SIZE : -HALF_SIZE;
        // turn about the vertical axis: (x, z) = (x cos a + z sin a, z cos a - x sin a)
        t = (mulhi(x, cos_a) + mulhi(z, sin_a)) << 1;
        z = (mulhi(z, cos_a) - mulhi(x, sin_a)) << 1;
        x = t;
        // turn about the horizontal axis: (y, z) = (y cos b - z sin b, y sin b + z cos b)
        t = (mulhi(y, cos_b) - mulhi(z, sin_b)) << 1;
        z = (mulhi(y, sin_b) + mulhi(z, cos_b)) << 1;
        y = t;
        // perspective: scale x and y by the table entry for z, then move to the screen centre
        t = scale[((unsigned)z >> 8) ^ 128];    // whole part of z, -128..127 -> index 0..255
        corners[i].x = mulhi(x, t) + 128;
        corners[i].y = mulhi(y, t) + 128;
    }
}

int main() {
    int x, y, i;
    unsigned stick, a, b;

    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);

    for (;;) {
        // turn: by the stick if it is being used, otherwise at a steady speed
        stick = in(0);
        if (stick) {
            x = stick & 255;            // low byte: signed x
            if (x >= 128) x -= 256;
            y = stick >> 8;             // high byte: signed y
            if (y >= 128) y -= 256;
            angle_a += x << 3;
            angle_b += y << 3;
        } else {
            angle_a += 300;
            angle_b += 190;
        }

        // the cosine is the sine a quarter turn later
        a = angle_a >> 8;
        b = angle_b >> 8;
        place_corners(sine[a], sine[(a + 64) & 255], sine[b], sine[(b + 64) & 255]);

        // erase the previous frame's edges, then draw the new ones
        draw_edges(previous, 0);
        draw_edges(corners, 15);

        // remember where the corners are so they can be erased next frame
        for (i = 0; i < 8; i++) {
            previous[i].x = corners[i].x;
            previous[i].y = corners[i].y;
        }

        // wait about 27 ms: together with the drawing that gives roughly 30 frames per second
        for (i = 20; i; i--) stall(0xFFFF);
    }
}
`,we=`// Fire: the classic demo effect. The C version of fire.asm.
//
// Input port 0: hold any bit (a switch or a button) to put the fire out. Let go to light it again.
//
// The fire is a grid of 128 x 48 heat values, drawn as blocks of 2 x 4 pixels at the bottom of
// the screen. The two bottom rows are not shown: they are the fuel, set at random to hot (3
// times in 4) or cold every frame. Every other cell becomes the average of the three cells
// below it and the one two rows down, minus a little random cooling, so the heat rises and
// fades. Rows are done from the top down, so each cell still sees last frame's heat below it.
//
// Heat is 0 to 255 and its upper 4 bits pick the colour. A block is only drawn again when its
// colour changes. For better looking flames, change the palette in the emulator to a smooth
// ramp from black through red and yellow to white (colours 0, 2, 8, 9, 10 and 7 are used).

#define WIDTH 128
#define HEIGHT 48
#define TOP 72                      // screen y of the first row: 46 rows of 4 pixels end at 256

unsigned heat[WIDTH * HEIGHT];

// Colour for every 16 steps of heat
int ramp[16] = {0, 0, 2, 2, 2, 8, 8, 8, 8, 9, 9, 9, 10, 10, 10, 7};

int main() {
    unsigned *p;
    unsigned h, t, fuel;
    unsigned rng = 1, multiplier = 25173;
    int px, py, x1, color;

    for (;;) {
        // fuel: every cell of the two bottom rows is hot or cold at random (all cold if a bit
        // of input port 0 is on)
        fuel = in(0) ? 0 : 255;
        p = heat + WIDTH * (HEIGHT - 2);
        for (t = 2 * WIDTH; t; t--) {
            rng = rng * multiplier + 1;     // random numbers: multiply and add 1, use the upper bits
            *p++ = rng >> 14 ? fuel : 0;    // hot 3 times out of 4
        }

        p = heat;
        for (py = TOP; py < 256; py += 4) {
            for (px = 0; px < 256; px += 2) {
                // the average of the cells below left, below, below right and two below
                h = (p[WIDTH - 1] + p[WIDTH] + p[WIDTH + 1] + p[2 * WIDTH]) >> 2;
                // cool down by 2 to 9
                rng = rng * multiplier + 1;
                t = (rng >> 13) + 2;
                h = h > t ? h - t : 0;
                // has the colour changed?
                color = h >> 4;
                if (color != *p >> 4) {
                    color = ramp[color];
                    x1 = px + 1;
                    pixel(px, py, color);
                    pixel(x1, py, color);
                    pixel(px, py + 1, color);
                    pixel(x1, py + 1, color);
                    pixel(px, py + 2, color);
                    pixel(x1, py + 2, color);
                    pixel(px, py + 3, color);
                    pixel(x1, py + 3, color);
                }
                *p++ = h;
            }
        }

        // wait about 16 ms: with the work above that is roughly 30 frames per second
        for (t = 12; t; t--) stall(0xFFFF);
    }
}
`,Te=`// Conway's Game of Life on a 64x64 grid that wraps around at the edges. The C version of
// game-of-life.asm.
//
// Hold any bit of input port 0 (a switch or a button) to start again from a new random grid.
// Output port 0 shows the generation number.
//
// The grid has one word per cell, with a one cell border on every side (66 words per row).
// Before each generation the opposite edge is copied into the border, so the neighbour
// counting never has to deal with wrapping.
// Bit 0 of a cell is its current state. The next state is first written to bit 1, and only
// moved down to bit 0 once every cell has been counted.

#define ALIVE_COLOR 11
#define ROW 66                          // words per row of the grid
#define FIRST (grid + ROW + 1)          // cell (0, 0): one row and one column in

unsigned grid[ROW * ROW];

// Draw cell (x, y) in a colour: a 3x3 square, leaving a 1 pixel gap between cells
void draw_cell(int x, int y, int color) {
    int px = x << 2, py = y << 2;
    int px1 = px + 1, px2 = px + 2;
    pixel(px, py, color);
    pixel(px1, py, color);
    pixel(px2, py, color);
    py++;
    pixel(px, py, color);
    pixel(px1, py, color);
    pixel(px2, py, color);
    py++;
    pixel(px, py, color);
    pixel(px1, py, color);
    pixel(px2, py, color);
}

// Copy \`count\` words, moving both pointers by \`step\` after every word
void copy(unsigned *src, unsigned *dst, int step, int count) {
    do {
        *dst = *src;
        src += step;
        dst += step;
    } while (--count);
}

int main() {
    unsigned *p;
    unsigned cell, next, count, gen;
    unsigned rng = 0xACE1;
    int x, y;

    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);

    for (;;) {
        // fill the grid at random, about one cell in four alive
        p = FIRST;
        for (y = 0; y < 64; y++) {
            for (x = 0; x < 64; x++) {
                rng ^= rng << 7;        // 16-bit xorshift random number generator
                rng ^= rng >> 9;
                rng ^= rng << 8;
                cell = (rng & 3) == 0;
                *p++ = cell;
                draw_cell(x, y, cell ? ALIVE_COLOR : 0);
            }
            p += 2;                     // skip the right and left border
        }

        for (gen = 0; !in(0); gen++) {
            out(0, gen);

            // copy the edges into the opposite border: rows first, then columns (with the corners)
            copy(grid + 64 * ROW + 1, grid + 1, 1, 64);         // bottom row -> top border
            copy(FIRST, grid + 65 * ROW + 1, 1, 64);            // top row -> bottom border
            copy(grid + 64, grid, ROW, ROW);                    // right column -> left border
            copy(grid + 1, grid + 65, ROW, ROW);                // left column -> right border

            // pass 1: count the neighbours of every cell and store its next state in bit 1
            p = FIRST;
            for (y = 64; y; y--) {
                for (x = 64; x; x--) {
                    // the three above and the one to the left may already have their bit 1
                    // set; the one to the right and the three below are still 0 or 1
                    count = (p[-ROW - 1] & 1) + (p[-ROW] & 1) + (p[-ROW + 1] & 1) + (p[-1] & 1)
                        + p[1] + p[ROW - 1] + p[ROW] + p[ROW + 1];
                    // alive next if it has 3 neighbours, or 2 and is alive now
                    cell = *p;
                    *p++ = cell | ((count | cell) == 3 ? 2 : 0);
                }
                p += 2;
            }

            // pass 2: make the next state current, redrawing only the cells that changed
            p = FIRST;
            for (y = 0; y < 64; y++) {
                for (x = 0; x < 64; x++) {
                    cell = *p;
                    next = cell >> 1;
                    *p++ = next;
                    if (next != (cell & 1)) draw_cell(x, y, next ? ALIVE_COLOR : 0);
                }
                p += 2;
            }

            // wait about 40 ms so it does not run too fast to follow
            for (x = 30; x; x--) stall(0xFFFF);
        }
    }
}
`,Ee=`// Mandelbrot set, drawn with 16-bit fixed point arithmetic. The C version of mandelbrot.asm.
//
// Numbers are signed Q4.12 (4096 = 1.0). A product of two of them is a 32-bit Q8.24 value:
// mulhi() gives its upper word and * its lower word, which are then stitched back into Q4.12.
// The view is 3.0 wide (real -2.25 to 0.75, imaginary -1.5 to 1.5), so one pixel is 48/4096.
//
// Output port 0 shows the row being drawn. Takes a few seconds at real speed.

#define MAX_ITER 64
#define PIXEL_STEP 48

// Colours for points outside the set, indexed by (iterations mod 16)
int palette[16] = {1, 2, 13, 14, 8, 9, 10, 7, 15, 6, 12, 11, 3, 5, 4, 2};

int main() {
    int px, py;         // the pixel
    int cx, cy;         // the point c it stands for
    int zx, zy;         // z, which starts at c and becomes z * z + c over and over
    int x2, y2, hi, iter;
    int four = 0x4000;

    cy = -6144;                     // -1.5
    for (py = 0; py < 256; py++) {
        out(0, py);
        cx = -9216;                 // -2.25
        for (px = 0; px < 256; px++) {
            zx = cx;
            zy = cy;
            for (iter = 0; iter < MAX_ITER; iter++) {
                // x2 = zx * zx. The upper word is Q8.8: if it is already 4.0 or more, |z| > 2.
                hi = mulhi(zx, zx);
                if (hi >= 0x400) break;
                x2 = (hi << 4) | ((unsigned)(zx * zx) >> 12);
                hi = mulhi(zy, zy);
                if (hi >= 0x400) break;
                y2 = (hi << 4) | ((unsigned)(zy * zy) >> 12);
                if ((unsigned)(x2 + y2) > (unsigned)four) break;
                // zy = 2 * zx * zy + cy (one bit less of shift does the doubling)
                zy = ((mulhi(zx, zy) << 5) | ((unsigned)(zx * zy) >> 11)) + cy;
                zx = x2 - y2 + cx;
            }
            // points that never escaped are inside the set, and black
            pixel(px, py, iter == MAX_ITER ? 0 : palette[iter & 15]);
            cx += PIXEL_STEP;
        }
        cy += PIXEL_STEP;
    }
    return 0;
}
`,De=`// Mandelbrot zoom: keeps zooming in on one point of the Mandelbrot set (the branching
// filaments above the main body), then starts again. The C version of mandelbrot-zoom.asm.
//
// Drawn at 128x128 (2x2 pixel blocks): a frame takes about half a second at real speed, and
// the whole zoom about 40 seconds. Try the unlimited speed mode as well.
// See mandelbrot.c for how the fixed point arithmetic works: numbers are signed Q4.12.
//
// The distance between two blocks is kept in 1/256ths of the smallest Q4.12 step, and gets
// 1/16 smaller every frame. It starts at 96 (the whole set) and the zoom ends when it reaches
// 1, where neighbouring blocks would land on the same number: a magnification of 96 times.
//
// Output port 0 shows the frame number.

#define MAX_ITER 48
#define FIRST_STEP 0x6000       // 96 * 256
#define TARGET_X 0xFE62         // -0.1011
#define TARGET_Y 3917           //  0.9563 (drawn towards the bottom, as y grows downwards)

// Colours for points outside the set, indexed by (iterations mod 16)
int palette[16] = {1, 2, 13, 14, 8, 9, 10, 7, 15, 6, 12, 11, 3, 5, 4, 2};

int main() {
    int px, py;                 // the block being drawn
    int cx, cy;                 // the point it stands for
    int zx, zy, x2, y2, hi, iter, color;
    int origin_x, origin_y;     // the point in the top left corner
    unsigned step;
    unsigned frame = 0;

    for (;;) {
        // zoom in by 1/16 every frame
        for (step = FIRST_STEP; step >= 256; step -= step >> 4) {
            out(0, ++frame);

            // the top left corner is 64 blocks up and left of the target: 64 * step / 256
            origin_x = TARGET_X - (step >> 2);
            origin_y = TARGET_Y - (step >> 2);

            for (py = 0; py < 128; py++) {
                // cy = origin_y + py * step / 256, using both halves of the 32-bit product
                cy = origin_y + ((py * step >> 8) | (umulhi(py, step) << 8));
                for (px = 0; px < 128; px++) {
                    cx = origin_x + ((px * step >> 8) | (umulhi(px, step) << 8));

                    zx = cx;
                    zy = cy;
                    for (iter = 0; iter < MAX_ITER; iter++) {
                        hi = mulhi(zx, zx);
                        if (hi >= 0x400) break;
                        x2 = (hi << 4) | ((unsigned)(zx * zx) >> 12);
                        hi = mulhi(zy, zy);
                        if (hi >= 0x400) break;
                        y2 = (hi << 4) | ((unsigned)(zy * zy) >> 12);
                        // escaped if x2 + y2 >= 4.0 (0x4000, so one of the top two bits is set)
                        if ((unsigned)(x2 + y2) >> 14) break;
                        zy = ((mulhi(zx, zy) << 5) | ((unsigned)(zx * zy) >> 11)) + cy;
                        zx = x2 - y2 + cx;
                    }
                    color = iter == MAX_ITER ? 0 : palette[iter & 15];

                    // draw the 2x2 block
                    pixel(px << 1, py << 1, color);
                    pixel((px << 1) + 1, py << 1, color);
                    pixel(px << 1, (py << 1) + 1, color);
                    pixel((px << 1) + 1, (py << 1) + 1, color);
                }
            }
        }

        // fully zoomed in: hold the last frame for about a second, then start again
        for (iter = 700; iter; iter--) stall(0xFFFF);
    }
}
`,Oe=`// Printing numbers on the display: the Fibonacci numbers, then the prime numbers. The C
// version of numbers.asm.
//
// Every line shows a count, then the number in decimal and in hexadecimal. Numbers are 32 bits,
// kept as two words. The list goes back to the top when it reaches the bottom of the screen.
//
//   Fibonacci numbers: F0 to F47, the largest that fits in 32 bits.
//   Prime numbers:     all 12251 primes below 131072, found with the sieve of Eratosthenes.
//
// Input port 0:  hold any bit (a switch or a button) to skip the pauses and go at full speed.
// Output port 0: lower word of the number.   Output port 1: upper word.   Output port 2: count.
//
// Text is drawn with a 3x5 pixel font, each font pixel 2x2 on the screen, in 8x12 character
// cells (32 columns, 21 rows). A character is one word: 15 pixels from the top bit down, row by
// row, and a 1 in the lowest bit that tells the drawing loop where the pixels end.
// Characters 0-15 are the hexadecimal digits, the letters carry on to Z = 35, and 36 is a space.

#define SPACE 36
#define FIRST_ROW 3             // rows 0 and 1 are the title and the column names
#define ROWS 21
#define COUNT_COL 3
#define DECIMAL_COL 9
#define HEX_COL 20
#define LINE_END 28

unsigned font[37] = {
    0xF6DF, 0x592F, 0xE7CF, 0xE79F,     // 0 1 2 3
    0xB793, 0xF39F, 0xF3DF, 0xE493,     // 4 5 6 7
    0xF7DF, 0xF79F, 0xF7DB, 0xD75D,     // 8 9 A B
    0xF24F, 0xD6DD, 0xF3CF, 0xF3C9,     // C D E F
    0xF2DF, 0xB7DB, 0xE92F, 0x24DF,     // G H I J
    0xB75B, 0x924F, 0xBFDB, 0xD6DB,     // K L M N
    0x56D5, 0xF7C9, 0xF6F3, 0xF75B,     // O P Q R
    0x711D, 0xE925, 0xB6DF, 0xB6D5,     // S T U V
    0xB7FB, 0xB55B, 0xB525, 0xE54F,     // W X Y Z
    0x0001                              // space
};

// Powers of ten as upper word, lower word. Printing starts at the top for 10 digits and at
// 10000 for 5 digits. The last digit is whatever is left, so 1 is not in the table.
#define POWERS 9
unsigned pow10[2 * POWERS] = {
    0x3B9A, 0xCA00,             // 1000000000
    0x05F5, 0xE100,             // 100000000
    0x0098, 0x9680,             // 10000000
    0x000F, 0x4240,             // 1000000
    0x0001, 0x86A0,             // 100000
    0, 10000,
    0, 1000,
    0, 100,
    0, 10
};

unsigned sieve[4096];           // one bit for every odd number below 131072

int row, col;                   // where the next character goes
int color;
unsigned count;
unsigned value_hi, value_lo;    // the number to print

// Draw character number \`ch\` at the current column and row, and move one column on
void put_char(int ch) {
    unsigned bits = font[ch];
    int px = (col << 3) + 2;    // the 6 pixels of a character are at x = 2..7 of its cell
    int py = row * 12;
    int ink = color;
    int c;
    do {
        c = (int)bits < 0 ? ink : 0;    // the top bit is the next font pixel
        bits <<= 1;
        pixel(px, py, c);
        pixel(px + 1, py, c);
        pixel(px, py + 1, c);
        pixel(px + 1, py + 1, c);
        px += 2;
        if (!(px & 7)) {        // past the right edge of the cell: start the next row
            px -= 6;
            py += 2;
        }
    } while (bits << 1);        // done when only the marker bit is left, at the top
    col++;
}

// Print text made of capital letters, digits and spaces
void put_string(char *s) {
    int c;
    while ((c = *s++)) put_char(c == ' ' ? SPACE : c >= 'A' ? c - 'A' + 10 : c - '0');
}

// Print the 32-bit number hi:lo in decimal, without leading zeros. \`power\` is where to start
// in the table of powers of ten. There is no 32-bit division, so each digit is found by
// counting how many times its power of ten can be subtracted.
void put_decimal(unsigned hi, unsigned lo, unsigned *power) {
    unsigned ph, pl;
    int digit, seen = 0;
    do {
        ph = *power++;
        pl = *power++;
        digit = 0;
        while (hi > ph || (hi == ph && lo >= pl)) {
            hi -= ph;
            if (lo < pl) hi--;  // borrow
            lo -= pl;
            digit++;
        }
        seen |= digit;          // stays 0 until the first digit that is not 0
        put_char(seen ? digit : SPACE);
    } while (power < pow10 + 2 * POWERS);
    put_char(lo);               // what is left is the last digit
}

// Print a word as 4 hexadecimal digits
void put_hex(unsigned value) {
    int i;
    for (i = 4; i; i--) {
        put_char(value >> 12);
        value <<= 4;
    }
}

// Print count and value on the current row, send them to the output ports, and move to the
// next row (clearing it, so it is easy to see where the list has got to)
void print_line() {
    color = 6;
    col = COUNT_COL;
    put_decimal(0, count, pow10 + 10);
    color = 7;
    col = DECIMAL_COL;
    put_decimal(value_hi, value_lo, pow10);
    color = 11;
    col = HEX_COL;
    put_hex(value_hi);
    put_hex(value_lo);

    out(0, value_lo);
    out(1, value_hi);
    out(2, count);

    if (++row >= ROWS) row = FIRST_ROW;
    col = COUNT_COL;
    while (col < LINE_END) put_char(SPACE);
}

// Clear the screen and print the title and the column names
void heading(char *title, int column) {
    int x, y;
    for (y = 0; y < 256; y++)
        for (x = 0; x < 256; x++) pixel(x, y, 0);
    row = 0;
    color = 10;
    col = column;
    put_string(title);
    row = 1;
    color = 12;
    col = 7;
    put_string("N    DECIMAL      HEX");
    row = FIRST_ROW;
}

// Wait for n * 1.4 ms. Any bit of input port 0 ends the wait straight away.
void pause(int n) {
    do {
        if (in(0)) return;
        stall(0xFFFF);
    } while (--n);
}

int main() {
    unsigned i, j, p, last;
    unsigned next_hi, next_lo;      // the Fibonacci number after the one being printed

    for (;;) {
        heading("FIBONACCI NUMBERS", 7);
        value_hi = 0;               // F0 = 0
        value_lo = 0;
        next_hi = 0;                // F1 = 1
        next_lo = 1;
        for (count = 0; count < 48; count++) {
            print_line();
            // (value, next) = (next, value + next): the lower words carry into the upper ones
            // when their sum comes out smaller than what was added
            i = value_lo + next_lo;
            j = value_hi + next_hi + (i < next_lo);
            value_lo = next_lo;
            value_hi = next_hi;
            next_lo = i;
            next_hi = j;
            pause(150);
        }
        pause(2000);

        heading("PRIME NUMBERS", 9);
        // Sieve of Eratosthenes over the odd numbers only: bit i of the sieve stands for
        // 2i + 1, and is set once that number is known not to be prime.
        for (i = 0; i < 4096; i++) sieve[i] = 0;
        for (i = 1; i < 181; i++) {     // 363 * 363 is more than 131072, so 181 is enough
            if (sieve[i >> 4] >> (i & 15) & 1) continue;
            // p = 2i + 1 is prime: mark its odd multiples from p * p up. Moving p bits along
            // the sieve is the next odd multiple, and p * p is bit 2i(i + 1).
            p = 2 * i + 1;
            j = 2 * i * (i + 1);
            do {
                sieve[j >> 4] |= 1 << (j & 15);
                last = j;
                j += p;
            } while (j > last);         // until j goes past the last bit and wraps around
        }

        // 2 is the only even prime, so it is printed by hand
        count = 1;
        value_hi = 0;
        value_lo = 2;
        i = 0;
        for (;;) {
            print_line();
            pause(30);
            // look for the next bit that is not set
            do {
                if (++i == 0) goto done;        // past the last bit
            } while (sieve[i >> 4] >> (i & 15) & 1);
            value_hi = i >> 15;                 // the prime is 2i + 1, which can need 17 bits
            value_lo = 2 * i + 1;
            count++;
        }
    done:
        pause(4000);
    }
}
`,ke=`// Raycaster: walk around a maze seen in first person. The C version of raycaster.asm.
//
// Input port 0: game controller, d-pad 1 (bits 0-3). Up and down walk forwards and backwards,
//               left and right turn. Switches on bits 0-3 work as well.
//
// For each of 128 screen columns (2 pixels wide) a ray is sent out from the player and stepped
// from one grid line of the map to the next until it enters a wall. How far it went decides how
// tall the wall is drawn in that column; which kind of grid line it crossed picks the lighter or
// darker shade of the wall's colour.
//
// Positions and distances are Q8.8 (256 = one map square), directions are signed Q14
// (16384 = 1.0). Dividing is slow, so 1/x comes from two tables that are filled in when the
// program starts:
//   recip[n]  = 131072 / n : how far a ray travels between two grid lines, by its direction / 32
//   height[n] = 16384 / n  : half the height of a wall on screen, by its distance / 2

#define SKY_COLOR 1
#define FLOOR_COLOR 5

// sin(2 * pi * n / 256) * 16384
int sine[256] = {
    0, 402, 804, 1205, 1606, 2006, 2404, 2801, 3196, 3590, 3981, 4370, 4756, 5139, 5520, 5897,
    6270, 6639, 7005, 7366, 7723, 8076, 8423, 8765, 9102, 9434, 9760, 10080, 10394, 10702, 11003, 11297,
    11585, 11866, 12140, 12406, 12665, 12916, 13160, 13395, 13623, 13842, 14053, 14256, 14449, 14635, 14811, 14978,
    15137, 15286, 15426, 15557, 15679, 15791, 15893, 15986, 16069, 16143, 16207, 16261, 16305, 16340, 16364, 16379,
    16384, 16379, 16364, 16340, 16305, 16261, 16207, 16143, 16069, 15986, 15893, 15791, 15679, 15557, 15426, 15286,
    15137, 14978, 14811, 14635, 14449, 14256, 14053, 13842, 13623, 13395, 13160, 12916, 12665, 12406, 12140, 11866,
    11585, 11297, 11003, 10702, 10394, 10080, 9760, 9434, 9102, 8765, 8423, 8076, 7723, 7366, 7005, 6639,
    6270, 5897, 5520, 5139, 4756, 4370, 3981, 3590, 3196, 2801, 2404, 2006, 1606, 1205, 804, 402,
    0, -402, -804, -1205, -1606, -2006, -2404, -2801, -3196, -3590, -3981, -4370, -4756, -5139, -5520, -5897,
    -6270, -6639, -7005, -7366, -7723, -8076, -8423, -8765, -9102, -9434, -9760, -10080, -10394, -10702, -11003, -11297,
    -11585, -11866, -12140, -12406, -12665, -12916, -13160, -13395, -13623, -13842, -14053, -14256, -14449, -14635, -14811, -14978,
    -15137, -15286, -15426, -15557, -15679, -15791, -15893, -15986, -16069, -16143, -16207, -16261, -16305, -16340, -16364, -16379,
    -16384, -16379, -16364, -16340, -16305, -16261, -16207, -16143, -16069, -15986, -15893, -15791, -15679, -15557, -15426, -15286,
    -15137, -14978, -14811, -14635, -14449, -14256, -14053, -13842, -13623, -13395, -13160, -12916, -12665, -12406, -12140, -11866,
    -11585, -11297, -11003, -10702, -10394, -10080, -9760, -9434, -9102, -8765, -8423, -8076, -7723, -7366, -7005, -6639,
    -6270, -5897, -5520, -5139, -4756, -4370, -3981, -3590, -3196, -2801, -2404, -2006, -1606, -1205, -804, -402
};

// The map, 16 x 16 squares. 0 is empty, 1 to 4 are walls of different colours.
int map[16 * 16] = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 2, 2, 0, 0, 0, 0, 0, 3, 0, 3, 0, 3, 0, 1,
    1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 0, 0, 0, 4, 4, 4, 0, 0, 0, 0, 0, 3, 0, 1,
    1, 0, 0, 0, 0, 4, 0, 4, 0, 0, 2, 0, 0, 0, 0, 1,
    1, 0, 3, 0, 0, 4, 0, 4, 0, 0, 2, 0, 0, 3, 0, 1,
    1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1,
    1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 4, 4, 0, 1,
    1, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 4, 0, 0, 1,
    1, 0, 4, 4, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1,
    1, 0, 4, 0, 0, 2, 2, 2, 2, 2, 0, 3, 0, 3, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

// Two colours for every kind of wall: for the sides facing east/west, and north/south
int wall_colors[10] = {0, 0, 8, 2, 11, 3, 10, 9, 7, 6};

unsigned recip[640];
unsigned height[2048];

unsigned pos_x = 0x0480;        // the player starts at (4.5, 8.5), looking east
unsigned pos_y = 0x0880;
unsigned angle;                 // 65536 is a full turn; 0 is east and it grows clockwise

// Fill in the tables. Both get smaller as n grows, so instead of dividing (the numbers do not
// fit in 16 bits), the previous value is lowered until value * n is small enough.
void make_tables() {
    unsigned n, t;
    t = 32767;                  // recip[n] = 131072 / n, at most 32767
    recip[0] = t;
    for (n = 1; n < 640; n++) {
        while (umulhi(t, n) >= 2) t--;      // upper word of t * n: below 2 means t * n < 131072
        recip[n] = t;
    }
    t = 128;                    // height[n] = 16384 / n, at most 128 (the whole screen)
    height[0] = t;
    for (n = 1; n < 2048; n++) {
        while (umulhi(t, n) || (t * n) >> 14) t--;
        height[n] = t;
    }
}

// Send a ray from the player in direction (ray_x, ray_y) until it hits a wall. Returns the
// distance to the wall, measured straight ahead and halved, in the lower 11 bits; above that
// is the index of the wall's colour.
unsigned cast(int ray_x, int ray_y) {
    unsigned side_x, side_y, delta_x, delta_y, part, wall;
    int step_x, step_y, cell;

    // For x: which way the ray steps through the map (step_x), how far it travels between two
    // grid lines (delta_x), and how far it is to the first one (side_x).
    part = pos_x & 255;         // how far the player is into the square
    if (ray_x < 0) {
        step_x = -1;
        delta_x = recip[(unsigned)-ray_x >> 5];
    } else {
        step_x = 1;
        part = 256 - part;      // going east: the rest of the square is ahead
        delta_x = recip[(unsigned)ray_x >> 5];
    }
    side_x = (umulhi(part, delta_x) << 8) | (part * delta_x >> 8);

    // the same for y, where a step is a whole row of the map
    part = pos_y & 255;
    if (ray_y < 0) {
        step_y = -16;
        delta_y = recip[(unsigned)-ray_y >> 5];
    } else {
        step_y = 16;
        part = 256 - part;
        delta_y = recip[(unsigned)ray_y >> 5];
    }
    side_y = (umulhi(part, delta_y) << 8) | (part * delta_y >> 8);

    // the map square the player is in
    cell = (pos_x >> 8) + ((pos_y >> 8) << 4);

    // step to whichever grid line is nearer, until the square entered is a wall
    for (;;) {
        if (side_x < side_y) {
            side_x += delta_x;
            cell += step_x;
            wall = map[cell];
            if (wall) return (wall << 12) | (((side_x - delta_x) >> 1) & 2047);
        } else {
            side_y += delta_y;
            cell += step_y;
            wall = map[cell];
            if (wall) return (wall << 12) | 0x800 | (((side_y - delta_y) >> 1) & 2047);
        }
    }
}

// Draw one column, two pixels wide: sky down to \`top\`, wall down to \`bottom\`, then floor
void draw_column(int x, int top, int bottom, int color) {
    int y = 0, x1 = x + 1;
    int sky = SKY_COLOR, ground = FLOOR_COLOR;
    for (; y < top; y++) {
        pixel(x, y, sky);
        pixel(x1, y, sky);
    }
    for (; y < bottom; y++) {
        pixel(x, y, color);
        pixel(x1, y, color);
    }
    for (; y < 256; y++) {
        pixel(x, y, ground);
        pixel(x1, y, ground);
    }
}

int main() {
    unsigned keys, a, hit, half;
    int dir_x, dir_y;           // the direction the player faces, then of the ray being sent
    int move_x, move_y;
    int plane_x, plane_y, step_x, step_y;
    int x;

    make_tables();

    for (;;) {
        // turn
        keys = in(0);
        if (keys & 4) angle -= 768;
        if (keys & 8) angle += 768;

        // the direction the player faces: (cos, sin) of the angle
        a = angle >> 8;
        dir_y = sine[a];
        dir_x = sine[(a + 64) & 255];

        // walk: about 0.08 of a square per frame, forwards or backwards
        if (keys & 3) {
            move_x = mulhi(dir_x, 80);
            move_y = mulhi(dir_y, 80);
            if (!(keys & 1)) {
                move_x = -move_x;
                move_y = -move_y;
            }
            // x and y are moved separately, so the player slides along a wall instead of
            // stopping. The square 4 steps ahead must be empty: that keeps a little distance
            // from the walls.
            if (!map[((pos_x + (move_x << 2)) >> 8) + ((pos_y >> 8) << 4)]) pos_x += move_x;
            if (!map[(((pos_y + (move_y << 2)) >> 8) << 4) + (pos_x >> 8)]) pos_y += move_y;
        }

        // The screen is a line across the view, at right angles to the direction: 0.66 of its
        // length to either side, which gives a 66 degree field of view. The ray for the left
        // edge is direction - plane, and each column adds plane / 64.
        plane_x = -(mulhi(dir_y, 21627) << 1);      // 21627 is 0.66 in Q15
        plane_y = mulhi(dir_x, 21627) << 1;
        step_x = mulhi(plane_x, 1024);
        step_y = mulhi(plane_y, 1024);
        dir_x -= plane_x;
        dir_y -= plane_y;

        for (x = 0; x < 256; x += 2) {
            hit = cast(dir_x, dir_y);
            half = height[hit & 2047];              // half the height of the wall
            draw_column(x, 128 - half, 128 + half, wall_colors[hit >> 11]);
            dir_x += step_x;
            dir_y += step_y;
        }

        // a frame takes about 15 ms to draw: wait 19 ms more for roughly 30 frames per second
        for (x = 14; x; x--) stall(0xFFFF);
    }
}
`,Ae=`// Snake on a 32x32 board. The C version of snake.asm.
//
// Input port 0: game controller. D-pad 1 (bits 0-3: up, down, left, right) steers the snake.
//               After a crash, release everything and press any button to play again.
// Output port 0: score.
//
// Run it in real time: the game is paced with stall(), which takes no time in unlimited mode.

#define SNAKE_COLOR 11
#define FOOD_COLOR 8
#define CRASH_COLOR 9

enum { EMPTY, SNAKE, FOOD };
enum { UP = 1, DOWN = 2, LEFT = 4, RIGHT = 8 };

int board[1024];        // one word per cell; a cell number is y * 32 + x
int body[1024];         // cell numbers of the snake's body: a ring buffer from tail to head
unsigned rng = 0x1D2B;

// Draw a cell in a colour: a 7x7 square, leaving a 1 pixel gap between cells
void draw_cell(int cell, int color) {
    int x = ((cell & 31) << 3) + 1;
    int y = ((cell >> 5) << 3) + 1;
    do {
        do pixel(x, y, color);
        while (++x & 7);
        x -= 7;
    } while (++y & 7);
}

// Put food on a random empty cell
void place_food() {
    int cell;
    if (!rng) rng = 0xACE1;     // the random number generator must never be 0
    do {
        rng ^= rng << 7;        // 16-bit xorshift
        rng ^= rng >> 9;
        rng ^= rng << 8;
        cell = rng & 1023;
    } while (board[cell]);
    board[cell] = FOOD;
    draw_cell(cell, FOOD_COLOR);
}

int main() {
    int head, head_ptr, tail_ptr;
    int dir, want, keys, timer;
    int x, y, i;
    unsigned score;

    for (;;) {
        // a new game: clear the screen and the board
        for (y = 0; y < 256; y++)
            for (x = 0; x < 256; x++) pixel(x, y, 0);
        for (i = 0; i < 1024; i++) board[i] = EMPTY;

        // start 3 cells long in the middle of the board (cells 526 to 528), moving right
        head_ptr = 0;
        tail_ptr = 0;
        for (head = 526;; head++) {
            board[head] = SNAKE;
            body[head_ptr] = head;
            draw_cell(head, SNAKE_COLOR);
            if (head == 528) break;
            head_ptr++;
        }
        dir = want = RIGHT;
        score = 0;
        out(0, score);
        place_food();

        for (;;) {
            // Time between moves: 60 stalls of 1.4 ms, getting shorter as the score goes up
            timer = 60 - (score >> 1);
            if (timer < 20) timer = 20;
            do {
                stall(0xFFFF);
                keys = in(0) & 15;
                if (keys) {
                    rng += timer;       // when keys are pressed makes the food less predictable
                    keys &= -keys;      // keep only the lowest pressed direction
                    // ignore it if it is the opposite of the current direction
                    if ((keys | dir) != (UP | DOWN) && (keys | dir) != (LEFT | RIGHT)) want = keys;
                }
            } while (--timer);

            // move the head one cell, crashing if that leaves the board
            dir = want;
            if (dir == UP) {
                if (head < 32) break;
                head -= 32;
            } else if (dir == DOWN) {
                if (head >= 992) break;
                head += 32;
            } else if (dir == LEFT) {
                if (!(head & 31)) break;
                head--;
            } else {
                if ((head & 31) == 31) break;
                head++;
            }

            if (board[head] == FOOD) {
                score++;
                out(0, score);
                place_food();
            } else {
                // not food: the tail moves on (before the crash test, so the snake can follow
                // its tail)
                i = body[tail_ptr];
                board[i] = EMPTY;
                draw_cell(i, 0);
                tail_ptr = (tail_ptr + 1) & 1023;
                if (board[head]) break;
            }
            board[head] = SNAKE;
            head_ptr = (head_ptr + 1) & 1023;
            body[head_ptr] = head;
            draw_cell(head, SNAKE_COLOR);
        }

        // game over: show where it crashed, then wait for the buttons to be let go and pressed
        draw_cell(head, CRASH_COLOR);
        while (in(0)) {
        }
        while (!in(0)) rng++;
    }
}
`,je=`// VGA demo: the same program as vga-demo.asm, written in C.
//
// Fills the screen with diagonal stripes of all 16 colours, which shift every frame, with a
// grid of white squares on top.

int main() {
    int x, y;
    int color = 0;

    for (;;) {
        for (y = 0; y < 256; y++) {
            for (x = 0; x < 256; x++) {
                if ((x & y & 0x60) == 0x60) pixel(x, y, 15);
                else pixel(x, y, color);
                color = (color + 1) & 15;
            }
            color = (color + 1) & 15;
        }
        color = (color + 1) & 15;
    }
}
`,j=class extends Error{line;constructor(e,t){super(t),this.line=e}},Me=[`<<=`,`>>=`,`...`,`->`,`++`,`--`,`<<`,`>>`,`<=`,`>=`,`==`,`!=`,`&&`,`||`,`+=`,`-=`,`*=`,`/=`,`%=`,`&=`,`|=`,`^=`],Ne={n:10,t:9,r:13,0:0,a:7,b:8,f:12,v:11,e:27,"\\":92,"'":39,'"':34,"?":63};function Pe(e){let t=``,n=0,r=e.length;for(;n<r;){let i=e[n];if(i===`"`||i===`'`){let a=n+1;for(;a<r&&e[a]!==i&&e[a]!==`
`;)a+=e[a]===`\\`?2:1;t+=e.slice(n,Math.min(a+1,r)),n=a+1}else if(i===`/`&&e[n+1]===`/`)for(;n<r&&e[n]!==`
`;)n++;else if(i===`/`&&e[n+1]===`*`){let i=e.indexOf(`*/`,n+2);i<0&&(i=r),t+=` `+e.slice(n,i).replace(/[^\n]/g,``),n=i+2}else t+=i,n++}return t}function Fe(e,t,n){return{kind:e,text:t,line:n,value:0,unsigned:!1,chars:[],hide:null}}function Ie(e,t,n){let r=e[t];if(r===`x`){let r=/^[0-9a-fA-F]+/.exec(e.slice(t+1));if(!r)throw new j(n,`Invalid \\x escape`);return[parseInt(r[0],16)&65535,t+1+r[0].length]}if(r>=`0`&&r<=`7`){let n=/^[0-7]{1,3}/.exec(e.slice(t));return[parseInt(n[0],8),t+n[0].length]}if(r in Ne)return[Ne[r],t+1];throw new j(n,`Unknown escape \\${r}`)}function Le(e,t,n){let r=0,i=e.length;for(;r<i;){let a=e[r];if(a===` `||a===`	`||a===`\r`||a===`\f`||a===`\v`){r++;continue}let o=e.slice(r),s;if(s=/^[A-Za-z_][A-Za-z0-9_]*/.exec(o))n.push(Fe(`id`,s[0],t)),r+=s[0].length;else if(s=/^(0[xX][0-9a-fA-F]+|0[bB][01]+|[0-9]+)([uUlL]*)/.exec(o)){let e=o[s[0].length]??``;if(e===`.`||/[A-Za-z0-9_]/.test(e)||/^[0-9]+$/.test(s[1])&&/^[eE]/.test(e))throw new j(t,`Invalid number "${/^[0-9A-Za-z_.]+/.exec(o)[0]}" (there is no floating point)`);let i=s[1],a;if(/^0[xX]/.test(i))a=parseInt(i.slice(2),16);else if(/^0[bB]/.test(i))a=parseInt(i.slice(2),2);else if(i.length>1&&i[0]===`0`){if(/[89]/.test(i))throw new j(t,`Invalid octal number "${i}"`);a=parseInt(i,8)}else a=parseInt(i,10);if(a>65535)throw new j(t,`Number ${s[0]} does not fit in 16 bits`);let c=Fe(`num`,s[0],t);c.value=a,c.unsigned=/[uU]/.test(s[2])||a>32767,n.push(c),r+=s[0].length}else if(a===`'`){let a=r+1,o;if(e[a]===`\\`)[o,a]=Ie(e,a+1,t);else if(a<i&&e[a]!==`'`)o=e.charCodeAt(a++);else throw new j(t,`Empty character literal`);if(e[a]!==`'`)throw new j(t,`Unterminated character literal`);let s=Fe(`num`,e.slice(r,a+1),t);s.value=o&65535,n.push(s),r=a+1}else if(a===`"`){let a=r+1,o=[];for(;a<i&&e[a]!==`"`;)if(e[a]===`\\`){let n;[n,a]=Ie(e,a+1,t),o.push(n)}else o.push(e.charCodeAt(a++));if(a>=i)throw new j(t,`Unterminated string`);let s=Fe(`str`,e.slice(r,a+1),t);s.chars=o,n.push(s),r=a+1}else{let e=Me.find(e=>o.startsWith(e));if(e)n.push(Fe(`punct`,e,t)),r+=e.length;else if(`+-*/%&|^~!<>=?:;,.()[]{}`.includes(a))n.push(Fe(`punct`,a,t)),r++;else throw new j(t,`Unexpected character "${a}"`)}}}function Re(e,t){let n=Pe(e).split(`
`),r=new Map,i=[],a=[],o=[],s=()=>o.every(e=>e.taken),c=()=>{let e=a.reverse();for(a=[];e.length;){let t=e.pop(),n=t.kind===`id`?r.get(t.text):void 0;if(!n||t.hide?.has(t.text)){i.push(t);continue}let a=new Set(t.hide??[]);a.add(t.text);let o=[];if(n.params){let r=e[e.length-1];if(!r||r.kind!==`punct`||r.text!==`(`){i.push(t);continue}e.pop();let s=[[]],c=0;for(;;){let n=e.pop();if(!n)throw new j(t.line,`Missing ")" after the arguments of macro ${t.text}`);if(n.kind===`punct`){if(n.text===`(`)c++;else if(n.text===`)`){if(c===0)break;c--}else if(n.text===`,`&&c===0){s.push([]);continue}}s[s.length-1].push(n)}if(n.params.length===0&&s.length===1&&s[0].length===0&&(s=[]),s.length!==n.params.length)throw new j(t.line,`Macro ${t.text} takes ${n.params.length} argument(s), ${s.length} given`);for(let e of n.body){let r=e.kind===`id`?n.params.indexOf(e.text):-1;if(r>=0)for(let e of s[r])o.push({...e,line:t.line});else o.push({...e,line:t.line,hide:a})}}else for(let e of n.body)o.push({...e,line:t.line,hide:a});for(let t=o.length-1;t>=0;t--)e.push(o[t])}};for(let e=0;e<n.length;e++){let i=e+1,l=n[e];for(;/\\\s*$/.test(l)&&e+1<n.length;)l=l.replace(/\\\s*$/,` `)+n[++e];let u=/^\s*#\s*([A-Za-z_]*)\s*(.*)$/.exec(l);if(!u){s()&&Le(l,i,a);continue}let[,d,f]=u,p=f.trim();if(d===`ifdef`||d===`ifndef`){if(!/^[A-Za-z_]\w*$/.test(p))throw new j(i,`Expected a name after #${d}`);o.push({taken:r.has(p)===(d===`ifdef`),outer:s(),line:i})}else if(d===`else`){let e=o[o.length-1];if(!e)throw new j(i,`#else without #ifdef`);e.taken=!e.taken}else if(d===`endif`){if(!o.pop())throw new j(i,`#endif without #ifdef`)}else if(!s())continue;else if(d===`define`){let e=/^([A-Za-z_]\w*)(\(([^)]*)\))?(.*)$/.exec(p);if(!e)throw new j(i,`Expected: #define NAME value`);c();let n=null;if(e[2]!==void 0){n=e[3].trim()?e[3].split(`,`).map(e=>e.trim()):[];for(let e of n)if(!/^[A-Za-z_]\w*$/.test(e))throw new j(i,`Invalid macro parameter "${e}"`)}let a=[];Le(e[4],i,a),r.has(e[1])&&t(i,`Macro ${e[1]} is defined again`),r.set(e[1],{params:n,body:a})}else if(d===`undef`)c(),r.delete(p);else if(d===`include`)t(i,`#include is ignored: there are no header files, and the built-in functions need none`);else if(d!==`pragma`&&d!==``)throw d===`error`?new j(i,`#error ${p}`):new j(i,`#${d} is not supported`)}if(o.length)throw new j(o[o.length-1].line,`Missing #endif`);return c(),i.push(Fe(`eof`,``,n.length)),i}var ze={kind:`void`},Be={kind:`int`,unsigned:!1},Ve={kind:`int`,unsigned:!0},He={kind:`int`,unsigned:!1,char:!0},Ue={kind:`int`,unsigned:!0,char:!0},We=e=>({kind:`ptr`,to:e}),Ge=e=>e.kind===`ptr`,Ke=e=>e.kind===`int`,qe=e=>e.kind===`int`||e.kind===`ptr`,M=e=>e.kind===`ptr`||e.kind===`int`&&e.unsigned;function Je(e,t){switch(e.kind){case`int`:case`ptr`:return 1;case`void`:return 1;case`array`:if(e.len<0)throw new j(t,`The size of this array is not known`);return e.len*Je(e.of,t);case`struct`:if(!e.complete)throw new j(t,`struct ${e.name} is not defined yet`);return e.size;case`func`:throw new j(t,`A function has no size`)}}function Ye(e){switch(e.kind){case`void`:return`void`;case`int`:return e.char?e.unsigned?`unsigned char`:`char`:e.unsigned?`unsigned`:`int`;case`ptr`:return Ye(e.to)+`*`;case`array`:return`${Ye(e.of)}[${e.len<0?``:e.len}]`;case`struct`:return`struct ${e.name}`;case`func`:return`${Ye(e.ret)}(${e.params.map(e=>Ye(e.type)).join(`, `)})`}}var Xe={pixel:{params:3,ret:ze,help:`pixel(x, y, color)`},in:{params:1,ret:Ve,help:`in(port)`},out:{params:2,ret:ze,help:`out(port, value)`},stall:{params:1,ret:ze,help:`stall(clocks)`},halt:{params:0,ret:ze,help:`halt()`},mulhi:{params:2,ret:Be,help:`mulhi(a, b)`},umulhi:{params:2,ret:Ve,help:`umulhi(a, b)`}};function Ze(e,t){let n=``;for(;e.kind===`array`;e=e.of)n+=`[${e.len}]`;if(e.kind===`ptr`&&e.to.kind===`func`)return`${Ye(e.to.ret)} (*${t}${n})()`;let r=``;for(;e.kind===`ptr`;e=e.to)r+=`*`;return`${Ye(e)} ${r}${t}${n}`}var Qe=e=>e.kind===`int`&&e.char===!0,$e=e=>`0x`+e.toString(16).toUpperCase().padStart(4,`0`);function et(e){return e===39||e===34||e===92?`\\`+String.fromCharCode(e):e>=32&&e<127?String.fromCharCode(e):e===10?`\\n`:`\\x`+e.toString(16)}function tt(e,t,n){let r=``;for(let i=0;i<n;i++){let n=e(t+i);if(n===0)return`"${r}"`;if(n>255)return null;if(i>=40)return`"${r}"...`;r+=et(n)}return`"${r}"`}function nt(e,t,n){if(t&=65535,e.kind===`ptr`){if(t===0)return`0 (null)`;let r=Qe(e.to)?tt(n,t,4096):null;return r?`${$e(t)} ${r}`:$e(t)}let r=e.kind===`int`&&e.unsigned,i=String(r||!(t&32768)?t:t-65536);return Qe(e)&&t>=32&&t<127?`${i} '${et(t)}'`:i}function rt(e,t,n,r={left:24}){if(e.kind===`array`){if(Qe(e.of)){let r=tt(t,n,e.len);if(r)return r}let i=Je(e.of,0),a=[];for(let o=0;o<e.len;o++){if(r.left<=0){a.push(`...`);break}a.push(rt(e.of,t,n+o*i,r))}return`{${a.join(`, `)}}`}if(e.kind===`struct`){let i=[];for(let a of e.members){if(r.left<=0){i.push(`...`);break}i.push(`${a.name}: ${rt(a.type,t,n+a.offset,r)}`)}return`{${i.join(`, `)}}`}return r.left--,nt(e,t(n),t)}function it(e,t){return e.functions.find(e=>t>=e.start&&t<e.end)}var at=[`gt`,`lt`,`sgt`,`slt`,`eq`,`z`,`neg`,`pos`,`ev`,`bev`,`c`,`of`],ot=[`le`,`ge`,`sle`,`sge`,`neq`,`nz`,`posz`,`negz`,`od`,`bod`,`nc`,`nof`];function st(){let e=[],t=(t,n,r,i,a=i)=>e.push({name:t,opcode:n,hasDest:r,minArgs:i,maxArgs:a});return t(`nop`,0,!1,0),t(`stl`,4,!1,1),t(`hlt`,8,!1,0),[`add`,`sub`,`rshift`,`lshift`,`mul`,`smul`,`umul`,`sumul`].forEach((e,n)=>t(e,16+n,!0,2)),t(`test`,24,!0,1),t(`not`,25,!0,1),[`and`,`or`,`xor`,`nand`,`nor`,`xnor`].forEach((e,n)=>t(e,26+n,!0,2)),at.forEach((e,n)=>t(`b`+e,32+n,!1,1)),t(`brn`,47,!1,1),ot.forEach((e,n)=>t(`b`+e,48+n,!1,1)),at.forEach((e,n)=>t(`s`+e,64+n,!0,1,2)),t(`mov`,79,!0,1),t(`ldi`,79,!0,1),ot.forEach((e,n)=>t(`s`+e,80+n,!0,1,2)),t(`lod`,192,!0,1),t(`str`,196,!0,1),t(`in`,200,!0,1),t(`out`,204,!0,1),t(`gfxsp`,208,!0,2),e}var ct=st(),lt=new Map(ct.map(e=>[e.name,e])),ut=(()=>{let e=new Map;for(let t of ct)e.has(t.opcode)||e.set(t.opcode,t);return e})(),dt=[`psh`,`pop`,`cal`,`ret`,`dw`],ft=[`GT`,`LT`,`SGT`,`SLT`,`EQ`,`Z`,`S`,`POS`,`P`,`BP`,`C`,`OF`,`-`,`-`,`-`,`TR`],pt=13312,mt=8192,ht=48e6;function gt(e){let t=e>>>24,n=e>>>22&3,r=e>>>21&1,i=e>>>20&1,a=e>>>16&15,o=e&65535,s=t;(t<16||t>=192)&&(s=t&252),s>=208&&s<=215&&(s=208);let c=ut.get(s);if(!c)return`??? 0x${(e>>>0).toString(16).padStart(8,`0`)}`;let l=[c.name.toUpperCase()];c.hasDest&&l.push(`$${a}`);let u=(e,t)=>t?`$${e&15}`:String(e);return n===1?l.push(u(o,r)):n===2&&(r&&!i?l.push(u(o>>>12,1),u(o&4095,0)):!r&&i?l.push(u(o>>>4,0),u(o&15,1)):l.push(u(o>>>8,r),u(o&255,i))),l.join(` `)}function _t(e){let t=(e,t)=>e.toString(16).toUpperCase().padStart(t,`0`);return Array.from(e,(e,n)=>`${gt(e).padEnd(22)}; ${t(n,4)}  ${t(e>>>0,8)}`).join(`
`)}var N=class extends Error{line;constructor(e,t){super(t),this.line=e}},vt=`.__generated_label_`;function yt(e,t){let n;if(/^0x[0-9a-f_]+$/.test(e))n=parseInt(e.slice(2).replaceAll(`_`,``),16);else if(/^0b[01_]+$/.test(e))n=parseInt(e.slice(2).replaceAll(`_`,``),2);else if(/^0o[0-7_]+$/.test(e))n=parseInt(e.slice(2).replaceAll(`_`,``),8);else if(/^[+-]?[0-9][0-9_]*$/.test(e))n=parseInt(e.replaceAll(`_`,``),10);else throw new N(t,`Invalid number or unknown symbol "${e}"`);return n}function bt(e){let t=[],n=(e,n)=>t.push({severity:`warning`,line:e,message:n});try{return{program:xt(e,n),diagnostics:t}}catch(e){if(e instanceof N)return t.push({severity:`error`,line:e.line,message:e.message}),{program:null,diagnostics:t};throw e}}function xt(e,t){let n=[{op:[`ldi`,`$15`,`8192`],labels:[],line:0}],r=new Map,i=[],a=0,o=e.split(`
`);for(let e=0;e<o.length;e++){let s=e+1,c=o[e],l=c.indexOf(`;`);if(l>=0&&(c=c.slice(0,l)),c=c.trim().toLowerCase(),c){if(c.startsWith(`.`)){if(/\s/.test(c))throw new N(s,`Label names cannot contain spaces`);i.push(c),a=s}else if(c.startsWith(`@define`)||c.startsWith(`#define`)){let e=c.split(/\s+/);if(e.length<3)throw new N(s,`Expected: @define NAME VALUE`);r.has(e[1])&&t(s,`"${e[1]}" is already defined; this definition replaces it everywhere`),r.set(e[1],e.slice(2).join(` `))}else n.push({op:c.split(/\s+/),labels:i,line:s}),i=[]}}i.length&&t(a,`Label ${i.join(`, `)} is not followed by an instruction`),r.set(`sp`,`$15`);let s=n.filter(e=>e.op[0]===`dw`);n=n.filter(e=>e.op[0]!==`dw`);let c=0,l=()=>{n.forEach((e,t)=>{e.op.forEach((r,i)=>{if(!r.startsWith(`~`))return;let a=r[1];if(a!==`+`&&a!==`-`)throw new N(e.line,`Relative address "${r}" must look like ~+N or ~-N`);let o=t+(a===`-`?-1:1)*yt(r.slice(2),e.line);if(o<0||o>=n.length)throw new N(e.line,`Relative jump target ${r} is out of bounds`);let s=`${vt}${++c}`;e.op[i]=s,n[o].labels.push(s)})})};l();let u=[];for(let e of n){let{op:t,labels:n,line:r}=e;if(t[0]===`cal`){if(t.length!==2)throw new N(r,`CAL expects one argument`);u.push({op:[`psh`,`~+2`],labels:n,line:r}),u.push({op:[`brn`,t[1]],labels:[],line:r})}else if(t[0]===`ret`){if(t.length!==1)throw new N(r,`RET expects no arguments`);u.push({op:[`pop`,`$14`],labels:n,line:r}),u.push({op:[`brn`,`$14`],labels:[],line:r})}else u.push(e)}n=u,l(),u=[];for(let e of n){let{op:t,labels:n,line:r}=e;if(t[0]===`psh`){if(t.length!==2)throw new N(r,`PSH expects one argument`);u.push({op:[`sub`,`$15`,`$15`,`1`],labels:n,line:r}),u.push({op:[`ldi`,`$14`,t[1]],labels:[],line:r}),u.push({op:[`str`,`$14`,`$15`],labels:[],line:r})}else if(t[0]===`pop`){if(t.length!==2)throw new N(r,`POP expects one argument`);u.push({op:[`lod`,t[1],`$15`],labels:n,line:r}),u.push({op:[`add`,`$15`,`$15`,`1`],labels:[],line:r})}else u.push(e)}if(n=u,l(),n.length>13312)throw new N(0,`Program is ${n.length} instructions, ROM holds ${pt}`);let d=new Map,f=new Map,p=new Map;n.forEach((e,t)=>{for(let n of e.labels){if(d.has(n))throw new N(e.line,`Label ${n} is already defined`);d.set(n,t),n.startsWith(vt)||f.set(n,t)}});let m=[],h=[];for(let e of s){for(let t of e.labels){if(d.has(t))throw new N(e.line,`Label ${t} is already defined`);d.set(t,m.length),p.set(t,m.length)}if(e.op.length<2)throw new N(e.line,`DW expects at least one value`);for(let t of e.op.slice(1)){if(t=r.get(t)??t,t.startsWith(`.`)){h.push({index:m.length,label:t,line:e.line}),m.push(0);continue}let n=yt(t,e.line);if(n>65535||n<-32768)throw new N(e.line,`Value ${t} does not fit in a 16-bit word`);m.push(n&65535)}}if(m.length>8192)throw new N(0,`DW data is ${m.length} words, RAM holds ${mt}`);for(let{index:e,label:t,line:n}of h){let r=d.get(t);if(r===void 0)throw new N(n,`Label ${t} is not defined`);m[e]=r}let g=(e,t)=>{let n=e.replace(/^[r$m#p%]+/,``);if(n.startsWith(`.`)){let e=d.get(n);if(e===void 0)throw new N(t,`Label ${n} is not defined`);return e}return yt(n,t)},_=e=>e!==void 0&&(e.startsWith(`$`)||e.startsWith(`r`)),v=new Uint32Array(n.length),y=new Int32Array(n.length),b=new Map;return n.forEach((e,n)=>{let{line:i}=e,a=e.op.map((e,t)=>t>0?r.get(e)??e:e),o=a[0],s=lt.get(o);if(!s)throw new N(i,`Unknown instruction "${o.toUpperCase()}"`);let c=o.toUpperCase(),l=a.length-1-!!s.hasDest;if(l<0)throw new N(i,`${c} requires a destination register`);if(l<s.minArgs)throw new N(i,`${c} expects at least ${s.minArgs} argument(s)`);if(l>s.maxArgs)throw new N(i,`${c} expects at most ${s.maxArgs} argument(s)`);let u=0,d=a.slice(1);if(s.hasDest){if(u=g(a[1],i),u<0||u>15)throw new N(i,`Destination "${a[1]}" is not a register (0-15)`);_(a[1])||t(i,`Destination "${a[1]}" is always treated as a register number`),d=a.slice(2)}let m=e=>e?.replace(/^[r$m#p%]+/,``)??``;s.opcode>=32&&s.opcode<=63&&p.has(m(d[0]))&&t(i,`${c} jumps to ${m(d[0])}, which is a data (DW) label, not code`),(o===`lod`||o===`str`)&&f.has(m(d[0]))&&t(i,`${c} uses ${m(d[0])}, which is a code label, not a data (DW) label`);let h=_(d[0]),x=_(d[1]),S=(e,n,r,a)=>{let o=(1<<n)-1;if(a&&(e<0||e>15))throw new N(i,`"${r}" is not a valid register (0-15)`);if(e>o)throw new N(i,`Value ${r} is too large for ${n} bits in this argument form`);if(e<0){if(e<-(1<<n-1))throw new N(i,`Value ${r} is too small for ${n} bits`);t(i,`Negative value ${r} is truncated to ${n} bits`+(n<16?` and zero-extended by the CPU`:``))}return e&o},C=0;if(l===1)C=S(g(d[0],i),16,d[0],h);else if(l===2){let e=g(d[0],i),t=g(d[1],i);C=h&&x?S(e,8,d[0],!0)<<8|S(t,8,d[1],!0):h?S(e,4,d[0],!0)<<12|S(t,12,d[1],!1):x?S(e,12,d[0],!1)<<4|S(t,4,d[1],!0):S(e,8,d[0],!1)<<8|S(t,8,d[1],!1)}v[n]=(s.opcode<<24|l<<22|!!h<<21|!!x<<20|u<<16|C)>>>0,y[n]=i,i>0&&!b.has(i)&&b.set(i,n)}),{rom:v,ram:Uint16Array.from(m),lineOfAddr:y,addrOfLine:b,romLabels:f,ramLabels:p}}function St(e){let t=/memory_initialization_radix\s*=\s*(\d+)\s*;/i.exec(e),n=t?parseInt(t[1],10):16,r=/memory_initialization_vector\s*=([^;]*);?/i.exec(e);if(!r)throw Error(`Not a .coe file: memory_initialization_vector not found`);let i=[];for(let e of r[1].split(/[\s,]+/)){if(!e)continue;let t=parseInt(e,n);if(Number.isNaN(t))throw Error(`Invalid value "${e}" in .coe file`);i.push(t)}return i}function Ct(e,t){let n=Array.from(e,e=>(e>>>0).toString(16).padStart(t,`0`)),r=`memory_initialization_radix=16;
memory_initialization_vector=
`;return n.length?r+n.join(`,
`)+`;
`:r}function wt(e,t=[]){if(e.length>13312)throw Error(`ROM image is larger than ${pt} words`);if(t.length>8192)throw Error(`RAM image is larger than ${mt} words`);return{rom:Uint32Array.from(e),ram:Uint16Array.from(t),lineOfAddr:Int32Array.from(e,(e,t)=>t+1),addrOfLine:new Map(e.map((e,t)=>[t+1,t])),romLabels:new Map,ramLabels:new Map}}var Tt=new Set([`void`,`char`,`short`,`int`,`long`,`signed`,`unsigned`,`float`,`double`,`struct`,`union`,`enum`,`const`,`volatile`,`static`,`extern`,`register`,`typedef`,`inline`,`auto`,`_Bool`]),Et=new Set([...Tt,`if`,`else`,`while`,`do`,`for`,`return`,`break`,`continue`,`switch`,`case`,`default`,`goto`,`sizeof`]),Dt=e=>e&32768?e-65536:e;function Ot(e,t,n,r){let i=r?t:Dt(t),a=r?n:Dt(n),o;switch(e){case`+`:o=t+n;break;case`-`:o=t-n;break;case`*`:o=Math.imul(t,n);break;case`&`:o=t&n;break;case`|`:o=t|n;break;case`^`:o=t^n;break;case`<<`:o=n>=16?0:t<<n;break;case`>>`:o=r?n>=16?0:t>>>n:i>>Math.min(n,15);break;case`/`:if(n===0)return null;o=r?Math.floor(t/n):Math.trunc(i/a);break;case`%`:if(n===0)return null;o=r?t%n:i%a;break;default:return null}return o&65535}function kt(e,t,n,r){let i=r?t:Dt(t),a=r?n:Dt(n);switch(e){case`==`:return+(i===a);case`!=`:return+(i!==a);case`<`:return+(i<a);case`<=`:return+(i<=a);case`>`:return+(i>a);default:return+(i>=a)}}var At={"<":`>`,">":`<`,"<=":`>=`,">=":`<=`,"==":`==`,"!=":`!=`},jt={"<":`>=`,">=":`<`,">":`<=`,"<=":`>`,"==":`!=`,"!=":`==`},Mt=class{tokens;warn;pos=0;tok;line=0;scopes=[new Map];tags=[new Map];labels=new Set;strings=new Map;fn=null;loopDepth=0;switches=[];funcs=[];globals=[];constructor(e,t){this.tokens=e,this.warn=t,this.tok=e[0]}error(e,t=this.tok.line){throw new j(t,e)}next(){let e=this.tok;return this.line=e.line,e.kind!==`eof`&&(this.tok=this.tokens[++this.pos]),e}seek(e){this.pos=e,this.tok=this.tokens[e]}peek(e){return this.tokens[Math.min(this.pos+e,this.tokens.length-1)]}is(e){return this.tok.kind===`punct`&&this.tok.text===e}isWord(e){return this.tok.kind===`id`&&this.tok.text===e}eat(e){return this.is(e)?(this.next(),!0):!1}eatWord(e){return this.isWord(e)?(this.next(),!0):!1}describe(){return this.tok.kind===`eof`?`the end of the file`:`"${this.tok.text}"`}expect(e){if(!this.eat(e)){let t=e===`;`&&this.line?this.line:this.tok.line;this.error(`Expected "${e}" but found ${this.describe()}`,t)}}ident(e=`a name`){return(this.tok.kind!==`id`||Et.has(this.tok.text))&&this.error(`Expected ${e} but found ${this.describe()}`),this.next().text}push(){this.scopes.push(new Map),this.tags.push(new Map)}pop(){this.scopes.pop(),this.tags.pop()}find(e){for(let t=this.scopes.length-1;t>=0;t--){let n=this.scopes[t].get(e);if(n)return n}}define(e,t,n){let r=this.scopes[this.scopes.length-1];r.has(e)&&this.error(`"${e}" is already declared`,n),r.set(e,t)}uniqueLabel(e){let t=e.toLowerCase();(/^l\d+$/.test(t)||t.startsWith(`__`))&&(t+=`_`);let n=t;for(let e=2;this.labels.has(n);e++)n=`${t}_${e}`;return this.labels.add(n),n}node(e,t,n={}){return{kind:e,type:t,line:this.line,...n}}stmt(e,t,n={}){return{kind:e,line:t,body:[],expr:null,init:null,step:null,then:null,otherwise:null,cases:[],value:0,isDefault:!1,name:``,asmLabel:``,...n}}num(e,t=Be){return this.node(`num`,t,{value:e&65535})}varNode(e){return e.global||(e.weight+=10**Math.min(this.loopDepth,4)),this.node(`var`,e.type,{v:e})}newVar(e,t,n,r){return{name:e,type:t,line:n,global:r,label:``,addr:0,init:null,param:-1,addrTaken:!1,weight:0,reg:-1,stackOff:0}}newLocal(e,t,n){t.kind===`void`&&this.error(`Variable "${e}" cannot be void`,n),Je(t,n);let r=this.newVar(e,t,n,!1);return qe(t)||(r.addrTaken=!0),this.fn.locals.push(r),this.define(e,{kind:`var`,v:r},n),r}newGlobal(e,t,n,r=e){let i=this.newVar(e,t,n,!0);return i.label=this.uniqueLabel(r),this.globals.push(i),i}stringVar(e){let t=e.join(`,`),n=this.strings.get(t);return n||(n=this.newGlobal(``,{kind:`array`,of:He,len:e.length+1},this.line,`str`),n.init=[...e,0],this.strings.set(t,n)),n}rv(e){let t=e.type;if(e.kind===`builtin`&&this.error(`Built-in function ${e.name} can only be called`,e.line),t.kind===`array`){let n=We(t.of);if(e.kind===`var`)return e.v.global?this.node(`gaddr`,n,{v:e.v,value:0,line:e.line}):(e.v.addrTaken=!0,this.node(`laddr`,n,{v:e.v,value:0,line:e.line}));if(e.kind===`deref`)return{...e.a,type:n};this.error(`This array cannot be used here`,e.line)}return t.kind===`struct`&&this.error(`A struct cannot be used as a value: use its members, or a pointer to it`,e.line),e}scalar(e,t){return e=this.rv(e),qe(e.type)||this.error(`${t} must be a number or a pointer, not ${Ye(e.type)}`,e.line),e}isLvalue(e){return e.kind===`var`&&e.type.kind!==`array`||e.kind===`deref`}lvalue(e,t){return this.isLvalue(e)||this.error(`${t} needs something that can be assigned to`,e.line),qe(e.type)||this.error(`${t} does not work on a whole ${e.type.kind}: do it member by member`,e.line),e}addrOf(e){let t=We(e.type);if(e.kind===`var`)return e.v.global?this.node(`gaddr`,t,{v:e.v,value:0,line:e.line}):(e.v.addrTaken=!0,this.node(`laddr`,t,{v:e.v,value:0,line:e.line}));if(e.kind===`deref`)return{...e.a,type:t};if(e.kind===`faddr`)return e;this.error(`Cannot take the address of this`,e.line)}common(e,t){return M(e)||M(t)?Ve:Be}arith(e,t,n,r,i){if(t.kind===`num`&&n.kind===`num`){let a=Ot(e,t.value,n.value,i);return a===null&&this.error(`Division by zero`,n.line),this.num(a,r)}let a=e=>e.kind===`num`?2:+(e.kind===`gaddr`||e.kind===`laddr`);`+*&|^`.includes(e)&&a(t)>a(n)&&([t,n]=[n,t]);let o=e=>e.kind===`gaddr`||e.kind===`laddr`,s=e=>e.kind===`bin`&&(e.op===`+`||e.op===`-`)&&e.b.kind===`num`,c=(e,t)=>e===`+`?Dt(t.value):-Dt(t.value);if(n.kind===`num`){let a=n.value;if(a===0&&[`+`,`-`,`|`,`^`,`<<`,`>>`].includes(e)||a===1&&(e===`*`||e===`/`))return this.retype(t,r);if((e===`/`||e===`%`)&&a===0&&this.error(`Division by zero`,n.line),e===`+`||e===`-`){if(o(t))return{...t,type:r,value:t.value+c(e,n)};if(s(t))return this.arith(`+`,t.a,this.num(c(t.op,t.b)+c(e,n),n.type),r,i)}}return e===`+`&&o(n)&&s(t)?this.arith(`+`,t.a,{...n,value:n.value+c(t.op,t.b)},r,i):this.node(`bin`,r,{op:e,a:t,b:n,uns:i})}retype(e,t){return this.node(`cast`,t,{a:e,line:e.line})}ptrAdd(e,t,n){Ge(e.type)||this.error(`Internal error: not a pointer`),Ke(t.type)||this.error(`Only a number can be added to a pointer`,t.line),e.type.to.kind===`func`&&this.error(`Arithmetic on a function pointer`,e.line);let r=Je(e.type.to,e.line),i=r===1?t:this.arith(`*`,t,this.num(r),Be,!1);return this.arith(n>0?`+`:`-`,e,i,e.type,!0)}binary(e,t,n){t=this.scalar(t,`The left side of ${e}`),n=this.scalar(n,`The right side of ${e}`);let r=Ge(t.type),i=Ge(n.type);if(e===`+`){if(r&&i&&this.error(`Two pointers cannot be added`,t.line),i)return this.ptrAdd(n,t,1);if(r)return this.ptrAdd(t,n,1)}else if(e===`-`){if(r&&i){let e=Je(t.type.to,t.line),r=this.arith(`-`,t,n,Be,!1);return e>1?this.arith(`/`,r,this.num(e),Be,!1):r}if(i&&this.error(`A pointer cannot be subtracted from a number`,n.line),r)return this.ptrAdd(t,n,-1)}else(r||i)&&this.error(`Operator ${e} needs numbers, not pointers`,t.line);if(e===`<<`||e===`>>`)return this.arith(e,t,n,t.type,M(t.type));let a=this.common(t.type,n.type);return this.arith(e,t,n,a,M(a))}compare(e,t,n){t=this.scalar(t,`The left side of ${e}`),n=this.scalar(n,`The right side of ${e}`);let r=M(t.type)||M(n.type);return t.kind===`num`&&n.kind===`num`?this.num(kt(e,t.value,n.value,r)):(t.kind===`num`&&([t,n]=[n,t],e=At[e]),r&&n.kind===`num`&&n.value===0&&(e===`>`?e=`!=`:e===`<=`&&(e=`==`)),this.node(`cmp`,Be,{op:e,a:t,b:n,uns:r}))}lognot(e){return e=this.scalar(e,`The operand of !`),e.kind===`num`?this.num(+!e.value):e.kind===`cmp`?{...e,op:jt[e.op]}:(e.kind,this.node(`lognot`,Be,{a:e}))}assignNode(e,t){return e=this.lvalue(e,`Assignment`),t=this.scalar(t,`The assigned value`),this.node(`assign`,e.type,{a:e,b:t})}opAssign(e,t,n){if(t=this.lvalue(t,`${e}=`),n=this.scalar(n,`The right side of ${e}=`),Ge(n.type)&&this.error(`The right side of ${e}= cannot be a pointer`,n.line),Ge(t.type)){e!==`+`&&e!==`-`&&this.error(`${e}= does not work on a pointer`,t.line);let r=Je(t.type.to,t.line);r!==1&&(n=this.arith(`*`,n,this.num(r),Be,!1))}let r=e===`<<`||e===`>>`?M(t.type):M(t.type)||M(n.type);return(e===`/`||e===`%`)&&n.kind===`num`&&n.value===0&&this.error(`Division by zero`,n.line),this.node(`opassign`,t.type,{op:e,a:t,b:n,uns:r})}incDec(e,t,n){e=this.lvalue(e,t>0?`++`:`--`);let r=Ge(e.type)?Je(e.type.to,e.line):1;return this.node(`incdec`,e.type,{a:e,value:t*r,post:n})}cast(e,t){return e.kind===`void`?this.node(`cast`,e,{a:t}):(qe(e)||this.error(`Cannot cast to ${Ye(e)}`),t=this.scalar(t,`The value that is cast`),t.kind===`num`?this.num(t.value,e):this.node(`cast`,e,{a:t}))}deref(e){e=this.rv(e),Ge(e.type)||this.error(`Only a pointer can be dereferenced, not ${Ye(e.type)}`,e.line);let t=e.type.to;return t.kind===`func`?e:(t.kind===`void`&&this.error(`A void pointer cannot be dereferenced: cast it first`,e.line),this.node(`deref`,t,{a:e}))}member(e,t){let n=e.type;n.kind!==`struct`&&this.error(`"${t}" is used on something that is not a struct`),n.complete||this.error(`struct ${n.name} is not defined yet`);let r=n.members.find(e=>e.name===t);r||this.error(`struct ${n.name} has no member "${t}"`);let i=this.addrOf(e);return this.node(`deref`,r.type,{a:this.arith(`+`,i,this.num(r.offset),We(r.type),!0)})}call(e,t){let n=(e,n)=>{t.length!==e&&this.error(`${n} takes ${e} argument(s), ${t.length} given`)};if(e.kind===`builtin`){let r=Xe[e.name];return n(r.params,e.name),this.node(`call`,r.ret,{name:e.name,f:null,args:t})}if(e.kind===`faddr`){let r=e.f;return n(r.type.params.length,r.name),this.node(`call`,r.type.ret,{name:``,f:r,args:t})}let r=this.rv(e);Ge(r.type)&&r.type.to.kind===`func`||this.error(`This is not a function`,e.line);let i=r.type.to;return n(i.params.length,`The function`),this.node(`call`,i.ret,{name:``,f:null,a:r,args:t})}expr(){let e=this.assign();for(;this.eat(`,`);){let t=this.assign();e=this.node(`comma`,t.type,{a:e,b:t})}return e}constExpr(){let e=this.conditional();return e.kind!==`num`&&this.error(`A constant is needed here`,e.line),e.value}assign(){let e=this.conditional();if(this.tok.kind!==`punct`)return e;let t=this.tok.text;return t===`=`?(this.next(),this.assignNode(e,this.assign())):[`+=`,`-=`,`*=`,`/=`,`%=`,`&=`,`|=`,`^=`,`<<=`,`>>=`].includes(t)?(this.next(),this.opAssign(t.slice(0,-1),e,this.assign())):e}conditional(){let e=this.logOr();if(!this.eat(`?`))return e;let t=this.scalar(e,`The condition`),n=this.expr();this.expect(`:`);let r=this.conditional(),i;return n.type.kind===`void`||r.type.kind===`void`?i=ze:(n=this.scalar(n,`The value`),r=this.scalar(r,`The value`),i=Ge(n.type)?n.type:Ge(r.type)?r.type:this.common(n.type,r.type)),t.kind===`num`?this.retype(t.value?n:r,i):this.node(`cond`,i,{a:t,b:n,c:r})}logOr(){let e=this.logAnd();for(;this.eat(`||`);){e=this.scalar(e,`The left side of ||`);let t=this.scalar(this.logAnd(),`The right side of ||`);e=e.kind===`num`&&t.kind===`num`?this.num(+!!(e.value||t.value)):this.node(`logor`,Be,{a:e,b:t})}return e}logAnd(){let e=this.bitOr();for(;this.eat(`&&`);){e=this.scalar(e,`The left side of &&`);let t=this.scalar(this.bitOr(),`The right side of &&`);e=e.kind===`num`&&t.kind===`num`?this.num(+!!(e.value&&t.value)):this.node(`logand`,Be,{a:e,b:t})}return e}bitOr(){let e=this.bitXor();for(;this.eat(`|`);)e=this.binary(`|`,e,this.bitXor());return e}bitXor(){let e=this.bitAnd();for(;this.eat(`^`);)e=this.binary(`^`,e,this.bitAnd());return e}bitAnd(){let e=this.equality();for(;this.eat(`&`);)e=this.binary(`&`,e,this.equality());return e}equality(){let e=this.relational();for(;;)if(this.eat(`==`))e=this.compare(`==`,e,this.relational());else if(this.eat(`!=`))e=this.compare(`!=`,e,this.relational());else return e}relational(){let e=this.shift();for(;;){let t=this.tok.kind===`punct`?this.tok.text:``;if(t!==`<`&&t!==`<=`&&t!==`>`&&t!==`>=`)return e;this.next(),e=this.compare(t,e,this.shift())}}shift(){let e=this.additive();for(;;)if(this.eat(`<<`))e=this.binary(`<<`,e,this.additive());else if(this.eat(`>>`))e=this.binary(`>>`,e,this.additive());else return e}additive(){let e=this.multiplicative();for(;;)if(this.eat(`+`))e=this.binary(`+`,e,this.multiplicative());else if(this.eat(`-`))e=this.binary(`-`,e,this.multiplicative());else return e}multiplicative(){let e=this.castExpr();for(;;)if(this.eat(`*`))e=this.binary(`*`,e,this.castExpr());else if(this.eat(`/`))e=this.binary(`/`,e,this.castExpr());else if(this.eat(`%`))e=this.binary(`%`,e,this.castExpr());else return e}isTypeStart(e){return e.kind===`id`&&(Tt.has(e.text)||this.find(e.text)?.kind===`typedef`)}castExpr(){if(this.is(`(`)&&this.isTypeStart(this.peek(1))){this.next();let e=this.typeName();return this.expect(`)`),this.cast(e,this.castExpr())}return this.unary()}unary(){if(this.eat(`+`))return this.scalar(this.castExpr(),`The operand of +`);if(this.eat(`-`)){let e=this.scalar(this.castExpr(),`The operand of -`);return Ke(e.type)||this.error(`A pointer cannot be negated`,e.line),e.kind===`num`?this.num(-e.value,e.type):this.node(`neg`,e.type,{a:e})}if(this.eat(`~`)){let e=this.scalar(this.castExpr(),`The operand of ~`);return Ke(e.type)||this.error(`~ needs a number`,e.line),e.kind===`num`?this.num(~e.value,e.type):this.node(`bitnot`,e.type,{a:e})}if(this.eat(`!`))return this.lognot(this.castExpr());if(this.eat(`*`))return this.deref(this.castExpr());if(this.eat(`&`)){let e=this.castExpr();return this.isLvalue(e)||e.kind===`faddr`||e.kind===`var`&&e.type.kind===`array`||this.error(`& needs a variable`,e.line),this.addrOf(e)}if(this.eat(`++`))return this.incDec(this.unary(),1,!1);if(this.eat(`--`))return this.incDec(this.unary(),-1,!1);if(this.eatWord(`sizeof`)){let e;return this.is(`(`)&&this.isTypeStart(this.peek(1))?(this.next(),e=this.typeName(),this.expect(`)`)):e=this.unary().type,this.num(Je(e,this.line))}return this.postfix()}postfix(){let e=this.primary();for(;;)if(this.eat(`[`)){let t=this.expr();this.expect(`]`),e=this.deref(this.binary(`+`,e,t))}else if(this.eat(`(`)){let t=[];if(!this.is(`)`))do t.push(this.scalar(this.assign(),`An argument`));while(this.eat(`,`));this.expect(`)`),e=this.call(e,t)}else if(this.eat(`.`))e=this.member(e,this.ident(`a member name`));else if(this.eat(`->`)){let t=this.rv(e);Ge(t.type)||this.error(`-> needs a pointer to a struct`,t.line),e=this.member(this.node(`deref`,t.type.to,{a:t}),this.ident(`a member name`))}else if(this.eat(`++`))e=this.incDec(e,1,!0);else if(this.eat(`--`))e=this.incDec(e,-1,!0);else return e}primary(){let e=this.tok;if(this.eat(`(`)){let e=this.expr();return this.expect(`)`),e}if(e.kind===`num`)return this.next(),this.num(e.value,e.unsigned?Ve:Be);if(e.kind===`str`){let e=[];for(;this.tok.kind===`str`;)e.push(...this.next().chars);return this.node(`var`,{kind:`array`,of:He,len:e.length+1},{v:this.stringVar(e)})}if(e.kind===`id`&&!Et.has(e.text)){this.next();let t=this.find(e.text);if(!t){if(e.text in Xe)return this.node(`builtin`,ze,{name:e.text});this.is(`(`)&&this.error(`Function "${e.text}" is not declared yet: define it earlier in the file, or add a prototype`,e.line),this.error(`"${e.text}" is not declared`,e.line)}if(t.kind===`var`)return this.varNode(t.v);if(t.kind===`func`)return this.node(`faddr`,We(t.f.type),{f:t.f});if(t.kind===`enum`)return this.num(t.value);this.error(`"${e.text}" is a type, not a value`,e.line)}this.error(`Expected an expression but found ${this.describe()}`)}declSpec(){let e=!1,t=!1,n=null,r=!1,i=!1,a=!1,o=!1,s=!1;for(;;){let c=this.tok;if(c.kind!==`id`)break;let l=c.text;if(l===`typedef`)e=!0;else if(l===`static`)t=!0;else if(![`const`,`volatile`,`extern`,`register`,`inline`,`auto`].includes(l)){if(l===`void`)n=ze;else if(l===`char`||l===`short`||l===`int`||l===`_Bool`)i=!0,l===`char`&&(a=!0);else if(l===`signed`||l===`unsigned`)o=!0,r=l===`unsigned`;else if(l===`long`)this.error(`long is not supported: every number is 16 bits (use mulhi() for wide products)`);else if(l===`float`||l===`double`)this.error(`There is no floating point: use fixed point numbers`);else if(l===`union`)this.error(`union is not supported`);else if(l===`struct`){this.next(),n=this.structSpec(),s=!0;continue}else if(l===`enum`){this.next(),this.enumSpec(),i=!0,s=!0;continue}else{let e=!n&&!i&&!o?this.find(l):void 0;if(e?.kind!==`typedef`)break;n=e.type}}s=!0,this.next()}return s||this.error(`Expected a type but found ${this.describe()}`),n&&(i||o)&&this.error(`These type names cannot be combined`),{type:n??(a?r?Ue:He:r?Ve:Be),typedef:e,isStatic:t}}structSpec(){let e=this.tok.line,t=this.tok.kind===`id`&&!Et.has(this.tok.text)?this.next().text:``,n=this.tags[this.tags.length-1];if(!this.eat(`{`)){t||this.error(`Expected a struct name or "{"`);for(let e=this.tags.length-1;e>=0;e--){let n=this.tags[e].get(t);if(n)return n}let e={kind:`struct`,name:t,members:[],size:0,complete:!1};return n.set(t,e),e}let r=t?n.get(t):void 0;r?.complete&&this.error(`struct ${t} is already defined`,e),r||(r={kind:`struct`,name:t||`(unnamed)`,members:[],size:0,complete:!1},t&&n.set(t,r));let i=0;for(;!this.eat(`}`);){let e=this.declSpec();do{let t=this.declarator(e.type);t.name||this.error(`Expected a member name`),(t.type.kind===`func`||t.type.kind===`void`)&&this.error(`Member "${t.name}" has an invalid type`,t.line),r.members.some(e=>e.name===t.name)&&this.error(`Member "${t.name}" is declared twice`,t.line),r.members.push({name:t.name,type:t.type,offset:i}),i+=Je(t.type,t.line)}while(this.eat(`,`));this.expect(`;`)}return r.size=i,r.complete=!0,r}enumSpec(){if(this.tok.kind===`id`&&!Et.has(this.tok.text)&&this.next(),!this.eat(`{`))return;let e=0;for(;!this.is(`}`);){let t=this.tok.line,n=this.ident();if(this.eat(`=`)&&(e=Dt(this.constExpr())),this.define(n,{kind:`enum`,value:e&65535},t),e++,!this.eat(`,`))break}this.expect(`}`)}declarator(e){for(;this.eat(`*`);)for(e=We(e);this.isWord(`const`)||this.isWord(`volatile`);)this.next();if(this.eat(`(`)){let t=this.pos;this.declarator(Be),this.expect(`)`),e=this.typeSuffix(e);let n=this.pos;this.seek(t);let r=this.declarator(e);return this.seek(n),r}let t=this.tok.line,n=``;return this.tok.kind===`id`&&!Et.has(this.tok.text)&&(n=this.next().text),{type:this.typeSuffix(e),name:n,line:t}}typeSuffix(e){if(this.eat(`(`))return(e.kind===`array`||e.kind===`func`||e.kind===`struct`)&&this.error(`A function can only return a number, a pointer or nothing`),{kind:`func`,ret:e,params:this.paramList()};if(this.eat(`[`)){let t=-1;this.is(`]`)||(t=this.constExpr(),t===0&&this.error(`An array needs at least one element`)),this.expect(`]`);let n=this.typeSuffix(e);return(n.kind===`void`||n.kind===`func`)&&this.error(`Invalid array element type`),{kind:`array`,of:n,len:t}}return e}paramList(){let e=[];if(this.isWord(`void`)&&this.peek(1).kind===`punct`&&this.peek(1).text===`)`)return this.next(),this.next(),e;if(this.eat(`)`))return e;do{this.is(`...`)&&this.error(`Functions with a variable number of arguments are not supported`);let t=this.declSpec(),n=this.declarator(t.type),r=n.type;r.kind===`array`?r=We(r.of):r.kind===`func`?r=We(r):r.kind===`struct`?this.error(`A struct cannot be passed to a function: pass a pointer to it`,n.line):r.kind===`void`&&this.error(`A parameter cannot be void`,n.line),e.push({name:n.name,type:r})}while(this.eat(`,`));return this.expect(`)`),e}typeName(){let e=this.declSpec(),t=this.declarator(e.type);return t.name&&this.error(`Expected a type, without a name`,t.line),t.type}initializer(e,t,n){let r=(e,t)=>{if(e+1>=t||!this.is(`,`))return!1;let n=this.peek(1);return n.kind===`punct`&&n.text===`}`?!1:(this.next(),!0)};if(e.kind===`array`){let i=Je(e.of,this.tok.line),a=this.is(`{`)&&this.peek(1).kind===`str`;if(e.of.kind===`int`&&(this.tok.kind===`str`||a)){a&&this.next();let r=[];for(;this.tok.kind===`str`;)r.push(...this.next().chars);a&&(this.eat(`,`),this.expect(`}`));let i=e.len<0?r.length+1:e.len;return r.length>i&&this.error(`The string is longer than the array`),r.forEach((r,i)=>n(t+i,e.of,this.num(r))),{kind:`array`,of:e.of,len:i}}if(this.eat(`{`)){let r=0;for(;!this.is(`}`)&&(e.len>=0&&r>=e.len&&this.error(`More values than the array has elements`),this.initializer(e.of,t+r*i,n),r++,this.eat(`,`)););return this.expect(`}`),e.len<0?{kind:`array`,of:e.of,len:Math.max(r,1)}:e}e.len<0&&this.error(`Expected "{"`);for(let a=0;a<e.len&&(this.initializer(e.of,t+a*i,n),r(a,e.len));a++);return e}if(e.kind===`struct`){e.complete||this.error(`struct ${e.name} is not defined yet`);let i=this.eat(`{`);for(let a=0;a<e.members.length&&!(i&&this.is(`}`));a++){let o=e.members[a];if(this.initializer(o.type,t+o.offset,n),i){if(!this.eat(`,`))break}else if(!r(a,e.members.length))break}return i&&this.expect(`}`),e}let i=this.eat(`{`),a=this.scalar(this.assign(),`An initial value`);return i&&(this.eat(`,`),this.expect(`}`)),n(t,e,a),e}constEntry(e){for(;e.kind===`cast`;)e=e.a;if(e.kind===`num`)return e.value;if(e.kind===`gaddr`)return{v:e.v,offset:e.value};if(e.kind===`faddr`)return{f:e.f};this.error(`The initial value of a global must be a constant`,e.line)}declareFunc(e){let t=e.type,n=this.find(e.name);if(n&&n.kind===`func`)return n.f.type.params.length!==t.params.length&&this.error(`${e.name} was declared with a different number of parameters`,e.line),n.f;let r={name:e.name,label:this.uniqueLabel(e.name),type:t,line:e.line,params:[],locals:[],body:null};return this.scopes[0].set(e.name,{kind:`func`,f:r}),n&&this.error(`"${e.name}" is already declared`,e.line),this.funcs.push(r),r}globalDecl(e,t){let n=e.type;n.kind===`void`&&this.error(`Variable "${e.name}" cannot be void`,e.line);let r=null;if(this.eat(`=`)){r=[],n=this.initializer(n,0,(e,t,n)=>r[e]=this.constEntry(n));let t=Je(n,e.line);for(let e=0;e<t;e++)r[e]??=0}Je(n,e.line);let i=this.newGlobal(e.name,n,e.line,t);i.init=r,this.define(e.name,{kind:`var`,v:i},e.line)}functionBody(e,t){e.body&&this.error(`Function ${e.name} is already defined`,t.line),e.type=t.type,e.line=t.line,this.fn=e,this.push(),e.type.params.forEach((n,r)=>{n.name||this.error(`Parameter ${r+1} of ${e.name} has no name`,t.line);let i=this.newLocal(n.name,n.type,t.line);i.param=r,e.params.push(i)}),this.expect(`{`),e.body=this.block(!1),this.pop(),this.fn=null}parseUnit(){for(;this.tok.kind!==`eof`;){if(this.eat(`;`))continue;let e=this.declSpec();if(!this.eat(`;`))for(let t=!0;;t=!1){let n=this.declarator(e.type);if(n.name||this.error(`Expected a name but found ${this.describe()}`),e.typedef)this.define(n.name,{kind:`typedef`,type:n.type},n.line);else if(n.type.kind===`func`){let e=this.declareFunc(n);if(t&&this.is(`{`)){this.functionBody(e,n);break}}else this.globalDecl(n,n.name);if(!this.eat(`,`)){this.expect(`;`);break}}}return{funcs:this.funcs,globals:this.globals}}localDecl(e){let t=this.declSpec();if(!this.eat(`;`)){do{let n=this.declarator(t.type);if(n.name||this.error(`Expected a name but found ${this.describe()}`),t.typedef){this.define(n.name,{kind:`typedef`,type:n.type},n.line);continue}if(n.type.kind===`func`){this.declareFunc(n);continue}if(t.isStatic){this.globalDecl(n,`${this.fn.name}_${n.name}`);continue}if(!this.eat(`=`)){this.newLocal(n.name,n.type,n.line);continue}let r=t=>e.push(this.stmt(`expr`,n.line,{expr:t}));if(qe(n.type)){let e=this.assign(),t=this.newLocal(n.name,n.type,n.line);r(this.assignNode(this.varNode(t),e));continue}let i=[],a=this.initializer(n.type,0,(e,t,n)=>i.push({off:e,type:t,n})),o=this.newLocal(n.name,a,n.line),s=Je(a,n.line),c=new Set(i.map(e=>e.off));for(let e=0;e<s;e++)c.has(e)||i.push({off:e,type:Be,n:this.num(0)});for(let e of i){let t=this.node(`laddr`,We(e.type),{v:o,value:e.off});r(this.assignNode(this.node(`deref`,e.type,{a:t}),e.n))}}while(this.eat(`,`));this.expect(`;`)}}block(e=!0){let t=this.line;e&&this.push();let n=[];for(;!this.eat(`}`);){this.tok.kind===`eof`&&this.error(`Missing "}"`);let e=this.peek(1).kind===`punct`&&this.peek(1).text===`:`;this.isTypeStart(this.tok)&&!e?this.localDecl(n):n.push(this.statement())}return e&&this.pop(),this.stmt(`block`,t,{body:n})}condition(){this.expect(`(`);let e=this.scalar(this.expr(),`A condition`);return this.expect(`)`),e}statement(){let e=this.tok.line;if(this.eat(`{`))return this.block();if(this.eat(`;`))return this.stmt(`empty`,e);if(this.tok.kind===`id`){let t=this.tok.text;if(t===`if`){this.next();let t=this.condition(),n=this.statement(),r=this.eatWord(`else`)?this.statement():null;return this.stmt(`if`,e,{expr:t,then:n,otherwise:r})}if(t===`while`){this.next(),this.loopDepth++;let t=this.condition(),n=this.statement();return this.loopDepth--,this.stmt(`while`,e,{expr:t,then:n})}if(t===`do`){this.next(),this.loopDepth++;let t=this.statement();this.eatWord(`while`)||this.error(`Expected "while" after the body of do`);let n=this.condition();return this.loopDepth--,this.expect(`;`),this.stmt(`do`,e,{expr:n,then:t})}if(t===`for`){this.next(),this.expect(`(`),this.push();let t=null;if(this.isTypeStart(this.tok)){let n=[];this.localDecl(n),t=this.stmt(`block`,e,{body:n})}else this.eat(`;`)||(t=this.stmt(`expr`,e,{expr:this.expr()}),this.expect(`;`));this.loopDepth++;let n=this.is(`;`)?null:this.scalar(this.expr(),`A condition`);this.expect(`;`);let r=this.is(`)`)?null:this.expr();this.expect(`)`);let i=this.statement();return this.loopDepth--,this.pop(),this.stmt(`for`,e,{init:t,expr:n,step:r,then:i})}if(t===`return`){this.next();let t=this.fn.type.ret,n=null;return this.is(`;`)?t.kind!==`void`&&this.fn.name!==`main`&&this.error(`${this.fn.name} must return a value`,e):(n=this.scalar(this.expr(),`The returned value`),t.kind===`void`&&this.error(`${this.fn.name} returns nothing, so return cannot have a value`,e)),this.expect(`;`),this.stmt(`return`,e,{expr:n})}if(t===`break`||t===`continue`)return this.next(),this.expect(`;`),this.stmt(t,e);if(t===`switch`){this.next();let t=this.condition(),n=this.stmt(`switch`,e,{expr:t});return this.switches.push(n),n.then=this.statement(),this.switches.pop(),n}if(t===`case`||t==="default"){this.next();let n=this.switches[this.switches.length-1];n||this.error(`${t} outside a switch`,e);let r=this.stmt(`case`,e,{isDefault:t==="default"});return r.isDefault?n.cases.some(e=>e.isDefault)&&this.error(`This switch already has a default`,e):(r.value=this.constExpr(),n.cases.some(e=>!e.isDefault&&e.value===r.value)&&this.error(`This case is already there`,e)),this.expect(`:`),n.cases.push(r),r}if(t===`goto`){this.next();let t=this.ident(`a label`);return this.expect(`;`),this.stmt(`goto`,e,{name:t})}t===`else`&&this.error(`else without a matching if`);let n=this.peek(1);if(!Et.has(t)&&n.kind===`punct`&&n.text===`:`)return this.next(),this.next(),this.stmt(`label`,e,{name:t})}let t=this.expr();return this.expect(`;`),[`cmp`,`bin`,`num`,`var`,`neg`,`bitnot`,`lognot`].includes(t.kind)&&this.warn(e,`This statement does nothing`),this.stmt(`expr`,e,{expr:t})}};function Nt(e,t){return new Mt(e,t).parseUnit()}var Pt=e=>`label`in e,P=(e,t=!1)=>({reg:e,temp:t}),F=(e,t=``,n=``)=>({imm:e&65535,text:t,note:n}),I=e=>`imm`in e,Ft=e=>I(e)?e.text||String(e.imm):`$${e.reg}`,It=P(15),Lt=new Set([`add`,`sub`,`rshift`,`lshift`,`mul`,`smul`,`umul`,`sumul`,`test`,`not`,`and`,`or`,`xor`,`nand`,`nor`,`xnor`]),Rt={"+":`add`,"*":`mul`,"&":`and`,"|":`or`,"^":`xor`},zt={eq:`neq`,neq:`eq`,z:`nz`,nz:`z`,lt:`ge`,ge:`lt`,gt:`le`,le:`gt`,slt:`sge`,sge:`slt`,sgt:`sle`,sle:`sgt`,neg:`posz`,posz:`neg`,pos:`negz`,negz:`pos`},Bt={"==":`eq`,"!=":`neq`,"<":`slt`,"<=":`sle`,">":`sgt`,">=":`sge`},Vt={"==":`eq`,"!=":`neq`,"<":`lt`,"<=":`le`,">":`gt`,">=":`ge`},Ht={"==":`z`,"!=":`nz`,"<":`neg`,">=":`posz`,">":`pos`,"<=":`negz`},Ut={"==":`z`,"!=":`nz`},Wt=new Set(Object.keys(zt).map(e=>`s`+e)),Gt=e=>Lt.has(e)||Wt.has(e)||e===`mov`||e===`ldi`||e===`lod`||e===`in`,Kt=e=>e>0&&!(e&e-1),qt=e=>31-Math.clz32(e),Jt=new Map;function Yt(e){let t=Jt.get(e);if(t!==void 0)return t;t=null;for(let n=0;n<16&&!t;n++){let r=2**(16+n),i=Math.ceil(r/e);if(i>65535)break;let a=!0;for(let t=0;t<=65535&&a;t++)a=Math.floor(t*i/r)===Math.floor(t/e);a&&(t={mul:i,shift:n})}return Jt.set(e,t),t}function Xt(e,t){if(t.kind!==`num`||t.value===0)return!0;let n=t.value;return n===1?!1:e?!Kt(n)&&!Yt(n):!(n<=16384&&Kt(n))}function Zt(e){switch(e.kind){case`deref`:case`neg`:case`bitnot`:case`lognot`:case`cast`:case`incdec`:return[e.a];case`assign`:case`opassign`:case`bin`:case`cmp`:case`logand`:case`logor`:case`comma`:return[e.a,e.b];case`cond`:return[e.a,e.b,e.c];case`call`:return e.f||e.name?e.args:[e.a,...e.args];default:return[]}}function Qt(e){return e.kind===`call`&&!e.name||(e.kind===`bin`||e.kind===`opassign`)&&(e.op===`/`||e.op===`%`)&&Xt(e.uns,e.b)?!0:Zt(e).some(Qt)}function $t(e){return e?e.expr&&Qt(e.expr)||e.step&&Qt(e.step)?!0:e.body.some($t)||$t(e.init)||$t(e.then)||$t(e.otherwise):!1}function en(e){return e.kind===`assign`||e.kind===`opassign`||e.kind===`incdec`||e.kind===`call`?!1:Zt(e).every(en)}var tn=e=>e.kind===`cast`?tn(e.a):e;function nn(e){return(e.kind===`cast`?0:1)+Zt(e).reduce((e,t)=>e+nn(t),0)}function rn(e){let t=e.init;t?.kind===`block`&&(t=t.body[t.body.length-1]??null);let n=t?.kind===`expr`?t.expr:null,r=e.expr;if(!n||n.kind!==`assign`||n.a.kind!==`var`||n.b.kind!==`num`||!r)return!1;let i=tn(r);if(i.kind===`var`)return i.v===n.a.v&&n.b.value!==0;if(r.kind!==`cmp`||r.b.kind!==`num`)return!1;let a=tn(r.a);return a.kind!==`var`||a.v!==n.a.v?!1:kt(r.op,n.b.value,r.b.value,r.uns)===1}function an(e){return e.kind===`logand`||e.kind===`logor`?!1:e.kind!==`lognot`||an(e.a)}var on=class extends j{},sn=class{labelCount=0;usesUdiv=!1;usesSdiv=!1;queue=[];symbols=new Map;newLabel(){return`.L${++this.labelCount}`}reference(e,t){if(!e.body)throw new j(t,`Function ${e.name} is declared but has no body`);this.queue.includes(e)||this.queue.push(e)}symbol(e){return this.symbols.get(e)??String(e.addr)}},cn=class{cg;f;limit;items=[];line;adj=0;flagsReg=-1;busy=Array(16).fill(!1);temps=[];isTemp=Array(16).fill(!1);saved=new Set;leaf=!1;entry;calls;frame=0;retLabel;loops=[];userLabels=new Map;constructor(e,t,n){this.cg=e,this.f=t,this.limit=n,this.line=t.line,this.entry=t.name===`main`,this.calls=$t(t.body),this.retLabel=e.newLabel()}error(e,t=this.line){throw new j(t,e)}assignRegisters(){let e=this.f,t=e=>!e.addrTaken&&qe(e.type);for(let t of e.locals)t.reg=-1;this.leaf=!this.calls&&e.params.length<=8&&e.params.every(t);let n=(e,t)=>t.weight-e.weight,r=Array.from({length:13},(e,t)=>t+1);if(this.leaf){e.params.forEach((e,t)=>e.reg=t+1);let i=r.slice(e.params.length),a=e.params.length;for(let r of e.locals.filter(e=>e.param<0&&t(e)&&e.weight>0).sort(n)){if(a++>=this.limit)break;r.reg=i.shift()}this.temps=i}else{let r=[6,7,8,9,10,11,12,13];for(let i of e.locals.filter(e=>t(e)&&e.weight>0).sort(n)){if(!r.length)break;i.reg=r.shift()}this.temps=[1,2,3,4,5]}for(let e of this.temps)this.isTemp[e]=!0;let i=0;for(let t of e.locals)t.reg>=6&&this.saved.add(t.reg),t.reg>=0||t.weight===0&&!t.addrTaken||(t.stackOff=i,i+=Je(t.type,t.line));i>4e3&&this.error(`The local variables of ${e.name} do not fit on the stack: make the large ones global`,e.line),this.frame=i}alloc(){for(let e of this.temps)if(!this.busy[e])return this.busy[e]=!0,e>=6&&this.saved.add(e),e;throw new on(this.line,`This expression is too complicated: split it into smaller statements`)}allocOther(e){if(e===null||this.busy[e])return this.alloc();this.busy[e]=!0;let t=this.alloc();return this.busy[e]=!1,t}free(e){this.busy[e]=!1}freeCount(){let e=0;for(let t of this.temps)this.busy[t]||e++;return e}release(e){!I(e)&&e.temp&&(this.busy[e.reg]=!1)}ins(e,t,...n){let r=n.map(Ft);t!==null&&r.unshift(`$${t}`),Lt.has(e)?this.flagsReg=t||(e===`test`&&!I(n[0])?n[0].reg:-1):t!==null&&t===this.flagsReg&&Gt(e)&&(this.flagsReg=-1);let i=n.map(e=>I(e)?e.note:``).filter(Boolean).join(`, `),a={op:e,args:r,line:this.line,note:i,call:!1};return this.items.push(a),a}label(e){this.items.push({label:e}),this.flagsReg=-1}jump(e){this.ins(`brn`,null,F(0,e))}legal(e,t){if(I(e)&&I(t)){if(e.imm<=255&&t.imm<=255)return[e,t];e=this.toReg(e)}return I(e)?[e.imm<=4095?e:this.toReg(e),t]:I(t)?[e,t.imm<=4095?t:this.toReg(t)]:[e,t]}toReg(e){if(!I(e))return e;if(e.imm===0&&!e.text)return P(0);let t=this.alloc();return this.ins(`ldi`,t,e),P(t,!0)}aluTo(e,t,n,r){let[i,a]=this.legal(n,r);this.ins(e,t,i,a),i!==n&&this.release(i),a!==r&&this.release(a)}alu(e,t,n,r){let[i,a]=this.legal(n,r);this.release(i),this.release(a);let o=t??this.alloc();return this.ins(e,o,i,a),o}move(e,t){if(I(t)){if(e===null&&t.imm===0&&!t.text)return 0;let n=e??this.alloc();return this.ins(`ldi`,n,t),n}return e===null?t.reg:(e!==t.reg&&this.ins(`mov`,e,t),this.release(t),e)}load(e,t){I(t)?this.ins(`ldi`,e,t):t.reg!==e&&this.ins(`mov`,e,t)}testReg(e){this.flagsReg!==e&&this.ins(`test`,0,P(e))}addConst(e,t){t>0?this.aluTo(`add`,e,P(e),F(t)):t<0&&this.aluTo(`sub`,e,P(e),F(-t))}push(e){this.ins(`sub`,15,It,F(1)),this.ins(`str`,e,It),this.adj++}pop(e){this.ins(`lod`,e,It),this.ins(`add`,15,It,F(1)),this.adj--}gaddr(e){let t=e.v;return e.value===0?F(t.addr,this.cg.symbol(t)):F(t.addr+e.value,``,`${t.name||`string`}${e.value<0?``:`+`}${e.value}`)}need(e){let t=(e,t)=>Math.max(e,t,Math.min(e,t)+1,1),n=(e,t)=>e===`/`||e===`%`?2:+(e===`>>`&&!t);switch(e.kind){case`num`:return+(e.value>4095);case`var`:return!e.v.global&&e.v.reg>=0?0:1;case`gaddr`:case`laddr`:case`faddr`:return 1;case`cast`:return this.need(e.a);case`deref`:case`neg`:case`bitnot`:case`lognot`:return Math.max(this.need(e.a),1);case`bin`:return Qt(e)?99:n(e.op,e.uns)?t(Math.max(this.need(e.a),1),this.need(e.b))+n(e.op,e.uns):t(this.need(e.a),this.need(e.b));case`cmp`:return t(this.need(e.a),this.need(e.b));case`logand`:case`logor`:case`comma`:return Math.max(this.need(e.a),this.need(e.b),1);case`cond`:return Math.max(this.need(e.a),this.need(e.b),this.need(e.c),3);case`assign`:case`opassign`:case`incdec`:{if(Qt(e))return 99;let r=e.kind===`opassign`?n(e.op,e.uns):0;return e.a.kind===`var`&&!e.a.v.global&&e.a.v.reg>=0?e.kind===`incdec`?1:Math.max(this.need(e.b),1)+r:e.kind===`incdec`?this.needAddr(e.a)+2:t(this.needAddr(e.a),this.need(e.b))+(e.kind===`assign`?1:2+r)}case`call`:{if(!e.name)return 99;let t=e.args.map(e=>this.need(e)).sort((e,t)=>t-e);return Math.max(1,...t.map((e,t)=>e+t))+1}default:return 1}}needAddr(e){return e.kind===`var`?e.v.global||e.v.reg>=0?0:1:this.need(e.a)}operand(e){switch(e.kind){case`num`:return F(e.value);case`gaddr`:return this.gaddr(e);case`cast`:return this.operand(e.a);case`var`:if(!e.v.global&&e.v.reg>=0)return P(e.v.reg)}let t=this.gen(e,null);return P(t,this.isTemp[t])}many(e){let t=e.map((e,t)=>t).sort((t,n)=>e[n].need-e[t].need),n=Array(e.length),r=[],i=[];for(let a of t){if(this.freeCount()<e[a].need)for(let e of r){let t=n[e];I(t)||!t.temp||i.includes(e)||(this.push(t.reg),this.release(t),i.push(e))}n[a]=e[a].get(),r.push(a)}for(let e=i.length-1;e>=0;e--){let t=this.alloc();this.pop(t),n[i[e]]=P(t,!0)}return n}pair(e,t){let[n,r]=this.many([{need:this.need(e),get:()=>this.operand(e)},{need:this.need(t),get:()=>this.operand(t)}]);return[n,r]}stackOffset(e,t){return e.stackOff+t+this.adj}lvalAddr(e){if(e.kind!==`var`)return this.operand(e.a);let t=e.v;if(t.global)return F(t.addr,this.cg.symbol(t));let n=this.stackOffset(t,0);if(n===0)return It;let r=this.alloc();return this.aluTo(`add`,r,It,F(n)),P(r,!0)}gen(e,t){switch(e.line&&(this.line=e.line),e.kind){case`num`:return this.move(t,F(e.value));case`gaddr`:return this.move(t,this.gaddr(e));case`faddr`:return this.cg.reference(e.f,e.line),this.move(t,F(0,`.`+e.f.label));case`laddr`:{let n=this.stackOffset(e.v,e.value),r=t??this.alloc();return n===0?this.ins(`mov`,r,It):this.aluTo(`add`,r,It,F(n)),r}case`var`:{let n=e.v;if(n.global){let e=t??this.alloc();return this.ins(`lod`,e,F(n.addr,this.cg.symbol(n))),e}if(n.reg>=0)return this.move(t,P(n.reg));let r=this.stackOffset(n,0),i=t??this.alloc();return r===0?this.ins(`lod`,i,It):(this.aluTo(`add`,i,It,F(r)),this.ins(`lod`,i,P(i))),i}case`deref`:{let n=this.postIncrement(e.a);if(n){let e=t??this.alloc();return this.ins(`lod`,e,P(n.r)),e!==n.r&&this.addConst(n.r,n.delta),e}let r=this.operand(e.a);this.release(r);let i=t??this.alloc();return this.line=e.line,this.ins(`lod`,i,r),i}case`cast`:return this.gen(e.a,t);case`neg`:return this.alu(`sub`,t,F(0),this.toReg(this.operand(e.a)));case`bitnot`:{let n=this.toReg(this.operand(e.a));this.release(n);let r=t??this.alloc();return this.ins(`not`,r,n),r}case`bin`:{let[n,r]=this.pair(e.a,e.b);return this.line=e.line,this.binary(e.op,e.uns,n,r,t)}case`cmp`:case`lognot`:case`logand`:case`logor`:return this.genBool(e,t);case`cond`:return this.genSelect(e,t);case`comma`:return this.discard(e.a),this.gen(e.b,t);case`assign`:case`opassign`:case`incdec`:return this.genAssign(e,t,!0);case`call`:return this.genCall(e,t,!0);case`builtin`:this.error(`Built-in function ${e.name} can only be called`,e.line)}}postIncrement(e){if(e=tn(e),e.kind!==`incdec`||!e.post)return null;let t=e.a;return t.kind!==`var`||t.v.global||t.v.reg<0?null:{r:t.v.reg,delta:e.value}}binary(e,t,n,r,i){switch(e){case`+`:case`*`:case`&`:case`|`:case`^`:return I(n)&&!I(r)&&([n,r]=[r,n]),e===`+`&&I(r)&&!r.text&&r.imm>4095&&65536-r.imm<=4095?this.alu(`sub`,i,n,F(65536-r.imm)):this.alu(Rt[e],i,n,r);case`-`:return I(r)&&!r.text&&r.imm>4095&&65536-r.imm<=4095?this.alu(`add`,i,n,F(65536-r.imm)):this.alu(`sub`,i,n,r);case`<<`:return this.alu(`lshift`,i,n,r);case`>>`:return t?this.alu(`rshift`,i,n,r):I(r)?this.shiftRightSigned(i,n,r.imm):this.shiftRightSignedBy(i,n,r);case`/`:case`%`:return this.divide(e,t,n,r,i)}this.error(`Internal error: operator ${e}`)}shiftRightSigned(e,t,n){if(n=Math.min(n,15),n===0)return this.move(e,t);let r=this.toReg(t);if(n>=5)return this.alu(`sumul`,e,r,F(1<<16-n));let i=this.allocOther(e);if(n>=2)return this.ins(`ldi`,i,F(1<<16-n)),this.alu(`sumul`,e,r,P(i,!0));this.testReg(r.reg),this.ins(`sneg`,i,F(32768)),this.release(r);let a=e??this.alloc();return this.ins(`rshift`,a,r,F(1)),this.ins(`or`,a,P(a),P(i)),this.free(i),a}shiftRightSignedBy(e,t,n){let r=this.toReg(t),i=this.alloc(),a=this.cg.newLabel(),o=this.cg.newLabel();return this.testReg(r.reg),this.ins(`bposz`,null,F(0,a)),this.ins(`not`,i,r),this.ins(`rshift`,i,P(i),n),this.ins(`not`,i,P(i)),this.jump(o),this.label(a),this.ins(`rshift`,i,r,n),this.label(o),this.release(r),this.release(n),e===null?i:(e!==i&&this.ins(`mov`,e,P(i)),this.free(i),e)}divide(e,t,n,r,i){let a=I(r)&&!r.text?r.imm:0;if(a===1)return e===`/`?this.move(i,n):(this.release(n),this.move(i,F(0)));if(a&&t){if(Kt(a))return e===`/`?this.alu(`rshift`,i,n,F(qt(a))):this.alu(`and`,i,n,F(a-1));let t=Yt(a);if(t){let r=this.toReg(n);if(e===`/`){if(!t.shift)return this.alu(`umul`,i,r,F(t.mul));let e=this.alu(`umul`,null,r,F(t.mul));return this.alu(`rshift`,i,P(e,!0),F(t.shift))}let o=this.alloc();this.aluTo(`umul`,o,r,F(t.mul)),t.shift&&this.aluTo(`rshift`,o,P(o),F(t.shift)),this.aluTo(`mul`,o,P(o),F(a)),this.release(r);let s=i??o;return this.ins(`sub`,s,r,P(o)),i!==null&&this.free(o),s}}else if(a&&a<=16384&&Kt(a)){let t=qt(a),r=this.toReg(n),o=this.alloc();if(this.testReg(r.reg),this.ins(`sneg`,o,F(a-1)),this.ins(`add`,o,P(o),r),e===`/`)return this.release(r),this.shiftRightSigned(i,P(o,!0),t);let s=this.shiftRightSigned(null,P(o,!0),t);this.ins(`lshift`,s,P(s),F(t)),this.release(r);let c=i??s;return this.ins(`sub`,c,r,P(s)),i!==null&&this.free(s),c}t?this.cg.usesUdiv=!0:this.cg.usesSdiv=!0,this.release(n),this.release(r);let o=this.saveTemps(i);return!I(r)&&r.reg===1?!I(n)&&n.reg===2?(this.ins(`mov`,3,P(1)),this.ins(`mov`,1,P(2)),this.ins(`mov`,2,P(3))):(this.ins(`mov`,2,P(1)),this.load(1,n)):(this.load(1,n),this.load(2,r)),this.callTo(F(0,t?`.__udivmod`:`.__sdivmod`)),this.afterCall(e===`/`?1:2,o,i,!0)}flags(e){if(e.kind===`lognot`)return zt[this.flags(e.a)];if(e.kind===`cast`)return this.flags(e.a);if(e.kind===`cmp`){let[t,n]=this.pair(e.a,e.b);if(this.line=e.line,I(n)&&n.imm===0&&!n.text&&!I(t)){let n=(e.uns?Ut:Ht)[e.op];if(n)return this.testReg(t.reg),this.release(t),n}let[r,i]=this.legal(t,n);return this.ins(`sub`,0,r,i),this.release(r),this.release(i),(e.uns?Vt:Bt)[e.op]}let t=this.toReg(this.operand(e));return this.testReg(t.reg),this.release(t),`nz`}branch(e,t,n,r){if(e.kind===`num`){let i=e.value?t:n;i!==r&&this.jump(i)}else if(e.kind===`lognot`)this.branch(e.a,n,t,r);else if(e.kind===`cast`)this.branch(e.a,t,n,r);else if(e.kind===`comma`)this.discard(e.a),this.branch(e.b,t,n,r);else if(e.kind===`logand`){let i=this.cg.newLabel();this.branch(e.a,i,n,i),this.label(i),this.branch(e.b,t,n,r)}else if(e.kind===`logor`){let i=this.cg.newLabel();this.branch(e.a,t,i,i),this.label(i),this.branch(e.b,t,n,r)}else{let i=this.flags(e);r===t?this.ins(`b`+zt[i],null,F(0,n)):(this.ins(`b`+i,null,F(0,t)),r!==n&&this.jump(n))}}genBool(e,t){if(an(e)){let n=this.flags(e),r=t??this.alloc();return this.ins(`s`+n,r,F(1)),r}let n=this.cg.newLabel(),r=this.cg.newLabel(),i=this.cg.newLabel();this.branch(e,n,r,n);let a=t??this.alloc();return this.label(n),this.ins(`ldi`,a,F(1)),this.jump(i),this.label(r),this.ins(`ldi`,a,F(0)),this.label(i),a}genSelect(e,t){let n=e=>(e=tn(e),e.kind===`num`||e.kind===`gaddr`||e.kind===`var`&&!e.v.global&&e.v.reg>=0);if(an(e.a)&&n(e.b)&&n(e.c)){let n=this.flags(e.a),r=this.operand(e.b),i=this.operand(e.c);if(I(i)&&i.imm===0&&!i.text){let e=t??this.alloc();return this.ins(`s`+n,e,r),e}let[a,o]=this.legal(r,i);this.release(a),this.release(o);let s=t??this.alloc();return this.ins(`s`+n,s,a,o),s}let r=this.cg.newLabel(),i=this.cg.newLabel(),a=this.cg.newLabel(),o=t??this.alloc();return t===null&&(this.busy[o]=!1),this.branch(e.a,r,i,r),this.label(r),this.gen(e.b,o),this.jump(a),this.label(i),this.gen(e.c,o),this.label(a),t===null&&(this.busy[o]=!0),o}discard(e){switch(e.line&&(this.line=e.line),e.kind){case`assign`:case`opassign`:case`incdec`:this.genAssign(e,null,!1);return;case`call`:this.genCall(e,null,!1);return;case`comma`:this.discard(e.a),this.discard(e.b);return;case`cast`:this.discard(e.a);return;case`cond`:{let t=this.cg.newLabel(),n=this.cg.newLabel(),r=this.cg.newLabel();this.branch(e.a,t,n,t),this.label(t),this.discard(e.b),this.jump(r),this.label(n),this.discard(e.c),this.label(r);return}case`logand`:case`logor`:{let t=this.cg.newLabel(),n=this.cg.newLabel();e.kind===`logand`?this.branch(e.a,t,n,t):this.branch(e.a,n,t,t),this.label(t),this.discard(e.b),this.label(n);return}default:en(e)||this.release(this.operand(e))}}genAssign(e,t,n){let r=e.a,i=e=>n?t===null?e.reg:(t!==e.reg&&this.ins(`mov`,t,e),this.release(e),t):(this.release(e),-1);if(r.kind===`var`&&!r.v.global&&r.v.reg>=0){let a=r.v.reg;if(e.kind===`assign`)this.gen(e.b,a);else if(e.kind===`opassign`){let t=this.operand(e.b);this.line=e.line,this.binary(e.op,e.uns,P(a),t,a)}else if(e.post&&n){let n=t??this.alloc();return this.ins(`mov`,n,P(a)),this.addConst(a,e.value),n}else this.addConst(a,e.value);return i(P(a))}let a=e.kind===`assign`&&r.kind===`deref`?this.postIncrement(r.a):null;if(a){let t=this.toReg(this.operand(e.b));return this.line=e.line,this.ins(`str`,t.reg,P(a.r)),this.addConst(a.r,a.delta),i(t)}let o={need:this.needAddr(r),get:()=>this.lvalAddr(r)};if(e.kind===`incdec`){let t=this.lvalAddr(r),a=this.alloc();if(this.ins(`lod`,a,t),e.post&&n){let n=this.alloc();e.value>0?this.aluTo(`add`,n,P(a),F(e.value)):this.aluTo(`sub`,n,P(a),F(-e.value)),this.ins(`str`,n,t),this.free(n)}else this.addConst(a,e.value),this.ins(`str`,a,t);return this.release(t),i(P(a,!0))}let[s,c]=this.many([o,{need:this.need(e.b),get:()=>this.operand(e.b)}]);if(this.line=e.line,e.kind===`assign`){let e=this.toReg(c);return this.ins(`str`,e.reg,s),this.release(s),i(e)}let l=this.alloc();this.ins(`lod`,l,s);let u=this.binary(e.op,e.uns,P(l,!0),c,null);return this.ins(`str`,u,s),this.release(s),i(P(u,this.isTemp[u]))}saveTemps(e){let t=this.temps.filter(t=>this.busy[t]&&t!==e);for(let e of t)this.push(e),this.busy[e]=!1;return t}callTo(e){this.calls||this.error(`Internal error: a call in a function that was found to have none`),this.ins(`ldi`,14,F(0,`~+2`)),this.ins(`brn`,null,e).call=!0,this.flagsReg=-1}afterCall(e,t,n,r){let i=-1;if(r){if(n!==null)n!==e&&this.ins(`mov`,n,P(e)),i=n;else if(!t.length)this.busy[e]=!0,i=e;else{for(let e of t)this.busy[e]=!0;i=this.alloc(),i!==e&&this.ins(`mov`,i,P(e));for(let e of t)this.busy[e]=!1}}for(let e=t.length-1;e>=0;e--)this.pop(t[e]),this.busy[t[e]]=!0;return i}genCall(e,t,n){if(e.name)return this.genBuiltin(e,t,n);e.f&&this.cg.reference(e.f,e.line);let r=t!==null&&this.busy[t],i=this.saveTemps(t);r&&(this.busy[t]=!1);let a=e.args,o=Math.min(a.length,4);for(let e=a.length-1;e>=4;e--){let t=this.toReg(this.operand(a[e]));this.push(t.reg),this.release(t)}let s=this.temps.length,c=(e,t)=>t>0&&e>s-t,l=!e.f&&c(this.need(e.a),o);if(l){let t=this.toReg(this.operand(e.a));this.push(t.reg),this.release(t)}let u=[];for(let e=0;e<o;e++){if(u[e]=c(this.need(a[e]),o-1-e),!u[e])continue;let t=this.toReg(this.operand(a[e]));this.push(t.reg),this.release(t)}for(let e=o-1;e>=0;e--)u[e]?this.pop(e+1):this.gen(a[e],e+1),this.busy[e+1]=!0;let d;if(e.f)d=F(0,`.`+e.f.label);else if(l)this.pop(5),d=P(5);else{let t=this.operand(e.a);I(t)||t.temp?(this.load(5,t),this.release(t),d=P(5)):d=t}this.line=e.line,this.callTo(d);for(let e=0;e<o;e++)this.busy[e+1]=!1;return r&&(this.busy[t]=!0),a.length>4&&(this.aluTo(`add`,15,It,F(a.length-4)),this.adj-=a.length-4),this.afterCall(1,i,t,n&&e.type.kind!==`void`)}genBuiltin(e,t,n){let r=e.args,i=e=>I(e)?F(e.imm,`%${e.imm}`):e,a=e=>(!n&&e>0&&this.isTemp[e]&&this.free(e),e);switch(e.name){case`pixel`:{let[t,n,i]=this.many(r.map(e=>({need:this.need(e),get:()=>this.operand(e)}))),a=this.toReg(i),[o,s]=this.legal(t,n);return this.line=e.line,this.ins(`gfxsp`,a.reg,o,s),this.release(o),this.release(s),this.release(a),-1}case`in`:{let e=this.operand(r[0]);if(this.release(e),!n)return-1;let a=t??this.alloc();return this.ins(`in`,a,i(e)),a}case`out`:{let[t,n]=this.pair(r[0],r[1]),a=this.toReg(n);return this.line=e.line,this.ins(`out`,a.reg,i(t)),this.release(t),this.release(a),-1}case`stall`:{let e=this.operand(r[0]);return this.ins(`stl`,null,e),this.release(e),-1}case`halt`:return this.ins(`hlt`,null),-1;case`mulhi`:case`umulhi`:{let[n,i]=this.pair(r[0],r[1]);return this.line=e.line,a(this.alu(e.name===`mulhi`?`sumul`:`umul`,t,n,i))}}this.error(`Internal error: built-in ${e.name}`)}userLabel(e,t,n){let r=this.userLabels.get(e);return r||(r={label:this.cg.newLabel(),defined:!1,line:t},this.userLabels.set(e,r)),n&&(r.defined&&this.error(`Label ${e} is defined twice`,t),r.defined=!0),r.label}stmt(e){this.line=e.line;let t=this.temps.filter(e=>this.busy[e]);(t.length||this.adj)&&this.error(`Internal error: register $${t[0]} or the stack was left in use`);let n=()=>this.cg.newLabel();switch(e.kind){case`block`:for(let t of e.body)this.stmt(t);break;case`expr`:this.discard(e.expr);break;case`if`:{let t=n(),r=n();if(this.branch(e.expr,t,r,t),this.label(t),this.stmt(e.then),e.otherwise){let t=n();this.jump(t),this.label(r),this.stmt(e.otherwise),this.label(t)}else this.label(r);break}case`while`:case`for`:{e.init&&this.stmt(e.init);let t=n(),r=n(),i=n(),a=!e.expr||e.expr.kind===`num`&&e.expr.value!==0,o=!1;if(!a&&!rn(e)){this.line=e.line;let n=e.expr;an(n)&&en(n)&&!Qt(n)&&nn(n)<=4?this.branch(n,t,i,t):(this.jump(r),o=!0)}this.label(t);let s={brk:i,cont:n(),contUsed:!1,isSwitch:!1};this.loops.push(s),this.stmt(e.then),this.loops.pop(),s.contUsed&&this.label(s.cont),this.line=e.line,e.step&&this.discard(e.step),a?this.jump(t):(o&&this.label(r),this.branch(e.expr,t,i,i)),this.label(i);break}case`do`:{let t=n(),r=n();this.label(t);let i={brk:r,cont:n(),contUsed:!1,isSwitch:!1};this.loops.push(i),this.stmt(e.then),this.loops.pop(),i.contUsed&&this.label(i.cont),this.line=e.expr.line||e.line,this.branch(e.expr,t,r,r),this.label(r);break}case`return`:e.expr&&!this.entry?this.gen(e.expr,1):e.expr&&this.discard(e.expr),this.line=e.line,this.jump(this.retLabel);break;case`break`:{let t=this.loops[this.loops.length-1];t||this.error(`break outside a loop or switch`,e.line),this.jump(t.brk);break}case`continue`:{let t=this.loops.findLast(e=>!e.isSwitch);t||this.error(`continue outside a loop`,e.line),t.contUsed=!0,this.jump(t.cont);break}case`switch`:{let t=n(),r=this.toReg(this.operand(e.expr)),i=t;for(let t of e.cases){if(t.asmLabel=n(),t.isDefault){i=t.asmLabel;continue}let[e,a]=this.legal(r,F(t.value));this.ins(`sub`,0,e,a),this.release(a),this.ins(`beq`,null,F(0,t.asmLabel))}this.release(r),this.jump(i),this.loops.push({brk:t,cont:``,contUsed:!1,isSwitch:!0}),this.stmt(e.then),this.loops.pop(),this.label(t);break}case`case`:this.label(e.asmLabel);break;case`goto`:this.jump(this.userLabel(e.name,e.line,!1));break;case`label`:this.label(this.userLabel(e.name,e.line,!0))}}generate(){let e=this.f;this.assignRegisters(),this.stmt(e.body);for(let[t,n]of this.userLabels)n.defined||this.error(`Label ${t} is not defined in ${e.name}`,n.line);let t=this.items;this.items=[],this.line=e.line,this.adj=0;let n=this.entry?[]:[...this.calls?[14]:[],...[...this.saved].sort((e,t)=>e-t)];for(let e of n)this.push(e);this.adj=0,this.frame&&this.ins(`sub`,15,It,F(this.frame)),this.leaf?e.params.forEach((e,t)=>{t<4||e.weight===0||(this.ins(`add`,e.reg,It,F(this.frame+n.length+(t-4))),this.ins(`lod`,e.reg,P(e.reg)))}):e.params.forEach((e,t)=>{if(e.weight===0&&!e.addrTaken)return;if(t<4){e.reg>=0?this.ins(`mov`,e.reg,P(t+1)):e.stackOff===0?this.ins(`str`,t+1,It):(this.ins(`add`,5,It,F(e.stackOff)),this.ins(`str`,t+1,P(5)));return}let r=this.frame+n.length+(t-4),i=e.reg>=0?e.reg:5;this.ins(`add`,i,It,F(r)),this.ins(`lod`,i,P(i)),e.reg>=0||(e.stackOff===0?this.ins(`str`,5,It):(this.ins(`add`,4,It,F(e.stackOff)),this.ins(`str`,5,P(4))))});let r=this.items;if(this.items=[],this.entry)this.ins(`hlt`,null);else{this.frame&&this.ins(`add`,15,It,F(this.frame));for(let e=n.length-1;e>=0;e--)this.pop(n[e]);this.ins(`brn`,null,P(14))}let i=this.items,a=[...r,...t,{label:this.retLabel},...i];return i.length===1&&(a=a.map(e=>!Pt(e)&&e.op===`brn`&&e.args[0]===this.retLabel?{...i[0],line:e.line}:e)),dn(a)}},ln=e=>!Pt(e)&&e.op[0]===`b`,un=e=>!Pt(e)&&(e.op===`brn`&&!e.call||e.op===`hlt`);function dn(e){for(let t=0;t<20;t++){let t=!1,n=[],r=t=>{let n=[];for(;t<e.length&&Pt(e[t]);)n.push(e[t++].label);return{labels:n,next:e[t]}},i=new Map;for(let t=0;t<e.length;t++){let n=e[t];if(!Pt(n))continue;let{next:a}=r(t);a&&a.op===`brn`&&!a.call&&a.args[0].startsWith(`.`)&&a.args[0]!==n.label&&i.set(n.label,a.args[0])}let a=e=>{let t=e;for(let e=0;e<10&&i.has(t);e++)t=i.get(t);return i.has(t)?e:t},o=!1,s=new Map,c=e=>{for(let[t,n]of s)(t===e||n===e)&&s.delete(t)};for(let i=0;i<e.length;i++){let l=e[i];if(Pt(l))o=!1,s.clear(),n.push(l);else if(o)t=!0;else{if(l.op===`str`){let[e,t]=l.args;if(t[0]===`$`)s.clear();else for(let e of s.keys())e[0]===`$`&&s.delete(e);s.set(t,e)}else if(l.op===`lod`){let[e,r]=l.args,i=s.get(r);if(i!==void 0){if(t=!0,i===e)continue;c(e),n.push({...l,op:`mov`,args:[e,i]});continue}c(e),r!==e&&s.set(r,e)}else l.call?s.clear():Gt(l.op)&&c(l.args[0]);if(l.op===`mov`&&l.args[0]===l.args[1])t=!0;else{if(ln(l)&&!l.call&&l.args[0].startsWith(`.`)){let o=a(l.args[0]);if(o!==l.args[0]&&(l.args[0]=o,t=!0),r(i+1).labels.includes(l.args[0])){t=!0;continue}let s=l.op.slice(1),c=e[i+1];if(s in zt&&c&&!Pt(c)&&c.op===`brn`&&!c.call&&r(i+2).labels.includes(l.args[0])){n.push({...c,op:`b`+zt[s],line:l.line}),i++,t=!0;continue}}n.push(l),un(l)&&(o=!0)}}}let l=new Set;for(let e of n)if(!Pt(e))for(let t of e.args)t.startsWith(`.`)&&l.add(t);if(e=n.filter(e=>!Pt(e)||l.has(e.label)||!/^\.L\d+$/.test(e.label)),e.length!==n.length&&(t=!0),!t)break}return e}function fn(e,t){let n=[11,9,7];for(let r of n.slice(0,-1))try{return new cn(e,t,r).generate()}catch(e){if(!(e instanceof on))throw e}return new cn(e,t,n[n.length-1]).generate()}var pn=`
; Unsigned division: $1 / $2. Returns the quotient in $1 and the remainder in $2.
.__udivmod
    TEST   $0 $2
    BNEG   .__udiv_big
    LDI    $3 0
    LDI    $4 16
.__udiv_loop
    RSHIFT $5 $1 15
    LSHIFT $3 $3 1
    OR     $3 $3 $5
    LSHIFT $1 $1 1
    SUB    $0 $3 $2
    BLT    .__udiv_next
    SUB    $3 $3 $2
    ADD    $1 $1 1
.__udiv_next
    SUB    $4 $4 1
    BNZ    .__udiv_loop
    MOV    $2 $3
    BRN    $14
.__udiv_big
    SUB    $0 $1 $2
    BLT    .__udiv_small
    SUB    $2 $1 $2
    LDI    $1 1
    BRN    $14
.__udiv_small
    MOV    $2 $1
    LDI    $1 0
    BRN    $14`,mn=`
; Signed division: $1 / $2, rounding towards zero. Quotient in $1, remainder in $2.
.__sdivmod
    SUB    $15 $15 3
    STR    $14 $15
    ADD    $3 $15 1
    STR    $1 $3
    XOR    $4 $1 $2
    ADD    $3 $15 2
    STR    $4 $3
    TEST   $0 $1
    BPOSZ  .__sdiv_a
    SUB    $1 $0 $1
.__sdiv_a
    TEST   $0 $2
    BPOSZ  .__sdiv_b
    SUB    $2 $0 $2
.__sdiv_b
    LDI    $14 .__sdiv_back
    BRN    .__udivmod
.__sdiv_back
    ADD    $3 $15 2
    LOD    $4 $3
    TEST   $0 $4
    BPOSZ  .__sdiv_q
    SUB    $1 $0 $1
.__sdiv_q
    ADD    $3 $15 1
    LOD    $4 $3
    TEST   $0 $4
    BPOSZ  .__sdiv_r
    SUB    $2 $0 $2
.__sdiv_r
    LOD    $14 $15
    ADD    $15 $15 3
    BRN    $14`,hn=16;function gn(e,t,n){let r=e.funcs.find(e=>e.name===`main`);if(!r||!r.body)throw new j(0,`There is no main function`);if(r.type.params.length)throw new j(r.line,`main takes no parameters`);let i=t.split(`
`),a=new sn,o=[],s=[],c=(e,t=0)=>{o.push(e),s.push(t)},l=e.globals.filter(e=>e.init||Je(e.type,e.line)<=hn),u=e.globals.filter(e=>!l.includes(e)),d=1;for(let e of[...l,...u])e.addr=d,d+=Je(e.type,e.line),a.symbols.set(e,(l.includes(e)?`.`:`&`)+e.label);if(d>8192)throw new j(0,`The global variables take ${d} words, but RAM has ${mt}`);d>8064&&n(0,`The global variables take ${d} of the ${mt} words of RAM, which leaves little for the stack`);let f=[];a.queue.push(r);for(let e=0;e<a.queue.length;e++){let t=a.queue[e];f.push({f:t,items:fn(a,t)})}c(`; Generated by the ILF-16 C compiler.`),c(`; Globals use RAM 0 - ${d-1}; the stack grows down from ${mt}.`),c(``),c(`DW 0`);let p=e=>{if(!e.name)return`string`;let t=e.type,n=``;for(;t.kind===`array`;t=t.of)n+=`[${t.len}]`;return`${Ye(t)} ${e.name}${n}`};for(let e of l){c(`${a.symbols.get(e)}`.padEnd(24)+`; ${p(e)}`);let t=Je(e.type,e.line),n=[];for(let r=0;r<t;r++){let t=e.init?e.init[r]:0;typeof t==`number`?n.push(String(t)):`f`in t?(a.reference(t.f,e.line),n.push(`.`+t.f.label)):n.push(String(t.v.addr+t.offset&65535))}for(let e=0;e<n.length;e+=16)c(`DW `+n.slice(e,e+16).join(` `))}for(let e of u)c(`@define ${a.symbols.get(e)} ${e.addr}`.padEnd(24)+`; ${p(e)}`);for(let e=f.length;e<a.queue.length;e++){let t=a.queue[e];f.push({f:t,items:fn(a,t)})}for(let{f:e,items:t}of f){c(``),c(`; ${`-`.repeat(60)}`),c(`; ${e.name}`),c(`; ${`-`.repeat(60)}`),c(`.`+e.label);let n=0;for(let e of t){if(Pt(e)){c(e.label);continue}if(e.line!==n&&e.line>0){n=e.line;let t=(i[n-1]??``).trim().replace(/\s+/g,` `);c(`    ; ${n}: ${t.length>90?t.slice(0,87)+`...`:t}`)}let t=`    ${e.op.toUpperCase().padEnd(6)} ${e.args.join(` `)}`;c(e.note?`${t.padEnd(32)}; ${e.note}`:t,e.line)}}if(a.usesSdiv)for(let e of mn.split(`
`))c(e);if(a.usesUdiv||a.usesSdiv)for(let e of pn.split(`
`))c(e);let m=(e,t)=>({name:e.name,type:e.type,text:Ze(e.type,e.name),reg:e.global?-1:e.reg,addr:t}),h={globals:e.globals.filter(e=>e.name).map(e=>m(e,e.addr)),functions:f.map(({f:e})=>({name:e.name,label:`.`+e.label,locals:e.locals.filter(e=>e.reg>=0||e.addrTaken||e.weight>0).map(e=>m(e,e.stackOff))})),runtime:[`.__sdivmod`,`.__udivmod`]};return{asm:o.join(`
`)+`
`,lineMap:s,debug:h}}function _n(e){let t=[],n=(e,n)=>t.push({severity:`warning`,line:e,message:n});try{let{asm:r,lineMap:i,debug:a}=gn(Nt(Re(e,n),n),e,n);return{asm:r,lineMap:i,debug:a,diagnostics:t}}catch(e){if(!(e instanceof j))throw e;return t.push({severity:`error`,line:e.line,message:e.message}),{asm:null,lineMap:[],debug:null,diagnostics:t}}}function vn(e){let t=_n(e);if(t.asm===null)return{program:null,diagnostics:t.diagnostics};let{asm:n,lineMap:r}=t,i=bt(n),a=[...t.diagnostics];for(let e of i.diagnostics){let t=e.line?` (line ${e.line} of the generated assembly)`:``;a.push({severity:e.severity,line:r[e.line-1]??0,message:e.message+t})}let o=i.program;if(!o)return{program:null,diagnostics:a};let s=new Map,c=o.lineOfAddr.map((e,t)=>{let n=r[e-1]??0;return n>0&&!s.has(n)&&s.set(n,t),n}),l=t.debug,u=l.functions.map(e=>o.romLabels.get(e.label)??-1),d=[...u,...l.runtime.map(e=>o.romLabels.get(e)??-1),o.rom.length],f={globals:l.globals,functions:l.functions.map((e,t)=>({name:e.name,start:u[t],end:Math.min(...d.filter(e=>e>u[t])),locals:e.locals}))};return{program:{...o,lineOfAddr:c,addrOfLine:s,lineStep:!0,asm:n,debug:f},diagnostics:a}}var yn=16384,bn=16383,xn=mt-1,Sn=0,Cn=1,wn=2,Tn=3,En=4,Dn=5,On=6,kn=7,An=8,jn=9,Mn=10,Nn=class{regs=new Uint16Array(16);ram=new Uint16Array(mt);inputs=new Uint16Array(16);outputs=new Uint16Array(16);vram=new Uint8Array(65536);breakpoints=new Uint8Array(yn);pc=0;halted=!1;clocks=0;instructions=0;vramDirty=!0;execCount=new Float64Array(yn);stallClocks=new Float64Array(yn);program=null;fA=0;fB=0;fO=0;fOp=0;kind=new Uint8Array(yn);sub=new Uint8Array(yn);dest=new Uint8Array(yn);aReg=new Uint8Array(yn);bReg=new Uint8Array(yn);aVal=new Uint16Array(yn);bVal=new Uint16Array(yn);load(e){this.program=e,this.kind.fill(0),this.sub.fill(0),this.dest.fill(0),this.aReg.fill(0),this.bReg.fill(0),this.aVal.fill(0),this.bVal.fill(0);for(let t=0;t<e.rom.length;t++)this.decode(t,e.rom[t]);this.reset()}decode(e,t){let n=t>>>24,r=t>>>22&3,i=t>>>21&1,a=t>>>20&1,o=t&65535;this.dest[e]=t>>>16&15;let s=0,c=0;r===1?s=o:r===2&&(i&&!a?(s=o>>>12,c=o&4095):!i&&a?(s=o>>>4,c=o&15):(s=o>>>8,c=o&255)),this.aReg[e]=i,this.bReg[e]=a,this.aVal[e]=i?s&15:s,this.bVal[e]=a?c&15:c;let l=n>>>2,u=Sn,d=0;l===1?u=Cn:l===2?u=wn:n>>>4==1?(u=Tn,d=n&15):n>>>5==1?(u=En,d=n&31):n>>>5==2?(u=Dn,d=n&31):l===48?u=On:l===49?u=kn:l===50?u=An:l===51?u=jn:(l===52||l===53)&&(u=Mn),this.kind[e]=u,this.sub[e]=d}reset(){this.regs.fill(0),this.outputs.fill(0),this.vram.fill(0),this.vramDirty=!0,this.ram.fill(0),this.program&&this.ram.set(this.program.ram),this.pc=0,this.halted=!1,this.clocks=0,this.instructions=0,this.execCount.fill(0),this.stallClocks.fill(0);let e=this.program&&this.program.rom.length?this.program.rom[0]>>>24&15:0;this.fA=0,this.fB=0,this.fOp=e,this.fO=Pn(e,0,0)}flag(e){let t=this.fA,n=this.fB,r=this.fO;switch(e){case 0:return t>n;case 1:return t<n;case 2:return t<<16>>16>n<<16>>16;case 3:return t<<16>>16<n<<16>>16;case 4:return t===n;case 5:return r===0;case 6:return!!(r&32768);case 7:return r!==0&&!(r&32768);case 8:return!(r&1);case 9:{let e=r^r>>>8;return e^=e>>>4,e^=e>>>2,e^=e>>>1,!(e&1)}case 10:return this.fOp&1?t<n:t+n>65535;case 11:return this.fOp&1?!!((t^n)&(t^t-n)&32768):!!(~(t^n)&(t^t+n)&32768);case 15:return!0;default:return!1}}get flags(){let e=0;for(let t=0;t<16;t++)this.flag(t)&&(e|=1<<t);return e}step(){return this.run(1/0,1,1/0,!0)}run(e,t,n,r=!1){if(this.halted)return`halted`;let{regs:i,ram:a,inputs:o,outputs:s,vram:c,breakpoints:l}=this,{kind:u,sub:d,dest:f,aReg:p,bReg:m,aVal:h,bVal:g,execCount:_,stallClocks:v}=this,y=this.pc,b=this.clocks,x=0,S=r,C=`clocks`;for(;b<e;){if(x>=t){C=`instructions`;break}let e=y&bn;if(l[e]!==0&&!S){C=`breakpoint`;break}if(S=!1,(x&16383)==16383&&performance.now()>=n){C=`deadline`;break}let r=p[e]===0?h[e]:i[h[e]],w=m[e]===0?g[e]:i[g[e]],T=f[e];switch(x++,_[e]++,b+=4,y=y+1&65535,u[e]){case Tn:{let t=d[e],n=Pn(t,r,w);this.fA=r,this.fB=w,this.fO=n,this.fOp=t,T!==0&&(i[T]=n);break}case En:{let t=d[e];this.flag(t&15)!==!!(t&16)&&(y=r);break}case Dn:{let t=d[e];T!==0&&(i[T]=this.flag(t&15)===!!(t&16)?w:r);break}case On:T!==0&&(i[T]=a[r&xn]);break;case kn:a[r&xn]=i[T];break;case An:T!==0&&(i[T]=o[r&15]);break;case jn:s[r&15]=i[T];break;case Mn:c[(w&255)<<8|r&255]=i[T]&15,this.vramDirty=!0;break;case Cn:b+=r,v[e]+=r;break;case wn:this.halted=!0,y=y-1&65535}if(this.halted){C=`halted`;break}}return this.pc=y,this.clocks=b,this.instructions+=x,C}};function Pn(e,t,n){switch(e){case 0:return t+n&65535;case 1:return t-n&65535;case 2:return n>15?0:t>>>n;case 3:return n>15?0:t<<n&65535;case 4:case 5:return Math.imul(t,n)&65535;case 6:return t*n>>>16&65535;case 7:return(t<<16>>16)*(n<<16>>16)>>16&65535;case 8:return t;case 9:return~t&65535;case 10:return t&n;case 11:return t|n;case 12:return t^n;case 13:return~(t&n)&65535;case 14:return~(t|n)&65535;default:return~(t^n)&65535}}var Fn=[`#000000`,`#000062`,`#620062`,`#006200`,`#ba6200`,`#626262`,`#bababa`,`#ffffff`,`#ff0062`,`#ff6200`,`#ffff62`,`#00ff62`,`#00baff`,`#ba62ba`,`#ff62ba`,`#ffbaba`],In=[`Black`,`Dark Blue`,`Dark Purple`,`Dark Green`,`Brown`,`Dark Gray`,`Light Gray`,`White`,`Red`,`Orange`,`Yellow`,`Green`,`Blue`,`Purple`,`Pink`,`Light Pink`],Ln=[`KeyW`,`KeyS`,`KeyA`,`KeyD`,`ArrowUp`,`ArrowDown`,`ArrowLeft`,`ArrowRight`,`KeyI`,`KeyK`,`KeyJ`,`KeyL`,`KeyZ`,`KeyX`,`KeyC`,`KeyV`];function Rn(){return{palette:[...Fn],inputs:Array.from({length:16},()=>({kind:`switches`,signed:!1,base:10})),outputs:Array.from({length:16},()=>({kind:`leds`,signed:!1,base:10})),keys:[...Ln],speed:`realtime`,displayScale:2,heatmap:!1,editorWidth:.4}}var zn=`ilf16.settings.v1`;function Bn(){let e=Rn();try{let t=localStorage.getItem(zn);if(!t)return e;let n=JSON.parse(t),r=e=>Array.isArray(e)&&e.length===16;r(n.palette)&&(e.palette=n.palette),r(n.inputs)&&(e.inputs=n.inputs),r(n.outputs)&&(e.outputs=n.outputs),r(n.keys)&&(e.keys=n.keys),(n.speed===`realtime`||n.speed===`unlimited`)&&(e.speed=n.speed),typeof n.displayScale==`number`&&(e.displayScale=n.displayScale),typeof n.heatmap==`boolean`&&(e.heatmap=n.heatmap),typeof n.editorWidth==`number`&&n.editorWidth>0&&n.editorWidth<1&&(e.editorWidth=n.editorWidth)}catch{}return e}var L=g(Bn());r(()=>{l(()=>{let e=JSON.stringify(L);try{localStorage.setItem(zn,e)}catch{}})});var Vn=2e6,Hn=100,Un=12,R=new class{cpu=new Nn;#e=c(`empty`);get status(){return D(this.#e)}set status(e){i(this.#e,e,!0)}#t=c(0);get frame(){return D(this.#t)}set frame(e){i(this.#t,e,!0)}#n=c(null);get program(){return D(this.#n)}set program(e){i(this.#n,e)}#r=c([]);get diagnostics(){return D(this.#r)}set diagnostics(e){i(this.#r,e)}#i=c([]);get breakLines(){return D(this.#i)}set breakLines(e){i(this.#i,e)}#a=c(g(Array(16).fill(0)));get inputValues(){return D(this.#a)}set inputValues(e){i(this.#a,e,!0)}#o=c(0);get mips(){return D(this.#o)}set mips(e){i(this.#o,e,!0)}#s=c(0);get realtimeRatio(){return D(this.#s)}set realtimeRatio(e){i(this.#s,e,!0)}raf=0;lastTime=0;clockTarget=0;skipBreakpoint=!1;statTime=0;statClocks=0;statInstructions=0;build(e,t){let n=t===`c`?vn(e):bt(e);return this.diagnostics=n.diagnostics,n.program?(this.loadProgram(n.program),!0):!1}loadProgram(e){this.stopLoop(),this.cpu.load(e),this.program=e,this.syncBreakpoints(),this.status=`ready`,this.mips=0,this.realtimeRatio=0,this.frame++}setBreakLines(e){this.breakLines=e,this.syncBreakpoints()}syncBreakpoints(){this.cpu.breakpoints.fill(0);let e=this.program;if(!e)return;let t=[...e.addrOfLine.keys()].sort((e,t)=>e-t);for(let n of this.breakLines){let r=t.find(e=>e>=n);if(r===void 0)continue;let i=e.lineOfAddr;for(let e=0;e<i.length;e++)i[e]===r&&(e===0||i[e-1]!==r)&&(this.cpu.breakpoints[e]=1)}}setInput(e,t){t&=65535,this.cpu.inputs[e]=t,this.inputValues[e]=t}get canRun(){return this.status===`ready`||this.status===`paused`}run(){this.canRun&&(this.status=`running`,this.skipBreakpoint=!0,this.lastTime=performance.now(),this.clockTarget=this.cpu.clocks,this.statTime=this.lastTime,this.statClocks=this.cpu.clocks,this.statInstructions=this.cpu.instructions,this.raf=requestAnimationFrame(this.loop))}pause(){this.status===`running`&&(this.stopLoop(),this.status=`paused`,this.frame++)}step(){if(!this.canRun)return;let e=this.cpu,t=this.program?.lineStep?this.program.lineOfAddr:null,n=t?t[e.pc]??0:0,r=e.step();if(t)for(let i=1;i<Vn&&r!==`halted`;i++){let i=t[e.pc]??0;if(i!==0&&i!==n||e.breakpoints[e.pc])break;r=e.step()}this.status=r===`halted`?`halted`:`paused`,this.frame++}reset(){this.program&&(this.stopLoop(),this.cpu.reset(),this.status=`ready`,this.mips=0,this.realtimeRatio=0,this.frame++)}stopLoop(){cancelAnimationFrame(this.raf),this.raf=0}loop=e=>{let t=this.cpu,n=performance.now()+Un,r;if(L.speed===`realtime`){let i=Math.min(e-this.lastTime,Hn);this.clockTarget+=i*ht/1e3,r=t.run(this.clockTarget,1/0,n,this.skipBreakpoint),r===`deadline`&&(this.clockTarget=t.clocks)}else r=t.run(1/0,1/0,n,this.skipBreakpoint),this.clockTarget=t.clocks;this.lastTime=e,this.skipBreakpoint=!1;let i=e-this.statTime;i>=500&&(this.mips=(t.instructions-this.statInstructions)/i/1e3,this.realtimeRatio=(t.clocks-this.statClocks)/ht/i*1e3,this.statTime=e,this.statClocks=t.clocks,this.statInstructions=t.instructions),this.frame++,r===`breakpoint`?this.status=`paused`:r===`halted`?this.status=`halted`:this.raf=requestAnimationFrame(this.loop)}},Wn={2:`0b`,8:`0o`,10:``,16:`0x`},Gn={2:16,8:6,10:1,16:4};function Kn(e,t){if(e&=65535,t.signed&&e&32768)return`-`+Wn[t.base]+(65536-e).toString(t.base).toUpperCase();let n=e.toString(t.base).toUpperCase();return Wn[t.base]+(t.signed?n:n.padStart(Gn[t.base],`0`))}function qn(e,t){let n=e.trim().replaceAll(`_`,``).replaceAll(` `,``).toLowerCase();if(!n)return null;let r=!1;n.startsWith(`-`)?(r=!0,n=n.slice(1)):n.startsWith(`+`)&&(n=n.slice(1));let i=Wn[t.base];if(i&&n.startsWith(i)&&(n=n.slice(2)),!{2:/^[01]+$/,8:/^[0-7]+$/,10:/^[0-9]+$/,16:/^[0-9a-f]+$/}[t.base].test(n))return null;let a=parseInt(n,t.base);r&&(a=-a);let o=t.signed?-32768:0,s=t.signed?32767:65535;return a<o||a>s?null:a&65535}var Jn=(e,t=4)=>e.toString(16).toUpperCase().padStart(t,`0`),Yn=e=>e<<16>>16,Xn=n(`<div class="reg svelte-1th07dx"><span class="dim svelte-1th07dx"></span> <b> </b> <span class="dim dec svelte-1th07dx"> </span></div>`),Zn=n(`<span> </span>`),Qn=n(`<button title="The variables of the C program, by name">Variables</button>`),$n=n(`<span class="dim"> </span>`),er=n(`<input class="addr svelte-1th07dx" type="number" min="0" max="13311"/>`),tr=n(`<label><input type="checkbox"/> follow PC</label> <!>`,1),nr=n(`<button>▲</button> <button>▼</button> <input class="addr svelte-1th07dx" title="RAM address (decimal or 0x hex)"/> <button>SP</button>`,1),rr=n(`<tr><td class="svelte-1th07dx"> </td><td class="dim svelte-1th07dx"> </td><td class="value svelte-1th07dx"> </td><td class="dim svelte-1th07dx"> </td></tr>`),ir=n(`<tr><th colspan="4" class="svelte-1th07dx"> </th></tr> <!>`,1),ar=n(`<tr><td class="dim svelte-1th07dx" colspan="4">none</td></tr>`),or=n(`<div class="variables svelte-1th07dx"><table class="mono listing svelte-1th07dx"><tbody><!><tr><th colspan="4" class="svelte-1th07dx">Global</th></tr><!><!></tbody></table></div>`),sr=n(`<tr><td class="bp svelte-1th07dx"> </td><td class="dim svelte-1th07dx"> </td><td class="dim svelte-1th07dx"> </td><td class="svelte-1th07dx"> </td><td class="dim svelte-1th07dx"> </td></tr>`),cr=n(`<table class="mono listing svelte-1th07dx"><tbody></tbody></table>`),lr=n(`<td> </td>`),ur=n(`<tr><td class="dim svelte-1th07dx"> </td><!></tr>`),dr=n(`<section class="panel"><header><h2>CPU</h2> <span class="dim mono"> </span></header> <div class="pc mono svelte-1th07dx"><span class="dim">PC</span> <b> </b> <span class="dim"> </span></div> <div class="regs mono svelte-1th07dx"></div> <div class="flags mono svelte-1th07dx"></div> <div class="tabs svelte-1th07dx"><button>Instructions</button> <button>RAM</button> <!> <span class="spacer svelte-1th07dx"></span> <!></div> <!></section>`);function fr(e,n){v(n,!0);let r=R.cpu,l=c(`rom`),u=c(!0),g=c(0),S=c(`0`),w=k(()=>(R.frame,{regs:Array.from(r.regs),pc:r.pc,flags:r.flags,clocks:r.clocks,instructions:r.instructions})),te=k(()=>R.program),ne=k(()=>D(l)===`vars`&&!D(te)?.debug?`rom`:D(l)),ae=k(()=>D(te)?.lineOfAddr[D(w).pc]??0),oe=k(()=>D(u)?Math.max(0,D(w).pc-4):Math.max(0,Math.min(D(g),65535))),se=k(()=>{R.breakLines;let e=[],t=D(te)?.rom;for(let n=D(oe);n<D(oe)+16;n++){let i=t&&n<t.length?t[n]:0;e.push({addr:n,word:i,text:gt(i),line:D(te)?.lineOfAddr[n]??0,breakpoint:r.breakpoints[n&16383]!==0})}return e}),ce=k(()=>{let e=D(S).trim().toLowerCase(),t=e.startsWith(`0x`)?parseInt(e.slice(2),16):parseInt(e,10);return Number.isNaN(t)?0:Math.max(0,Math.min(t,mt-8))&-8}),le=k(()=>{R.frame;let e=[];for(let t=0;t<12;t++){let n=D(ce)+t*8;if(n>=8192)break;e.push({addr:n,words:Array.from(r.ram.subarray(n,n+8))})}return e}),ue=k(()=>{R.frame;let e=D(te)?.debug;if(!e||D(ne)!==`vars`)return null;let t=e=>r.ram[e&mt-1],n=e=>e.type.kind===`int`||e.type.kind===`ptr`,i=(e,i)=>{if(e.reg>=0){let n=r.regs[e.reg];return{text:e.text,where:`$${e.reg}`,value:nt(e.type,n,t),hex:Jn(n)}}let a=i+e.addr&mt-1;return{text:e.text,where:`#${a}`,value:rt(e.type,t,a),hex:n(e)?Jn(t(a)):``}},a=it(e,D(w).pc);return{name:a?.name??``,locals:a?a.locals.map(e=>i(e,r.regs[15])):[],globals:e.globals.map(e=>i(e,0))}});function de(e){i(S,`0x`+Jn(Math.max(0,Math.min(D(ce)+e,mt-8))))}let fe={0:`zero`,14:`tmp`,15:`sp`};var pe=dr(),me=t(pe),he=m(t(me),2),ge=a(he);y(me);var _e=m(me,2),ve=m(t(_e),2),ye=a(ve,!0),be=m(ve,2),xe=a(be);y(_e);var Se=m(_e,2);E(Se,21,()=>D(w).regs,T,(e,n,r)=>{var i=Xn(),s=t(i);s.textContent=`$${r}`;var c=m(s,2),l=a(c,!0),u=m(c,2),d=a(u,!0);y(i),o((e,t)=>{re(i,`title`,`R${r}${fe[r]?` (${fe[r]})`:``} = ${D(n)??``} / ${e??``}`),f(l,t),f(d,D(n))},[()=>Yn(D(n)),()=>Jn(D(n))]),A(e,i)}),y(Se);var Ce=m(Se,2);E(Ce,21,()=>ft,T,(e,t,n)=>{var r=p(),i=h(r),s=e=>{var r=Zn();let i;re(r,`title`,`flag bit ${n}`);var s=a(r,!0);o(()=>{i=C(r,1,`flag svelte-1th07dx`,null,i,{on:D(w).flags>>n&1}),f(s,D(t))}),A(e,r)};b(i,e=>{D(t)!==`-`&&e(s)}),A(e,r)}),y(Ce);var we=m(Ce,2),Te=t(we);let Ee;var De=m(Te,2);let Oe;var ke=m(De,2),Ae=e=>{var t=Qn();let n;o(()=>n=C(t,1,`svelte-1th07dx`,null,n,{active:D(ne)===`vars`})),O(`click`,t,()=>i(l,`vars`)),A(e,t)};b(ke,e=>{D(te)?.debug&&e(Ae)});var je=m(ke,4),j=e=>{var t=$n(),n=a(t,!0);o(()=>f(n,D(ue)?.name?`in ${D(ue).name}()`:``)),A(e,t)},Me=e=>{var n=tr(),r=h(n),a=t(r);x(a),_(),y(r);var o=m(r,2),s=e=>{var t=er();x(t),ee(t,()=>D(g),e=>i(g,e)),A(e,t)};b(o,e=>{D(u)||e(s)}),ie(a,()=>D(u),e=>i(u,e)),A(e,n)},Ne=e=>{var t=nr(),n=h(t),r=m(n,2),a=m(r,2);x(a);var o=m(a,2);O(`click`,n,()=>de(-96)),O(`click`,r,()=>de(96)),ee(a,()=>D(S),e=>i(S,e)),O(`click`,o,()=>i(S,`0x`+Jn(D(w).regs[15]&mt-1))),A(e,t)};b(je,e=>{D(ne)===`vars`?e(j):D(ne)===`rom`?e(Me,1):e(Ne,-1)}),y(we);var Pe=m(we,2),Fe=e=>{let n=(e,n=d)=>{var r=p(),i=h(r);E(i,17,n,T,(e,n)=>{var r=rr(),i=t(r),s=a(i,!0),c=m(i),l=a(c,!0),u=m(c),d=a(u,!0),p=m(u),h=a(p,!0);y(r),o(()=>{f(s,D(n).text),f(l,D(n).where),re(u,`title`,D(n).value),f(d,D(n).value),f(h,D(n).hex)}),A(e,r)}),A(e,r)};var r=or(),i=t(r),s=t(i),c=t(s),l=e=>{var r=ir(),i=h(r),s=t(i),c=a(s);y(i);var l=m(i,2);n(l,()=>D(ue).locals),o(()=>f(c,`Local to ${D(ue).name??``}()`)),A(e,r)};b(c,e=>{D(ue).locals.length&&e(l)});var u=m(c,2);n(u,()=>D(ue).globals);var g=m(u),_=e=>{var t=ar();A(e,t)};b(g,e=>{D(ue).globals.length||e(_)}),y(s),y(i),y(r),A(e,r)},Ie=e=>{var n=cr(),r=t(n);E(r,21,()=>D(se),e=>e.addr,(e,n)=>{var r=sr();let i;var s=t(r),c=a(s,!0),l=m(s),u=a(l,!0),d=m(l),p=a(d,!0),h=m(d),g=a(h,!0),_=m(h),v=a(_,!0);y(r),o((e,t)=>{i=C(r,1,`svelte-1th07dx`,null,i,{current:D(n).addr===D(w).pc}),f(c,D(n).breakpoint?`●`:``),f(u,e),f(p,t),f(g,D(n).text),f(v,D(n).line?`:${D(n).line}`:``)},[()=>Jn(D(n).addr),()=>Jn(D(n).word,8)]),A(e,r)}),y(r),y(n),A(e,n)},Le=e=>{var n=cr(),r=t(n);E(r,21,()=>D(le),e=>e.addr,(e,n)=>{var r=ur(),i=t(r),s=a(i,!0),c=m(i);E(c,17,()=>D(n).words,T,(e,t,r)=>{var i=lr();let s;var c=a(i,!0);o(e=>{re(i,`title`,`#${D(n).addr+r} = ${D(t)??``}`),s=C(i,1,`svelte-1th07dx`,null,s,{zero:D(t)===0}),f(c,e)},[()=>Jn(D(t))]),A(e,i)}),y(r),o(e=>f(s,e),[()=>Jn(D(n).addr)]),A(e,r)}),y(r),y(n),A(e,n)};b(Pe,e=>{D(ne)===`vars`&&D(ue)?e(Fe):D(ne)===`rom`?e(Ie,1):e(Le,-1)}),y(pe),o((e,t,n)=>{f(ge,`${e??``} instr · ${t??``} s`),f(ye,n),f(xe,`${D(w).pc??``}${D(ae)?` · line ${D(ae)}`:``}`),Ee=C(Te,1,`svelte-1th07dx`,null,Ee,{active:D(ne)===`rom`}),Oe=C(De,1,`svelte-1th07dx`,null,Oe,{active:D(ne)===`ram`})},[()=>D(w).instructions.toLocaleString(),()=>(D(w).clocks/ht).toFixed(3),()=>Jn(D(w).pc)]),O(`click`,Te,()=>i(l,`rom`)),O(`click`,De,()=>i(l,`ram`)),A(e,pe),s()}u([`click`]);var pr=n(`<option> </option>`),mr=n(`<label class="svelte-16hfoai"><input type="color" class="svelte-16hfoai"/> <span> </span></label>`),hr=n(`<section class="panel"><header><h2>Display <span class="dim">256×256</span></h2> <label>Scale <select></select></label></header> <div class="screen svelte-16hfoai"><canvas class="svelte-16hfoai"></canvas></div> <details class="svelte-16hfoai"><summary class="svelte-16hfoai">Colour palette</summary> <div class="palette svelte-16hfoai"></div> <button>Reset to ILF-GFX default</button></details></section>`);function gr(e,n){v(n,!0);let r,i=null,c,u,d=k(()=>{let e=new Uint32Array(16);return L.palette.forEach((t,n)=>{let r=parseInt(t.slice(1),16);e[n]=4278190080|(r&255)<<16|r&65280|r>>>16}),e}),p;ce(()=>{i=r.getContext(`2d`),c=i.createImageData(256,256),u=new Uint32Array(c.data.buffer)}),l(()=>{R.frame;let e=D(d);if(!i||!c||!u)return;let t=R.cpu;if(!t.vramDirty&&e===p)return;t.vramDirty=!1,p=e;let n=t.vram;for(let t=0;t<n.length;t++)u[t]=e[n[t]];i.putImageData(c,0,0)});let h=k(()=>256*L.displayScale);var g=hr(),_=t(g),b=m(t(_),2),C=m(t(b));E(C,20,()=>[1,2,3,4],e=>e,(e,t)=>{var n=pr(),r=a(n),i={};o(()=>{f(r,`${t??``}×`),i!==(i=t)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(C),S(C),y(b),y(_);var w=m(_,2),te=t(w);let ie;ne(te,e=>r=e,()=>r),y(w);var oe=m(w,2),le=m(t(oe),2);E(le,21,()=>L.palette,T,(e,n,r)=>{var i=mr(),s=t(i);x(s);var c=m(s,2),l=a(c,!0);y(i),o((e,t)=>{re(i,`title`,`${r} (0x${e??``}) ${In[r]??``}`),f(l,t)},[()=>r.toString(16).toUpperCase(),()=>r.toString(16).toUpperCase()]),ee(s,()=>L.palette[r],e=>L.palette[r]=e),A(e,i)}),y(le);var ue=m(le,2);y(oe),y(g),o(()=>{re(te,`width`,256),re(te,`height`,256),ie=se(te,``,ie,{width:`${D(h)??``}px`,height:`${D(h)??``}px`})}),ae(C,()=>L.displayScale,e=>L.displayScale=e),O(`click`,ue,()=>L.palette=[...Fn]),A(e,g),s()}u([`click`]);var _r=[],vr=[];(()=>{let e=`lc,34,7n,7,7b,19,,,,2,,2,,,20,b,1c,l,g,,2t,7,2,6,2,2,,4,z,,u,r,2j,b,1m,9,9,,o,4,,9,,3,,5,17,3,1n,9,16,o,,x,1i,3,,i,,7,a,2,t,3,1k,,,7,2,2,2,3,9,,a,2,q,,2,3,1k,,,5,4,2,2,3,3,,u,2,3,,b,3,1k,,,8,,3,,3,k,2,m,6,,3,1k,,,7,2,2,2,3,7,3,a,2,u,,1n,5,3,3,,4,9,,14,5,1j,,,7,,3,,4,7,2,b,2,t,3,1k,,,7,,3,,4,7,2,b,2,f,,c,4,1j,2,,7,,3,,4,9,,a,2,t,3,1y,,4,6,,,,8,i,2,1p,,,8,c,8,2q,,,a,b,7,21,2,r,,,,,,4,2,1d,k,,2,5,b,,10,9,,2u,b,,6,n,4,4,3,g,4,d,,,3,6,,f,,jj,3,qa,4,s,3,t,2,u,2,1s,w,9,,19,3,,,39,2,y,,3a,c,4,c,63,5,1l,a,,,,,2,o,2,,1c,1a,2,c,k,5,1b,h,12,9,c,3,u,d,1k,e,1c,k,48,3,,l,4,,6,,2,3,5i,1s,ek,,5f,x,2da,3,3x,,2o,w,fe,6,2x,2,n9w,4,,a,w,2,28,2,7k,,3,,4,,n,5,4,,2b,2,1e,i,q,i,d,,12,8,p,d,18,4,1b,e,10,,1v,e,c,,8,2,1a,,1f,,,3,2,2,5,2,,,15,5,5,2,6k,8,,2,fn4,,kh,g,g,g,a6,2,gt,,6a,,45,5,1ae,3,,2,5,4,14,3,4,,4l,2,fx,4,1t,5,8t,2,25,6,1y,b,1d,4,3e,3,1h,f,15,,2,2,a,4,19,b,7,,1p,3,10,e,g,2,18,,c,3,1c,e,8,4,,2,2k,c,6,,2,,4d,c,l,4,1j,2,,7,2,2,2,3,9,,a,2,2,7,3,5,1v,9,,,2,,,4,,5,,,e,2,2a,i,n,,29,k,6j,7,2,9,r,2,2a,h,2y,d,2t,3,2,a,74,f,6t,6,,2,2,4,,,,2,3x,7,2,7,3,,s,a,14,7,,4,8,,9,b,1a,g,5i,8,5j,8,,8,2a,m,,e,3e,6,3,,,2,,7,,,1u,5,,2,,5,9n,4,9,2,,,1c,7,3,5,n,,44l,,6,f,8ug,i,1xc,5,1n,7,t4,,,1j,7,4,29,,b,2,f57,2,3mp,1a,2,n,f2,5,3,6,8,8,2,7,u,4,44,3,1iz,1j,4,1e,8,,e,,m,5,,f,11s,7,,h,2,7,,2,,5,2s,,4g,7,af,,1p,4,e4,4,72,2,6r,,2,,7,2,5,,d6,7,31,7,240,5`.split(`,`).map(e=>e?parseInt(e,36):1);for(let t=0,n=0;t<e.length;t++)(t%2?vr:_r).push(n+=e[t])})();function yr(e){if(e<768)return!1;for(let t=0,n=_r.length;;){let r=t+n>>1;if(e<_r[r])n=r;else if(e>=vr[r])t=r+1;else return!0;if(t==n)return!1}}function br(e){return e>=127462&&e<=127487}var xr=8205;function Sr(e,t,n=!0,r=!0){return(n?Cr:wr)(e,t,r)}function Cr(e,t,n){if(t==e.length)return t;t&&Er(e.charCodeAt(t))&&Dr(e.charCodeAt(t-1))&&t--;let r=Tr(e,t);for(t+=Or(r);t<e.length;){let i=Tr(e,t);if(r==xr||i==xr||n&&yr(i))t+=Or(i),r=i;else if(br(i)){let n=0,r=t-2;for(;r>=0&&br(Tr(e,r));)n++,r-=2;if(n%2==0)break;t+=2}else break}return t}function wr(e,t,n){for(;t>1;){let r=Cr(e,t-2,n);if(r<t)return r;t--}return 0}function Tr(e,t){let n=e.charCodeAt(t);if(!Dr(n)||t+1==e.length)return n;let r=e.charCodeAt(t+1);return Er(r)?(n-55296<<10)+(r-56320)+65536:n}function Er(e){return e>=56320&&e<57344}function Dr(e){return e>=55296&&e<56320}function Or(e){return e<65536?1:2}var z=class e{lineAt(e){if(e<0||e>this.length)throw RangeError(`Invalid position ${e} in document of length ${this.length}`);return this.lineInner(e,!1,1,0)}line(e){if(e<1||e>this.lines)throw RangeError(`Invalid line number ${e} in ${this.lines}-line document`);return this.lineInner(e,!0,1,0)}replace(e,t,n){[e,t]=Rr(this,e,t);let r=[];return this.decompose(0,e,r,2),n.length&&n.decompose(0,n.length,r,3),this.decompose(t,this.length,r,1),Ar.from(r,this.length-(t-e)+n.length)}append(e){return this.replace(this.length,this.length,e)}slice(e,t=this.length){[e,t]=Rr(this,e,t);let n=[];return this.decompose(e,t,n,0),Ar.from(n,t-e)}eq(e){if(e==this)return!0;if(e.length!=this.length||e.lines!=this.lines)return!1;let t=this.scanIdentical(e,1),n=this.length-this.scanIdentical(e,-1),r=new Pr(this),i=new Pr(e);for(let e=t,a=t;;){if(r.next(e),i.next(e),e=0,r.lineBreak!=i.lineBreak||r.done!=i.done||r.value!=i.value)return!1;if(a+=r.value.length,r.done||a>=n)return!0}}iter(e=1){return new Pr(this,e)}iterRange(e,t=this.length){return new Fr(this,e,t)}iterLines(e,t){let n;if(e==null)n=this.iter();else{t??=this.lines+1;let r=this.line(e).from;n=this.iterRange(r,Math.max(r,t==this.lines+1?this.length:t<=1?0:this.line(t-1).to))}return new Ir(n)}toString(){return this.sliceString(0)}toJSON(){let e=[];return this.flatten(e),e}constructor(){}static of(t){if(t.length==0)throw RangeError(`A document must have at least one line`);return t.length==1&&!t[0]?e.empty:t.length<=32?new kr(t):Ar.from(kr.split(t,[]))}},kr=class e extends z{constructor(e,t=jr(e)){super(),this.text=e,this.length=t}get lines(){return this.text.length}get children(){return null}lineInner(e,t,n,r){for(let i=0;;i++){let a=this.text[i],o=r+a.length;if((t?n:o)>=e)return new Lr(r,o,n,a);r=o+1,n++}}decompose(t,n,r,i){let a=t<=0&&n>=this.length?this:new e(Nr(this.text,t,n),Math.min(n,this.length)-Math.max(0,t));if(i&1){let t=r.pop(),n=Mr(a.text,t.text.slice(),0,a.length);if(n.length<=32)r.push(new e(n,t.length+a.length));else{let t=n.length>>1;r.push(new e(n.slice(0,t)),new e(n.slice(t)))}}else r.push(a)}replace(t,n,r){if(!(r instanceof e))return super.replace(t,n,r);[t,n]=Rr(this,t,n);let i=Mr(this.text,Mr(r.text,Nr(this.text,0,t)),n),a=this.length+r.length-(n-t);return i.length<=32?new e(i,a):Ar.from(e.split(i,[]),a)}sliceString(e,t=this.length,n=`
`){[e,t]=Rr(this,e,t);let r=``;for(let i=0,a=0;i<=t&&a<this.text.length;a++){let o=this.text[a],s=i+o.length;i>e&&a&&(r+=n),e<s&&t>i&&(r+=o.slice(Math.max(0,e-i),t-i)),i=s+1}return r}flatten(e){for(let t of this.text)e.push(t)}scanIdentical(){return 0}static split(t,n){let r=[],i=-1;for(let a of t)r.push(a),i+=a.length+1,r.length==32&&(n.push(new e(r,i)),r=[],i=-1);return i>-1&&n.push(new e(r,i)),n}},Ar=class e extends z{constructor(e,t){super(),this.children=e,this.length=t,this.lines=0;for(let t of e)this.lines+=t.lines}lineInner(e,t,n,r){for(let i=0;;i++){let a=this.children[i],o=r+a.length,s=n+a.lines-1;if((t?s:o)>=e)return a.lineInner(e,t,n,r);r=o+1,n=s+1}}decompose(e,t,n,r){for(let i=0,a=0;a<=t&&i<this.children.length;i++){let o=this.children[i],s=a+o.length;if(e<=s&&t>=a){let i=r&(a<=e|(s>=t?2:0));a>=e&&s<=t&&!i?n.push(o):o.decompose(e-a,t-a,n,i)}a=s+1}}replace(t,n,r){if([t,n]=Rr(this,t,n),r.lines<this.lines)for(let i=0,a=0;i<this.children.length;i++){let o=this.children[i],s=a+o.length;if(t>=a&&n<=s){let c=o.replace(t-a,n-a,r),l=this.lines-o.lines+c.lines;if(c.lines<l>>4&&c.lines>l>>6){let a=this.children.slice();return a[i]=c,new e(a,this.length-(n-t)+r.length)}return super.replace(a,s,c)}a=s+1}return super.replace(t,n,r)}sliceString(e,t=this.length,n=`
`){[e,t]=Rr(this,e,t);let r=``;for(let i=0,a=0;i<this.children.length&&a<=t;i++){let o=this.children[i],s=a+o.length;a>e&&i&&(r+=n),e<s&&t>a&&(r+=o.sliceString(e-a,t-a,n)),a=s+1}return r}flatten(e){for(let t of this.children)t.flatten(e)}scanIdentical(t,n){if(!(t instanceof e))return 0;let r=0,[i,a,o,s]=n>0?[0,0,this.children.length,t.children.length]:[this.children.length-1,t.children.length-1,-1,-1];for(;;i+=n,a+=n){if(i==o||a==s)return r;let e=this.children[i],c=t.children[a];if(e!=c)return r+e.scanIdentical(c,n);r+=e.length+1}}static from(t,n=t.reduce((e,t)=>e+t.length+1,-1)){let r=0;for(let e of t)r+=e.lines;if(r<32){let e=[];for(let n of t)n.flatten(e);return new kr(e,n)}let i=Math.max(32,r>>5),a=i<<1,o=i>>1,s=[],c=0,l=-1,u=[];function d(t){let n;if(t.lines>a&&t instanceof e)for(let e of t.children)d(e);else t.lines>o&&(c>o||!c)?(f(),s.push(t)):t instanceof kr&&c&&(n=u[u.length-1])instanceof kr&&t.lines+n.lines<=32?(c+=t.lines,l+=t.length+1,u[u.length-1]=new kr(n.text.concat(t.text),n.length+1+t.length)):(c+t.lines>i&&f(),c+=t.lines,l+=t.length+1,u.push(t))}function f(){c!=0&&(s.push(u.length==1?u[0]:e.from(u,l)),l=-1,c=u.length=0)}for(let e of t)d(e);return f(),s.length==1?s[0]:new e(s,n)}};z.empty=new kr([``],0);function jr(e){let t=-1;for(let n of e)t+=n.length+1;return t}function Mr(e,t,n=0,r=1e9){for(let i=0,a=0,o=!0;a<e.length&&i<=r;a++){let s=e[a],c=i+s.length;c>=n&&(c>r&&(s=s.slice(0,r-i)),i<n&&(s=s.slice(n-i)),o?(t[t.length-1]+=s,o=!1):t.push(s)),i=c+1}return t}function Nr(e,t,n){return Mr(e,[``],t,n)}var Pr=class{constructor(e,t=1){this.dir=t,this.done=!1,this.lineBreak=!1,this.value=``,this.nodes=[e],this.offsets=[t>0?1:(e instanceof kr?e.text.length:e.children.length)<<1]}nextInner(e,t){for(this.done=this.lineBreak=!1;;){let n=this.nodes.length-1,r=this.nodes[n],i=this.offsets[n],a=i>>1,o=r instanceof kr?r.text.length:r.children.length;if(a==(t>0?o:0)){if(n==0)return this.done=!0,this.value=``,this;t>0&&this.offsets[n-1]++,this.nodes.pop(),this.offsets.pop()}else if((i&1)==(t>0?0:1)){if(this.offsets[n]+=t,e==0)return this.lineBreak=!0,this.value=`
`,this;e--}else if(r instanceof kr){let i=r.text[a+(t<0?-1:0)];if(this.offsets[n]+=t,i.length>Math.max(0,e))return this.value=e==0?i:t>0?i.slice(e):i.slice(0,i.length-e),this;e-=i.length}else{let i=r.children[a+(t<0?-1:0)];e>i.length?(e-=i.length,this.offsets[n]+=t):(t<0&&this.offsets[n]--,this.nodes.push(i),this.offsets.push(t>0?1:(i instanceof kr?i.text.length:i.children.length)<<1))}}}next(e=0){return e<0&&(this.nextInner(-e,-this.dir),e=this.value.length),this.nextInner(e,this.dir)}},Fr=class{constructor(e,t,n){this.value=``,this.done=!1,this.cursor=new Pr(e,t>n?-1:1),this.pos=t>n?e.length:0,this.from=Math.min(t,n),this.to=Math.max(t,n)}nextInner(e,t){if(t<0?this.pos<=this.from:this.pos>=this.to)return this.value=``,this.done=!0,this;e+=Math.max(0,t<0?this.pos-this.to:this.from-this.pos);let n=t<0?this.pos-this.from:this.to-this.pos;e>n&&(e=n),n-=e;let{value:r}=this.cursor.next(e);return this.pos+=(r.length+e)*t,this.value=r.length<=n?r:t<0?r.slice(r.length-n):r.slice(0,n),this.done=!this.value,this}next(e=0){return e<0?e=Math.max(e,this.from-this.pos):e>0&&(e=Math.min(e,this.to-this.pos)),this.nextInner(e,this.cursor.dir)}get lineBreak(){return this.cursor.lineBreak&&this.value!=``}},Ir=class{constructor(e){this.inner=e,this.afterBreak=!0,this.value=``,this.done=!1}next(e=0){let{done:t,lineBreak:n,value:r}=this.inner.next(e);return t&&this.afterBreak?(this.value=``,this.afterBreak=!1):t?(this.done=!0,this.value=``):n?this.afterBreak?this.value=``:(this.afterBreak=!0,this.next()):(this.value=r,this.afterBreak=!1),this}get lineBreak(){return!1}};typeof Symbol<`u`&&(z.prototype[Symbol.iterator]=function(){return this.iter()},Pr.prototype[Symbol.iterator]=Fr.prototype[Symbol.iterator]=Ir.prototype[Symbol.iterator]=function(){return this});var Lr=class{constructor(e,t,n,r){this.from=e,this.to=t,this.number=n,this.text=r}get length(){return this.to-this.from}};function Rr(e,t,n){return t=Math.max(0,Math.min(e.length,t)),[t,Math.max(t,Math.min(e.length,n))]}function zr(e,t,n=!0,r=!0){return Sr(e,t,n,r)}function Br(e){return e>=56320&&e<57344}function Vr(e){return e>=55296&&e<56320}function Hr(e,t){let n=e.charCodeAt(t);if(!Vr(n)||t+1==e.length)return n;let r=e.charCodeAt(t+1);return Br(r)?(n-55296<<10)+(r-56320)+65536:n}function Ur(e){return e<=65535?String.fromCharCode(e):(e-=65536,String.fromCharCode((e>>10)+55296,(e&1023)+56320))}function Wr(e){return e<65536?1:2}var Gr=/\r\n?|\n/,Kr=(function(e){return e[e.Simple=0]=`Simple`,e[e.TrackDel=1]=`TrackDel`,e[e.TrackBefore=2]=`TrackBefore`,e[e.TrackAfter=3]=`TrackAfter`,e})(Kr||={}),qr=class e{constructor(e){this.sections=e}get length(){let e=0;for(let t=0;t<this.sections.length;t+=2)e+=this.sections[t];return e}get newLength(){let e=0;for(let t=0;t<this.sections.length;t+=2){let n=this.sections[t+1];e+=n<0?this.sections[t]:n}return e}get empty(){return this.sections.length==0||this.sections.length==2&&this.sections[1]<0}iterGaps(e){for(let t=0,n=0,r=0;t<this.sections.length;){let i=this.sections[t++],a=this.sections[t++];a<0?(e(n,r,i),r+=i):r+=a,n+=i}}iterChangedRanges(e,t=!1){Zr(this,e,t)}get invertedDesc(){let t=[];for(let e=0;e<this.sections.length;){let n=this.sections[e++],r=this.sections[e++];r<0?t.push(n,r):t.push(r,n)}return new e(t)}composeDesc(e){return this.empty?e:e.empty?this:$r(this,e)}mapDesc(e,t=!1){return e.empty?this:Qr(this,e,t)}mapPos(e,t=-1,n=Kr.Simple){let r=0,i=0;for(let a=0;a<this.sections.length;){let o=this.sections[a++],s=this.sections[a++],c=r+o;if(s<0){if(c>e)return i+(e-r);i+=o}else{if(n!=Kr.Simple&&c>=e&&(n==Kr.TrackDel&&r<e&&c>e||n==Kr.TrackBefore&&r<e||n==Kr.TrackAfter&&c>e))return null;if(c>e||c==e&&t<0&&!o)return e==r||t<0?i:i+s;i+=s}r=c}if(e>r)throw RangeError(`Position ${e} is out of range for changeset of length ${r}`);return i}touchesRange(e,t=e){for(let n=0,r=0;n<this.sections.length&&r<=t;){let i=this.sections[n++],a=this.sections[n++],o=r+i;if(a>=0&&r<=t&&o>=e)return r<e&&o>t?`cover`:!0;r=o}return!1}toString(){let e=``;for(let t=0;t<this.sections.length;){let n=this.sections[t++],r=this.sections[t++];e+=(e?` `:``)+n+(r>=0?`:`+r:``)}return e}toJSON(){return this.sections}static fromJSON(t){if(!Array.isArray(t)||t.length%2||t.some(e=>typeof e!=`number`))throw RangeError(`Invalid JSON representation of ChangeDesc`);return new e(t)}static create(t){return new e(t)}},Jr=class e extends qr{constructor(e,t){super(e),this.inserted=t}apply(e){if(this.length!=e.length)throw RangeError(`Applying change set to a document with the wrong length`);return Zr(this,(t,n,r,i,a)=>e=e.replace(r,r+(n-t),a),!1),e}mapDesc(e,t=!1){return Qr(this,e,t,!0)}invert(t){let n=this.sections.slice(),r=[];for(let e=0,i=0;e<n.length;e+=2){let a=n[e],o=n[e+1];if(o>=0){n[e]=o,n[e+1]=a;let s=e>>1;for(;r.length<s;)r.push(z.empty);r.push(a?t.slice(i,i+a):z.empty)}i+=a}return new e(n,r)}compose(e){return this.empty?e:e.empty?this:$r(this,e,!0)}map(e,t=!1){return e.empty?this:Qr(this,e,t,!0)}iterChanges(e,t=!1){Zr(this,e,t)}get desc(){return qr.create(this.sections)}filter(t){let n=[],r=[],i=[],a=new ei(this);done:for(let e=0,o=0;;){let s=e==t.length?1e9:t[e++];for(;o<s||o==s&&a.len==0;){if(a.done)break done;let e=Math.min(a.len,s-o);Yr(i,e,-1);let t=a.ins==-1?-1:a.off==0?a.ins:0;Yr(n,e,t),t>0&&Xr(r,n,a.text),a.forward(e),o+=e}let c=t[e++];for(;o<c;){if(a.done)break done;let e=Math.min(a.len,c-o);Yr(n,e,-1),Yr(i,e,a.ins==-1?-1:a.off==0?a.ins:0),a.forward(e),o+=e}}return{changes:new e(n,r),filtered:qr.create(i)}}toJSON(){let e=[];for(let t=0;t<this.sections.length;t+=2){let n=this.sections[t],r=this.sections[t+1];r<0?e.push(n):r==0?e.push([n]):e.push([n].concat(this.inserted[t>>1].toJSON()))}return e}static of(t,n,r){let i=[],a=[],o=0,s=null;function c(t=!1){if(!t&&!i.length)return;o<n&&Yr(i,n-o,-1);let r=new e(i,a);s=s?s.compose(r.map(s)):r,i=[],a=[],o=0}function l(t){if(Array.isArray(t))for(let e of t)l(e);else if(t instanceof e){if(t.length!=n)throw RangeError(`Mismatched change set length (got ${t.length}, expected ${n})`);c(),s=s?s.compose(t.map(s)):t}else{let{from:e,to:s=e,insert:l}=t;if(e>s||e<0||s>n)throw RangeError(`Invalid change range ${e} to ${s} (in doc of length ${n})`);let u=l?typeof l==`string`?z.of(l.split(r||Gr)):l:z.empty,d=u.length;if(e==s&&d==0)return;e<o&&c(),e>o&&Yr(i,e-o,-1),Yr(i,s-e,d),Xr(a,i,u),o=s}}return l(t),c(!s),s}static empty(t){return new e(t?[t,-1]:[],[])}static fromJSON(t){if(!Array.isArray(t))throw RangeError(`Invalid JSON representation of ChangeSet`);let n=[],r=[];for(let e=0;e<t.length;e++){let i=t[e];if(typeof i==`number`)n.push(i,-1);else if(!Array.isArray(i)||typeof i[0]!=`number`||i.some((e,t)=>t&&typeof e!=`string`))throw RangeError(`Invalid JSON representation of ChangeSet`);else if(i.length==1)n.push(i[0],0);else{for(;r.length<e;)r.push(z.empty);r[e]=z.of(i.slice(1)),n.push(i[0],r[e].length)}}return new e(n,r)}static createSet(t,n){return new e(t,n)}};function Yr(e,t,n,r=!1){if(t==0&&n<=0)return;let i=e.length-2;i>=0&&n<=0&&n==e[i+1]?e[i]+=t:i>=0&&t==0&&e[i]==0?e[i+1]+=n:r?(e[i]+=t,e[i+1]+=n):e.push(t,n)}function Xr(e,t,n){if(n.length==0)return;let r=t.length-2>>1;if(r<e.length)e[e.length-1]=e[e.length-1].append(n);else{for(;e.length<r;)e.push(z.empty);e.push(n)}}function Zr(e,t,n){let r=e.inserted;for(let i=0,a=0,o=0;o<e.sections.length;){let s=e.sections[o++],c=e.sections[o++];if(c<0)i+=s,a+=s;else{let l=i,u=a,d=z.empty;for(;l+=s,u+=c,c&&r&&(d=d.append(r[o-2>>1])),!(n||o==e.sections.length||e.sections[o+1]<0);)s=e.sections[o++],c=e.sections[o++];t(i,l,a,u,d),i=l,a=u}}}function Qr(e,t,n,r=!1){let i=[],a=r?[]:null,o=new ei(e),s=new ei(t);for(let e=-1;;)if(o.done&&s.len||s.done&&o.len)throw Error(`Mismatched change set lengths`);else if(o.ins==-1&&s.ins==-1){let e=Math.min(o.len,s.len);Yr(i,e,-1),o.forward(e),s.forward(e)}else if(s.ins>=0&&(o.ins<0||e==o.i||o.off==0&&(s.len<o.len||s.len==o.len&&!n))){let t=s.len;for(Yr(i,s.ins,-1);t;){let n=Math.min(o.len,t);o.ins>=0&&e<o.i&&o.len<=n&&(Yr(i,0,o.ins),a&&Xr(a,i,o.text),e=o.i),o.forward(n),t-=n}s.next()}else if(o.ins>=0){let t=0,n=o.len;for(;n;)if(s.ins==-1){let e=Math.min(n,s.len);t+=e,n-=e,s.forward(e)}else if(s.ins==0&&s.len<n)n-=s.len,s.next();else break;Yr(i,t,e<o.i?o.ins:0),a&&e<o.i&&Xr(a,i,o.text),e=o.i,o.forward(o.len-n)}else if(o.done&&s.done)return a?Jr.createSet(i,a):qr.create(i);else throw Error(`Mismatched change set lengths`)}function $r(e,t,n=!1){let r=[],i=n?[]:null,a=new ei(e),o=new ei(t);for(let e=!1;;)if(a.done&&o.done)return i?Jr.createSet(r,i):qr.create(r);else if(a.ins==0)Yr(r,a.len,0,e),a.next();else if(o.len==0&&!o.done)Yr(r,0,o.ins,e),i&&Xr(i,r,o.text),o.next();else if(a.done||o.done)throw Error(`Mismatched change set lengths`);else{let t=Math.min(a.len2,o.len),n=r.length;if(a.ins==-1){let n=o.ins==-1?-1:o.off?0:o.ins;Yr(r,t,n,e),i&&n&&Xr(i,r,o.text)}else o.ins==-1?(Yr(r,a.off?0:a.len,t,e),i&&Xr(i,r,a.textBit(t))):(Yr(r,a.off?0:a.len,o.off?0:o.ins,e),i&&!o.off&&Xr(i,r,o.text));e=(a.ins>t||o.ins>=0&&o.len>t)&&(e||r.length>n),a.forward2(t),o.forward(t)}}var ei=class{constructor(e){this.set=e,this.i=0,this.next()}next(){let{sections:e}=this.set;this.i<e.length?(this.len=e[this.i++],this.ins=e[this.i++]):(this.len=0,this.ins=-2),this.off=0}get done(){return this.ins==-2}get len2(){return this.ins<0?this.len:this.ins}get text(){let{inserted:e}=this.set,t=this.i-2>>1;return t>=e.length?z.empty:e[t]}textBit(e){let{inserted:t}=this.set,n=this.i-2>>1;return n>=t.length&&!e?z.empty:t[n].slice(this.off,e==null?void 0:this.off+e)}forward(e){e==this.len?this.next():(this.len-=e,this.off+=e)}forward2(e){this.ins==-1?this.forward(e):e==this.ins?this.next():(this.ins-=e,this.off+=e)}},ti=class e{constructor(e,t,n,r){this.from=e,this.to=t,this.flags=n,this.goalColumn=r}get anchor(){return this.flags&32?this.to:this.from}get head(){return this.flags&32?this.from:this.to}get empty(){return this.from==this.to}get assoc(){return this.flags&8?-1:this.flags&16?1:0}get undirectional(){return(this.flags&64)>0}get bidiLevel(){let e=this.flags&7;return e==7?null:e}map(t,n=-1){let r,i;return this.empty?r=i=t.mapPos(this.from,n):(r=t.mapPos(this.from,1),i=t.mapPos(this.to,-1)),r==this.from&&i==this.to?this:new e(r,i,this.flags,this.goalColumn)}extend(e,t=e,n=0){if(e<=this.anchor&&t>=this.anchor)return B.range(e,t,void 0,void 0,n);let r=Math.abs(e-this.anchor)>Math.abs(t-this.anchor)?e:t;return B.range(this.anchor,r,void 0,void 0,n)}eq(e,t=!1){return this.anchor==e.anchor&&this.head==e.head&&this.goalColumn==e.goalColumn&&(!t||!this.empty||this.assoc==e.assoc)}toJSON(){return{anchor:this.anchor,head:this.head}}static fromJSON(e){if(!e||typeof e.anchor!=`number`||typeof e.head!=`number`)throw RangeError(`Invalid JSON representation for SelectionRange`);return B.range(e.anchor,e.head)}static create(t,n,r,i){return new e(t,n,r,i)}},B=class e{constructor(e,t){this.ranges=e,this.mainIndex=t}map(t,n=-1){return t.empty?this:e.create(this.ranges.map(e=>e.map(t,n)),this.mainIndex)}eq(e,t=!1){if(this.ranges.length!=e.ranges.length||this.mainIndex!=e.mainIndex)return!1;for(let n=0;n<this.ranges.length;n++)if(!this.ranges[n].eq(e.ranges[n],t))return!1;return!0}get main(){return this.ranges[this.mainIndex]}asSingle(){return this.ranges.length==1?this:new e([this.main],0)}addRange(t,n=!0){return e.create([t].concat(this.ranges),n?0:this.mainIndex+1)}replaceRange(t,n=this.mainIndex){let r=this.ranges.slice();return r[n]=t,e.create(r,this.mainIndex)}toJSON(){return{ranges:this.ranges.map(e=>e.toJSON()),main:this.mainIndex}}static fromJSON(t){if(!t||!Array.isArray(t.ranges)||typeof t.main!=`number`||t.main>=t.ranges.length)throw RangeError(`Invalid JSON representation for EditorSelection`);return new e(t.ranges.map(e=>ti.fromJSON(e)),t.main)}static single(t,n=t){return new e([e.range(t,n)],0)}static create(t,n=0){if(t.length==0)throw RangeError(`A selection needs at least one range`);for(let r=0,i=0;i<t.length;i++){let a=t[i];if(a.empty?a.from<=r:a.from<r)return e.normalized(t.slice(),n);r=a.to}return new e(t,n)}static cursor(e,t=0,n,r){return ti.create(e,e,(t==0?0:t<0?8:16)|(n==null?7:Math.min(6,n)),r)}static range(e,t,n,r,i){let a=r==null?7:Math.min(6,r);return!i&&e!=t&&(i=t<e?1:-1),i&&(a|=i<0?8:16),t<e?ti.create(t,e,a|32,n):ti.create(e,t,a,n)}static undirectionalRange(e,t){return ti.create(e,t,64,void 0)}static normalized(t,n=0){let r=t[n];t.sort((e,t)=>e.from-t.from),n=t.indexOf(r);for(let r=1;r<t.length;r++){let i=t[r],a=t[r-1];if(i.empty?i.from<=a.to:i.from<a.to){let o=a.from,s=Math.max(i.to,a.to);r<=n&&n--,t.splice(--r,2,i.anchor>i.head?e.range(s,o):e.range(o,s))}}return new e(t,n)}};function ni(e,t){for(let n of e.ranges)if(n.to>t)throw RangeError(`Selection points outside of document`)}var ri=0,V=class e{constructor(e,t,n,r,i){this.combine=e,this.compareInput=t,this.compare=n,this.isStatic=r,this.id=ri++,this.default=e([]),this.extensions=typeof i==`function`?i(this):i}get reader(){return this}static define(t={}){return new e(t.combine||(e=>e),t.compareInput||((e,t)=>e===t),t.compare||(t.combine?(e,t)=>e===t:ii),!!t.static,t.enables)}of(e){return new ai([],this,0,e)}compute(e,t){if(this.isStatic)throw Error(`Can't compute a static facet`);return new ai(e,this,1,t)}computeN(e,t){if(this.isStatic)throw Error(`Can't compute a static facet`);return new ai(e,this,2,t)}from(e,t){return t||=e=>e,this.compute([e],n=>t(n.field(e)))}};function ii(e,t){return e==t||e.length==t.length&&e.every((e,n)=>e===t[n])}var ai=class{constructor(e,t,n,r){this.dependencies=e,this.facet=t,this.type=n,this.value=r,this.id=ri++}dynamicSlot(e){let t=this.value,n=this.facet.compareInput,r=this.id,i=e[r]>>1,a=this.type==2,o=!1,s=!1,c=[];for(let t of this.dependencies)t==`doc`?o=!0:t==`selection`?s=!0:(e[t.id]??1)&1||c.push(e[t.id]);return{create(e){return e.values[i]=t(e),1},update(e,r){if(o&&r.docChanged||s&&(r.docChanged||r.selection)||si(e,c)){let r=t(e);if(a?!oi(r,e.values[i],n):!n(r,e.values[i]))return e.values[i]=r,1}return 0},reconfigure:(e,o)=>{let s,c=o.config.address[r];if(c!=null){let r=bi(o,c);if(this.dependencies.every(t=>t instanceof V?o.facet(t)===e.facet(t):t instanceof ui?o.field(t,!1)==e.field(t,!1):!0)||(a?oi(s=t(e),r,n):n(s=t(e),r)))return e.values[i]=r,0}else s=t(e);return e.values[i]=s,1}}}get extension(){return this}};function oi(e,t,n){if(e.length!=t.length)return!1;for(let r=0;r<e.length;r++)if(!n(e[r],t[r]))return!1;return!0}function si(e,t){let n=!1;for(let r of t)yi(e,r)&1&&(n=!0);return n}function ci(e,t,n){let r=n.map(t=>e[t.id]),i=n.map(e=>e.type),a=r.filter(e=>!(e&1)),o=e[t.id]>>1;function s(e){let n=[];for(let t=0;t<r.length;t++){let a=bi(e,r[t]);if(i[t]==2)for(let e of a)n.push(e);else n.push(a)}return t.combine(n)}return{create(e){for(let t of r)yi(e,t);return e.values[o]=s(e),1},update(e,n){if(!si(e,a))return 0;let r=s(e);return t.compare(r,e.values[o])?0:(e.values[o]=r,1)},reconfigure(e,i){let a=si(e,r),c=i.config.facets[t.id],l=i.facet(t);if(c&&!a&&ii(n,c))return e.values[o]=l,0;let u=s(e);return t.compare(u,l)?(e.values[o]=l,0):(e.values[o]=u,1)}}}var li=V.define({static:!0}),ui=class e{constructor(e,t,n,r,i){this.id=e,this.createF=t,this.updateF=n,this.compareF=r,this.spec=i,this.provides=void 0}static define(t){let n=new e(ri++,t.create,t.update,t.compare||((e,t)=>e===t),t);return t.provide&&(n.provides=t.provide(n)),n}create(e){return(e.facet(li).find(e=>e.field==this)?.create||this.createF)(e)}slot(e){let t=e[this.id]>>1;return{create:e=>(e.values[t]=this.create(e),1),update:(e,n)=>{let r=e.values[t],i=this.updateF(r,n);return this.compareF(r,i)?0:(e.values[t]=i,1)},reconfigure:(e,n)=>{let r=e.facet(li),i=n.facet(li),a;return(a=r.find(e=>e.field==this))&&a!=i.find(e=>e.field==this)?(e.values[t]=a.create(e),1):n.config.address[this.id]==null?(e.values[t]=this.create(e),1):(e.values[t]=n.field(this),0)}}}init(e){return[this,li.of({field:this,create:e})]}get extension(){return this}},di={lowest:4,low:3,default:2,high:1,highest:0};function fi(e){return t=>new mi(t,e)}var pi={highest:fi(di.highest),high:fi(di.high),default:fi(di.default),low:fi(di.low),lowest:fi(di.lowest)},mi=class{constructor(e,t){this.inner=e,this.prec=t}get extension(){return this}},hi=class e{of(e){return new gi(this,e)}reconfigure(t){return e.reconfigure.of({compartment:this,extension:t})}get(e){return e.config.compartments.get(this)}},gi=class{constructor(e,t){this.compartment=e,this.inner=t}get extension(){return this}},_i=class e{constructor(e,t,n,r,i,a){for(this.base=e,this.compartments=t,this.dynamicSlots=n,this.address=r,this.staticValues=i,this.facets=a,this.statusTemplate=[];this.statusTemplate.length<n.length;)this.statusTemplate.push(0)}staticFacet(e){let t=this.address[e.id];return t==null?e.default:this.staticValues[t>>1]}static resolve(t,n,r){let i=[],a=Object.create(null),o=new Map;for(let e of vi(t,n,o))e instanceof ui?i.push(e):(a[e.facet.id]||(a[e.facet.id]=[])).push(e);let s=Object.create(null),c=[],l=[];for(let e of i)s[e.id]=l.length<<1,l.push(t=>e.slot(t));let u=r?.config.facets;for(let e in a){let t=a[e],n=t[0].facet,i=u&&u[e]||[];if(t.every(e=>e.type==0)){if(s[n.id]=c.length<<1|1,ii(i,t))c.push(r.facet(n));else{let e=n.combine(t.map(e=>e.value));c.push(r&&n.compare(e,r.facet(n))?r.facet(n):e)}}else{for(let e of t)e.type==0?(s[e.id]=c.length<<1|1,c.push(e.value)):(s[e.id]=l.length<<1,l.push(t=>e.dynamicSlot(t)));s[n.id]=l.length<<1,l.push(e=>ci(e,n,t))}}let d=l.map(e=>e(s));return new e(t,o,d,s,c,a)}};function vi(e,t,n){let r=[[],[],[],[],[]],i=new Map;function a(e,o){let s=i.get(e);if(s!=null){if(s<=o)return;let t=r[s].indexOf(e);t>-1&&r[s].splice(t,1),e instanceof gi&&n.delete(e.compartment)}if(i.set(e,o),Array.isArray(e))for(let t of e)a(t,o);else if(e instanceof gi){if(n.has(e.compartment))throw RangeError(`Duplicate use of compartment in extensions`);let r=t.get(e.compartment)||e.inner;n.set(e.compartment,r),a(r,o)}else if(e instanceof mi)a(e.inner,e.prec);else if(e instanceof ui)r[o].push(e),e.provides&&a(e.provides,o);else if(e instanceof ai)r[o].push(e),e.facet.extensions&&a(e.facet.extensions,di.default);else{let t=e.extension;if(!t)throw Error(`Unrecognized extension value in extension set (${e}).`);if(t==e)throw Error(`Unrecognized extension value in extension set (${e}). This sometimes happens because multiple instances of @codemirror/state are loaded, breaking instanceof checks.`);a(t,o)}}return a(e,di.default),r.reduce((e,t)=>e.concat(t))}function yi(e,t){if(t&1)return 2;let n=t>>1,r=e.status[n];if(r==4)throw Error(`Cyclic dependency between fields and/or facets`);if(r&2)return r;e.status[n]=4;let i=e.computeSlot(e,e.config.dynamicSlots[n]);return e.status[n]=2|i}function bi(e,t){return t&1?e.config.staticValues[t>>1]:e.values[t>>1]}var xi=V.define(),Si=V.define({combine:e=>e.some(e=>e),static:!0}),Ci=V.define({combine:e=>e.length?e[0]:void 0,static:!0}),wi=V.define(),Ti=V.define(),Ei=V.define(),Di=V.define({combine:e=>e.length?e[0]:!1}),Oi=class{constructor(e,t){this.type=e,this.value=t}static define(){return new ki}},ki=class{of(e){return new Oi(this,e)}},Ai=class{constructor(e){this.map=e}of(e){return new H(this,e)}},H=class e{constructor(e,t){this.type=e,this.value=t}map(t){let n=this.type.map(this.value,t);return n===void 0?void 0:n==this.value?this:new e(this.type,n)}is(e){return this.type==e}static define(e={}){return new Ai(e.map||(e=>e))}static mapEffects(e,t){if(!e.length)return e;let n=[];for(let r of e){let e=r.map(t);e&&n.push(e)}return n}};H.reconfigure=H.define(),H.appendConfig=H.define();var ji=class e{constructor(t,n,r,i,a,o){this.startState=t,this.changes=n,this.selection=r,this.effects=i,this.annotations=a,this.scrollIntoView=o,this._doc=null,this._state=null,r&&ni(r,n.newLength),a.some(t=>t.type==e.time)||(this.annotations=a.concat(e.time.of(Date.now())))}static create(t,n,r,i,a,o){return new e(t,n,r,i,a,o)}get newDoc(){return this._doc||=this.changes.apply(this.startState.doc)}get newSelection(){return this.selection||this.startState.selection.map(this.changes)}get state(){return this._state||this.startState.applyTransaction(this),this._state}annotation(e){for(let t of this.annotations)if(t.type==e)return t.value}get docChanged(){return!this.changes.empty}get reconfigured(){return this.startState.config!=this.state.config}isUserEvent(t){let n=this.annotation(e.userEvent);return!!(n&&(n==t||n.length>t.length&&n.slice(0,t.length)==t&&n[t.length]==`.`))}};ji.time=Oi.define(),ji.userEvent=Oi.define(),ji.addToHistory=Oi.define(),ji.remote=Oi.define();function Mi(e,t){let n=[];for(let r=0,i=0;;){let a,o;if(r<e.length&&(i==t.length||t[i]>=e[r]))a=e[r++],o=e[r++];else if(i<t.length)a=t[i++],o=t[i++];else return n;!n.length||n[n.length-1]<a?n.push(a,o):n[n.length-1]<o&&(n[n.length-1]=o)}}function Ni(e,t,n){let r,i,a;return n?(r=t.changes,i=Jr.empty(t.changes.length),a=e.changes.compose(t.changes)):(r=t.changes.map(e.changes),i=e.changes.mapDesc(t.changes,!0),a=e.changes.compose(r)),{changes:a,selection:t.selection?t.selection.map(i):e.selection?.map(r),effects:H.mapEffects(e.effects,r).concat(H.mapEffects(t.effects,i)),annotations:e.annotations.length?e.annotations.concat(t.annotations):t.annotations,scrollIntoView:e.scrollIntoView||t.scrollIntoView}}function Pi(e,t,n){let r=t.selection,i=zi(t.annotations);return t.userEvent&&(i=i.concat(ji.userEvent.of(t.userEvent))),{changes:t.changes instanceof Jr?t.changes:Jr.of(t.changes||[],n,e.facet(Ci)),selection:r&&(r instanceof B?r:B.single(r.anchor,r.head)),effects:zi(t.effects),annotations:i,scrollIntoView:!!t.scrollIntoView}}function Fi(e,t,n){let r=Pi(e,t.length?t[0]:{},e.doc.length);t.length&&t[0].filter===!1&&(n=!1);for(let i=1;i<t.length;i++){t[i].filter===!1&&(n=!1);let a=!!t[i].sequential;r=Ni(r,Pi(e,t[i],a?r.changes.newLength:e.doc.length),a)}let i=ji.create(e,r.changes,r.selection,r.effects,r.annotations,r.scrollIntoView);return Li(n?Ii(i):i)}function Ii(e){let t=e.startState,n=!0;for(let r of t.facet(wi)){let t=r(e);if(t===!1){n=!1;break}Array.isArray(t)&&(n=n===!0?t:Mi(n,t))}if(n!==!0){let r,i;if(n===!1)i=e.changes.invertedDesc,r=Jr.empty(t.doc.length);else{let t=e.changes.filter(n);r=t.changes,i=t.filtered.mapDesc(t.changes).invertedDesc}e=ji.create(t,r,e.selection&&e.selection.map(i),H.mapEffects(e.effects,i),e.annotations,e.scrollIntoView)}let r=t.facet(Ti);for(let n=r.length-1;n>=0;n--){let i=r[n](e);e=i instanceof ji?i:Array.isArray(i)&&i.length==1&&i[0]instanceof ji?i[0]:Fi(t,zi(i),!1)}return e}function Li(e){let t=e.startState,n=t.facet(Ei),r=e;for(let i=n.length-1;i>=0;i--){let a=n[i](e);a&&Object.keys(a).length&&(r=Ni(r,Pi(t,a,e.changes.newLength),!0))}return r==e?e:ji.create(t,e.changes,e.selection,r.effects,r.annotations,r.scrollIntoView)}var Ri=[];function zi(e){return e==null?Ri:Array.isArray(e)?e:[e]}var Bi=(function(e){return e[e.Word=0]=`Word`,e[e.Space=1]=`Space`,e[e.Other=2]=`Other`,e})(Bi||={}),Vi=/[\u00df\u0587\u0590-\u05f4\u0600-\u06ff\u3040-\u309f\u30a0-\u30ff\u3400-\u4db5\u4e00-\u9fcc\uac00-\ud7af]/,Hi;try{Hi=RegExp(`[\\p{Alphabetic}\\p{Number}_]`,`u`)}catch{}function Ui(e){if(Hi)return Hi.test(e);for(let t=0;t<e.length;t++){let n=e[t];if(/\w/.test(n)||n>``&&(n.toUpperCase()!=n.toLowerCase()||Vi.test(n)))return!0}return!1}function Wi(e){return t=>{if(!/\S/.test(t))return Bi.Space;if(Ui(t))return Bi.Word;for(let n=0;n<e.length;n++)if(t.indexOf(e[n])>-1)return Bi.Word;return Bi.Other}}var Gi=class e{constructor(e,t,n,r,i,a){this.config=e,this.doc=t,this.selection=n,this.values=r,this.status=e.statusTemplate.slice(),this.computeSlot=i,a&&(a._state=this);for(let e=0;e<this.config.dynamicSlots.length;e++)yi(this,e<<1);this.computeSlot=null}field(e,t=!0){let n=this.config.address[e.id];if(n==null){if(t)throw RangeError(`Field is not present in this state`)}else return yi(this,n),bi(this,n)}update(...e){return Fi(this,e,!0)}applyTransaction(t){let n=this.config,{base:r,compartments:i}=n;for(let e of t.effects)e.is(hi.reconfigure)?(n&&=(i=new Map,n.compartments.forEach((e,t)=>i.set(t,e)),null),i.set(e.value.compartment,e.value.extension)):e.is(H.reconfigure)?(n=null,r=e.value):e.is(H.appendConfig)&&(n=null,r=zi(r).concat(e.value));let a;n?a=t.startState.values.slice():(n=_i.resolve(r,i,this),a=new e(n,this.doc,this.selection,n.dynamicSlots.map(()=>null),(e,t)=>t.reconfigure(e,this),null).values);let o=t.startState.facet(Si)?t.newSelection:t.newSelection.asSingle();new e(n,t.newDoc,o,a,(e,n)=>n.update(e,t),t)}replaceSelection(e){return typeof e==`string`&&(e=this.toText(e)),this.changeByRange(t=>({changes:{from:t.from,to:t.to,insert:e},range:B.cursor(t.from+e.length,-1)}))}changeByRange(e){let t=this.selection,n=e(t.ranges[0]),r=this.changes(n.changes),i=[n.range],a=zi(n.effects);for(let n=1;n<t.ranges.length;n++){let o=e(t.ranges[n]),s=this.changes(o.changes),c=s.map(r);for(let e=0;e<n;e++)i[e]=i[e].map(c);let l=r.mapDesc(s,!0);i.push(o.range.map(l)),r=r.compose(c),a=H.mapEffects(a,c).concat(H.mapEffects(zi(o.effects),l))}return{changes:r,selection:B.create(i,t.mainIndex),effects:a}}changes(t=[]){return t instanceof Jr?t:Jr.of(t,this.doc.length,this.facet(e.lineSeparator))}toText(t){return z.of(t.split(this.facet(e.lineSeparator)||Gr))}sliceDoc(e=0,t=this.doc.length){return this.doc.sliceString(e,t,this.lineBreak)}facet(e){let t=this.config.address[e.id];return t==null?e.default:(yi(this,t),bi(this,t))}toJSON(e){let t={doc:this.sliceDoc(),selection:this.selection.toJSON()};if(e)for(let n in e){let r=e[n];r instanceof ui&&this.config.address[r.id]!=null&&(t[n]=r.spec.toJSON(this.field(e[n]),this))}return t}static fromJSON(t,n={},r){if(!t||typeof t.doc!=`string`)throw RangeError(`Invalid JSON representation for EditorState`);let i=[];if(r){for(let e in r)if(Object.prototype.hasOwnProperty.call(t,e)){let n=r[e],a=t[e];i.push(n.init(e=>n.spec.fromJSON(a,e)))}}return e.create({doc:t.doc,selection:B.fromJSON(t.selection),extensions:n.extensions?i.concat([n.extensions]):i})}static create(t={}){let n=_i.resolve(t.extensions||[],new Map),r=t.doc instanceof z?t.doc:z.of((t.doc||``).split(n.staticFacet(e.lineSeparator)||Gr)),i=t.selection?t.selection instanceof B?t.selection:B.single(t.selection.anchor,t.selection.head):B.single(0);return ni(i,r.length),n.staticFacet(Si)||(i=i.asSingle()),new e(n,r,i,n.dynamicSlots.map(()=>null),(e,t)=>t.create(e),null)}get tabSize(){return this.facet(e.tabSize)}get lineBreak(){return this.facet(e.lineSeparator)||`
`}get readOnly(){return this.facet(Di)}phrase(t,...n){for(let n of this.facet(e.phrases))if(Object.prototype.hasOwnProperty.call(n,t)){t=n[t];break}return n.length&&(t=t.replace(/\$(\$|\d*)/g,(e,t)=>{if(t==`$`)return`$`;let r=+(t||1);return!r||r>n.length?e:n[r-1]})),t}languageDataAt(e,t,n=-1){let r=[];for(let i of this.facet(xi))for(let a of i(this,t,n))Object.prototype.hasOwnProperty.call(a,e)&&r.push(a[e]);return r}charCategorizer(e){let t=this.languageDataAt(`wordChars`,e);return Wi(t.length?t[0]:``)}wordAt(e){let{text:t,from:n,length:r}=this.doc.lineAt(e),i=this.charCategorizer(e),a=e-n,o=e-n;for(;a>0;){let e=zr(t,a,!1);if(i(t.slice(e,a))!=Bi.Word)break;a=e}for(;o<r;){let e=zr(t,o);if(i(t.slice(o,e))!=Bi.Word)break;o=e}return a==o?null:B.range(a+n,o+n)}};Gi.allowMultipleSelections=Si,Gi.tabSize=V.define({combine:e=>e.length?e[0]:4}),Gi.lineSeparator=Ci,Gi.readOnly=Di,Gi.phrases=V.define({compare(e,t){let n=Object.keys(e),r=Object.keys(t);return n.length==r.length&&n.every(n=>e[n]==t[n])}}),Gi.languageData=xi,Gi.changeFilter=wi,Gi.transactionFilter=Ti,Gi.transactionExtender=Ei,hi.reconfigure=H.define();function Ki(e,t,n={}){let r={};for(let t of e)for(let e of Object.keys(t)){let i=t[e],a=r[e];if(a===void 0)r[e]=i;else if(a!==i&&i!==void 0){if(Object.hasOwnProperty.call(n,e))r[e]=n[e](a,i);else throw Error(`Config merge conflict for field `+e)}}for(let e in t)r[e]===void 0&&(r[e]=t[e]);return r}var qi=class{eq(e){return this==e}range(e,t=e){return Yi.create(e,t,this)}};qi.prototype.startSide=qi.prototype.endSide=0,qi.prototype.point=!1,qi.prototype.mapMode=Kr.TrackDel;function Ji(e,t){return e==t||e.constructor==t.constructor&&e.eq(t)}var Yi=class e{constructor(e,t,n){this.from=e,this.to=t,this.value=n}static create(t,n,r){return new e(t,n,r)}};function Xi(e,t){return e.from-t.from||e.value.startSide-t.value.startSide}var Zi=class e{constructor(e,t,n,r){this.from=e,this.to=t,this.value=n,this.maxPoint=r}get length(){return Qi(this.to)}findIndex(e,t,n,r=0){let i=n?this.to:this.from;for(let a=r,o=i.length;;){if(a==o)return a;let r=a+o>>1,s=i[r]-e||(n?this.value[r].endSide:this.value[r].startSide)-t;if(r==a)return s>=0?a:o;s>=0?o=r:a=r+1}}between(e,t,n,r){for(let i=this.findIndex(t,-1e9,!0),a=this.findIndex(n,1e9,!1,i);i<a;i++)if(r(this.from[i]+e,this.to[i]+e,this.value[i])===!1)return!1}map(t,n,r,i,a){let o=[],s=[],c=[],l=-1,u=-1;iter:for(let e=0;e<this.value.length;e++){let d=this.value[e],f=this.from[e]+t,p=this.to[e]+t,m,h;if(f==p){let e=n.mapPos(f,d.startSide,d.mapMode);if(e==null||(m=h=e,d.startSide!=d.endSide&&(h=n.mapPos(f,d.endSide),h<m)))continue}else if(m=n.mapPos(f,d.startSide),h=n.mapPos(p,d.endSide),m>h||m==h&&d.startSide>0&&d.endSide<=0)continue;if(!((h-m||d.endSide-d.startSide)<0)){if(l<0&&(l=m),d.point&&(u=Math.max(u,h-m)),(m-r||d.startSide-i)>=0)o.push(d),s.push(m-l),c.push(h-l),r=h,i=d.endSide;else{if(m==h)for(let e=o.length;e>0;e--){if((m-(c[e-1]+l)||d.startSide-o[e-1].endSide)>=0){o.splice(e,0,d),s.splice(e,0,m-l),c.splice(e,0,h-l);continue iter}if((m-(s[e-1]+l)||d.endSide-o[e-1].startSide)>0)break}a(m,h,d)}}}return{mapped:o.length?new e(s,c,o,u):null,pos:l}}},U=class e{constructor(e,t,n,r){this.chunkPos=e,this.chunk=t,this.nextLayer=n,this.maxPoint=r}static create(t,n,r,i){return new e(t,n,r,i)}get length(){let e=this.chunk.length-1;return e<0?0:Math.max(this.chunkEnd(e),this.nextLayer.length)}get size(){if(this.isEmpty)return 0;let e=this.nextLayer.size;for(let t of this.chunk)e+=t.value.length;return e}chunkEnd(e){return this.chunkPos[e]+this.chunk[e].length}update(t){let{add:n=[],sort:r=!1,filterFrom:i=0,filterTo:a=this.length}=t,o=t.filter;if(n.length==0&&!o)return this;if(r&&(n=n.slice().sort(Xi)),this.isEmpty)return n.length?e.of(n):this;let s=new na(this,null,-1).goto(0),c=0,l=[],u=new ea;for(;s.value||c<n.length;)if(c<n.length&&(s.from-n[c].from||s.startSide-n[c].value.startSide)>=0){let e=n[c++];u.addInner(e.from,e.to,e.value,!1)||l.push(e)}else s.rangeIndex==1&&s.chunkIndex<this.chunk.length&&(c==n.length||this.chunkEnd(s.chunkIndex)<n[c].from)&&(!o||i>this.chunkEnd(s.chunkIndex)||a<this.chunkPos[s.chunkIndex])&&u.addChunk(this.chunkPos[s.chunkIndex],this.chunk[s.chunkIndex])?s.nextChunk():((!o||i>s.to||a<s.from||o(s.from,s.to,s.value))&&(u.addInner(s.from,s.to,s.value,!1)||l.push(Yi.create(s.from,s.to,s.value))),s.next());return u.finishInner(this.nextLayer.isEmpty&&!l.length?e.empty:this.nextLayer.update({add:l,filter:o,filterFrom:i,filterTo:a}))}map(t){if(t.empty||this.isEmpty)return this;let n=[],r=[],i=-1,a,o=(e,t,n)=>{a||=new ea,a.addRange(e,t,n,!1)};for(let e=0;e<this.chunk.length;e++){let a=this.chunkPos[e],s=this.chunk[e],c=t.touchesRange(a,a+s.length);if(c===!1)i=Math.max(i,s.maxPoint),n.push(s),r.push(t.mapPos(a));else if(c===!0){let[e,c]=n.length?[Qi(r)+Qi(n).length,Qi(Qi(n).value).endSide]:[-1,-1],{mapped:l,pos:u}=s.map(a,t,e,c,o);l&&(i=Math.max(i,l.maxPoint),n.push(l),r.push(u))}}let s=this.nextLayer.map(t);return a&&(s=a.finishInner(s)),n.length==0?s:new e(r,n,s||e.empty,i)}between(e,t,n){if(!this.isEmpty){for(let r=0;r<this.chunk.length;r++){let i=this.chunkPos[r],a=this.chunk[r];if(t>=i&&e<=i+a.length&&a.between(i,e-i,t-i,n)===!1)return}this.nextLayer.between(e,t,n)}}iter(e=0){return ra.from([this]).goto(e)}get isEmpty(){return this.nextLayer==this}static iter(e,t=0){return ra.from(e).goto(t)}static compare(e,t,n,r,i=-1){let a=e.filter(e=>e.maxPoint>0||!e.isEmpty&&e.maxPoint>=i),o=t.filter(e=>e.maxPoint>0||!e.isEmpty&&e.maxPoint>=i),s=ta(a,o,n),c=new aa(a,s,i),l=new aa(o,s,i);n.iterGaps((e,t,n)=>oa(c,e,l,t,n,r)),n.empty&&n.length==0&&oa(c,0,l,0,0,r)}static eq(e,t,n=0,r){r??=1e9-1;let i=e.filter(e=>!e.isEmpty&&t.indexOf(e)<0),a=t.filter(t=>!t.isEmpty&&e.indexOf(t)<0);if(i.length!=a.length)return!1;if(!i.length)return!0;let o=ta(i,a),s=new aa(i,o,0).goto(n),c=new aa(a,o,0).goto(n);for(;;){if(s.to!=c.to||!sa(s.active,c.active)||s.point&&(!c.point||!Ji(s.point,c.point)))return!1;if(s.to>r)return!0;s.next(),c.next()}}static spans(e,t,n,r,i=-1){let a=new aa(e,null,i).goto(t),o=t,s=a.openStart;for(;;){let e=Math.min(a.to,n);if(a.point){let n=a.activeForPoint(a.to),i=a.pointFrom<t?n.length+1:a.point.startSide<0?n.length:Math.min(n.length,s);r.point(o,e,a.point,n,i,a.pointRank),s=Math.min(a.openEnd(e),n.length)}else e>o&&(r.span(o,e,a.active,s),s=a.openEnd(e));if(a.to>n)return s+(a.point&&a.to>n?1:0);o=a.to,a.next()}}static of(e,t=!1){let n=new ea;for(let r of e instanceof Yi?[e]:t?$i(e):e)n.add(r.from,r.to,r.value);return n.finish()}static join(t){if(!t.length)return e.empty;let n=Qi(t);for(let r=t.length-2;r>=0;r--)for(let i=t[r];i!=e.empty;i=i.nextLayer)n=new e(i.chunkPos,i.chunk,n,Math.max(i.maxPoint,n.maxPoint));return n}};U.empty=new U([],[],null,-1);function Qi(e){return e[e.length-1]}function $i(e){if(e.length>1)for(let t=e[0],n=1;n<e.length;n++){let r=e[n];if(Xi(t,r)>0)return e.slice().sort(Xi);t=r}return e}U.empty.nextLayer=U.empty;var ea=class e{finishChunk(e){this.chunks.push(new Zi(this.from,this.to,this.value,this.maxPoint)),this.chunkPos.push(this.chunkStart),this.chunkStart=-1,this.setMaxPoint=Math.max(this.setMaxPoint,this.maxPoint),this.maxPoint=-1,e&&(this.from=[],this.to=[],this.value=[])}constructor(){this.chunks=[],this.chunkPos=[],this.chunkStart=-1,this.last=null,this.lastFrom=-1e9,this.lastTo=-1e9,this.from=[],this.to=[],this.value=[],this.maxPoint=-1,this.setMaxPoint=-1,this.nextLayer=null}add(e,t,n){this.addRange(e,t,n,!0)}addRange(t,n,r,i){this.addInner(t,n,r,i)||(this.nextLayer||=new e).addRange(t,n,r,i)}addInner(e,t,n,r){let i=e-this.lastTo||n.startSide-this.last.endSide;if(r&&i<=0&&(e-this.lastFrom||n.startSide-this.last.startSide)<0)throw Error("Ranges must be added sorted by `from` position and `startSide`");return i<0?!1:(this.from.length==250&&this.finishChunk(!0),this.chunkStart<0&&(this.chunkStart=e),this.from.push(e-this.chunkStart),this.to.push(t-this.chunkStart),this.last=n,this.lastFrom=e,this.lastTo=t,this.value.push(n),n.point&&(this.maxPoint=Math.max(this.maxPoint,t-e)),!0)}addChunk(e,t){if((e-this.lastTo||t.value[0].startSide-this.last.endSide)<0)return!1;this.from.length&&this.finishChunk(!0),this.setMaxPoint=Math.max(this.setMaxPoint,t.maxPoint),this.chunks.push(t),this.chunkPos.push(e);let n=t.value.length-1;return this.last=t.value[n],this.lastFrom=t.from[n]+e,this.lastTo=t.to[n]+e,!0}finish(){return this.finishInner(U.empty)}finishInner(e){if(this.from.length&&this.finishChunk(!1),this.chunks.length==0)return e;let t=U.create(this.chunkPos,this.chunks,this.nextLayer?this.nextLayer.finishInner(e):e,this.setMaxPoint);return this.from=null,t}};function ta(e,t,n){let r=new Map;for(let t of e)for(let e=0;e<t.chunk.length;e++)t.chunk[e].maxPoint<=0&&r.set(t.chunk[e],t.chunkPos[e]);let i=new Set;for(let e of t)for(let t=0;t<e.chunk.length;t++){let a=r.get(e.chunk[t]);a!=null&&(n?n.mapPos(a):a)==e.chunkPos[t]&&!n?.touchesRange(a,a+e.chunk[t].length)&&i.add(e.chunk[t])}return i}var na=class{constructor(e,t,n,r=0){this.layer=e,this.skip=t,this.minPoint=n,this.rank=r}get startSide(){return this.value?this.value.startSide:0}get endSide(){return this.value?this.value.endSide:0}goto(e,t=-1e9){return this.chunkIndex=this.rangeIndex=0,this.gotoInner(e,t,!1),this}gotoInner(e,t,n){for(;this.chunkIndex<this.layer.chunk.length;){let t=this.layer.chunk[this.chunkIndex];if(!(this.skip&&this.skip.has(t)||this.layer.chunkEnd(this.chunkIndex)<e||t.maxPoint<this.minPoint))break;this.chunkIndex++,n=!1}if(this.chunkIndex<this.layer.chunk.length){let r=this.layer.chunk[this.chunkIndex].findIndex(e-this.layer.chunkPos[this.chunkIndex],t,!0);(!n||this.rangeIndex<r)&&this.setRangeIndex(r)}this.next()}forward(e,t){(this.to-e||this.endSide-t)<0&&this.gotoInner(e,t,!0)}next(){for(;;)if(this.chunkIndex==this.layer.chunk.length){this.from=this.to=1e9,this.value=null;break}else{let e=this.layer.chunkPos[this.chunkIndex],t=this.layer.chunk[this.chunkIndex],n=e+t.from[this.rangeIndex];if(this.from=n,this.to=e+t.to[this.rangeIndex],this.value=t.value[this.rangeIndex],this.setRangeIndex(this.rangeIndex+1),this.minPoint<0||this.value.point&&this.to-this.from>=this.minPoint)break}}setRangeIndex(e){if(e==this.layer.chunk[this.chunkIndex].value.length){if(this.chunkIndex++,this.skip)for(;this.chunkIndex<this.layer.chunk.length&&this.skip.has(this.layer.chunk[this.chunkIndex]);)this.chunkIndex++;this.rangeIndex=0}else this.rangeIndex=e}nextChunk(){this.chunkIndex++,this.rangeIndex=0,this.next()}compare(e){return this.from-e.from||this.startSide-e.startSide||this.rank-e.rank||this.to-e.to||this.endSide-e.endSide}},ra=class e{constructor(e){this.heap=e}static from(t,n=null,r=-1){let i=[];for(let e=0;e<t.length;e++)for(let a=t[e];!a.isEmpty;a=a.nextLayer)a.maxPoint>=r&&i.push(new na(a,n,r,e));return i.length==1?i[0]:new e(i)}get startSide(){return this.value?this.value.startSide:0}goto(e,t=-1e9){for(let n of this.heap)n.goto(e,t);for(let e=this.heap.length>>1;e>=0;e--)ia(this.heap,e);return this.next(),this}forward(e,t){for(let n of this.heap)n.forward(e,t);for(let e=this.heap.length>>1;e>=0;e--)ia(this.heap,e);(this.to-e||this.value.endSide-t)<0&&this.next()}next(){if(this.heap.length==0)this.from=this.to=1e9,this.value=null,this.rank=-1;else{let e=this.heap[0];this.from=e.from,this.to=e.to,this.value=e.value,this.rank=e.rank,e.value&&e.next(),ia(this.heap,0)}}};function ia(e,t){for(let n=e[t];;){let r=(t<<1)+1;if(r>=e.length)break;let i=e[r];if(r+1<e.length&&i.compare(e[r+1])>=0&&(i=e[r+1],r++),n.compare(i)<0)break;e[r]=n,e[t]=i,t=r}}var aa=class{constructor(e,t,n){this.minPoint=n,this.active=[],this.activeTo=[],this.activeRank=[],this.minActive=-1,this.point=null,this.pointFrom=0,this.pointRank=0,this.to=-1e9,this.endSide=0,this.openStart=-1,this.cursor=ra.from(e,t,n)}goto(e,t=-1e9){return this.cursor.goto(e,t),this.active.length=this.activeTo.length=this.activeRank.length=0,this.minActive=-1,this.to=e,this.endSide=t,this.openStart=-1,this.next(),this}forward(e,t){for(;this.minActive>-1&&(this.activeTo[this.minActive]-e||this.active[this.minActive].endSide-t)<0;)this.removeActive(this.minActive);this.cursor.forward(e,t)}removeActive(e){ca(this.active,e),ca(this.activeTo,e),ca(this.activeRank,e),this.minActive=ua(this.active,this.activeTo)}addActive(e){let t=0,{value:n,to:r,rank:i}=this.cursor;for(;t<this.activeRank.length&&(i-this.activeRank[t]||r-this.activeTo[t])>0;)t++;la(this.active,t,n),la(this.activeTo,t,r),la(this.activeRank,t,i),e&&la(e,t,this.cursor.from),this.minActive=ua(this.active,this.activeTo)}next(){let e=this.to,t=this.point;this.point=null;let n=this.openStart<0?[]:null;for(;;){let r=this.minActive;if(r>-1&&(this.activeTo[r]-this.cursor.from||this.active[r].endSide-this.cursor.startSide)<0){if(this.activeTo[r]>e){this.to=this.activeTo[r],this.endSide=this.active[r].endSide;break}this.removeActive(r),n&&ca(n,r)}else if(!this.cursor.value){this.to=this.endSide=1e9;break}else if(this.cursor.from>e){this.to=this.cursor.from,this.endSide=this.cursor.startSide;break}else{let e=this.cursor.value;if(!e.point)this.addActive(n),this.cursor.next();else if(t&&this.cursor.to==this.to&&this.cursor.from<this.cursor.to)this.cursor.next();else{this.point=e,this.pointFrom=this.cursor.from,this.pointRank=this.cursor.rank,this.to=this.cursor.to,this.endSide=e.endSide,this.cursor.next(),this.forward(this.to,this.endSide);break}}}if(n){this.openStart=0;for(let t=n.length-1;t>=0&&n[t]<e;t--)this.openStart++}}activeForPoint(e){if(!this.active.length)return this.active;let t=[];for(let n=this.active.length-1;n>=0&&!(this.activeRank[n]<this.pointRank);n--)(this.activeTo[n]>e||this.activeTo[n]==e&&this.active[n].endSide>=this.point.endSide)&&t.push(this.active[n]);return t.reverse()}openEnd(e){let t=0;for(let n=this.activeTo.length-1;n>=0&&this.activeTo[n]>e;n--)t++;return t}};function oa(e,t,n,r,i,a){e.goto(t),n.goto(r);let o=r+i,s=r,c=r-t,l=!!a.boundChange;for(let t=!1;;){let r=e.to+c-n.to,i=r||e.endSide-n.endSide,u=i<0?e.to+c:n.to,d=Math.min(u,o);if(e.point||n.point?(e.point&&n.point&&Ji(e.point,n.point)&&sa(e.activeForPoint(e.to),n.activeForPoint(n.to))||a.comparePoint(s,d,e.point,n.point),t=!1):(t&&=(a.boundChange(s),!1),d>s&&!sa(e.active,n.active)&&a.compareRange(s,d,e.active,n.active),l&&d<o&&(r||e.openEnd(u)!=n.openEnd(u))&&(t=!0)),u>o)break;s=u,i<=0&&e.next(),i>=0&&n.next()}}function sa(e,t){if(e.length!=t.length)return!1;for(let n=0;n<e.length;n++)if(e[n]!=t[n]&&!Ji(e[n],t[n]))return!1;return!0}function ca(e,t){for(let n=t,r=e.length-1;n<r;n++)e[n]=e[n+1];e.pop()}function la(e,t,n){for(let n=e.length-1;n>=t;n--)e[n+1]=e[n];e[t]=n}function ua(e,t){let n=-1,r=1e9;for(let i=0;i<t.length;i++)(t[i]-r||e[i].endSide-e[n].endSide)<0&&(n=i,r=t[i]);return n}function da(e,t,n=e.length){let r=0;for(let i=0;i<n&&i<e.length;)e.charCodeAt(i)==9?(r+=t-r%t,i++):(r++,i=zr(e,i));return r}function fa(e,t,n,r){for(let r=0,i=0;;){if(i>=t)return r;if(r==e.length)break;i+=e.charCodeAt(r)==9?n-i%n:1,r=zr(e,r)}return r===!0?-1:e.length}for(var pa=`ͼ`,ma=typeof Symbol>`u`?`__ͼ`:Symbol.for(pa),ha=typeof Symbol>`u`?`__styleSet`+Math.floor(Math.random()*1e8):Symbol(`styleSet`),ga=typeof globalThis<`u`?globalThis:typeof window<`u`?window:{},_a=class{constructor(e,t){this.rules=[];let{finish:n}=t||{};function r(e){return/^@/.test(e)?[e]:e.split(/,\s*/)}function i(e,t,a,o){let s=[],c=/^@(\w+)\b/.exec(e[0]),l=c&&c[1]==`keyframes`;if(c&&t==null)return a.push(e[0]+`;`);for(let n in t){let o=t[n];if(/&/.test(n))i(n.split(/,\s*/).map(t=>e.map(e=>t.replace(/&/,e))).reduce((e,t)=>e.concat(t)),o,a);else if(o&&typeof o==`object`){if(!c)throw RangeError(`The value of a property (`+n+`) should be a primitive value.`);i(r(n),o,s,l)}else o!=null&&s.push(n.replace(/_.*/,``).replace(/[A-Z]/g,e=>`-`+e.toLowerCase())+`: `+o+`;`)}(s.length||l)&&a.push((n&&!c&&!o?e.map(n):e).join(`, `)+` {`+s.join(` `)+`}`)}for(let t in e)i(r(t),e[t],this.rules)}getRules(){return this.rules.join(`
`)}static newName(){let e=ga[ma]||1;return ga[ma]=e+1,pa+e.toString(36)}static mount(e,t,n){let r=e[ha],i=n&&n.nonce;r?i&&r.setNonce(i):r=new ya(e,i),r.mount(Array.isArray(t)?t:[t],e)}},va=new Map,ya=class{constructor(e,t){let n=e.ownerDocument||e,r=n.defaultView;if(!e.head&&e.adoptedStyleSheets&&r.CSSStyleSheet){let t=va.get(n);if(t)return e[ha]=t;this.sheet=new r.CSSStyleSheet,va.set(n,this)}else this.styleTag=n.createElement(`style`),t&&this.styleTag.setAttribute(`nonce`,t);this.modules=[],e[ha]=this}mount(e,t){let n=this.sheet,r=0,i=0,a=!1;for(let t=0;t<e.length;t++){let o=e[t],s=this.modules.indexOf(o);if(s<i&&s>-1&&(this.modules.splice(s,1),a=!0,i--,s=-1),s==-1){if(this.modules.splice(i++,0,o),a=!0,n)for(let e=0;e<o.rules.length;e++)n.insertRule(o.rules[e],r++)}else{for(;i<s;)r+=this.modules[i++].rules.length;r+=o.rules.length,i++}}if(n)t.adoptedStyleSheets.indexOf(this.sheet)<0&&(t.adoptedStyleSheets=[this.sheet,...t.adoptedStyleSheets]);else{if(a){let e=``;for(let t=0;t<this.modules.length;t++)e+=this.modules[t].getRules()+`
`;this.styleTag.textContent=e}let e=t.head||t;this.styleTag.parentNode!=e&&e.insertBefore(this.styleTag,e.firstChild)}}setNonce(e){this.styleTag&&this.styleTag.getAttribute(`nonce`)!=e&&this.styleTag.setAttribute(`nonce`,e)}},ba={8:`Backspace`,9:`Tab`,10:`Enter`,12:`NumLock`,13:`Enter`,16:`Shift`,17:`Control`,18:`Alt`,20:`CapsLock`,27:`Escape`,32:` `,33:`PageUp`,34:`PageDown`,35:`End`,36:`Home`,37:`ArrowLeft`,38:`ArrowUp`,39:`ArrowRight`,40:`ArrowDown`,44:`PrintScreen`,45:`Insert`,46:`Delete`,59:`;`,61:`=`,91:`Meta`,92:`Meta`,106:`*`,107:`+`,108:`,`,109:`-`,110:`.`,111:`/`,144:`NumLock`,145:`ScrollLock`,160:`Shift`,161:`Shift`,162:`Control`,163:`Control`,164:`Alt`,165:`Alt`,173:`-`,186:`;`,187:`=`,188:`,`,189:`-`,190:`.`,191:`/`,192:"`",219:`[`,220:`\\`,221:`]`,222:`'`},xa={48:`)`,49:`!`,50:`@`,51:`#`,52:`$`,53:`%`,54:`^`,55:`&`,56:`*`,57:`(`,59:`:`,61:`+`,173:`_`,186:`:`,187:`+`,188:`<`,189:`_`,190:`>`,191:`?`,192:`~`,219:`{`,220:`|`,221:`}`,222:`"`},Sa=typeof navigator<`u`&&/Mac/.test(navigator.platform),Ca=typeof navigator<`u`&&/MSIE \d|Trident\/(?:[7-9]|\d{2,})\..*rv:(\d+)/.exec(navigator.userAgent),wa=0;wa<10;wa++)ba[48+wa]=ba[96+wa]=String(wa);for(var wa=1;wa<=24;wa++)ba[wa+111]=`F`+wa;for(var wa=65;wa<=90;wa++)ba[wa]=String.fromCharCode(wa+32),xa[wa]=String.fromCharCode(wa);for(var Ta in ba)xa.hasOwnProperty(Ta)||(xa[Ta]=ba[Ta]);function Ea(e){var t=!(Sa&&e.metaKey&&e.shiftKey&&!e.ctrlKey&&!e.altKey||Ca&&e.shiftKey&&e.key&&e.key.length==1||e.key==`Unidentified`)&&e.key||(e.shiftKey?xa:ba)[e.keyCode]||e.key||`Unidentified`;return t==`Esc`&&(t=`Escape`),t==`Del`&&(t=`Delete`),t==`Left`&&(t=`ArrowLeft`),t==`Up`&&(t=`ArrowUp`),t==`Right`&&(t=`ArrowRight`),t==`Down`&&(t=`ArrowDown`),t}function W(){var e=arguments[0];typeof e==`string`&&(e=document.createElement(e));var t=1,n=arguments[1];if(n&&typeof n==`object`&&n.nodeType==null&&!Array.isArray(n)){for(var r in n)if(Object.prototype.hasOwnProperty.call(n,r)){var i=n[r];typeof i==`string`?e.setAttribute(r,i):i!=null&&(e[r]=i)}t++}for(;t<arguments.length;t++)Da(e,arguments[t]);return e}function Da(e,t){if(typeof t==`string`)e.appendChild(document.createTextNode(t));else if(t!=null){if(t.nodeType!=null)e.appendChild(t);else if(Array.isArray(t))for(var n=0;n<t.length;n++)Da(e,t[n]);else throw RangeError(`Unsupported child node: `+t)}}var Oa=typeof navigator<`u`?navigator:{userAgent:``,vendor:``,platform:``},ka=typeof document<`u`?document:{documentElement:{style:{}}},Aa=/Edge\/(\d+)/.exec(Oa.userAgent),ja=/MSIE \d/.test(Oa.userAgent),Ma=/Trident\/(?:[7-9]|\d{2,})\..*rv:(\d+)/.exec(Oa.userAgent),Na=!!(ja||Ma||Aa),Pa=!Na&&/gecko\/(\d+)/i.test(Oa.userAgent),Fa=!Na&&/Chrome\/(\d+)/.exec(Oa.userAgent),Ia=`webkitFontSmoothing`in ka.documentElement.style,La=!Na&&/Apple Computer/.test(Oa.vendor),Ra=La&&(/Mobile\/\w+/.test(Oa.userAgent)||Oa.maxTouchPoints>2),G={mac:Ra||/Mac/.test(Oa.platform),windows:/Win/.test(Oa.platform),linux:/Linux|X11/.test(Oa.platform),ie:Na,ie_version:ja?ka.documentMode||6:Ma?+Ma[1]:Aa?+Aa[1]:0,gecko:Pa,gecko_version:Pa?+(/Firefox\/(\d+)/.exec(Oa.userAgent)||[0,0])[1]:0,chrome:!!Fa,chrome_version:Fa?+Fa[1]:0,ios:Ra,android:/Android\b/.test(Oa.userAgent),webkit:Ia,webkit_version:Ia?+(/\bAppleWebKit\/(\d+)/.exec(Oa.userAgent)||[0,0])[1]:0,safari:La,safari_version:La?+(/\bVersion\/(\d+(\.\d+)?)/.exec(Oa.userAgent)||[0,0])[1]:0,tabSize:ka.documentElement.style.tabSize==null?`-moz-tab-size`:`tab-size`};function za(e,t){for(let n in e)n==`class`&&t.class?t.class+=` `+e.class:n==`style`&&t.style?t.style+=`;`+e.style:t[n]=e[n];return t}var Ba=Object.create(null);function Va(e,t,n){if(e==t)return!0;e||=Ba,t||=Ba;let r=Object.keys(e),i=Object.keys(t);if(r.length-0!=i.length-0)return!1;for(let a of r)if(a!=n&&(i.indexOf(a)==-1||e[a]!==t[a]))return!1;return!0}function Ha(e,t){for(let n=e.attributes.length-1;n>=0;n--){let r=e.attributes[n].name;t[r]??e.removeAttribute(r)}for(let n in t){let r=t[n];n==`style`?e.style.cssText=r:e.getAttribute(n)!=r&&e.setAttribute(n,r)}}function Ua(e,t,n){let r=!1;if(t)for(let i in t)n&&i in n||(r=!0,i==`style`?e.style.cssText=``:e.removeAttribute(i));if(n)for(let i in n)t&&t[i]==n[i]||(r=!0,i==`style`?e.style.cssText=n[i]:e.setAttribute(i,n[i]));return r}function Wa(e){let t=Object.create(null);for(let n=0;n<e.attributes.length;n++){let r=e.attributes[n];t[r.name]=r.value}return t}var Ga=class{eq(e){return!1}updateDOM(e,t,n){return!1}compare(e){return this==e||this.constructor==e.constructor&&this.eq(e)}get estimatedHeight(){return-1}get lineBreaks(){return 0}ignoreEvent(e){return!0}coordsAt(e,t,n){return null}get isHidden(){return!1}get editable(){return!1}destroy(e){}},Ka=(function(e){return e[e.Text=0]=`Text`,e[e.WidgetBefore=1]=`WidgetBefore`,e[e.WidgetAfter=2]=`WidgetAfter`,e[e.WidgetRange=3]=`WidgetRange`,e})(Ka||={}),K=class extends qi{constructor(e,t,n,r){super(),this.startSide=e,this.endSide=t,this.widget=n,this.spec=r}get heightRelevant(){return!1}static mark(e){return new qa(e)}static widget(e){let t=Math.max(-1e4,Math.min(1e4,e.side||0)),n=!!e.block;return t+=n&&!e.inlineOrder?t>0?3e8:-4e8:t>0?1e8:-1e8,new Ya(e,t,t,n,e.widget||null,!1)}static replace(e){let t=!!e.block,n,r;if(e.isBlockGap)n=-5e8,r=4e8;else{let{start:i,end:a}=Xa(e,t);n=(i?t?-3e8:-1:5e8)-1,r=(a?t?2e8:1:-6e8)+1}return new Ya(e,n,r,t,e.widget||null,!0)}static line(e){return new Ja(e)}static set(e,t=!1){return U.of(e,t)}hasHeight(){return this.widget?this.widget.estimatedHeight>-1:!1}};K.none=U.empty;var qa=class e extends K{constructor(e){let{start:t,end:n}=Xa(e);super(t?-1:5e8,n?1:-6e8,null,e),this.tagName=e.tagName||`span`,this.attrs=e.class&&e.attributes?za(e.attributes,{class:e.class}):e.class?{class:e.class}:e.attributes||Ba}eq(t){return this==t||t instanceof e&&this.tagName==t.tagName&&Va(this.attrs,t.attrs)}range(e,t=e){if(e>=t)throw RangeError(`Mark decorations may not be empty`);return super.range(e,t)}};qa.prototype.point=!1;var Ja=class e extends K{constructor(e){super(-2e8,-2e8,null,e)}eq(t){return t instanceof e&&this.spec.class==t.spec.class&&Va(this.spec.attributes,t.spec.attributes)}range(e,t=e){if(t!=e)throw RangeError(`Line decoration ranges must be zero-length`);return super.range(e,t)}};Ja.prototype.mapMode=Kr.TrackBefore,Ja.prototype.point=!0;var Ya=class e extends K{constructor(e,t,n,r,i,a){super(t,n,i,e),this.block=r,this.isReplace=a,this.mapMode=r?t<=0?Kr.TrackBefore:Kr.TrackAfter:Kr.TrackDel}get type(){return this.startSide==this.endSide?this.startSide<=0?Ka.WidgetBefore:Ka.WidgetAfter:Ka.WidgetRange}get heightRelevant(){return this.block||!!this.widget&&(this.widget.estimatedHeight>=5||this.widget.lineBreaks>0)}eq(t){return t instanceof e&&Za(this.widget,t.widget)&&this.block==t.block&&this.startSide==t.startSide&&this.endSide==t.endSide}range(e,t=e){if(this.isReplace&&(e>t||e==t&&this.startSide>0&&this.endSide<=0))throw RangeError(`Invalid range for replacement decoration`);if(!this.isReplace&&t!=e)throw RangeError(`Widget decorations can only have zero-length ranges`);return super.range(e,t)}};Ya.prototype.point=!0;function Xa(e,t=!1){let{inclusiveStart:n,inclusiveEnd:r}=e;return n??=e.inclusive,r??=e.inclusive,{start:n??t,end:r??t}}function Za(e,t){return e==t||!!(e&&t&&e.compare(t))}function Qa(e,t,n,r=0){let i=n.length-1;i>=0&&n[i]+r>=e?n[i]=Math.max(n[i],t):n.push(e,t)}var $a=class e extends qi{constructor(e,t,n){super(),this.tagName=e,this.attributes=t,this.rank=n}eq(t){return t==this||t instanceof e&&this.tagName==t.tagName&&Va(this.attributes,t.attributes)}static create(t){return new e(t.tagName,t.attributes||Ba,t.rank==null?50:Math.max(0,Math.min(t.rank,100)))}static set(e,t=!1){return U.of(e,t)}};$a.prototype.startSide=$a.prototype.endSide=-1;var eo=e=>e.nodeType==1,to=e=>e.nodeType==3;function no(e){let t;return t=e.nodeType==11?e.getSelection?e:e.ownerDocument:e,t.getSelection()}function ro(e,t){return t?e==t||e.contains(t.nodeType==1?t:t.parentNode):!1}function io(e,t){if(!t.anchorNode)return!1;try{return ro(e,t.anchorNode)}catch{return!1}}function ao(e){return to(e)?Co(e,0,e.nodeValue.length).getClientRects():eo(e)?e.getClientRects():[]}function oo(e,t,n,r){return n?lo(e,t,n,r,-1)||lo(e,t,n,r,1):!1}function so(e){for(var t=0;;t++)if(e=e.previousSibling,!e)return t}function co(e){return eo(e)&&/^(DIV|P|LI|UL|OL|BLOCKQUOTE|DD|DT|H\d|SECTION|PRE)$/.test(e.nodeName)}function lo(e,t,n,r,i){for(;;){if(e==n&&t==r)return!0;if(t==(i<0?0:uo(e))){if(e.nodeName==`DIV`)return!1;let n=e.parentNode;if(!n||!eo(n))return!1;t=so(e)+(i<0?0:1),e=n}else if(eo(e)){if(e=e.childNodes[t+(i<0?-1:0)],eo(e)&&(e.nodeName==`IMG`||e.nodeName==`BR`||e.contentEditable==`false`))return!1;t=i<0?uo(e):0}else return!1}}function uo(e){return to(e)?e.nodeValue.length:e.childNodes.length}function fo(e,t){let{left:n,right:r}=e;if(n==r)return e;let i=t?n:r;return{left:i,right:i,top:e.top,bottom:e.bottom}}function po(e){let t=e.visualViewport;return t?{left:0,right:t.width,top:0,bottom:t.height}:{left:0,right:e.innerWidth,top:0,bottom:e.innerHeight}}function mo(e,t){let n=t.width/e.offsetWidth,r=t.height/e.offsetHeight;return(n>.995&&n<1.005||!isFinite(n)||Math.abs(t.width-e.offsetWidth)<1)&&(n=1),(r>.995&&r<1.005||!isFinite(r)||Math.abs(t.height-e.offsetHeight)<1)&&(r=1),{scaleX:n,scaleY:r}}function ho(e,t,n,r,i,a,o,s){let c=e.ownerDocument,l=c.defaultView||window;for(let u=e,d=!1;u&&!d;)if(eo(u)){let e,f=u==c.body,p=1,m=1,h=!0,g=!0;if(f)e=po(l);else{let t=getComputedStyle(u);if(/^(fixed|sticky)$/.test(t.position)&&(d=!0),(u.scrollHeight<=u.clientHeight||!/auto|scroll/.test(t.overflowY))&&(g=!1),(u.scrollWidth<=u.clientWidth||!/auto|scroll/.test(t.overflowX))&&(h=!1),!h&&!g){u=u.assignedSlot||u.parentNode;continue}let n=u.getBoundingClientRect();({scaleX:p,scaleY:m}=mo(u,n)),e={left:n.left,right:n.left+u.clientWidth*p,top:n.top,bottom:n.top+u.clientHeight*m}}let _=0,v=0;if(g){if(i==`nearest`)t.top<e.top+o?(v=t.top-(e.top+o),n>0&&t.bottom>e.bottom+v&&(v=t.bottom-e.bottom+o)):t.bottom>e.bottom-o&&(v=t.bottom-e.bottom+o,n<0&&t.top-v<e.top&&(v=t.top-(e.top+o)));else{let r=t.bottom-t.top,a=e.bottom-e.top;v=(i==`center`&&r<=a?t.top+r/2-a/2:i==`start`||i==`center`&&n<0?t.top-o:t.bottom-a+o)-e.top}}if(h&&(r==`nearest`?t.left<e.left+a?(_=t.left-(e.left+a),n>0&&t.right>e.right+_&&(_=t.right-e.right+a)):t.right>e.right-a&&(_=t.right-e.right+a,n<0&&t.left<e.left+_&&(_=t.left-(e.left+a))):_=(r==`center`?t.left+(t.right-t.left)/2-(e.right-e.left)/2:r==`start`==s?t.left-a:t.right-(e.right-e.left)+a)-e.left),_||v){if(f)l.scrollBy(_,v);else{let e=0,n=0;if(v){let e=u.scrollTop;u.scrollTop+=v/m,n=(u.scrollTop-e)*m}if(_){let t=u.scrollLeft;u.scrollLeft+=_/p,e=(u.scrollLeft-t)*p}t={left:t.left-e,top:t.top-n,right:t.right-e,bottom:t.bottom-n},e&&Math.abs(e-_)<1&&(r=`nearest`),n&&Math.abs(n-v)<1&&(i=`nearest`)}}if(f)break;(t.top<e.top||t.bottom>e.bottom||t.left<e.left||t.right>e.right)&&(t={left:Math.max(t.left,e.left),right:Math.min(t.right,e.right),top:Math.max(t.top,e.top),bottom:Math.min(t.bottom,e.bottom)}),u=u.assignedSlot||u.parentNode}else if(u.nodeType==11)u=u.host;else break}function go(e,t=!0){let n=e.ownerDocument,r=null,i=null;for(let a=e.parentNode;a&&!(a==n.body||(!t||r)&&i);)if(eo(a))!i&&a.scrollHeight>a.clientHeight&&/scroll|auto/.test(getComputedStyle(a).overflowY)&&(i=a),t&&!r&&a.scrollWidth>a.clientWidth&&/scroll|auto/.test(getComputedStyle(a).overflowX)&&(r=a),a=a.assignedSlot||a.parentNode;else if(a.nodeType==11)a=a.host;else break;return{x:r,y:i}}var _o=class{constructor(){this.anchorNode=null,this.anchorOffset=0,this.focusNode=null,this.focusOffset=0}eq(e){return this.anchorNode==e.anchorNode&&this.anchorOffset==e.anchorOffset&&this.focusNode==e.focusNode&&this.focusOffset==e.focusOffset}setRange(e){let{anchorNode:t,focusNode:n}=e;this.set(t,Math.min(e.anchorOffset,t?uo(t):0),n,Math.min(e.focusOffset,n?uo(n):0))}set(e,t,n,r){this.anchorNode=e,this.anchorOffset=t,this.focusNode=n,this.focusOffset=r}};function vo(e){let t=[];for(let n=e;n;n=n.nodeType==11?n.host:n.parentNode)eo(n)&&t.push({node:n,left:n.scrollLeft,top:n.scrollTop});return t}function yo(e,t=!0){for(let{node:n,left:r,top:i}of e)t&&n.scrollTop!=i&&(n.scrollTop=i),n.scrollLeft!=r&&(n.scrollLeft=r)}var bo=null;G.safari&&G.safari_version>=26&&(bo=!1);function xo(e){if(e.setActive)return e.setActive();if(bo)return e.focus(bo);let t=vo(e);e.focus(bo==null?{get preventScroll(){return bo={preventScroll:!0},!0}}:void 0),bo||(bo=!1,yo(t))}var So;function Co(e,t,n=t){let r=So||=document.createRange();return r.setEnd(e,n),r.setStart(e,t),r}function wo(e,t,n,r){let i={key:t,code:t,keyCode:n,which:n,cancelable:!0};r&&({altKey:i.altKey,ctrlKey:i.ctrlKey,shiftKey:i.shiftKey,metaKey:i.metaKey}=r);let a=new KeyboardEvent(`keydown`,i);a.synthetic=!0,e.dispatchEvent(a);let o=new KeyboardEvent(`keyup`,i);return o.synthetic=!0,e.dispatchEvent(o),a.defaultPrevented||o.defaultPrevented}function To(e){for(;e;){if(e&&(e.nodeType==9||e.nodeType==11&&e.host))return e;e=e.assignedSlot||e.parentNode}return null}function Eo(e,t){let n=t.focusNode,r=t.focusOffset;if(!n||t.anchorNode!=n||t.anchorOffset!=r)return!1;for(r=Math.min(r,uo(n));;)if(r){if(!eo(n))return!1;let e=n.childNodes[r-1];e.contentEditable==`false`?r--:(n=e,r=uo(n))}else if(n==e)return!0;else r=so(n),n=n.parentNode}function Do(e){return e instanceof Window?e.pageYOffset>Math.max(0,e.document.documentElement.scrollHeight-e.innerHeight-4):e.scrollTop>Math.max(1,e.scrollHeight-e.clientHeight-4)}function Oo(e,t){for(let n=e,r=t;;)if(to(n)&&r>0)return{node:n,offset:r};else if(eo(n)&&r>0){if(n.contentEditable==`false`)return null;n=n.childNodes[r-1],r=uo(n)}else if(n.parentNode&&!co(n))r=so(n),n=n.parentNode;else return null}function ko(e,t){for(let n=e,r=t;;)if(to(n)&&r<n.nodeValue.length)return{node:n,offset:r};else if(eo(n)&&r<n.childNodes.length){if(n.contentEditable==`false`)return null;n=n.childNodes[r],r=0}else if(n.parentNode&&!co(n))r=so(n)+1,n=n.parentNode;else return null}var Ao=class e{constructor(e,t,n=!0){this.node=e,this.offset=t,this.precise=n}static before(t,n){return new e(t.parentNode,so(t),n)}static after(t,n){return new e(t.parentNode,so(t)+1,n)}},q=(function(e){return e[e.LTR=0]=`LTR`,e[e.RTL=1]=`RTL`,e})(q||={}),jo=q.LTR,Mo=q.RTL;function No(e){let t=[];for(let n=0;n<e.length;n++)t.push(1<<e[n]);return t}var Po=No(`88888888888888888888888888888888888666888888787833333333337888888000000000000000000000000008888880000000000000000000000000088888888888888888888888888888888888887866668888088888663380888308888800000000000000000000000800000000000000000000000000000008`),Fo=No(`4444448826627288999999999992222222222222222222222222222222222222222222222229999999999999999999994444444444644222822222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222999999949999999229989999223333333333`),Io=Object.create(null),Lo=[];for(let e of[`()`,`[]`,`{}`]){let t=e.charCodeAt(0),n=e.charCodeAt(1);Io[t]=n,Io[n]=-t}function Ro(e){return e<=247?Po[e]:1424<=e&&e<=1524?2:1536<=e&&e<=1785?Fo[e-1536]:1774<=e&&e<=2220?4:8192<=e&&e<=8204?256:64336<=e&&e<=65023?4:1}var zo=/[\u0590-\u05f4\u0600-\u06ff\u0700-\u08ac\ufb50-\ufdff]/,Bo=class{get dir(){return this.level%2?Mo:jo}constructor(e,t,n){this.from=e,this.to=t,this.level=n}side(e,t){return this.dir==t==e?this.to:this.from}forward(e,t){return e==(this.dir==t)}static find(e,t,n,r){let i=-1;for(let a=0;a<e.length;a++){let o=e[a];if(o.from<=t&&o.to>=t){if(o.level==n)return a;(i<0||(r==0?e[i].level>o.level:r<0?o.from<t:o.to>t))&&(i=a)}}if(i<0)throw RangeError(`Index out of range`);return i}};function Vo(e,t){if(e.length!=t.length)return!1;for(let n=0;n<e.length;n++){let r=e[n],i=t[n];if(r.from!=i.from||r.to!=i.to||r.direction!=i.direction||!Vo(r.inner,i.inner))return!1}return!0}var J=[];function Ho(e,t,n,r,i){for(let a=0;a<=r.length;a++){let o=a?r[a-1].to:t,s=a<r.length?r[a].from:n,c=a?256:i;for(let t=o,n=c,r=c;t<s;t++){let i=Ro(e.charCodeAt(t));i==512?i=n:i==8&&r==4&&(i=16),J[t]=i==4?2:i,i&7&&(r=i),n=i}for(let e=o,t=c,r=c;e<s;e++){let i=J[e];if(i==128)e<s-1&&t==J[e+1]&&t&24?i=J[e]=t:J[e]=256;else if(i==64){let i=e+1;for(;i<s&&J[i]==64;)i++;let a=e&&t==8||i<n&&J[i]==8?r==1?1:8:256;for(let t=e;t<i;t++)J[t]=a;e=i-1}else i==8&&r==1&&(J[e]=1);t=i,i&7&&(r=i)}}}function Uo(e,t,n,r,i){let a=i==1?2:1;for(let o=0,s=0,c=0;o<=r.length;o++){let l=o?r[o-1].to:t,u=o<r.length?r[o].from:n;for(let t=l,n,r,o;t<u;t++)if(r=Io[n=e.charCodeAt(t)]){if(r<0){for(let e=s-3;e>=0;e-=3)if(Lo[e+1]==-r){let n=Lo[e+2],r=n&2?i:n&4?n&1?a:i:0;r&&(J[t]=J[Lo[e]]=r),s=e;break}}else if(Lo.length==189)break;else Lo[s++]=t,Lo[s++]=n,Lo[s++]=c}else if((o=J[t])==2||o==1){let e=o==i;c=+!e;for(let t=s-3;t>=0;t-=3){let n=Lo[t+2];if(n&2)break;if(e)Lo[t+2]|=2;else{if(n&4)break;Lo[t+2]|=4}}}}}function Wo(e,t,n,r){for(let i=0,a=r;i<=n.length;i++){let o=i?n[i-1].to:e,s=i<n.length?n[i].from:t;for(let c=o;c<s;){let o=J[c];if(o==256){let o=c+1;for(;;)if(o==s){if(i==n.length)break;o=n[i++].to,s=i<n.length?n[i].from:t}else if(J[o]==256)o++;else break;let l=a==1,u=l==((o<t?J[o]:r)==1)?l?1:2:r;for(let t=o,r=i,a=r?n[r-1].to:e;t>c;)t==a&&(t=n[--r].from,a=r?n[r-1].to:e),J[--t]=u;c=o}else a=o,c++}}}function Go(e,t,n,r,i,a,o){let s=r%2?2:1;if(r%2==i%2)for(let c=t,l=0;c<n;){let t=!0,u=!1;if(l==a.length||c<a[l].from){let e=J[c];e!=s&&(t=!1,u=e==16)}let d=!t&&s==1?[]:null,f=t?r:r+1,p=c;run:for(;;)if(l<a.length&&p==a[l].from){if(u)break run;let m=a[l];if(!t)for(let e=m.to,t=l+1;;){if(e==n)break run;if(t<a.length&&a[t].from==e)e=a[t++].to;else if(J[e]==s)break run;else break}l++,d?d.push(m):(m.from>c&&o.push(new Bo(c,m.from,f)),Ko(e,m.direction==jo==!(f%2)?r:r+1,i,m.inner,m.from,m.to,o),c=m.to),p=m.to}else if(p==n||(t?J[p]!=s:J[p]==s))break;else p++;d?Go(e,c,p,r+1,i,d,o):c<p&&o.push(new Bo(c,p,f)),c=p}else for(let c=n,l=a.length;c>t;){let n=!0,u=!1;if(!l||c>a[l-1].to){let e=J[c-1];e!=s&&(n=!1,u=e==16)}let d=!n&&s==1?[]:null,f=n?r:r+1,p=c;run:for(;;)if(l&&p==a[l-1].to){if(u)break run;let m=a[--l];if(!n)for(let e=m.from,n=l;;){if(e==t)break run;if(n&&a[n-1].to==e)e=a[--n].from;else if(J[e-1]==s)break run;else break}d?d.push(m):(m.to<c&&o.push(new Bo(m.to,c,f)),Ko(e,m.direction==jo==!(f%2)?r:r+1,i,m.inner,m.from,m.to,o),c=m.from),p=m.from}else if(p==t||(n?J[p-1]!=s:J[p-1]==s))break;else p--;d?Go(e,p,c,r+1,i,d,o):p<c&&o.push(new Bo(p,c,f)),c=p}}function Ko(e,t,n,r,i,a,o){let s=t%2?2:1;Ho(e,i,a,r,s),Uo(e,i,a,r,s),Wo(i,a,r,s),Go(e,i,a,t,n,r,o)}function qo(e,t,n){if(!e)return[new Bo(0,0,+(t==Mo))];if(t==jo&&!n.length&&!zo.test(e))return Jo(e.length);if(n.length)for(;e.length>J.length;)J[J.length]=256;let r=[],i=t==jo?0:1;return Ko(e,i,i,n,0,e.length,r),r}function Jo(e){return[new Bo(0,e,0)]}var Yo=``;function Xo(e,t,n,r,i){if(!e.length)return null;let a=r.head-e.from,o;if(r.head==e.from&&r.assoc<0){if(!i)return null;a=t[o=0].side(!1,n)}else if(r.head==e.to&&r.assoc>0){if(i)return null;a=t[o=t.length-1].side(!0,n)}else o=Bo.find(t,a,r.bidiLevel??-1,r.assoc);let s=t[o],c=s.side(i,n);if(a==c){let e=o+=i?1:-1;if(e<0||e>=t.length)return null;s=t[o=e],a=s.side(!i,n),c=s.side(i,n)}let l=zr(e.text,a,s.forward(i,n));(l<s.from||l>s.to)&&(l=c),Yo=e.text.slice(Math.min(a,l),Math.max(a,l));let u=o==(i?t.length-1:0)?null:t[o+(i?1:-1)];if(l==c){if(!u)return i?B.cursor(e.to,1):B.cursor(e.from,-1);if(u.level+ +!i<s.level)return B.cursor(u.side(!i,n)+e.from,u.forward(i,n)?1:-1,u.level)}return B.cursor(l+e.from,s.forward(i,n)?-1:1,s.level)}function Zo(e,t,n){for(let r=t;r<n;r++){let t=Ro(e.charCodeAt(r));if(t==1)return jo;if(t==2||t==4)return Mo}}var Qo=V.define(),$o=V.define(),es=V.define(),ts=V.define(),ns=V.define(),rs=V.define(),is=V.define(),as=V.define(),os=V.define(),ss=V.define({combine:e=>e.some(e=>e)}),cs=V.define({combine:e=>e.some(e=>e)}),ls=V.define(),us=class e{constructor(e,t,n,r,i,a=!1){this.range=e,this.y=t,this.x=n,this.yMargin=r,this.xMargin=i,this.isSnapshot=a}map(t){return t.empty?this:new e(this.range.map(t),this.y,this.x,this.yMargin,this.xMargin,this.isSnapshot)}clip(t){return this.range.to<=t.doc.length?this:new e(B.cursor(t.doc.length),this.y,this.x,this.yMargin,this.xMargin,this.isSnapshot)}},ds=H.define({map:(e,t)=>e.map(t)}),fs=H.define();function ps(e,t,n){let r=e.facet(ts);r.length?r[0](t):window.onerror&&window.onerror(String(t),n,void 0,void 0,t)||(n?console.error(n+`:`,t):console.error(t))}var ms=V.define({combine:e=>!e.length||e[0]}),hs=0,gs=V.define({combine(e){return e.filter((t,n)=>{for(let r=0;r<n;r++)if(e[r].plugin==t.plugin)return!1;return!0})}}),_s=class e{constructor(e,t,n,r,i){this.id=e,this.create=t,this.domEventHandlers=n,this.domEventObservers=r,this.baseExtensions=i(this),this.extension=this.baseExtensions.concat(gs.of({plugin:this,arg:void 0}))}of(e){return this.baseExtensions.concat(gs.of({plugin:this,arg:e}))}static define(t,n){let{eventHandlers:r,eventObservers:i,provide:a,decorations:o}=n||{};return new e(hs++,t,r,i,e=>{let t=[];return o&&t.push(xs.of(t=>{let n=t.plugin(e);return n?o(n):K.none})),a&&t.push(a(e)),t})}static fromClass(t,n){return e.define((e,n)=>new t(e,n),n)}},vs=class{constructor(e){this.spec=e,this.mustUpdate=null,this.value=null}get plugin(){return this.spec&&this.spec.plugin}update(e){if(!this.value){if(this.spec)try{this.value=this.spec.plugin.create(e,this.spec.arg)}catch(t){ps(e.state,t,`CodeMirror plugin crashed`),this.deactivate()}}else if(this.mustUpdate){let e=this.mustUpdate;if(this.mustUpdate=null,this.value.update)try{this.value.update(e)}catch(t){if(ps(e.state,t,`CodeMirror plugin crashed`),this.value.destroy)try{this.value.destroy()}catch{}this.deactivate()}}return this}destroy(e){if(this.value?.destroy)try{this.value.destroy()}catch(t){ps(e.state,t,`CodeMirror plugin crashed`)}}deactivate(){this.spec=this.value=null}},ys=V.define(),bs=V.define(),xs=V.define(),Ss=V.define(),Cs=V.define(),ws=V.define(),Ts=V.define();function Es(e,t){let n=e.state.facet(Ts);if(!n.length)return n;let r=n.map(t=>t instanceof Function?t(e):t),i=[];return U.spans(r,t.from,t.to,{point(){},span(e,n,r,a){let o=e-t.from,s=n-t.from,c=i;for(let e=r.length-1;e>=0;e--,a--){let t=r[e].spec.bidiIsolate,n;if(a>0&&c.length&&(n=c[c.length-1]).to==o&&n.direction==t)n.to=s,c=n.inner;else{let e={from:o,to:s,direction:t,inner:[]};c.push(e),c=e.inner}}}}),Ds(t.text,i)}function Ds(e,t){for(let n of t){if(n.direction==null){for(let t=n.from,r=0;t<n.to;r++){let i=r<n.inner.length?n.inner[r]:null,a=Zo(e,t,i?i.from:n.to);if(a){n.direction=a;break}if(!i)break;t=i.to}n.direction??=q.LTR}Ds(e,n.inner)}return t}var Os=V.define();function ks(e){let t=0,n=0,r=0,i=0;for(let a of e.state.facet(Os)){let o=a(e);o&&(o.left!=null&&(t=Math.max(t,o.left)),o.right!=null&&(n=Math.max(n,o.right)),o.top!=null&&(r=Math.max(r,o.top)),o.bottom!=null&&(i=Math.max(i,o.bottom)))}return{left:t,right:n,top:r,bottom:i}}var As=V.define(),js=class e{constructor(e,t,n,r){this.fromA=e,this.toA=t,this.fromB=n,this.toB=r}join(t){return new e(Math.min(this.fromA,t.fromA),Math.max(this.toA,t.toA),Math.min(this.fromB,t.fromB),Math.max(this.toB,t.toB))}addToSet(e){let t=e.length,n=this;for(;t>0;t--){let r=e[t-1];if(!(r.fromA>n.toA)){if(r.toA<n.fromA)break;n=n.join(r),e.splice(t-1,1)}}return e.splice(t,0,n),e}static extendWithRanges(t,n){if(n.length==0)return t;let r=[];for(let i=0,a=0,o=0;;){let s=i<t.length?t[i].fromB:1e9,c=a<n.length?n[a]:1e9,l=Math.min(s,c);if(l==1e9)break;let u=l+o,d=l,f=u;for(;;)if(a<n.length&&n[a]<=d){let e=n[a+1];a+=2,d=Math.max(d,e);for(let e=i;e<t.length&&t[e].fromB<=d;e++)o=t[e].toA-t[e].toB;f=Math.max(f,e+o)}else if(i<t.length&&t[i].fromB<=d){let e=t[i++];d=Math.max(d,e.toB),f=Math.max(f,e.toA),o=e.toA-e.toB}else break;r.push(new e(u,f,l,d))}return r}},Ms=class e{constructor(e,t,n){this.view=e,this.state=t,this.transactions=n,this.flags=0,this.startState=e.state,this.changes=Jr.empty(this.startState.doc.length);for(let e of n)this.changes=this.changes.compose(e.changes);let r=[];this.changes.iterChangedRanges((e,t,n,i)=>r.push(new js(e,t,n,i))),this.changedRanges=r}static create(t,n,r){return new e(t,n,r)}get viewportChanged(){return(this.flags&4)>0}get viewportMoved(){return(this.flags&8)>0}get heightChanged(){return(this.flags&2)>0}get geometryChanged(){return this.docChanged||(this.flags&18)>0}get focusChanged(){return(this.flags&1)>0}get docChanged(){return!this.changes.empty}get selectionSet(){return this.transactions.some(e=>e.selection)}get empty(){return this.flags==0&&this.transactions.length==0}},Ns=[],Ps=class{constructor(e,t,n=0){this.dom=e,this.length=t,this.flags=n,this.parent=null,e.cmTile=this}get breakAfter(){return this.flags&1}get children(){return Ns}isWidget(){return!1}get isHidden(){return!1}isComposite(){return!1}isLine(){return!1}isText(){return!1}isBlock(){return!1}get domAttrs(){return null}sync(e){if(this.flags|=2,this.flags&4){this.flags&=-5;let e=this.domAttrs;e&&Ha(this.dom,e)}}toString(){return this.constructor.name+(this.children.length?`(${this.children})`:``)+(this.breakAfter?`#`:``)}destroy(){this.parent=null}setDOM(e){this.dom=e,e.cmTile=this}get posAtStart(){return this.parent?this.parent.posBefore(this):0}get posAtEnd(){return this.posAtStart+this.length}posBefore(e,t=this.posAtStart){let n=t;for(let t of this.children){if(t==e)return n;n+=t.length+t.breakAfter}throw RangeError(`Invalid child in posBefore`)}posAfter(e){return this.posBefore(e)+e.length}covers(e){return!0}coordsIn(e,t,n){return null}domPosFor(e,t){let n=so(this.dom),r=this.length?e>0:t>0;return new Ao(this.parent.dom,n+ +!!r,e==0||e==this.length)}markDirty(e){this.flags&=-3,e&&(this.flags|=4),this.parent&&this.parent.flags&2&&this.parent.markDirty(!1)}get overrideDOMText(){return null}get root(){for(let e=this;e;e=e.parent)if(e instanceof Ls)return e;return null}static get(e){return e.cmTile}},Fs=class extends Ps{constructor(e){super(e,0),this._children=[]}isComposite(){return!0}get children(){return this._children}get lastChild(){return this.children.length?this.children[this.children.length-1]:null}append(e){this.children.push(e),e.parent=this}sync(e){if(this.flags&2)return;super.sync(e);let t=this.dom,n=null,r,i=e?.node==t?e:null,a=0;for(let o of this.children){if(o.sync(e),a+=o.length+o.breakAfter,r=n?n.nextSibling:t.firstChild,i&&r!=o.dom&&(i.written=!0),o.dom.parentNode==t)for(;r&&r!=o.dom;)r=Is(r);else t.insertBefore(o.dom,r);n=o.dom}for(r=n?n.nextSibling:t.firstChild,i&&r&&(i.written=!0);r;)r=Is(r);this.length=a}};function Is(e){let t=e.nextSibling;return e.parentNode.removeChild(e),t}var Ls=class extends Fs{constructor(e,t){super(t),this.view=e}owns(e){for(;e;e=e.parent)if(e==this)return!0;return!1}isBlock(){return!0}nearest(e){for(;;){if(!e)return null;let t=Ps.get(e);if(t&&this.owns(t))return t;e=e.parentNode}}blockTiles(e){for(let t=[],n=this,r=0,i=0;;)if(r==n.children.length){if(!t.length)return;n=n.parent,n.breakAfter&&i++,r=t.pop()}else{let a=n.children[r++];if(a instanceof Rs)t.push(r),n=a,r=0;else{let t=i+a.length,n=e(a,i);if(n!==void 0)return n;i=t+a.breakAfter}}}resolveBlock(e,t){let n,r=-1,i,a=-1;if(this.blockTiles((o,s)=>{let c=s+o.length;if(e>=s&&e<=c){if(o.isWidget()&&t>=-1&&t<=1){if(o.flags&32)return!0;o.flags&16&&(n=void 0)}(s<e||e==c&&(t<-1?o.length:o.covers(1)))&&(!n||!o.isWidget()&&n.isWidget())&&(n=o,r=e-s),(c>e||e==s&&(t>1?o.length:o.covers(-1)))&&(!i||!o.isWidget()&&i.isWidget())&&(i=o,a=e-s)}}),!n&&!i)throw Error(`No tile at position `+e);return n&&t<0||!i?{tile:n,offset:r}:{tile:i,offset:a}}},Rs=class e extends Fs{constructor(e,t){super(e),this.wrapper=t}isBlock(){return!0}covers(e){return this.children.length?e<0?this.children[0].covers(-1):this.lastChild.covers(1):!1}get domAttrs(){return this.wrapper.attributes}static of(t,n){let r=new e(n||document.createElement(t.tagName),t);return n||(r.flags|=4),r}},zs=class e extends Fs{constructor(e,t){super(e),this.attrs=t}isLine(){return!0}static start(t,n,r){let i=new e(n||document.createElement(`div`),t);return n&&r||(i.flags|=4),i}get domAttrs(){return this.attrs}resolveInline(e,t,n=!1){let r=null,i=-1,a=null,o=-1;function s(e,c){for(let l=0,u=0;l<e.children.length&&u<=c;l++){let d=e.children[l],f=u+d.length;f>=c&&(d.isComposite()?s(d,c-u):(!a||n&&a.isHidden&&(t>0&&!(a.flags&32)||n&&Vs(a,d)))&&(f>c||d.flags&32&&t<=1)?(a=d,o=c-u):(u<c||d.flags&16&&!(n&&d.isHidden)&&t>=-1)&&(r=d,i=c-u)),u=f}}s(this,e);let c=(t<0?r:a)||r||a;return c?{tile:c,offset:c==r?i:o}:null}coordsIn(e,t,n){let r=this.resolveInline(e,t,!0);return r?r.tile.coordsIn(Math.max(0,r.offset),t,n):Bs(this)}domIn(e,t){let n=this.resolveInline(e,t);if(n){let{tile:e,offset:r}=n;if(this.dom.contains(e.dom))return e.isText()?new Ao(e.dom,Math.min(e.dom.nodeValue.length,r)):e.domPosFor(r,e.flags&16?1:e.flags&32?-1:t);let i=n.tile.parent,a=!1;for(let e of i.children){if(a)return new Ao(e.dom,0);e==n.tile&&(a=!0)}}return new Ao(this.dom,0)}};function Bs(e){let t=e.dom.lastChild;if(!t)return e.dom.getBoundingClientRect();let n=ao(t);return n[n.length-1]||null}function Vs(e,t){let n=e.coordsIn(0,1),r=t.coordsIn(0,1);return n&&r&&r.top<n.bottom}var Hs=class e extends Fs{constructor(e,t){super(e),this.mark=t}get domAttrs(){return this.mark.attrs}static of(t,n){let r=new e(n||document.createElement(t.tagName),t);return n||(r.flags|=4),r}},Us=class e extends Ps{constructor(e,t){super(e,t.length),this.text=t}sync(e){this.flags&2||(super.sync(e),this.dom.nodeValue!=this.text&&(e&&e.node==this.dom&&(e.written=!0),this.dom.nodeValue=this.text))}isText(){return!0}toString(){return JSON.stringify(this.text)}coordsIn(e,t,n){let r=this.dom.nodeValue.length;e>r&&(e=r);let i=e,a=e,o=0;e==0&&t<0||e==r&&t>=0?G.chrome||G.gecko||(e?(i--,o=1):a<r&&(a++,o=-1)):t<0?i--:a<r&&a++;let s=Co(this.dom,i,a).getClientRects();if(!s.length)return null;let c=s[(o?o<0:t>=0)?0:s.length-1];return G.safari&&!o&&c.width==0&&(c=Array.prototype.find.call(s,e=>e.width)||c),n==null?c:fo(c,(o?o>0:t<0)==n)}static of(t,n){let r=new e(n||document.createTextNode(t),t);return n||(r.flags|=2),r}},Ws=class e extends Ps{constructor(e,t,n,r){super(e,t,r),this.widget=n}isWidget(){return!0}get isHidden(){return this.widget.isHidden}covers(e){return this.flags&48?!1:(this.flags&(e<0?64:128))>0}coordsIn(e,t){return this.coordsInWidget(e,t,!1)}coordsInWidget(e,t,n){let r=this.widget.coordsAt(this.dom,e,t);if(r)return r;if(n)return fo(this.dom.getBoundingClientRect(),this.length?e==0:t<=0);{let t=this.dom.getClientRects(),n=null;if(!t.length)return null;let r=this.flags&16?!0:this.flags&32?!1:e>0;for(let i=r?t.length-1:0;n=t[i],!(e>0?i==0:i==t.length-1||n.top<n.bottom);i+=r?-1:1);return fo(n,!r)}}get overrideDOMText(){if(!this.length)return z.empty;let{root:e}=this;if(!e)return z.empty;let t=this.posAtStart;return e.view.state.doc.slice(t,t+this.length)}destroy(){super.destroy(),this.widget.destroy(this.dom)}static of(t,n,r,i,a){return a||(a=t.toDOM(n),t.editable||(a.contentEditable=`false`)),new e(a,r,t,i)}},Gs=class extends Ps{constructor(e){let t=document.createElement(`img`);t.className=`cm-widgetBuffer`,t.setAttribute(`aria-hidden`,`true`),super(t,0,e)}get isHidden(){return!0}get overrideDOMText(){return z.empty}coordsIn(e,t,n){let r=this.dom.getBoundingClientRect();return n==null?r:fo(r,t>0==n)}},Ks=class{constructor(e){this.index=0,this.beforeBreak=!1,this.parents=[],this.tile=e}advance(e,t,n){let{tile:r,index:i,beforeBreak:a,parents:o}=this;for(;e||t>0;)if(!r.isComposite()){let t=r.length;if(i<t&&e){let a=Math.min(e,t-i);n&&n.skip(r,i,i+a),e-=a,i+=a}if(i==t)a=!!r.breakAfter,{tile:r,index:i}=o.pop(),i++;else if(!e)break}else if(a){if(!e)break;n&&n.break(),e--,a=!1}else if(i==r.children.length){if(!e&&!o.length)break;n&&n.leave(r),a=!!r.breakAfter,{tile:r,index:i}=o.pop(),i++}else{let s=r.children[i],c=s.breakAfter;(t>0?s.length<=e:s.length<e)&&(!n||n.skip(s,0,s.length)!==!1||!s.isComposite)?(a=!!c,i++,e-=s.length):(o.push({tile:r,index:i}),r=s,i=0,n&&s.isComposite()&&n.enter(s))}return this.tile=r,this.index=i,this.beforeBreak=a,this}get root(){return this.parents.length?this.parents[0].tile:this.tile}},qs=class{constructor(e,t,n,r){this.from=e,this.to=t,this.wrapper=n,this.rank=r}},Js=class{constructor(e,t,n){this.cache=e,this.root=t,this.blockWrappers=n,this.curLine=null,this.lastBlock=null,this.afterWidget=null,this.pos=0,this.wrappers=[],this.wrapperPos=0}addText(e,t,n,r){this.flushBuffer();let i=this.ensureMarks(t,n),a=i.lastChild;if(a&&a.isText()&&!(a.flags&8)&&a.length+e.length<512){this.cache.reused.set(a,2);let t=i.children[i.children.length-1]=new Us(a.dom,a.text+e);t.parent=i}else i.append(r||Us.of(e,this.cache.find(Us)?.dom));this.pos+=e.length,this.afterWidget=null}addComposition(e,t){let n=this.curLine;n.dom!=t.line.dom&&(n.setDOM(this.cache.reused.has(t.line)?ic(t.line.dom):t.line.dom),this.cache.reused.set(t.line,2));let r=n;for(let e=t.marks.length-1;e>=0;e--){let n=t.marks[e],i=r.lastChild;if(i instanceof Hs&&i.mark.eq(n.mark))i.dom!=n.dom&&i.setDOM(ic(n.dom)),r=i;else{let{dom:e}=n;this.cache.reused.get(n)&&Ps.get(n.dom)&&(e=ic(n.dom));let t=Hs.of(n.mark,e);r.append(t),r=t}this.cache.reused.set(n,2)}let i=Ps.get(e.text);i&&this.cache.reused.set(i,2);let a=new Us(e.text,e.text.nodeValue);a.flags|=8,this.pos=e.range.toB,r.append(a)}addInlineWidget(e,t,n){let r=this.afterWidget&&e.flags&48&&(this.afterWidget.flags&48)==(e.flags&48);r||this.flushBuffer();let i=this.ensureMarks(t,n);!r&&!(e.flags&16)&&i.append(this.getBuffer(1)),i.append(e),this.pos+=e.length,this.afterWidget=e}addMark(e,t,n){this.flushBuffer(),this.ensureMarks(t,n).append(e),this.pos+=e.length,this.afterWidget=null}addBlockWidget(e){this.getBlockPos().append(e),this.pos+=e.length,this.lastBlock=e,this.endLine()}continueWidget(e){let t=this.afterWidget||this.lastBlock;t.length+=e,this.pos+=e}addLineStart(e,t){e||=tc;let n=zs.start(e,t||this.cache.find(zs)?.dom,!!t);this.getBlockPos().append(this.lastBlock=this.curLine=n)}addLine(e){this.getBlockPos().append(e),this.pos+=e.length,this.lastBlock=e,this.endLine()}addBreak(){this.lastBlock.flags|=1,this.endLine(),this.pos++}addLineStartIfNotCovered(e){this.blockPosCovered()||this.addLineStart(e)}ensureLine(e){this.curLine||this.addLineStart(e)}ensureMarks(e,t){let n=this.curLine;for(let r=e.length-1;r>=0;r--){let i=e[r],a;if(t>0&&(a=n.lastChild)&&a instanceof Hs&&a.mark.eq(i))n=a,t--;else{let e=Hs.of(i,this.cache.find(Hs,e=>e.mark.eq(i))?.dom);n.append(e),n=e,t=0}}return n}endLine(){if(this.curLine){this.flushBuffer();let e=this.curLine.lastChild;(!e||!$s(this.curLine,!1)||e.dom.nodeName!=`BR`&&e.isWidget()&&!(G.ios&&$s(this.curLine,!0)))&&this.curLine.append(this.cache.findWidget(oc,0,32)||new Ws(oc.toDOM(),0,oc,32)),this.curLine=this.afterWidget=null}}updateBlockWrappers(){this.wrapperPos>this.pos+1e4&&(this.blockWrappers.goto(this.pos),this.wrappers.length=0);for(let e=this.wrappers.length-1;e>=0;e--)this.wrappers[e].to<this.pos&&this.wrappers.splice(e,1);for(let e=this.blockWrappers;e.value&&e.from<=this.pos;e.next())if(e.to>=this.pos){let t=e.rank*102+e.value.rank,n=new qs(e.from,e.to,e.value,t),r=this.wrappers.length;for(;r>0&&(this.wrappers[r-1].rank-n.rank||this.wrappers[r-1].to-n.to)<0;)r--;this.wrappers.splice(r,0,n)}this.wrapperPos=this.pos}getBlockPos(){this.updateBlockWrappers();let e=this.root;for(let t of this.wrappers){let n=e.lastChild;if(t.from<this.pos&&n instanceof Rs&&n.wrapper.eq(t.wrapper))e=n;else{let n=Rs.of(t.wrapper,this.cache.find(Rs,e=>e.wrapper.eq(t.wrapper))?.dom);e.append(n),e=n}}return e}blockPosCovered(){let e=this.lastBlock;return e!=null&&!e.breakAfter&&(!e.isWidget()||(e.flags&160)>0)}getBuffer(e){let t=2|(e<0?16:32),n=this.cache.find(Gs,void 0,1);return n&&(n.flags=t),n||new Gs(t)}flushBuffer(){this.afterWidget&&!(this.afterWidget.flags&32)&&(this.afterWidget.parent.append(this.getBuffer(-1)),this.afterWidget=null)}},Ys=class{constructor(e){this.skipCount=0,this.text=``,this.textOff=0,this.cursor=e.iter()}skip(e){this.textOff+e<=this.text.length?this.textOff+=e:(this.skipCount+=e-(this.text.length-this.textOff),this.text=``,this.textOff=0)}next(e){if(this.textOff==this.text.length){let{value:t,lineBreak:n,done:r}=this.cursor.next(this.skipCount);if(this.skipCount=0,r)throw Error(`Ran out of text content when drawing inline views`);this.text=t;let i=this.textOff=Math.min(e,t.length);return n?null:t.slice(0,i)}let t=Math.min(this.text.length,this.textOff+e),n=this.text.slice(this.textOff,t);return this.textOff=t,n}},Xs=[Ws,zs,Us,Hs,Gs,Rs,Ls];for(let e=0;e<Xs.length;e++)Xs[e].bucket=e;var Zs=class{constructor(e){this.view=e,this.buckets=Xs.map(()=>[]),this.index=Xs.map(()=>0),this.reused=new Map}add(e){let t=e.constructor.bucket,n=this.buckets[t];n.length<6?n.push(e):n[this.index[t]=(this.index[t]+1)%6]=e}find(e,t,n=2){let r=e.bucket,i=this.buckets[r],a=this.index[r];for(let e=0;e<i.length;e++){let o=(e+a)%i.length,s=i[o];if((!t||t(s))&&!this.reused.has(s))return i.splice(o,1),o<a&&this.index[r]--,this.reused.set(s,n),s}return null}findWidget(e,t,n){let r=this.buckets[0];if(r.length)for(let i=0,a=0;;i++){if(i==r.length){if(a)return null;a=1,i=0}let o=r[i];if(!this.reused.has(o)&&(a==0?o.widget.compare(e):o.widget.constructor==e.constructor&&e.updateDOM(o.dom,this.view,o.widget)))return r.splice(i,1),i<this.index[0]&&this.index[0]--,o.widget==e&&o.length==t&&(o.flags&497)==n?(this.reused.set(o,1),o):(this.reused.set(o,2),new Ws(o.dom,t,e,o.flags&-498|n))}}reuse(e){return this.reused.set(e,1),e}maybeReuse(e,t=2){if(!this.reused.has(e))return this.reused.set(e,t),e.dom}clear(){for(let e=0;e<this.buckets.length;e++)this.buckets[e].length=this.index[e]=0}},Qs=class{constructor(e,t,n,r,i){this.view=e,this.decorations=r,this.disallowBlockEffectsFor=i,this.openWidget=!1,this.openMarks=0,this.cache=new Zs(e),this.text=new Ys(e.state.doc),this.builder=new Js(this.cache,new Ls(e,e.contentDOM),U.iter(n)),this.cache.reused.set(t,2),this.old=new Ks(t),this.reuseWalker={skip:(e,t,n)=>{if(this.cache.add(e),e.isComposite())return!1},enter:e=>this.cache.add(e),leave:()=>{},break:()=>{}}}run(e,t){let n=t&&this.getCompositionContext(t.text);for(let r=0,i=0,a=0;;){let o=a<e.length?e[a++]:null,s=o?o.fromA:this.old.root.length;if(s>r){let e=s-r;this.preserve(e,!a,!o),r=s,i+=e}if(!o)break;t&&o.fromA<=t.range.fromA&&o.toA>=t.range.toA?(this.forward(o.fromA,t.range.fromA,t.range.fromA<t.range.toA?1:-1),this.emit(i,t.range.fromB),this.builder.flushBuffer(),this.cache.clear(),this.builder.addComposition(t,n),this.text.skip(t.range.toB-t.range.fromB),this.forward(t.range.fromA,o.toA),this.emit(t.range.toB,o.toB)):(this.forward(o.fromA,o.toA),this.emit(i,o.toB)),i=o.toB,r=o.toA}return this.builder.curLine&&this.builder.endLine(),this.builder.root}preserve(e,t,n){let r=rc(this.old),i=this.openMarks;this.old.advance(e,n?1:-1,{skip:(e,t,n)=>{if(e.isWidget()){if(this.openWidget)this.builder.continueWidget(n-t);else{let a=n>0||t<e.length?Ws.of(e.widget,this.view,n-t,e.flags&496,this.cache.maybeReuse(e)):this.cache.reuse(e);a.flags&256?(a.flags&=-2,this.builder.addBlockWidget(a)):(this.builder.ensureLine(null),this.builder.addInlineWidget(a,r,i),i=r.length)}}else if(e.isText())this.builder.ensureLine(null),!t&&n==e.length&&!this.cache.reused.has(e)?this.builder.addText(e.text,r,i,this.cache.reuse(e)):(this.cache.add(e),this.builder.addText(e.text.slice(t,n),r,i)),i=r.length;else if(e.isLine())e.flags&=-2,this.cache.reused.set(e,1),this.builder.addLine(e);else if(e instanceof Gs)this.cache.add(e);else if(e instanceof Hs)this.builder.ensureLine(null),this.builder.addMark(e,r,i),this.cache.reused.set(e,1),i=r.length;else return!1;this.openWidget=!1},enter:e=>{e.isLine()?this.builder.addLineStart(e.attrs,this.cache.maybeReuse(e)):(this.cache.add(e),e instanceof Hs&&r.unshift(e.mark)),this.openWidget=!1},leave:e=>{e.isLine()?r.length&&=i=0:e instanceof Hs&&(r.shift(),i=Math.min(i,r.length))},break:()=>{this.builder.addBreak(),this.openWidget=!1}}),this.text.skip(e)}emit(e,t){let n=null,r=this.builder,i=-1,a=U.spans(this.decorations,e,t,{point:(e,t,a,o,s,c)=>{if(a instanceof Ya){if(this.disallowBlockEffectsFor[c]){if(a.block)throw RangeError(`Block decorations may not be specified via plugins`);if(t>this.view.state.doc.lineAt(e).to)throw RangeError(`Decorations that replace line breaks may not be specified via plugins`)}if(i=o.length,s>o.length)r.continueWidget(t-e);else{let i=a.widget||(a.block?ac.block:ac.inline),c=ec(a),l=this.cache.findWidget(i,t-e,c)||Ws.of(i,this.view,t-e,c);a.block?(a.startSide>0&&r.addLineStartIfNotCovered(n),r.addBlockWidget(l)):(r.ensureLine(n),r.addInlineWidget(l,o,s))}n=null}else n=nc(n,a);t>e&&this.text.skip(t-e)},span:(e,t,a,o)=>{for(let i=e;i<t;){let s=this.text.next(Math.min(512,t-i));s==null?(r.addLineStartIfNotCovered(n),r.addBreak(),i++):(r.ensureLine(n),r.addText(s,a,i==e?o:a.length),i+=s.length),n=null}i=a.length}});i>-1&&(this.openWidget=a>i),this.openWidget||r.addLineStartIfNotCovered(n),this.openMarks=a}forward(e,t,n=1){t-e<=10?this.old.advance(t-e,n,this.reuseWalker):(this.old.advance(5,-1,this.reuseWalker),this.old.advance(t-e-10,-1),this.old.advance(5,n,this.reuseWalker))}getCompositionContext(e){let t=[],n=null;for(let r=e.parentNode;;r=r.parentNode){let e=Ps.get(r);if(r==this.view.contentDOM)break;e instanceof Hs?t.push(e):e?.isLine()?n=e:e instanceof Rs||(r.nodeName==`DIV`&&!n?n=new zs(r,tc):n||t.push(Hs.of(new qa({tagName:r.nodeName.toLowerCase(),attributes:Wa(r)}),r)))}return n?{line:n,marks:t}:null}};function $s(e,t){let n=e=>{for(let r of e.children)if((t?r.isText():r.length)||n(r))return!0;return!1};return n(e)}function ec(e){let t=e.isReplace?(e.startSide<0?64:0)|(e.endSide>0?128:0):e.startSide>0?32:16;return e.block&&(t|=256),t}var tc={class:`cm-line`};function nc(e,t){let n=t.spec.attributes,r=t.spec.class;return!n&&!r||(e||={class:`cm-line`},n&&za(n,e),r&&(e.class+=` `+r)),e}function rc(e){let t=[];for(let n=e.parents.length;n>1;n--){let r=n==e.parents.length?e.tile:e.parents[n].tile;r instanceof Hs&&t.push(r.mark)}return t}function ic(e){let t=Ps.get(e);return t&&t.setDOM(e.cloneNode()),e}var ac=class extends Ga{constructor(e){super(),this.tag=e}eq(e){return e.tag==this.tag}toDOM(){return document.createElement(this.tag)}updateDOM(e){return e.nodeName.toLowerCase()==this.tag}get isHidden(){return!0}};ac.inline=new ac(`span`),ac.block=new ac(`div`);var oc=new class extends Ga{toDOM(){return document.createElement(`br`)}get isHidden(){return!0}get editable(){return!0}},sc=class{constructor(e){this.view=e,this.decorations=[],this.blockWrappers=[],this.dynamicDecorationMap=[!1],this.domChanged=null,this.hasComposition=null,this.editContextFormatting=K.none,this.lastCompositionAfterCursor=!1,this.minWidth=0,this.minWidthFrom=0,this.minWidthTo=0,this.impreciseAnchor=null,this.impreciseHead=null,this.forceSelection=!1,this.lastUpdate=Date.now(),this.updateDeco(),this.tile=new Ls(e,e.contentDOM),this.updateInner([new js(0,0,0,e.state.doc.length)],null)}update(e){let t=e.changedRanges;this.minWidth>0&&t.length&&(t.every(({fromA:e,toA:t})=>t<this.minWidthFrom||e>this.minWidthTo)?(this.minWidthFrom=e.changes.mapPos(this.minWidthFrom,1),this.minWidthTo=e.changes.mapPos(this.minWidthTo,1)):this.minWidth=this.minWidthFrom=this.minWidthTo=0),this.updateEditContextFormatting(e);let n=-1;this.view.inputState.composing>=0&&!this.view.observer.editContext&&(this.domChanged?.newSel?n=this.domChanged.newSel.head:!vc(e.changes,this.hasComposition)&&!e.selectionSet&&(n=e.state.selection.main.head));let r=n>-1?dc(this.view,e.changes,n):null;if(this.domChanged=null,this.hasComposition){let{from:n,to:r}=this.hasComposition;t=new js(n,r,e.changes.mapPos(n,-1),e.changes.mapPos(r,1)).addToSet(t.slice())}this.hasComposition=r?{from:r.range.fromB,to:r.range.toB}:null,(G.ie||G.chrome)&&!r&&e&&e.state.doc.lines!=e.startState.doc.lines&&(this.forceSelection=!0);let i=this.decorations,a=this.blockWrappers;this.updateDeco();let o=mc(i,this.decorations,e.changes);o.length&&(t=js.extendWithRanges(t,o));let s=gc(a,this.blockWrappers,e.changes);return s.length&&(t=js.extendWithRanges(t,s)),r&&!t.some(e=>e.fromA<=r.range.fromA&&e.toA>=r.range.toA)&&(t=r.range.addToSet(t.slice())),this.tile.flags&2&&t.length==0?!1:(this.updateInner(t,r),e.transactions.length&&(this.lastUpdate=Date.now()),!0)}updateInner(e,t){this.view.viewState.mustMeasureContent=!0;let{observer:n}=this.view;n.ignore(()=>{if(t||e.length){let n=this.tile,r=new Qs(this.view,n,this.blockWrappers,this.decorations,this.dynamicDecorationMap);t&&Ps.get(t.text)&&r.cache.reused.set(Ps.get(t.text),2),this.tile=r.run(e,t),cc(n,r.cache.reused)}this.tile.dom.style.height=this.view.viewState.contentHeight/this.view.scaleY+`px`,this.tile.dom.style.flexBasis=this.minWidth?this.minWidth+`px`:``;let r=G.chrome||G.ios?{node:n.selectionRange.focusNode,written:!1}:void 0;this.tile.sync(r),r&&(r.written||n.selectionRange.focusNode!=r.node||!this.tile.dom.contains(r.node))&&(this.forceSelection=!0),this.tile.dom.style.height=``});let r=[];if(this.view.viewport.from||this.view.viewport.to<this.view.state.doc.length)for(let e of this.tile.children)e.isWidget()&&e.widget instanceof yc&&r.push(e.dom);n.updateGaps(r)}updateEditContextFormatting(e){this.editContextFormatting=this.editContextFormatting.map(e.changes);for(let t of e.transactions)for(let e of t.effects)e.is(fs)&&(this.editContextFormatting=e.value)}updateSelection(e=!1,t=!1){(e||!this.view.observer.selectionRange.focusNode)&&this.view.observer.readSelectionRange();let{dom:n}=this.tile,r=this.view.root.activeElement,i=r==n,a=!i&&!(this.view.state.facet(ms)||n.tabIndex>-1)&&io(n,this.view.observer.selectionRange)&&!(r&&n.contains(r));if(!(i||t||a))return;let o=this.forceSelection;this.forceSelection=!1;let s=this.view.state.selection.main,c,l;if(s.empty?l=c=this.inlineDOMNearPos(s.anchor,s.assoc||1):(l=this.inlineDOMNearPos(s.head,s.head==s.from?1:-1),c=this.inlineDOMNearPos(s.anchor,s.anchor==s.from?1:-1)),G.gecko&&s.empty&&!this.hasComposition&&lc(c)){let e=document.createTextNode(``);this.view.observer.ignore(()=>c.node.insertBefore(e,c.node.childNodes[c.offset]||null)),c=l=new Ao(e,0),o=!0}let u=this.view.observer.selectionRange;!o&&u.focusNode&&(oo(c.node,c.offset,u.anchorNode,u.anchorOffset)&&oo(l.node,l.offset,u.focusNode,u.focusOffset)||this.suppressWidgetCursorChange(u,s))||(this.view.observer.ignore(()=>{G.android&&G.chrome&&n.contains(u.focusNode)&&_c(u.focusNode,n)&&(n.blur(),n.focus({preventScroll:!0}));let e=no(this.view.root);if(e){if(s.empty){if(G.gecko){let e=fc(c.node,c.offset);if(e&&e!=3){let t=(e==1?Oo:ko)(c.node,c.offset);t&&(c=new Ao(t.node,t.offset))}}e.collapse(c.node,c.offset),s.bidiLevel!=null&&e.caretBidiLevel!==void 0&&(e.caretBidiLevel=s.bidiLevel)}else if(e.extend){e.collapse(c.node,c.offset);try{e.extend(l.node,l.offset)}catch{}}else{let t=document.createRange();s.anchor>s.head&&([c,l]=[l,c]),t.setEnd(l.node,l.offset),t.setStart(c.node,c.offset),e.removeAllRanges(),e.addRange(t)}}a&&this.view.root.activeElement==n&&(n.blur(),r&&r.focus())}),this.view.observer.setSelectionRange(c,l)),this.impreciseAnchor=c.precise?null:new Ao(u.anchorNode,u.anchorOffset),this.impreciseHead=l.precise?null:new Ao(u.focusNode,u.focusOffset)}suppressWidgetCursorChange(e,t){return this.hasComposition&&t.empty&&oo(e.focusNode,e.focusOffset,e.anchorNode,e.anchorOffset)&&this.posFromDOM(e.focusNode,e.focusOffset)==t.head}enforceCursorAssoc(){if(this.hasComposition)return;let{view:e}=this,t=e.state.selection.main,n=no(e.root),{anchorNode:r,anchorOffset:i}=e.observer.selectionRange;if(!n||!t.empty||!t.assoc||!n.modify)return;let a=this.lineAt(t.head,t.assoc);if(!a)return;let o=a.posAtStart;if(t.head==o||t.head==o+a.length)return;let s=this.coordsAt(t.head,-1),c=this.coordsAt(t.head,1);if(!s||!c||s.bottom>c.top)return;let l=this.domAtPos(t.head+t.assoc,t.assoc);n.collapse(l.node,l.offset),n.modify(`move`,t.assoc<0?`forward`:`backward`,`lineboundary`),e.observer.readSelectionRange();let u=e.observer.selectionRange;e.docView.posFromDOM(u.anchorNode,u.anchorOffset)!=t.from&&n.collapse(r,i)}posFromDOM(e,t){let n=this.tile.nearest(e);if(!n)return this.tile.dom.compareDocumentPosition(e)&2?0:this.view.state.doc.length;let r=n.posAtStart;if(n.isComposite()){let i;if(e==n.dom)i=n.dom.childNodes[t];else{let r=uo(e)==0?0:t==0?-1:1;for(;;){let t=e.parentNode;if(t==n.dom)break;r==0&&t.firstChild!=t.lastChild&&(r=e==t.firstChild?-1:1),e=t}i=r<0?e:e.nextSibling}if(i==n.dom.firstChild)return r;for(;i&&!Ps.get(i);)i=i.nextSibling;if(!i)return r+n.length;for(let e=0,t=r;;e++){let r=n.children[e];if(r.dom==i)return t;t+=r.length+r.breakAfter}}else if(n.isText())return e==n.dom?r+t:r+(t?n.length:0);else return r}domAtPos(e,t){let{tile:n,offset:r}=this.tile.resolveBlock(e,t);return n.isWidget()?n.domPosFor(r,t):n.domIn(r,t)}inlineDOMNearPos(e,t){let n,r=-1,i=!1,a,o=-1,s=!1;return this.tile.blockTiles((t,c)=>{if(t.isWidget()){if(t.flags&32&&c>=e)return!0;t.flags&16&&(i=!0)}else{let l=c+t.length;if(c<=e&&(n=t,r=e-c,i=l<e),l>=e&&!a&&(a=t,o=e-c,s=c>e),c>e&&a)return!0}}),!n&&!a?this.domAtPos(e,t):(i&&a?n=null:s&&n&&(a=null),n&&t<0||!a?n.domIn(r,t):a.domIn(o,t))}coordsAt(e,t,n){let{tile:r,offset:i}=this.tile.resolveBlock(e,t);return r.isWidget()?r.widget instanceof yc?null:r.coordsInWidget(i,t,!0):r.coordsIn(i,t,n)}lineAt(e,t){let{tile:n}=this.tile.resolveBlock(e,t);return n.isLine()?n:null}coordsForChar(e){let{tile:t,offset:n}=this.tile.resolveBlock(e,1);if(!t.isLine())return null;function r(e,t){if(e.isComposite())for(let n of e.children){if(n.length>=t){let e=r(n,t);if(e)return e}if(t-=n.length,t<0)break}else if(e.isText()&&t<e.length){let n=zr(e.text,t);if(n==t)return null;let r=Co(e.dom,t,n).getClientRects();for(let e=0;e<r.length;e++){let t=r[e];if(e==r.length-1||t.top<t.bottom&&t.left<t.right)return t}}return null}return r(t,n)}measureVisibleLineHeights(e){let t=[],{from:n,to:r}=e,i=this.view.contentDOM.clientWidth,a=i>Math.max(this.view.scrollDOM.clientWidth,this.minWidth)+1,o=-1,s=this.view.textDirection==q.LTR,c=0,l=(e,u,d)=>{for(let f=0;f<e.children.length&&!(u>r);f++){let r=e.children[f],p=u+r.length,m=r.dom.getBoundingClientRect(),{height:h}=m;if(d&&!f&&(c+=m.top-d.top),r instanceof Rs)p>n&&l(r,u,m);else if(u>=n&&(c>0&&t.push(-c),t.push(h+c),c=0,a)){let e=r.dom.lastChild,t=e?ao(e):[];if(t.length){let e=t[t.length-1],n=s?e.right-m.left:m.right-e.left;n>o&&(o=n,this.minWidth=i,this.minWidthFrom=u,this.minWidthTo=p)}}d&&f==e.children.length-1&&(c+=d.bottom-m.bottom),u=p+r.breakAfter}};return l(this.tile,0,null),t}textDirectionAt(e){let{tile:t}=this.tile.resolveBlock(e,1);return getComputedStyle(t.dom).direction==`rtl`?q.RTL:q.LTR}measureTextSize(){let e=this.tile.blockTiles(e=>{if(e.isLine()&&e.children.length&&e.length<=20){let t=0,n;for(let r of e.children){if(!r.isText()||/[^ -~]/.test(r.text))return;let e=ao(r.dom);if(e.length!=1)return;t+=e[0].width,n=e[0].height}if(t)return{lineHeight:e.dom.getBoundingClientRect().height,charWidth:t/e.length,textHeight:n}}});if(e)return e;let t=document.createElement(`div`),n,r,i;return t.className=`cm-line`,t.style.width=`99999px`,t.style.position=`absolute`,t.textContent=`abc def ghi jkl mno pqr stu`,this.view.observer.ignore(()=>{this.tile.dom.appendChild(t);let e=ao(t.firstChild)[0];n=t.getBoundingClientRect().height,r=e&&e.width?e.width/27:7,i=e&&e.height?e.height:n,t.remove()}),{lineHeight:n,charWidth:r,textHeight:i}}computeBlockGapDeco(){let e=[],t=this.view.viewState;for(let n=0,r=0;;r++){let i=r==t.viewports.length?null:t.viewports[r],a=i?i.from-1:this.view.state.doc.length;if(a>n){let r=(t.lineBlockAt(a).bottom-t.lineBlockAt(n).top)/this.view.scaleY;e.push(K.replace({widget:new yc(r),block:!0,inclusive:!0,isBlockGap:!0}).range(n,a))}if(!i)break;n=i.to+1}return K.set(e)}updateDeco(){let e=1,t=this.view.state.facet(xs).map(t=>(this.dynamicDecorationMap[e++]=typeof t==`function`)?t(this.view):t),n=!1,r=this.view.state.facet(Cs).map((e,t)=>{let r=typeof e==`function`;return r&&(n=!0),r?e(this.view):e});for(r.length&&(this.dynamicDecorationMap[e++]=n,t.push(U.join(r))),this.decorations=[this.editContextFormatting,...t,this.computeBlockGapDeco(),this.view.viewState.lineGapDeco];e<this.decorations.length;)this.dynamicDecorationMap[e++]=!1;this.blockWrappers=this.view.state.facet(Ss).map(e=>typeof e==`function`?e(this.view):e)}scrollIntoView(e){if(e.isSnapshot){let t=this.view.viewState.lineBlockAt(e.range.head);this.view.scrollDOM.scrollTop=t.top-e.yMargin,this.view.scrollDOM.scrollLeft=e.xMargin;return}for(let t of this.view.state.facet(ls))try{if(t(this.view,e.range,e))return!0}catch(e){ps(this.view.state,e,`scroll handler`)}let{range:t}=e,n=this.coordsAt(t.head,t.assoc||(t.head>t.anchor?-1:1)),r;if(!n)return;!t.empty&&(r=this.coordsAt(t.anchor,t.anchor>t.head?-1:1))&&(n={left:Math.min(n.left,r.left),top:Math.min(n.top,r.top),right:Math.max(n.right,r.right),bottom:Math.max(n.bottom,r.bottom)});let i=ks(this.view),a={left:n.left-i.left,top:n.top-i.top,right:n.right+i.right,bottom:n.bottom+i.bottom},{offsetWidth:o,offsetHeight:s}=this.view.scrollDOM;if(ho(this.view.scrollDOM,a,t.head<t.anchor?-1:1,e.x,e.y,Math.max(Math.min(e.xMargin,o),-o),Math.max(Math.min(e.yMargin,s),-s),this.view.textDirection==q.LTR),window.visualViewport&&window.innerHeight-window.visualViewport.height>1&&(n.top>window.visualViewport.offsetTop+window.visualViewport.height||n.bottom<window.visualViewport.offsetTop)){let e=this.view.docView.lineAt(t.head,1);if(e){let t=vo(e.dom);e.dom.scrollIntoView({block:`nearest`}),yo(t,!1)}}}lineHasWidget(e){let t=e=>e.isWidget()||e.children.some(t);return t(this.tile.resolveBlock(e,1).tile)}destroy(){cc(this.tile)}};function cc(e,t){let n=t?.get(e);if(n!=1){n??e.destroy();for(let n of e.children)cc(n,t)}}function lc(e){return eo(e.node)&&e.node.firstChild&&(e.offset==0||e.node.childNodes[e.offset-1].contentEditable==`false`)&&(e.offset==e.node.childNodes.length||e.node.childNodes[e.offset].contentEditable==`false`)}function uc(e,t){let n=e.observer.selectionRange;if(!n.focusNode)return null;let r=Oo(n.focusNode,n.focusOffset),i=ko(n.focusNode,n.focusOffset),a=r||i;if(i&&r&&i.node!=r.node){let t=Ps.get(i.node);if(!t||t.isText()&&t.text!=i.node.nodeValue)a=i;else if(e.docView.lastCompositionAfterCursor){let e=Ps.get(r.node);!e||e.isText()&&e.text!=r.node.nodeValue||(a=i)}}if(e.docView.lastCompositionAfterCursor=a!=r,!a)return null;let o=t-a.offset;return{from:o,to:o+a.node.nodeValue.length,node:a.node}}function dc(e,t,n){let r=uc(e,n);if(!r)return null;let{node:i,from:a,to:o}=r,s=i.nodeValue;if(/[\n\r]/.test(s)||e.state.doc.sliceString(r.from,r.to)!=s)return null;let c=t.invertedDesc;return{range:new js(c.mapPos(a),c.mapPos(o),a,o),text:i}}function fc(e,t){return eo(e)?(t&&e.childNodes[t-1].contentEditable==`false`?1:0)|(t<e.childNodes.length&&e.childNodes[t].contentEditable==`false`?2:0):0}var pc=class{constructor(){this.changes=[]}compareRange(e,t){Qa(e,t,this.changes)}comparePoint(e,t){Qa(e,t,this.changes)}boundChange(e){Qa(e,e,this.changes)}};function mc(e,t,n){let r=new pc;return U.compare(e,t,n,r),r.changes}var hc=class{constructor(){this.changes=[]}compareRange(e,t){Qa(e,t,this.changes)}comparePoint(){}boundChange(e){Qa(e,e,this.changes)}};function gc(e,t,n){let r=new hc;return U.compare(e,t,n,r),r.changes}function _c(e,t){for(let n=e;n&&n!=t;n=n.assignedSlot||n.parentNode)if(eo(n)&&n.contentEditable==`false`)return!0;return!1}function vc(e,t){let n=!1;return t&&e.iterChangedRanges((e,r)=>{e<t.to&&r>t.from&&(n=!0)}),n}var yc=class extends Ga{constructor(e){super(),this.height=e}toDOM(){let e=document.createElement(`div`);return e.className=`cm-gap`,this.updateDOM(e),e}eq(e){return e.height==this.height}updateDOM(e){return e.style.height=this.height+`px`,!0}get editable(){return!0}get estimatedHeight(){return this.height}ignoreEvent(){return!1}};function bc(e,t,n=1){let r=e.charCategorizer(t),i=e.doc.lineAt(t),a=t-i.from;if(i.length==0)return B.cursor(t);a==0?n=1:a==i.length&&(n=-1);let o=a,s=a;n<0?o=zr(i.text,a,!1):s=zr(i.text,a);let c=r(i.text.slice(o,s));for(;o>0;){let e=zr(i.text,o,!1);if(r(i.text.slice(e,o))!=c)break;o=e}for(;s<i.length;){let e=zr(i.text,s);if(r(i.text.slice(s,e))!=c)break;s=e}return B.undirectionalRange(o+i.from,s+i.from)}function xc(e,t,n,r,i){let a=Math.round((r-t.left)*e.defaultCharacterWidth);if(e.lineWrapping&&n.height>e.defaultLineHeight*1.5){let t=e.viewState.heightOracle.textHeight,r=Math.floor((i-n.top-(e.defaultLineHeight-t)*.5)/t);a+=r*e.viewState.heightOracle.lineLength}let o=e.state.sliceDoc(n.from,n.to);return n.from+fa(o,a,e.state.tabSize)}function Sc(e,t,n){let r=e.lineBlockAt(t);if(Array.isArray(r.type)){let e;for(let i of r.type){if(i.from>t)break;if(!(i.to<t)){if(i.from<t&&i.to>t)return i;(!e||i.type==Ka.Text&&(e.type!=i.type||(n<0?i.from<t:i.to>t)))&&(e=i)}}return e||r}return r}function Cc(e,t,n,r){let i=Sc(e,t.head,t.assoc||-1),a=!r||i.type!=Ka.Text||!(e.lineWrapping||i.widgetLineBreaks)?null:e.coordsAtPos(t.assoc<0&&t.head>i.from?t.head-1:t.head);if(a){let t=e.dom.getBoundingClientRect(),r=e.textDirectionAt(i.from),o=e.posAndSideAtCoords({x:n==(r==q.LTR)?t.right-1:t.left+1,y:(a.top+a.bottom)/2});if(o)return B.cursor(o.pos,o.assoc)}return B.cursor(n?i.to:i.from,n?1:-1)}function wc(e,t,n,r){let i=e.state.doc.lineAt(t.head),a=e.bidiSpans(i),o=e.textDirectionAt(i.from);for(let s=t,c=null;;){let t=Xo(i,a,o,s,n),l=Yo;if(!t){if(i.number==(n?e.state.doc.lines:1))return s;l=`
`,i=e.state.doc.line(i.number+(n?1:-1)),a=e.bidiSpans(i),t=n?B.cursor(i.from,-1):B.cursor(i.to,1)}if(!c){if(!r)return t;c=r(l)}else if(!c(l))return s;s=t}}function Tc(e,t,n){let r=e.state.charCategorizer(t),i=r(n);return e=>{let t=r(e);return i==Bi.Space&&(i=t),i==t}}function Ec(e,t,n,r){let i=t.head,a=n?1:-1;if(i==(n?e.state.doc.length:0))return B.cursor(i,t.assoc);let o=t.goalColumn,s,c=e.contentDOM.getBoundingClientRect(),l=e.coordsAtPos(i,t.assoc||((t.empty?n:t.head==t.from)?1:-1)),u=e.documentTop;if(l)o??=l.left-c.left,s=a<0?l.top:l.bottom;else{let t=e.viewState.lineBlockAt(i);o??=Math.min(c.right-c.left,e.defaultCharacterWidth*(i-t.from)),s=(a<0?t.top:t.bottom)+u}let d=c.left+o,f=e.viewState.heightOracle.textHeight>>1,p=r??f;for(let t=0;;t+=f){let r=s+(p+t)*a,i=jc(e,{x:d,y:r},!1,a);if(n?r>c.bottom:r<c.top)return B.cursor(i.pos,i.assoc);let l=e.coordsAtPos(i.pos,i.assoc),u=l?(l.top+l.bottom)/2:0;if(!l||(n?u>s:u<s))return B.cursor(i.pos,i.assoc,void 0,o)}}function Dc(e,t,n){for(;;){let r=0;for(let i of e)i.between(t-1,t+1,(e,i,a)=>{if(t>e&&t<i){let a=r||n||(t-e<i-t?-1:1);t=a<0?e:i,r=a}});if(!r)return t}}function Oc(e,t){let n=null;for(let r=0;r<t.ranges.length;r++){let i=t.ranges[r],a=null;if(i.empty){let t=Dc(e,i.from,0);t!=i.from&&(a=B.cursor(t,-1))}else{let t=Dc(e,i.from,-1),n=Dc(e,i.to,1);(t!=i.from||n!=i.to)&&(a=i.undirectional?B.undirectionalRange(i.from,i.to):B.range(i.from==i.anchor?t:n,i.from==i.head?t:n))}a&&(n||=t.ranges.slice(),n[r]=a)}return n?B.create(n,t.mainIndex):t}function kc(e,t,n){let r=Dc(e.state.facet(ws).map(t=>t(e)),n.from,t.head>n.from?-1:1);return r==n.from?n:B.cursor(r,r<n.from?1:-1)}var Ac=class{constructor(e,t){this.pos=e,this.assoc=t}};function jc(e,t,n,r){let i=e.contentDOM.getBoundingClientRect(),a=i.top+e.viewState.paddingTop,{x:o,y:s}=t,c=s-a,l;for(;;){if(c<0)return new Ac(0,1);if(c>e.viewState.docHeight)return new Ac(e.state.doc.length,-1);if(l=e.elementAtHeight(c),r==null)break;if(l.type==Ka.Text){if(r<0?l.to<e.viewport.from:l.from>e.viewport.to)break;let t=e.docView.coordsAt(r<0?l.from:l.to,r>0?-1:1);if(t&&(r<0?t.top<=c+a:t.bottom>=c+a))break}let t=e.viewState.heightOracle.textHeight/2;c=r>0?l.bottom+t:l.top-t}if(e.viewport.from>=l.to||e.viewport.to<=l.from){if(n)return null;if(l.type==Ka.Text){let t=xc(e,i,l,o,s);return new Ac(t,t==l.from?1:-1)}}if(l.type!=Ka.Text)return c<(l.top+l.bottom)/2?new Ac(l.from,1):new Ac(l.to,-1);let u=e.docView.lineAt(l.from,2);return u&&u.length==l.length||(u=e.docView.lineAt(l.from,-2)),new Mc(e,o,s,e.textDirectionAt(l.from)).scanTile(u,l.from)}var Mc=class{constructor(e,t,n,r){this.view=e,this.x=t,this.y=n,this.baseDir=r,this.line=null,this.spans=null}bidiSpansAt(e){return(!this.line||this.line.from>e||this.line.to<e)&&(this.line=this.view.state.doc.lineAt(e),this.spans=this.view.bidiSpans(this.line)),this}baseDirAt(e,t){let{line:n,spans:r}=this.bidiSpansAt(e);return r[Bo.find(r,e-n.from,-1,t)].level==this.baseDir}dirAt(e,t){let{line:n,spans:r}=this.bidiSpansAt(e);return r[Bo.find(r,e-n.from,-1,t)].dir}bidiIn(e,t){let{spans:n,line:r}=this.bidiSpansAt(e);return n.length>1||n.length&&(n[0].level!=this.baseDir||n[0].to+r.from<t)}scan(e,t,n=!1){let r=0,i=e.length-1,a=new Set,o=this.bidiIn(e[0],e[i]),s,c,l=-1,u=1e9,d;search:for(;r<i;){let n=i-r,f=r+i>>1;adjust:if(a.has(f)){for(let e=1;e<n;e++){let t=f+e;if(t>=i&&(t-=n),!a.has(t)){f=t;break adjust}}break search}a.add(f);let p=t(f),m=0;if(p)for(let e=0;e<p.length;e++){let t=p[e];if(!(t.width==0&&p.length>1)){if(t.bottom<this.y)(!s||s.bottom<t.bottom)&&(s=t),m=1;else if(t.top>this.y)(!c||c.top>t.top)&&(c=t),m=-1;else{let e=t.left>this.x?this.x-t.left:t.right<this.x?this.x-t.right:0,n=Math.abs(e);n<u&&(l=f,u=n,d=t),e&&(m=e<0==(this.baseDir==q.LTR)?-1:1)}}}m==-1&&(!o||this.baseDirAt(e[f],1))?i=f:m==1&&(!o||this.baseDirAt(e[f+1],-1))&&(r=f+1)}if(!d){if(!c&&!s)return{i:0,after:!1};let n=s&&(!c||this.y-s.bottom<c.top-this.y)?s:c;return this.y=(n.top+n.bottom)/2,this.scan(e,t,!0)}if(u&&!n){let{top:n,bottom:r}=d;if(s&&s.bottom>(n+n+r)/3)return this.y=s.bottom-1,this.scan(e,t,!0);if(c&&c.top<(n+r+r)/3)return this.y=c.top+1,this.scan(e,t,!0)}let f=(o?this.dirAt(e[l],1):this.baseDir)==q.LTR;return{i:l,after:this.x>(d.left+d.right)/2==f}}scanText(e,t){let n=[];for(let r=0;r<e.length;r=zr(e.text,r))n.push(t+r);n.push(t+e.length);let r=this.scan(n,r=>{let i=n[r]-t,a=n[r+1]-t;return Co(e.dom,i,a).getClientRects()});return r.after?new Ac(n[r.i+1],-1):new Ac(n[r.i],1)}scanTile(e,t){if(!e.length)return new Ac(t,1);if(e.children.length==1){let n=e.children[0];if(n.isText())return this.scanText(n,t);if(n.isComposite())return this.scanTile(n,t)}let n=[t];for(let r=0,i=t;r<e.children.length;r++)n.push(i+=e.children[r].length);let r=this.scan(n,t=>{let n=e.children[t];return n.flags&48?null:(eo(n.dom)?n.dom:Co(n.dom,0,n.length)).getClientRects()}),i=e.children[r.i],a=n[r.i];return i.isText()?this.scanText(i,a):i.isComposite()?this.scanTile(i,a):r.after?new Ac(n[r.i+1],-1):new Ac(a,1)}},Nc=`￿`,Pc=class{constructor(e,t){this.points=e,this.view=t,this.text=``,this.lineSeparator=t.state.facet(Gi.lineSeparator)}append(e){this.text+=e}lineBreak(){this.text+=Nc}readRange(e,t){if(!e)return this;let n=e.parentNode;for(let r=e;;){this.findPointBefore(n,r);let e=this.text.length;this.readNode(r);let i=Ps.get(r),a=r.nextSibling;if(a==t){i?.breakAfter&&!a&&n!=this.view.contentDOM&&this.lineBreak();break}let o=Ps.get(a);(i&&o?i.breakAfter:(i?i.breakAfter:co(r))||co(a)&&(r.nodeName!=`BR`||i?.isWidget())&&this.text.length>e)&&!Ic(a,t)&&this.lineBreak(),r=a}return this.findPointBefore(n,t),this}readTextNode(e){let t=e.nodeValue;for(let n of this.points)n.node==e&&(n.pos=this.text.length+Math.min(n.offset,t.length));for(let n=0,r=this.lineSeparator?null:/\r\n?|\n/g;;){let i=-1,a=1,o;if(this.lineSeparator?(i=t.indexOf(this.lineSeparator,n),a=this.lineSeparator.length):(o=r.exec(t))&&(i=o.index,a=o[0].length),this.append(t.slice(n,i<0?t.length:i)),i<0)break;if(this.lineBreak(),a>1)for(let t of this.points)t.node==e&&t.pos>this.text.length&&(t.pos-=a-1);n=i+a}}readNode(e){let t=Ps.get(e),n=t&&t.overrideDOMText;if(n!=null){this.findPointInside(e,n.length);for(let e=n.iter();!e.next().done;)e.lineBreak?this.lineBreak():this.append(e.value)}else to(e)?this.readTextNode(e):e.nodeName==`BR`?e.nextSibling&&this.lineBreak():eo(e)&&this.readRange(e.firstChild,null)}findPointBefore(e,t){for(let n of this.points)n.node==e&&e.childNodes[n.offset]==t&&(n.pos=this.text.length)}findPointInside(e,t){for(let n of this.points)(to(e)?n.node==e:e.contains(n.node))&&(n.pos=this.text.length+(Fc(e,n.node,n.offset)?t:0))}};function Fc(e,t,n){for(;;){if(!t||n<uo(t))return!1;if(t==e)return!0;n=so(t)+1,t=t.parentNode}}function Ic(e,t){let n;for(;e!=t&&e;e=e.nextSibling){let t=Ps.get(e);if(!t?.isWidget())return!1;t&&(n||=[]).push(t)}if(n){for(let e of n)if(e.overrideDOMText?.length)return!1}return!0}var Lc=class{constructor(e,t){this.node=e,this.offset=t,this.pos=-1}},Rc=class{constructor(e,t,n,r){this.typeOver=r,this.bounds=null,this.text=``,this.domChanged=t>-1;let{impreciseHead:i,impreciseAnchor:a}=e.docView,o=e.state.selection;if(e.state.readOnly&&t>-1)this.newSel=null;else if(t>-1&&(this.bounds=zc(e.docView.tile,t,n,0))){let t=i||a?[]:Wc(e),n=new Pc(t,e);n.readRange(this.bounds.startDOM,this.bounds.endDOM),this.text=n.text,this.newSel=Gc(t,this.bounds.from)}else{let t=e.observer.selectionRange,n=i&&i.node==t.focusNode&&i.offset==t.focusOffset||!ro(e.contentDOM,t.focusNode)?o.main.head:e.docView.posFromDOM(t.focusNode,t.focusOffset),r=a&&a.node==t.anchorNode&&a.offset==t.anchorOffset||!ro(e.contentDOM,t.anchorNode)?o.main.anchor:e.docView.posFromDOM(t.anchorNode,t.anchorOffset),s=e.viewport;if((G.ios||G.chrome)&&n!=r&&Math.min(n,r)<=o.main.from&&Math.max(n,r)>=o.main.to&&(s.from>0||s.to<e.state.doc.length)){let t=Math.min(n,r),i=Math.max(n,r),a=s.from-t,o=s.to-i;a!=0&&a!=1&&t!=0||o!=0&&o!=-1&&i!=e.state.doc.length||(n=0,r=e.state.doc.length)}if(e.inputState.composing>-1&&o.ranges.length>1)this.newSel=o.replaceRange(B.range(r,n));else if(e.lineWrapping&&r==n&&!(o.main.empty&&o.main.head==n)&&e.inputState.lastTouchTime>Date.now()-100){let t=e.coordsAtPos(n,-1),r=0;t&&(r=e.inputState.lastTouchY<=t.bottom?-1:1),this.newSel=B.create([B.cursor(n,r)])}else this.newSel=B.single(r,n)}}};function zc(e,t,n,r){if(e.isComposite()){let i=-1,a=-1,o=-1,s=-1;for(let c=0,l=r,u=r;c<e.children.length;c++){let r=e.children[c],d=l+r.length;if(l<t&&d>n)return zc(r,t,n,l);if(d>=t&&i==-1&&(i=c,a=l),l>n&&r.dom.parentNode==e.dom){o=c,s=u;break}u=d,l=d+r.breakAfter}return{from:a,to:s<0?r+e.length:s,startDOM:(i?e.children[i-1].dom.nextSibling:null)||e.dom.firstChild,endDOM:o<e.children.length&&o>=0?e.children[o].dom:null}}return e.isText()?{from:r,to:r+e.length,startDOM:e.dom,endDOM:e.dom.nextSibling}:null}function Bc(e,t){let n,{newSel:r}=t,{state:i}=e,a=i.selection.main,o=e.inputState.lastKeyTime>Date.now()-100?e.inputState.lastKeyCode:-1;if(t.bounds){let{from:e,to:r}=t.bounds,s=a.from,c=null;(o===8||G.android&&t.text.length<r-e)&&(s=a.to,c=`end`);let l=i.doc.sliceString(e,r,Nc),u,d;!a.empty&&a.from>=e&&a.to<=r&&(t.typeOver||l!=t.text)&&l.slice(0,a.from-e)==t.text.slice(0,a.from-e)&&l.slice(a.to-e)==t.text.slice(u=t.text.length-(l.length-(a.to-e)))?n={from:a.from,to:a.to,insert:z.of(t.text.slice(a.from-e,u).split(Nc))}:(d=Uc(l,t.text,s-e,c))&&(G.chrome&&o==13&&d.toB==d.from+2&&t.text.slice(d.from,d.toB)==`￿￿`&&d.toB--,n={from:e+d.from,to:e+d.toA,insert:z.of(t.text.slice(d.from,d.toB).split(Nc))})}else r&&(!e.hasFocus&&i.facet(ms)||Kc(r,a))&&(r=null);if(!n&&!r)return!1;if((G.mac||G.android)&&n&&n.from==n.to&&n.from==a.head-1&&/^\. ?$/.test(n.insert.toString())&&e.contentDOM.getAttribute(`autocorrect`)==`off`?(r&&n.insert.length==2&&(r=B.single(r.main.anchor-1,r.main.head-1)),n={from:n.from,to:n.to,insert:z.of([n.insert.toString().replace(`.`,` `)])}):i.doc.lineAt(a.from).to<a.to&&e.docView.lineHasWidget(a.to)&&e.inputState.insertingTextAt>Date.now()-50?n={from:a.from,to:a.to,insert:i.toText(e.inputState.insertingText)}:G.chrome&&n&&n.from==n.to&&n.from==a.head&&n.insert.toString()==`
 `&&e.lineWrapping&&(r&&=B.single(r.main.anchor-1,r.main.head-1),n={from:a.from,to:a.to,insert:z.of([` `])}),n)return Vc(e,n,r,o);if(r&&!Kc(r,a)){let t=!1,n=`select`;return e.inputState.lastSelectionTime>Date.now()-50&&(e.inputState.lastSelectionOrigin==`select`&&(t=!0),n=e.inputState.lastSelectionOrigin,n==`select.pointer`&&(r=Oc(i.facet(ws).map(t=>t(e)),r))),e.dispatch({selection:r,scrollIntoView:t,userEvent:n}),!0}return!1}function Vc(e,t,n,r=-1){if(G.ios&&e.inputState.flushIOSKey(t))return!0;let i=e.state.selection.main;if(G.android&&(t.to==i.to&&(t.from==i.from||t.from==i.from-1&&e.state.sliceDoc(t.from,i.from)==` `)&&t.insert.length==1&&t.insert.lines==2&&wo(e.contentDOM,`Enter`,13)||(t.from==i.from-1&&t.to==i.to&&t.insert.length==0||r==8&&t.insert.length<t.to-t.from&&t.to>i.head)&&wo(e.contentDOM,`Backspace`,8)||t.from==i.from&&t.to==i.to+1&&t.insert.length==0&&wo(e.contentDOM,`Delete`,46)))return!0;let a=t.insert.toString();e.inputState.composing>=0&&e.inputState.composing++;let o,s=()=>o||=Hc(e,t,n);return e.state.facet(rs).some(n=>n(e,t.from,t.to,a,s))||e.dispatch(s()),!0}function Hc(e,t,n){let r,i=e.state,a=i.selection.main,o=-1;if(t.from==t.to&&t.from<a.from||t.from>a.to){let n=t.from<a.from?-1:1,r=n<0?a.from:a.to,s=Dc(i.facet(ws).map(t=>t(e)),r,n);t.from==s&&(o=s)}if(o>-1)r={changes:t,selection:B.cursor(t.from+t.insert.length,-1)};else if(t.from>=a.from&&t.to<=a.to&&t.to-t.from>=(a.to-a.from)/3&&(!n||n.main.empty&&n.main.from==t.from+t.insert.length)&&e.inputState.composing<0){let n=a.from<t.from?i.sliceDoc(a.from,t.from):``,o=a.to>t.to?i.sliceDoc(t.to,a.to):``;r=i.replaceSelection(e.state.toText(n+t.insert.sliceString(0,void 0,e.state.lineBreak)+o))}else{let o=i.changes(t),s=n&&n.main.to<=o.newLength?n.main:void 0;if(i.selection.ranges.length>1&&(e.inputState.composing>=0||e.inputState.compositionPendingChange)&&t.to<=a.to+10&&t.to>=a.to-10){let c=e.state.sliceDoc(t.from,t.to),l,u=n&&uc(e,n.main.head);if(u){let e=t.insert.length-(t.to-t.from);l={from:u.from,to:u.to-e}}else l=e.state.doc.lineAt(a.head);let d=a.to-t.to;r=i.changeByRange(n=>{if(n.from==a.from&&n.to==a.to)return{changes:o,range:s||n.map(o)};let r=n.to-d,u=r-c.length;if(e.state.sliceDoc(u,r)!=c||r>=l.from&&u<=l.to)return{range:n};let f=i.changes({from:u,to:r,insert:t.insert}),p=n.to-a.to;return{changes:f,range:s?B.range(Math.max(0,s.anchor+p),Math.max(0,s.head+p)):n.map(f)}})}else r={changes:o,selection:s&&i.selection.replaceRange(s)}}let s=`input.type`;return(e.composing||e.inputState.compositionPendingChange&&e.inputState.compositionEndedAt>Date.now()-50)&&(e.inputState.compositionPendingChange=!1,s+=`.compose`,e.inputState.compositionFirstChange&&(s+=`.start`,e.inputState.compositionFirstChange=!1)),i.update(r,{userEvent:s,scrollIntoView:!0})}function Uc(e,t,n,r){let i=Math.min(e.length,t.length),a=0;for(;a<i&&e.charCodeAt(a)==t.charCodeAt(a);)a++;if(a==i&&e.length==t.length)return null;let o=e.length,s=t.length;for(;o>0&&s>0&&e.charCodeAt(o-1)==t.charCodeAt(s-1);)o--,s--;if(r==`end`){let e=Math.max(0,a-Math.min(o,s));n-=o+e-a}if(o<a&&e.length<t.length){let e=n<=a&&n>=o?a-n:0;a-=e,s=a+(s-o),o=a}else if(s<a){let e=n<=a&&n>=s?a-n:0;a-=e,o=a+(o-s),s=a}return{from:a,toA:o,toB:s}}function Wc(e){let t=[];if(e.root.activeElement!=e.contentDOM)return t;let{anchorNode:n,anchorOffset:r,focusNode:i,focusOffset:a}=e.observer.selectionRange;return n&&(t.push(new Lc(n,r)),(i!=n||a!=r)&&t.push(new Lc(i,a))),t}function Gc(e,t){if(e.length==0)return null;let n=e[0].pos,r=e.length==2?e[1].pos:n;return n<0||r<0?null:n==r?B.create([B.cursor(r+t,-1)]):B.single(n+t,r+t)}function Kc(e,t){return t.head==e.main.head&&t.anchor==e.main.anchor}var qc=class{setSelectionOrigin(e){this.lastSelectionOrigin=e,this.lastSelectionTime=Date.now()}constructor(e){this.view=e,this.lastKeyCode=0,this.lastKeyTime=0,this.touchActive=!1,this.lastTouchTime=0,this.lastTouchX=0,this.lastTouchY=0,this.lastFocusTime=0,this.lastScrollTop=0,this.lastScrollLeft=0,this.lastWheelEvent=0,this.pendingIOSKey=void 0,this.lastIOSMomentumScroll=0,this.tabFocusMode=-1,this.lastSelectionOrigin=null,this.lastSelectionTime=0,this.lastContextMenu=0,this.scrollHandlers=[],this.handlers=Object.create(null),this.composing=-1,this.compositionFirstChange=null,this.compositionEndedAt=0,this.compositionPendingKey=!1,this.compositionPendingChange=!1,this.insertingText=``,this.insertingTextAt=0,this.mouseSelection=null,this.draggedContent=null,this.handleEvent=this.handleEvent.bind(this),this.notifiedFocused=e.hasFocus,G.safari&&e.contentDOM.addEventListener(`input`,()=>null),G.gecko&&Al(e.contentDOM.ownerDocument)}handleEvent(e){sl(this.view,e)&&!this.ignoreDuringComposition(e)&&(e.type==`keydown`&&this.keydown(e)||(this.view.updateState==0?this.runHandlers(e.type,e):Promise.resolve().then(()=>this.runHandlers(e.type,e))))}runHandlers(e,t){let n=this.handlers[e];if(n){for(let e of n.observers)e(this.view,t);for(let e of n.handlers){if(t.defaultPrevented)break;if(e(this.view,t)){t.preventDefault();break}}}}ensureHandlers(e){let t=Xc(e),n=this.handlers,r=this.view.contentDOM;for(let e in t)if(e!=`scroll`){let i=!t[e].handlers.length,a=n[e];a&&i!=!a.handlers.length&&(r.removeEventListener(e,this.handleEvent),a=null),a||r.addEventListener(e,this.handleEvent,{passive:i})}for(let e in n)e!=`scroll`&&!t[e]&&r.removeEventListener(e,this.handleEvent);this.handlers=t}keydown(e){if(this.lastKeyCode=e.keyCode,this.lastKeyTime=Date.now(),e.keyCode==9&&this.tabFocusMode>-1&&(!this.tabFocusMode||Date.now()<=this.tabFocusMode))return!0;if(this.tabFocusMode>0&&e.keyCode!=27&&$c.indexOf(e.keyCode)<0&&(this.tabFocusMode=-1),G.android&&G.chrome&&!e.synthetic&&(e.keyCode==13||e.keyCode==8))return this.view.observer.delayAndroidKey(e.key,e.keyCode),!0;if(G.ios&&!e.synthetic&&!e.altKey&&!e.metaKey&&(Zc.some(t=>t.keyCode==e.keyCode)&&!e.ctrlKey||Qc.indexOf(e.key)>-1&&e.ctrlKey)){let t={ctrlKey:e.ctrlKey,altKey:e.altKey,metaKey:e.metaKey,shiftKey:e.shiftKey};t.shiftKey&&G.ios&&!/^(off|none)$/.test(this.view.contentDOM.autocapitalize)&&Jc(this.view.win)&&(t.shiftKey=!1);let n=this.pendingIOSKey={key:e.key,keyCode:e.keyCode,mods:t};return setTimeout(()=>{this.pendingIOSKey==n&&this.flushIOSKey()},50),!0}return e.keyCode!=229&&this.view.observer.forceFlush(),!1}flushIOSKey(e){let t=this.pendingIOSKey;return!t||this.view.observer.pendingRecords().length||t.key==`Enter`&&e&&e.from<e.to&&/^\S+$/.test(e.insert.toString())?!1:(this.pendingIOSKey=void 0,wo(this.view.contentDOM,t.key,t.keyCode,t.mods))}ignoreDuringComposition(e){return!/^key/.test(e.type)||e.synthetic?!1:this.composing>0?!0:G.safari&&!G.ios&&this.compositionPendingKey&&Date.now()-this.compositionEndedAt<100?(this.compositionPendingKey=!1,!0):!1}startMouseSelection(e){this.mouseSelection&&this.mouseSelection.destroy(),this.mouseSelection=e}update(e){this.view.observer.update(e),this.mouseSelection&&this.mouseSelection.update(e),this.draggedContent&&e.docChanged&&(this.draggedContent=this.draggedContent.map(e.changes)),e.transactions.length&&(this.lastKeyCode=this.lastSelectionTime=0)}destroy(){this.mouseSelection&&this.mouseSelection.destroy()}};function Jc(e){return e.visualViewport?e.visualViewport.height*e.visualViewport.scale/e.document.documentElement.clientHeight<.85:!1}function Yc(e,t){return(n,r)=>{try{return t.call(e,r,n)}catch(e){ps(n.state,e)}}}function Xc(e){let t=Object.create(null);function n(e){return t[e]||(t[e]={observers:[],handlers:[]})}for(let t of e){let e=t.spec,r=e&&e.plugin.domEventHandlers,i=e&&e.plugin.domEventObservers;if(r)for(let e in r){let i=r[e];i&&n(e).handlers.push(Yc(t.value,i))}if(i)for(let e in i){let r=i[e];r&&n(e).observers.push(Yc(t.value,r))}}for(let e in cl)n(e).handlers.push(cl[e]);for(let e in ll)n(e).observers.push(ll[e]);return t}var Zc=[{key:`Backspace`,keyCode:8,inputType:`deleteContentBackward`},{key:`Enter`,keyCode:13,inputType:`insertParagraph`},{key:`Enter`,keyCode:13,inputType:`insertLineBreak`},{key:`Delete`,keyCode:46,inputType:`deleteContentForward`}],Qc=`dthko`,$c=[16,17,18,20,91,92,224,225],el=6;function tl(e){return Math.max(0,e)*.7+8}function nl(e,t){return Math.max(Math.abs(e.clientX-t.clientX),Math.abs(e.clientY-t.clientY))}var rl=class{constructor(e,t,n,r){this.view=e,this.startEvent=t,this.style=n,this.mustSelect=r,this.scrollSpeed={x:0,y:0},this.scrolling=-1,this.lastEvent=t,this.scrollParents=go(e.contentDOM),this.atoms=e.state.facet(ws).map(t=>t(e));let i=e.contentDOM.ownerDocument;i.addEventListener(`mousemove`,this.move=this.move.bind(this)),i.addEventListener(`mouseup`,this.up=this.up.bind(this)),this.extend=t.shiftKey,this.multiple=e.state.facet(Gi.allowMultipleSelections)&&il(e,t),this.dragging=ol(e,t)&&yl(t)==1?null:!1}start(e){this.dragging===!1&&this.select(e)}move(e){if(e.buttons==0)return this.destroy();if(this.dragging||this.dragging==null&&nl(this.startEvent,e)<10)return;this.select(this.lastEvent=e);let t=0,n=0,r=0,i=0,a=this.view.win.innerWidth,o=this.view.win.innerHeight;this.scrollParents.x&&({left:r,right:a}=this.scrollParents.x.getBoundingClientRect()),this.scrollParents.y&&({top:i,bottom:o}=this.scrollParents.y.getBoundingClientRect());let s=ks(this.view);e.clientX-s.left<=r+el?t=-tl(r-e.clientX):e.clientX+s.right>=a-el&&(t=tl(e.clientX-a)),e.clientY-s.top<=i+el?n=-tl(i-e.clientY):e.clientY+s.bottom>=o-el&&(n=tl(e.clientY-o)),this.setScrollSpeed(t,n)}up(e){this.dragging??this.select(this.lastEvent),this.dragging||e.preventDefault(),this.destroy()}destroy(){this.setScrollSpeed(0,0);let e=this.view.contentDOM.ownerDocument;e.removeEventListener(`mousemove`,this.move),e.removeEventListener(`mouseup`,this.up),this.view.inputState.mouseSelection=this.view.inputState.draggedContent=null}setScrollSpeed(e,t){this.scrollSpeed={x:e,y:t},e||t?this.scrolling<0&&(this.scrolling=setInterval(()=>this.scroll(),50)):this.scrolling>-1&&(clearInterval(this.scrolling),this.scrolling=-1)}scroll(){let{x:e,y:t}=this.scrollSpeed;e&&this.scrollParents.x&&(this.scrollParents.x.scrollLeft+=e,e=0),t&&this.scrollParents.y&&(this.scrollParents.y.scrollTop+=t,t=0),(e||t)&&this.view.win.scrollBy(e,t),this.dragging===!1&&this.select(this.lastEvent)}select(e){let{view:t}=this,n=Oc(this.atoms,this.style.get(e,this.extend,this.multiple));(this.mustSelect||!n.eq(t.state.selection,this.dragging===!1))&&this.view.dispatch({selection:n,userEvent:`select.pointer`}),this.mustSelect=!1}update(e){e.transactions.some(e=>e.isUserEvent(`input.type`))?this.destroy():this.style.update(e)&&setTimeout(()=>this.select(this.lastEvent),20)}};function il(e,t){let n=e.state.facet(Qo);return n.length?n[0](t):G.mac?t.metaKey:t.ctrlKey}function al(e,t){let n=e.state.facet($o);return n.length?n[0](t):G.mac?!t.altKey:!t.ctrlKey}function ol(e,t){let{main:n}=e.state.selection;if(n.empty)return!1;let r=no(e.root);if(!r||r.rangeCount==0)return!0;let i=r.getRangeAt(0).getClientRects();for(let e=0;e<i.length;e++){let n=i[e];if(n.left<=t.clientX&&n.right>=t.clientX&&n.top<=t.clientY&&n.bottom>=t.clientY)return!0}return!1}function sl(e,t){if(!t.bubbles)return!0;if(t.defaultPrevented)return!1;for(let n=t.target,r;n!=e.contentDOM;n=n.parentNode)if(!n||n.nodeType==11||(r=Ps.get(n))&&r.isWidget()&&!r.isHidden&&r.widget.ignoreEvent(t))return!1;return!0}var cl=Object.create(null),ll=Object.create(null),ul=G.ie&&G.ie_version<15||G.ios&&G.webkit_version<604;function dl(e){let t=e.dom.parentNode;if(!t)return;let n=t.appendChild(document.createElement(`textarea`));n.style.cssText=`position: fixed; left: -10000px; top: 10px`,n.focus(),setTimeout(()=>{e.focus(),n.remove(),pl(e,n.value)},50)}function fl(e,t,n){for(let r of e.facet(t))n=r(n,e);return n}function pl(e,t){t=fl(e.state,as,t);let{state:n}=e,r,i=1,a=n.toText(t),o=a.lines==n.selection.ranges.length;if(Tl!=null&&n.selection.ranges.every(e=>e.empty)&&Tl==a.toString()){let e=-1;r=n.changeByRange(r=>{let s=n.doc.lineAt(r.from);if(s.from==e)return{range:r};e=s.from;let c=n.toText((o?a.line(i++).text:t)+n.lineBreak);return{changes:{from:s.from,insert:c},range:B.cursor(r.from+c.length,-1)}})}else r=o?n.changeByRange(e=>{let t=a.line(i++);return{changes:{from:e.from,to:e.to,insert:t.text},range:B.cursor(e.from+t.length,-1)}}):n.replaceSelection(a);e.dispatch(r,{userEvent:`input.paste`,scrollIntoView:!0})}ll.scroll=e=>{let t=e.inputState;t.lastScrollTop=e.scrollDOM.scrollTop,t.lastScrollLeft=e.scrollDOM.scrollLeft,G.ios&&!t.touchActive&&(t.lastIOSMomentumScroll=Date.now())},ll.wheel=ll.mousewheel=e=>{e.inputState.lastWheelEvent=Date.now()},cl.keydown=(e,t)=>(e.inputState.setSelectionOrigin(`select`),t.keyCode==27&&e.inputState.tabFocusMode!=0&&(e.inputState.tabFocusMode=Date.now()+2e3),!1),ll.touchstart=(e,t)=>{let n=e.inputState,r=t.targetTouches[0];n.touchActive=!0,n.lastTouchTime=Date.now(),r&&(n.lastTouchX=r.clientX,n.lastTouchY=r.clientY),n.setSelectionOrigin(`select.pointer`)},ll.touchmove=e=>{e.inputState.setSelectionOrigin(`select.pointer`)},ll.touchend=(e,t)=>{e.inputState.touchActive=!1},cl.mousedown=(e,t)=>{if(e.observer.flush(),e.inputState.lastTouchTime>Date.now()-2e3)return!1;let n=null;for(let r of e.state.facet(es))if(n=r(e,t),n)break;if(!n&&t.button==0&&(n=bl(e,t)),n){let r=!e.hasFocus;e.inputState.startMouseSelection(new rl(e,t,n,r)),r&&e.observer.ignore(()=>{xo(e.contentDOM);let t=e.root.activeElement;t&&!t.contains(e.contentDOM)&&t.blur()});let i=e.inputState.mouseSelection;if(i)return i.start(t),i.dragging===!1}else e.inputState.setSelectionOrigin(`select.pointer`);return!1};function ml(e,t,n,r){if(r==1)return B.cursor(t,n);if(r==2)return bc(e.state,t,n);{let r=e.docView.lineAt(t,n),i=e.state.doc.lineAt(r?r.posAtEnd:t),a=r?r.posAtStart:i.from,o=r?r.posAtEnd:i.to;return o<e.state.doc.length&&o==i.to&&o++,B.undirectionalRange(a,o)}}var hl=G.ie&&G.ie_version<=11,gl=null,_l=0,vl=0;function yl(e){if(!hl)return e.detail;let t=gl,n=vl;return gl=e,vl=Date.now(),_l=!t||n>Date.now()-400&&Math.abs(t.clientX-e.clientX)<2&&Math.abs(t.clientY-e.clientY)<2?(_l+1)%3:1}function bl(e,t){let n=e.posAndSideAtCoords({x:t.clientX,y:t.clientY},!1),r=yl(t),i=e.state.selection;return{update(e){e.docChanged&&(n.pos=e.changes.mapPos(n.pos),i=i.map(e.changes))},get(t,a,o){let s=e.posAndSideAtCoords({x:t.clientX,y:t.clientY},!1),c,l=ml(e,s.pos,s.assoc,r);if(n.pos!=s.pos&&!a){let t=ml(e,n.pos,n.assoc,r),i=Math.min(t.from,l.from),a=Math.max(t.to,l.to);l=i<l.from?B.range(i,a,l.assoc):B.range(a,i,l.assoc)}return a?i.replaceRange(i.main.extend(l.from,l.to,l.assoc)):o&&r==1&&i.ranges.length>1&&(c=xl(i,s.pos))?c:o?i.addRange(l):B.create([l])}}}function xl(e,t){for(let n=0;n<e.ranges.length;n++){let{from:r,to:i}=e.ranges[n];if(r<=t&&i>=t)return B.create(e.ranges.slice(0,n).concat(e.ranges.slice(n+1)),e.mainIndex==n?0:e.mainIndex-+(e.mainIndex>n))}return null}cl.dragstart=(e,t)=>{let{selection:{main:n}}=e.state;if(t.target.draggable){let r=e.docView.tile.nearest(t.target);if(r&&r.isWidget()){let e=r.posAtStart,t=e+r.length;(e>=n.to||t<=n.from)&&(n=B.undirectionalRange(e,t))}}let{inputState:r}=e;return r.mouseSelection&&(r.mouseSelection.dragging=!0),r.draggedContent=n,t.dataTransfer&&(t.dataTransfer.setData(`Text`,fl(e.state,os,e.state.sliceDoc(n.from,n.to))),t.dataTransfer.effectAllowed=`copyMove`),!1},cl.dragend=e=>(e.inputState.draggedContent=null,!1);function Sl(e,t,n,r){if(n=fl(e.state,as,n),!n)return;let i=e.posAtCoords({x:t.clientX,y:t.clientY},!1),{draggedContent:a}=e.inputState,o=r&&a&&al(e,t)?{from:a.from,to:a.to}:null,s={from:i,insert:n},c=e.state.changes(o?[o,s]:s);e.focus(),e.dispatch({changes:c,selection:{anchor:c.mapPos(i,-1),head:c.mapPos(i,1)},userEvent:o?`move.drop`:`input.drop`}),e.inputState.draggedContent=null}cl.drop=(e,t)=>{if(!t.dataTransfer)return!1;if(e.state.readOnly)return!0;let n=t.dataTransfer.files;if(n&&n.length){let r=Array(n.length),i=0,a=()=>{++i==n.length&&Sl(e,t,r.filter(e=>e!=null).join(e.state.lineBreak),!1)};for(let e=0;e<n.length;e++){let t=new FileReader;t.onerror=a,t.onload=()=>{/[\x00-\x08\x0e-\x1f]{2}/.test(t.result)||(r[e]=t.result),a()},t.readAsText(n[e])}return!0}{let n=t.dataTransfer.getData(`Text`);if(n)return Sl(e,t,n,!0),!0}return!1},cl.paste=(e,t)=>{if(e.state.readOnly)return!0;e.observer.flush();let n=ul?null:t.clipboardData;return n?(pl(e,n.getData(`text/plain`)||n.getData(`text/uri-list`)),!0):(dl(e),!1)};function Cl(e,t){let n=e.dom.parentNode;if(!n)return;let r=n.appendChild(document.createElement(`textarea`));r.style.cssText=`position: fixed; left: -10000px; top: 10px`,r.value=t,r.focus(),r.selectionEnd=t.length,r.selectionStart=0,setTimeout(()=>{r.remove(),e.focus()},50)}function wl(e){let t=[],n=[],r=!1;for(let r of e.selection.ranges)r.empty||(t.push(e.sliceDoc(r.from,r.to)),n.push(r));if(!t.length){let i=-1;for(let{from:r}of e.selection.ranges){let a=e.doc.lineAt(r);a.number>i&&(t.push(a.text),n.push({from:a.from,to:Math.min(e.doc.length,a.to+1)})),i=a.number}r=!0}return{text:fl(e,os,t.join(e.lineBreak)),ranges:n,linewise:r}}var Tl=null;cl.copy=cl.cut=(e,t)=>{if(!io(e.contentDOM,e.observer.selectionRange))return!1;let{text:n,ranges:r,linewise:i}=wl(e.state);if(!n&&!i)return!1;Tl=i?n:null,t.type==`cut`&&!e.state.readOnly&&e.dispatch({changes:r,scrollIntoView:!0,userEvent:`delete.cut`});let a=ul?null:t.clipboardData;return a?(a.clearData(),a.setData(`text/plain`,n),!0):(Cl(e,n),!1)};var El=Oi.define();function Dl(e,t){let n=[];for(let r of e.facet(is)){let i=r(e,t);i&&n.push(i)}return n.length?e.update({effects:n,annotations:El.of(!0)}):null}function Ol(e){setTimeout(()=>{let t=e.hasFocus;if(t!=e.inputState.notifiedFocused){let n=Dl(e.state,t);n?e.dispatch(n):e.update([])}},10)}ll.focus=e=>{e.inputState.lastFocusTime=Date.now(),!e.scrollDOM.scrollTop&&(e.inputState.lastScrollTop||e.inputState.lastScrollLeft)&&(e.scrollDOM.scrollTop=e.inputState.lastScrollTop,e.scrollDOM.scrollLeft=e.inputState.lastScrollLeft),Ol(e)},ll.blur=e=>{e.observer.clearSelectionRange(),Ol(e)},ll.compositionstart=ll.compositionupdate=(e,t)=>{if(!e.observer.editContext&&(e.inputState.compositionFirstChange??(e.inputState.compositionFirstChange=!0),e.inputState.composing<0)){let{main:t}=e.state.selection;!t.empty&&e.lineBlockAt(t.from).from!=e.lineBlockAt(t.to).from&&!e.state.readOnly&&e.dispatch({changes:e.state.selection.ranges.filter(e=>!e.empty).map(e=>({from:e.from,to:e.to})),userEvent:`input`}),e.inputState.composing=0}},ll.compositionend=e=>{e.observer.editContext||(e.inputState.composing=-1,e.inputState.compositionEndedAt=Date.now(),e.inputState.compositionPendingKey=!0,e.inputState.compositionPendingChange=e.observer.pendingRecords().length>0,e.inputState.compositionFirstChange=null,G.chrome&&G.android?e.observer.flushSoon():e.inputState.compositionPendingChange?Promise.resolve().then(()=>e.observer.flush()):setTimeout(()=>{e.inputState.composing<0&&e.docView.hasComposition&&e.update([])},50))},ll.contextmenu=e=>{e.inputState.lastContextMenu=Date.now()},cl.beforeinput=(e,t)=>{if((t.inputType==`insertText`||t.inputType==`insertCompositionText`)&&(e.inputState.insertingText=t.data,e.inputState.insertingTextAt=Date.now()),t.inputType==`insertReplacementText`&&e.observer.editContext){let n=t.dataTransfer?.getData(`text/plain`),r=t.getTargetRanges();if(n&&r.length){let t=r[0];return Vc(e,{from:e.posAtDOM(t.startContainer,t.startOffset),to:e.posAtDOM(t.endContainer,t.endOffset),insert:e.state.toText(n)},null),!0}}let n;if(G.chrome&&G.android&&(n=Zc.find(e=>e.inputType==t.inputType))&&(e.observer.delayAndroidKey(n.key,n.keyCode),n.key==`Backspace`||n.key==`Delete`)){let t=window.visualViewport?.height||0;setTimeout(()=>{(window.visualViewport?.height||0)>t+10&&e.hasFocus&&(e.contentDOM.blur(),e.focus())},100)}return G.ios&&t.inputType==`deleteContentForward`&&e.observer.flushSoon(),G.safari&&t.inputType==`insertText`&&e.inputState.composing>=0&&setTimeout(()=>ll.compositionend(e,t),20),!1};var kl=new Set;function Al(e){kl.has(e)||(kl.add(e),e.addEventListener(`copy`,()=>{}),e.addEventListener(`cut`,()=>{}))}var jl=[`pre-wrap`,`normal`,`pre-line`,`break-spaces`],Ml=!1;function Nl(){Ml=!1}var Pl=class{constructor(e){this.lineWrapping=e,this.doc=z.empty,this.heightSamples={},this.lineHeight=14,this.charWidth=7,this.textHeight=14,this.lineLength=30}heightForGap(e,t){let n=this.doc.lineAt(t).number-this.doc.lineAt(e).number+1;return this.lineWrapping&&(n+=Math.max(0,Math.ceil((t-e-n*this.lineLength*.5)/this.lineLength))),this.lineHeight*n}heightForLine(e){return this.lineWrapping?(1+Math.max(0,Math.ceil((e-this.lineLength)/Math.max(1,this.lineLength-5))))*this.lineHeight:this.lineHeight}setDoc(e){return this.doc=e,this}mustRefreshForWrapping(e){return jl.indexOf(e)>-1!=this.lineWrapping}mustRefreshForHeights(e){let t=!1;for(let n=0;n<e.length;n++){let r=e[n];r<0?n++:this.heightSamples[Math.floor(r*10)]||(t=!0,this.heightSamples[Math.floor(r*10)]=!0)}return t}refresh(e,t,n,r,i,a){let o=jl.indexOf(e)>-1,s=Math.abs(t-this.lineHeight)>.3||this.lineWrapping!=o;if(this.lineWrapping=o,this.lineHeight=t,this.charWidth=n,this.textHeight=r,this.lineLength=i,s){this.heightSamples={};for(let e=0;e<a.length;e++){let t=a[e];t<0?e++:this.heightSamples[Math.floor(t*10)]=!0}}return s}},Fl=class{constructor(e,t){this.from=e,this.heights=t,this.index=0}get more(){return this.index<this.heights.length}},Il=class e{constructor(e,t,n,r,i){this.from=e,this.length=t,this.top=n,this.height=r,this._content=i}get type(){return typeof this._content==`number`?Ka.Text:Array.isArray(this._content)?this._content:this._content.type}get to(){return this.from+this.length}get bottom(){return this.top+this.height}get widget(){return this._content instanceof Ya?this._content.widget:null}get widgetLineBreaks(){return typeof this._content==`number`?this._content:0}join(t){let n=(Array.isArray(this._content)?this._content:[this]).concat(Array.isArray(t._content)?t._content:[t]);return new e(this.from,this.length+t.length,this.top,this.height+t.height,n)}},Y=(function(e){return e[e.ByPos=0]=`ByPos`,e[e.ByHeight=1]=`ByHeight`,e[e.ByPosNoHeight=2]=`ByPosNoHeight`,e})(Y||={}),Ll=.001,Rl=class e{constructor(e,t,n=2){this.length=e,this.height=t,this.flags=n}get outdated(){return(this.flags&2)>0}set outdated(e){this.flags=(e?2:0)|this.flags&-3}setHeight(e){this.height!=e&&(Math.abs(this.height-e)>Ll&&(Ml=!0),this.height=e)}replace(t,n,r){return e.of(r)}decomposeLeft(e,t){t.push(this)}decomposeRight(e,t){t.push(this)}applyChanges(e,t,n,r){let i=this,a=n.doc;for(let o=r.length-1;o>=0;o--){let{fromA:s,toA:c,fromB:l,toB:u}=r[o],d=i.lineAt(s,Y.ByPosNoHeight,n.setDoc(t),0,0),f=d.to>=c?d:i.lineAt(c,Y.ByPosNoHeight,n,0,0);for(u+=f.to-c,c=f.to;o>0&&d.from<=r[o-1].toA;)s=r[o-1].fromA,l=r[o-1].fromB,o--,s<d.from&&(d=i.lineAt(s,Y.ByPosNoHeight,n,0,0));l+=d.from-s,s=d.from;let p=ql.build(n.setDoc(a),e,l,u);i=zl(i,i.replace(s,c,p))}return i.updateHeight(n,0)}static empty(){return new Hl(0,0,0)}static of(t){if(t.length==1)return t[0];let n=0,r=t.length,i=0,a=0;for(;;)if(n==r){if(i>a*2){let e=t[n-1];e.break?t.splice(--n,1,e.left,null,e.right):t.splice(--n,1,e.left,e.right),r+=1+e.break,i-=e.size}else if(a>i*2){let e=t[r];e.break?t.splice(r,1,e.left,null,e.right):t.splice(r,1,e.left,e.right),r+=2+e.break,a-=e.size}else break}else if(i<a){let e=t[n++];e&&(i+=e.size)}else{let e=t[--r];e&&(a+=e.size)}let o=!1;return t[n-1]==null?(o=!0,n--):t[n]??(o=!0,r++),new Wl(e.of(t.slice(0,n)),o,e.of(t.slice(r)))}};function zl(e,t){return e==t?e:(e.constructor!=t.constructor&&(Ml=!0),t)}Rl.prototype.size=1;var Bl=K.replace({}),Vl=class extends Rl{constructor(e,t,n){super(e,t),this.deco=n,this.spaceAbove=0}mainBlock(e,t){return new Il(t,this.length,e+this.spaceAbove,this.height-this.spaceAbove,this.deco||0)}blockAt(e,t,n,r){return this.spaceAbove&&e<n+this.spaceAbove?new Il(r,0,n,this.spaceAbove,Bl):this.mainBlock(n,r)}lineAt(e,t,n,r,i){let a=this.mainBlock(r,i);return this.spaceAbove?this.blockAt(0,n,r,i).join(a):a}forEachLine(e,t,n,r,i,a){e<=i+this.length&&t>=i&&a(this.lineAt(0,Y.ByPos,n,r,i))}setMeasuredHeight(e){let t=e.heights[e.index++];t<0?(this.spaceAbove=-t,t=e.heights[e.index++]):this.spaceAbove=0,this.setHeight(t)}updateHeight(e,t=0,n=!1,r){return r&&r.from<=t&&r.more&&this.setMeasuredHeight(r),this.outdated=!1,this}toString(){return`block(${this.length})`}},Hl=class e extends Vl{constructor(e,t,n){super(e,t,null),this.collapsed=0,this.widgetHeight=0,this.breaks=0,this.spaceAbove=n}mainBlock(e,t){return new Il(t,this.length,e+this.spaceAbove,this.height-this.spaceAbove,this.breaks)}replace(t,n,r){let i=r[0];return r.length==1&&(i instanceof e||i instanceof Ul&&i.flags&4)&&Math.abs(this.length-i.length)<10?(i instanceof Ul?i=new e(i.length,this.height,this.spaceAbove):i.height=this.height,this.outdated||(i.outdated=!1),i):Rl.of(r)}updateHeight(e,t=0,n=!1,r){return r&&r.from<=t&&r.more?this.setMeasuredHeight(r):(n||this.outdated)&&(this.spaceAbove=0,this.setHeight(Math.max(this.widgetHeight,e.heightForLine(this.length-this.collapsed))+this.breaks*e.lineHeight)),this.outdated=!1,this}toString(){return`line(${this.length}${this.collapsed?-this.collapsed:``}${this.widgetHeight?`:`+this.widgetHeight:``})`}},Ul=class e extends Rl{constructor(e){super(e,0)}heightMetrics(e,t){let n=e.doc.lineAt(t).number,r=e.doc.lineAt(t+this.length).number,i=r-n+1,a,o=0;if(e.lineWrapping){let t=Math.min(this.height,e.lineHeight*i);a=t/i,this.length>i+1&&(o=(this.height-t)/(this.length-i-1))}else a=this.height/i;return{firstLine:n,lastLine:r,perLine:a,perChar:o}}blockAt(e,t,n,r){let{firstLine:i,lastLine:a,perLine:o,perChar:s}=this.heightMetrics(t,r);if(t.lineWrapping){let i=r+(e<t.lineHeight?0:Math.round(Math.max(0,Math.min(1,(e-n)/this.height))*this.length)),a=t.doc.lineAt(i),c=o+a.length*s,l=Math.max(n,e-c/2);return new Il(a.from,a.length,l,c,0)}{let r=Math.max(0,Math.min(a-i,Math.floor((e-n)/o))),{from:s,length:c}=t.doc.line(i+r);return new Il(s,c,n+o*r,o,0)}}lineAt(e,t,n,r,i){if(t==Y.ByHeight)return this.blockAt(e,n,r,i);if(t==Y.ByPosNoHeight){let{from:t,to:r}=n.doc.lineAt(e);return new Il(t,r-t,0,0,0)}let{firstLine:a,perLine:o,perChar:s}=this.heightMetrics(n,i),c=n.doc.lineAt(e),l=o+c.length*s,u=c.number-a,d=r+o*u+s*(c.from-i-u);return new Il(c.from,c.length,Math.max(r,Math.min(d,r+this.height-l)),l,0)}forEachLine(e,t,n,r,i,a){e=Math.max(e,i),t=Math.min(t,i+this.length);let{firstLine:o,perLine:s,perChar:c}=this.heightMetrics(n,i);for(let l=e,u=r;l<=t;){let t=n.doc.lineAt(l);if(l==e){let n=t.number-o;u+=s*n+c*(e-i-n)}let r=s+c*t.length;a(new Il(t.from,t.length,u,r,0)),u+=r,l=t.to+1}}replace(t,n,r){let i=this.length-n;if(i>0){let t=r[r.length-1];t instanceof e?r[r.length-1]=new e(t.length+i):r.push(null,new e(i-1))}if(t>0){let n=r[0];n instanceof e?r[0]=new e(t+n.length):r.unshift(new e(t-1),null)}return Rl.of(r)}decomposeLeft(t,n){n.push(new e(t-1),null)}decomposeRight(t,n){n.push(null,new e(this.length-t-1))}updateHeight(t,n=0,r=!1,i){let a=n+this.length;if(i&&i.from<=n+this.length&&i.more){let r=[],o=Math.max(n,i.from),s=-1;for(i.from>n&&r.push(new e(i.from-n-1).updateHeight(t,n));o<=a&&i.more;){let e=t.doc.lineAt(o).length;r.length&&r.push(null);let n=i.heights[i.index++],a=0;n<0&&(a=-n,n=i.heights[i.index++]),s==-1?s=n:Math.abs(n-s)>=Ll&&(s=-2);let c=new Hl(e,n,a);c.outdated=!1,r.push(c),o+=e+1}o<=a&&r.push(null,new e(a-o).updateHeight(t,o));let c=Rl.of(r);return(s<0||Math.abs(c.height-this.height)>=Ll||Math.abs(s-this.heightMetrics(t,n).perLine)>=Ll)&&(Ml=!0),zl(this,c)}return(r||this.outdated)&&(this.setHeight(t.heightForGap(n,n+this.length)),this.outdated=!1),this}toString(){return`gap(${this.length})`}},Wl=class extends Rl{constructor(e,t,n){super(e.length+ +!!t+n.length,e.height+n.height,+!!t|(e.outdated||n.outdated?2:0)),this.left=e,this.right=n,this.size=e.size+n.size}get break(){return this.flags&1}blockAt(e,t,n,r){let i=n+this.left.height;return e<i?this.left.blockAt(e,t,n,r):this.right.blockAt(e,t,i,r+this.left.length+this.break)}lineAt(e,t,n,r,i){let a=r+this.left.height,o=i+this.left.length+this.break,s=t==Y.ByHeight?e<a:e<o,c=s?this.left.lineAt(e,t,n,r,i):this.right.lineAt(e,t,n,a,o);if(this.break||(s?c.to<o:c.from>o))return c;let l=t==Y.ByPosNoHeight?Y.ByPosNoHeight:Y.ByPos;return s?c.join(this.right.lineAt(o,l,n,a,o)):this.left.lineAt(o,l,n,r,i).join(c)}forEachLine(e,t,n,r,i,a){let o=r+this.left.height,s=i+this.left.length+this.break;if(this.break)e<s&&this.left.forEachLine(e,t,n,r,i,a),t>=s&&this.right.forEachLine(e,t,n,o,s,a);else{let c=this.lineAt(s,Y.ByPos,n,r,i);e<c.from&&this.left.forEachLine(e,Math.min(t,c.from-1),n,r,i,a),c.to>=e&&c.from<=t&&a(c),t>c.to&&this.right.forEachLine(Math.max(e,c.to+1),t,n,o,s,a)}}replace(e,t,n){let r=this.left.length+this.break;if(t<r)return this.balanced(this.left.replace(e,t,n),this.right);if(e>this.left.length)return this.balanced(this.left,this.right.replace(e-r,t-r,n));let i=[];e>0&&this.decomposeLeft(e,i);let a=i.length;for(let e of n)i.push(e);if(e>0&&Gl(i,a-1),t<this.length){let e=i.length;this.decomposeRight(t,i),Gl(i,e)}return Rl.of(i)}decomposeLeft(e,t){let n=this.left.length;if(e<=n)return this.left.decomposeLeft(e,t);t.push(this.left),this.break&&(n++,e>=n&&t.push(null)),e>n&&this.right.decomposeLeft(e-n,t)}decomposeRight(e,t){let n=this.left.length,r=n+this.break;if(e>=r)return this.right.decomposeRight(e-r,t);e<n&&this.left.decomposeRight(e,t),this.break&&e<r&&t.push(null),t.push(this.right)}balanced(e,t){return e.size>2*t.size||t.size>2*e.size?Rl.of(this.break?[e,null,t]:[e,t]):(this.left=zl(this.left,e),this.right=zl(this.right,t),this.setHeight(e.height+t.height),this.outdated=e.outdated||t.outdated,this.size=e.size+t.size,this.length=e.length+this.break+t.length,this)}updateHeight(e,t=0,n=!1,r){let{left:i,right:a}=this,o=t+i.length+this.break,s=null;return r&&r.from<=t+i.length&&r.more?s=i=i.updateHeight(e,t,n,r):i.updateHeight(e,t,n),r&&r.from<=o+a.length&&r.more?s=a=a.updateHeight(e,o,n,r):a.updateHeight(e,o,n),s?this.balanced(i,a):(this.height=this.left.height+this.right.height,this.outdated=!1,this)}toString(){return this.left+(this.break?` `:`-`)+this.right}};function Gl(e,t){let n,r;e[t]==null&&(n=e[t-1])instanceof Ul&&(r=e[t+1])instanceof Ul&&e.splice(t-1,3,new Ul(n.length+1+r.length))}var Kl=5,ql=class e{constructor(e,t){this.pos=e,this.oracle=t,this.nodes=[],this.lineStart=-1,this.lineEnd=-1,this.covering=null,this.writtenTo=e}get isCovered(){return this.covering&&this.nodes[this.nodes.length-1]==this.covering}span(e,t){if(this.lineStart>-1){let e=Math.min(t,this.lineEnd),n=this.nodes[this.nodes.length-1];n instanceof Hl?n.length+=e-this.pos:(e>this.pos||!this.isCovered)&&this.nodes.push(new Hl(e-this.pos,-1,0)),this.writtenTo=e,t>e&&(this.nodes.push(null),this.writtenTo++,this.lineStart=-1)}this.pos=t}point(e,t,n){if(e<t||n.heightRelevant){let r=n.widget?n.widget.estimatedHeight:0,i=n.widget?n.widget.lineBreaks:0;r<0&&(r=this.oracle.lineHeight);let a=t-e;n.block?this.addBlock(new Vl(a,r,n)):(a||i||r>=Kl)&&this.addLineDeco(r,i,a)}else t>e&&this.span(e,t);this.lineEnd>-1&&this.lineEnd<this.pos&&(this.lineEnd=this.oracle.doc.lineAt(this.pos).to)}enterLine(){if(this.lineStart>-1)return;let{from:e,to:t}=this.oracle.doc.lineAt(this.pos);this.lineStart=e,this.lineEnd=t,this.writtenTo<e&&((this.writtenTo<e-1||this.nodes[this.nodes.length-1]==null)&&this.nodes.push(this.blankContent(this.writtenTo,e-1)),this.nodes.push(null)),this.pos>e&&this.nodes.push(new Hl(this.pos-e,-1,0)),this.writtenTo=this.pos}blankContent(e,t){let n=new Ul(t-e);return this.oracle.doc.lineAt(e).to==t&&(n.flags|=4),n}ensureLine(){this.enterLine();let e=this.nodes.length?this.nodes[this.nodes.length-1]:null;if(e instanceof Hl)return e;let t=new Hl(0,-1,0);return this.nodes.push(t),t}addBlock(e){this.enterLine();let t=e.deco;t&&t.startSide>0&&!this.isCovered&&this.ensureLine(),this.nodes.push(e),this.writtenTo=this.pos+=e.length,t&&t.endSide>0&&(this.covering=e)}addLineDeco(e,t,n){let r=this.ensureLine();r.length+=n,r.collapsed+=n,r.widgetHeight=Math.max(r.widgetHeight,e),r.breaks+=t,this.writtenTo=this.pos+=n}finish(e){let t=this.nodes.length==0?null:this.nodes[this.nodes.length-1];this.lineStart>-1&&!(t instanceof Hl)&&!this.isCovered?this.nodes.push(new Hl(0,-1,0)):(this.writtenTo<this.pos||t==null)&&this.nodes.push(this.blankContent(this.writtenTo,this.pos));let n=e;for(let e of this.nodes)e instanceof Hl&&e.updateHeight(this.oracle,n),n+=e?e.length:1;return this.nodes}static build(t,n,r,i){let a=new e(r,t);return U.spans(n,r,i,a,0),a.finish(r)}};function Jl(e,t,n){let r=new Yl;return U.compare(e,t,n,r,0),r.changes}var Yl=class{constructor(){this.changes=[]}compareRange(){}comparePoint(e,t,n,r){(e<t||n&&n.heightRelevant||r&&r.heightRelevant)&&Qa(e,t,this.changes,5)}};function Xl(e,t){let n=e.getBoundingClientRect(),r=e.ownerDocument,i=r.defaultView||window,a=Math.max(0,n.left),o=Math.min(i.innerWidth,n.right),s=Math.max(0,n.top),c=Math.min(i.innerHeight,n.bottom);for(let t=e.parentNode;t&&t!=r.body;)if(eo(t)){let n=window.getComputedStyle(t);if((t.scrollHeight>t.clientHeight||t.scrollWidth>t.clientWidth)&&n.overflow!=`visible`){let n=t.getBoundingClientRect();a=Math.max(a,n.left),o=Math.min(o,n.right),s=Math.max(s,n.top),c=Math.min(t==e.parentNode?i.innerHeight:c,n.bottom)}t=n.position==`absolute`||n.position==`fixed`?t.offsetParent:t.parentNode}else if(t.nodeType==11)t=t.host;else break;return{left:a-n.left,right:Math.max(a,o)-n.left,top:s-(n.top+t),bottom:Math.max(s,c)-(n.top+t)}}function Zl(e){let t=e.getBoundingClientRect(),n=e.ownerDocument.defaultView||window;return t.left<n.innerWidth&&t.right>0&&t.top<n.innerHeight&&t.bottom>0}function Ql(e,t){let n=e.getBoundingClientRect();return{left:0,right:n.right-n.left,top:t,bottom:n.bottom-(n.top+t)}}var $l=class{constructor(e,t,n,r){this.from=e,this.to=t,this.size=n,this.displaySize=r}static same(e,t){if(e.length!=t.length)return!1;for(let n=0;n<e.length;n++){let r=e[n],i=t[n];if(r.from!=i.from||r.to!=i.to||r.size!=i.size)return!1}return!0}draw(e,t){return K.replace({widget:new eu(this.displaySize*(t?e.scaleY:e.scaleX),t)}).range(this.from,this.to)}},eu=class extends Ga{constructor(e,t){super(),this.size=e,this.vertical=t}eq(e){return e.size==this.size&&e.vertical==this.vertical}toDOM(){let e=document.createElement(`div`);return this.vertical?e.style.height=this.size+`px`:(e.style.width=this.size+`px`,e.style.height=`2px`,e.style.display=`inline-block`),e}get estimatedHeight(){return this.vertical?this.size:-1}},tu=class{constructor(e,t){this.view=e,this.state=t,this.pixelViewport={left:0,right:window.innerWidth,top:0,bottom:0},this.inView=!0,this.paddingTop=0,this.paddingBottom=0,this.contentDOMWidth=0,this.contentDOMHeight=0,this.editorHeight=0,this.editorWidth=0,this.scaleX=1,this.scaleY=1,this.scrollOffset=0,this.scrolledToBottom=!1,this.scrollAnchorPos=0,this.scrollAnchorHeight=-1,this.scaler=su,this.scrollTarget=null,this.printing=!1,this.mustMeasureContent=!0,this.defaultTextDirection=q.LTR,this.visibleRanges=[],this.mustEnforceCursorAssoc=!1;let n=t.facet(bs).some(e=>typeof e!=`function`&&e.class==`cm-lineWrapping`);this.heightOracle=new Pl(n),this.stateDeco=cu(t),this.heightMap=Rl.empty().applyChanges(this.stateDeco,z.empty,this.heightOracle.setDoc(t.doc),[new js(0,0,0,t.doc.length)]);for(let e=0;e<2&&(this.viewport=this.getViewport(0,null),this.updateForViewport());e++);this.updateViewportLines(),this.lineGaps=this.ensureLineGaps([]),this.lineGapDeco=K.set(this.lineGaps.map(e=>e.draw(this,!1))),this.scrollParent=e.scrollDOM,this.computeVisibleRanges()}updateForViewport(){let e=[this.viewport],{main:t}=this.state.selection;for(let n=0;n<=1;n++){let r=n?t.head:t.anchor;if(!e.some(({from:e,to:t})=>r>=e&&r<=t)){let{from:t,to:n}=this.lineBlockAt(r);e.push(new nu(t,n))}}return this.viewports=e.sort((e,t)=>e.from-t.from),this.updateScaler()}updateScaler(){let e=this.scaler;return this.scaler=this.heightMap.height<=7e6?su:lu.get(this.heightOracle,this.heightMap,this.viewports),e.eq(this.scaler)?0:2}updateViewportLines(){this.viewportLines=[],this.heightMap.forEachLine(this.viewport.from,this.viewport.to,this.heightOracle.setDoc(this.state.doc),0,0,e=>{this.viewportLines.push(uu(e,this.scaler))})}update(e,t=null){this.state=e.state;let n=this.stateDeco;this.stateDeco=cu(this.state);let r=e.changedRanges,i=js.extendWithRanges(r,Jl(n,this.stateDeco,e?e.changes:Jr.empty(this.state.doc.length))),a=this.heightMap.height,o=this.scrolledToBottom?null:this.scrollAnchorAt(this.scrollOffset);Nl(),this.heightMap=this.heightMap.applyChanges(this.stateDeco,e.startState.doc,this.heightOracle.setDoc(this.state.doc),i),(this.heightMap.height!=a||Ml)&&(e.flags|=2),o?(this.scrollAnchorPos=e.changes.mapPos(o.from,-1),this.scrollAnchorHeight=o.top):(this.scrollAnchorPos=-1,this.scrollAnchorHeight=a);let s=i.length?this.mapViewport(this.viewport,e.changes):this.viewport;(t&&(t.range.head<s.from||t.range.head>s.to)||!this.viewportIsAppropriate(s))&&(s=this.getViewport(0,t));let c=s.from!=this.viewport.from||s.to!=this.viewport.to;this.viewport=s,e.flags|=this.updateForViewport(),(c||!e.changes.empty||e.flags&2)&&this.updateViewportLines(),(this.lineGaps.length||this.viewport.to-this.viewport.from>4e3)&&this.updateLineGaps(this.ensureLineGaps(this.mapLineGaps(this.lineGaps,e.changes))),e.flags|=this.computeVisibleRanges(e.changes),t&&(this.scrollTarget=t),!this.mustEnforceCursorAssoc&&(e.selectionSet||e.focusChanged)&&e.view.lineWrapping&&e.state.selection.main.empty&&e.state.selection.main.assoc&&!e.state.facet(cs)&&(this.mustEnforceCursorAssoc=!0)}measure(){let{view:e}=this,t=e.contentDOM,n=window.getComputedStyle(t),r=this.heightOracle,i=n.whiteSpace;this.defaultTextDirection=n.direction==`rtl`?q.RTL:q.LTR;let a=this.heightOracle.mustRefreshForWrapping(i)||this.mustMeasureContent===`refresh`,o=t.getBoundingClientRect(),s=a||this.mustMeasureContent||this.contentDOMHeight!=o.height;this.contentDOMHeight=o.height,this.mustMeasureContent=!1;let c=0,l=0;if(o.width&&o.height){let{scaleX:e,scaleY:n}=mo(t,o);(e>.005&&Math.abs(this.scaleX-e)>.005||n>.005&&Math.abs(this.scaleY-n)>.005)&&(this.scaleX=e,this.scaleY=n,c|=16,a=s=!0)}let u=(parseInt(n.paddingTop)||0)*this.scaleY,d=(parseInt(n.paddingBottom)||0)*this.scaleY;(this.paddingTop!=u||this.paddingBottom!=d)&&(this.paddingTop=u,this.paddingBottom=d,c|=18),this.editorWidth!=e.scrollDOM.clientWidth&&(r.lineWrapping&&(s=!0),this.editorWidth=e.scrollDOM.clientWidth,c|=16);let f=go(this.view.contentDOM,!1).y;f!=this.scrollParent&&(this.scrollParent=f,this.scrollAnchorHeight=-1,this.scrollOffset=0);let p=this.getScrollOffset();this.scrollOffset!=p&&(this.scrollAnchorHeight=-1,this.scrollOffset=p),this.scrolledToBottom=Do(this.scrollParent||e.win);let m=(this.printing?Ql:Xl)(t,this.paddingTop),h=m.top-this.pixelViewport.top,g=m.bottom-this.pixelViewport.bottom;this.pixelViewport=m;let _=this.pixelViewport.bottom>this.pixelViewport.top&&this.pixelViewport.right>this.pixelViewport.left;if(_!=this.inView&&(this.inView=_,_&&(s=!0)),!this.inView&&!this.scrollTarget&&!Zl(e.dom))return 0;let v=o.width;if((this.contentDOMWidth!=v||this.editorHeight!=e.scrollDOM.clientHeight)&&(this.contentDOMWidth=o.width,this.editorHeight=e.scrollDOM.clientHeight,c|=16),s){let t=e.docView.measureVisibleLineHeights(this.viewport);if(r.mustRefreshForHeights(t)&&(a=!0),a||r.lineWrapping&&Math.abs(v-this.contentDOMWidth)>r.charWidth){let{lineHeight:n,charWidth:o,textHeight:s}=e.docView.measureTextSize();a=n>0&&r.refresh(i,n,o,s,Math.max(5,v/o),t),a&&(e.docView.minWidth=0,c|=16)}h>0&&g>0?l=Math.max(h,g):h<0&&g<0&&(l=Math.min(h,g)),Nl();for(let n of this.viewports){let i=n.from==this.viewport.from?t:e.docView.measureVisibleLineHeights(n);this.heightMap=(a?Rl.empty().applyChanges(this.stateDeco,z.empty,this.heightOracle,[new js(0,0,0,e.state.doc.length)]):this.heightMap).updateHeight(r,0,a,new Fl(n.from,i))}Ml&&(c|=2)}let y=!this.viewportIsAppropriate(this.viewport,l)||this.scrollTarget&&(this.scrollTarget.range.head<this.viewport.from||this.scrollTarget.range.head>this.viewport.to);return y&&(c&2&&(c|=this.updateScaler()),this.viewport=this.getViewport(l,this.scrollTarget),c|=this.updateForViewport()),(c&2||y)&&this.updateViewportLines(),(this.lineGaps.length||this.viewport.to-this.viewport.from>4e3)&&this.updateLineGaps(this.ensureLineGaps(a?[]:this.lineGaps,e)),c|=this.computeVisibleRanges(),this.mustEnforceCursorAssoc&&(this.mustEnforceCursorAssoc=!1,e.docView.enforceCursorAssoc()),c}get visibleTop(){return this.scaler.fromDOM(this.pixelViewport.top)}get visibleBottom(){return this.scaler.fromDOM(this.pixelViewport.bottom)}getViewport(e,t){let n=.5-Math.max(-.5,Math.min(.5,e/1e3/2)),r=this.heightMap,i=this.heightOracle,{visibleTop:a,visibleBottom:o}=this,s=new nu(r.lineAt(a-n*1e3,Y.ByHeight,i,0,0).from,r.lineAt(o+(1-n)*1e3,Y.ByHeight,i,0,0).to);if(t){let{head:e}=t.range;if(e<s.from||e>s.to){let n=Math.min(this.editorHeight,this.pixelViewport.bottom-this.pixelViewport.top),a=r.lineAt(e,Y.ByPos,i,0,0),o;o=t.y==`center`?(a.top+a.bottom)/2-n/2:t.y==`start`||t.y==`nearest`&&e<s.from?a.top:a.bottom-n,s=new nu(r.lineAt(o-500,Y.ByHeight,i,0,0).from,r.lineAt(o+n+500,Y.ByHeight,i,0,0).to)}}return s}mapViewport(e,t){let n=t.mapPos(e.from,-1),r=t.mapPos(e.to,1);return new nu(this.heightMap.lineAt(n,Y.ByPos,this.heightOracle,0,0).from,this.heightMap.lineAt(r,Y.ByPos,this.heightOracle,0,0).to)}viewportIsAppropriate({from:e,to:t},n=0){if(!this.inView)return!0;let{top:r}=this.heightMap.lineAt(e,Y.ByPos,this.heightOracle,0,0),{bottom:i}=this.heightMap.lineAt(t,Y.ByPos,this.heightOracle,0,0),{visibleTop:a,visibleBottom:o}=this;return(e==0||r<=a-Math.max(10,Math.min(-n,250)))&&(t==this.state.doc.length||i>=o+Math.max(10,Math.min(n,250)))&&r>a-2e3&&i<o+2e3}mapLineGaps(e,t){if(!e.length||t.empty)return e;let n=[];for(let r of e)t.touchesRange(r.from,r.to)||n.push(new $l(t.mapPos(r.from),t.mapPos(r.to),r.size,r.displaySize));return n}ensureLineGaps(e,t){let n=this.heightOracle.lineWrapping,r=n?1e4:2e3,i=r>>1,a=r<<1;if(this.defaultTextDirection!=q.LTR&&!n)return[];let o=[],s=(r,a,c,l)=>{if(a-r<i)return;let u=this.state.selection.main,d=[u.from];u.empty||d.push(u.to);for(let e of d)if(e>r&&e<a){s(r,e-10,c,l),s(e+10,a,c,l);return}let f=ou(e,e=>e.from>=c.from&&e.to<=c.to&&Math.abs(e.from-r)<i&&Math.abs(e.to-a)<i&&!d.some(t=>e.from<t&&e.to>t));if(!f){if(a<c.to&&t&&n&&t.visibleRanges.some(e=>e.from<=a&&e.to>=a)){let e=t.moveToLineBoundary(B.cursor(a),!1,!0).head;e>r&&(a=e)}let e=this.gapSize(c,r,a,l);f=new $l(r,a,e,n||e<2e6?e:2e6)}o.push(f)},c=t=>{if(t.length<a||t.type!=Ka.Text)return;let i=ru(t.from,t.to,this.stateDeco);if(i.total<a)return;let o=this.scrollTarget?this.scrollTarget.range.head:null,c,l;if(n){let e=r/this.heightOracle.lineLength*this.heightOracle.lineHeight,n,a;if(o!=null){let r=au(i,o),s=((this.visibleBottom-this.visibleTop)/2+e)/t.height;n=r-s,a=r+s}else n=(this.visibleTop-t.top-e)/t.height,a=(this.visibleBottom-t.top+e)/t.height;c=iu(i,n),l=iu(i,a)}else{let n=i.total*this.heightOracle.charWidth,a=r*this.heightOracle.charWidth,s=0;if(n>2e6)for(let n of e)n.from>=t.from&&n.from<t.to&&n.size!=n.displaySize&&n.from*this.heightOracle.charWidth+s<this.pixelViewport.left&&(s=n.size-n.displaySize);let u=this.pixelViewport.left+s,d=this.pixelViewport.right+s,f,p;if(o!=null){let e=au(i,o),t=((d-u)/2+a)/n;f=e-t,p=e+t}else f=(u-a)/n,p=(d+a)/n;c=iu(i,f),l=iu(i,p)}c>t.from&&s(t.from,c,t,i),l<t.to&&s(l,t.to,t,i)};for(let e of this.viewportLines)Array.isArray(e.type)?e.type.forEach(c):c(e);return o}gapSize(e,t,n,r){let i=au(r,n)-au(r,t);return this.heightOracle.lineWrapping?e.height*i:r.total*this.heightOracle.charWidth*i}updateLineGaps(e){$l.same(e,this.lineGaps)||(this.lineGaps=e,this.lineGapDeco=K.set(e.map(e=>e.draw(this,this.heightOracle.lineWrapping))))}computeVisibleRanges(e){let t=this.stateDeco;this.lineGaps.length&&(t=t.concat(this.lineGapDeco));let n=[];U.spans(t,this.viewport.from,this.viewport.to,{span(e,t){n.push({from:e,to:t})},point(){}},20);let r=0;if(n.length!=this.visibleRanges.length)r=12;else for(let t=0;t<n.length&&!(r&8);t++){let i=this.visibleRanges[t],a=n[t];(i.from!=a.from||i.to!=a.to)&&(r|=4,e&&e.mapPos(i.from,-1)==a.from&&e.mapPos(i.to,1)==a.to||(r|=8))}return this.visibleRanges=n,r}lineBlockAt(e){return e>=this.viewport.from&&e<=this.viewport.to&&this.viewportLines.find(t=>t.from<=e&&t.to>=e)||uu(this.heightMap.lineAt(e,Y.ByPos,this.heightOracle,0,0),this.scaler)}lineBlockAtHeight(e){return e>=this.viewportLines[0].top&&e<=this.viewportLines[this.viewportLines.length-1].bottom&&this.viewportLines.find(t=>t.top<=e&&t.bottom>=e)||uu(this.heightMap.lineAt(this.scaler.fromDOM(e),Y.ByHeight,this.heightOracle,0,0),this.scaler)}getScrollOffset(){return this.scrollParent==this.view.scrollDOM?this.scrollParent.scrollTop*this.scaleY:(this.scrollParent?this.scrollParent.getBoundingClientRect().top:0)-this.view.contentDOM.getBoundingClientRect().top}scrollAnchorAt(e){let t=this.lineBlockAtHeight(e+12-this.paddingTop);return t.from>=this.viewport.from||this.viewportLines[0].top-e>200?t:this.viewportLines[0]}elementAtHeight(e){return uu(this.heightMap.blockAt(this.scaler.fromDOM(e),this.heightOracle,0,0),this.scaler)}get docHeight(){return this.scaler.toDOM(this.heightMap.height)}get contentHeight(){return this.docHeight+this.paddingTop+this.paddingBottom}},nu=class{constructor(e,t){this.from=e,this.to=t}};function ru(e,t,n){let r=[],i=e,a=0;return U.spans(n,e,t,{span(){},point(e,t){e>i&&(r.push({from:i,to:e}),a+=e-i),i=t}},20),i<t&&(r.push({from:i,to:t}),a+=t-i),{total:a,ranges:r}}function iu({total:e,ranges:t},n){if(n<=0)return t[0].from;if(n>=1)return t[t.length-1].to;let r=Math.floor(e*n);for(let e=0;;e++){let{from:n,to:i}=t[e],a=i-n;if(r<=a)return n+r;r-=a}}function au(e,t){let n=0;for(let{from:r,to:i}of e.ranges){if(t<=i){n+=t-r;break}n+=i-r}return n/e.total}function ou(e,t){for(let n of e)if(t(n))return n}var su={toDOM(e){return e},fromDOM(e){return e},scale:1,eq(e){return e==this}};function cu(e){let t=e.facet(xs).filter(e=>typeof e!=`function`),n=e.facet(Cs).filter(e=>typeof e!=`function`);return n.length&&t.push(U.join(n)),t}var lu=class e{constructor(e,t){this.scale=e,this.viewports=t}static get(t,n,r){let i=0,a=0,o=0,s=r.map(({from:e,to:r})=>{let a=n.lineAt(e,Y.ByPos,t,0,0).top,o=n.lineAt(r,Y.ByPos,t,0,0).bottom;return i+=o-a,{from:e,to:r,top:a,bottom:o,domTop:0,domBottom:0}});if(n.height-i<10)return su;let c=(7e6-i)/(n.height-i);for(let e of s)e.domTop=o+(e.top-a)*c,o=e.domBottom=e.domTop+(e.bottom-e.top),a=e.bottom;return new e(c,s)}toDOM(e){for(let t=0,n=0,r=0;;t++){let i=t<this.viewports.length?this.viewports[t]:null;if(!i||e<i.top)return r+(e-n)*this.scale;if(e<=i.bottom)return i.domTop+(e-i.top);n=i.bottom,r=i.domBottom}}fromDOM(e){for(let t=0,n=0,r=0;;t++){let i=t<this.viewports.length?this.viewports[t]:null;if(!i||e<i.domTop)return n+(e-r)/this.scale;if(e<=i.domBottom)return i.top+(e-i.domTop);n=i.bottom,r=i.domBottom}}eq(t){return t instanceof e&&this.scale==t.scale&&this.viewports.length==t.viewports.length&&this.viewports.every((e,n)=>e.from==t.viewports[n].from&&e.to==t.viewports[n].to)}};function uu(e,t){if(t.scale==1)return e;let n=t.toDOM(e.top),r=t.toDOM(e.bottom);return new Il(e.from,e.length,n,r-n,Array.isArray(e._content)?e._content.map(e=>uu(e,t)):e._content)}var du=V.define({combine:e=>e.join(` `)}),fu=V.define({combine:e=>e.indexOf(!0)>-1}),pu=_a.newName(),mu=_a.newName(),hu=_a.newName(),gu={"&light":`.`+mu,"&dark":`.`+hu};function _u(e,t,n){return new _a(t,{finish(t){return/&/.test(t)?t.replace(/&\w*/,t=>{if(t==`&`)return e;if(!n||!n[t])throw RangeError(`Unsupported selector: ${t}`);return n[t]}):e+` `+t}})}var vu=_u(`.`+pu,{"&":{position:`relative !important`,boxSizing:`border-box`,"&.cm-focused":{outline:`1px dotted #212121`},display:`flex !important`,flexDirection:`column`},".cm-scroller":{display:`flex !important`,alignItems:`flex-start !important`,fontFamily:`monospace`,lineHeight:1.4,height:`100%`,overflowX:`auto`,position:`relative`,zIndex:0,overflowAnchor:`none`},".cm-content":{margin:0,flexGrow:2,flexShrink:0,display:`block`,whiteSpace:`pre`,wordWrap:`normal`,boxSizing:`border-box`,minHeight:`100%`,padding:`4px 0`,outline:`none`,"&[contenteditable=true]":{WebkitUserModify:`read-write-plaintext-only`}},".cm-lineWrapping":{whiteSpace_fallback:`pre-wrap`,whiteSpace:`break-spaces`,wordBreak:`break-word`,overflowWrap:`anywhere`,flexShrink:1},"&light .cm-content":{caretColor:`black`},"&dark .cm-content":{caretColor:`white`},".cm-line":{display:`block`,padding:`0 2px 0 6px`},".cm-layer":{userSelect:`none`,position:`absolute`,left:0,top:0,contain:`size style`,"& > *":{position:`absolute`}},"&light .cm-selectionBackground":{background:`#d9d9d9`},"&dark .cm-selectionBackground":{background:`#222`},"&light.cm-focused > .cm-scroller > .cm-selectionLayer .cm-selectionBackground":{background:`#d7d4f0`},"&dark.cm-focused > .cm-scroller > .cm-selectionLayer .cm-selectionBackground":{background:`#233`},".cm-cursorLayer":{pointerEvents:`none`},"&.cm-focused > .cm-scroller > .cm-cursorLayer":{animation:`steps(1) cm-blink 1.2s infinite`},"@keyframes cm-blink":{"0%":{},"50%":{opacity:0},"100%":{}},"@keyframes cm-blink2":{"0%":{},"50%":{opacity:0},"100%":{}},".cm-cursor, .cm-dropCursor":{borderLeft:`1.2px solid black`,marginLeft:`-0.6px`,pointerEvents:`none`},".cm-cursor":{display:`none`},"&dark .cm-cursor":{borderLeftColor:`#ddd`},".cm-selectionHandle":{backgroundColor:`currentColor`,width:`1.5px`},".cm-selectionHandle-start::before, .cm-selectionHandle-end::before":{content:`""`,backgroundColor:`inherit`,borderRadius:`50%`,width:`8px`,height:`8px`,position:`absolute`,left:`-3.25px`},".cm-selectionHandle-start::before":{top:`-8px`},".cm-selectionHandle-end::before":{bottom:`-8px`},".cm-dropCursor":{position:`absolute`},"&.cm-focused > .cm-scroller > .cm-cursorLayer .cm-cursor":{display:`block`},".cm-iso":{unicodeBidi:`isolate`},".cm-announced":{position:`fixed`,top:`-10000px`},"@media print":{".cm-announced":{display:`none`}},"&light .cm-activeLine":{backgroundColor:`#cceeff44`},"&dark .cm-activeLine":{backgroundColor:`#99eeff33`},"&light .cm-specialChar":{color:`red`},"&dark .cm-specialChar":{color:`#f78`},".cm-gutters":{flexShrink:0,display:`flex`,height:`100%`,boxSizing:`border-box`,zIndex:200},".cm-gutters-before":{insetInlineStart:0},".cm-gutters-after":{insetInlineEnd:0},"&light .cm-gutters":{backgroundColor:`#f5f5f5`,color:`#6c6c6c`,border:`0px solid #ddd`,"&.cm-gutters-before":{borderRightWidth:`1px`},"&.cm-gutters-after":{borderLeftWidth:`1px`}},"&dark .cm-gutters":{backgroundColor:`#333338`,color:`#ccc`},".cm-gutter":{display:`flex !important`,flexDirection:`column`,flexShrink:0,boxSizing:`border-box`,minHeight:`100%`,overflow:`hidden`},".cm-gutterElement":{boxSizing:`border-box`},".cm-lineNumbers .cm-gutterElement":{padding:`0 3px 0 5px`,minWidth:`20px`,textAlign:`right`,whiteSpace:`nowrap`},"&light .cm-activeLineGutter":{backgroundColor:`#e2f2ff`},"&dark .cm-activeLineGutter":{backgroundColor:`#222227`},".cm-panels":{boxSizing:`border-box`,position:`sticky`,left:0,right:0,zIndex:300},"&light .cm-panels":{backgroundColor:`#f5f5f5`,color:`black`},".cm-panels-top":{top:`0`},".cm-panels-bottom":{bottom:`0`},"&light .cm-panels-top":{borderBottom:`1px solid #ddd`},"&light .cm-panels-bottom":{borderTop:`1px solid #ddd`},"&dark .cm-panels":{backgroundColor:`#333338`,color:`white`},".cm-dialog":{padding:`2px 19px 4px 6px`,position:`relative`,"& label":{fontSize:`80%`}},".cm-dialog-close":{position:`absolute`,top:`3px`,right:`4px`,backgroundColor:`inherit`,border:`none`,font:`inherit`,fontSize:`14px`,padding:`0`},".cm-tab":{display:`inline-block`,overflow:`hidden`,verticalAlign:`bottom`},".cm-widgetBuffer":{verticalAlign:`baseline`,height:`1em`,width:0,display:`inline`},".cm-placeholder":{color:`#888`,display:`inline-block`,verticalAlign:`top`,userSelect:`none`},".cm-highlightSpace":{background:`radial-gradient(circle at 50% 55%, #aaa 20%, transparent 0) no-repeat`,backgroundSize:`.4em`,backgroundPosition:`calc(min(50%, 0px)) center`},".cm-highlightTab":{backgroundImage:`url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="200" height="20"><path stroke="%23888" stroke-width="1" fill="none" d="M1 10H196L190 5M190 15L196 10M197 4L197 16"/></svg>')`,backgroundSize:`auto 100%`,backgroundPosition:`right 90%`,backgroundRepeat:`no-repeat`},".cm-trailingSpace":{backgroundColor:`#ff332255`},".cm-button":{verticalAlign:`middle`,color:`inherit`,fontSize:`70%`,padding:`.2em 1em`,borderRadius:`1px`},"&light .cm-button":{backgroundImage:`linear-gradient(#eff1f5, #d9d9df)`,border:`1px solid #888`,"&:active":{backgroundImage:`linear-gradient(#b4b4b4, #d0d3d6)`}},"&dark .cm-button":{backgroundImage:`linear-gradient(#393939, #111)`,border:`1px solid #888`,"&:active":{backgroundImage:`linear-gradient(#111, #333)`}},".cm-textfield":{verticalAlign:`middle`,color:`inherit`,fontSize:`70%`,border:`1px solid silver`,padding:`.2em .5em`},"&light .cm-textfield":{backgroundColor:`white`},"&dark .cm-textfield":{border:`1px solid #555`,backgroundColor:`inherit`}},gu),yu={childList:!0,characterData:!0,subtree:!0,attributes:!0,characterDataOldValue:!0},bu=G.ie&&G.ie_version<=11,xu=class{constructor(e){this.view=e,this.active=!1,this.editContext=null,this.selectionRange=new _o,this.selectionChanged=!1,this.delayedFlush=-1,this.resizeTimeout=-1,this.queue=[],this.delayedAndroidKey=null,this.flushingAndroidKey=-1,this.lastChange=0,this.scrollTargets=[],this.intersection=null,this.resizeScroll=null,this.intersecting=!1,this.gapIntersection=null,this.gaps=[],this.printQuery=null,this.parentCheck=-1,this.dom=e.contentDOM,this.observer=new MutationObserver(t=>{for(let e of t)this.queue.push(e);(G.ie&&G.ie_version<=11||G.ios&&e.composing)&&t.some(e=>e.type==`childList`&&e.removedNodes.length||e.type==`characterData`&&e.oldValue.length>e.target.nodeValue.length)?this.flushSoon():this.flush()}),window.EditContext&&G.android&&e.constructor.EDIT_CONTEXT!==!1&&!(G.chrome&&G.chrome_version<126)&&(this.editContext=new Tu(e),e.state.facet(ms)&&(e.contentDOM.editContext=this.editContext.editContext)),bu&&(this.onCharData=e=>{this.queue.push({target:e.target,type:`characterData`,oldValue:e.prevValue}),this.flushSoon()}),this.onSelectionChange=this.onSelectionChange.bind(this),this.onResize=this.onResize.bind(this),this.onPrint=this.onPrint.bind(this),this.onScroll=this.onScroll.bind(this),window.matchMedia&&(this.printQuery=window.matchMedia(`print`)),typeof ResizeObserver==`function`&&(this.resizeScroll=new ResizeObserver(()=>{this.view.docView?.lastUpdate<Date.now()-75&&this.onResize()}),this.resizeScroll.observe(e.scrollDOM)),this.addWindowListeners(this.win=e.win),this.start(),typeof IntersectionObserver==`function`&&(this.intersection=new IntersectionObserver(e=>{this.parentCheck<0&&(this.parentCheck=setTimeout(this.listenForScroll.bind(this),1e3)),e.length>0&&e[e.length-1].intersectionRatio>0!=this.intersecting&&(this.intersecting=!this.intersecting,this.intersecting!=this.view.inView&&this.onScrollChanged(document.createEvent(`Event`)))},{threshold:[0,.001]}),this.intersection.observe(this.dom),this.gapIntersection=new IntersectionObserver(e=>{e.length>0&&e[e.length-1].intersectionRatio>0&&this.onScrollChanged(document.createEvent(`Event`))},{})),this.listenForScroll(),this.readSelectionRange()}onScrollChanged(e){this.view.inputState.runHandlers(`scroll`,e),this.intersecting&&this.view.measure()}onScroll(e){this.intersecting&&this.flush(this.pendingRecords().length>0),this.editContext&&this.view.requestMeasure(this.editContext.measureReq),this.onScrollChanged(e)}onResize(){this.resizeTimeout<0&&(this.resizeTimeout=setTimeout(()=>{this.resizeTimeout=-1,this.view.requestMeasure()},50))}onPrint(e){(e.type!=`change`&&e.type||e.matches)&&(this.view.viewState.printing=!0,this.view.measure(),setTimeout(()=>{this.view.viewState.printing=!1,this.view.requestMeasure()},500))}updateGaps(e){if(this.gapIntersection&&(e.length!=this.gaps.length||this.gaps.some((t,n)=>t!=e[n]))){this.gapIntersection.disconnect();for(let t of e)this.gapIntersection.observe(t);this.gaps=e}}onSelectionChange(e){let t=this.selectionChanged;if(!this.readSelectionRange()||this.delayedAndroidKey)return;let{view:n}=this,r=this.selectionRange;if(n.state.facet(ms)?n.root.activeElement!=this.dom:!io(this.dom,r))return;let i=r.anchorNode&&n.docView.tile.nearest(r.anchorNode);i&&i.isWidget()&&i.widget.ignoreEvent(e)?t||(this.selectionChanged=!1):(G.ie&&G.ie_version<=11||G.android&&G.chrome)&&!n.state.selection.main.empty&&r.focusNode&&oo(r.focusNode,r.focusOffset,r.anchorNode,r.anchorOffset)?this.flushSoon():this.flush(!1)}readSelectionRange(){let{view:e}=this,t=no(e.root);if(!t)return!1;let n=G.safari&&e.root.nodeType==11&&e.root.activeElement==this.dom&&wu(this.view,t)||t;if(!n||this.selectionRange.eq(n))return!1;let r=io(this.dom,n);return r&&!this.selectionChanged&&e.inputState.lastFocusTime>Date.now()-200&&e.inputState.lastTouchTime<Date.now()-300&&Eo(this.dom,n)?(this.view.inputState.lastFocusTime=0,e.docView.updateSelection(),!1):(this.selectionRange.setRange(n),r&&(this.selectionChanged=!0),!0)}setSelectionRange(e,t){this.selectionRange.set(e.node,e.offset,t.node,t.offset),this.selectionChanged=!1}clearSelectionRange(){this.selectionRange.set(null,0,null,0)}listenForScroll(){this.parentCheck=-1;let e=0,t=null;for(let n=this.dom;n;)if(eo(n))!t&&e<this.scrollTargets.length&&this.scrollTargets[e]==n?e++:t||=this.scrollTargets.slice(0,e),t&&t.push(n),n=n.assignedSlot||n.parentNode;else if(n.nodeType==11)n=n.host;else break;if(e<this.scrollTargets.length&&!t&&(t=this.scrollTargets.slice(0,e)),t){for(let e of this.scrollTargets)e.removeEventListener(`scroll`,this.onScroll);for(let e of this.scrollTargets=t)e.addEventListener(`scroll`,this.onScroll)}}ignore(e){if(!this.active)return e();try{return this.stop(),e()}finally{this.start(),this.clear()}}start(){this.active||=(this.observer.observe(this.dom,yu),bu&&this.dom.addEventListener(`DOMCharacterDataModified`,this.onCharData),!0)}stop(){this.active&&(this.active=!1,this.observer.disconnect(),bu&&this.dom.removeEventListener(`DOMCharacterDataModified`,this.onCharData))}clear(){this.processRecords(),this.queue.length=0,this.selectionChanged=!1}delayAndroidKey(e,t){if(!this.delayedAndroidKey){let e=()=>{let e=this.delayedAndroidKey;e&&(this.clearDelayedAndroidKey(),this.view.inputState.lastKeyCode=e.keyCode,this.view.inputState.lastKeyTime=Date.now(),!this.flush()&&e.force&&wo(this.dom,e.key,e.keyCode))};this.flushingAndroidKey=this.view.win.requestAnimationFrame(e)}this.delayedAndroidKey&&e!=`Enter`||(this.delayedAndroidKey={key:e,keyCode:t,force:this.lastChange<Date.now()-50||!!this.delayedAndroidKey?.force})}clearDelayedAndroidKey(){this.win.cancelAnimationFrame(this.flushingAndroidKey),this.delayedAndroidKey=null,this.flushingAndroidKey=-1}flushSoon(){this.delayedFlush<0&&(this.delayedFlush=this.view.win.requestAnimationFrame(()=>{this.delayedFlush=-1,this.flush()}))}forceFlush(){this.delayedFlush>=0&&(this.view.win.cancelAnimationFrame(this.delayedFlush),this.delayedFlush=-1),this.flush()}pendingRecords(){for(let e of this.observer.takeRecords())this.queue.push(e);return this.queue}processRecords(){let e=this.pendingRecords();e.length&&(this.queue=[]);let t=-1,n=-1,r=!1;for(let i of e){let e=this.readMutation(i);e&&(e.typeOver&&(r=!0),t==-1?{from:t,to:n}=e:(t=Math.min(e.from,t),n=Math.max(e.to,n)))}return{from:t,to:n,typeOver:r}}readChange(){let{from:e,to:t,typeOver:n}=this.processRecords(),r=this.selectionChanged&&io(this.dom,this.selectionRange);if(e<0&&!r)return null;e>-1&&(this.lastChange=Date.now()),this.view.inputState.lastFocusTime=0,this.selectionChanged=!1;let i=new Rc(this.view,e,t,n);return this.view.docView.domChanged={newSel:i.newSel?i.newSel.main:null},i}flush(e=!0){if(this.delayedFlush>=0||this.delayedAndroidKey)return!1;e&&this.readSelectionRange();let t=this.selectionChanged,n=this.readChange();if(!n)return this.view.requestMeasure(),!1;let r=this.view.state,i=Bc(this.view,n);return this.view.state==r&&(n.domChanged||t)&&this.view.update([]),i}readMutation(e){let t=this.view.docView.tile.nearest(e.target);if(!t||t.isWidget())return null;if(t.markDirty(e.type==`attributes`),e.type==`childList`){let n=Su(t,e.previousSibling||e.target.previousSibling,-1),r=Su(t,e.nextSibling||e.target.nextSibling,1);return{from:n?t.posAfter(n):t.posAtStart,to:r?t.posBefore(r):t.posAtEnd,typeOver:!1}}return e.type==`characterData`?{from:t.posAtStart,to:t.posAtEnd,typeOver:e.target.nodeValue==e.oldValue}:null}setWindow(e){e!=this.win&&(this.removeWindowListeners(this.win),this.win=e,this.addWindowListeners(this.win))}addWindowListeners(e){e.addEventListener(`resize`,this.onResize),this.printQuery?this.printQuery.addEventListener?this.printQuery.addEventListener(`change`,this.onPrint):this.printQuery.addListener(this.onPrint):e.addEventListener(`beforeprint`,this.onPrint),e.addEventListener(`scroll`,this.onScroll),e.document.addEventListener(`selectionchange`,this.onSelectionChange)}removeWindowListeners(e){e.removeEventListener(`scroll`,this.onScroll),e.removeEventListener(`resize`,this.onResize),this.printQuery?this.printQuery.removeEventListener?this.printQuery.removeEventListener(`change`,this.onPrint):this.printQuery.removeListener(this.onPrint):e.removeEventListener(`beforeprint`,this.onPrint),e.document.removeEventListener(`selectionchange`,this.onSelectionChange)}update(e){this.editContext&&(this.editContext.update(e),e.startState.facet(ms)!=e.state.facet(ms)&&(e.view.contentDOM.editContext=e.state.facet(ms)?this.editContext.editContext:null))}destroy(){var e,t,n;this.stop(),(e=this.intersection)==null||e.disconnect(),(t=this.gapIntersection)==null||t.disconnect(),(n=this.resizeScroll)==null||n.disconnect();for(let e of this.scrollTargets)e.removeEventListener(`scroll`,this.onScroll);this.removeWindowListeners(this.win),clearTimeout(this.parentCheck),clearTimeout(this.resizeTimeout),this.win.cancelAnimationFrame(this.delayedFlush),this.win.cancelAnimationFrame(this.flushingAndroidKey),this.editContext&&(this.view.contentDOM.editContext=null,this.editContext.destroy())}};function Su(e,t,n){for(;t;){let r=Ps.get(t);if(r&&r.parent==e)return r;let i=t.parentNode;t=i==e.dom?n>0?t.nextSibling:t.previousSibling:i}return null}function Cu(e,t){let n=t.startContainer,r=t.startOffset,i=t.endContainer,a=t.endOffset,o=e.docView.domAtPos(e.state.selection.main.anchor,1);return oo(o.node,o.offset,i,a)&&([n,r,i,a]=[i,a,n,r]),{anchorNode:n,anchorOffset:r,focusNode:i,focusOffset:a}}function wu(e,t){if(t.getComposedRanges){let n=t.getComposedRanges(e.root)[0];if(n)return Cu(e,n)}let n=null;function r(e){e.preventDefault(),e.stopImmediatePropagation(),n=e.getTargetRanges()[0]}return e.contentDOM.addEventListener(`beforeinput`,r,!0),e.dom.ownerDocument.execCommand(`indent`),e.contentDOM.removeEventListener(`beforeinput`,r,!0),n?Cu(e,n):null}var Tu=class{constructor(e){this.from=0,this.to=0,this.pendingContextChange=null,this.handlers=Object.create(null),this.composing=null,this.resetRange(e.state);let t=this.editContext=new window.EditContext({text:e.state.doc.sliceString(this.from,this.to),selectionStart:this.toContextPos(Math.max(this.from,Math.min(this.to,e.state.selection.main.anchor))),selectionEnd:this.toContextPos(e.state.selection.main.head)});this.handlers.textupdate=n=>{let r=e.state.selection.main,{anchor:i,head:a}=r,o=this.toEditorPos(n.updateRangeStart),s=this.toEditorPos(n.updateRangeEnd);e.inputState.composing>=0&&!this.composing&&(this.composing={contextBase:n.updateRangeStart,editorBase:o,drifted:!1});let c=s-o>n.text.length;o==this.from&&i<this.from?o=i:s==this.to&&i>this.to&&(s=i);let l=Uc(e.state.sliceDoc(o,s),n.text,(c?r.from:r.to)-o,c?`end`:null);if(!l){let t=B.single(this.toEditorPos(n.selectionStart),this.toEditorPos(n.selectionEnd));Kc(t,r)||e.dispatch({selection:t,userEvent:`select`});return}let u={from:l.from+o,to:l.toA+o,insert:z.of(n.text.slice(l.from,l.toB).split(`
`))};if((G.mac||G.android)&&u.from==a-1&&/^\. ?$/.test(n.text)&&e.contentDOM.getAttribute(`autocorrect`)==`off`&&(u={from:o,to:s,insert:z.of([n.text.replace(`.`,` `)])}),this.pendingContextChange=u,!e.state.readOnly){let t=this.to-this.from+(u.to-u.from+u.insert.length);Vc(e,u,B.single(this.toEditorPos(n.selectionStart,t),this.toEditorPos(n.selectionEnd,t)))}this.pendingContextChange&&(this.revertPending(e.state),this.setSelection(e.state)),u.from<u.to&&!u.insert.length&&e.inputState.composing>=0&&!/[\\p{Alphabetic}\\p{Number}_]/.test(t.text.slice(Math.max(0,n.updateRangeStart-1),Math.min(t.text.length,n.updateRangeStart+1)))&&this.handlers.compositionend(n)},this.handlers.characterboundsupdate=n=>{let r=[],i=null;for(let t=this.toEditorPos(n.rangeStart),a=this.toEditorPos(n.rangeEnd);t<a;t++){let n=e.coordsForChar(t);i=n&&new DOMRect(n.left,n.top,n.right-n.left,n.bottom-n.top)||i||new DOMRect,r.push(i)}t.updateCharacterBounds(n.rangeStart,r)},this.handlers.textformatupdate=t=>{let n=[];for(let e of t.getTextFormats()){let t=e.underlineStyle,r=e.underlineThickness;if(!/none/i.test(t)&&!/none/i.test(r)){let i=this.toEditorPos(e.rangeStart),a=this.toEditorPos(e.rangeEnd);if(i<a){let e=`text-decoration: underline ${/^[a-z]/.test(t)?t+` `:t==`Dashed`?`dashed `:t==`Squiggle`?`wavy `:``}${/thin/i.test(r)?1:2}px`;n.push(K.mark({attributes:{style:e}}).range(i,a))}}}e.dispatch({effects:fs.of(K.set(n))})},this.handlers.compositionstart=()=>{e.inputState.composing<0&&(e.inputState.composing=0,e.inputState.compositionFirstChange=!0)},this.handlers.compositionend=()=>{if(e.inputState.composing=-1,e.inputState.compositionFirstChange=null,this.composing){let{drifted:t}=this.composing;this.composing=null,t&&this.reset(e.state)}};for(let e in this.handlers)t.addEventListener(e,this.handlers[e]);this.measureReq={read:e=>{let t=no(e.root);t&&t.rangeCount&&this.editContext.updateSelectionBounds(t.getRangeAt(0).getBoundingClientRect())}}}applyEdits(e){let t=0,n=!1,r=this.pendingContextChange;return e.changes.iterChanges((i,a,o,s,c)=>{if(n)return;let l=c.length-(a-i);if(r&&a>=r.to){if(r.from==i&&r.to==a&&r.insert.eq(c)){r=this.pendingContextChange=null,t+=l,this.to+=l;return}r=null,this.revertPending(e.state)}if(i+=t,a+=t,a<=this.from)this.from+=l,this.to+=l;else if(i<this.to){if(i<this.from||a>this.to||this.to-this.from+c.length>3e4){n=!0;return}this.editContext.updateText(this.toContextPos(i),this.toContextPos(a),c.toString()),this.to+=l}t+=l}),r&&!n&&this.revertPending(e.state),!n}update(e){let t=this.pendingContextChange,n=e.startState.selection.main;this.composing&&(this.composing.drifted||!e.changes.touchesRange(n.from,n.to)&&e.transactions.some(e=>!e.isUserEvent(`input.type`)&&e.changes.touchesRange(this.from,this.to)))?(this.composing.drifted=!0,this.composing.editorBase=e.changes.mapPos(this.composing.editorBase)):!this.applyEdits(e)||!this.rangeIsValid(e.state)?(this.pendingContextChange=null,this.reset(e.state)):(e.docChanged||e.selectionSet||t)&&this.setSelection(e.state),(e.geometryChanged||e.docChanged||e.selectionSet)&&e.view.requestMeasure(this.measureReq)}resetRange(e){let{head:t}=e.selection.main;this.from=Math.max(0,t-1e4),this.to=Math.min(e.doc.length,t+1e4)}reset(e){this.resetRange(e),this.editContext.updateText(0,this.editContext.text.length,e.doc.sliceString(this.from,this.to)),this.setSelection(e)}revertPending(e){let t=this.pendingContextChange;this.pendingContextChange=null,this.editContext.updateText(this.toContextPos(t.from),this.toContextPos(t.from+t.insert.length),e.doc.sliceString(t.from,t.to))}setSelection(e){let{main:t}=e.selection,n=this.toContextPos(Math.max(this.from,Math.min(this.to,t.anchor))),r=this.toContextPos(t.head);(this.editContext.selectionStart!=n||this.editContext.selectionEnd!=r)&&this.editContext.updateSelection(n,r)}rangeIsValid(e){let{head:t}=e.selection.main;return!(this.from>0&&t-this.from<500||this.to<e.doc.length&&this.to-t<500||this.to-this.from>3e4)}toEditorPos(e,t=this.to-this.from){e=Math.min(e,t);let n=this.composing;return n&&n.drifted?n.editorBase+(e-n.contextBase):e+this.from}toContextPos(e){let t=this.composing;return t&&t.drifted?t.contextBase+(e-t.editorBase):e-this.from}destroy(){for(let e in this.handlers)this.editContext.removeEventListener(e,this.handlers[e])}},X=class e{get state(){return this.viewState.state}get viewport(){return this.viewState.viewport}get visibleRanges(){return this.viewState.visibleRanges}get inView(){return this.viewState.inView}get composing(){return!!this.inputState&&this.inputState.composing>0}get compositionStarted(){return!!this.inputState&&this.inputState.composing>=0}get root(){return this._root}get win(){return this.dom.ownerDocument.defaultView||window}constructor(e={}){this.plugins=[],this.pluginMap=new Map,this.editorAttrs={},this.contentAttrs={},this.bidiCache=[],this.destroyed=!1,this.updateState=2,this.measureScheduled=-1,this.measureRequests=[],this.clearAnnouncement=-1,this.contentDOM=document.createElement(`div`),this.scrollDOM=document.createElement(`div`),this.scrollDOM.tabIndex=-1,this.scrollDOM.className=`cm-scroller`,this.scrollDOM.appendChild(this.contentDOM),this.announceDOM=document.createElement(`div`),this.announceDOM.className=`cm-announced`,this.announceDOM.setAttribute(`aria-live`,`polite`),this.dom=document.createElement(`div`),this.dom.appendChild(this.announceDOM),this.dom.appendChild(this.scrollDOM),e.parent&&e.parent.appendChild(this.dom);let{dispatch:t}=e;this.dispatchTransactions=e.dispatchTransactions||t&&(e=>e.forEach(e=>t(e,this)))||(e=>this.update(e)),this.dispatch=this.dispatch.bind(this),this._root=e.root||To(e.parent)||document,this.viewState=new tu(this,e.state||Gi.create(e)),e.scrollTo&&e.scrollTo.is(ds)&&(this.viewState.scrollTarget=e.scrollTo.value.clip(this.viewState.state)),this.plugins=this.state.facet(gs).map(e=>new vs(e));for(let e of this.plugins)e.update(this);this.observer=new xu(this),this.inputState=new qc(this),this.inputState.ensureHandlers(this.plugins),this.docView=new sc(this),this.mountStyles(),this.updateAttrs(),this.updateState=0,this.requestMeasure(),document.fonts?.ready&&document.fonts.ready.then(()=>{this.viewState.mustMeasureContent=`refresh`,this.requestMeasure()})}dispatch(...e){let t=e.length==1&&e[0]instanceof ji?e:e.length==1&&Array.isArray(e[0])?e[0]:[this.state.update(...e)];this.dispatchTransactions(t,this)}update(t){if(this.updateState!=0)throw Error(`Calls to EditorView.update are not allowed while an update is in progress`);let n=!1,r=!1,i,a=this.state;for(let e of t){if(e.startState!=a)throw RangeError(`Trying to update state with a transaction that doesn't start from the previous state.`);a=e.state}if(this.destroyed){this.viewState.state=a;return}let o=this.hasFocus,s=0,c=null;t.some(e=>e.annotation(El))?(this.inputState.notifiedFocused=o,s=1):o!=this.inputState.notifiedFocused&&(this.inputState.notifiedFocused=o,c=Dl(a,o),c||(s=1));let l=this.observer.delayedAndroidKey,u=null;if(l?(this.observer.clearDelayedAndroidKey(),u=this.observer.readChange(),(u&&!this.state.doc.eq(a.doc)||!this.state.selection.eq(a.selection))&&(u=null)):this.observer.clear(),a.facet(Gi.phrases)!=this.state.facet(Gi.phrases))return this.setState(a);i=Ms.create(this,a,t),i.flags|=s;let d=this.viewState.scrollTarget;try{this.updateState=2;for(let n of t){if(d&&=d.map(n.changes),n.scrollIntoView){let{main:t}=n.state.selection,{x:r,y:i}=this.state.facet(e.cursorScrollMargin);d=new us(t.empty?t:B.cursor(t.head,t.head>t.anchor?-1:1),`nearest`,`nearest`,i,r)}for(let e of n.effects)e.is(ds)&&(d=e.value.clip(this.state))}this.viewState.update(i,d),this.bidiCache=Ou.update(this.bidiCache,i.changes),i.empty||(this.updatePlugins(i),this.inputState.update(i)),n=this.docView.update(i),this.state.facet(As)!=this.styleModules&&this.mountStyles(),r=this.updateAttrs(),this.showAnnouncements(t),this.docView.updateSelection(n,t.some(e=>e.isUserEvent(`select.pointer`)))}finally{this.updateState=0}if(i.startState.facet(du)!=i.state.facet(du)&&(this.viewState.mustMeasureContent=!0),(n||r||d||this.viewState.mustEnforceCursorAssoc||this.viewState.mustMeasureContent)&&this.requestMeasure(),n&&this.docViewUpdate(),!i.empty)for(let e of this.state.facet(ns))try{e(i)}catch(e){ps(this.state,e,`update listener`)}(c||u)&&Promise.resolve().then(()=>{c&&this.state==c.startState&&this.dispatch(c),u&&!Bc(this,u)&&l.force&&wo(this.contentDOM,l.key,l.keyCode)})}setState(e){if(this.updateState!=0)throw Error(`Calls to EditorView.setState are not allowed while an update is in progress`);if(this.destroyed){this.viewState.state=e;return}this.updateState=2;let t=this.hasFocus;try{for(let e of this.plugins)e.destroy(this);this.viewState=new tu(this,e),this.plugins=e.facet(gs).map(e=>new vs(e)),this.pluginMap.clear();for(let e of this.plugins)e.update(this);this.docView.destroy(),this.docView=new sc(this),this.inputState.ensureHandlers(this.plugins),this.mountStyles(),this.updateAttrs(),this.bidiCache=[]}finally{this.updateState=0}t&&this.focus(),this.requestMeasure()}updatePlugins(e){let t=e.startState.facet(gs),n=e.state.facet(gs);if(t!=n){let r=[];for(let i of n){let n=t.indexOf(i);if(n<0)r.push(new vs(i));else{let t=this.plugins[n];t.mustUpdate=e,r.push(t)}}for(let t of this.plugins)t.mustUpdate!=e&&t.destroy(this);this.plugins=r,this.pluginMap.clear()}else for(let t of this.plugins)t.mustUpdate=e;for(let e=0;e<this.plugins.length;e++)this.plugins[e].update(this);t!=n&&this.inputState.ensureHandlers(this.plugins)}docViewUpdate(){for(let e of this.plugins){let t=e.value;if(t&&t.docViewUpdate)try{t.docViewUpdate(this)}catch(e){ps(this.state,e,`doc view update listener`)}}}measure(e=!0){if(this.destroyed)return;if(this.measureScheduled>-1&&this.win.cancelAnimationFrame(this.measureScheduled),this.observer.delayedAndroidKey){this.measureScheduled=-1,this.requestMeasure();return}this.measureScheduled=0,e&&this.observer.forceFlush();let t=null,n=this.viewState.scrollParent,r=this.viewState.getScrollOffset(),{scrollAnchorPos:i,scrollAnchorHeight:a,scaleY:o}=this.viewState;Math.abs(r-this.viewState.scrollOffset)>1&&(a=-1),this.viewState.scrollAnchorHeight=-1;try{for(let e=0;;e++){if(a<0){if(Do(n||this.win))i=-1,a=this.viewState.heightMap.height/this.viewState.scaleY;else{let e=this.viewState.scrollAnchorAt(r);i=e.from,a=e.top}o=this.viewState.scaleY}this.updateState=1;let s=this.viewState.measure();if(!s&&!this.measureRequests.length&&this.viewState.scrollTarget==null)break;if(e>5){console.warn(this.measureRequests.length?`Measure loop restarted more than 5 times`:`Viewport failed to stabilize`);break}let c=[];s&4||([this.measureRequests,c]=[c,this.measureRequests]);let l=c.map(e=>{try{return e.read(this)}catch(e){return ps(this.state,e),Du}}),u=Ms.create(this,this.state,[]),d=!1;u.flags|=s,t?t.flags|=s:t=u,this.updateState=2,u.empty||(this.updatePlugins(u),this.inputState.update(u),this.updateAttrs(),d=this.docView.update(u),d&&this.docViewUpdate());for(let e=0;e<c.length;e++)if(l[e]!=Du)try{let t=c[e];t.write&&t.write(l[e],this)}catch(e){ps(this.state,e)}if(d&&this.docView.updateSelection(!0),!u.viewportChanged&&this.measureRequests.length==0){if(this.viewState.editorHeight){if(this.viewState.scrollTarget){this.docView.scrollIntoView(this.viewState.scrollTarget),this.viewState.scrollTarget=null,a=-1;continue}{let e=(i<0?this.viewState.heightMap.height:this.viewState.lineBlockAt(i).top)/this.viewState.scaleY-a/o;if((e>1||e<-1)&&!(G.ios&&this.inputState.lastIOSMomentumScroll>Date.now()-100)&&(n==this.scrollDOM||this.hasFocus||Math.max(this.inputState.lastWheelEvent,this.inputState.lastTouchTime)>Date.now()-100)){r+=e,n?i<0?n.scrollTop=n.scrollHeight:n.scrollTop+=e:this.win.scrollBy(0,e),a=-1;continue}}}break}}}finally{this.updateState=0,this.measureScheduled=-1}if(t&&!t.empty)for(let e of this.state.facet(ns))e(t)}get themeClasses(){return pu+` `+(this.state.facet(fu)?hu:mu)+` `+this.state.facet(du)}updateAttrs(){let e=ku(this,ys,{class:`cm-editor`+(this.hasFocus?` cm-focused `:` `)+this.themeClasses}),t={spellcheck:`false`,autocorrect:`off`,autocapitalize:`off`,writingsuggestions:`false`,translate:`no`,contenteditable:this.state.facet(ms)?`true`:`false`,class:`cm-content`,style:`${G.tabSize}: ${this.state.tabSize}`,role:`textbox`,"aria-multiline":`true`};this.state.readOnly&&(t[`aria-readonly`]=`true`),ku(this,bs,t);let n=this.observer.ignore(()=>{let n=Ua(this.contentDOM,this.contentAttrs,t),r=Ua(this.dom,this.editorAttrs,e);return n||r});return this.editorAttrs=e,this.contentAttrs=t,n}showAnnouncements(t){let n=!0;for(let r of t)for(let t of r.effects)if(t.is(e.announce)){n&&=(this.announceDOM.textContent=``,this.win.clearTimeout(this.clearAnnouncement),this.clearAnnouncement=this.win.setTimeout(()=>{this.announceDOM.textContent=`\xA0`},200),!1);let e=this.announceDOM.appendChild(document.createElement(`div`));e.textContent=t.value}}mountStyles(){this.styleModules=this.state.facet(As);let t=this.state.facet(e.cspNonce);_a.mount(this.root,this.styleModules.concat(vu).reverse(),t?{nonce:t}:void 0)}readMeasured(){if(this.updateState==2)throw Error(`Reading the editor layout isn't allowed during an update`);this.updateState==0&&this.measureScheduled>-1&&this.measure(!1)}requestMeasure(e){if(this.measureScheduled<0&&(this.measureScheduled=this.win.requestAnimationFrame(()=>this.measure())),e){if(this.measureRequests.indexOf(e)>-1)return;if(e.key!=null){for(let t=0;t<this.measureRequests.length;t++)if(this.measureRequests[t].key===e.key){this.measureRequests[t]=e;return}}this.measureRequests.push(e)}}plugin(e){let t=this.pluginMap.get(e);return(t===void 0||t&&t.plugin!=e)&&this.pluginMap.set(e,t=this.plugins.find(t=>t.plugin==e)||null),t&&t.update(this).value}get documentTop(){return this.contentDOM.getBoundingClientRect().top+this.viewState.paddingTop}get documentPadding(){return{top:this.viewState.paddingTop,bottom:this.viewState.paddingBottom}}get scaleX(){return this.viewState.scaleX}get scaleY(){return this.viewState.scaleY}elementAtHeight(e){return this.readMeasured(),this.viewState.elementAtHeight(e)}lineBlockAtHeight(e){return this.readMeasured(),this.viewState.lineBlockAtHeight(e)}get viewportLineBlocks(){return this.viewState.viewportLines}lineBlockAt(e){return this.viewState.lineBlockAt(e)}get contentHeight(){return this.viewState.contentHeight}moveByChar(e,t,n){return kc(this,e,wc(this,e,t,n))}moveByGroup(e,t){return kc(this,e,wc(this,e,t,t=>Tc(this,e.head,t)))}visualLineSide(e,t){return t?B.cursor(e.to,1):B.cursor(e.from,-1)}moveToLineBoundary(e,t,n=!0){return Cc(this,e,t,n)}moveVertically(e,t,n){return kc(this,e,Ec(this,e,t,n))}domAtPos(e,t=1){return this.docView.domAtPos(e,t)}posAtDOM(e,t=0){return this.docView.posFromDOM(e,t)}posAtCoords(e,t=!0){this.readMeasured();let n=jc(this,e,t);return n&&n.pos}posAndSideAtCoords(e,t=!0){return this.readMeasured(),jc(this,e,t)}coordsAtPos(e,t=1){this.readMeasured();let n=this.state.doc.lineAt(e),r=this.bidiSpans(n),i=r[Bo.find(r,e-n.from,-1,t)];return n.length&&(e==n.from&&t<0||e==n.to&&t>0)&&i.dir!=this.textDirectionAt(n.from)&&(e==n.to?(e=n.from+i.from,t=1):(e=n.from+i.to,t=-1)),this.docView.coordsAt(e,t,i.dir==q.RTL)}coordsForChar(e){return this.readMeasured(),this.docView.coordsForChar(e)}get defaultCharacterWidth(){return this.viewState.heightOracle.charWidth}get defaultLineHeight(){return this.viewState.heightOracle.lineHeight}get textDirection(){return this.viewState.defaultTextDirection}textDirectionAt(e){return!this.state.facet(ss)||e<this.viewport.from||e>this.viewport.to?this.textDirection:(this.readMeasured(),this.docView.textDirectionAt(e))}get lineWrapping(){return this.viewState.heightOracle.lineWrapping}bidiSpans(e){if(e.length>Eu)return Jo(e.length);let t=this.textDirectionAt(e.from),n;for(let r of this.bidiCache)if(r.from==e.from&&r.dir==t&&(r.fresh||Vo(r.isolates,n=Es(this,e))))return r.order;n||=Es(this,e);let r=qo(e.text,t,n);return this.bidiCache.push(new Ou(e.from,e.to,t,n,!0,r)),r}get hasFocus(){return(this.dom.ownerDocument.hasFocus()||G.safari&&this.inputState?.lastContextMenu>Date.now()-3e4)&&this.root.activeElement==this.contentDOM}focus(){this.observer.ignore(()=>{xo(this.contentDOM),this.docView.updateSelection()})}setRoot(e){this._root!=e&&(this._root=e,this.observer.setWindow((e.nodeType==9?e:e.ownerDocument).defaultView||window),this.mountStyles())}destroy(){this.root.activeElement==this.contentDOM&&this.contentDOM.blur();for(let e of this.plugins)e.destroy(this);this.plugins=[],this.inputState.destroy(),this.docView.destroy(),this.dom.remove(),this.observer.destroy(),this.win.clearTimeout(this.clearAnnouncement),this.measureScheduled>-1&&this.win.cancelAnimationFrame(this.measureScheduled),this.destroyed=!0}static scrollIntoView(e,t={}){return ds.of(new us(typeof e==`number`?B.cursor(e):e,t.y??`nearest`,t.x??`nearest`,t.yMargin??5,t.xMargin??5))}scrollSnapshot(){let{scrollTop:e,scrollLeft:t}=this.scrollDOM,n=this.viewState.scrollAnchorAt(e);return ds.of(new us(B.cursor(n.from),`start`,`start`,n.top-e,t,!0))}setTabFocusMode(e){e==null?this.inputState.tabFocusMode=this.inputState.tabFocusMode<0?0:-1:typeof e==`boolean`?this.inputState.tabFocusMode=e?0:-1:this.inputState.tabFocusMode!=0&&(this.inputState.tabFocusMode=Date.now()+e)}static domEventHandlers(e){return _s.define(()=>({}),{eventHandlers:e})}static domEventObservers(e){return _s.define(()=>({}),{eventObservers:e})}static theme(e,t){let n=_a.newName(),r=[du.of(n),As.of(_u(`.${n}`,e))];return t&&t.dark&&r.push(fu.of(!0)),r}static baseTheme(e){return pi.lowest(As.of(_u(`.`+pu,e,gu)))}static findFromDOM(e){let t=e.querySelector(`.cm-content`);return(t&&Ps.get(t)||Ps.get(e))?.root?.view||null}};X.styleModule=As,X.inputHandler=rs,X.clipboardInputFilter=as,X.clipboardOutputFilter=os,X.scrollHandler=ls,X.focusChangeEffect=is,X.perLineTextDirection=ss,X.exceptionSink=ts,X.updateListener=ns,X.editable=ms,X.mouseSelectionStyle=es,X.dragMovesSelection=$o,X.clickAddsSelectionRange=Qo,X.decorations=xs,X.blockWrappers=Ss,X.outerDecorations=Cs,X.atomicRanges=ws,X.bidiIsolatedRanges=Ts,X.cursorScrollMargin=V.define({combine:e=>{let t=5,n=5;for(let r of e)typeof r==`number`?t=n=r:{x:t,y:n}=r;return{x:t,y:n}}}),X.scrollMargins=Os,X.darkTheme=fu,X.cspNonce=V.define({combine:e=>e.length?e[0]:``}),X.contentAttributes=bs,X.editorAttributes=ys,X.lineWrapping=X.contentAttributes.of({class:`cm-lineWrapping`}),X.announce=H.define();var Eu=4096,Du={},Ou=class e{constructor(e,t,n,r,i,a){this.from=e,this.to=t,this.dir=n,this.isolates=r,this.fresh=i,this.order=a}static update(t,n){if(n.empty&&!t.some(e=>e.fresh))return t;let r=[],i=t.length?t[t.length-1].dir:q.LTR;for(let a=Math.max(0,t.length-10);a<t.length;a++){let o=t[a];o.dir==i&&!n.touchesRange(o.from,o.to)&&r.push(new e(n.mapPos(o.from,1),n.mapPos(o.to,-1),o.dir,o.isolates,!1,o.order))}return r}};function ku(e,t,n){for(let r=e.state.facet(t),i=r.length-1;i>=0;i--){let t=r[i],a=typeof t==`function`?t(e):t;a&&za(a,n)}return n}var Au=G.mac?`mac`:G.windows?`win`:G.linux?`linux`:`key`;function ju(e,t){let n=e.split(/-(?!$)/),r=n[n.length-1];r==`Space`&&(r=` `);let i,a,o,s;for(let e=0;e<n.length-1;++e){let r=n[e];if(/^(cmd|meta|m)$/i.test(r))s=!0;else if(/^a(lt)?$/i.test(r))i=!0;else if(/^(c|ctrl|control)$/i.test(r))a=!0;else if(/^s(hift)?$/i.test(r))o=!0;else if(/^mod$/i.test(r))t==`mac`?s=!0:a=!0;else throw Error(`Unrecognized modifier name: `+r)}return i&&(r=`Alt-`+r),a&&(r=`Ctrl-`+r),s&&(r=`Meta-`+r),o&&(r=`Shift-`+r),r}function Mu(e,t,n){return t.altKey&&(e=`Alt-`+e),t.ctrlKey&&(e=`Ctrl-`+e),t.metaKey&&(e=`Meta-`+e),n!==!1&&t.shiftKey&&(e=`Shift-`+e),e}var Nu=pi.default(X.domEventHandlers({keydown(e,t){return Hu(Iu(t.state),e,t,`editor`)}})),Pu=V.define({enables:Nu}),Fu=new WeakMap;function Iu(e){let t=e.facet(Pu),n=Fu.get(t);return n||Fu.set(t,n=Bu(t.reduce((e,t)=>e.concat(t),[]))),n}function Lu(e,t,n){return Hu(Iu(e.state),t,e,n)}var Ru=null,zu=4e3;function Bu(e,t=Au){let n=Object.create(null),r=Object.create(null),i=(e,t)=>{let n=r[e];if(n==null)r[e]=t;else if(n!=t)throw Error(`Key binding `+e+` is used both as a regular binding and as a multi-stroke prefix`)},a=(e,r,a,o,s)=>{let c=n[e]||(n[e]=Object.create(null)),l=r.split(/ (?!$)/).map(e=>ju(e,t));for(let t=1;t<l.length;t++){let n=l.slice(0,t).join(` `);i(n,!0),c[n]||(c[n]={preventDefault:!0,stopPropagation:!1,run:[t=>{let r=Ru={view:t,prefix:n,scope:e};return setTimeout(()=>{Ru==r&&(Ru=null)},zu),!0}]})}let u=l.join(` `);i(u,!1);let d=c[u]||(c[u]={preventDefault:!1,stopPropagation:!1,run:(c._any?.run)?.slice()||[]});a&&d.run.push(a),o&&(d.preventDefault=!0),s&&(d.stopPropagation=!0)};for(let r of e){let e=r.scope?r.scope.split(` `):[`editor`];if(r.any)for(let t of e){let e=n[t]||(n[t]=Object.create(null));e._any||={preventDefault:!1,stopPropagation:!1,run:[]};let{any:i}=r;for(let t in e)e[t].run.push(e=>i(e,Vu))}let i=r[t]||r.key;if(i)for(let t of e)a(t,i,r.run,r.preventDefault,r.stopPropagation),r.shift&&a(t,`Shift-`+i,r.shift,r.preventDefault,r.stopPropagation)}return n}var Vu=null;function Hu(e,t,n,r){Vu=t;let i=Ea(t),a=Wr(Hr(i,0))==i.length&&i!=` `,o=``,s=!1,c=!1,l=!1;Ru&&Ru.view==n&&Ru.scope==r&&(o=Ru.prefix+` `,$c.indexOf(t.keyCode)<0&&(c=!0,Ru=null));let u=new Set,d=e=>{if(e){for(let t of e.run)if(!u.has(t)&&(u.add(t),t(n)))return e.stopPropagation&&(l=!0),!0;e.preventDefault&&(e.stopPropagation&&(l=!0),c=!0)}return!1},f=e[r],p,m;return f&&(d(f[o+Mu(i,t,!a)])?s=!0:a&&(t.altKey||t.metaKey||t.ctrlKey)&&!(G.windows&&t.ctrlKey&&t.altKey)&&!(G.mac&&t.altKey&&!(t.ctrlKey||t.metaKey))&&(p=ba[t.keyCode])&&p!=i?(d(f[o+Mu(p,t,!0)])||t.shiftKey&&(m=xa[t.keyCode])!=i&&m!=p&&d(f[o+Mu(m,t,!1)]))&&(s=!0):a&&t.shiftKey&&d(f[o+Mu(i,t,!0)])&&(s=!0),!s&&d(f._any)&&(s=!0)),c&&(s=!0),s&&l&&t.stopPropagation(),Vu=null,s}var Uu=class e{constructor(e,t,n,r,i){this.className=e,this.left=t,this.top=n,this.width=r,this.height=i}draw(){let e=document.createElement(`div`);return e.className=this.className,this.adjust(e),e}update(e,t){return t.className==this.className&&(this.adjust(e),!0)}adjust(e){e.style.left=this.left+`px`,e.style.top=this.top+`px`,this.width!=null&&(e.style.width=this.width+`px`),e.style.height=this.height+`px`}eq(e){return this.left==e.left&&this.top==e.top&&this.width==e.width&&this.height==e.height&&this.className==e.className}static forRange(t,n,r){if(r.empty){let i=t.coordsAtPos(r.head,r.assoc||1);if(!i)return[];let a=Wu(t);return[new e(n,i.left-a.left,i.top-a.top,null,i.bottom-i.top)]}return Ku(t,n,r)}};function Wu(e){let t=e.scrollDOM.getBoundingClientRect();return{left:(e.textDirection==q.LTR?t.left:t.right-e.scrollDOM.clientWidth*e.scaleX)-e.scrollDOM.scrollLeft*e.scaleX,top:t.top-e.scrollDOM.scrollTop*e.scaleY}}function Gu(e,t,n,r){let i=e.coordsAtPos(t,n*2);if(!i)return r;let a=e.dom.getBoundingClientRect(),o=(i.top+i.bottom)/2,s=e.posAtCoords({x:a.left+1,y:o}),c=e.posAtCoords({x:a.right-1,y:o});return s==null||c==null?r:{from:Math.max(r.from,Math.min(s,c)),to:Math.min(r.to,Math.max(s,c))}}function Ku(e,t,n){if(n.to<=e.viewport.from||n.from>=e.viewport.to)return[];let r=Math.max(n.from,e.viewport.from),i=Math.min(n.to,e.viewport.to),a=e.textDirection==q.LTR,o=e.contentDOM,s=o.getBoundingClientRect(),c=Wu(e),l=o.querySelector(`.cm-line`),u=l&&window.getComputedStyle(l),d=s.left+(u?parseInt(u.paddingLeft)+Math.min(0,parseInt(u.textIndent)):0),f=s.right-(u?parseInt(u.paddingRight):0),p=Sc(e,r,1),m=Sc(e,i,-1),h=p.type==Ka.Text?p:null,g=m.type==Ka.Text?m:null;if(h&&(e.lineWrapping||p.widgetLineBreaks)&&(h=Gu(e,r,1,h)),g&&(e.lineWrapping||m.widgetLineBreaks)&&(g=Gu(e,i,-1,g)),h&&g&&h.from==g.from&&h.to==g.to)return v(y(n.from,n.to,h));{let t=h?y(n.from,null,h):b(p,!1),r=g?y(null,n.to,g):b(m,!0),i=[];return(h||p).to<(g||m).from-(h&&g?1:0)||p.widgetLineBreaks>1&&t.bottom+e.defaultLineHeight/2<r.top?i.push(_(d,t.bottom,f,r.top)):t.bottom<r.top&&e.elementAtHeight((t.bottom+r.top)/2).type==Ka.Text&&(t.bottom=r.top=(t.bottom+r.top)/2),v(t).concat(i).concat(v(r))}function _(e,n,r,i){return new Uu(t,e-c.left,n-c.top,Math.max(0,r-e),i-n)}function v({top:e,bottom:t,horizontal:n}){let r=[];for(let i=0;i<n.length;i+=2)r.push(_(n[i],e,n[i+1],t));return r}function y(t,n,r){let i=1e9,o=-1e9,s=[];function c(t,n,c,l,u){let p=e.coordsAtPos(t,t==r.to?-2:2),m=e.coordsAtPos(c,c==r.from?2:-2);p&&m&&(i=Math.min(p.top,m.top,i),o=Math.max(p.bottom,m.bottom,o),u==q.LTR?s.push(a&&n?d:p.left,a&&l?f:m.right):s.push(!a&&l?d:m.left,!a&&n?f:p.right))}let l=t??r.from,u=n??r.to;for(let r of e.visibleRanges)if(r.to>l&&r.from<u)for(let i=Math.max(r.from,l),a=Math.min(r.to,u);;){let r=e.state.doc.lineAt(i);for(let o of e.bidiSpans(r)){let e=o.from+r.from,s=o.to+r.from;if(e>=a)break;s>i&&c(Math.max(e,i),t==null&&e<=l,Math.min(s,a),n==null&&s>=u,o.dir)}if(i=r.to+1,i>=a)break}return s.length==0&&c(l,t==null,u,n==null,e.textDirection),{top:i,bottom:o,horizontal:s}}function b(e,t){let n=s.top+(t?e.top:e.bottom);return{top:n,bottom:n,horizontal:[]}}}function qu(e,t){return e.constructor==t.constructor&&e.eq(t)}var Ju=class{constructor(e,t){this.view=e,this.layer=t,this.drawn=[],this.scaleX=1,this.scaleY=1,this.measureReq={read:this.measure.bind(this),write:this.draw.bind(this)},this.dom=e.scrollDOM.appendChild(document.createElement(`div`)),this.dom.classList.add(`cm-layer`),t.above&&this.dom.classList.add(`cm-layer-above`),t.class&&this.dom.classList.add(t.class),this.scale(),this.dom.setAttribute(`aria-hidden`,`true`),this.setOrder(e.state),e.requestMeasure(this.measureReq),t.mount&&t.mount(this.dom,e)}update(e){e.startState.facet(Yu)!=e.state.facet(Yu)&&this.setOrder(e.state),(this.layer.update(e,this.dom)||e.geometryChanged)&&(this.scale(),e.view.requestMeasure(this.measureReq))}docViewUpdate(e){this.layer.updateOnDocViewUpdate!==!1&&e.requestMeasure(this.measureReq)}setOrder(e){let t=0,n=e.facet(Yu);for(;t<n.length&&n[t]!=this.layer;)t++;this.dom.style.zIndex=String((this.layer.above?150:-1)-t)}measure(){return this.layer.markers(this.view)}scale(){let{scaleX:e,scaleY:t}=this.view;(e!=this.scaleX||t!=this.scaleY)&&(this.scaleX=e,this.scaleY=t,this.dom.style.transform=`scale(${1/e}, ${1/t})`)}draw(e){if(e.length!=this.drawn.length||e.some((e,t)=>!qu(e,this.drawn[t]))){let t=this.dom.firstChild,n=0;for(let r of e)r.update&&t&&r.constructor&&this.drawn[n].constructor&&r.update(t,this.drawn[n])?(t=t.nextSibling,n++):this.dom.insertBefore(r.draw(),t);for(;t;){let e=t.nextSibling;t.remove(),t=e}this.drawn=e,G.webkit&&(this.dom.style.display=this.dom.firstChild?``:`none`)}}destroy(){this.layer.destroy&&this.layer.destroy(this.dom,this.view),this.dom.remove()}},Yu=V.define();function Xu(e){return[_s.define(t=>new Ju(t,e)),Yu.of(e)]}var Zu=!G.ios,Qu=V.define({combine(e){return Ki(e,{cursorBlinkRate:1200,drawRangeCursor:!0,iosSelectionHandles:!0},{cursorBlinkRate:(e,t)=>Math.min(e,t),drawRangeCursor:(e,t)=>e||t})}});function $u(e={}){return[Qu.of(e),td,rd,ad,cs.of(!0)]}function ed(e){return e.startState.facet(Qu)!=e.state.facet(Qu)}var td=Xu({above:!0,markers(e){let{state:t}=e,n=t.facet(Qu),r=[];for(let i of t.selection.ranges){let a=i==t.selection.main;if(i.empty||n.drawRangeCursor&&!(a&&G.ios&&n.iosSelectionHandles)){let t=a?`cm-cursor cm-cursor-primary`:`cm-cursor cm-cursor-secondary`,n=i.empty?i:B.cursor(i.head,i.assoc);for(let i of Uu.forRange(e,t,n))r.push(i)}}return r},update(e,t){e.transactions.some(e=>e.selection)&&(t.style.animationName=t.style.animationName==`cm-blink`?`cm-blink2`:`cm-blink`);let n=ed(e);return n&&nd(e.state,t),e.docChanged||e.selectionSet||n},mount(e,t){nd(t.state,e)},class:`cm-cursorLayer`});function nd(e,t){t.style.animationDuration=e.facet(Qu).cursorBlinkRate+`ms`}var rd=Xu({above:!1,markers(e){let t=[],{main:n,ranges:r}=e.state.selection;for(let i of r)if(!i.empty&&(Zu||i!=n))for(let n of Uu.forRange(e,`cm-selectionBackground`,i))t.push(n);if(G.ios&&!n.empty&&e.state.facet(Qu).iosSelectionHandles){for(let r of Uu.forRange(e,`cm-selectionHandle cm-selectionHandle-start`,B.cursor(n.from,1)))t.push(r);for(let r of Uu.forRange(e,`cm-selectionHandle cm-selectionHandle-end`,B.cursor(n.to,1)))t.push(r)}return t},update(e,t){return e.docChanged||e.selectionSet||e.viewportChanged||ed(e)},class:`cm-selectionLayer`}),id=G.gecko&&G.gecko_version==153?`#ffffff01`:`transparent`,ad=pi.highest(X.theme({".cm-line":{...Zu?{"& ::selection, &::selection":{backgroundColor:`${id} !important`}}:{},caretColor:`transparent !important`},".cm-content":{caretColor:`transparent !important`,"& :focus":{caretColor:`initial !important`,...Zu?{"&::selection, & ::selection":{backgroundColor:`Highlight !important`}}:{}}}})),od=H.define({map(e,t){return e==null?null:t.mapPos(e)}}),sd=ui.define({create(){return null},update(e,t){return e!=null&&(e=t.changes.mapPos(e)),t.effects.reduce((e,t)=>t.is(od)?t.value:e,e)}}),cd=_s.fromClass(class{constructor(e){this.view=e,this.cursor=null,this.measureReq={read:this.readPos.bind(this),write:this.drawCursor.bind(this)}}update(e){var t;let n=e.state.field(sd);n==null?this.cursor!=null&&((t=this.cursor)==null||t.remove(),this.cursor=null):(this.cursor||(this.cursor=this.view.scrollDOM.appendChild(document.createElement(`div`)),this.cursor.className=`cm-dropCursor`),(e.startState.field(sd)!=n||e.docChanged||e.geometryChanged)&&this.view.requestMeasure(this.measureReq))}readPos(){let{view:e}=this,t=e.state.field(sd),n=t!=null&&e.coordsAtPos(t);if(!n)return null;let r=e.scrollDOM.getBoundingClientRect();return{left:n.left-r.left+e.scrollDOM.scrollLeft*e.scaleX,top:n.top-r.top+e.scrollDOM.scrollTop*e.scaleY,height:n.bottom-n.top}}drawCursor(e){if(this.cursor){let{scaleX:t,scaleY:n}=this.view;e?(this.cursor.style.left=e.left/t+`px`,this.cursor.style.top=e.top/n+`px`,this.cursor.style.height=e.height/n+`px`):this.cursor.style.left=`-100000px`}}destroy(){this.cursor&&this.cursor.remove()}setDropPos(e){this.view.state.field(sd)!=e&&this.view.dispatch({effects:od.of(e)})}},{eventObservers:{dragover(e){this.setDropPos(this.view.posAtCoords({x:e.clientX,y:e.clientY}))},dragleave(e){e.target!=this.view.contentDOM&&this.view.contentDOM.contains(e.relatedTarget)||this.setDropPos(null)},dragend(){this.setDropPos(null)},drop(){this.setDropPos(null)}}});function ld(){return[sd,cd]}function ud(e,t,n,r,i){t.lastIndex=0;for(let a=e.iterRange(n,r),o=n,s;!a.next().done;o+=a.value.length)if(!a.lineBreak)for(;s=t.exec(a.value);)i(o+s.index,s)}function dd(e,t){let n=e.visibleRanges;if(n.length==1&&n[0].from==e.viewport.from&&n[0].to==e.viewport.to)return n;let r=[];for(let{from:i,to:a}of n)i=Math.max(e.state.doc.lineAt(i).from,i-t),a=Math.min(e.state.doc.lineAt(a).to,a+t),r.length&&r[r.length-1].to>=i?r[r.length-1].to=a:r.push({from:i,to:a});return r}var fd=class{constructor(e){let{regexp:t,decoration:n,decorate:r,boundary:i,maxLength:a=1e3}=e;if(!t.global)throw RangeError(`The regular expression given to MatchDecorator should have its 'g' flag set`);if(this.regexp=t,r)this.addMatch=(e,t,n,i)=>r(i,n,n+e[0].length,e,t);else if(typeof n==`function`)this.addMatch=(e,t,r,i)=>{let a=n(e,t,r);a&&i(r,r+e[0].length,a)};else if(n)this.addMatch=(e,t,r,i)=>i(r,r+e[0].length,n);else throw RangeError(`Either 'decorate' or 'decoration' should be provided to MatchDecorator`);this.boundary=i,this.maxLength=a}createDeco(e){let t=new ea,n=t.add.bind(t);for(let{from:t,to:r}of dd(e,this.maxLength))ud(e.state.doc,this.regexp,t,r,(t,r)=>this.addMatch(r,e,t,n));return t.finish()}updateDeco(e,t){let n=1e9,r=-1;return e.docChanged&&e.changes.iterChanges((t,i,a,o)=>{o>=e.view.viewport.from&&a<=e.view.viewport.to&&(n=Math.min(a,n),r=Math.max(o,r))}),e.viewportMoved||r-n>1e3?this.createDeco(e.view):r>-1?this.updateRange(e.view,t.map(e.changes),n,r):t}updateRange(e,t,n,r){for(let i of e.visibleRanges){let a=Math.max(i.from,n),o=Math.min(i.to,r);if(o>=a){let n=e.state.doc.lineAt(a),r=n.to<o?e.state.doc.lineAt(o):n,s=Math.max(i.from,n.from),c=Math.min(i.to,r.to);if(this.boundary){for(;a>n.from;a--)if(this.boundary.test(n.text[a-1-n.from])){s=a;break}for(;o<r.to;o++)if(this.boundary.test(r.text[o-r.from])){c=o;break}}let l=[],u,d=(e,t,n)=>l.push(n.range(e,t));if(n==r)for(this.regexp.lastIndex=s-n.from;(u=this.regexp.exec(n.text))&&u.index<c-n.from;)this.addMatch(u,e,u.index+n.from,d);else ud(e.state.doc,this.regexp,s,c,(t,n)=>this.addMatch(n,e,t,d));t=t.update({filterFrom:s,filterTo:c,filter:(e,t)=>e<s||t>c,add:l})}}return t}},pd=/x/.unicode==null?`g`:`gu`,md=RegExp(`[\0-\b
--­؜​‎‏\u2028\u2029‭‮⁦⁧⁩﻿￹-￼]`,pd),hd={0:`null`,7:`bell`,8:`backspace`,10:`newline`,11:`vertical tab`,13:`carriage return`,27:`escape`,8203:`zero width space`,8204:`zero width non-joiner`,8205:`zero width joiner`,8206:`left-to-right mark`,8207:`right-to-left mark`,8232:`line separator`,8237:`left-to-right override`,8238:`right-to-left override`,8294:`left-to-right isolate`,8295:`right-to-left isolate`,8297:`pop directional isolate`,8233:`paragraph separator`,65279:`zero width no-break space`,65532:`object replacement`},gd=null;function _d(){if(gd==null&&typeof document<`u`&&document.body){let e=document.body.style;gd=(e.tabSize??e.MozTabSize)!=null}return gd||!1}var vd=V.define({combine(e){let t=Ki(e,{render:null,specialChars:md,addSpecialChars:null});return(t.replaceTabs=!_d())&&(t.specialChars=RegExp(`	|`+t.specialChars.source,pd)),t.addSpecialChars&&(t.specialChars=RegExp(t.specialChars.source+`|`+t.addSpecialChars.source,pd)),t}});function yd(e={}){return[vd.of(e),xd()]}var bd=null;function xd(){return bd||=_s.fromClass(class{constructor(e){this.view=e,this.decorations=K.none,this.decorationCache=Object.create(null),this.decorator=this.makeDecorator(e.state.facet(vd)),this.decorations=this.decorator.createDeco(e)}makeDecorator(e){return new fd({regexp:e.specialChars,decoration:(t,n,r)=>{let{doc:i}=n.state,a=Hr(t[0],0);if(a==9){let e=i.lineAt(r),t=n.state.tabSize,a=da(e.text,t,r-e.from);return K.replace({widget:new Td((t-a%t)*this.view.defaultCharacterWidth/this.view.scaleX)})}return this.decorationCache[a]||(this.decorationCache[a]=K.replace({widget:new wd(e,a)}))},boundary:e.replaceTabs?void 0:/[^]/})}update(e){let t=e.state.facet(vd);e.startState.facet(vd)==t?this.decorations=this.decorator.updateDeco(e,this.decorations):(this.decorator=this.makeDecorator(t),this.decorations=this.decorator.createDeco(e.view))}},{decorations:e=>e.decorations})}var Sd=`•`;function Cd(e){return e>=32?Sd:e==10?`␤`:String.fromCharCode(9216+e)}var wd=class extends Ga{constructor(e,t){super(),this.options=e,this.code=t}eq(e){return e.code==this.code}toDOM(e){let t=Cd(this.code),n=e.state.phrase(`Control character`)+` `+(hd[this.code]||`0x`+this.code.toString(16)),r=this.options.render&&this.options.render(this.code,n,t);if(r)return r;let i=document.createElement(`span`);return i.textContent=t,i.title=n,i.setAttribute(`aria-label`,n),i.className=`cm-specialChar`,i}ignoreEvent(){return!1}},Td=class extends Ga{constructor(e){super(),this.width=e}eq(e){return e.width==this.width}toDOM(){let e=document.createElement(`span`);return e.textContent=`	`,e.className=`cm-tab`,e.style.width=this.width+`px`,e}ignoreEvent(){return!1}};function Ed(){return Od}var Dd=K.line({class:`cm-activeLine`}),Od=_s.fromClass(class{constructor(e){this.decorations=this.getDeco(e)}update(e){(e.docChanged||e.selectionSet)&&(this.decorations=this.getDeco(e.view))}getDeco(e){let t=-1,n=[];for(let r of e.state.selection.ranges){let i=e.lineBlockAt(r.head);i.from>t&&(n.push(Dd.range(i.from)),t=i.from)}return K.set(n)}},{decorations:e=>e.decorations}),kd=2e3;function Ad(e,t,n){let r=Math.min(t.line,n.line),i=Math.max(t.line,n.line),a=[];if(t.off>kd||n.off>kd||t.col<0||n.col<0){let o=Math.min(t.off,n.off),s=Math.max(t.off,n.off);for(let t=r;t<=i;t++){let n=e.doc.line(t);n.length<=s&&a.push(B.range(n.from+o,n.to+s))}}else{let o=Math.min(t.col,n.col),s=Math.max(t.col,n.col);for(let t=r;t<=i;t++){let n=e.doc.line(t),r=fa(n.text,o,e.tabSize,!0);if(r<0)a.push(B.cursor(n.to));else{let t=fa(n.text,s,e.tabSize);a.push(B.range(n.from+r,n.from+t))}}}return a}function jd(e,t){let n=e.coordsAtPos(e.viewport.from);return n?Math.round(Math.abs((n.left-t)/e.defaultCharacterWidth)):-1}function Md(e,t){let n=e.posAtCoords({x:t.clientX,y:t.clientY},!1),r=e.state.doc.lineAt(n),i=n-r.from,a=i>kd?-1:i==r.length?jd(e,t.clientX):da(r.text,e.state.tabSize,n-r.from);return{line:r.number,col:a,off:i}}function Nd(e,t){let n=Md(e,t),r=e.state.selection;return n?{update(e){if(e.docChanged){let t=e.changes.mapPos(e.startState.doc.line(n.line).from),i=e.state.doc.lineAt(t);n={line:i.number,col:n.col,off:Math.min(n.off,i.length)},r=r.map(e.changes)}},get(t,i,a){let o=Md(e,t);if(!o)return r;let s=Ad(e.state,n,o);return s.length?a?B.create(s.concat(r.ranges)):B.create(s):r}}:null}function Pd(e){let t=e?.eventFilter||(e=>e.altKey&&e.button==0);return X.mouseSelectionStyle.of((e,n)=>t(n)?Nd(e,n):null)}var Fd={Alt:[18,e=>!!e.altKey],Control:[17,e=>!!e.ctrlKey],Shift:[16,e=>!!e.shiftKey],Meta:[91,e=>!!e.metaKey]},Id={style:`cursor: crosshair`};function Ld(e={}){let[t,n]=Fd[e.key||`Alt`],r=_s.fromClass(class{constructor(e){this.view=e,this.isDown=!1}set(e){this.isDown!=e&&(this.isDown=e,this.view.update([]))}},{eventObservers:{keydown(e){this.set(e.keyCode==t||n(e))},keyup(e){e.keyCode!=t&&n(e)||this.set(!1)},mousemove(e){this.set(n(e))}}});return[r,X.contentAttributes.of(e=>e.plugin(r)?.isDown?Id:null)]}var Rd=`-10000px`,zd=class{constructor(e,t,n,r){this.facet=t,this.createTooltipView=n,this.removeTooltipView=r,this.input=e.state.facet(t),this.tooltips=this.input.filter(e=>e);let i=null;this.tooltipViews=this.tooltips.map(e=>i=n(e,i))}update(e,t){var n;let r=e.state.facet(this.facet),i=r.filter(e=>e);if(r===this.input){for(let t of this.tooltipViews)t.update&&t.update(e);return!1}let a=[],o=t?[]:null;for(let n=0;n<i.length;n++){let r=i[n],s=-1;if(r){for(let e=0;e<this.tooltips.length;e++){let t=this.tooltips[e];t&&t.create==r.create&&(s=e)}if(s<0)a[n]=this.createTooltipView(r,n?a[n-1]:null),o&&(o[n]=!!r.above);else{let r=a[n]=this.tooltipViews[s];o&&(o[n]=t[s]),r.update&&r.update(e)}}}for(let e of this.tooltipViews)a.indexOf(e)<0&&(this.removeTooltipView(e),(n=e.destroy)==null||n.call(e));return t&&(o.forEach((e,n)=>t[n]=e),t.length=o.length),this.input=r,this.tooltips=i,this.tooltipViews=a,!0}};function Bd(e){let t=e.dom.ownerDocument.documentElement,n=t.clientWidth,r=getComputedStyle(t);if(!/stable/.test(r.scrollbarGutter||``))return{left:0,right:n};let i=t.getBoundingClientRect(),a=e.win.scrollX;return{left:Math.max(0,i.left+a-parseFloat(r.marginLeft)),right:Math.min(n,i.right+a+parseFloat(r.marginRight))}}function Vd(e){let{left:t,right:n}=Bd(e);return{top:0,left:t,right:n,bottom:e.dom.ownerDocument.documentElement.clientHeight}}var Hd=V.define({combine:e=>({position:G.ios?`absolute`:e.find(e=>e.position)?.position||`fixed`,parent:e.find(e=>e.parent)?.parent||null,tooltipSpace:e.find(e=>e.tooltipSpace)?.tooltipSpace||Vd})}),Ud=new WeakMap,Wd=_s.fromClass(class{constructor(e){this.view=e,this.above=[],this.inView=!0,this.madeAbsolute=!1,this.lastTransaction=0,this.measureTimeout=-1;let t=e.state.facet(Hd);this.position=t.position,this.parent=t.parent,this.classes=e.themeClasses,this.createContainer(),this.measureReq={read:this.readMeasure.bind(this),write:this.writeMeasure.bind(this),key:this},this.resizeObserver=typeof ResizeObserver==`function`?new ResizeObserver(()=>this.measureSoon()):null,this.manager=new zd(e,Jd,(e,t)=>this.createTooltip(e,t),e=>{this.resizeObserver&&this.resizeObserver.unobserve(e.dom),e.dom.remove()}),this.above=this.manager.tooltips.map(e=>!!e.above),this.intersectionObserver=typeof IntersectionObserver==`function`?new IntersectionObserver(e=>{Date.now()>this.lastTransaction-50&&e.length>0&&e[e.length-1].intersectionRatio<1&&this.measureSoon()},{threshold:[1]}):null,this.observeIntersection(),e.win.addEventListener(`resize`,this.measureSoon=this.measureSoon.bind(this)),this.maybeMeasure()}createContainer(){this.parent?(this.container=document.createElement(`div`),this.container.style.position=`relative`,this.container.className=this.view.themeClasses,this.parent.appendChild(this.container)):this.container=this.view.dom}observeIntersection(){if(this.intersectionObserver){this.intersectionObserver.disconnect();for(let e of this.manager.tooltipViews)this.intersectionObserver.observe(e.dom)}}measureSoon(){this.measureTimeout<0&&(this.measureTimeout=setTimeout(()=>{this.measureTimeout=-1,this.maybeMeasure()},50))}update(e){e.transactions.length&&(this.lastTransaction=Date.now());let t=this.manager.update(e,this.above);t&&this.observeIntersection();let n=t||e.geometryChanged,r=e.state.facet(Hd);if(r.position!=this.position&&!this.madeAbsolute){this.position=r.position;for(let e of this.manager.tooltipViews)e.dom.style.position=this.position;n=!0}if(r.parent!=this.parent){this.parent&&this.container.remove(),this.parent=r.parent,this.createContainer();for(let e of this.manager.tooltipViews)this.container.appendChild(e.dom);n=!0}else this.parent&&this.view.themeClasses!=this.classes&&(this.classes=this.container.className=this.view.themeClasses);n&&this.maybeMeasure()}createTooltip(e,t){let n=e.create(this.view),r=t?t.dom:null;if(n.dom.classList.add(`cm-tooltip`),e.arrow&&!n.dom.querySelector(`.cm-tooltip > .cm-tooltip-arrow`)){let e=document.createElement(`div`);e.className=`cm-tooltip-arrow`,n.dom.appendChild(e)}return n.dom.style.position=this.position,n.dom.style.top=Rd,n.dom.style.left=`0px`,this.container.insertBefore(n.dom,r),n.mount&&n.mount(this.view),this.resizeObserver&&this.resizeObserver.observe(n.dom),n}destroy(){var e,t,n;this.view.win.removeEventListener(`resize`,this.measureSoon);for(let t of this.manager.tooltipViews)t.dom.remove(),(e=t.destroy)==null||e.call(t);this.parent&&this.container.remove(),(t=this.resizeObserver)==null||t.disconnect(),(n=this.intersectionObserver)==null||n.disconnect(),clearTimeout(this.measureTimeout)}readMeasure(){let e=1,t=1,n=!1,r=0;if(this.position==`fixed`&&this.manager.tooltipViews.length){let{dom:e}=this.manager.tooltipViews[0];if(G.safari){let t=e.getBoundingClientRect();n=Math.abs(t.top+1e4)>1||Math.abs(t.left)>1}else n=!!e.offsetParent&&e.offsetParent!=this.container.ownerDocument.body}if(n||this.position==`absolute`){if(this.parent){let n=this.parent.getBoundingClientRect();n.width&&n.height&&(e=n.width/this.parent.offsetWidth,t=n.height/this.parent.offsetHeight)}else({scaleX:e,scaleY:t}=this.view.viewState)}else r=Bd(this.view).left;let i=this.view.scrollDOM.getBoundingClientRect(),a=ks(this.view);return{visible:{left:i.left+a.left,top:i.top+a.top,right:i.right-a.right,bottom:i.bottom-a.bottom},parent:this.parent?this.container.getBoundingClientRect():this.view.dom.getBoundingClientRect(),pos:this.manager.tooltips.map((e,t)=>{let n=this.manager.tooltipViews[t];return n.getCoords?n.getCoords(e.pos):this.view.coordsAtPos(e.pos)}),size:this.manager.tooltipViews.map(({dom:e})=>e.getBoundingClientRect()),space:this.view.state.facet(Hd).tooltipSpace(this.view),scaleX:e,scaleY:t,makeAbsolute:n,fixedLeft:r}}writeMeasure(e){if(e.makeAbsolute){this.madeAbsolute=!0,this.position=`absolute`;for(let e of this.manager.tooltipViews)e.dom.style.position=`absolute`}let{visible:t,space:n,scaleX:r,scaleY:i}=e,a=[];for(let o=0;o<this.manager.tooltips.length;o++){let s=this.manager.tooltips[o],c=this.manager.tooltipViews[o],{dom:l}=c,u=e.pos[o],d=e.size[o];if(!u||s.clip!==!1&&(u.bottom<=Math.max(t.top,n.top)||u.top>=Math.min(t.bottom,n.bottom)||u.right<Math.max(t.left,n.left)-.1||u.left>Math.min(t.right,n.right)+.1)){l.style.top=Rd;continue}let f=s.arrow?c.dom.querySelector(`.cm-tooltip-arrow`):null,p=f?7:0,m=d.right-d.left,h=Ud.get(c)??d.bottom-d.top,g=c.offset||qd,_=this.view.textDirection==q.LTR,v=d.width>n.right-n.left?_?n.left:n.right-d.width:_?Math.max(n.left,Math.min(u.left-(f?14:0)+g.x,n.right-m)):Math.min(Math.max(n.left,u.left-m+(f?14:0)-g.x),n.right-m),y=this.above[o];!s.strictSide&&(y?u.top-h-p-g.y<n.top:u.bottom+h+p+g.y>n.bottom)&&y==n.bottom-u.bottom>u.top-n.top&&(y=this.above[o]=!y);let b=(y?u.top-n.top:n.bottom-u.bottom)-p;if(b<h&&c.resize!==!1){if(b<this.view.defaultLineHeight){l.style.top=Rd;continue}Ud.set(c,h),l.style.height=(h=b)/i+`px`}else l.style.height&&(l.style.height=``);let x=y?u.top-h-p-g.y:u.bottom+p+g.y,S=v+m;if(c.overlap!==!0)for(let e of a)e.left<S&&e.right>v&&e.top<x+h&&e.bottom>x&&(x=y?e.top-h-2-p:e.bottom+p+2);if(this.position==`absolute`?(l.style.top=(x-e.parent.top)/i+`px`,Gd(l,(v-e.parent.left)/r)):(l.style.top=x/i+`px`,Gd(l,(v-e.fixedLeft)/r)),f){let e=u.left+(_?g.x:-g.x)-(v+14-7);f.style.left=e/r+`px`}c.overlap!==!0&&a.push({left:v,top:x,right:S,bottom:x+h}),l.classList.toggle(`cm-tooltip-above`,y),l.classList.toggle(`cm-tooltip-below`,!y),c.positioned&&c.positioned(e.space)}}maybeMeasure(){if(this.manager.tooltips.length&&(this.view.inView&&this.view.requestMeasure(this.measureReq),this.inView!=this.view.inView&&(this.inView=this.view.inView,!this.inView)))for(let e of this.manager.tooltipViews)e.dom.style.top=Rd}},{eventObservers:{scroll(){this.maybeMeasure()}}});function Gd(e,t){let n=parseInt(e.style.left,10);(isNaN(n)||Math.abs(t-n)>1)&&(e.style.left=t+`px`)}var Kd=X.baseTheme({".cm-tooltip":{zIndex:500,boxSizing:`border-box`},"&light .cm-tooltip":{border:`1px solid #bbb`,backgroundColor:`#f5f5f5`},"&light .cm-tooltip-section:not(:first-child)":{borderTop:`1px solid #bbb`},"&dark .cm-tooltip":{backgroundColor:`#333338`,color:`white`},".cm-tooltip-arrow":{height:`7px`,width:`14px`,position:`absolute`,zIndex:-1,overflow:`hidden`,"&:before, &:after":{content:`''`,position:`absolute`,width:0,height:0,borderLeft:`7px solid transparent`,borderRight:`7px solid transparent`},".cm-tooltip-above &":{bottom:`-7px`,"&:before":{borderTop:`7px solid #bbb`},"&:after":{borderTop:`7px solid #f5f5f5`,bottom:`1px`}},".cm-tooltip-below &":{top:`-7px`,"&:before":{borderBottom:`7px solid #bbb`},"&:after":{borderBottom:`7px solid #f5f5f5`,top:`1px`}}},"&dark .cm-tooltip .cm-tooltip-arrow":{"&:before":{borderTopColor:`#333338`,borderBottomColor:`#333338`},"&:after":{borderTopColor:`transparent`,borderBottomColor:`transparent`}}}),qd={x:0,y:0},Jd=V.define({enables:[Wd,Kd]}),Yd=V.define({combine:e=>e.reduce((e,t)=>e.concat(t),[])}),Xd=class e{static create(t){return new e(t)}constructor(e){this.view=e,this.mounted=!1,this.dom=document.createElement(`div`),this.dom.classList.add(`cm-tooltip-hover`),this.manager=new zd(e,Yd,(e,t)=>this.createHostedView(e,t),e=>e.dom.remove())}createHostedView(e,t){let n=e.create(this.view);return n.dom.classList.add(`cm-tooltip-section`),this.dom.insertBefore(n.dom,t?t.dom.nextSibling:this.dom.firstChild),this.mounted&&n.mount&&n.mount(this.view),n}mount(e){for(let t of this.manager.tooltipViews)t.mount&&t.mount(e);this.mounted=!0}positioned(e){for(let t of this.manager.tooltipViews)t.positioned&&t.positioned(e)}update(e){this.manager.update(e)}destroy(){var e;for(let t of this.manager.tooltipViews)(e=t.destroy)==null||e.call(t)}passProp(e){let t;for(let n of this.manager.tooltipViews){let r=n[e];if(r!==void 0){if(t===void 0)t=r;else if(t!==r)return}}return t}get offset(){return this.passProp(`offset`)}get getCoords(){return this.passProp(`getCoords`)}get overlap(){return this.passProp(`overlap`)}get resize(){return this.passProp(`resize`)}},Zd=Jd.compute([Yd],e=>{let t=e.facet(Yd);return t.length===0?null:{pos:Math.min(...t.map(e=>e.pos)),end:Math.max(...t.map(e=>e.end??e.pos)),create:Xd.create,above:t[0].above,arrow:t.some(e=>e.arrow)}}),Qd=V.define(),$d=class{constructor(e,t,n,r,i,a){this.view=e,this.source=t,this.field=n,this.locked=r,this.setHover=i,this.hoverTime=a,this.hoverTimeout=-1,this.restartTimeout=-1,this.pending=null,this.lastMove={x:0,y:0,target:e.dom,time:0},this.checkHover=this.checkHover.bind(this),e.dom.addEventListener(`mouseleave`,this.mouseleave=this.mouseleave.bind(this)),e.dom.addEventListener(`mousemove`,this.mousemove=this.mousemove.bind(this))}update(e){this.pending&&(this.pending=null,clearTimeout(this.restartTimeout),this.restartTimeout=setTimeout(()=>this.startHover(),20))}get active(){return this.view.state.field(this.field)}checkHover(){if(this.hoverTimeout=-1,this.active.length)return;let e=Date.now()-this.lastMove.time;e<this.hoverTime?this.hoverTimeout=setTimeout(this.checkHover,this.hoverTime-e):this.startHover()}startHover(){clearTimeout(this.restartTimeout);let{view:e,lastMove:t}=this,n=e.docView.tile.nearest(t.target);if(!n)return;let r,i=1;if(n.isWidget())r=n.posAtStart;else{if(r=e.posAtCoords(t),r==null)return;let n=e.coordsAtPos(r);if(!n||t.y<n.top||t.y>n.bottom||t.x<n.left-e.defaultCharacterWidth||t.x>n.right+e.defaultCharacterWidth)return;let a=e.bidiSpans(e.state.doc.lineAt(r)).find(e=>e.from<=r&&e.to>=r),o=a&&a.dir==q.RTL?-1:1;i=t.x<n.left?-o:o}this.activateHover(e,r,i)}activateHover(e,t,n,r){let i=this.source(e,t,n),a=t=>{if(t&&(!Array.isArray(t)||t.length)){let n=Array.isArray(t)?t:[t];r&&this.locked.set(n,r),e.dispatch({effects:this.setHover.of(n)})}};if(i&&`then`in i){let n=this.pending={pos:t};i.then(e=>{this.pending==n&&(this.pending=null,a(e))},t=>ps(e.state,t,`hover tooltip`))}else a(i)}get tooltip(){let e=this.view.plugin(Wd),t=e?e.manager.tooltips.findIndex(e=>e.create==Xd.create):-1;return t>-1?e.manager.tooltipViews[t]:null}mousemove(e){this.lastMove={x:e.clientX,y:e.clientY,target:e.target,time:Date.now()},this.hoverTimeout<0&&(this.hoverTimeout=setTimeout(this.checkHover,this.hoverTime));let{active:t,tooltip:n}=this;if(t.length&&!this.locked.has(t)&&n&&!tf(n.dom,e)||this.pending){let{pos:n}=t[0]||this.pending,r=t[0]?.end??n;(n==r?this.view.posAtCoords(this.lastMove)!=n:!nf(this.view,n,r,e.clientX,e.clientY))&&(this.view.dispatch({effects:this.setHover.of([])}),this.pending=null)}}mouseleave(e){clearTimeout(this.hoverTimeout),this.hoverTimeout=-1;let{active:t}=this;if(t.length&&!this.locked.has(t)){let{tooltip:t}=this;t&&t.dom.contains(e.relatedTarget)?this.watchTooltipLeave(t.dom):this.view.dispatch({effects:this.setHover.of([])})}}watchTooltipLeave(e){let t=n=>{e.removeEventListener(`mouseleave`,t);let{active:r}=this;r.length&&!this.locked.has(r)&&!this.view.dom.contains(n.relatedTarget)&&this.view.dispatch({effects:this.setHover.of([])})};e.addEventListener(`mouseleave`,t)}destroy(){clearTimeout(this.hoverTimeout),clearTimeout(this.restartTimeout),this.view.dom.removeEventListener(`mouseleave`,this.mouseleave),this.view.dom.removeEventListener(`mousemove`,this.mousemove)}},ef=4;function tf(e,t){let{left:n,right:r,top:i,bottom:a}=e.getBoundingClientRect(),o;if(o=e.querySelector(`.cm-tooltip-arrow`)){let e=o.getBoundingClientRect();i=Math.min(e.top,i),a=Math.max(e.bottom,a)}return t.clientX>=n-ef&&t.clientX<=r+ef&&t.clientY>=i-ef&&t.clientY<=a+ef}function nf(e,t,n,r,i,a){let o=e.scrollDOM.getBoundingClientRect(),s=e.documentTop+e.documentPadding.top+e.contentHeight;if(o.left>r||o.right<r||o.top>i||Math.min(o.bottom,s)<i)return!1;let c=e.posAtCoords({x:r,y:i},!1);return c>=t&&c<=n}function rf(e,t={}){let n=H.define(),r=new WeakMap,i=ui.define({create(){return[]},update(e,a){let o=r.get(e);if(e.length&&(t.hideOnChange&&(a.docChanged||a.selection)||o&&o(a)?e=[]:t.hideOn&&(e=e.filter(e=>!t.hideOn(a,e)))),a.docChanged&&e.length){let t=[];for(let n of e){let e=a.changes.mapPos(n.pos,-1,Kr.TrackDel);if(e!=null){let r=Object.assign(Object.create(null),n);r.pos=e,r.end!=null&&(r.end=a.changes.mapPos(r.end)),t.push(r)}}e=t}for(let t of a.effects)t.is(n)&&(e=t.value,o=void 0),(t.is(sf)&&!t.value||t.value==i)&&(e=[]);return e.length&&o&&r.set(e,o),e},provide:e=>Yd.from(e)}),a=_s.define(a=>new $d(a,e,i,r,n,t.hoverTime||300));return{active:i,extension:[i,a,Qd.of(a),Zd]}}function af(e,t,n,r={}){let i=e.state.facet(Qd).map(t=>e.plugin(t)).filter(e=>!!e);if(r.tooltip&&r.tooltip.active){let e=i.find(e=>e.field==r.tooltip.active);e&&(i=[e])}for(let a of i)a.activateHover(e,t,n,r.until??(()=>!1))}function of(e,t){let n=e.plugin(Wd);if(!n)return null;let r=n.manager.tooltips.indexOf(t);return r<0?null:n.manager.tooltipViews[r]}var sf=H.define(),cf=V.define({combine(e){let t,n;for(let r of e)t||=r.topContainer,n||=r.bottomContainer;return{topContainer:t,bottomContainer:n}}});function lf(e,t){let n=e.plugin(uf),r=n?n.specs.indexOf(t):-1;return r>-1?n.panels[r]:null}var uf=_s.fromClass(class{constructor(e){this.input=e.state.facet(pf),this.specs=this.input.filter(e=>e),this.panels=this.specs.map(t=>t(e));let t=e.state.facet(cf);this.top=new df(e,!0,t.topContainer),this.bottom=new df(e,!1,t.bottomContainer),this.top.sync(this.panels.filter(e=>e.top)),this.bottom.sync(this.panels.filter(e=>!e.top));for(let e of this.panels)e.dom.classList.add(`cm-panel`),e.mount&&e.mount()}update(e){let t=e.state.facet(cf);this.top.container!=t.topContainer&&(this.top.sync([]),this.top=new df(e.view,!0,t.topContainer)),this.bottom.container!=t.bottomContainer&&(this.bottom.sync([]),this.bottom=new df(e.view,!1,t.bottomContainer)),this.top.syncClasses(),this.bottom.syncClasses();let n=e.state.facet(pf);if(n!=this.input){let t=n.filter(e=>e),r=[],i=[],a=[],o=[];for(let n of t){let t=this.specs.indexOf(n),s;t<0?(s=n(e.view),o.push(s)):(s=this.panels[t],s.update&&s.update(e)),r.push(s),(s.top?i:a).push(s)}this.specs=t,this.panels=r,this.top.sync(i),this.bottom.sync(a);for(let e of o)e.dom.classList.add(`cm-panel`),e.mount&&e.mount()}else for(let t of this.panels)t.update&&t.update(e)}destroy(){this.top.sync([]),this.bottom.sync([])}},{provide:e=>X.scrollMargins.of(t=>{let n=t.plugin(e);return n&&{top:n.top.scrollMargin(),bottom:n.bottom.scrollMargin()}})}),df=class{constructor(e,t,n){this.view=e,this.top=t,this.container=n,this.dom=void 0,this.classes=``,this.panels=[],this.syncClasses()}sync(e){for(let t of this.panels)t.destroy&&e.indexOf(t)<0&&t.destroy();this.panels=e,this.syncDOM()}syncDOM(){if(this.panels.length==0){this.dom&&=(this.dom.remove(),void 0);return}if(!this.dom){this.dom=document.createElement(`div`),this.dom.className=this.top?`cm-panels cm-panels-top`:`cm-panels cm-panels-bottom`;let e=this.container||this.view.dom;e.insertBefore(this.dom,this.top?e.firstChild:null)}let e=this.dom.firstChild;for(let t of this.panels)if(t.dom.parentNode==this.dom){for(;e!=t.dom;)e=ff(e);e=e.nextSibling}else this.dom.insertBefore(t.dom,e);for(;e;)e=ff(e)}scrollMargin(){return!this.dom||this.container?0:Math.max(0,this.top?this.dom.getBoundingClientRect().bottom-Math.max(0,this.view.scrollDOM.getBoundingClientRect().top):Math.min(innerHeight,this.view.scrollDOM.getBoundingClientRect().bottom)-this.dom.getBoundingClientRect().top)}syncClasses(){if(this.container&&this.classes!=this.view.themeClasses){for(let e of this.classes.split(` `))e&&this.container.classList.remove(e);for(let e of(this.classes=this.view.themeClasses).split(` `))e&&this.container.classList.add(e)}}};function ff(e){let t=e.nextSibling;return e.remove(),t}var pf=V.define({enables:uf});function mf(e,t){let n,r=new Promise(e=>n=e),i=e=>yf(e,t,n);e.state.field(gf,!1)?e.dispatch({effects:_f.of(i)}):e.dispatch({effects:H.appendConfig.of(gf.init(()=>[i]))});let a=vf.of(i);return{close:a,result:r.then(t=>((e.win.queueMicrotask||(t=>e.win.setTimeout(t,10)))(()=>{e.state.field(gf).indexOf(i)>-1&&e.dispatch({effects:a})}),t))}}function hf(e,t){let n=e.state.field(gf,!1)||[];for(let r of n){let n=lf(e,r);if(n&&n.dom.classList.contains(t))return n}return null}var gf=ui.define({create(){return[]},update(e,t){for(let n of t.effects)n.is(_f)?e=[n.value].concat(e):n.is(vf)&&(e=e.filter(e=>e!=n.value));return e},provide:e=>pf.computeN([e],t=>t.field(e))}),_f=H.define(),vf=H.define();function yf(e,t,n){let r=t.content?t.content(e,()=>s(null)):null;if(!r){if(r=W(`form`),t.input){let e=W(`input`,t.input);/^(text|password|number|email|tel|url)$/.test(e.type)&&e.classList.add(`cm-textfield`),e.name||=`input`,r.appendChild(W(`label`,(t.label||``)+`: `,e))}else r.appendChild(document.createTextNode(t.label||``));r.appendChild(document.createTextNode(` `)),r.appendChild(W(`button`,{class:`cm-button`,type:`submit`},t.submitLabel||`OK`))}let i=r.nodeName==`FORM`?[r]:r.querySelectorAll(`form`);for(let e=0;e<i.length;e++){let t=i[e];t.addEventListener(`keydown`,e=>{e.keyCode==27?(e.preventDefault(),s(null)):e.keyCode==13&&(e.preventDefault(),s(t))}),t.addEventListener(`submit`,e=>{e.preventDefault(),s(t)})}let a=W(`div`,r,W(`button`,{onclick:()=>s(null),"aria-label":e.state.phrase(`close`),class:`cm-dialog-close`,type:`button`},[`×`]));t.class&&(a.className=t.class),a.classList.add(`cm-dialog`);let o=typeof t.focus==`string`?r.querySelector(t.focus):t.focus?r.querySelector(`input`)||r.querySelector(`button`):null;function s(t){a.contains(a.ownerDocument.activeElement)&&e.focus(),n(t)}return{dom:a,top:t.top,mount:()=>{o&&(`select`in o?o.select():`focus`in o&&o.focus())},destroy:()=>n(null)}}var bf=class extends qi{compare(e){return this==e||this.constructor==e.constructor&&this.eq(e)}eq(e){return!1}destroy(e){}};bf.prototype.elementClass=``,bf.prototype.toDOM=void 0,bf.prototype.mapMode=Kr.TrackBefore,bf.prototype.startSide=bf.prototype.endSide=-1,bf.prototype.point=!0;var xf=V.define(),Sf=V.define(),Cf={class:``,renderEmptyElements:!1,elementStyle:``,markers:()=>U.empty,lineMarker:()=>null,widgetMarker:()=>null,lineMarkerChange:null,initialSpacer:null,updateSpacer:null,domEventHandlers:{},side:`before`},wf=V.define();function Tf(e){return[Df(),wf.of({...Cf,...e})]}var Ef=V.define({combine:e=>e.some(e=>e)});function Df(e){let t=[Of];return e&&e.fixed===!1&&t.push(Ef.of(!0)),t}var Of=_s.fromClass(class{constructor(e){this.view=e,this.domAfter=null,this.prevViewport=e.viewport,this.dom=document.createElement(`div`),this.dom.className=`cm-gutters cm-gutters-before`,this.dom.setAttribute(`aria-hidden`,`true`),this.dom.style.minHeight=this.view.contentHeight/this.view.scaleY+`px`,this.gutters=e.state.facet(wf).map(t=>new Mf(e,t)),this.fixed=!e.state.facet(Ef);for(let e of this.gutters)e.config.side==`after`?this.getDOMAfter().appendChild(e.dom):this.dom.appendChild(e.dom);this.fixed&&(this.dom.style.position=`sticky`),this.syncGutters(!1),e.scrollDOM.insertBefore(this.dom,e.contentDOM)}getDOMAfter(){return this.domAfter||(this.domAfter=document.createElement(`div`),this.domAfter.className=`cm-gutters cm-gutters-after`,this.domAfter.setAttribute(`aria-hidden`,`true`),this.domAfter.style.minHeight=this.view.contentHeight/this.view.scaleY+`px`,this.domAfter.style.position=this.fixed?`sticky`:``,this.view.scrollDOM.appendChild(this.domAfter)),this.domAfter}update(e){if(this.updateGutters(e)){let t=this.prevViewport,n=e.view.viewport,r=Math.min(t.to,n.to)-Math.max(t.from,n.from);this.syncGutters(r<(n.to-n.from)*.8)}if(e.geometryChanged){let e=this.view.contentHeight/this.view.scaleY+`px`;this.dom.style.minHeight=e,this.domAfter&&(this.domAfter.style.minHeight=e)}this.view.state.facet(Ef)!=!this.fixed&&(this.fixed=!this.fixed,this.dom.style.position=this.fixed?`sticky`:``,this.domAfter&&(this.domAfter.style.position=this.fixed?`sticky`:``)),this.prevViewport=e.view.viewport}syncGutters(e){let t=this.dom.nextSibling;e&&(this.dom.remove(),this.domAfter&&this.domAfter.remove());let n=U.iter(this.view.state.facet(xf),this.view.viewport.from),r=[],i=this.gutters.map(e=>new jf(e,this.view.viewport,-this.view.documentPadding.top));for(let e of this.view.viewportLineBlocks)if(r.length&&(r=[]),Array.isArray(e.type)){let t=!0;for(let a of e.type)if(a.type==Ka.Text&&t){Af(n,r,a.from);for(let e of i)e.line(this.view,a,r);t=!1}else if(a.widget)for(let e of i)e.widget(this.view,a)}else if(e.type==Ka.Text){Af(n,r,e.from);for(let t of i)t.line(this.view,e,r)}else if(e.widget)for(let t of i)t.widget(this.view,e);for(let e of i)e.finish();e&&(this.view.scrollDOM.insertBefore(this.dom,t),this.domAfter&&this.view.scrollDOM.appendChild(this.domAfter))}updateGutters(e){let t=e.startState.facet(wf),n=e.state.facet(wf),r=e.docChanged||e.heightChanged||e.viewportChanged||!U.eq(e.startState.facet(xf),e.state.facet(xf),e.view.viewport.from,e.view.viewport.to);if(t==n)for(let t of this.gutters)t.update(e)&&(r=!0);else{r=!0;let i=[];for(let r of n){let n=t.indexOf(r);n<0?i.push(new Mf(this.view,r)):(this.gutters[n].update(e),i.push(this.gutters[n]))}for(let e of this.gutters)e.dom.remove(),i.indexOf(e)<0&&e.destroy();for(let e of i)e.config.side==`after`?this.getDOMAfter().appendChild(e.dom):this.dom.appendChild(e.dom);this.gutters=i}return r}destroy(){for(let e of this.gutters)e.destroy();this.dom.remove(),this.domAfter&&this.domAfter.remove()}},{provide:e=>X.scrollMargins.of(t=>{let n=t.plugin(e);if(!n||n.gutters.length==0||!n.fixed)return null;let r=n.dom.offsetWidth*t.scaleX,i=n.domAfter?n.domAfter.offsetWidth*t.scaleX:0;return t.textDirection==q.LTR?{left:r,right:i}:{right:r,left:i}})});function kf(e){return Array.isArray(e)?e:[e]}function Af(e,t,n){for(;e.value&&e.from<=n;)e.from==n&&t.push(e.value),e.next()}var jf=class{constructor(e,t,n){this.gutter=e,this.height=n,this.i=0,this.cursor=U.iter(e.markers,t.from)}addElement(e,t,n){let{gutter:r}=this,i=(t.top-this.height)/e.scaleY,a=t.height/e.scaleY;if(this.i==r.elements.length){let t=new Nf(e,a,i,n);r.elements.push(t),r.dom.appendChild(t.dom)}else r.elements[this.i].update(e,a,i,n);this.height=t.bottom,this.i++}line(e,t,n){let r=[];Af(this.cursor,r,t.from),n.length&&(r=r.concat(n));let i=this.gutter.config.lineMarker(e,t,r);i&&r.unshift(i);let a=this.gutter;(r.length!=0||a.config.renderEmptyElements)&&this.addElement(e,t,r)}widget(e,t){let n=this.gutter.config.widgetMarker(e,t.widget,t),r=n?[n]:null;for(let n of e.state.facet(Sf)){let i=n(e,t.widget,t);i&&(r||=[]).push(i)}r&&this.addElement(e,t,r)}finish(){let e=this.gutter;for(;e.elements.length>this.i;){let t=e.elements.pop();e.dom.removeChild(t.dom),t.destroy()}}},Mf=class{constructor(e,t){this.view=e,this.config=t,this.elements=[],this.spacer=null,this.dom=document.createElement(`div`),this.dom.className=`cm-gutter`+(this.config.class?` `+this.config.class:``);for(let n in t.domEventHandlers)this.dom.addEventListener(n,r=>{let i=r.target,a;if(i!=this.dom&&this.dom.contains(i)){for(;i.parentNode!=this.dom;)i=i.parentNode;let e=i.getBoundingClientRect();a=(e.top+e.bottom)/2}else a=r.clientY;let o=e.lineBlockAtHeight(a-e.documentTop);t.domEventHandlers[n](e,o,r)&&r.preventDefault()});this.markers=kf(t.markers(e)),t.initialSpacer&&(this.spacer=new Nf(e,0,0,[t.initialSpacer(e)]),this.dom.appendChild(this.spacer.dom),this.spacer.dom.style.cssText+=`visibility: hidden; pointer-events: none`)}update(e){let t=this.markers;if(this.markers=kf(this.config.markers(e.view)),this.spacer&&this.config.updateSpacer){let t=this.config.updateSpacer(this.spacer.markers[0],e);t!=this.spacer.markers[0]&&this.spacer.update(e.view,0,0,[t])}let n=e.view.viewport;return!U.eq(this.markers,t,n.from,n.to)||(this.config.lineMarkerChange?this.config.lineMarkerChange(e):!1)}destroy(){for(let e of this.elements)e.destroy()}},Nf=class{constructor(e,t,n,r){this.height=-1,this.above=0,this.markers=[],this.dom=document.createElement(`div`),this.dom.className=`cm-gutterElement`,this.update(e,t,n,r)}update(e,t,n,r){this.height!=t&&(this.height=t,this.dom.style.height=t+`px`),this.above!=n&&(this.dom.style.marginTop=(this.above=n)?n+`px`:``),Pf(this.markers,r)||this.setMarkers(e,r)}setMarkers(e,t){let n=`cm-gutterElement`,r=this.dom.firstChild;for(let i=0,a=0;;){let o=a,s=i<t.length?t[i++]:null,c=!1;if(s){let e=s.elementClass;e&&(n+=` `+e);for(let e=a;e<this.markers.length;e++)if(this.markers[e].compare(s)){o=e,c=!0;break}}else o=this.markers.length;for(;a<o;){let e=this.markers[a++];if(e.toDOM){e.destroy(r);let t=r.nextSibling;r.remove(),r=t}}if(!s)break;s.toDOM&&(c?r=r.nextSibling:this.dom.insertBefore(s.toDOM(e),r)),c&&a++}this.dom.className=n,this.markers=t}destroy(){this.setMarkers(null,[])}};function Pf(e,t){if(e.length!=t.length)return!1;for(let n=0;n<e.length;n++)if(!e[n].compare(t[n]))return!1;return!0}var Ff=V.define(),If=V.define(),Lf=V.define({combine(e){return Ki(e,{formatNumber:String,domEventHandlers:{}},{domEventHandlers(e,t){let n=Object.assign({},e);for(let e in t){let r=n[e],i=t[e];n[e]=r?(e,t,n)=>r(e,t,n)||i(e,t,n):i}return n}})}}),Rf=class extends bf{constructor(e){super(),this.number=e}eq(e){return this.number==e.number}toDOM(){return document.createTextNode(this.number)}};function zf(e,t){return e.state.facet(Lf).formatNumber(t,e.state)}var Bf=wf.compute([Lf],e=>({class:`cm-lineNumbers`,renderEmptyElements:!1,markers(e){return e.state.facet(Ff)},lineMarker(e,t,n){return n.some(e=>e.toDOM)?null:new Rf(zf(e,e.state.doc.lineAt(t.from).number))},widgetMarker:(e,t,n)=>{for(let r of e.state.facet(If)){let i=r(e,t,n);if(i)return i}return null},lineMarkerChange:e=>e.startState.facet(Lf)!=e.state.facet(Lf),initialSpacer(e){return new Rf(zf(e,Hf(e.state.doc.lines)))},updateSpacer(e,t){let n=zf(t.view,Hf(t.view.state.doc.lines));return n==e.number?e:new Rf(n)},domEventHandlers:e.facet(Lf).domEventHandlers,side:`before`}));function Vf(e={}){return[Lf.of(e),Df(),Bf]}function Hf(e){let t=9;for(;t<e;)t=t*10+9;return t}var Uf=new class extends bf{constructor(){super(...arguments),this.elementClass=`cm-activeLineGutter`}},Wf=xf.compute([`selection`],e=>{let t=[],n=-1;for(let r of e.selection.ranges){let i=e.doc.lineAt(r.head).from;i>n&&(n=i,t.push(Uf.range(i)))}return U.of(t)});function Gf(){return Wf}var Kf=1024,qf=0,Jf=class{constructor(e,t){this.from=e,this.to=t}},Z=class{constructor(e={}){this.id=qf++,this.perNode=!!e.perNode,this.deserialize=e.deserialize||(()=>{throw Error(`This node type doesn't define a deserialize function`)}),this.combine=e.combine||null}add(e){if(this.perNode)throw RangeError(`Can't add per-node props to node types`);return typeof e!=`function`&&(e=Zf.match(e)),t=>{let n=e(t);return n===void 0?null:[this,n]}}};Z.closedBy=new Z({deserialize:e=>e.split(` `)}),Z.openedBy=new Z({deserialize:e=>e.split(` `)}),Z.group=new Z({deserialize:e=>e.split(` `)}),Z.isolate=new Z({deserialize:e=>{if(e&&e!=`rtl`&&e!=`ltr`&&e!=`auto`)throw RangeError(`Invalid value for isolate: `+e);return e||`auto`}}),Z.contextHash=new Z({perNode:!0}),Z.lookAhead=new Z({perNode:!0}),Z.mounted=new Z({perNode:!0});var Yf=class{constructor(e,t,n,r=!1){this.tree=e,this.overlay=t,this.parser=n,this.bracketed=r}static get(e){return e&&e.props&&e.props[Z.mounted.id]}},Xf=Object.create(null),Zf=class e{constructor(e,t,n,r=0){this.name=e,this.props=t,this.id=n,this.flags=r}static define(t){let n=t.props&&t.props.length?Object.create(null):Xf,r=+!!t.top|(t.skipped?2:0)|(t.error?4:0)|(t.name==null?8:0),i=new e(t.name||``,n,t.id,r);if(t.props){for(let e of t.props)if(Array.isArray(e)||(e=e(i)),e){if(e[0].perNode)throw RangeError(`Can't store a per-node prop on a node type`);n[e[0].id]=e[1]}}return i}prop(e){return this.props[e.id]}get isTop(){return(this.flags&1)>0}get isSkipped(){return(this.flags&2)>0}get isError(){return(this.flags&4)>0}get isAnonymous(){return(this.flags&8)>0}is(e){if(typeof e==`string`){if(this.name==e)return!0;let t=this.prop(Z.group);return t?t.indexOf(e)>-1:!1}return this.id==e}static match(e){let t=Object.create(null);for(let n in e)for(let r of n.split(` `))t[r]=e[n];return e=>{for(let n=e.prop(Z.group),r=-1;r<(n?n.length:0);r++){let i=t[r<0?e.name:n[r]];if(i)return i}}}};Zf.none=new Zf(``,Object.create(null),0,8);var Qf=class e{constructor(e){this.types=e;for(let t=0;t<e.length;t++)if(e[t].id!=t)throw RangeError(`Node type ids should correspond to array positions when creating a node set`)}extend(...t){let n=[];for(let e of this.types){let r=null;for(let n of t){let t=n(e);if(t){r||=Object.assign({},e.props);let n=t[1],i=t[0];i.combine&&i.id in r&&(n=i.combine(r[i.id],n)),r[i.id]=n}}n.push(r?new Zf(e.name,r,e.id,e.flags):e)}return new e(n)}},$f=new WeakMap,ep=new WeakMap,tp;(function(e){e[e.ExcludeBuffers=1]=`ExcludeBuffers`,e[e.IncludeAnonymous=2]=`IncludeAnonymous`,e[e.IgnoreMounts=4]=`IgnoreMounts`,e[e.IgnoreOverlays=8]=`IgnoreOverlays`,e[e.EnterBracketed=16]=`EnterBracketed`})(tp||={});var np=class e{constructor(e,t,n,r,i){if(this.type=e,this.children=t,this.positions=n,this.length=r,this.props=null,i&&i.length){this.props=Object.create(null);for(let[e,t]of i)this.props[typeof e==`number`?e:e.id]=t}}toString(){let e=Yf.get(this);if(e&&!e.overlay)return e.tree.toString();let t=``;for(let e of this.children){let n=e.toString();n&&(t&&(t+=`,`),t+=n)}return this.type.name?(/\W/.test(this.type.name)&&!this.type.isError?JSON.stringify(this.type.name):this.type.name)+(t.length?`(`+t+`)`:``):t}cursor(e=0){return new gp(this.topNode,e)}cursorAt(e,t=0,n=0){let r=new gp($f.get(this)||this.topNode);return r.moveTo(e,t),$f.set(this,r._tree),r}get topNode(){return new cp(this,0,0,null)}resolve(e,t=0){let n=op($f.get(this)||this.topNode,e,t,!1);return $f.set(this,n),n}resolveInner(e,t=0){let n=op(ep.get(this)||this.topNode,e,t,!0);return ep.set(this,n),n}resolveStack(e,t=0){return hp(this,e,t)}iterate(e){let{enter:t,leave:n,from:r=0,to:i=this.length}=e,a=e.mode||0,o=(a&tp.IncludeAnonymous)>0;for(let e=this.cursor(a|tp.IncludeAnonymous);;){let a=!1;if(e.from<=i&&e.to>=r&&(!o&&e.type.isAnonymous||t(e)!==!1)){if(e.firstChild())continue;a=!0}for(;a&&n&&(o||!e.type.isAnonymous)&&n(e),!e.nextSibling();){if(!e.parent())return;a=!0}}}prop(e){return e.perNode?this.props?this.props[e.id]:void 0:this.type.prop(e)}get propValues(){let e=[];if(this.props)for(let t in this.props)e.push([+t,this.props[t]]);return e}balance(t={}){return this.children.length<=8?this:xp(Zf.none,this.children,this.positions,0,this.children.length,0,this.length,(t,n,r)=>new e(this.type,t,n,r,this.propValues),t.makeTree||((t,n,r)=>new e(Zf.none,t,n,r)))}static build(e){return vp(e)}};np.empty=new np(Zf.none,[],[],0);var rp=class e{constructor(e,t){this.buffer=e,this.index=t}get id(){return this.buffer[this.index-4]}get start(){return this.buffer[this.index-3]}get end(){return this.buffer[this.index-2]}get size(){return this.buffer[this.index-1]}get pos(){return this.index}next(){this.index-=4}fork(){return new e(this.buffer,this.index)}},ip=class e{constructor(e,t,n){this.buffer=e,this.length=t,this.set=n}get type(){return Zf.none}toString(){let e=[];for(let t=0;t<this.buffer.length;)e.push(this.childString(t)),t=this.buffer[t+3];return e.join(`,`)}childString(e){let t=this.buffer[e],n=this.buffer[e+3],r=this.set.types[t],i=r.name;if(/\W/.test(i)&&!r.isError&&(i=JSON.stringify(i)),e+=4,n==e)return i;let a=[];for(;e<n;)a.push(this.childString(e)),e=this.buffer[e+3];return i+`(`+a.join(`,`)+`)`}findChild(e,t,n,r,i){let{buffer:a}=this,o=-1;for(let s=e;s!=t&&!(ap(i,r,a[s+1],a[s+2])&&(o=s,n>0));s=a[s+3]);return o}slice(t,n,r){let i=this.buffer,a=new Uint16Array(n-t),o=0;for(let e=t,s=0;e<n;){a[s++]=i[e++],a[s++]=i[e++]-r;let n=a[s++]=i[e++]-r;a[s++]=i[e++]-t,o=Math.max(o,n)}return new e(a,o,this.set)}};function ap(e,t,n,r){switch(e){case-2:return n<t;case-1:return r>=t&&n<t;case 0:return n<t&&r>t;case 1:return n<=t&&r>t;case 2:return r>t;case 4:return!0}}function op(e,t,n,r){for(;e.from==e.to||(n<1?e.from>=t:e.from>t)||(n>-1?e.to<=t:e.to<t);){let t=!r&&e instanceof cp&&e.index<0?null:e.parent;if(!t)return e;e=t}let i=r?0:tp.IgnoreOverlays;if(r)for(let r=e,a=r.parent;a;r=a,a=r.parent)r instanceof cp&&r.index<0&&a.enter(t,n,i)?.from!=r.from&&(e=a);for(;;){let r=e.enter(t,n,i);if(!r)return e;e=r}}var sp=class{cursor(e=0){return new gp(this,e)}getChild(e,t=null,n=null){let r=lp(this,e,t,n);return r.length?r[0]:null}getChildren(e,t=null,n=null){return lp(this,e,t,n)}resolve(e,t=0){return op(this,e,t,!1)}resolveInner(e,t=0){return op(this,e,t,!0)}matchContext(e){return up(this.parent,e)}enterUnfinishedNodesBefore(e){let t=this.childBefore(e),n=this;for(;t;){let e=t.lastChild;if(!e||e.to!=t.to)break;e.type.isError&&e.from==e.to?(n=t,t=e.prevSibling):t=e}return n}get node(){return this}get next(){return this.parent}},cp=class e extends sp{constructor(e,t,n,r){super(),this._tree=e,this.from=t,this.index=n,this._parent=r}get type(){return this._tree.type}get name(){return this._tree.type.name}get to(){return this.from+this._tree.length}nextChild(t,n,r,i,a=0){for(let o=this;;){for(let{children:s,positions:c}=o._tree,l=n>0?s.length:-1;t!=l;t+=n){let l=s[t],u=c[t]+o.from,d;if(a&tp.EnterBracketed&&l instanceof np&&(d=Yf.get(l))&&!d.overlay&&d.bracketed&&r>=u&&r<=u+l.length||ap(i,r,u,u+l.length)){if(l instanceof ip){if(a&tp.ExcludeBuffers)continue;let e=l.findChild(0,l.buffer.length,n,r-u,i);if(e>-1)return new fp(new dp(o,l,t,u),null,e)}else if(a&tp.IncludeAnonymous||!l.type.isAnonymous||_p(l)){let s;if(!(a&tp.IgnoreMounts)&&(s=Yf.get(l))&&!s.overlay)return new e(s.tree,u,t,o);let c=new e(l,u,t,o);return a&tp.IncludeAnonymous||!c.type.isAnonymous?c:c.nextChild(n<0?l.children.length-1:0,n,r,i,a)}}}if(a&tp.IncludeAnonymous||!o.type.isAnonymous||(t=o.index>=0?o.index+n:n<0?-1:o._parent._tree.children.length,o=o._parent,!o))return null}}get firstChild(){return this.nextChild(0,1,0,4)}get lastChild(){return this.nextChild(this._tree.children.length-1,-1,0,4)}childAfter(e){return this.nextChild(0,1,e,2)}childBefore(e){return this.nextChild(this._tree.children.length-1,-1,e,-2)}prop(e){return this._tree.prop(e)}enter(t,n,r=0){let i;if(!(r&tp.IgnoreOverlays)&&(i=Yf.get(this._tree))&&i.overlay){let a=t-this.from,o=r&tp.EnterBracketed&&i.bracketed;for(let{from:t,to:r}of i.overlay)if((n>0||o?t<=a:t<a)&&(n<0||o?r>=a:r>a))return new e(i.tree,i.overlay[0].from+this.from,-1,this)}return this.nextChild(0,1,t,n,r)}nextSignificantParent(){let e=this;for(;e.type.isAnonymous&&e._parent;)e=e._parent;return e}get parent(){return this._parent?this._parent.nextSignificantParent():null}get nextSibling(){return this._parent&&this.index>=0?this._parent.nextChild(this.index+1,1,0,4):null}get prevSibling(){return this._parent&&this.index>=0?this._parent.nextChild(this.index-1,-1,0,4):null}get tree(){return this._tree}toTree(){return this._tree}toString(){return this._tree.toString()}};function lp(e,t,n,r){let i=e.cursor(),a=[];if(!i.firstChild())return a;if(n!=null){for(let e=!1;!e;)if(e=i.type.is(n),!i.nextSibling())return a}for(;;){if(r!=null&&i.type.is(r))return a;if(i.type.is(t)&&a.push(i.node),!i.nextSibling())return r==null?a:[]}}function up(e,t,n=t.length-1){for(let r=e;n>=0;r=r.parent){if(!r)return!1;if(!r.type.isAnonymous){if(t[n]&&t[n]!=r.name)return!1;n--}}return!0}var dp=class{constructor(e,t,n,r){this.parent=e,this.buffer=t,this.index=n,this.start=r}},fp=class e extends sp{get name(){return this.type.name}get from(){return this.context.start+this.context.buffer.buffer[this.index+1]}get to(){return this.context.start+this.context.buffer.buffer[this.index+2]}constructor(e,t,n){super(),this.context=e,this._parent=t,this.index=n,this.type=e.buffer.set.types[e.buffer.buffer[n]]}child(t,n,r){let{buffer:i}=this.context,a=i.findChild(this.index+4,i.buffer[this.index+3],t,n-this.context.start,r);return a<0?null:new e(this.context,this,a)}get firstChild(){return this.child(1,0,4)}get lastChild(){return this.child(-1,0,4)}childAfter(e){return this.child(1,e,2)}childBefore(e){return this.child(-1,e,-2)}prop(e){return this.type.prop(e)}enter(t,n,r=0){if(r&tp.ExcludeBuffers)return null;let{buffer:i}=this.context,a=i.findChild(this.index+4,i.buffer[this.index+3],n>0?1:-1,t-this.context.start,n);return a<0?null:new e(this.context,this,a)}get parent(){return this._parent||this.context.parent.nextSignificantParent()}externalSibling(e){return this._parent?null:this.context.parent.nextChild(this.context.index+e,e,0,4)}get nextSibling(){let{buffer:t}=this.context,n=t.buffer[this.index+3];return n<(this._parent?t.buffer[this._parent.index+3]:t.buffer.length)?new e(this.context,this._parent,n):this.externalSibling(1)}get prevSibling(){let{buffer:t}=this.context,n=this._parent?this._parent.index+4:0;return this.index==n?this.externalSibling(-1):new e(this.context,this._parent,t.findChild(n,this.index,-1,0,4))}get tree(){return null}toTree(){let e=[],t=[],{buffer:n}=this.context,r=this.index+4,i=n.buffer[this.index+3];if(i>r){let a=n.buffer[this.index+1];e.push(n.slice(r,i,a)),t.push(0)}return new np(this.type,e,t,this.to-this.from)}toString(){return this.context.buffer.childString(this.index)}};function pp(e){if(!e.length)return null;let t=0,n=e[0];for(let r=1;r<e.length;r++){let i=e[r];(i.from>n.from||i.to<n.to)&&(n=i,t=r)}let r=n instanceof cp&&n.index<0?null:n.parent,i=e.slice();return r?i[t]=r:i.splice(t,1),new mp(i,n)}var mp=class{constructor(e,t){this.heads=e,this.node=t}get next(){return pp(this.heads)}};function hp(e,t,n){let r=e.resolveInner(t,n),i=null;for(let e=r instanceof cp?r:r.context.parent;e;e=e.parent)if(e.index<0){let a=e.parent;(i||=[r]).push(a.resolve(t,n)),e=a}else{let a=Yf.get(e.tree);if(a&&a.overlay&&a.overlay[0].from<=t&&a.overlay[a.overlay.length-1].to>=t){let o=new cp(a.tree,a.overlay[0].from+e.from,-1,e);(i||=[r]).push(op(o,t,n,!1))}}return i?pp(i):r}var gp=class{get name(){return this.type.name}constructor(e,t=0){if(this.buffer=null,this.stack=[],this.index=0,this.bufferNode=null,this.mode=t&~tp.EnterBracketed,e instanceof cp)this.yieldNode(e);else{this._tree=e.context.parent,this.buffer=e.context;for(let t=e._parent;t;t=t._parent)this.stack.unshift(t.index);this.bufferNode=e,this.yieldBuf(e.index)}}yieldNode(e){return e?(this._tree=e,this.type=e.type,this.from=e.from,this.to=e.to,!0):!1}yieldBuf(e,t){this.index=e;let{start:n,buffer:r}=this.buffer;return this.type=t||r.set.types[r.buffer[e]],this.from=n+r.buffer[e+1],this.to=n+r.buffer[e+2],!0}yield(e){return e?e instanceof cp?(this.buffer=null,this.yieldNode(e)):(this.buffer=e.context,this.yieldBuf(e.index,e.type)):!1}toString(){return this.buffer?this.buffer.buffer.childString(this.index):this._tree.toString()}enterChild(e,t,n){if(!this.buffer)return this.yield(this._tree.nextChild(e<0?this._tree._tree.children.length-1:0,e,t,n,this.mode));let{buffer:r}=this.buffer,i=r.findChild(this.index+4,r.buffer[this.index+3],e,t-this.buffer.start,n);return i<0?!1:(this.stack.push(this.index),this.yieldBuf(i))}firstChild(){return this.enterChild(1,0,4)}lastChild(){return this.enterChild(-1,0,4)}childAfter(e){return this.enterChild(1,e,2)}childBefore(e){return this.enterChild(-1,e,-2)}enter(e,t,n=this.mode){return this.buffer?n&tp.ExcludeBuffers?!1:this.enterChild(1,e,t):this.yield(this._tree.enter(e,t,n))}parent(){if(!this.buffer)return this.yieldNode(this.mode&tp.IncludeAnonymous?this._tree._parent:this._tree.parent);if(this.stack.length)return this.yieldBuf(this.stack.pop());let e=this.mode&tp.IncludeAnonymous?this.buffer.parent:this.buffer.parent.nextSignificantParent();return this.buffer=null,this.yieldNode(e)}sibling(e){if(!this.buffer)return this._tree._parent?this.yield(this._tree.index<0?null:this._tree._parent.nextChild(this._tree.index+e,e,0,4,this.mode)):!1;let{buffer:t}=this.buffer,n=this.stack.length-1;if(e<0){let e=n<0?0:this.stack[n]+4;if(this.index!=e)return this.yieldBuf(t.findChild(e,this.index,-1,0,4))}else{let e=t.buffer[this.index+3];if(e<(n<0?t.buffer.length:t.buffer[this.stack[n]+3]))return this.yieldBuf(e)}return n<0&&this.yield(this.buffer.parent.nextChild(this.buffer.index+e,e,0,4,this.mode))}nextSibling(){return this.sibling(1)}prevSibling(){return this.sibling(-1)}atLastNode(e){let t,n,{buffer:r}=this;if(r){if(e>0){if(this.index<r.buffer.buffer.length)return!1}else for(let e=0;e<this.index;e++)if(r.buffer.buffer[e+3]<this.index)return!1;({index:t,parent:n}=r)}else({index:t,_parent:n}=this._tree);for(;n;{index:t,_parent:n}=n)if(t>-1)for(let r=t+e,i=e<0?-1:n._tree.children.length;r!=i;r+=e){let e=n._tree.children[r];if(this.mode&tp.IncludeAnonymous||e instanceof ip||!e.type.isAnonymous||_p(e))return!1}return!0}move(e,t){if(t&&this.enterChild(e,0,4))return!0;for(;;){if(this.sibling(e))return!0;if(this.atLastNode(e)||!this.parent())return!1}}next(e=!0){return this.move(1,e)}prev(e=!0){return this.move(-1,e)}moveTo(e,t=0){for(;(this.from==this.to||(t<1?this.from>=e:this.from>e)||(t>-1?this.to<=e:this.to<e))&&this.parent(););for(;this.enterChild(1,e,t););return this}get node(){if(!this.buffer)return this._tree;let e=this.bufferNode,t=null,n=0;if(e&&e.context==this.buffer)scan:for(let r=this.index,i=this.stack.length;i>=0;){for(let a=e;a;a=a._parent)if(a.index==r){if(r==this.index)return a;t=a,n=i+1;break scan}r=this.stack[--i]}for(let e=n;e<this.stack.length;e++)t=new fp(this.buffer,t,this.stack[e]);return this.bufferNode=new fp(this.buffer,t,this.index)}get tree(){return this.buffer?null:this._tree._tree}iterate(e,t){for(let n=0;;){let r=!1;if(this.type.isAnonymous||e(this)!==!1){if(this.firstChild()){n++;continue}this.type.isAnonymous||(r=!0)}for(;;){if(r&&t&&t(this),r=this.type.isAnonymous,!n)return;if(this.nextSibling())break;this.parent(),n--,r=!0}}}matchContext(e){if(!this.buffer)return up(this.node.parent,e);let{buffer:t}=this.buffer,{types:n}=t.set;for(let r=e.length-1,i=this.stack.length-1;r>=0;i--){if(i<0)return up(this._tree,e,r);let a=n[t.buffer[this.stack[i]]];if(!a.isAnonymous){if(e[r]&&e[r]!=a.name)return!1;r--}}return!0}};function _p(e){return e.children.some(e=>e instanceof ip||!e.type.isAnonymous||_p(e))}function vp(e){let{buffer:t,nodeSet:n,maxBufferLength:r=Kf,reused:i=[],minRepeatType:a=n.types.length}=e,o=Array.isArray(t)?new rp(t,t.length):t,s=n.types,c=0,l=0;function u(e,t,_,v,y,b){let{id:x,start:S,end:C,size:w}=o,T=l,E=c;if(w<0){if(o.next(),w==-1){let t=i[x];_.push(t),v.push(S-e);return}if(w==-3){c=x;return}if(w==-4){l=x;return}throw RangeError(`Unrecognized record size: ${w}`)}let ee=s[x],D,O,te=S-e;if(C-S<=r&&(O=h(o.pos-t,y))){let t=new Uint16Array(O.size-O.skip),r=o.pos-O.size,i=t.length;for(;o.pos>r;)i=g(O.start,t,i);D=new ip(t,C-O.start,n),te=O.start-e}else{let e=o.pos-w;o.next();let t=[],s=[],c=x>=a?x:-1,h=0,g=C,_=T;for(;o.pos>e;)c>=0&&o.id==c&&o.size>=0?(o.end<=g-r&&(p(t,s,S,h,o.end,g,c,_,E),h=t.length,g=o.end,_=l),o.next()):b>2500?d(S,e,t,s):(c>=0&&o.size==-1&&i[o.id].type==n.types[c]&&(h<t.length&&p(t,s,S,h,o.end,g,c,_,E),h=t.length+1,g=o.start,_=l),u(S,e,t,s,c,b+1));if(c>=0&&h>0&&h<t.length&&p(t,s,S,h,S,g,c,_,E),t.reverse(),s.reverse(),c>-1&&h>0){let e=f(ee,E);D=xp(ee,t,s,0,t.length,0,C-S,e,e)}else D=m(ee,t,s,C-S,T-C,E)}_.push(D),v.push(te)}function d(e,t,i,a){let s=[],c=0,l=-1;for(;o.pos>t;){let{id:e,start:t,end:n,size:i}=o;if(i>4)o.next();else if(l>-1&&t<l)break;else l<0&&(l=n-r),s.push(e,t,n),c++,o.next()}if(c){let t=new Uint16Array(c*4),r=s[s.length-2];for(let e=s.length-3,n=0;e>=0;e-=3)t[n++]=s[e],t[n++]=s[e+1]-r,t[n++]=s[e+2]-r,t[n++]=n;i.push(new ip(t,s[2]-r,n)),a.push(r-e)}}function f(e,t){return(n,r,i)=>{let a=0,o=n.length-1,s,c;if(o>=0&&(s=n[o])instanceof np){if(!o&&s.type==e&&s.length==i)return s;(c=s.prop(Z.lookAhead))&&(a=r[o]+s.length+c-i)}return m(e,n,r,i,a,t)}}function p(e,t,r,i,a,o,s,c,l){let u=[],d=[];for(;e.length>i;)u.push(e.pop()),d.push(t.pop()+r-a);e.push(m(n.types[s],u,d,o-a,c-o,l)),t.push(a-r)}function m(e,t,n,r,i,a,o){if(a){let e=[Z.contextHash,a];o=o?[e].concat(o):[e]}if(i>25){let e=[Z.lookAhead,i];o=o?[e].concat(o):[e]}return new np(e,t,n,r,o)}function h(e,t){let n=o.fork(),i=0,s=0,c=0,l=n.end-r,u={size:0,start:0,skip:0};scan:for(let r=n.pos-e;n.pos>r;){let e=n.size;if(n.id==t&&e>=0){u.size=i,u.start=s,u.skip=c,c+=4,i+=4,n.next();continue}let o=n.pos-e;if(e<0||o<r||n.start<l)break;let d=n.id>=a?4:0,f=n.start;for(n.next();n.pos>o;){if(n.size<0){if(n.size==-3||n.size==-4)d+=4;else break scan}else n.id>=a&&(d+=4);n.next()}s=f,i+=e,c+=d}return(t<0||i==e)&&(u.size=i,u.start=s,u.skip=c),u.size>4?u:void 0}function g(e,t,n){let{id:r,start:i,end:s,size:u}=o;if(o.next(),u>=0&&r<a){let a=n;if(u>4){let r=o.pos-(u-4);for(;o.pos>r;)n=g(e,t,n)}t[--n]=a,t[--n]=s-e,t[--n]=i-e,t[--n]=r}else u==-3?c=r:u==-4&&(l=r);return n}let _=[],v=[];for(;o.pos>0;)u(e.start||0,e.bufferStart||0,_,v,-1,0);let y=e.length??(_.length?v[0]+_[0].length:0);return new np(s[e.topID],_.reverse(),v.reverse(),y)}var yp=new WeakMap;function bp(e,t){if(!e.isAnonymous||t instanceof ip||t.type!=e)return 1;let n=yp.get(t);if(n==null){n=1;for(let r of t.children){if(r.type!=e||!(r instanceof np)){n=1;break}n+=bp(e,r)}yp.set(t,n)}return n}function xp(e,t,n,r,i,a,o,s,c){let l=0;for(let n=r;n<i;n++)l+=bp(e,t[n]);let u=Math.ceil(l*1.5/8),d=[],f=[];function p(t,n,r,i,o){for(let s=r;s<i;){let r=s,l=n[s],m=bp(e,t[s]);for(s++;s<i;s++){let n=bp(e,t[s]);if(m+n>=u)break;m+=n}if(s==r+1){if(m>u){let e=t[r];p(e.children,e.positions,0,e.children.length,n[r]+o);continue}d.push(t[r])}else{let i=n[s-1]+t[s-1].length-l;d.push(xp(e,t,n,r,s,l,i,null,c))}f.push(l+o-a)}}return p(t,n,r,i,0),(s||c)(d,f,o)}var Sp=class e{constructor(e,t,n,r,i=!1,a=!1){this.from=e,this.to=t,this.tree=n,this.offset=r,this.open=!!i|(a?2:0)}get openStart(){return(this.open&1)>0}get openEnd(){return(this.open&2)>0}static addTree(t,n=[],r=!1){let i=[new e(0,t.length,t,0,!1,r)];for(let e of n)e.to>t.length&&i.push(e);return i}static applyChanges(t,n,r=128){if(!n.length)return t;let i=[],a=1,o=t.length?t[0]:null;for(let s=0,c=0,l=0;;s++){let u=s<n.length?n[s]:null,d=u?u.fromA:1e9;if(d-c>=r)for(;o&&o.from<d;){let n=o;if(c>=n.from||d<=n.to||l){let t=Math.max(n.from,c)-l,r=Math.min(n.to,d)-l;n=t>=r?null:new e(t,r,n.tree,n.offset+l,s>0,!!u)}if(n&&i.push(n),o.to>d)break;o=a<t.length?t[a++]:null}if(!u)break;c=u.toA,l=u.toA-u.toB}return i}},Cp=class{startParse(e,t,n){return typeof e==`string`&&(e=new wp(e)),n=n?n.length?n.map(e=>new Jf(e.from,e.to)):[new Jf(0,0)]:[new Jf(0,e.length)],this.createParse(e,t||[],n)}parse(e,t,n){let r=this.startParse(e,t,n);for(;;){let e=r.advance();if(e)return e}}},wp=class{constructor(e){this.string=e}get length(){return this.string.length}chunk(e){return this.string.slice(e)}get lineChunks(){return!1}read(e,t){return this.string.slice(e,t)}};new Z({perNode:!0});var Tp=0,Ep=class e{constructor(e,t,n,r){this.name=e,this.set=t,this.base=n,this.modified=r,this.id=Tp++}toString(){let{name:e}=this;for(let t of this.modified)t.name&&(e=`${t.name}(${e})`);return e}static define(t,n){let r=typeof t==`string`?t:`?`;if(t instanceof e&&(n=t),n?.base)throw Error(`Can not derive from a modified tag`);let i=new e(r,[],null,[]);if(i.set.push(i),n)for(let e of n.set)i.set.push(e);return i}static defineModifier(e){let t=new Op(e);return e=>e.modified.indexOf(t)>-1?e:Op.get(e.base||e,e.modified.concat(t).sort((e,t)=>e.id-t.id))}},Dp=0,Op=class e{constructor(e){this.name=e,this.instances=[],this.id=Dp++}static get(t,n){if(!n.length)return t;let r=n[0].instances.find(e=>e.base==t&&kp(n,e.modified));if(r)return r;let i=[],a=new Ep(t.name,i,t,n);for(let e of n)e.instances.push(a);let o=Ap(n);for(let n of t.set)if(!n.modified.length)for(let t of o)i.push(e.get(n,t));return a}};function kp(e,t){return e.length==t.length&&e.every((e,n)=>e==t[n])}function Ap(e){let t=[[]];for(let n=0;n<e.length;n++)for(let r=0,i=t.length;r<i;r++)t.push(t[r].concat(e[n]));return t.sort((e,t)=>t.length-e.length)}function jp(e){let t=Object.create(null);for(let n in e){let r=e[n];Array.isArray(r)||(r=[r]);for(let e of n.split(` `))if(e){let n=[],i=2,a=e;for(let t=0;;){if(a==`...`&&t>0&&t+3==e.length){i=1;break}let r=/^"(?:[^"\\]|\\.)*?"|[^\/!]+/.exec(a);if(!r)throw RangeError(`Invalid path: `+e);if(n.push(r[0]==`*`?``:r[0][0]==`"`?JSON.parse(r[0]):r[0]),t+=r[0].length,t==e.length)break;let o=e[t++];if(t==e.length&&o==`!`){i=0;break}if(o!=`/`)throw RangeError(`Invalid path: `+e);a=e.slice(t)}let o=n.length-1,s=n[o];if(!s)throw RangeError(`Invalid path: `+e);t[s]=new Np(r,i,o>0?n.slice(0,o):null).sort(t[s])}}return Mp.add(t)}var Mp=new Z({combine(e,t){let n,r,i;for(;e||t;){if(!e||t&&e.depth<=t.depth?(i=t,t=t.next):(i=e,e=e.next),n&&n.mode==i.mode&&!i.context&&!n.context)continue;let a=new Np(i.tags,i.mode,i.context);n?n.next=a:r=a,n=a}return r}}),Np=class{constructor(e,t,n,r){this.tags=e,this.mode=t,this.context=n,this.next=r}get opaque(){return this.mode==0}get inherit(){return this.mode==1}sort(e){return!e||e.depth<this.depth?(this.next=e,this):(e.next=this.sort(e.next),e)}get depth(){return this.context?this.context.length:0}};Np.empty=new Np([],2,null);function Pp(e,t){let n=Object.create(null);for(let t of e)if(!Array.isArray(t.tag))n[t.tag.id]=t.class;else for(let e of t.tag)n[e.id]=t.class;let{scope:r,all:i=null}=t||{};return{style:e=>{let t=i;for(let r of e)for(let e of r.set){let r=n[e.id];if(r){t=t?t+` `+r:r;break}}return t},scope:r}}function Fp(e,t){let n=null;for(let r of e){let e=r.style(t);e&&(n=n?n+` `+e:e)}return n}function Ip(e,t,n,r=0,i=e.length){let a=new Lp(r,Array.isArray(t)?t:[t],n);a.highlightRange(e.cursor(),r,i,``,a.highlighters),a.flush(i)}var Lp=class{constructor(e,t,n){this.at=e,this.highlighters=t,this.span=n,this.class=``}startSpan(e,t){t!=this.class&&(this.flush(e),e>this.at&&(this.at=e),this.class=t)}flush(e){e>this.at&&this.class&&this.span(this.at,e,this.class)}highlightRange(e,t,n,r,i){let{type:a,from:o,to:s}=e;if(o>=n||s<=t)return;a.isTop&&(i=this.highlighters.filter(e=>!e.scope||e.scope(a)));let c=r,l=Rp(e)||Np.empty,u=Fp(i,l.tags);if(u&&(c&&(c+=` `),c+=u,l.mode==1&&(r+=(r?` `:``)+u)),this.startSpan(Math.max(t,o),c),l.opaque)return;let d=e.tree&&e.tree.prop(Z.mounted);if(d&&d.overlay){let a=e.node.enter(d.overlay[0].from+o,1),l=this.highlighters.filter(e=>!e.scope||e.scope(d.tree.type)),u=e.firstChild();for(let f=0,p=o;;f++){let m=f<d.overlay.length?d.overlay[f]:null,h=m?m.from+o:s,g=Math.max(t,p),_=Math.min(n,h);if(g<_&&u)for(;e.from<_&&(this.highlightRange(e,g,_,r,i),this.startSpan(Math.min(_,e.to),c),!(e.to>=h||!e.nextSibling())););if(!m||h>n)break;p=m.to+o,p>t&&(this.highlightRange(a.cursor(),Math.max(t,m.from+o),Math.min(n,p),``,l),this.startSpan(Math.min(n,p),c))}u&&e.parent()}else if(e.firstChild()){d&&(r=``);do if(!(e.to<=t)){if(e.from>=n)break;this.highlightRange(e,t,n,r,i),this.startSpan(Math.min(n,e.to),c)}while(e.nextSibling());e.parent()}}};function Rp(e){let t=e.type.prop(Mp);for(;t&&t.context&&!e.matchContext(t.context);)t=t.next;return t||null}var Q=Ep.define,zp=Q(),Bp=Q(),Vp=Q(Bp),Hp=Q(Bp),Up=Q(),Wp=Q(Up),Gp=Q(Up),Kp=Q(),qp=Q(Kp),Jp=Q(),Yp=Q(),Xp=Q(),Zp=Q(Xp),Qp=Q(),$={comment:zp,lineComment:Q(zp),blockComment:Q(zp),docComment:Q(zp),name:Bp,variableName:Q(Bp),typeName:Vp,tagName:Q(Vp),propertyName:Hp,attributeName:Q(Hp),className:Q(Bp),labelName:Q(Bp),namespace:Q(Bp),macroName:Q(Bp),literal:Up,string:Wp,docString:Q(Wp),character:Q(Wp),attributeValue:Q(Wp),number:Gp,integer:Q(Gp),float:Q(Gp),bool:Q(Up),regexp:Q(Up),escape:Q(Up),color:Q(Up),url:Q(Up),keyword:Jp,self:Q(Jp),null:Q(Jp),atom:Q(Jp),unit:Q(Jp),modifier:Q(Jp),operatorKeyword:Q(Jp),controlKeyword:Q(Jp),definitionKeyword:Q(Jp),moduleKeyword:Q(Jp),operator:Yp,derefOperator:Q(Yp),arithmeticOperator:Q(Yp),logicOperator:Q(Yp),bitwiseOperator:Q(Yp),compareOperator:Q(Yp),updateOperator:Q(Yp),definitionOperator:Q(Yp),typeOperator:Q(Yp),controlOperator:Q(Yp),punctuation:Xp,separator:Q(Xp),bracket:Zp,angleBracket:Q(Zp),squareBracket:Q(Zp),paren:Q(Zp),brace:Q(Zp),content:Kp,heading:qp,heading1:Q(qp),heading2:Q(qp),heading3:Q(qp),heading4:Q(qp),heading5:Q(qp),heading6:Q(qp),contentSeparator:Q(Kp),list:Q(Kp),quote:Q(Kp),emphasis:Q(Kp),strong:Q(Kp),link:Q(Kp),monospace:Q(Kp),strikethrough:Q(Kp),inserted:Q(),deleted:Q(),changed:Q(),invalid:Q(),meta:Qp,documentMeta:Q(Qp),annotation:Q(Qp),processingInstruction:Q(Qp),definition:Ep.defineModifier(`definition`),constant:Ep.defineModifier(`constant`),function:Ep.defineModifier(`function`),standard:Ep.defineModifier(`standard`),local:Ep.defineModifier(`local`),special:Ep.defineModifier(`special`)};for(let e in $){let t=$[e];t instanceof Ep&&(t.name=e)}Pp([{tag:$.link,class:`tok-link`},{tag:$.heading,class:`tok-heading`},{tag:$.emphasis,class:`tok-emphasis`},{tag:$.strong,class:`tok-strong`},{tag:$.keyword,class:`tok-keyword`},{tag:$.atom,class:`tok-atom`},{tag:$.bool,class:`tok-bool`},{tag:$.url,class:`tok-url`},{tag:$.labelName,class:`tok-labelName`},{tag:$.inserted,class:`tok-inserted`},{tag:$.deleted,class:`tok-deleted`},{tag:$.literal,class:`tok-literal`},{tag:$.string,class:`tok-string`},{tag:$.number,class:`tok-number`},{tag:[$.regexp,$.escape,$.special($.string)],class:`tok-string2`},{tag:$.variableName,class:`tok-variableName`},{tag:$.local($.variableName),class:`tok-variableName tok-local`},{tag:$.definition($.variableName),class:`tok-variableName tok-definition`},{tag:$.special($.variableName),class:`tok-variableName2`},{tag:$.definition($.propertyName),class:`tok-propertyName tok-definition`},{tag:$.typeName,class:`tok-typeName`},{tag:$.namespace,class:`tok-namespace`},{tag:$.className,class:`tok-className`},{tag:$.macroName,class:`tok-macroName`},{tag:$.propertyName,class:`tok-propertyName`},{tag:$.operator,class:`tok-operator`},{tag:$.comment,class:`tok-comment`},{tag:$.meta,class:`tok-meta`},{tag:$.invalid,class:`tok-invalid`},{tag:$.punctuation,class:`tok-punctuation`}]);function $p(e,t,n,r=0,i=0){t??(t=e.search(/[^\s\u00a0]/),t==-1&&(t=e.length));let a=i;for(let i=r;i<t;i++)e.charCodeAt(i)==9?a+=n-a%n:a++;return a}var em=class{constructor(e,t,n,r){this.string=e,this.tabSize=t,this.indentUnit=n,this.overrideIndent=r,this.pos=0,this.start=0,this.lastColumnPos=0,this.lastColumnValue=0}eol(){return this.pos>=this.string.length}sol(){return this.pos==0}peek(){return this.string.charAt(this.pos)||void 0}next(){if(this.pos<this.string.length)return this.string.charAt(this.pos++)}eat(e){let t=this.string.charAt(this.pos),n;if(n=typeof e==`string`?t==e:t&&(e instanceof RegExp?e.test(t):e(t)),n)return++this.pos,t}eatWhile(e){let t=this.pos;for(;this.eat(e););return this.pos>t}eatSpace(){let e=this.pos;for(;/[\s\u00a0]/.test(this.string.charAt(this.pos));)++this.pos;return this.pos>e}skipToEnd(){this.pos=this.string.length}skipTo(e){let t=this.string.indexOf(e,this.pos);if(t>-1)return this.pos=t,!0}backUp(e){this.pos-=e}column(){return this.lastColumnPos<this.start&&(this.lastColumnValue=$p(this.string,this.start,this.tabSize,this.lastColumnPos,this.lastColumnValue),this.lastColumnPos=this.start),this.lastColumnValue}indentation(){return this.overrideIndent??$p(this.string,null,this.tabSize)}match(e,t,n){if(typeof e==`string`){let r=e=>n?e.toLowerCase():e;return r(this.string.substr(this.pos,e.length))==r(e)?(t!==!1&&(this.pos+=e.length),!0):null}{let n=this.string.slice(this.pos).match(e);return n&&n.index>0?null:(n&&t!==!1&&(this.pos+=n[0].length),n)}}current(){return this.string.slice(this.start,this.pos)}},tm=new Z;function nm(e){return V.define({combine:e?t=>t.concat(e):void 0})}var rm=new Z,im=class{constructor(e,t,n=[],r=``){this.data=e,this.name=r,Gi.prototype.hasOwnProperty(`tree`)||Object.defineProperty(Gi.prototype,"tree",{get(){return om(this)}}),this.parser=t,this.extension=[hm.of(this),Gi.languageData.of((e,t,n)=>{let r=am(e,t,n),i=r.type.prop(tm);if(!i)return[];let a=e.facet(i),o=r.type.prop(rm);if(o){let i=r.resolve(t-r.from,n);for(let t of o)if(t.test(i,e)){let n=e.facet(t.facet);return t.type==`replace`?n:n.concat(a)}}return a})].concat(n)}isActiveAt(e,t,n=-1){return am(e,t,n).type.prop(tm)==this.data}findRegions(e){let t=e.facet(hm);if(t?.data==this.data)return[{from:0,to:e.doc.length}];if(!t||!t.allowsNesting)return[];let n=[],r=(e,t)=>{if(e.prop(tm)==this.data){n.push({from:t,to:t+e.length});return}let i=e.prop(Z.mounted);if(i){if(i.tree.prop(tm)==this.data){if(i.overlay)for(let e of i.overlay)n.push({from:e.from+t,to:e.to+t});else n.push({from:t,to:t+e.length});return}if(i.overlay){let e=n.length;if(r(i.tree,i.overlay[0].from+t),n.length>e)return}}for(let n=0;n<e.children.length;n++){let i=e.children[n];i instanceof np&&r(i,e.positions[n]+t)}};return r(om(e),0),n}get allowsNesting(){return!0}};im.setState=H.define();function am(e,t,n){let r=e.facet(hm),i=om(e).topNode;if(!r||r.allowsNesting)for(let e=i;e;e=e.enter(t,n,tp.ExcludeBuffers|tp.EnterBracketed))e.type.isTop&&(i=e);return i}function om(e){let t=e.field(im.state,!1);return t?t.tree:np.empty}var sm=class{constructor(e){this.doc=e,this.cursorPos=0,this.string=``,this.cursor=e.iter()}get length(){return this.doc.length}syncTo(e){return this.string=this.cursor.next(e-this.cursorPos).value,this.cursorPos=e+this.string.length,this.cursorPos-this.string.length}chunk(e){return this.syncTo(e),this.string}get lineChunks(){return!0}read(e,t){let n=this.cursorPos-this.string.length;return e<n||t>=this.cursorPos?this.doc.sliceString(e,t):this.string.slice(e-n,t-n)}},cm=null,lm=class e{constructor(e,t,n=[],r,i,a,o,s){this.parser=e,this.state=t,this.fragments=n,this.tree=r,this.treeLen=i,this.viewport=a,this.skipped=o,this.scheduleOn=s,this.parse=null,this.tempSkipped=[]}static create(t,n,r){return new e(t,n,[],np.empty,0,r,[],null)}startParse(){return this.parser.startParse(new sm(this.state.doc),this.fragments)}work(e,t){return t!=null&&t>=this.state.doc.length&&(t=void 0),this.tree!=np.empty&&this.isDone(t??this.state.doc.length)?(this.takeTree(),!0):this.withContext(()=>{if(typeof e==`number`){let t=Date.now()+e;e=()=>Date.now()>t}for(this.parse||=this.startParse(),t!=null&&(this.parse.stoppedAt==null||this.parse.stoppedAt>t)&&t<this.state.doc.length&&this.parse.stopAt(t);;){let n=this.parse.advance();if(n){if(this.fragments=this.withoutTempSkipped(Sp.addTree(n,this.fragments,this.parse.stoppedAt!=null)),this.treeLen=this.parse.stoppedAt??this.state.doc.length,this.tree=n,this.parse=null,this.treeLen<(t??this.state.doc.length))this.parse=this.startParse();else return!0}if(e())return!1}})}takeTree(){let e,t;this.parse&&(e=this.parse.parsedPos)>=this.treeLen&&((this.parse.stoppedAt==null||this.parse.stoppedAt>e)&&this.parse.stopAt(e),this.withContext(()=>{for(;!(t=this.parse.advance()););}),this.treeLen=e,this.tree=t,this.fragments=this.withoutTempSkipped(Sp.addTree(this.tree,this.fragments,!0)),this.parse=null)}withContext(e){let t=cm;cm=this;try{return e()}finally{cm=t}}withoutTempSkipped(e){for(let t;t=this.tempSkipped.pop();)e=um(e,t.from,t.to);return e}changes(t,n){let{fragments:r,tree:i,treeLen:a,viewport:o,skipped:s}=this;if(this.takeTree(),!t.empty){let e=[];if(t.iterChangedRanges((t,n,r,i)=>e.push({fromA:t,toA:n,fromB:r,toB:i})),r=Sp.applyChanges(r,e),i=np.empty,a=0,o={from:t.mapPos(o.from,-1),to:t.mapPos(o.to,1)},this.skipped.length){s=[];for(let e of this.skipped){let n=t.mapPos(e.from,1),r=t.mapPos(e.to,-1);n<r&&s.push({from:n,to:r})}}}return new e(this.parser,n,r,i,a,o,s,this.scheduleOn)}updateViewport(e){if(this.viewport.from==e.from&&this.viewport.to==e.to)return!1;this.viewport=e;let t=this.skipped.length;for(let t=0;t<this.skipped.length;t++){let{from:n,to:r}=this.skipped[t];n<e.to&&r>e.from&&(this.fragments=um(this.fragments,n,r),this.skipped.splice(t--,1))}return this.skipped.length>=t?!1:(this.reset(),!0)}reset(){this.parse&&=(this.takeTree(),null)}skipUntilInView(e,t){this.skipped.push({from:e,to:t})}static getSkippingParser(e){return new class extends Cp{createParse(t,n,r){let i=r[0].from,a=r[r.length-1].to;return{parsedPos:i,advance(){let t=cm;if(t){for(let e of r)t.tempSkipped.push(e);e&&(t.scheduleOn=t.scheduleOn?Promise.all([t.scheduleOn,e]):e)}return this.parsedPos=a,new np(Zf.none,[],[],a-i)},stoppedAt:null,stopAt(){}}}}}isDone(e){e=Math.min(e,this.state.doc.length);let t=this.fragments;return this.treeLen>=e&&t.length&&t[0].from==0&&t[0].to>=e}static get(){return cm}};function um(e,t,n){return Sp.applyChanges(e,[{fromA:t,toA:n,fromB:t,toB:n}])}var dm=class e{constructor(e){this.context=e,this.tree=e.tree}apply(t){if(!t.docChanged&&this.tree==this.context.tree)return this;let n=this.context.changes(t.changes,t.state),r=this.context.treeLen==t.startState.doc.length?void 0:Math.max(t.changes.mapPos(this.context.treeLen),n.viewport.to);return n.work(20,r)||n.takeTree(),new e(n)}static init(t){let n=Math.min(3e3,t.doc.length),r=lm.create(t.facet(hm).parser,t,{from:0,to:n});return r.work(20,n)||r.takeTree(),new e(r)}};im.state=ui.define({create:dm.init,update(e,t){for(let e of t.effects)if(e.is(im.setState))return e.value;return t.startState.facet(hm)==t.state.facet(hm)?e.apply(t):dm.init(t.state)}});var fm=e=>{let t=setTimeout(()=>e(),500);return()=>clearTimeout(t)};typeof requestIdleCallback<`u`&&(fm=e=>{let t=-1,n=setTimeout(()=>{t=requestIdleCallback(e,{timeout:400})},100);return()=>t<0?clearTimeout(n):cancelIdleCallback(t)});var pm=typeof navigator<`u`&&navigator.scheduling?.isInputPending?()=>navigator.scheduling.isInputPending():null,mm=_s.fromClass(class{constructor(e){this.view=e,this.working=null,this.workScheduled=0,this.chunkEnd=-1,this.chunkBudget=-1,this.work=this.work.bind(this),this.scheduleWork()}update(e){let t=this.view.state.field(im.state).context;(t.updateViewport(e.view.viewport)||this.view.viewport.to>t.treeLen)&&this.scheduleWork(),(e.docChanged||e.selectionSet)&&(this.view.hasFocus&&(this.chunkBudget+=50),this.scheduleWork()),this.checkAsyncSchedule(t)}scheduleWork(){if(this.working)return;let{state:e}=this.view,t=e.field(im.state);t.tree==t.context.tree&&t.context.isDone(e.doc.length)||(this.working=fm(this.work))}work(e){this.working=null;let t=Date.now();if(this.chunkEnd<t&&(this.chunkEnd<0||this.view.hasFocus)&&(this.chunkEnd=t+3e4,this.chunkBudget=3e3),this.chunkBudget<=0)return;let{state:n,viewport:{to:r}}=this.view,i=n.field(im.state);if(i.tree==i.context.tree&&i.context.isDone(r+1e5))return;let a=Date.now()+Math.min(this.chunkBudget,100,e&&!pm?Math.max(25,e.timeRemaining()-5):1e9),o=i.context.treeLen<r&&n.doc.length>r+1e3,s=i.context.work(()=>pm&&pm()||Date.now()>a,r+(o?0:1e5));this.chunkBudget-=Date.now()-t,(s||this.chunkBudget<=0)&&(i.context.takeTree(),this.view.dispatch({effects:im.setState.of(new dm(i.context))})),this.chunkBudget>0&&(!s||o)&&this.scheduleWork(),this.checkAsyncSchedule(i.context)}checkAsyncSchedule(e){e.scheduleOn&&=(this.workScheduled++,e.scheduleOn.then(()=>this.scheduleWork()).catch(e=>ps(this.view.state,e)).then(()=>this.workScheduled--),null)}destroy(){this.working&&this.working()}isWorking(){return!!(this.working||this.workScheduled>0)}},{eventHandlers:{focus(){this.scheduleWork()}}}),hm=V.define({combine(e){return e.length?e[0]:null},enables:e=>[im.state,mm,X.contentAttributes.compute([e],t=>{let n=t.facet(e);return n&&n.name?{"data-language":n.name}:{}})]}),gm=V.define(),_m=V.define({combine:e=>{if(!e.length)return`  `;let t=e[0];if(!t||/\S/.test(t)||Array.from(t).some(e=>e!=t[0]))throw Error(`Invalid indent unit: `+JSON.stringify(e[0]));return t}});function vm(e){let t=e.facet(_m);return t.charCodeAt(0)==9?e.tabSize*t.length:t.length}function ym(e,t){let n=``,r=e.tabSize,i=e.facet(_m)[0];if(i==`	`){for(;t>=r;)n+=`	`,t-=r;i=` `}for(let e=0;e<t;e++)n+=i;return n}function bm(e,t){e instanceof Gi&&(e=new xm(e));for(let n of e.state.facet(gm)){let r=n(e,t);if(r!==void 0)return r}let n=om(e.state);return n.length>=t?Cm(e,n,t):null}var xm=class{constructor(e,t={}){this.state=e,this.options=t,this.unit=vm(e)}lineAt(e,t=1){let n=this.state.doc.lineAt(e),{simulateBreak:r,simulateDoubleBreak:i}=this.options;return r!=null&&r>=n.from&&r<=n.to?i&&r==e?{text:``,from:e}:(t<0?r<e:r<=e)?{text:n.text.slice(r-n.from),from:r}:{text:n.text.slice(0,r-n.from),from:n.from}:n}textAfterPos(e,t=1){if(this.options.simulateDoubleBreak&&e==this.options.simulateBreak)return``;let{text:n,from:r}=this.lineAt(e,t);return n.slice(e-r,Math.min(n.length,e+100-r))}column(e,t=1){let{text:n,from:r}=this.lineAt(e,t),i=this.countColumn(n,e-r),a=this.options.overrideIndentation?this.options.overrideIndentation(r):-1;return a>-1&&(i+=a-this.countColumn(n,n.search(/\S|$/))),i}countColumn(e,t=e.length){return da(e,this.state.tabSize,t)}lineIndent(e,t=1){let{text:n,from:r}=this.lineAt(e,t),i=this.options.overrideIndentation;if(i){let e=i(r);if(e>-1)return e}return this.countColumn(n,n.search(/\S|$/))}get simulatedBreak(){return this.options.simulateBreak||null}},Sm=new Z;function Cm(e,t,n){let r=t.resolveStack(n),i=t.resolveInner(n,-1).resolve(n,0).enterUnfinishedNodesBefore(n);if(i!=r.node){let e=[];for(let t=i;t&&!(t.from<r.node.from||t.to>r.node.to||t.from==r.node.from&&t.type==r.node.type);t=t.parent)e.push(t);for(let t=e.length-1;t>=0;t--)r={node:e[t],next:r}}return wm(r,e,n)}function wm(e,t,n){for(let r=e;r;r=r.next){let e=Em(r.node);if(e)return e(Om.create(t,n,r))}return 0}function Tm(e){return e.pos==e.options.simulateBreak&&e.options.simulateDoubleBreak}function Em(e){let t=e.type.prop(Sm);if(t)return t;let n=e.firstChild,r;if(n&&(r=n.type.prop(Z.closedBy))){let t=e.lastChild,n=t&&r.indexOf(t.name)>-1;return e=>jm(e,!0,1,void 0,n&&!Tm(e)?t.from:void 0)}return e.parent==null?Dm:null}function Dm(){return 0}var Om=class e extends xm{constructor(e,t,n){super(e.state,e.options),this.base=e,this.pos=t,this.context=n}get node(){return this.context.node}static create(t,n,r){return new e(t,n,r)}get textAfter(){return this.textAfterPos(this.pos)}get baseIndent(){return this.baseIndentFor(this.node)}baseIndentFor(e){let t=this.state.doc.lineAt(e.from);for(;;){let n=e.resolve(t.from);for(;n.parent&&n.parent.from==n.from;)n=n.parent;if(km(n,e))break;t=this.state.doc.lineAt(n.from)}return this.lineIndent(t.from)}continue(){return wm(this.context.next,this.base,this.pos)}};function km(e,t){for(let n=t;n;n=n.parent)if(e==n)return!0;return!1}function Am(e){let t=e.node,n=t.childAfter(t.from),r=t.lastChild;if(!n)return null;let i=e.options.simulateBreak,a=e.state.doc.lineAt(n.from),o=i==null||i<=a.from?a.to:Math.min(a.to,i);for(let e=n.to;;){let i=t.childAfter(e);if(!i||i==r)return null;if(!i.type.isSkipped){if(i.from>=o)return null;let e=/^ */.exec(a.text.slice(n.to-a.from))[0].length;return{from:n.from,to:n.to+e}}e=i.to}}function jm(e,t,n,r,i){let a=e.textAfter,o=a.match(/^\s*/)[0].length,s=r&&a.slice(o,o+r.length)==r||i==e.pos+o,c=t?Am(e):null;return c?s?e.column(c.from):e.column(c.to):e.baseIndent+(s?0:e.unit*n)}var Mm=200;function Nm(){return Gi.transactionFilter.of(e=>{if(!e.docChanged||!e.isUserEvent(`input.type`)&&!e.isUserEvent(`input.complete`))return e;let t=e.startState.languageDataAt(`indentOnInput`,e.startState.selection.main.head);if(!t.length)return e;let n=e.newDoc,{head:r}=e.newSelection.main,i=n.lineAt(r);if(r>i.from+Mm)return e;let a=n.sliceString(i.from,r);if(!t.some(e=>e.test(a)))return e;let{state:o}=e,s=-1,c=[];for(let{head:e}of o.selection.ranges){let t=o.doc.lineAt(e);if(t.from==s)continue;s=t.from;let n=bm(o,t.from);if(n==null)continue;let r=/^\s*/.exec(t.text)[0],i=ym(o,n);r!=i&&c.push({from:t.from,to:t.from+r.length,insert:i})}return c.length?[e,{changes:c,sequential:!0}]:e})}var Pm=V.define(),Fm=new Z;function Im(e,t,n){let r=om(e);if(r.length<n)return null;let i=r.resolveStack(n,1),a=null;for(let o=i;o;o=o.next){let i=o.node;if(i.to<=n||i.from>n)continue;if(a&&i.from<t)break;let s=i.type.prop(Fm);if(s&&(i.to<r.length-50||r.length==e.doc.length||!Lm(i))){let r=s(i,e);r&&r.from<=n&&r.from>=t&&r.to>n&&(a=r)}}return a}function Lm(e){let t=e.lastChild;return t&&t.to==e.to&&t.type.isError}function Rm(e,t,n){for(let r of e.facet(Pm)){let i=r(e,t,n);if(i)return i}return Im(e,t,n)}function zm(e,t){let n=t.mapPos(e.from,1),r=t.mapPos(e.to,-1);return n>=r?void 0:{from:n,to:r}}var Bm=H.define({map:zm}),Vm=H.define({map:zm});function Hm(e){let t=[];for(let{head:n}of e.state.selection.ranges)t.some(e=>e.from<=n&&e.to>=n)||t.push(e.lineBlockAt(n));return t}var Um=ui.define({create(){return K.none},update(e,t){t.isUserEvent(`delete`)&&t.changes.iterChangedRanges((t,n)=>e=Wm(e,t,n)),e=e.map(t.changes);let n=[];for(let r of t.effects)r.is(Bm)&&!Km(e,r.value.from,r.value.to)?n.push(r.value):r.is(Vm)&&(e=e.update({filter:(e,t)=>r.value.from!=e||r.value.to!=t,filterFrom:r.value.from,filterTo:r.value.to}));if(n.length){let{preparePlaceholder:r}=t.state.facet($m),i=n.map(e=>(r?K.replace({widget:new rh(r(t.state,e))}):nh).range(e.from,e.to));e=e.update({add:i})}return t.selection&&(e=Wm(e,t.selection.main.head)),e},provide:e=>X.decorations.from(e),toJSON(e,t){let n=[];return e.between(0,t.doc.length,(e,t)=>{n.push(e,t)}),n},fromJSON(e){if(!Array.isArray(e)||e.length%2)throw RangeError(`Invalid JSON for fold state`);let t=[];for(let n=0;n<e.length;){let r=e[n++],i=e[n++];if(typeof r!=`number`||typeof i!=`number`)throw RangeError(`Invalid JSON for fold state`);t.push(nh.range(r,i))}return K.set(t,!0)}});function Wm(e,t,n=t){let r=!1;return e.between(t,n,(e,i)=>{e<n&&i>t&&(r=!0)}),r?e.update({filterFrom:t,filterTo:n,filter:(e,r)=>e>=n||r<=t}):e}function Gm(e,t,n){var r;let i=null;return(r=e.field(Um,!1))==null||r.between(t,n,(e,t)=>{(!i||i.from>e)&&(i={from:e,to:t})}),i}function Km(e,t,n){let r=!1;return e.between(t,t,(e,i)=>{e==t&&i==n&&(r=!0)}),r}function qm(e,t){return e.field(Um,!1)?t:t.concat(H.appendConfig.of(eh()))}var Jm=e=>{for(let t of Hm(e)){let n=Rm(e.state,t.from,t.to);if(n)return e.dispatch({effects:qm(e.state,[Bm.of(n),Xm(e,n)])}),!0}return!1},Ym=e=>{if(!e.state.field(Um,!1))return!1;let t=[];for(let n of Hm(e)){let r=Gm(e.state,n.from,n.to);r&&t.push(Vm.of(r),Xm(e,r,!1))}return t.length&&e.dispatch({effects:t}),t.length>0};function Xm(e,t,n=!0){let r=e.state.doc.lineAt(t.from).number,i=e.state.doc.lineAt(t.to).number;return X.announce.of(`${e.state.phrase(n?`Folded lines`:`Unfolded lines`)} ${r} ${e.state.phrase(`to`)} ${i}.`)}var Zm=[{key:`Ctrl-Shift-[`,mac:`Cmd-Alt-[`,run:Jm},{key:`Ctrl-Shift-]`,mac:`Cmd-Alt-]`,run:Ym},{key:`Ctrl-Alt-[`,run:e=>{let{state:t}=e,n=[];for(let r=0;r<t.doc.length;){let i=e.lineBlockAt(r),a=Rm(t,i.from,i.to);a&&n.push(Bm.of(a)),r=(a?e.lineBlockAt(a.to):i).to+1}return n.length&&e.dispatch({effects:qm(e.state,n)}),!!n.length}},{key:`Ctrl-Alt-]`,run:e=>{let t=e.state.field(Um,!1);if(!t||!t.size)return!1;let n=[];return t.between(0,e.state.doc.length,(e,t)=>{n.push(Vm.of({from:e,to:t}))}),e.dispatch({effects:n}),!0}}],Qm={placeholderDOM:null,preparePlaceholder:null,placeholderText:`…`},$m=V.define({combine(e){return Ki(e,Qm)}});function eh(e){let t=[Um,sh];return e&&t.push($m.of(e)),t}function th(e,t){let{state:n}=e,r=n.facet($m),i=t=>{let n=e.lineBlockAt(e.posAtDOM(t.target)),r=Gm(e.state,n.from,n.to);r&&e.dispatch({effects:Vm.of(r)}),t.preventDefault()};if(r.placeholderDOM)return r.placeholderDOM(e,i,t);let a=document.createElement(`span`);return a.textContent=r.placeholderText,a.setAttribute(`aria-label`,n.phrase(`folded code`)),a.title=n.phrase(`unfold`),a.className=`cm-foldPlaceholder`,a.onclick=i,a}var nh=K.replace({widget:new class extends Ga{toDOM(e){return th(e,null)}}}),rh=class extends Ga{constructor(e){super(),this.value=e}eq(e){return this.value==e.value}toDOM(e){return th(e,this.value)}},ih={openText:`⌄`,closedText:`›`,markerDOM:null,domEventHandlers:{},foldingChanged:()=>!1},ah=class extends bf{constructor(e,t){super(),this.config=e,this.open=t}eq(e){return this.config==e.config&&this.open==e.open}toDOM(e){if(this.config.markerDOM)return this.config.markerDOM(this.open);let t=document.createElement(`span`);return t.textContent=this.open?this.config.openText:this.config.closedText,t.title=e.state.phrase(this.open?`Fold line`:`Unfold line`),t}};function oh(e={}){let t={...ih,...e},n=new ah(t,!0),r=new ah(t,!1),i=_s.fromClass(class{constructor(e){this.from=e.viewport.from,this.markers=this.buildMarkers(e)}update(e){(e.docChanged||e.viewportChanged||e.startState.facet(hm)!=e.state.facet(hm)||e.startState.field(Um,!1)!=e.state.field(Um,!1)||om(e.startState)!=om(e.state)||t.foldingChanged(e))&&(this.markers=this.buildMarkers(e.view))}buildMarkers(e){let t=new ea;for(let i of e.viewportLineBlocks){let a=Gm(e.state,i.from,i.to)?r:Rm(e.state,i.from,i.to)?n:null;a&&t.add(i.from,i.from,a)}return t.finish()}}),{domEventHandlers:a}=t;return[i,Tf({class:`cm-foldGutter`,markers(e){return e.plugin(i)?.markers||U.empty},initialSpacer(){return new ah(t,!1)},domEventHandlers:{...a,click:(e,t,n)=>{if(a.click&&a.click(e,t,n))return!0;let r=Gm(e.state,t.from,t.to);if(r)return e.dispatch({effects:Vm.of(r)}),!0;let i=Rm(e.state,t.from,t.to);return i?(e.dispatch({effects:Bm.of(i)}),!0):!1}}}),eh()]}var sh=X.baseTheme({".cm-foldPlaceholder":{backgroundColor:`#eee`,border:`1px solid #ddd`,color:`#888`,borderRadius:`.2em`,margin:`0 1px`,padding:`0 1px`,cursor:`pointer`},".cm-foldGutter span":{padding:`0 1px`,cursor:`pointer`}}),ch=class e{constructor(e,t){this.specs=e;let n;function r(e){let t=_a.newName();return(n||=Object.create(null))[`.`+t]=e,t}let i=typeof t.all==`string`?t.all:t.all?r(t.all):void 0,a=t.scope;this.scope=a instanceof im?e=>e.prop(tm)==a.data:a?e=>e==a:void 0,this.style=Pp(e.map(e=>({tag:e.tag,class:e.class||r(Object.assign({},e,{tag:null}))})),{all:i}).style,this.module=n?new _a(n):null,this.themeType=t.themeType}static define(t,n){return new e(t,n||{})}},lh=V.define(),uh=V.define({combine(e){return e.length?[e[0]]:null}});function dh(e){let t=e.facet(lh);return t.length?t:e.facet(uh)}function fh(e,t){let n=[mh],r;return e instanceof ch&&(e.module&&n.push(X.styleModule.of(e.module)),r=e.themeType),t?.fallback?n.push(uh.of(e)):r?n.push(lh.computeN([X.darkTheme],t=>t.facet(X.darkTheme)==(r==`dark`)?[e]:[])):n.push(lh.of(e)),n}var ph=class{constructor(e){this.markCache=Object.create(null),this.tree=om(e.state),this.decorations=this.buildDeco(e,dh(e.state)),this.decoratedTo=e.viewport.to}update(e){let t=om(e.state),n=dh(e.state),r=n!=dh(e.startState),{viewport:i}=e.view,a=e.changes.mapPos(this.decoratedTo,1);t.length<i.to&&!r&&t.type==this.tree.type&&a>=i.to?(this.decorations=this.decorations.map(e.changes),this.decoratedTo=a):(t!=this.tree||e.viewportChanged||r)&&(this.tree=t,this.decorations=this.buildDeco(e.view,n),this.decoratedTo=i.to)}buildDeco(e,t){if(!t||!this.tree.length)return K.none;let n=new ea;for(let{from:r,to:i}of e.visibleRanges)Ip(this.tree,t,(e,t,r)=>{n.add(e,t,this.markCache[r]||(this.markCache[r]=K.mark({class:r})))},r,i);return n.finish()}},mh=pi.high(_s.fromClass(ph,{decorations:e=>e.decorations})),hh=ch.define([{tag:$.meta,color:`#404740`},{tag:$.link,textDecoration:`underline`},{tag:$.heading,textDecoration:`underline`,fontWeight:`bold`},{tag:$.emphasis,fontStyle:`italic`},{tag:$.strong,fontWeight:`bold`},{tag:$.strikethrough,textDecoration:`line-through`},{tag:$.keyword,color:`#708`},{tag:[$.atom,$.bool,$.url,$.contentSeparator,$.labelName],color:`#219`},{tag:[$.literal,$.inserted],color:`#164`},{tag:[$.string,$.deleted],color:`#a11`},{tag:[$.regexp,$.escape,$.special($.string)],color:`#e40`},{tag:$.definition($.variableName),color:`#00f`},{tag:$.local($.variableName),color:`#30a`},{tag:[$.typeName,$.namespace],color:`#085`},{tag:$.className,color:`#167`},{tag:[$.special($.variableName),$.macroName],color:`#256`},{tag:$.definition($.propertyName),color:`#00c`},{tag:$.comment,color:`#940`},{tag:$.invalid,color:`#f00`}]),gh=X.baseTheme({"&.cm-focused .cm-matchingBracket":{backgroundColor:`#328c8252`},"&.cm-focused .cm-nonmatchingBracket":{backgroundColor:`#bb555544`}}),_h=1e4,vh=`()[]{}`,yh=V.define({combine(e){return Ki(e,{afterCursor:!0,brackets:vh,maxScanDistance:_h,renderMatch:Sh})}}),bh=K.mark({class:`cm-matchingBracket`}),xh=K.mark({class:`cm-nonmatchingBracket`});function Sh(e){let t=[],n=e.matched?bh:xh;return t.push(n.range(e.start.from,e.start.to)),e.end&&t.push(n.range(e.end.from,e.end.to)),t}function Ch(e){let t=[],n=e.facet(yh);for(let r of e.selection.ranges){if(!r.empty)continue;let i=kh(e,r.head,-1,n)||r.head>0&&kh(e,r.head-1,1,n)||n.afterCursor&&(kh(e,r.head,1,n)||r.head<e.doc.length&&kh(e,r.head+1,-1,n));i&&(t=t.concat(n.renderMatch(i,e)))}return K.set(t,!0)}var wh=[_s.fromClass(class{constructor(e){this.paused=!1,this.decorations=Ch(e.state)}update(e){(e.docChanged||e.selectionSet||this.paused)&&(e.view.composing?(this.decorations=this.decorations.map(e.changes),this.paused=!0):(this.decorations=Ch(e.state),this.paused=!1))}},{decorations:e=>e.decorations}),gh];function Th(e={}){return[yh.of(e),wh]}var Eh=new Z;function Dh(e,t,n){let r=e.prop(t<0?Z.openedBy:Z.closedBy);if(r)return r;if(e.name.length==1){let r=n.indexOf(e.name);if(r>-1&&r%2==+(t<0))return[n[r+t]]}return null}function Oh(e){let t=e.type.prop(Eh);return t?t(e.node):e}function kh(e,t,n,r={}){let i=r.maxScanDistance||_h,a=r.brackets||vh,o=om(e),s=o.resolveInner(t,n);for(let r=s;r;r=r.parent){let i=Dh(r.type,n,a);if(i&&r.from<r.to){let o=Oh(r);if(o&&(n>0?t>=o.from&&t<o.to:t>o.from&&t<=o.to))return Ah(e,t,n,r,o,i,a)}}return jh(e,t,n,o,s.type,i,a)}function Ah(e,t,n,r,i,a,o){let s=r.parent,c={from:i.from,to:i.to},l=0,u=s?.cursor();if(u&&(n<0?u.childBefore(r.from):u.childAfter(r.to)))do if(n<0?u.to<=r.from:u.from>=r.to){if(l==0&&a.indexOf(u.type.name)>-1&&u.from<u.to){let e=Oh(u);return{start:c,end:e?{from:e.from,to:e.to}:void 0,matched:!0}}if(Dh(u.type,n,o))l++;else if(Dh(u.type,-n,o)){if(l==0){let e=Oh(u);return{start:c,end:e&&e.from<e.to?{from:e.from,to:e.to}:void 0,matched:!1}}l--}}while(n<0?u.prevSibling():u.nextSibling());return{start:c,matched:!1}}function jh(e,t,n,r,i,a,o){if(n<0?!t:t==e.doc.length)return null;let s=n<0?e.sliceDoc(t-1,t):e.sliceDoc(t,t+1),c=o.indexOf(s);if(c<0||c%2==0!=n>0)return null;let l={from:n<0?t-1:t,to:n>0?t+1:t},u=e.doc.iterRange(t,n>0?e.doc.length:0),d=0;for(let e=0;!u.next().done&&e<=a;){let a=u.value;n<0&&(e+=a.length);let s=t+e*n;for(let e=n>0?0:a.length-1,t=n>0?a.length:-1;e!=t;e+=n){let t=o.indexOf(a[e]);if(!(t<0||r.resolveInner(s+e,1).type!=i)){if(t%2==0==n>0)d++;else if(d==1)return{start:l,end:{from:s+e,to:s+e+1},matched:t>>1==c>>1};else d--}}n>0&&(e+=a.length)}return u.done?{start:l,matched:!1}:null}function Mh(e){return{name:e.name||``,token:e.token,blankLine:e.blankLine||(()=>{}),startState:e.startState||(()=>!0),copyState:e.copyState||Nh,indent:e.indent||(()=>null),languageData:e.languageData||{},tokenTable:e.tokenTable||Vh,mergeTokens:e.mergeTokens!==!1}}function Nh(e){if(typeof e!=`object`)return e;let t={};for(let n in e){let r=e[n];t[n]=r instanceof Array?r.slice():r}return t}var Ph=new WeakMap,Fh=class e extends im{constructor(e){let t=nm(e.languageData),n=Mh(e),r,i=new class extends Cp{createParse(e,t,n){return new zh(r,e,t,n)}};super(t,i,[],e.name),this.topNode=Zh(t,this),r=this,this.streamParser=n,this.stateAfter=new Z({perNode:!0}),this.tokenTable=e.tokenTable?new qh(n.tokenTable):Jh}static define(t){return new e(t)}getIndent(e){let t,{overrideIndentation:n}=e.options;n&&(t=Ph.get(e.state),t!=null&&t<e.pos-1e4&&(t=void 0));let r=Ih(this,e.node.tree,e.node.from,e.node.from,t??e.pos),i,a;if(r?(a=r.state,i=r.pos+1):(a=this.streamParser.startState(e.unit),i=e.node.from),e.pos-i>1e4)return null;for(;i<e.pos;){let t=e.state.doc.lineAt(i),r=Math.min(e.pos,t.to);if(t.length){let i=n?n(t.from):-1,o=new em(t.text,e.state.tabSize,e.unit,i<0?void 0:i);for(;o.pos<r-t.from;)Bh(this.streamParser.token,o,a)}else this.streamParser.blankLine(a,e.unit);if(r==e.pos)break;i=t.to+1}let o=e.lineAt(e.pos);return n&&t==null&&Ph.set(e.state,o.from),this.streamParser.indent(a,/^\s*(.*)/.exec(o.text)[1],e)}get allowsNesting(){return!1}};function Ih(e,t,n,r,i){let a=n>=r&&n+t.length<=i&&t.prop(e.stateAfter);if(a)return{state:e.streamParser.copyState(a),pos:n+t.length};for(let a=t.children.length-1;a>=0;a--){let o=t.children[a],s=n+t.positions[a],c=o instanceof np&&s<i&&Ih(e,o,s,r,i);if(c)return c}return null}function Lh(e,t,n,r,i){if(i&&n<=0&&r>=t.length)return t;!i&&n==0&&t.type==e.topNode&&(i=!0);for(let a=t.children.length-1;a>=0;a--){let o=t.positions[a],s=t.children[a],c;if(o<r&&s instanceof np){if(!(c=Lh(e,s,n-o,r-o,i)))break;return i?new np(t.type,t.children.slice(0,a).concat(c),t.positions.slice(0,a+1),o+c.length):c}}return null}function Rh(e,t,n,r,i){for(let i of t){let t=i.from+(i.openStart?25:0),a=i.to-(i.openEnd?25:0),o=t<=n&&a>n&&Ih(e,i.tree,0-i.offset,n,a),s;if(o&&o.pos<=r&&(s=Lh(e,i.tree,n+i.offset,o.pos+i.offset,!1)))return{state:o.state,tree:s}}return{state:e.streamParser.startState(i?vm(i):4),tree:np.empty}}var zh=class{constructor(e,t,n,r){this.lang=e,this.input=t,this.fragments=n,this.ranges=r,this.stoppedAt=null,this.chunks=[],this.chunkPos=[],this.chunk=[],this.chunkReused=void 0,this.rangeIndex=0,this.to=r[r.length-1].to;let i=lm.get(),a=r[0].from,{state:o,tree:s}=Rh(e,n,a,this.to,i?.state);this.state=o,this.parsedPos=this.chunkStart=a+s.length;for(let e=0;e<s.children.length;e++)this.chunks.push(s.children[e]),this.chunkPos.push(s.positions[e]);i&&this.parsedPos<i.viewport.from-1e5&&r.some(e=>e.from<=i.viewport.from&&e.to>=i.viewport.from)&&(this.state=this.lang.streamParser.startState(vm(i.state)),i.skipUntilInView(this.parsedPos,i.viewport.from),this.parsedPos=i.viewport.from),this.moveRangeIndex()}advance(){let e=lm.get(),t=this.stoppedAt==null?this.to:Math.min(this.to,this.stoppedAt),n=Math.min(t,this.chunkStart+512);for(e&&(n=Math.min(n,e.viewport.to));this.parsedPos<n;)this.parseLine(e);return this.chunkStart<this.parsedPos&&this.finishChunk(),this.parsedPos>=t?this.finish():e&&this.parsedPos>=e.viewport.to?(e.skipUntilInView(this.parsedPos,t),this.finish()):null}stopAt(e){this.stoppedAt=e}lineAfter(e){let t=this.input.chunk(e);if(this.input.lineChunks)t==`
`&&(t=``);else{let e=t.indexOf(`
`);e>-1&&(t=t.slice(0,e))}return e+t.length<=this.to?t:t.slice(0,this.to-e)}nextLine(){let e=this.parsedPos,t=this.lineAfter(e),n=e+t.length;for(let e=this.rangeIndex;;){let r=this.ranges[e].to;if(r>=n||(t=t.slice(0,r-(n-t.length)),e++,e==this.ranges.length))break;let i=this.ranges[e].from,a=this.lineAfter(i);t+=a,n=i+a.length}return{line:t,end:n}}skipGapsTo(e,t,n){for(;;){let r=this.ranges[this.rangeIndex].to,i=e+t;if(n>0?r>i:r>=i)break;let a=this.ranges[++this.rangeIndex].from;t+=a-r}return t}moveRangeIndex(){for(;this.ranges[this.rangeIndex].to<this.parsedPos;)this.rangeIndex++}emitToken(e,t,n,r){let i=4;if(this.ranges.length>1){r=this.skipGapsTo(t,r,1),t+=r;let e=this.chunk.length;r=this.skipGapsTo(n,r,-1),n+=r,i+=this.chunk.length-e}let a=this.chunk.length-4;return this.lang.streamParser.mergeTokens&&i==4&&a>=0&&this.chunk[a]==e&&this.chunk[a+2]==t?this.chunk[a+2]=n:this.chunk.push(e,t,n,i),r}parseLine(e){let{line:t,end:n}=this.nextLine(),r=0,{streamParser:i}=this.lang,a=new em(t,e?e.state.tabSize:4,e?vm(e.state):2);if(a.eol())i.blankLine(this.state,a.indentUnit);else for(;!a.eol();){let e=Bh(i.token,a,this.state);if(e&&(r=this.emitToken(this.lang.tokenTable.resolve(e),this.parsedPos+a.start,this.parsedPos+a.pos,r)),a.start>1e4)break}this.parsedPos=n,this.moveRangeIndex(),this.parsedPos<this.to&&this.parsedPos++}finishChunk(){let e=np.build({buffer:this.chunk,start:this.chunkStart,length:this.parsedPos-this.chunkStart,nodeSet:Uh,topID:0,maxBufferLength:512,reused:this.chunkReused});e=new np(e.type,e.children,e.positions,e.length,[[this.lang.stateAfter,this.lang.streamParser.copyState(this.state)]]),this.chunks.push(e),this.chunkPos.push(this.chunkStart-this.ranges[0].from),this.chunk=[],this.chunkReused=void 0,this.chunkStart=this.parsedPos}finish(){return new np(this.lang.topNode,this.chunks,this.chunkPos,this.parsedPos-this.ranges[0].from).balance()}};function Bh(e,t,n){t.start=t.pos;for(let r=0;r<10;r++){let r=e(t,n);if(t.pos>t.start)return r}throw Error(`Stream parser failed to advance stream.`)}var Vh=Object.create(null),Hh=[Zf.none],Uh=new Qf(Hh),Wh=[],Gh=Object.create(null),Kh=Object.create(null);for(let[e,t]of[[`variable`,`variableName`],[`variable-2`,`variableName.special`],[`string-2`,`string.special`],[`def`,`variableName.definition`],[`tag`,`tagName`],[`attribute`,`attributeName`],[`type`,`typeName`],[`builtin`,`variableName.standard`],[`qualifier`,`modifier`],[`error`,`invalid`],[`header`,`heading`],[`property`,`propertyName`]])Kh[e]=Xh(Vh,t);var qh=class{constructor(e){this.extra=e,this.table=Object.assign(Object.create(null),Kh)}resolve(e){return e?this.table[e]||(this.table[e]=Xh(this.extra,e)):0}},Jh=new qh(Vh);function Yh(e,t){Wh.indexOf(e)>-1||(Wh.push(e),console.warn(t))}function Xh(e,t){let n=[];for(let r of t.split(` `)){let t=[];for(let n of r.split(`.`)){let r=e[n]||$[n];r?typeof r==`function`?t.length?t=t.map(r):Yh(n,`Modifier ${n} used at start of tag`):t.length?Yh(n,`Tag ${n} used as modifier`):t=Array.isArray(r)?r:[r]:Yh(n,`Unknown highlighting tag ${n}`)}for(let e of t)n.push(e)}if(!n.length)return 0;let r=t.replace(/ /g,`_`),i=r+` `+n.map(e=>e.id),a=Gh[i];if(a)return a.id;let o=Gh[i]=Zf.define({id:Hh.length,name:r,props:[jp({[r]:n})]});return Hh.push(o),o.id}function Zh(e,t){let n=Zf.define({id:Hh.length,name:`Document`,props:[tm.add(()=>e),Sm.add(()=>e=>t.getIndent(e))],top:!0});return Hh.push(n),n}q.RTL,q.LTR;var Qh=e=>{let{state:t}=e,n=t.doc.lineAt(t.selection.main.from),r=rg(e.state,n.from);return r.line?eg(e):r.block?ng(e):!1};function $h(e,t){return({state:n,dispatch:r})=>{if(n.readOnly)return!1;let i=e(t,n);return i?(r(n.update(i)),!0):!1}}var eg=$h(cg,0),tg=$h(sg,0),ng=$h((e,t)=>sg(e,t,og(t)),0);function rg(e,t){let n=e.languageDataAt(`commentTokens`,t,1);return n.length?n[0]:{}}var ig=50;function ag(e,{open:t,close:n},r,i){let a=e.sliceDoc(r-ig,r),o=e.sliceDoc(i,i+ig),s=/\s*$/.exec(a)[0].length,c=/^\s*/.exec(o)[0].length,l=a.length-s;if(a.slice(l-t.length,l)==t&&o.slice(c,c+n.length)==n)return{open:{pos:r-s,margin:s&&1},close:{pos:i+c,margin:c&&1}};let u,d;i-r<=100?u=d=e.sliceDoc(r,i):(u=e.sliceDoc(r,r+ig),d=e.sliceDoc(i-ig,i));let f=/^\s*/.exec(u)[0].length,p=/\s*$/.exec(d)[0].length,m=d.length-p-n.length;return u.slice(f,f+t.length)==t&&d.slice(m,m+n.length)==n?{open:{pos:r+f+t.length,margin:+!!/\s/.test(u.charAt(f+t.length))},close:{pos:i-p-n.length,margin:+!!/\s/.test(d.charAt(m-1))}}:null}function og(e){let t=[];for(let n of e.selection.ranges){let r=e.doc.lineAt(n.from),i=n.to<=r.to?r:e.doc.lineAt(n.to);i.from>r.from&&i.from==n.to&&(i=n.to==r.to+1?r:e.doc.lineAt(n.to-1));let a=t.length-1;a>=0&&t[a].to>r.from?t[a].to=i.to:t.push({from:r.from+/^\s*/.exec(r.text)[0].length,to:i.to})}return t}function sg(e,t,n=t.selection.ranges){let r=n.map(e=>rg(t,e.from).block);if(!r.every(e=>e))return null;let i=n.map((e,n)=>ag(t,r[n],e.from,e.to));if(e!=2&&!i.every(e=>e))return{changes:t.changes(n.map((e,t)=>i[t]?[]:[{from:e.from,insert:r[t].open+` `},{from:e.to,insert:` `+r[t].close}]))};if(e!=1&&i.some(e=>e)){let e=[];for(let t=0,n;t<i.length;t++)if(n=i[t]){let i=r[t],{open:a,close:o}=n;e.push({from:a.pos-i.open.length,to:a.pos+a.margin},{from:o.pos-o.margin,to:o.pos+i.close.length})}return{changes:e}}return null}function cg(e,t,n=t.selection.ranges){let r=[],i=-1;ranges:for(let{from:e,to:a}of n){let n=r.length,o=1e9,s;for(let n=e;n<=a;){let c=t.doc.lineAt(n);if(s==null&&(s=rg(t,c.from).line,!s))continue ranges;if(c.from>i&&(e==a||a>c.from)){i=c.from;let e=/^\s*/.exec(c.text)[0].length,t=e==c.length,n=c.text.slice(e,e+s.length)==s?e:-1;e<c.text.length&&e<o&&(o=e),r.push({line:c,comment:n,token:s,indent:e,empty:t,single:!1})}n=c.to+1}if(o<1e9)for(let e=n;e<r.length;e++)r[e].indent<r[e].line.text.length&&(r[e].indent=o);r.length==n+1&&(r[n].single=!0)}if(e!=2&&r.some(e=>e.comment<0&&(!e.empty||e.single))){let e=[];for(let{line:t,token:n,indent:i,empty:a,single:o}of r)(o||!a)&&e.push({from:t.from+i,insert:n+` `});let n=t.changes(e);return{changes:n,selection:t.selection.map(n,1)}}if(e!=1&&r.some(e=>e.comment>=0)){let e=[];for(let{line:t,comment:n,token:i}of r)if(n>=0){let r=t.from+n,a=r+i.length;t.text[a-t.from]==` `&&a++,e.push({from:r,to:a})}return{changes:e}}return null}var lg=Oi.define(),ug=Oi.define(),dg=V.define(),fg=V.define({combine(e){return Ki(e,{minDepth:100,newGroupDelay:500,joinToEvent:(e,t)=>t},{minDepth:Math.max,newGroupDelay:Math.min,joinToEvent:(e,t)=>(n,r)=>e(n,r)||t(n,r)})}}),pg=ui.define({create(){return Mg.empty},update(e,t){let n=t.state.facet(fg),r=t.annotation(lg);if(r){let i=bg.fromTransaction(t,r.selection),a=r.side,o=a==0?e.undone:e.done;return o=i?xg(o,o.length,n.minDepth,i):Dg(o,t.startState.selection),new Mg(a==0?r.rest:o,a==0?o:r.rest)}let i=t.annotation(ug);if((i==`full`||i==`before`)&&(e=e.isolate()),t.annotation(ji.addToHistory)===!1)return t.changes.empty?e:e.addMapping(t.changes.desc);let a=bg.fromTransaction(t),o=t.annotation(ji.time),s=t.annotation(ji.userEvent);return a?e=e.addChanges(a,o,s,n,t):t.selection&&(e=e.addSelection(t.startState.selection,o,s,n.newGroupDelay)),(i==`full`||i==`after`)&&(e=e.isolate()),e},toJSON(e){return{done:e.done.map(e=>e.toJSON()),undone:e.undone.map(e=>e.toJSON())}},fromJSON(e){return new Mg(e.done.map(bg.fromJSON),e.undone.map(bg.fromJSON))}});function mg(e={}){return[pg,fg.of(e),X.domEventHandlers({beforeinput(e,t){let n=e.inputType==`historyUndo`?gg:e.inputType==`historyRedo`?_g:null;return n?(e.preventDefault(),n(t)):!1}})]}function hg(e,t){return function({state:n,dispatch:r}){if(!t&&n.readOnly)return!1;let i=n.field(pg,!1);if(!i)return!1;let a=i.pop(e,n,t);return a?(r(a),!0):!1}}var gg=hg(0,!1),_g=hg(1,!1),vg=hg(0,!0),yg=hg(1,!0),bg=class e{constructor(e,t,n,r,i){this.changes=e,this.effects=t,this.mapped=n,this.startSelection=r,this.selectionsAfter=i}setSelAfter(t){return new e(this.changes,this.effects,this.mapped,this.startSelection,t)}toJSON(){return{changes:this.changes?.toJSON(),mapped:this.mapped?.toJSON(),startSelection:this.startSelection?.toJSON(),selectionsAfter:this.selectionsAfter.map(e=>e.toJSON())}}static fromJSON(t){return new e(t.changes&&Jr.fromJSON(t.changes),[],t.mapped&&qr.fromJSON(t.mapped),t.startSelection&&B.fromJSON(t.startSelection),t.selectionsAfter.map(B.fromJSON))}static fromTransaction(t,n){let r=Tg;for(let e of t.startState.facet(dg)){let n=e(t);n.length&&(r=r.concat(n))}return!r.length&&t.changes.empty?null:new e(t.changes.invert(t.startState.doc),r,void 0,n||t.startState.selection,Tg)}static selection(t){return new e(void 0,Tg,void 0,void 0,t)}};function xg(e,t,n,r){let i=t+1>n+20?t-n-1:0,a=e.slice(i,t);return a.push(r),a}function Sg(e,t){let n=[],r=!1;return e.iterChangedRanges((e,t)=>n.push(e,t)),t.iterChangedRanges((e,t,i,a)=>{for(let e=0;e<n.length;){let t=n[e++],o=n[e++];a>=t&&i<=o&&(r=!0)}}),r}function Cg(e,t){return e.ranges.length==t.ranges.length&&e.ranges.filter((e,n)=>e.empty!=t.ranges[n].empty).length===0}function wg(e,t){return e.length?t.length?e.concat(t):e:t}var Tg=[],Eg=200;function Dg(e,t){if(e.length){let n=e[e.length-1],r=n.selectionsAfter.slice(Math.max(0,n.selectionsAfter.length-Eg));return r.length&&r[r.length-1].eq(t)?e:(r.push(t),xg(e,e.length-1,1e9,n.setSelAfter(r)))}return[bg.selection([t])]}function Og(e){let t=e[e.length-1],n=e.slice();return n[e.length-1]=t.setSelAfter(t.selectionsAfter.slice(0,t.selectionsAfter.length-1)),n}function kg(e,t){if(!e.length)return e;let n=e.length,r=Tg;for(;n;){let i=Ag(e[n-1],t,r);if(i.changes&&!i.changes.empty||i.effects.length){let t=e.slice(0,n);return t[n-1]=i,t}t=i.mapped,n--,r=i.selectionsAfter}return r.length?[bg.selection(r)]:Tg}function Ag(e,t,n){let r=wg(e.selectionsAfter.length?e.selectionsAfter.map(e=>e.map(t)):Tg,n);if(!e.changes)return bg.selection(r);let i=e.changes.map(t),a=t.mapDesc(e.changes,!0),o=e.mapped?e.mapped.composeDesc(a):a;return new bg(i,H.mapEffects(e.effects,t),o,e.startSelection.map(a),r)}var jg=/^(input\.type|delete)($|\.)/,Mg=class e{constructor(e,t,n=0,r=void 0){this.done=e,this.undone=t,this.prevTime=n,this.prevUserEvent=r}isolate(){return this.prevTime?new e(this.done,this.undone):this}addChanges(t,n,r,i,a){let o=this.done,s=o[o.length-1];return o=s&&s.changes&&!s.changes.empty&&t.changes&&(!r||jg.test(r))&&(!s.selectionsAfter.length&&n-this.prevTime<i.newGroupDelay&&i.joinToEvent(a,Sg(s.changes,t.changes))||r==`input.type.compose`)?xg(o,o.length-1,i.minDepth,new bg(t.changes.compose(s.changes),wg(H.mapEffects(t.effects,s.changes),s.effects),s.mapped,s.startSelection,Tg)):xg(o,o.length,i.minDepth,t),new e(o,Tg,n,r)}addSelection(t,n,r,i){let a=this.done.length?this.done[this.done.length-1].selectionsAfter:Tg;return a.length>0&&n-this.prevTime<i&&r==this.prevUserEvent&&r&&/^select($|\.)/.test(r)&&Cg(a[a.length-1],t)?this:new e(Dg(this.done,t),this.undone,n,r)}addMapping(t){return new e(kg(this.done,t),kg(this.undone,t),this.prevTime,this.prevUserEvent)}pop(e,t,n){let r=e==0?this.done:this.undone;if(r.length==0)return null;let i=r[r.length-1],a=i.selectionsAfter[0]||(i.startSelection?i.startSelection.map(i.changes.invertedDesc,1):t.selection);if(n&&i.selectionsAfter.length)return t.update({selection:i.selectionsAfter[i.selectionsAfter.length-1],annotations:lg.of({side:e,rest:Og(r),selection:a}),userEvent:e==0?`select.undo`:`select.redo`,scrollIntoView:!0});if(i.changes){let n=r.length==1?Tg:r.slice(0,r.length-1);return i.mapped&&(n=kg(n,i.mapped)),t.update({changes:i.changes,selection:i.startSelection,effects:i.effects,annotations:lg.of({side:e,rest:n,selection:a}),filter:!1,userEvent:e==0?`undo`:`redo`,scrollIntoView:!0})}return null}};Mg.empty=new Mg(Tg,Tg);var Ng=[{key:`Mod-z`,run:gg,preventDefault:!0},{key:`Mod-y`,mac:`Mod-Shift-z`,run:_g,preventDefault:!0},{linux:`Ctrl-Shift-z`,run:_g,preventDefault:!0},{key:`Mod-u`,run:vg,preventDefault:!0},{key:`Alt-u`,mac:`Mod-Shift-u`,run:yg,preventDefault:!0}];function Pg(e,t){return B.create(e.ranges.map(t),e.mainIndex)}function Fg(e,t){return e.update({selection:t,scrollIntoView:!0,userEvent:`select`})}function Ig({state:e,dispatch:t},n){let r=Pg(e.selection,n);return!r.eq(e.selection,!0)&&(t(Fg(e,r)),!0)}function Lg(e,t){return B.cursor(t?e.to:e.from)}function Rg(e,t){return Ig(e,n=>n.empty?e.moveByChar(n,t):Lg(n,t))}function zg(e){return e.textDirectionAt(e.state.selection.main.head)==q.LTR}var Bg=e=>Rg(e,!zg(e)),Vg=e=>Rg(e,zg(e));function Hg(e,t){return Ig(e,n=>n.empty?e.moveByGroup(n,t):Lg(n,t))}var Ug=e=>Hg(e,!zg(e)),Wg=e=>Hg(e,zg(e));typeof Intl<`u`&&Intl.Segmenter;function Gg(e,t,n){if(t.type.prop(n))return!0;let r=t.to-t.from;return r&&(r>2||/[^\s,.;:]/.test(e.sliceDoc(t.from,t.to)))||t.firstChild}function Kg(e,t,n){let r=om(e).resolveInner(t.head),i=n?Z.closedBy:Z.openedBy;for(let a=t.head;;){let t=n?r.childAfter(a):r.childBefore(a);if(!t)break;Gg(e,t,i)?r=t:a=n?t.to:t.from}let a=r.type.prop(i),o,s;return s=a&&(o=n?kh(e,r.from,1):kh(e,r.to,-1))&&o.matched?n?o.end.to:o.end.from:n?r.to:r.from,B.cursor(s,n?-1:1)}var qg=e=>Ig(e,t=>Kg(e.state,t,!zg(e))),Jg=e=>Ig(e,t=>Kg(e.state,t,zg(e)));function Yg(e,t){return Ig(e,n=>{if(!n.empty)return Lg(n,t);let r=e.moveVertically(n,t);return r.head==n.head?e.moveToLineBoundary(n,t):r})}var Xg=e=>Yg(e,!1),Zg=e=>Yg(e,!0);function Qg(e){let t=e.scrollDOM.clientHeight<e.scrollDOM.scrollHeight-2,n=0,r=0,i;if(t){for(let t of e.state.facet(X.scrollMargins)){let i=t(e);i?.top&&(n=Math.max(i?.top,n)),i?.bottom&&(r=Math.max(i?.bottom,r))}i=e.scrollDOM.clientHeight-n-r}else i=(e.dom.ownerDocument.defaultView||window).innerHeight;return{marginTop:n,marginBottom:r,selfScroll:t,height:Math.max(e.defaultLineHeight,i-5)}}function $g(e,t){let n=Qg(e),{state:r}=e,i=Pg(r.selection,r=>r.empty?e.moveVertically(r,t,n.height):Lg(r,t));if(i.eq(r.selection))return!1;let a;if(n.selfScroll){let t=e.coordsAtPos(r.selection.main.head),o=e.scrollDOM.getBoundingClientRect(),s=o.top+n.marginTop,c=o.bottom-n.marginBottom;t&&t.top>s&&t.bottom<c&&(a=X.scrollIntoView(i.main.head,{y:`start`,yMargin:t.top-s}))}return e.dispatch(Fg(r,i),{effects:a}),!0}var e_=e=>$g(e,!1),t_=e=>$g(e,!0);function n_(e,t,n){let r=e.lineBlockAt(t.head),i=e.moveToLineBoundary(t,n);if(i.head==t.head&&i.head!=(n?r.to:r.from)&&(i=e.moveToLineBoundary(t,n,!1)),!n&&i.head==r.from&&r.length){let n=/^\s*/.exec(e.state.sliceDoc(r.from,Math.min(r.from+100,r.to)))[0].length;n&&t.head!=r.from+n&&(i=B.cursor(r.from+n))}return i}var r_=e=>Ig(e,t=>n_(e,t,!0)),i_=e=>Ig(e,t=>n_(e,t,!1)),a_=e=>Ig(e,t=>n_(e,t,!zg(e))),o_=e=>Ig(e,t=>n_(e,t,zg(e))),s_=e=>Ig(e,t=>e.moveToLineBoundary(t,!1,!1)),c_=e=>Ig(e,t=>e.moveToLineBoundary(t,!0,!1));function l_(e,t,n){let r=!1,i=Pg(e.selection,t=>{let i=kh(e,t.head,-1)||kh(e,t.head,1)||t.head>0&&kh(e,t.head-1,1)||t.head<e.doc.length&&kh(e,t.head+1,-1);if(!i||!i.end)return t;r=!0;let a=i.start.from==t.head?i.end.to:i.end.from;return n?B.range(t.anchor,a):B.cursor(a)});return r?(t(Fg(e,i)),!0):!1}var u_=({state:e,dispatch:t})=>l_(e,t,!1);function d_(e,t,n){let r=Pg(e.state.selection,e=>{e.undirectional&&e.head>=e.anchor!=t&&(e=B.range(e.head,e.anchor));let r=n(e);return B.range(e.anchor,r.head,r.goalColumn,r.bidiLevel||void 0,r.assoc)});return!r.eq(e.state.selection)&&(e.dispatch(Fg(e.state,r)),!0)}function f_(e,t){return d_(e,t,n=>e.moveByChar(n,t))}var p_=e=>f_(e,!zg(e)),m_=e=>f_(e,zg(e));function h_(e,t){return d_(e,t,n=>e.moveByGroup(n,t))}var g_=e=>h_(e,!zg(e)),__=e=>h_(e,zg(e)),v_=e=>{let t=!zg(e);return d_(e,t,n=>Kg(e.state,n,t))},y_=e=>{let t=zg(e);return d_(e,t,n=>Kg(e.state,n,t))};function b_(e,t){return d_(e,t,n=>e.moveVertically(n,t))}var x_=e=>b_(e,!1),S_=e=>b_(e,!0);function C_(e,t){return d_(e,t,n=>e.moveVertically(n,t,Qg(e).height))}var w_=e=>C_(e,!1),T_=e=>C_(e,!0),E_=e=>d_(e,!0,t=>n_(e,t,!0)),D_=e=>d_(e,!1,t=>n_(e,t,!1)),O_=e=>{let t=!zg(e);return d_(e,t,n=>n_(e,n,t))},k_=e=>{let t=zg(e);return d_(e,t,n=>n_(e,n,t))},A_=e=>d_(e,!1,t=>B.cursor(e.lineBlockAt(t.head).from)),j_=e=>d_(e,!0,t=>B.cursor(e.lineBlockAt(t.head).to)),M_=({state:e,dispatch:t})=>(t(Fg(e,{anchor:0})),!0),N_=({state:e,dispatch:t})=>(t(Fg(e,{anchor:e.doc.length})),!0),P_=({state:e,dispatch:t})=>(t(Fg(e,{anchor:e.selection.main.anchor,head:0})),!0),F_=({state:e,dispatch:t})=>(t(Fg(e,{anchor:e.selection.main.anchor,head:e.doc.length})),!0),I_=({state:e,dispatch:t})=>(t(e.update({selection:{anchor:0,head:e.doc.length},userEvent:`select`})),!0),L_=({state:e,dispatch:t})=>{let n=nv(e).map(({from:t,to:n})=>B.undirectionalRange(t,Math.min(n+1,e.doc.length)));return t(e.update({selection:B.create(n),userEvent:`select`})),!0},R_=({state:e,dispatch:t})=>{let n=Pg(e.selection,t=>{let n=om(e),r=n.resolveStack(t.from,1);if(t.empty){let e=n.resolveStack(t.from,-1);e.node.from>=r.node.from&&e.node.to<=r.node.to&&(r=e)}for(let e=r;e;e=e.next){let{node:n}=e;if((n.from<t.from&&n.to>=t.to||n.to>t.to&&n.from<=t.from)&&e.next)return B.undirectionalRange(n.from,n.to)}return t});return!n.eq(e.selection)&&(t(Fg(e,n)),!0)};function z_(e,t){let{state:n}=e,r=n.selection,i=n.selection.ranges.slice();for(let r of n.selection.ranges){let a=n.doc.lineAt(r.head);if(t?a.to<e.state.doc.length:a.from>0)for(let n=r;;){let r=e.moveVertically(n,t);if(r.head<a.from||r.head>a.to){i.some(e=>e.head==r.head)||i.push(r);break}if(r.head==n.head)break;n=r}}return i.length!=r.ranges.length&&(e.dispatch(Fg(n,B.create(i,i.length-1))),!0)}var B_=e=>z_(e,!1),V_=e=>z_(e,!0),H_=({state:e,dispatch:t})=>{let n=e.selection,r=null;return n.ranges.length>1?r=B.create([n.main]):n.main.empty||(r=B.create([B.cursor(n.main.head)])),r?(t(Fg(e,r)),!0):!1};function U_(e,t){if(e.state.readOnly)return!1;let n=`delete.selection`,{state:r}=e,i=r.changeByRange(r=>{let{from:i,to:a}=r;if(i==a){let o=t(r);o<i?(n=`delete.backward`,o=W_(e,o,!1)):o>i&&(n=`delete.forward`,o=W_(e,o,!0)),i=Math.min(i,o),a=Math.max(a,o)}else i=W_(e,i,!1),a=W_(e,a,!0);return i==a?{range:r}:{changes:{from:i,to:a},range:B.cursor(i,i<r.head?-1:1)}});return!i.changes.empty&&(e.dispatch(r.update(i,{scrollIntoView:!0,userEvent:n,effects:n==`delete.selection`?X.announce.of(r.phrase(`Selection deleted`)):void 0})),!0)}function W_(e,t,n){if(e instanceof X)for(let r of e.state.facet(X.atomicRanges).map(t=>t(e)))r.between(t,t,(e,r)=>{e<t&&r>t&&(t=n?r:e)});return t}var G_=(e,t,n)=>U_(e,r=>{let i=r.from,{state:a}=e,o=a.doc.lineAt(i),s,c;if(n&&!t&&i>o.from&&i<o.from+200&&!/[^ \t]/.test(s=o.text.slice(0,i-o.from))){if(s[s.length-1]==`	`)return i-1;let e=da(s,a.tabSize)%vm(a)||vm(a);for(let t=0;t<e&&s[s.length-1-t]==` `;t++)i--;c=i}else c=zr(o.text,i-o.from,t,t)+o.from,c==i&&o.number!=(t?a.doc.lines:1)?c+=t?1:-1:!t&&/[\ufe00-\ufe0f]/.test(o.text.slice(c-o.from,i-o.from))&&(c=zr(o.text,c-o.from,!1,!1)+o.from);return c}),K_=e=>G_(e,!1,!0),q_=e=>G_(e,!0,!1),J_=(e,t)=>U_(e,n=>{let r=n.head,{state:i}=e,a=i.doc.lineAt(r),o=i.charCategorizer(r);for(let e=null;;){if(r==(t?a.to:a.from)){r==n.head&&a.number!=(t?i.doc.lines:1)&&(r+=t?1:-1);break}let s=zr(a.text,r-a.from,t)+a.from,c=a.text.slice(Math.min(r,s)-a.from,Math.max(r,s)-a.from),l=o(c);if(e!=null&&l!=e)break;(c!=` `||r!=n.head)&&(e=l),r=s}return r}),Y_=e=>J_(e,!1),X_=e=>J_(e,!0),Z_=e=>U_(e,t=>{let n=e.lineBlockAt(t.head).to;return t.head<n?n:Math.min(e.state.doc.length,t.head+1)}),Q_=e=>U_(e,t=>{let n=e.moveToLineBoundary(t,!1).head;return t.head>n?n:Math.max(0,t.head-1)}),$_=e=>U_(e,t=>{let n=e.moveToLineBoundary(t,!0).head;return t.head<n?n:Math.min(e.state.doc.length,t.head+1)}),ev=({state:e,dispatch:t})=>{if(e.readOnly)return!1;let n=e.changeByRange(e=>({changes:{from:e.from,to:e.to,insert:z.of([``,``])},range:B.cursor(e.from)}));return t(e.update(n,{scrollIntoView:!0,userEvent:`input`})),!0},tv=({state:e,dispatch:t})=>{if(e.readOnly)return!1;let n=e.changeByRange(t=>{if(!t.empty||t.from==0||t.from==e.doc.length)return{range:t};let n=t.from,r=e.doc.lineAt(n),i=n==r.from?n-1:zr(r.text,n-r.from,!1)+r.from,a=n==r.to?n+1:zr(r.text,n-r.from,!0)+r.from;return{changes:{from:i,to:a,insert:e.doc.slice(n,a).append(e.doc.slice(i,n))},range:B.cursor(a)}});return!n.changes.empty&&(t(e.update(n,{scrollIntoView:!0,userEvent:`move.character`})),!0)};function nv(e){let t=[],n=-1;for(let r of e.selection.ranges){let i=e.doc.lineAt(r.from),a=e.doc.lineAt(r.to);if(!r.empty&&r.to==a.from&&(a=e.doc.lineAt(r.to-1)),n>=i.number){let e=t[t.length-1];e.to=a.to,e.ranges.push(r)}else t.push({from:i.from,to:a.to,ranges:[r]});n=a.number+1}return t}function rv(e,t,n){if(e.readOnly)return!1;let r=[],i=[];for(let t of nv(e)){if(n?t.to==e.doc.length:t.from==0)continue;let a=e.doc.lineAt(n?t.to+1:t.from-1),o=a.length+1;if(n){r.push({from:t.to,to:a.to},{from:t.from,insert:a.text+e.lineBreak});for(let n of t.ranges)i.push(B.range(Math.min(e.doc.length,n.anchor+o),Math.min(e.doc.length,n.head+o)))}else{r.push({from:a.from,to:t.from},{from:t.to,insert:e.lineBreak+a.text});for(let e of t.ranges)i.push(B.range(e.anchor-o,e.head-o))}}return r.length?(t(e.update({changes:r,scrollIntoView:!0,selection:B.create(i,e.selection.mainIndex),userEvent:`move.line`})),!0):!1}var iv=({state:e,dispatch:t})=>rv(e,t,!1),av=({state:e,dispatch:t})=>rv(e,t,!0);function ov(e,t,n){if(e.readOnly)return!1;let r=[];for(let t of nv(e))n?r.push({from:t.from,insert:e.doc.slice(t.from,t.to)+e.lineBreak}):r.push({from:t.to,insert:e.lineBreak+e.doc.slice(t.from,t.to)});let i=e.changes(r);return t(e.update({changes:i,selection:e.selection.map(i,n?1:-1),scrollIntoView:!0,userEvent:`input.copyline`})),!0}var sv=({state:e,dispatch:t})=>ov(e,t,!1),cv=({state:e,dispatch:t})=>ov(e,t,!0),lv=e=>{if(e.state.readOnly)return!1;let{state:t}=e,n=t.changes(nv(t).map(({from:e,to:n})=>(e>0?e--:n<t.doc.length&&n++,{from:e,to:n}))),r=Pg(t.selection,t=>{let n;if(e.lineWrapping){let r=e.lineBlockAt(t.head),i=e.coordsAtPos(t.head,t.assoc||1);i&&(n=r.bottom+e.documentTop-i.bottom+e.defaultLineHeight/2)}return e.moveVertically(t,!0,n)}).map(n);return e.dispatch({changes:n,selection:r,scrollIntoView:!0,userEvent:`delete.line`}),!0};function uv(e,t){if(/\(\)|\[\]|\{\}/.test(e.sliceDoc(t-1,t+1)))return{from:t,to:t};let n=om(e).resolveInner(t),r=n.childBefore(t),i=n.childAfter(t),a;return r&&i&&r.to<=t&&i.from>=t&&(a=r.type.prop(Z.closedBy))&&a.indexOf(i.name)>-1&&e.doc.lineAt(r.to).from==e.doc.lineAt(i.from).from&&!/\S/.test(e.sliceDoc(r.to,i.from))?{from:r.to,to:i.from}:null}var dv=pv(!1),fv=pv(!0);function pv(e){return({state:t,dispatch:n})=>{if(t.readOnly)return!1;let r=t.changeByRange(n=>{let{from:r,to:i}=n,a=t.doc.lineAt(r),o=!e&&r==i&&uv(t,r);e&&(r=i=(i<=a.to?a:t.doc.lineAt(i)).to);let s=new xm(t,{simulateBreak:r,simulateDoubleBreak:!!o}),c=bm(s,r);for(c??=da(/^\s*/.exec(t.doc.lineAt(r).text)[0],t.tabSize);i<a.to&&/\s/.test(a.text[i-a.from]);)i++;o?{from:r,to:i}=o:r>a.from&&r<a.from+100&&!/\S/.test(a.text.slice(0,r))&&(r=a.from);let l=[``,ym(t,c)];return o&&l.push(ym(t,s.lineIndent(a.from,-1))),{changes:{from:r,to:i,insert:z.of(l)},range:B.cursor(r+1+l[1].length)}});return n(t.update(r,{scrollIntoView:!0,userEvent:`input`})),!0}}function mv(e,t){let n=-1;return e.changeByRange(r=>{let i=[];for(let a=r.from;a<=r.to;){let o=e.doc.lineAt(a);o.number>n&&(r.empty||r.to>o.from)&&(t(o,i,r),n=o.number),a=o.to+1}let a=e.changes(i);return{changes:i,range:B.range(a.mapPos(r.anchor,1),a.mapPos(r.head,1))}})}var hv=({state:e,dispatch:t})=>{if(e.readOnly)return!1;let n=Object.create(null),r=new xm(e,{overrideIndentation:e=>n[e]??-1}),i=mv(e,(t,i,a)=>{let o=bm(r,t.from);if(o==null)return;/\S/.test(t.text)||(o=0);let s=/^\s*/.exec(t.text)[0],c=ym(e,o);(s!=c||a.from<t.from+s.length)&&(n[t.from]=o,i.push({from:t.from,to:t.from+s.length,insert:c}))});return i.changes.empty||t(e.update(i,{userEvent:`indent`})),!0},gv=({state:e,dispatch:t})=>!e.readOnly&&(t(e.update(mv(e,(t,n)=>{n.push({from:t.from,insert:e.facet(_m)})}),{userEvent:`input.indent`})),!0),_v=({state:e,dispatch:t})=>!e.readOnly&&(t(e.update(mv(e,(t,n)=>{let r=/^\s*/.exec(t.text)[0];if(!r)return;let i=da(r,e.tabSize),a=0,o=ym(e,Math.max(0,i-vm(e)));for(;a<r.length&&a<o.length&&r.charCodeAt(a)==o.charCodeAt(a);)a++;n.push({from:t.from+a,to:t.from+r.length,insert:o.slice(a)})}),{userEvent:`delete.dedent`})),!0),vv=e=>(e.setTabFocusMode(),!0),yv=[{key:`Ctrl-b`,run:Bg,shift:p_,preventDefault:!0},{key:`Ctrl-f`,run:Vg,shift:m_},{key:`Ctrl-p`,run:Xg,shift:x_},{key:`Ctrl-n`,run:Zg,shift:S_},{key:`Ctrl-a`,run:s_,shift:A_},{key:`Ctrl-e`,run:c_,shift:j_},{key:`Ctrl-d`,run:q_},{key:`Ctrl-h`,run:K_},{key:`Ctrl-k`,run:Z_},{key:`Ctrl-Alt-h`,run:Y_},{key:`Ctrl-o`,run:ev},{key:`Ctrl-t`,run:tv},{key:`Ctrl-v`,run:t_}],bv=[{key:`ArrowLeft`,run:Bg,shift:p_,preventDefault:!0},{key:`Mod-ArrowLeft`,mac:`Alt-ArrowLeft`,run:Ug,shift:g_,preventDefault:!0},{mac:`Cmd-ArrowLeft`,run:a_,shift:O_,preventDefault:!0},{key:`ArrowRight`,run:Vg,shift:m_,preventDefault:!0},{key:`Mod-ArrowRight`,mac:`Alt-ArrowRight`,run:Wg,shift:__,preventDefault:!0},{mac:`Cmd-ArrowRight`,run:o_,shift:k_,preventDefault:!0},{key:`ArrowUp`,run:Xg,shift:x_,preventDefault:!0},{mac:`Cmd-ArrowUp`,run:M_,shift:P_},{mac:`Ctrl-ArrowUp`,run:e_,shift:w_},{key:`ArrowDown`,run:Zg,shift:S_,preventDefault:!0},{mac:`Cmd-ArrowDown`,run:N_,shift:F_},{mac:`Ctrl-ArrowDown`,run:t_,shift:T_},{key:`PageUp`,run:e_,shift:w_},{key:`PageDown`,run:t_,shift:T_},{key:`Home`,run:i_,shift:D_,preventDefault:!0},{key:`Mod-Home`,run:M_,shift:P_},{key:`End`,run:r_,shift:E_,preventDefault:!0},{key:`Mod-End`,run:N_,shift:F_},{key:`Enter`,run:dv,shift:dv},{key:`Mod-a`,run:I_},{key:`Backspace`,run:K_,shift:K_,preventDefault:!0},{key:`Delete`,run:q_,preventDefault:!0},{key:`Mod-Backspace`,mac:`Alt-Backspace`,run:Y_,preventDefault:!0},{key:`Mod-Delete`,mac:`Alt-Delete`,run:X_,preventDefault:!0},{mac:`Mod-Backspace`,run:Q_,preventDefault:!0},{mac:`Mod-Delete`,run:$_,preventDefault:!0}].concat(yv.map(e=>({mac:e.key,run:e.run,shift:e.shift}))),xv=[{key:`Alt-ArrowLeft`,mac:`Ctrl-ArrowLeft`,run:qg,shift:v_},{key:`Alt-ArrowRight`,mac:`Ctrl-ArrowRight`,run:Jg,shift:y_},{key:`Alt-ArrowUp`,run:iv},{key:`Shift-Alt-ArrowUp`,run:sv},{key:`Alt-ArrowDown`,run:av},{key:`Shift-Alt-ArrowDown`,run:cv},{key:`Mod-Alt-ArrowUp`,run:B_},{key:`Mod-Alt-ArrowDown`,run:V_},{key:`Escape`,run:H_},{key:`Mod-Enter`,run:fv},{key:`Alt-l`,mac:`Ctrl-l`,run:L_},{key:`Mod-i`,run:R_,preventDefault:!0},{key:`Mod-[`,run:_v},{key:`Mod-]`,run:gv},{key:`Mod-Alt-\\`,run:hv},{key:`Shift-Mod-k`,run:lv},{key:`Shift-Mod-\\`,run:u_},{key:`Mod-/`,run:Qh},{key:`Alt-A`,mac:`Ctrl-A`,run:tg},{key:`Ctrl-m`,mac:`Shift-Alt-m`,run:vv}].concat(bv),Sv={key:`Tab`,run:gv,shift:_v},Cv=typeof String.prototype.normalize==`function`?e=>e.normalize(`NFKD`):e=>e,wv=class{constructor(e,t,n=0,r=e.length,i,a){this.test=a,this.value={from:0,to:0,precise:!1},this.done=!1,this.matches=[],this.buffer=``,this.bufferPos=0,this.iter=e.iterRange(n,r),this.bufferStart=n,this.normalize=i?e=>i(Cv(e)):Cv,this.query=this.normalize(t)}peek(){if(this.bufferPos==this.buffer.length){if(this.bufferStart+=this.buffer.length,this.iter.next(),this.iter.done)return-1;this.bufferPos=0,this.buffer=this.iter.value}return Hr(this.buffer,this.bufferPos)}next(){for(;this.matches.length;)this.matches.pop();return this.nextOverlapping()}nextOverlapping(){for(;;){let e=this.peek();if(e<0)return this.done=!0,this;let t=Ur(e),n=this.bufferStart+this.bufferPos;this.bufferPos+=Wr(e);let r=this.normalize(t);if(r.length)for(let e=0,i=n,a=!0;;e++){let n=r.charCodeAt(e),o=this.match(n,i,a,this.bufferPos+this.bufferStart,e==r.length-1);if(o)return this.value=o,this;if(e==r.length-1)break;a&&e<t.length&&t.charCodeAt(e)==n?i++:a=!1}}}match(e,t,n,r,i){let a=null;for(let t=0;t<this.matches.length;){let n=this.matches[t],o=!1;this.query.charCodeAt(n.index)==e&&(n.index==this.query.length-1?a={from:n.from,to:r,precise:i&&n.precise}:(n.index++,o=!0)),o?t++:this.matches.splice(t,1)}return this.query.charCodeAt(0)==e&&(this.query.length==1?a={from:t,to:r,precise:n&&i}:this.matches.push({from:t,index:1,precise:n})),a&&this.test&&!this.test(a.from,a.to,this.buffer,this.bufferStart)&&(a=null),a}};typeof Symbol<`u`&&(wv.prototype[Symbol.iterator]=function(){return this});var Tv={from:-1,to:-1,match:/.*/.exec(``),precise:!0},Ev=`gm`+(/x/.unicode==null?``:`u`),Dv=class{constructor(e,t,n,r=0,i=e.length){if(this.text=e,this.to=i,this.curLine=``,this.done=!1,this.value=Tv,/\\[sWDnr]|\n|\r|\[\^/.test(t))return new Av(e,t,n,r,i);this.re=new RegExp(t,Ev+(n?.ignoreCase?`i`:``)),this.test=n?.test,this.iter=e.iter();let a=e.lineAt(r);this.curLineStart=a.from,this.matchPos=Mv(e,r),this.getLine(this.curLineStart)}getLine(e){this.iter.next(e),this.iter.lineBreak?this.curLine=``:(this.curLine=this.iter.value,this.curLineStart+this.curLine.length>this.to&&(this.curLine=this.curLine.slice(0,this.to-this.curLineStart)),this.iter.next())}nextLine(){this.curLineStart=this.curLineStart+this.curLine.length+1,this.curLineStart>this.to?this.curLine=``:this.getLine(0)}next(){for(let e=this.matchPos-this.curLineStart;;){this.re.lastIndex=e;let t=this.matchPos<=this.to&&this.re.exec(this.curLine);if(t){let n=this.curLineStart+t.index,r=n+t[0].length;if(this.matchPos=Mv(this.text,r+ +(n==r)),n==this.curLineStart+this.curLine.length&&this.nextLine(),(n<r||n>this.value.to)&&(!this.test||this.test(n,r,t)))return this.value={from:n,to:r,precise:!0,match:t},this;e=this.matchPos-this.curLineStart}else if(this.curLineStart+this.curLine.length<this.to)this.nextLine(),e=0;else return this.done=!0,this}}},Ov=new WeakMap,kv=class e{constructor(e,t){this.from=e,this.text=t}get to(){return this.from+this.text.length}static get(t,n,r){let i=Ov.get(t);if(!i||i.from>=r||i.to<=n){let i=new e(n,t.sliceString(n,r));return Ov.set(t,i),i}if(i.from==n&&i.to==r)return i;let{text:a,from:o}=i;return o>n&&(a=t.sliceString(n,o)+a,o=n),i.to<r&&(a+=t.sliceString(i.to,r)),Ov.set(t,new e(o,a)),new e(n,a.slice(n-o,r-o))}},Av=class{constructor(e,t,n,r,i){this.text=e,this.to=i,this.done=!1,this.value=Tv,this.matchPos=Mv(e,r),this.re=new RegExp(t,Ev+(n?.ignoreCase?`i`:``)),this.test=n?.test,this.flat=kv.get(e,r,this.chunkEnd(r+5e3))}chunkEnd(e){return e>=this.to?this.to:this.text.lineAt(e).to}next(){for(;;){let e=this.re.lastIndex=this.matchPos-this.flat.from,t=this.re.exec(this.flat.text);if(t&&!t[0]&&t.index==e&&(this.re.lastIndex=e+1,t=this.re.exec(this.flat.text)),t){let e=this.flat.from+t.index,n=e+t[0].length;if((this.flat.to>=this.to||t.index+t[0].length<=this.flat.text.length-10)&&(!this.test||this.test(e,n,t)))return this.value={from:e,to:n,precise:!0,match:t},this.matchPos=Mv(this.text,n+ +(e==n)),this}if(this.flat.to==this.to)return this.done=!0,this;this.flat=kv.get(this.text,this.flat.from,this.chunkEnd(this.flat.from+this.flat.text.length*2))}}};typeof Symbol<`u`&&(Dv.prototype[Symbol.iterator]=Av.prototype[Symbol.iterator]=function(){return this});function jv(e){try{return new RegExp(e,Ev),!0}catch{return!1}}function Mv(e,t){if(t>=e.length)return t;let n=e.lineAt(t),r;for(;t<n.to&&(r=n.text.charCodeAt(t-n.from))>=56320&&r<57344;)t++;return t}var Nv=e=>{let t=hf(e,`cm-goto-line`);if(t){let e=t.dom.querySelector(`input[type=text]`);return e&&e.select(),!0}let{state:n}=e,r=String(n.doc.lineAt(e.state.selection.main.head).number),{close:i,result:a}=mf(e,{class:`cm-goto-line`,label:n.phrase(`Go to line`),input:{type:`text`,name:`line`,value:r},focus:!0,submitLabel:n.phrase(`go`)});return a.then(t=>{let r=t&&/^([+-])?(\d+)?(:\d+)?(%)?$/.exec(t.elements.line.value);if(!r){e.dispatch({effects:i});return}let a=n.doc.lineAt(n.selection.main.head),[,o,s,c,l]=r,u=c?+c.slice(1):0,d=s?+s:a.number;if(s&&l){let e=d/100;o&&(e=e*(o==`-`?-1:1)+a.number/n.doc.lines),d=Math.round(n.doc.lines*e)}else s&&o&&(d=d*(o==`-`?-1:1)+a.number);let f=n.doc.line(Math.max(1,Math.min(n.doc.lines,d))),p=B.cursor(f.from+Math.max(0,Math.min(u,f.length)));e.dispatch({effects:[i,X.scrollIntoView(p.from,{y:`center`})],selection:p})}),!0},Pv={highlightWordAroundCursor:!1,minSelectionLength:1,maxMatches:100,wholeWords:!1},Fv=V.define({combine(e){return Ki(e,Pv,{highlightWordAroundCursor:(e,t)=>e||t,minSelectionLength:Math.min,maxMatches:Math.min})}});function Iv(e){let t=[Hv,Vv];return e&&t.push(Fv.of(e)),t}var Lv=K.mark({class:`cm-selectionMatch`}),Rv=K.mark({class:`cm-selectionMatch cm-selectionMatch-main`});function zv(e,t,n,r){return(n==0||e(t.sliceDoc(n-1,n))!=Bi.Word)&&(r==t.doc.length||e(t.sliceDoc(r,r+1))!=Bi.Word)}function Bv(e,t,n,r){return e(t.sliceDoc(n,n+1))==Bi.Word&&e(t.sliceDoc(r-1,r))==Bi.Word}var Vv=_s.fromClass(class{constructor(e){this.decorations=this.getDeco(e)}update(e){(e.selectionSet||e.docChanged||e.viewportChanged)&&(this.decorations=this.getDeco(e.view))}getDeco(e){let t=e.state.facet(Fv),{state:n}=e,r=n.selection;if(r.ranges.length>1)return K.none;let i=r.main,a,o=null;if(i.empty){if(!t.highlightWordAroundCursor)return K.none;let e=n.wordAt(i.head);if(!e)return K.none;o=n.charCategorizer(i.head),a=n.sliceDoc(e.from,e.to)}else{let e=i.to-i.from;if(e<t.minSelectionLength||e>200)return K.none;if(t.wholeWords){if(a=n.sliceDoc(i.from,i.to),o=n.charCategorizer(i.head),!(zv(o,n,i.from,i.to)&&Bv(o,n,i.from,i.to)))return K.none}else if(a=n.sliceDoc(i.from,i.to),!a)return K.none}let s=[];for(let r of e.visibleRanges){let e=new wv(n.doc,a,r.from,r.to);for(;!e.next().done;){let{from:r,to:a}=e.value;if((!o||zv(o,n,r,a))&&(i.empty&&r<=i.from&&a>=i.to?s.push(Rv.range(r,a)):(r>=i.to||a<=i.from)&&s.push(Lv.range(r,a)),s.length>t.maxMatches))return K.none}}return K.set(s)}},{decorations:e=>e.decorations}),Hv=X.baseTheme({".cm-selectionMatch":{backgroundColor:`#99ff7780`},".cm-searchMatch .cm-selectionMatch":{backgroundColor:`transparent`}}),Uv=({state:e,dispatch:t})=>{let{selection:n}=e,r=B.create(n.ranges.map(t=>e.wordAt(t.head)||B.cursor(t.head)),n.mainIndex);return!r.eq(n)&&(t(e.update({selection:r})),!0)};function Wv(e,t){let{main:n,ranges:r}=e.selection,i=e.wordAt(n.head),a=i&&i.from==n.from&&i.to==n.to;for(let n=!1,i=new wv(e.doc,t,r[r.length-1].to);;)if(i.next(),i.done){if(n)return null;i=new wv(e.doc,t,0,Math.max(0,r[r.length-1].from-1)),n=!0}else{if(n&&r.some(e=>e.from==i.value.from))continue;if(a){let t=e.wordAt(i.value.from);if(!t||t.from!=i.value.from||t.to!=i.value.to)continue}return i.value}}var Gv=({state:e,dispatch:t})=>{let{ranges:n}=e.selection;if(n.some(e=>e.from===e.to))return Uv({state:e,dispatch:t});let r=e.sliceDoc(n[0].from,n[0].to);if(e.selection.ranges.some(t=>e.sliceDoc(t.from,t.to)!=r))return!1;let i=Wv(e,r);return i?(t(e.update({selection:e.selection.addRange(B.range(i.from,i.to),!1),effects:X.scrollIntoView(i.to)})),!0):!1},Kv=V.define({combine(e){return Ki(e,{top:!1,caseSensitive:!1,literal:!1,regexp:!1,wholeWord:!1,createPanel:e=>new Ey(e),scrollToMatch:e=>X.scrollIntoView(e)})}}),qv=class{constructor(e){this.search=e.search,this.caseSensitive=!!e.caseSensitive,this.literal=!!e.literal,this.regexp=!!e.regexp,this.replace=e.replace||``,this.valid=!!this.search&&(!this.regexp||jv(this.search)),this.unquoted=this.unquote(this.search),this.wholeWord=!!e.wholeWord,this.test=e.test}unquote(e){return this.literal?e:e.replace(/\\([nrt\\])/g,(e,t)=>t==`n`?`
`:t==`r`?`\r`:t==`t`?`	`:`\\`)}eq(e){return this.search==e.search&&this.replace==e.replace&&this.caseSensitive==e.caseSensitive&&this.regexp==e.regexp&&this.wholeWord==e.wholeWord&&this.test==e.test}create(){return this.regexp?new iy(this):new Qv(this)}getCursor(e,t=0,n){let r=e.doc?e:Gi.create({doc:e});return n??=r.doc.length,this.regexp?ey(this,r,t,n):Xv(this,r,t,n)}},Jv=class{constructor(e){this.spec=e}};function Yv(e,t,n){return(r,i,a,o)=>n&&!n(r,i,a,o)?!1:e(r>=o&&i<=o+a.length?a.slice(r-o,i-o):t.doc.sliceString(r,i),t,r,i)}function Xv(e,t,n,r){let i;return e.wholeWord&&(i=Zv(t.doc,t.charCategorizer(t.selection.main.head))),e.test&&(i=Yv(e.test,t,i)),new wv(t.doc,e.unquoted,n,r,e.caseSensitive?void 0:e=>e.toLowerCase(),i)}function Zv(e,t){return(n,r,i,a)=>((a>n||a+i.length<r)&&(a=Math.max(0,n-2),i=e.sliceString(a,Math.min(e.length,r+2))),(t(ty(i,n-a))!=Bi.Word||t(ny(i,n-a))!=Bi.Word)&&(t(ny(i,r-a))!=Bi.Word||t(ty(i,r-a))!=Bi.Word))}var Qv=class extends Jv{constructor(e){super(e)}nextMatch(e,t,n){let r=Xv(this.spec,e,n,e.doc.length).nextOverlapping();if(r.done){let n=Math.min(e.doc.length,t+this.spec.unquoted.length);r=Xv(this.spec,e,0,n).nextOverlapping()}return r.done||r.value.from==t&&r.value.to==n?null:r.value}prevMatchInRange(e,t,n){for(let r=n;;){let n=Math.max(t,r-1e4-this.spec.unquoted.length),i=Xv(this.spec,e,n,r),a=null;for(;!i.nextOverlapping().done;)a=i.value;if(a)return a;if(n==t)return null;r-=1e4}}prevMatch(e,t,n){let r=this.prevMatchInRange(e,0,t);return r||=this.prevMatchInRange(e,Math.max(0,n-this.spec.unquoted.length),e.doc.length),r&&(r.from!=t||r.to!=n)?r:null}getReplacement(e){return this.spec.unquote(this.spec.replace)}matchAll(e,t){let n=Xv(this.spec,e,0,e.doc.length),r=[];for(;!n.next().done;){if(r.length>=t)return null;r.push(n.value)}return r}highlight(e,t,n,r){let i=Xv(this.spec,e,Math.max(0,t-this.spec.unquoted.length),Math.min(n+this.spec.unquoted.length,e.doc.length));for(;!i.next().done;)r(i.value.from,i.value.to)}};function $v(e,t,n){return(r,i,a)=>(!n||n(r,i,a))&&e(a[0],t,r,i)}function ey(e,t,n,r){let i;return e.wholeWord&&(i=ry(t.charCategorizer(t.selection.main.head))),e.test&&(i=$v(e.test,t,i)),new Dv(t.doc,e.search,{ignoreCase:!e.caseSensitive,test:i},n,r)}function ty(e,t){return e.slice(zr(e,t,!1),t)}function ny(e,t){return e.slice(t,zr(e,t))}function ry(e){return(t,n,r)=>!r[0].length||(e(ty(r.input,r.index))!=Bi.Word||e(ny(r.input,r.index))!=Bi.Word)&&(e(ny(r.input,r.index+r[0].length))!=Bi.Word||e(ty(r.input,r.index+r[0].length))!=Bi.Word)}var iy=class extends Jv{nextMatch(e,t,n){let r=ey(this.spec,e,n,e.doc.length).next();return r.done&&(r=ey(this.spec,e,0,t).next()),r.done?null:r.value}prevMatchInRange(e,t,n){for(let r=1;;r++){let i=Math.max(t,n-r*1e4),a=ey(this.spec,e,i,n),o=null;for(;!a.next().done;)o=a.value;if(o&&(i==t||o.from>i+10))return o;if(i==t)return null}}prevMatch(e,t,n){return this.prevMatchInRange(e,0,t)||this.prevMatchInRange(e,n,e.doc.length)}getReplacement(e){return this.spec.unquote(this.spec.replace).replace(/\$([$&]|\d+)/g,(t,n)=>{if(n==`&`)return e.match[0];if(n==`$`)return`$`;for(let t=n.length;t>0;t--){let r=+n.slice(0,t);if(r>0&&r<e.match.length)return e.match[r]+n.slice(t)}return t})}matchAll(e,t){let n=ey(this.spec,e,0,e.doc.length),r=[];for(;!n.next().done;){if(r.length>=t)return null;r.push(n.value)}return r}highlight(e,t,n,r){let i=ey(this.spec,e,Math.max(0,t-250),Math.min(n+250,e.doc.length));for(;!i.next().done;)r(i.value.from,i.value.to)}},ay=H.define(),oy=H.define(),sy=ui.define({create(e){return new cy(by(e).create(),null)},update(e,t){for(let n of t.effects)n.is(ay)?e=new cy(n.value.create(),e.panel):n.is(oy)&&(e=new cy(e.query,n.value?yy:null));return e},provide:e=>pf.from(e,e=>e.panel)}),cy=class{constructor(e,t){this.query=e,this.panel=t}},ly=K.mark({class:`cm-searchMatch`}),uy=K.mark({class:`cm-searchMatch cm-searchMatch-selected`}),dy=_s.fromClass(class{constructor(e){this.view=e,this.decorations=this.highlight(e.state.field(sy))}update(e){let t=e.state.field(sy);(t!=e.startState.field(sy)||e.docChanged||e.selectionSet||e.viewportChanged)&&(this.decorations=this.highlight(t))}highlight({query:e,panel:t}){if(!t||!e.spec.valid)return K.none;let{view:n}=this,r=new ea;for(let t=0,i=n.visibleRanges,a=i.length;t<a;t++){let{from:o,to:s}=i[t];for(;t<a-1&&s>i[t+1].from-500;)s=i[++t].to;e.highlight(n.state,o,s,(e,t)=>{let i=n.state.selection.ranges.some(n=>n.from==e&&n.to==t);r.add(e,t,i?uy:ly)})}return r.finish()}},{decorations:e=>e.decorations});function fy(e){return t=>{let n=t.state.field(sy,!1);return n&&n.query.spec.valid?e(t,n):Cy(t)}}var py=fy((e,{query:t})=>{let{to:n}=e.state.selection.main,r=t.nextMatch(e.state,n,n);if(!r)return!1;let i=B.single(r.from,r.to),a=e.state.facet(Kv);return e.dispatch({selection:i,effects:[Ay(e,r),a.scrollToMatch(i.main,e)],userEvent:`select.search`}),Sy(e),!0}),my=fy((e,{query:t})=>{let{state:n}=e,{from:r}=n.selection.main,i=t.prevMatch(n,r,r);if(!i)return!1;let a=B.single(i.from,i.to),o=e.state.facet(Kv);return e.dispatch({selection:a,effects:[Ay(e,i),o.scrollToMatch(a.main,e)],userEvent:`select.search`}),Sy(e),!0}),hy=fy((e,{query:t})=>{let n=t.matchAll(e.state,1e3);return!n||!n.length?!1:(e.dispatch({selection:B.create(n.map(e=>B.range(e.from,e.to))),userEvent:`select.search.matches`}),!0)}),gy=({state:e,dispatch:t})=>{let n=e.selection;if(n.ranges.length>1||n.main.empty)return!1;let{from:r,to:i}=n.main,a=[],o=0;for(let t=new wv(e.doc,e.sliceDoc(r,i));!t.next().done;){if(a.length>1e3)return!1;t.value.from==r&&(o=a.length),a.push(B.range(t.value.from,t.value.to))}return t(e.update({selection:B.create(a,o),userEvent:`select.search.matches`})),!0},_y=fy((e,{query:t})=>{let{state:n}=e,{from:r,to:i}=n.selection.main;if(n.readOnly)return!1;let a=t.nextMatch(n,r,r);if(!a)return!1;let o=a,s=[],c,l,u=[];o.precise?o.from==r&&o.to==i&&(l=n.toText(t.getReplacement(o)),s.push({from:o.from,to:o.to,insert:l}),o=t.nextMatch(n,o.from,o.to),u.push(X.announce.of(n.phrase(`replaced match on line $`,n.doc.lineAt(r).number)+`.`))):o=t.nextMatch(n,o.from,o.to);let d=e.state.changes(s);return o&&(c=B.single(o.from,o.to).map(d),u.push(Ay(e,o)),u.push(n.facet(Kv).scrollToMatch(c.main,e))),e.dispatch({changes:d,selection:c,effects:u,userEvent:`input.replace`}),!0}),vy=fy((e,{query:t})=>{if(e.state.readOnly)return!1;let n=[];for(let r of t.matchAll(e.state,1e9)){let{from:e,to:i,precise:a}=r;a&&n.push({from:e,to:i,insert:t.getReplacement(r)})}if(!n.length)return!1;let r=e.state.phrase(`replaced $ matches`,n.length)+`.`;return e.dispatch({changes:n,effects:X.announce.of(r),userEvent:`input.replace.all`}),!0});function yy(e){return e.state.facet(Kv).createPanel(e)}function by(e,t){let n=e.selection.main,r=n.empty||n.to>n.from+100?``:e.sliceDoc(n.from,n.to);if(t&&!r)return t;let i=e.facet(Kv);return new qv({search:t?.literal??i.literal?r:r.replace(/\n/g,`\\n`),caseSensitive:t?.caseSensitive??i.caseSensitive,literal:t?.literal??i.literal,regexp:t?.regexp??i.regexp,wholeWord:t?.wholeWord??i.wholeWord})}function xy(e){let t=lf(e,yy);return t&&t.dom.querySelector(`[main-field]`)}function Sy(e){let t=xy(e);t&&t==e.root.activeElement&&t.select()}var Cy=e=>{let t=e.state.field(sy,!1);if(t&&t.panel){let n=xy(e);if(n&&n!=e.root.activeElement){let r=by(e.state,t.query.spec);r.valid&&e.dispatch({effects:ay.of(r)}),n.focus(),n.select()}}else e.dispatch({effects:[oy.of(!0),t?ay.of(by(e.state,t.query.spec)):H.appendConfig.of(My)]});return!0},wy=e=>{let t=e.state.field(sy,!1);if(!t||!t.panel)return!1;let n=lf(e,yy);return n&&n.dom.contains(e.root.activeElement)&&e.focus(),e.dispatch({effects:oy.of(!1)}),!0},Ty=[{key:`Mod-f`,run:Cy,scope:`editor search-panel`},{key:`F3`,run:py,shift:my,scope:`editor search-panel`,preventDefault:!0},{key:`Mod-g`,run:py,shift:my,scope:`editor search-panel`,preventDefault:!0},{key:`Escape`,run:wy,scope:`editor search-panel`},{key:`Mod-Shift-l`,run:gy},{key:`Mod-Alt-g`,run:Nv},{key:`Mod-d`,run:Gv,preventDefault:!0}],Ey=class{constructor(e){this.view=e;let t=this.query=e.state.field(sy).query.spec;this.commit=this.commit.bind(this),this.searchField=W(`input`,{value:t.search,placeholder:Dy(e,`Find`),"aria-label":Dy(e,`Find`),class:`cm-textfield`,name:`search`,form:``,"main-field":`true`,onchange:this.commit,onkeyup:this.commit}),this.replaceField=W(`input`,{value:t.replace,placeholder:Dy(e,`Replace`),"aria-label":Dy(e,`Replace`),class:`cm-textfield`,name:`replace`,form:``,onchange:this.commit,onkeyup:this.commit}),this.caseField=W(`input`,{type:`checkbox`,name:`case`,form:``,checked:t.caseSensitive,onchange:this.commit}),this.reField=W(`input`,{type:`checkbox`,name:`re`,form:``,checked:t.regexp,onchange:this.commit}),this.wordField=W(`input`,{type:`checkbox`,name:`word`,form:``,checked:t.wholeWord,onchange:this.commit});function n(e,t,n){return W(`button`,{class:`cm-button`,name:e,onclick:t,type:`button`},n)}this.dom=W(`div`,{onkeydown:e=>this.keydown(e),class:`cm-search`},[this.searchField,n(`next`,()=>py(e),[Dy(e,`next`)]),n(`prev`,()=>my(e),[Dy(e,`previous`)]),n(`select`,()=>hy(e),[Dy(e,`all`)]),W(`label`,null,[this.caseField,Dy(e,`match case`)]),W(`label`,null,[this.reField,Dy(e,`regexp`)]),W(`label`,null,[this.wordField,Dy(e,`by word`)]),...e.state.readOnly?[]:[W(`br`),this.replaceField,n(`replace`,()=>_y(e),[Dy(e,`replace`)]),n(`replaceAll`,()=>vy(e),[Dy(e,`replace all`)])],W(`button`,{name:`close`,onclick:()=>wy(e),"aria-label":Dy(e,`close`),type:`button`},[`×`])])}commit(){let e=new qv({search:this.searchField.value,caseSensitive:this.caseField.checked,regexp:this.reField.checked,wholeWord:this.wordField.checked,replace:this.replaceField.value});e.eq(this.query)||(this.query=e,this.view.dispatch({effects:ay.of(e)}))}keydown(e){Lu(this.view,e,`search-panel`)?e.preventDefault():e.keyCode==13&&e.target==this.searchField?(e.preventDefault(),(e.shiftKey?my:py)(this.view)):e.keyCode==13&&e.target==this.replaceField&&(e.preventDefault(),_y(this.view))}update(e){for(let t of e.transactions)for(let e of t.effects)e.is(ay)&&!e.value.eq(this.query)&&this.setQuery(e.value)}setQuery(e){this.query=e,this.searchField.value=e.search,this.replaceField.value=e.replace,this.caseField.checked=e.caseSensitive,this.reField.checked=e.regexp,this.wordField.checked=e.wholeWord}mount(){this.searchField.select()}get pos(){return 80}get top(){return this.view.state.facet(Kv).top}};function Dy(e,t){return e.state.phrase(t)}var Oy=30,ky=/[\s\.,:;?!]/;function Ay(e,{from:t,to:n}){let r=e.state.doc.lineAt(t),i=e.state.doc.lineAt(n).to,a=Math.max(r.from,t-Oy),o=Math.min(i,n+Oy),s=e.state.sliceDoc(a,o);if(a!=r.from){for(let e=0;e<Oy;e++)if(!ky.test(s[e+1])&&ky.test(s[e])){s=s.slice(e);break}}if(o!=i){for(let e=s.length-1;e>s.length-Oy;e--)if(!ky.test(s[e-1])&&ky.test(s[e])){s=s.slice(0,e);break}}return X.announce.of(`${e.state.phrase(`current match`)}. ${s} ${e.state.phrase(`on line`)} ${r.number}.`)}var jy=X.baseTheme({".cm-panel.cm-search":{padding:`2px 6px 4px`,position:`relative`,"& [name=close]":{position:`absolute`,top:`0`,right:`4px`,backgroundColor:`inherit`,border:`none`,font:`inherit`,padding:0,margin:0},"& input, & button, & label":{margin:`.2em .6em .2em 0`},"& input[type=checkbox]":{marginRight:`.2em`},"& label":{fontSize:`80%`,whiteSpace:`pre`}},"&light .cm-searchMatch":{backgroundColor:`#ffff0054`},"&dark .cm-searchMatch":{backgroundColor:`#00ffff8a`},"&light .cm-searchMatch-selected":{backgroundColor:`#ff6a0054`},"&dark .cm-searchMatch-selected":{backgroundColor:`#ff00ff8a`}}),My=[sy,pi.low(dy),jy],Ny=class{constructor(e,t,n,r){this.state=e,this.pos=t,this.explicit=n,this.view=r,this.abortListeners=[],this.abortOnDocChange=!1}tokenBefore(e){let t=om(this.state).resolveInner(this.pos,-1);for(;t&&e.indexOf(t.name)<0;)t=t.parent;return t?{from:t.from,to:this.pos,text:this.state.sliceDoc(t.from,this.pos),type:t.type}:null}matchBefore(e){let t=this.state.doc.lineAt(this.pos),n=Math.max(t.from,this.pos-250),r=t.text.slice(n-t.from,this.pos-t.from),i=r.search(zy(e,!1));return i<0?null:{from:n+i,to:this.pos,text:r.slice(i)}}get aborted(){return this.abortListeners==null}addEventListener(e,t,n){e==`abort`&&this.abortListeners&&(this.abortListeners.push(t),n&&n.onDocChange&&(this.abortOnDocChange=!0))}};function Py(e){let t=Object.keys(e).join(``),n=/\w/.test(t);return n&&(t=t.replace(/\w/g,``)),`[${n?`\\w`:``}${t.replace(/[^\w\s]/g,`\\$&`)}]`}function Fy(e){let t=Object.create(null),n=Object.create(null);for(let{label:r}of e){t[r[0]]=!0;for(let e=1;e<r.length;e++)n[r[e]]=!0}let r=Py(t)+Py(n)+`*$`;return[RegExp(`^`+r),new RegExp(r)]}function Iy(e){let t=e.map(e=>typeof e==`string`?{label:e}:e),[n,r]=t.every(e=>/^\w+$/.test(e.label))?[/\w*$/,/\w+$/]:Fy(t);return e=>{let i=e.matchBefore(r);return i||e.explicit?{from:i?i.from:e.pos,options:t,validFor:n}:null}}var Ly=class{constructor(e,t,n,r){this.completion=e,this.source=t,this.match=n,this.score=r}};function Ry(e){return e.selection.main.from}function zy(e,t){let{source:n}=e,r=t&&n[0]!=`^`,i=n[n.length-1]!=`$`;return!r&&!i?e:RegExp(`${r?`^`:``}(?:${n})${i?`$`:``}`,e.flags??(e.ignoreCase?`i`:``))}var By=Oi.define();function Vy(e,t,n,r){let{main:i}=e.selection,a=n-i.from,o=r-i.from;return{...e.changeByRange(s=>{if(s!=i&&n!=r&&e.sliceDoc(s.from+a,s.from+o)!=e.sliceDoc(n,r))return{range:s};let c=e.toText(t);return{changes:{from:s.from+a,to:r==i.from?s.to:s.from+o,insert:c},range:B.cursor(s.from+a+c.length)}}),scrollIntoView:!0,userEvent:`input.complete`}}var Hy=new WeakMap;function Uy(e){if(!Array.isArray(e))return e;let t=Hy.get(e);return t||Hy.set(e,t=Iy(e)),t}var Wy=H.define(),Gy=H.define(),Ky=class{constructor(e){this.pattern=e,this.chars=[],this.folded=[],this.any=[],this.precise=[],this.byWord=[],this.score=0,this.matched=[];for(let t=0;t<e.length;){let n=Hr(e,t),r=Wr(n);this.chars.push(n);let i=e.slice(t,t+r),a=i.toUpperCase();this.folded.push(Hr(a==i?i.toLowerCase():a,0)),t+=r}this.astral=e.length!=this.chars.length}ret(e,t){return this.score=e,this.matched=t,this}match(e){if(this.pattern.length==0)return this.ret(-100,[]);if(e.length<this.pattern.length)return null;let{chars:t,folded:n,any:r,precise:i,byWord:a}=this;if(t.length==1){let r=Hr(e,0),i=Wr(r),a=i==e.length?0:-100;if(r!=t[0]){if(r==n[0])a+=-200;else return null}return this.ret(a,[0,i])}let o=e.indexOf(this.pattern);if(o==0)return this.ret(e.length==this.pattern.length?0:-100,[0,this.pattern.length]);let s=t.length,c=0;if(o<0){for(let i=0,a=Math.min(e.length,200);i<a&&c<s;){let a=Hr(e,i);(a==t[c]||a==n[c])&&(r[c++]=i),i+=Wr(a)}if(c<s)return null}let l=0,u=0,d=!1,f=0,p=-1,m=-1,h=/[a-z]/.test(e),g=!0;for(let r=0,c=Math.min(e.length,200),_=0;r<c&&u<s;){let c=Hr(e,r);o<0&&(l<s&&c==t[l]&&(i[l++]=r),f<s&&(c==t[f]||c==n[f]?(f==0&&(p=r),m=r+1,f++):f=0));let v,y=c<255?c>=48&&c<=57||c>=97&&c<=122?2:+(c>=65&&c<=90):(v=Ur(c))==v.toLowerCase()?v==v.toUpperCase()?0:2:1;(!r||y==1&&h||_==0&&y!=0)&&(t[u]==c||n[u]==c&&(d=!0)?a[u++]=r:a.length&&(g=!1)),_=y,r+=Wr(c)}return u==s&&a[0]==0&&g?this.result(-100+(d?-200:0),a,e):f==s&&p==0?this.ret(-200-e.length+(m==e.length?0:-100),[0,m]):o>-1?this.ret(-700-e.length,[o,o+this.pattern.length]):f==s?this.ret(-900-e.length,[p,m]):u==s?this.result(-100+(d?-200:0)+-700+(g?0:-1100),a,e):t.length==2?null:this.result((r[0]?-700:0)+-200+-1100,r,e)}result(e,t,n){let r=[],i=0;for(let e of t){let t=e+(this.astral?Wr(Hr(n,e)):1);i&&r[i-1]==e?r[i-1]=t:(r[i++]=e,r[i++]=t)}return this.ret(e-n.length,r)}},qy=class{constructor(e){this.pattern=e,this.matched=[],this.score=0,this.folded=e.toLowerCase()}match(e){if(e.length<this.pattern.length)return null;let t=e.slice(0,this.pattern.length),n=t==this.pattern?0:t.toLowerCase()==this.folded?-200:null;return n==null?null:(this.matched=[0,t.length],this.score=n+(e.length==this.pattern.length?0:-100),this)}},Jy=V.define({combine(e){return Ki(e,{activateOnTyping:!0,activateOnCompletion:()=>!1,activateOnTypingDelay:100,selectOnOpen:!0,override:null,closeOnBlur:!0,maxRenderedOptions:100,defaultKeymap:!0,tooltipClass:()=>``,optionClass:()=>``,aboveCursor:!1,icons:!0,addToOptions:[],positionInfo:Xy,filterStrict:!1,compareCompletions:(e,t)=>(e.sortText||e.label).localeCompare(t.sortText||t.label),interactionDelay:75,updateSyncTime:100},{defaultKeymap:(e,t)=>e&&t,closeOnBlur:(e,t)=>e&&t,icons:(e,t)=>e&&t,tooltipClass:(e,t)=>n=>Yy(e(n),t(n)),optionClass:(e,t)=>n=>Yy(e(n),t(n)),addToOptions:(e,t)=>e.concat(t),filterStrict:(e,t)=>e||t})}});function Yy(e,t){return e?t?e+` `+t:e:t}function Xy(e,t,n,r,i,a){let o=e.textDirection==q.RTL,s=o,c=!1,l=`top`,u,d,f=t.left-i.left,p=i.right-t.right,m=r.right-r.left,h=r.bottom-r.top;if(s&&f<Math.min(m,p)?s=!1:!s&&p<Math.min(m,f)&&(s=!0),m<=(s?f:p))u=Math.max(i.top,Math.min(n.top,i.bottom-h))-t.top,d=Math.min(400,s?f:p);else{c=!0,d=Math.min(400,(o?t.right:i.right-t.left)-30);let e=i.bottom-t.bottom;e>=h||e>t.top?u=n.bottom-t.top:(l=`bottom`,u=t.bottom-n.top)}let g=(t.bottom-t.top)/a.offsetHeight,_=(t.right-t.left)/a.offsetWidth;return{style:`${l}: ${u/g}px; max-width: ${d/_}px`,class:`cm-completionInfo-`+(c?o?`left-narrow`:`right-narrow`:s?`left`:`right`)}}var Zy=H.define();function Qy(e){let t=e.addToOptions.slice();return e.icons&&t.push({render(e){let t=document.createElement(`div`);return t.classList.add(`cm-completionIcon`),e.type&&t.classList.add(...e.type.split(/\s+/g).map(e=>`cm-completionIcon-`+e)),t.setAttribute(`aria-hidden`,`true`),t},position:20}),t.push({render(e,t,n,r){let i=document.createElement(`span`);i.className=`cm-completionLabel`;let a=e.displayLabel||e.label,o=0;for(let e=0;e<r.length;){let t=r[e++],n=r[e++];t>o&&i.appendChild(document.createTextNode(a.slice(o,t)));let s=i.appendChild(document.createElement(`span`));s.appendChild(document.createTextNode(a.slice(t,n))),s.className=`cm-completionMatchedText`,o=n}return o<a.length&&i.appendChild(document.createTextNode(a.slice(o))),i},position:50},{render(e){if(!e.detail)return null;let t=document.createElement(`span`);return t.className=`cm-completionDetail`,t.textContent=e.detail,t},position:80}),t.sort((e,t)=>e.position-t.position).map(e=>e.render)}function $y(e,t,n){if(e<=n)return{from:0,to:e};if(t<0&&(t=0),t<=e>>1){let e=Math.floor(t/n);return{from:e*n,to:(e+1)*n}}let r=Math.ceil((e-t)/n);return{from:e-r*n,to:e-(r-1)*n}}var eb=class{constructor(e,t,n){this.view=e,this.stateField=t,this.applyCompletion=n,this.info=null,this.infoDestroy=null,this.placeInfoReq={read:()=>this.measureInfo(),write:e=>this.placeInfo(e),key:this},this.space=null,this.currentClass=``;let r=e.state.field(t),{options:i,selected:a}=r.open,o=e.state.facet(Jy);this.optionContent=Qy(o),this.optionClass=o.optionClass,this.tooltipClass=o.tooltipClass,this.range=$y(i.length,a,o.maxRenderedOptions),this.dom=document.createElement(`div`),this.dom.className=`cm-tooltip-autocomplete`,this.updateTooltipClass(e.state),this.dom.addEventListener(`mousedown`,n=>{let{options:r}=e.state.field(t).open;for(let t=n.target,i;t&&t!=this.dom;t=t.parentNode)if(t.nodeName==`LI`&&(i=/-(\d+)$/.exec(t.id))&&+i[1]<r.length){this.applyCompletion(e,r[+i[1]]),n.preventDefault();return}if(n.target==this.list){let t=this.list.classList.contains(`cm-completionListIncompleteTop`)&&n.clientY<this.list.firstChild.getBoundingClientRect().top?this.range.from-1:this.list.classList.contains(`cm-completionListIncompleteBottom`)&&n.clientY>this.list.lastChild.getBoundingClientRect().bottom?this.range.to:null;t!=null&&(e.dispatch({effects:Zy.of(t)}),n.preventDefault())}}),this.dom.addEventListener(`focusout`,t=>{let n=e.state.field(this.stateField,!1);n&&n.tooltip&&e.state.facet(Jy).closeOnBlur&&t.relatedTarget!=e.contentDOM&&e.dispatch({effects:Gy.of(null)})}),this.showOptions(i,r.id)}mount(){this.updateSel()}showOptions(e,t){this.list&&this.list.remove(),this.list=this.dom.appendChild(this.createListBox(e,t,this.range)),this.list.addEventListener(`scroll`,()=>{this.info&&this.view.requestMeasure(this.placeInfoReq)})}update(e){let t=e.state.field(this.stateField),n=e.startState.field(this.stateField);if(this.updateTooltipClass(e.state),t!=n){let{options:r,selected:i,disabled:a}=t.open;n.open&&n.open.options==r||(this.range=$y(r.length,i,e.state.facet(Jy).maxRenderedOptions),this.showOptions(r,t.id)),this.updateSel(),a!=n.open?.disabled&&this.dom.classList.toggle(`cm-tooltip-autocomplete-disabled`,!!a)}}updateTooltipClass(e){let t=this.tooltipClass(e);if(t!=this.currentClass){for(let e of this.currentClass.split(` `))e&&this.dom.classList.remove(e);for(let e of t.split(` `))e&&this.dom.classList.add(e);this.currentClass=t}}positioned(e){this.space=e,this.info&&this.view.requestMeasure(this.placeInfoReq)}updateSel(){let e=this.view.state.field(this.stateField),t=e.open;(t.selected>-1&&t.selected<this.range.from||t.selected>=this.range.to)&&(this.range=$y(t.options.length,t.selected,this.view.state.facet(Jy).maxRenderedOptions),this.showOptions(t.options,e.id));let n=this.updateSelectedOption(t.selected);if(n){this.destroyInfo();let{completion:r}=t.options[t.selected],{info:i}=r;if(!i)return;let a=typeof i==`string`?document.createTextNode(i):i(r);if(!a)return;`then`in a?a.then(t=>{t&&this.view.state.field(this.stateField,!1)==e&&this.addInfoPane(t,r)}).catch(e=>ps(this.view.state,e,`completion info`)):(this.addInfoPane(a,r),n.setAttribute(`aria-describedby`,this.info.id))}}addInfoPane(e,t){this.destroyInfo();let n=this.info=document.createElement(`div`);if(n.className=`cm-tooltip cm-completionInfo`,n.id=`cm-completionInfo-`+Math.floor(Math.random()*65535).toString(16),e.nodeType!=null)n.appendChild(e),this.infoDestroy=null;else{let{dom:t,destroy:r}=e;n.appendChild(t),this.infoDestroy=r||null}this.dom.appendChild(n),this.view.requestMeasure(this.placeInfoReq)}updateSelectedOption(e){let t=null;for(let n=this.list.firstChild,r=this.range.from;n;n=n.nextSibling,r++)n.nodeName!=`LI`||!n.id?r--:r==e?n.hasAttribute(`aria-selected`)||(n.setAttribute(`aria-selected`,`true`),t=n):n.hasAttribute(`aria-selected`)&&(n.removeAttribute(`aria-selected`),n.removeAttribute(`aria-describedby`));return t&&nb(this.list,t),t}measureInfo(){let e=this.dom.querySelector(`[aria-selected]`);if(!e||!this.info)return null;let t=this.dom.getBoundingClientRect(),n=this.info.getBoundingClientRect(),r=e.getBoundingClientRect(),i=this.space;if(!i){let e=this.dom.ownerDocument.documentElement;i={left:0,top:0,right:e.clientWidth,bottom:e.clientHeight}}return r.top>Math.min(i.bottom,t.bottom)-10||r.bottom<Math.max(i.top,t.top)+10?null:this.view.state.facet(Jy).positionInfo(this.view,t,r,n,i,this.dom)}placeInfo(e){this.info&&(e?(e.style&&(this.info.style.cssText=e.style),this.info.className=`cm-tooltip cm-completionInfo `+(e.class||``)):this.info.style.cssText=`top: -1e6px`)}createListBox(e,t,n){let r=document.createElement(`ul`);r.id=t,r.setAttribute(`role`,`listbox`),r.setAttribute(`aria-expanded`,`true`),r.setAttribute(`aria-label`,this.view.state.phrase(`Completions`)),r.addEventListener(`mousedown`,e=>{e.target==r&&e.preventDefault()});let i=null;for(let a=n.from;a<n.to;a++){let{completion:o,match:s}=e[a],{section:c}=o;if(c){let e=typeof c==`string`?c:c.name;if(e!=i&&(a>n.from||n.from==0)){if(i=e,typeof c!=`string`&&c.header)r.appendChild(c.header(c));else{let t=r.appendChild(document.createElement(`completion-section`));t.textContent=e}}}let l=r.appendChild(document.createElement(`li`));l.id=t+`-`+a,l.setAttribute(`role`,`option`);let u=this.optionClass(o);u&&(l.className=u);for(let e of this.optionContent){let t=e(o,this.view.state,this.view,s);t&&l.appendChild(t)}}return n.from&&r.classList.add(`cm-completionListIncompleteTop`),n.to<e.length&&r.classList.add(`cm-completionListIncompleteBottom`),r}destroyInfo(){this.info&&=(this.infoDestroy&&this.infoDestroy(),this.info.remove(),null)}destroy(){this.destroyInfo()}};function tb(e,t){return n=>new eb(n,e,t)}function nb(e,t){let n=e.getBoundingClientRect(),r=t.getBoundingClientRect(),i=n.height/e.offsetHeight;r.top<n.top?e.scrollTop-=(n.top-r.top)/i:r.bottom>n.bottom&&(e.scrollTop+=(r.bottom-n.bottom)/i)}function rb(e){return(e.boost||0)*100+(e.apply?10:0)+(e.info?5:0)+ +!!e.type}function ib(e,t){let n=[],r=null,i=null,a=e=>{n.push(e);let{section:t}=e.completion;if(t){r||=[];let e=typeof t==`string`?t:t.name;r.some(t=>t.name==e)||r.push(typeof t==`string`?{name:e}:t)}},o=t.facet(Jy);for(let r of e)if(r.hasResult()){let e=r.result.getMatch;if(r.result.filter===!1)for(let t of r.result.options)a(new Ly(t,r.source,e?e(t):[],1e9-n.length));else{let n=t.sliceDoc(r.from,r.to),s,c=o.filterStrict?new qy(n):new Ky(n);for(let t of r.result.options)if(s=c.match(t.label)){let n=t.displayLabel?e?e(t,s.matched):[]:s.matched,o=s.score+(t.boost||0);if(a(new Ly(t,r.source,n,o)),typeof t.section==`object`&&t.section.rank===`dynamic`){let{name:e}=t.section;i||=Object.create(null),i[e]=Math.max(o,i[e]||-1e9)}}}}if(r){let e=Object.create(null),t=0,a=(e,t)=>(e.rank===`dynamic`&&t.rank===`dynamic`?i[t.name]-i[e.name]:0)||(typeof e.rank==`number`?e.rank:1e9)-(typeof t.rank==`number`?t.rank:1e9)||(e.name<t.name?-1:1);for(let n of r.sort(a))t-=1e5,e[n.name]=t;for(let t of n){let{section:n}=t.completion;n&&(t.score+=e[typeof n==`string`?n:n.name])}}let s=[],c=null,l=o.compareCompletions;for(let e of n.sort((e,t)=>t.score-e.score||l(e.completion,t.completion))){let t=e.completion;!c||c.label!=t.label||c.detail!=t.detail||c.type!=null&&t.type!=null&&c.type!=t.type||c.apply!=t.apply||c.boost!=t.boost?s.push(e):rb(e.completion)>rb(c)&&(s[s.length-1]=e),c=e.completion}return s}var ab=class e{constructor(e,t,n,r,i,a){this.options=e,this.attrs=t,this.tooltip=n,this.timestamp=r,this.selected=i,this.disabled=a}setSelected(t,n){return t==this.selected||t>=this.options.length?this:new e(this.options,ub(n,t),this.tooltip,this.timestamp,t,this.disabled)}static build(t,n,r,i,a,o){if(i&&!o&&t.some(e=>e.isPending))return i.setDisabled();let s=ib(t,n);if(!s.length)return i&&t.some(e=>e.isPending)?i.setDisabled():null;let c=n.facet(Jy).selectOnOpen?0:-1;if(i&&i.selected!=c&&i.selected!=-1){let e=i.options[i.selected].completion;for(let t=0;t<s.length;t++)if(s[t].completion==e){c=t;break}}return new e(s,ub(r,c),{pos:t.reduce((e,t)=>t.hasResult()?Math.min(e,t.from):e,1e8),create:yb,above:a.aboveCursor},i?i.timestamp:Date.now(),c,!1)}map(t){return new e(this.options,this.attrs,{...this.tooltip,pos:t.mapPos(this.tooltip.pos)},this.timestamp,this.selected,this.disabled)}setDisabled(){return new e(this.options,this.attrs,this.tooltip,this.timestamp,this.selected,!0)}},ob=class e{constructor(e,t,n){this.active=e,this.id=t,this.open=n}static start(){return new e(db,`cm-ac-`+Math.floor(Math.random()*2e6).toString(36),null)}update(t){let{state:n}=t,r=n.facet(Jy),i=(r.override||n.languageDataAt(`autocomplete`,Ry(n)).map(Uy)).map(e=>(this.active.find(t=>t.source==e)||new pb(e,+!!this.active.some(e=>e.state!=0))).update(t,r));i.length==this.active.length&&i.every((e,t)=>e==this.active[t])&&(i=this.active);let a=this.open,o=t.effects.some(e=>e.is(gb));a&&t.docChanged&&(a=a.map(t.changes)),t.selection||i.some(e=>e.hasResult()&&t.changes.touchesRange(e.from,e.to))||!sb(i,this.active)||o?a=ab.build(i,n,this.id,a,r,o):a&&a.disabled&&!i.some(e=>e.isPending)&&(a=null),!a&&i.every(e=>!e.isPending)&&i.some(e=>e.hasResult())&&(i=i.map(e=>e.hasResult()?new pb(e.source,0):e));for(let e of t.effects)e.is(Zy)&&(a&&=a.setSelected(e.value,this.id));return i==this.active&&a==this.open?this:new e(i,this.id,a)}get tooltip(){return this.open?this.open.tooltip:null}get attrs(){return this.open?this.open.attrs:this.active.length?cb:lb}};function sb(e,t){if(e==t)return!0;for(let n=0,r=0;;){for(;n<e.length&&!e[n].hasResult();)n++;for(;r<t.length&&!t[r].hasResult();)r++;let i=n==e.length,a=r==t.length;if(i||a)return i==a;if(e[n++].result!=t[r++].result)return!1}}var cb={"aria-autocomplete":`list`},lb={};function ub(e,t){let n={"aria-autocomplete":`list`,"aria-haspopup":`listbox`,"aria-controls":e};return t>-1&&(n[`aria-activedescendant`]=e+`-`+t),n}var db=[];function fb(e,t){if(e.isUserEvent(`input.complete`)){let n=e.annotation(By);if(n&&t.activateOnCompletion(n))return 12}let n=e.isUserEvent(`input.type`);return n&&t.activateOnTyping?5:n?1:e.isUserEvent(`delete.backward`)?2:e.selection?8:e.docChanged?16:0}var pb=class e{constructor(e,t,n=!1){this.source=e,this.state=t,this.explicit=n}hasResult(){return!1}get isPending(){return this.state==1}update(t,n){let r=fb(t,n),i=this;(r&8||r&16&&this.touches(t))&&(i=new e(i.source,0)),r&4&&i.state==0&&(i=new e(this.source,1)),i=i.updateFor(t,r);for(let n of t.effects)if(n.is(Wy))i=new e(i.source,1,n.value);else if(n.is(Gy))i=new e(i.source,0);else if(n.is(gb))for(let e of n.value)e.source==i.source&&(i=e);return i}updateFor(e,t){return this.map(e.changes)}map(e){return this}touches(e){return e.changes.touchesRange(Ry(e.state))}},mb=class e extends pb{constructor(e,t,n,r,i,a){super(e,3,t),this.limit=n,this.result=r,this.from=i,this.to=a}hasResult(){return!0}updateFor(t,n){if(!(n&3))return this.map(t.changes);let r=this.result;r.map&&!t.changes.empty&&(r=r.map(r,t.changes));let i=t.changes.mapPos(this.from),a=t.changes.mapPos(this.to,1),o=Ry(t.state);if(o>a||!r||n&2&&(Ry(t.startState)==this.from||o<this.limit))return new pb(this.source,n&4?1:0);let s=t.changes.mapPos(this.limit);return hb(r.validFor,t.state,i,a)?new e(this.source,this.explicit,s,r,i,a):r.update&&(r=r.update(r,i,a,new Ny(t.state,o,!1)))?new e(this.source,this.explicit,s,r,r.from,r.to??Ry(t.state)):new pb(this.source,1,this.explicit)}map(t){if(t.empty)return this;let n=this.result.map?this.result.map(this.result,t):this.result;return n?new e(this.source,this.explicit,t.mapPos(this.limit),n,t.mapPos(this.from),t.mapPos(this.to,1)):new pb(this.source,0)}touches(e){return e.changes.touchesRange(this.from,this.to)}};function hb(e,t,n,r){if(!e)return!1;let i=t.sliceDoc(n,r);return typeof e==`function`?e(i,n,r,t):zy(e,!0).test(i)}var gb=H.define({map(e,t){return e.map(e=>e.map(t))}}),_b=ui.define({create(){return ob.start()},update(e,t){return e.update(t)},provide:e=>[Jd.from(e,e=>e.tooltip),X.contentAttributes.from(e,e=>e.attrs)]});function vb(e,t){let n=t.completion.apply||t.completion.label,r=e.state.field(_b).active.find(e=>e.source==t.source);return r instanceof mb&&(typeof n==`string`?e.dispatch({...Vy(e.state,n,r.from,r.to),annotations:By.of(t.completion)}):n(e,t.completion,r.from,r.to),!0)}var yb=tb(_b,vb);function bb(e,t=`option`){return n=>{let r=n.state.field(_b,!1);if(!r||!r.open||r.open.disabled||Date.now()-r.open.timestamp<n.state.facet(Jy).interactionDelay)return!1;let i=1,a;t==`page`&&(a=of(n,r.open.tooltip))&&(i=Math.max(2,Math.floor(a.dom.offsetHeight/a.dom.querySelector(`li`).offsetHeight)-1));let{length:o}=r.open.options,s=r.open.selected>-1?r.open.selected+i*(e?1:-1):e?0:o-1;return s<0?s=t==`page`?0:o-1:s>=o&&(s=t==`page`?o-1:0),n.dispatch({effects:Zy.of(s)}),!0}}var xb=e=>{let t=e.state.field(_b,!1);return e.state.readOnly||!t||!t.open||t.open.selected<0||t.open.disabled||Date.now()-t.open.timestamp<e.state.facet(Jy).interactionDelay?!1:vb(e,t.open.options[t.open.selected])},Sb=e=>e.state.field(_b,!1)?(e.dispatch({effects:Wy.of(!0)}),!0):!1,Cb=e=>{let t=e.state.field(_b,!1);return!t||!t.active.some(e=>e.state!=0)?!1:(e.dispatch({effects:Gy.of(null)}),!0)},wb=class{constructor(e,t){this.active=e,this.context=t,this.time=Date.now(),this.updates=[],this.done=void 0}},Tb=50,Eb=1e3,Db=_s.fromClass(class{constructor(e){this.view=e,this.debounceUpdate=-1,this.running=[],this.debounceAccept=-1,this.pendingStart=!1,this.composing=0;for(let t of e.state.field(_b).active)t.isPending&&this.startQuery(t)}update(e){let t=e.state.field(_b),n=e.state.facet(Jy);if(!e.selectionSet&&!e.docChanged&&e.startState.field(_b)==t)return;let r=e.transactions.some(e=>{let t=fb(e,n);return t&8||(e.selection||e.docChanged)&&!(t&3)});for(let t=0;t<this.running.length;t++){let n=this.running[t];if(r||n.context.abortOnDocChange&&e.docChanged||n.updates.length+e.transactions.length>Tb&&Date.now()-n.time>Eb){for(let e of n.context.abortListeners)try{e()}catch(e){ps(this.view.state,e)}n.context.abortListeners=null,this.running.splice(t--,1)}else n.updates.push(...e.transactions)}this.debounceUpdate>-1&&clearTimeout(this.debounceUpdate),e.transactions.some(e=>e.effects.some(e=>e.is(Wy)))&&(this.pendingStart=!0);let i=this.pendingStart?50:n.activateOnTypingDelay;if(this.debounceUpdate=t.active.some(e=>e.isPending&&!this.running.some(t=>t.active.source==e.source))?setTimeout(()=>this.startUpdate(),i):-1,this.composing!=0)for(let t of e.transactions)t.isUserEvent(`input.type`)?this.composing=2:this.composing==2&&t.selection&&(this.composing=3)}startUpdate(){this.debounceUpdate=-1,this.pendingStart=!1;let{state:e}=this.view,t=e.field(_b);for(let e of t.active)e.isPending&&!this.running.some(t=>t.active.source==e.source)&&this.startQuery(e);this.running.length&&t.open&&t.open.disabled&&(this.debounceAccept=setTimeout(()=>this.accept(),this.view.state.facet(Jy).updateSyncTime))}startQuery(e){let{state:t}=this.view,n=new Ny(t,Ry(t),e.explicit,this.view),r=new wb(e,n);this.running.push(r),Promise.resolve(e.source(n)).then(e=>{r.context.aborted||(r.done=e||null,this.scheduleAccept())},e=>{this.view.dispatch({effects:Gy.of(null)}),ps(this.view.state,e)})}scheduleAccept(){this.running.every(e=>e.done!==void 0)?this.accept():this.debounceAccept<0&&(this.debounceAccept=setTimeout(()=>this.accept(),this.view.state.facet(Jy).updateSyncTime))}accept(){this.debounceAccept>-1&&clearTimeout(this.debounceAccept),this.debounceAccept=-1;let e=[],t=this.view.state.facet(Jy),n=this.view.state.field(_b);for(let r=0;r<this.running.length;r++){let i=this.running[r];if(i.done===void 0)continue;if(this.running.splice(r--,1),i.done){let n=Ry(i.updates.length?i.updates[0].startState:this.view.state),r=Math.min(n,i.done.from+ +!i.active.explicit),a=new mb(i.active.source,i.active.explicit,r,i.done,i.done.from,i.done.to??n);for(let e of i.updates)a=a.update(e,t);if(a.hasResult()){e.push(a);continue}}let a=n.active.find(e=>e.source==i.active.source);if(a&&a.isPending){if(i.done==null){let n=new pb(i.active.source,0);for(let e of i.updates)n=n.update(e,t);n.isPending||e.push(n)}else this.startQuery(a)}}(e.length||n.open&&n.open.disabled)&&this.view.dispatch({effects:gb.of(e)})}},{eventHandlers:{blur(e){let t=this.view.state.field(_b,!1);if(t&&t.tooltip&&this.view.state.facet(Jy).closeOnBlur){let n=t.open&&of(this.view,t.open.tooltip);n&&n.dom.contains(e.relatedTarget)||setTimeout(()=>this.view.dispatch({effects:Gy.of(null)}),10)}},compositionstart(){this.composing=1},compositionend(){this.composing==3&&setTimeout(()=>this.view.dispatch({effects:Wy.of(!1)}),20),this.composing=0}}}),Ob=typeof navigator==`object`&&/Win/.test(navigator.platform),kb=pi.highest(X.domEventHandlers({keydown(e,t){let n=t.state.field(_b,!1);if(!n||!n.open||n.open.disabled||n.open.selected<0||!e.key||e.key.length>1||e.ctrlKey&&!(Ob&&e.altKey)||e.metaKey)return!1;let r=n.open.options[n.open.selected],i=n.active.find(e=>e.source==r.source),a=r.completion.commitCharacters||i.result.commitCharacters;return a&&a.indexOf(e.key)>-1&&vb(t,r),!1}})),Ab=X.baseTheme({".cm-tooltip.cm-tooltip-autocomplete":{"& > ul":{fontFamily:`monospace`,whiteSpace:`nowrap`,overflow:`hidden auto`,maxWidth_fallback:`700px`,maxWidth:`min(700px, 95vw)`,minWidth:`250px`,maxHeight:`10em`,height:`100%`,listStyle:`none`,margin:0,padding:0,"& > li, & > completion-section":{padding:`1px 3px`,lineHeight:1.2},"& > li":{overflowX:`hidden`,textOverflow:`ellipsis`,cursor:`pointer`},"& > completion-section":{display:`list-item`,borderBottom:`1px solid silver`,paddingLeft:`0.5em`,opacity:.7}}},"&light .cm-tooltip-autocomplete ul li[aria-selected]":{background:`#17c`,color:`white`},"&light .cm-tooltip-autocomplete-disabled ul li[aria-selected]":{background:`#777`},"&dark .cm-tooltip-autocomplete ul li[aria-selected]":{background:`#347`,color:`white`},"&dark .cm-tooltip-autocomplete-disabled ul li[aria-selected]":{background:`#444`},".cm-completionListIncompleteTop:before, .cm-completionListIncompleteBottom:after":{content:`"···"`,opacity:.5,display:`block`,textAlign:`center`,cursor:`pointer`},".cm-tooltip.cm-completionInfo":{position:`absolute`,padding:`3px 9px`,width:`max-content`,maxWidth:`400px`,boxSizing:`border-box`,whiteSpace:`pre-line`},".cm-completionInfo.cm-completionInfo-left":{right:`100%`},".cm-completionInfo.cm-completionInfo-right":{left:`100%`},".cm-completionInfo.cm-completionInfo-left-narrow":{right:`30px`},".cm-completionInfo.cm-completionInfo-right-narrow":{left:`30px`},"&light .cm-snippetField":{backgroundColor:`#00000022`},"&dark .cm-snippetField":{backgroundColor:`#ffffff22`},".cm-snippetFieldPosition":{verticalAlign:`text-top`,width:0,height:`1.15em`,display:`inline-block`,margin:`0 -0.7px -.7em`,borderLeft:`1.4px dotted #888`},".cm-completionMatchedText":{textDecoration:`underline`},".cm-completionDetail":{marginLeft:`0.5em`,fontStyle:`italic`},".cm-completionIcon":{fontSize:`90%`,width:`.8em`,display:`inline-block`,textAlign:`center`,paddingRight:`.6em`,opacity:`0.6`,boxSizing:`content-box`},".cm-completionIcon-function, .cm-completionIcon-method":{"&:after":{content:`'ƒ'`}},".cm-completionIcon-class":{"&:after":{content:`'○'`}},".cm-completionIcon-interface":{"&:after":{content:`'◌'`}},".cm-completionIcon-variable":{"&:after":{content:`'𝑥'`}},".cm-completionIcon-constant":{"&:after":{content:`'𝐶'`}},".cm-completionIcon-type":{"&:after":{content:`'𝑡'`}},".cm-completionIcon-enum":{"&:after":{content:`'∪'`}},".cm-completionIcon-property":{"&:after":{content:`'□'`}},".cm-completionIcon-keyword":{"&:after":{content:`'🔑︎'`}},".cm-completionIcon-namespace":{"&:after":{content:`'▢'`}},".cm-completionIcon-text":{"&:after":{content:`'abc'`,fontSize:`50%`,verticalAlign:`middle`}}}),jb={brackets:[`(`,`[`,`{`,`'`,`"`],before:`)]}:;>`,stringPrefixes:[]},Mb=H.define({map(e,t){return t.mapPos(e,-1,Kr.TrackAfter)??void 0}}),Nb=new class extends qi{};Nb.startSide=1,Nb.endSide=-1;var Pb=ui.define({create(){return U.empty},update(e,t){if(e=e.map(t.changes),t.selection){let n=t.state.doc.lineAt(t.selection.main.head);e=e.update({filter:e=>e>=n.from&&e<=n.to})}for(let n of t.effects)n.is(Mb)&&(e=e.update({add:[Nb.range(n.value,n.value+1)]}));return e}});function Fb(){return[Bb,Pb]}var Ib=`()[]{}<>«»»«［］｛｝`;function Lb(e){for(let t=0;t<16;t+=2)if(Ib.charCodeAt(t)==e)return Ib.charAt(t+1);return Ur(e<128?e:e+1)}function Rb(e,t){return e.languageDataAt(`closeBrackets`,t)[0]||jb}var zb=typeof navigator==`object`&&/Android\b/.test(navigator.userAgent),Bb=X.inputHandler.of((e,t,n,r)=>{if((zb?e.composing:e.compositionStarted)||e.state.readOnly)return!1;let i=e.state.selection.main;if(r.length>2||r.length==2&&Wr(Hr(r,0))==1||t!=i.from||n!=i.to)return!1;let a=Hb(e.state,r);return a?(e.dispatch(a),!0):!1}),Vb=[{key:`Backspace`,run:({state:e,dispatch:t})=>{if(e.readOnly)return!1;let n=Rb(e,e.selection.main.head).brackets||jb.brackets,r=null,i=e.changeByRange(t=>{if(t.empty){let r=Gb(e.doc,t.head);for(let i of n)if(i==r&&Wb(e.doc,t.head)==Lb(Hr(i,0)))return{changes:{from:t.head-i.length,to:t.head+i.length},range:B.cursor(t.head-i.length)}}return{range:r=t}});return r||t(e.update(i,{scrollIntoView:!0,userEvent:`delete.backward`})),!r}}];function Hb(e,t){let n=Rb(e,e.selection.main.head),r=n.brackets||jb.brackets;for(let i of r){let a=Lb(Hr(i,0));if(t==i)return a==i?Jb(e,i,r.indexOf(i+i+i)>-1,n):Kb(e,i,a,n.before||jb.before);if(t==a&&Ub(e,e.selection.main.from))return qb(e,i,a)}return null}function Ub(e,t){let n=!1;return e.field(Pb).between(0,e.doc.length,e=>{e==t&&(n=!0)}),n}function Wb(e,t){let n=e.sliceString(t,t+2);return n.slice(0,Wr(Hr(n,0)))}function Gb(e,t){let n=e.sliceString(t-2,t);return Wr(Hr(n,0))==n.length?n:n.slice(1)}function Kb(e,t,n,r){let i=null,a=e.changeByRange(a=>{if(!a.empty)return{changes:[{insert:t,from:a.from},{insert:n,from:a.to}],effects:Mb.of(a.to+t.length),range:B.range(a.anchor+t.length,a.head+t.length)};let o=Wb(e.doc,a.head);return!o||/\s/.test(o)||r.indexOf(o)>-1?{changes:{insert:t+n,from:a.head},effects:Mb.of(a.head+t.length),range:B.cursor(a.head+t.length)}:{range:i=a}});return i?null:e.update(a,{scrollIntoView:!0,userEvent:`input.type`})}function qb(e,t,n){let r=null,i=e.changeByRange(t=>t.empty&&Wb(e.doc,t.head)==n?{changes:{from:t.head,to:t.head+n.length,insert:n},range:B.cursor(t.head+n.length)}:r={range:t});return r?null:e.update(i,{scrollIntoView:!0,userEvent:`input.type`})}function Jb(e,t,n,r){let i=r.stringPrefixes||jb.stringPrefixes,a=null,o=e.changeByRange(r=>{if(!r.empty)return{changes:[{insert:t,from:r.from},{insert:t,from:r.to}],effects:Mb.of(r.to+t.length),range:B.range(r.anchor+t.length,r.head+t.length)};let o=r.head,s=Wb(e.doc,o),c;if(s==t){if(Yb(e,o))return{changes:{insert:t+t,from:o},effects:Mb.of(o+t.length),range:B.cursor(o+t.length)};if(Ub(e,o)){let r=n&&e.sliceDoc(o,o+t.length*3)==t+t+t?t+t+t:t;return{changes:{from:o,to:o+r.length,insert:r},range:B.cursor(o+r.length)}}}else if(n&&e.sliceDoc(o-2*t.length,o)==t+t&&(c=Zb(e,o-2*t.length,i))>-1&&Yb(e,c))return{changes:{insert:t+t+t+t,from:o},effects:Mb.of(o+t.length),range:B.cursor(o+t.length)};else if(e.charCategorizer(o)(s)!=Bi.Word&&Zb(e,o,i)>-1&&!Xb(e,o,t,i))return{changes:{insert:t+t,from:o},effects:Mb.of(o+t.length),range:B.cursor(o+t.length)};return{range:a=r}});return a?null:e.update(o,{scrollIntoView:!0,userEvent:`input.type`})}function Yb(e,t){let n=om(e).resolveInner(t+1);return n.parent&&n.from==t}function Xb(e,t,n,r){let i=om(e).resolveInner(t,-1),a=r.reduce((e,t)=>Math.max(e,t.length),0);for(let o=0;o<5;o++){let o=e.sliceDoc(i.from,Math.min(i.to,i.from+n.length+a)),s=o.indexOf(n);if(!s||s>-1&&r.indexOf(o.slice(0,s))>-1){let t=i.firstChild;for(;t&&t.from==i.from&&t.to-t.from>n.length+s;){if(e.sliceDoc(t.to-n.length,t.to)==n)return!1;t=t.firstChild}return!0}let c=i.to==t&&i.parent;if(!c)break;i=c}return!1}function Zb(e,t,n){let r=e.charCategorizer(t);if(r(e.sliceDoc(t-1,t))!=Bi.Word)return t;for(let i of n){let n=t-i.length;if(e.sliceDoc(n,t)==i&&r(e.sliceDoc(n-1,n))!=Bi.Word)return n}return-1}function Qb(e={}){return[kb,_b,Jy.of(e),Db,ex,Ab]}var $b=[{key:`Ctrl-Space`,run:Sb},{mac:"Alt-`",run:Sb},{mac:`Alt-i`,run:Sb},{key:`Escape`,run:Cb},{key:`ArrowDown`,run:bb(!0)},{key:`ArrowUp`,run:bb(!1)},{key:`PageDown`,run:bb(!0,`page`)},{key:`PageUp`,run:bb(!1,`page`)},{key:`Enter`,run:xb}],ex=pi.highest(Pu.computeN([Jy],e=>e.facet(Jy).defaultKeymap?[$b]:[])),tx=class{constructor(e,t,n){this.from=e,this.to=t,this.diagnostic=n}},nx=class e{constructor(e,t,n){this.diagnostics=e,this.panel=t,this.selected=n}static init(t,n,r){let i=r.facet(_x).markerFilter;i&&(t=i(t,r));let a=t.slice().sort((e,t)=>e.from-t.from||e.to-t.to),o=new ea,s=[],c=0,l=r.doc.iter(),u=0,d=r.doc.length;for(let e=0;;){let t=e==a.length?null:a[e];if(!t&&!s.length)break;let n,r;if(s.length)n=c,r=s.reduce((e,t)=>Math.min(e,t.to),t&&t.from>n?t.from:1e8);else{if(n=t.from,n>d)break;r=t.to,s.push(t),e++}for(;e<a.length;){let t=a[e];if(t.from==n&&(t.to>t.from||t.to==n))s.push(t),e++,r=Math.min(t.to,r);else{r=Math.min(t.from,r);break}}r=Math.min(r,d);let i=!1;if(s.some(e=>e.from==n&&(e.to==r||r==d))&&(i=n==r,!i&&r-n<10)){let e=n-(u+l.value.length);e>0&&(l.next(e),u=n);for(let e=n;;){if(e>=r){i=!0;break}if(!l.lineBreak&&u+l.value.length>e)break;e=u+l.value.length,u+=l.value.length,l.next()}}let f=Ox(s);if(i)o.add(n,n,K.widget({widget:new xx(f),diagnostics:s.slice()}));else{let e=s.reduce((e,t)=>t.markClass?e+` `+t.markClass:e,``);o.add(n,r,K.mark({class:`cm-lintRange cm-lintRange-`+f+e,diagnostics:s.slice(),inclusiveEnd:s.some(e=>e.to>r)}))}if(c=r,c==d)break;for(let e=0;e<s.length;e++)s[e].to<=c&&s.splice(e--,1)}let f=o.finish();return new e(f,n,rx(f))}};function rx(e,t=null,n=0){let r=null;return e.between(n,1e9,(e,n,{spec:i})=>{if(!(t&&i.diagnostics.indexOf(t)<0)){if(!r)r=new tx(e,n,t||i.diagnostics[0]);else if(i.diagnostics.indexOf(r.diagnostic)<0)return!1;else r=new tx(r.from,n,r.diagnostic)}}),r}function ix(e,t){let n=t.pos,r=t.end||n,i=e.state.facet(_x).hideOn(e,n,r);if(i!=null)return i;let a=e.startState.doc.lineAt(t.pos);return!!(e.effects.some(e=>e.is(sx))||e.changes.touchesRange(a.from,Math.max(a.to,r)))}function ax(e,t){return e.field(ux,!1)?t:t.concat(H.appendConfig.of(Ax))}function ox(e,t){return{effects:ax(e,[sx.of(t)])}}var sx=H.define(),cx=H.define(),lx=H.define(),ux=ui.define({create(){return new nx(K.none,null,null)},update(e,t){if(t.docChanged&&e.diagnostics.size){let n=e.diagnostics.map(t.changes),r=null,i=e.panel;if(e.selected){let i=t.changes.mapPos(e.selected.from,1);r=rx(n,e.selected.diagnostic,i)||rx(n,null,i)}!n.size&&i&&t.state.facet(_x).autoPanel&&(i=null),e=new nx(n,i,r)}for(let n of t.effects)if(n.is(sx)){let r=t.state.facet(_x).autoPanel?n.value.length?Cx.open:null:e.panel;e=nx.init(n.value,r,t.state)}else n.is(cx)?e=new nx(e.diagnostics,n.value?Cx.open:null,e.selected):n.is(lx)&&(e=new nx(e.diagnostics,e.panel,n.value));return e},provide:e=>[pf.from(e,e=>e.panel),X.decorations.from(e,e=>e.diagnostics)]}),dx=K.mark({class:`cm-lintRange cm-lintRange-active`});function fx(e,t,n){let{diagnostics:r}=e.state.field(ux),i,a=-1,o=-1;r.between(t-+(n<0),t+ +(n>0),(e,r,{spec:s})=>{if(t>=e&&t<=r&&(e==r||(t>e||n>0)&&(t<r||n<0)))return i=s.diagnostics,a=e,o=r,!1});let s=e.state.facet(_x).tooltipFilter;return i&&s&&(i=s(i,e.state)),i?{pos:a,end:o,above:!0,create(){return{dom:px(e,i)}}}:null}function px(e,t){return W(`ul`,{class:`cm-tooltip-lint`},t.map(t=>bx(e,t,!1)))}var mx=e=>{let t=e.state.field(ux,!1);t&&t.panel||e.dispatch({effects:ax(e.state,[cx.of(!0)])});let n=lf(e,Cx.open);return n&&n.dom.querySelector(`.cm-panel-lint ul`).focus(),!0},hx=e=>{let t=e.state.field(ux,!1);return!t||!t.panel?!1:(e.dispatch({effects:cx.of(!1)}),!0)},gx=[{key:`Mod-Shift-m`,run:mx,preventDefault:!0},{key:`F8`,run:e=>{let t=e.state.field(ux,!1);if(!t)return!1;let n=e.state.selection.main,r=rx(t.diagnostics,null,n.to+1);return!r&&(r=rx(t.diagnostics,null,0),!r||r.from==n.from&&r.to==n.to)?!1:(e.dispatch({selection:{anchor:r.from,head:r.to},scrollIntoView:!0}),af(e,r.from,1,{tooltip:kx,until:e=>e.docChanged||e.newSelection.main.head<r.from||e.newSelection.main.head>r.to}),!0)}}],_x=V.define({combine(e){return{sources:e.map(e=>e.source).filter(e=>e!=null),...Ki(e.map(e=>e.config),{delay:750,markerFilter:null,tooltipFilter:null,needsRefresh:null,hideOn:()=>null},{delay:Math.max,markerFilter:vx,tooltipFilter:vx,needsRefresh:(e,t)=>e?t?n=>e(n)||t(n):e:t,hideOn:(e,t)=>e?t?(n,r,i)=>e(n,r,i)||t(n,r,i):e:t,autoPanel:(e,t)=>e||t})}}});function vx(e,t){return e?t?(n,r)=>t(e(n,r),r):e:t}function yx(e){let t=[];if(e)actions:for(let{name:n}of e){for(let e=0;e<n.length;e++){let r=n[e];if(/[a-zA-Z]/.test(r)&&!t.some(e=>e.toLowerCase()==r.toLowerCase())){t.push(r);continue actions}}t.push(``)}return t}function bx(e,t,n){let r=n?yx(t.actions):[];return W(`li`,{class:`cm-diagnostic cm-diagnostic-`+t.severity},W(`span`,{class:`cm-diagnosticText`},t.renderMessage?t.renderMessage(e):t.message),t.actions?.map((n,i)=>{let a=0,o=r=>{if(r.preventDefault(),a>Date.now()-100)return;let i=rx(e.state.field(ux).diagnostics,t);i&&n.apply(e,i.from,i.to),a=Date.now()},{name:s}=n,c=r[i]?s.indexOf(r[i]):-1,l=c<0?s:[s.slice(0,c),W(`u`,s.slice(c,c+1)),s.slice(c+1)];return W(`button`,{type:`button`,class:`cm-diagnosticAction`+(n.markClass?` `+n.markClass:``),onclick:o,onmousedown:o,"aria-label":` Action: ${s}${c<0?``:` (access key "${r[i]})"`}.`},l)}),t.source&&W(`div`,{class:`cm-diagnosticSource`},t.source))}var xx=class extends Ga{constructor(e){super(),this.sev=e}eq(e){return e.sev==this.sev}toDOM(){return W(`span`,{class:`cm-lintPoint cm-lintPoint-`+this.sev})}},Sx=class{constructor(e,t){this.diagnostic=t,this.id=`item_`+Math.floor(Math.random()*4294967295).toString(16),this.dom=bx(e,t,!0),this.dom.id=this.id,this.dom.setAttribute(`role`,`option`)}},Cx=class e{constructor(e){this.view=e,this.items=[];let t=t=>{if(!(t.ctrlKey||t.altKey||t.metaKey)){if(t.keyCode==27)hx(this.view),this.view.focus();else if(t.keyCode==38||t.keyCode==33)this.moveSelection((this.selectedIndex-1+this.items.length)%this.items.length);else if(t.keyCode==40||t.keyCode==34)this.moveSelection((this.selectedIndex+1)%this.items.length);else if(t.keyCode==36)this.moveSelection(0);else if(t.keyCode==35)this.moveSelection(this.items.length-1);else if(t.keyCode==13)this.view.focus();else if(t.keyCode>=65&&t.keyCode<=90&&this.selectedIndex>=0){let{diagnostic:n}=this.items[this.selectedIndex],r=yx(n.actions);for(let i=0;i<r.length;i++)if(r[i].toUpperCase().charCodeAt(0)==t.keyCode){let t=rx(this.view.state.field(ux).diagnostics,n);t&&n.actions[i].apply(e,t.from,t.to)}}else return;t.preventDefault()}},n=e=>{for(let t=0;t<this.items.length;t++)this.items[t].dom.contains(e.target)&&this.moveSelection(t)};this.list=W(`ul`,{tabIndex:0,role:`listbox`,"aria-label":this.view.state.phrase(`Diagnostics`),onkeydown:t,onclick:n}),this.dom=W(`div`,{class:`cm-panel-lint`},this.list,W(`button`,{type:`button`,name:`close`,"aria-label":this.view.state.phrase(`close`),onclick:()=>hx(this.view)},`×`)),this.update()}get selectedIndex(){let e=this.view.state.field(ux).selected;if(!e)return-1;for(let t=0;t<this.items.length;t++)if(this.items[t].diagnostic==e.diagnostic)return t;return-1}update(){let{diagnostics:e,selected:t}=this.view.state.field(ux),n=0,r=!1,i=null,a=new Set;for(e.between(0,this.view.state.doc.length,(e,o,{spec:s})=>{for(let e of s.diagnostics){if(a.has(e))continue;a.add(e);let o=-1,s;for(let t=n;t<this.items.length;t++)if(this.items[t].diagnostic==e){o=t;break}o<0?(s=new Sx(this.view,e),this.items.splice(n,0,s),r=!0):(s=this.items[o],o>n&&(this.items.splice(n,o-n),r=!0)),t&&s.diagnostic==t.diagnostic?s.dom.hasAttribute(`aria-selected`)||(s.dom.setAttribute(`aria-selected`,`true`),i=s):s.dom.hasAttribute(`aria-selected`)&&s.dom.removeAttribute(`aria-selected`),n++}});n<this.items.length&&!(this.items.length==1&&this.items[0].diagnostic.from<0);)r=!0,this.items.pop();this.items.length==0&&(this.items.push(new Sx(this.view,{from:-1,to:-1,severity:`info`,message:this.view.state.phrase(`No diagnostics`)})),r=!0),i?(this.list.setAttribute(`aria-activedescendant`,i.id),this.view.requestMeasure({key:this,read:()=>({sel:i.dom.getBoundingClientRect(),panel:this.list.getBoundingClientRect()}),write:({sel:e,panel:t})=>{let n=t.height/this.list.offsetHeight;e.top<t.top?this.list.scrollTop-=(t.top-e.top)/n:e.bottom>t.bottom&&(this.list.scrollTop+=(e.bottom-t.bottom)/n)}})):this.selectedIndex<0&&this.list.removeAttribute(`aria-activedescendant`),r&&this.sync()}sync(){let e=this.list.firstChild;function t(){let t=e;e=t.nextSibling,t.remove()}for(let n of this.items)if(n.dom.parentNode==this.list){for(;e!=n.dom;)t();e=n.dom.nextSibling}else this.list.insertBefore(n.dom,e);for(;e;)t()}moveSelection(e){if(this.selectedIndex<0)return;let t=rx(this.view.state.field(ux).diagnostics,this.items[e].diagnostic);t&&this.view.dispatch({selection:{anchor:t.from,head:t.to},scrollIntoView:!0,effects:lx.of(t)})}static open(t){return new e(t)}};function wx(e,t=`viewBox="0 0 40 40"`){return`url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" ${t}>${encodeURIComponent(e)}</svg>')`}function Tx(e){return wx(`<path d="m0 2.5 l2 -1.5 l1 0 l2 1.5 l1 0" stroke="${e}" fill="none" stroke-width=".7"/>`,`width="6" height="3"`)}var Ex=X.baseTheme({".cm-diagnostic":{padding:`3px 6px 3px 8px`,marginLeft:`-1px`,display:`block`,whiteSpace:`pre-wrap`},".cm-diagnostic-error":{borderLeft:`5px solid #d11`},".cm-diagnostic-warning":{borderLeft:`5px solid orange`},".cm-diagnostic-info":{borderLeft:`5px solid #999`},".cm-diagnostic-hint":{borderLeft:`5px solid #66d`},".cm-diagnosticAction":{font:`inherit`,border:`none`,padding:`2px 4px`,backgroundColor:`#444`,color:`white`,borderRadius:`3px`,marginLeft:`8px`,cursor:`pointer`},".cm-diagnosticSource":{fontSize:`70%`,opacity:.7},".cm-lintRange":{backgroundPosition:`left bottom`,backgroundRepeat:`repeat-x`,paddingBottom:`0.7px`},".cm-lintRange-error":{backgroundImage:Tx(`#f11`)},".cm-lintRange-warning":{backgroundImage:Tx(`orange`)},".cm-lintRange-info":{backgroundImage:Tx(`#999`)},".cm-lintRange-hint":{backgroundImage:Tx(`#66d`)},".cm-lintRange-active":{backgroundColor:`#ffdd9980`},".cm-tooltip-lint":{padding:0,margin:0},".cm-lintPoint":{position:`relative`,"&:after":{content:`""`,position:`absolute`,bottom:0,left:`-2px`,borderLeft:`3px solid transparent`,borderRight:`3px solid transparent`,borderBottom:`4px solid #d11`}},".cm-lintPoint-warning":{"&:after":{borderBottomColor:`orange`}},".cm-lintPoint-info":{"&:after":{borderBottomColor:`#999`}},".cm-lintPoint-hint":{"&:after":{borderBottomColor:`#66d`}},".cm-panel.cm-panel-lint":{position:`relative`,"& ul":{maxHeight:`100px`,overflowY:`auto`,"& [aria-selected]":{backgroundColor:`#ddd`,"& u":{textDecoration:`underline`}},"&:focus [aria-selected]":{background_fallback:`#bdf`,backgroundColor:`Highlight`,color_fallback:`white`,color:`HighlightText`},"& u":{textDecoration:`none`},padding:0,margin:0},"& [name=close]":{position:`absolute`,top:`0`,right:`2px`,background:`inherit`,border:`none`,font:`inherit`,padding:0,margin:0}},"&dark .cm-lintRange-active":{backgroundColor:`#86714a80`},"&dark .cm-panel.cm-panel-lint ul":{"& [aria-selected]":{backgroundColor:`#2e343e`}}});function Dx(e){return e==`error`?4:e==`warning`?3:e==`info`?2:1}function Ox(e){let t=`hint`,n=1;for(let r of e){let e=Dx(r.severity);e>n&&(n=e,t=r.severity)}return t}var kx=rf(fx,{hideOn:ix}),Ax=[ux,X.decorations.compute([ux],e=>{let{selected:t,panel:n}=e.field(ux);return!t||!n||t.from==t.to?K.none:K.set([dx.range(t.from,t.to)])}),kx,Ex],jx=[Vf(),Gf(),yd(),mg(),oh(),$u(),ld(),Gi.allowMultipleSelections.of(!0),Nm(),fh(hh,{fallback:!0}),Th(),Fb(),Qb(),Pd(),Ld(),Ed(),Iv(),Pu.of([...Vb,...xv,...Ty,...Ng,...Zm,...$b,...gx])],Mx=n(`<div class="editor svelte-1ctqrjb"></div>`);function Nx(e,t){v(t,!0);let n=oe(t,`heat`,3,null),r=oe(t,`readOnly`,3,!1),i=oe(t,`language`,3,`asm`),a=new hi,o=e=>[Gi.readOnly.of(e),X.editable.of(!e)],c,u,d=H.define({map:(e,t)=>({pos:t.mapPos(e.pos),on:e.on})}),f=H.define();class p extends bf{toDOM(){let e=document.createElement(`div`);return e.className=`cm-breakpoint-dot`,e}}let m=new p,h=ui.define({create:()=>U.empty,update(e,t){e=e.map(t.changes);for(let n of t.effects)n.is(d)?e=n.value.on?e.update({add:[m.range(n.value.pos)]}):e.update({filter:e=>e!==n.value.pos}):n.is(f)&&(e=U.empty);return e}});function g(e,t){let n=e.state.doc.lineAt(t).from,r=!1;e.state.field(h).between(n,n,()=>{r=!0}),e.dispatch({effects:d.of({pos:n,on:!r})})}function _(e){let t=new Set,n=e.field(h).iter();for(;n.value;)t.add(e.doc.lineAt(n.from).number),n.next();return[...t]}let y=[h,Tf({class:`cm-breakpoint-gutter`,markers:e=>e.state.field(h),initialSpacer:()=>m,domEventHandlers:{mousedown(e,t){return g(e,t.from),!0}}})],b=H.define(),x=K.line({class:`cm-pc-line`}),S=ui.define({create:()=>K.none,update(e,t){e=e.map(t.changes);for(let n of t.effects)if(n.is(b)){let r=n.value;e=r>=1&&r<=t.state.doc.lines?K.set([x.range(t.state.doc.line(r).from)]):K.none}return e},provide:e=>X.decorations.from(e)}),C=Array.from({length:25},(e,t)=>K.line({attributes:{style:`background-color: rgba(255, 82, 48, ${(.05+t/24*.5).toFixed(3)})`}}));class w extends bf{text;title;constructor(e,t){super(),this.text=e,this.title=t}eq(e){return e.text===this.text&&e.title===this.title}toDOM(){let e=document.createElement(`div`);return e.textContent=this.text,e.title=this.title,e}}let T=new w(`100.0%`,``),E=H.define(),ee={lines:K.none,markers:U.empty},D=ui.define({create:()=>ee,update(e,t){t.docChanged&&(e={lines:e.lines.map(t.changes),markers:e.markers.map(t.changes)});for(let n of t.effects){if(!n.is(E))continue;let r=n.value;if(!r||r.total===0){e=ee;continue}let i=t.state.doc,a=[],o=[],s=Math.min(i.lines,r.counts.length-1);for(let e=1;e<=s;e++){let t=r.counts[e];if(t===0)continue;let n=i.line(e).from,s=Math.round(Math.sqrt(t/r.max)*24);a.push(C[s].range(n));let c=t/r.total*100,l=`Ran ${t.toLocaleString(`en-US`)} times: ${c.toPrecision(3)}% of all instructions`;r.stall[e]>0&&(l+=`, and waited ${(r.stall[e]/ht).toPrecision(3)} s in STL`),o.push(new w(c<.05?`<0.1%`:c.toFixed(1)+`%`,l).range(n))}e={lines:K.set(a),markers:U.of(o)}}return e},provide:e=>X.decorations.from(e,e=>e.lines)}),O=Tf({class:`cm-heat-gutter`,markers:e=>e.state.field(D).markers,initialSpacer:()=>T}),te=new hi,re=Fh.define({startState:()=>({first:!0}),languageData:{commentTokens:{line:`;`}},token(e,t){if(e.sol()&&(t.first=!0),e.eatSpace())return null;if(e.peek()===`;`)return e.skipToEnd(),`comment`;let n=t.first;t.first=!1,e.match(/^\S+/);let r=e.current().toLowerCase();return n?r.startsWith(`.`)?`labelName`:r===`@define`||r===`#define`?`meta`:lt.has(r)||dt.includes(r)?`keyword`:null:r.startsWith(`.`)||r.startsWith(`~`)?`labelName`:/^[$r]\d+$/.test(r)||r===`sp`?`variableName`:/^[%#mp]?(0x[0-9a-f_]+|0b[01_]+|0o[0-7_]+|[+-]?\d[\d_]*)$/.test(r)?`number`:`atom`}}),k=new Set(`if else while do for return break continue switch case default goto sizeof typedef struct enum static const extern register volatile inline`.split(` `)),ie=new Set([`void`,`char`,`short`,`int`,`unsigned`,`signed`]),ae=Fh.define({startState:()=>({comment:!1,depth:0}),languageData:{commentTokens:{line:`//`,block:{open:`/*`,close:`*/`}},indentOnInput:/^\s*[})\]]$/},indent(e,t,n){if(e.comment)return null;let r=+!!/^\s*[})\]]/.test(t);return Math.max(0,e.depth-r)*n.unit},token(e,t){if(t.comment)return e.skipTo(`*/`)?(e.match(`*/`),t.comment=!1):e.skipToEnd(),`comment`;if(e.eatSpace())return null;if(e.match(`//`))return e.skipToEnd(),`comment`;if(e.match(`/*`))return t.comment=!0,`comment`;if(e.match(/^#\s*[A-Za-z]*/))return`meta`;if(e.match(/^"(?:[^"\\]|\\.)*"?/)||e.match(/^'(?:[^'\\]|\\.)*'?/))return`string`;if(e.match(/^(0[xX][0-9a-fA-F]+|0[bB][01]+|\d+)[uUlL]*/))return`number`;if(e.match(/^[A-Za-z_]\w*/)){let t=e.current();return k.has(t)?`keyword`:ie.has(t)?`typeName`:t in Xe?`atom`:null}let n=e.next();return n===`{`||n===`(`||n===`[`?t.depth++:(n===`}`||n===`)`||n===`]`)&&(t.depth=Math.max(0,t.depth-1)),null}}),se=new hi,le=e=>e===`c`?ae:re,ue=ch.define([{tag:$.comment,color:`#6b7689`,fontStyle:`italic`},{tag:$.keyword,color:`#7cb7ff`},{tag:$.typeName,color:`#7ee0a3`},{tag:$.string,color:`#e6c07b`},{tag:$.labelName,color:`#f2c14e`},{tag:$.meta,color:`#c792ea`},{tag:$.variableName,color:`#7ee0a3`},{tag:$.number,color:`#ff9d7a`},{tag:$.atom,color:`#9ad1d4`}]),de=X.theme({"&":{height:`100%`,backgroundColor:`var(--panel)`,color:`var(--text)`},".cm-scroller":{fontFamily:`var(--mono)`,fontSize:`13px`,lineHeight:`1.45`},".cm-gutters":{backgroundColor:`var(--panel)`,color:`var(--muted)`,border:`none`,borderRight:`1px solid var(--border)`},".cm-activeLine, .cm-activeLineGutter":{backgroundColor:`rgba(255,255,255,0.04)`},".cm-cursor":{borderLeftColor:`var(--text)`},"&.cm-focused .cm-selectionBackground, .cm-selectionBackground, ::selection":{backgroundColor:`rgba(124,183,255,0.25)`},".cm-breakpoint-gutter":{width:`16px`,cursor:`pointer`},".cm-breakpoint-gutter .cm-gutterElement":{display:`flex`,alignItems:`center`,justifyContent:`center`},".cm-breakpoint-dot":{width:`10px`,height:`10px`,borderRadius:`50%`,backgroundColor:`var(--red)`},".cm-heat-gutter":{color:`#ff9d7a`,fontSize:`11px`},".cm-heat-gutter .cm-gutterElement":{padding:`0 4px 0 6px`,textAlign:`right`},".cm-pc-line":{backgroundColor:`rgba(242,193,78,0.22) !important`},".cm-tooltip":{backgroundColor:`var(--panel-2)`,border:`1px solid var(--border)`}},{dark:!0});ce(()=>(u=new X({parent:c,state:Gi.create({doc:t.initialDoc,extensions:[y,jx,a.of(o(!1)),Pu.of([Sv]),Gi.tabSize.of(4),_m.of(`    `),se.of(le(i())),fh(ue),D,te.of([]),S,de,X.updateListener.of(e=>{e.docChanged&&t.onDocChange(e.state.doc.toString());let n=e.transactions.some(e=>e.effects.some(e=>e.is(d)||e.is(f)));if(n||e.docChanged){let r=_(e.startState),i=_(e.state);(n||r.join()!==i.join())&&t.onBreakpointsChange(i)}})]})}),()=>u?.destroy()));function fe(){return u?.state.doc.toString()??``}function pe(e){u&&(u.dispatch({changes:{from:0,to:u.state.doc.length,insert:e},effects:f.of(null)}),u.scrollDOM.scrollTop=0)}l(()=>{let e=r();u?.dispatch({effects:a.reconfigure(o(e))})}),l(()=>{let e=i();u?.dispatch({effects:se.reconfigure(le(e))})}),l(()=>{let e=t.currentLine;if(!u)return;let n=[b.of(e)];e>=1&&e<=u.state.doc.lines&&n.push(X.scrollIntoView(u.state.doc.line(e).from,{y:`nearest`,yMargin:60})),u.dispatch({effects:n})});let me=!1;l(()=>{let e=n();if(!u)return;let t=[E.of(e)];me!==!!e&&(me=!!e,t.push(te.reconfigure(e?O:[]))),u.dispatch({effects:t})}),l(()=>{let e=t.diagnostics;if(!u)return;let n=u.state.doc,r=e.filter(e=>e.line>=1&&e.line<=n.lines).map(e=>{let t=n.line(e.line);return{from:t.from,to:t.to,severity:e.severity,message:e.message}});u.dispatch(ox(u.state,r))});var he={getDoc:fe,setDoc:pe},ge=Mx();return ne(ge,e=>c=e,()=>c),A(e,ge),s(he)}var Px=n(`<span></span>`),Fx=n(`<button role="switch"><span class="knob svelte-1xr8x74"></span></button>`),Ix=n(`<button></button>`),Lx=n(`<div><!> <span class="label svelte-1xr8x74"> </span></div>`),Rx=n(`<div class="row svelte-1xr8x74"></div>`);function zx(n,r){v(r,!0);let i=Array.from({length:16},(e,t)=>15-t);function c(e,t){e.currentTarget.setPointerCapture(e.pointerId),r.onchange?.(r.value|1<<t)}function l(e){r.onchange?.(r.value&~(1<<e))}var u=Rx();E(u,20,()=>i,e=>e,(n,i)=>{let s=k(()=>(r.value>>i&1)==1);var u=Lx();let d;var p=t(u),h=e=>{var t=Px();let n;o(()=>{n=C(t,1,`led svelte-1xr8x74`,null,n,{on:D(s)}),re(t,`title`,`bit ${i??``}`)}),A(e,t)},g=e=>{var t=Fx();let n;o(()=>{n=C(t,1,`switch svelte-1xr8x74`,null,n,{on:D(s)}),re(t,`aria-checked`,D(s)),re(t,`aria-label`,`bit ${i??``}`),re(t,`title`,`bit ${i??``}`)}),O(`click`,t,()=>r.onchange?.(r.value^1<<i)),A(e,t)},_=t=>{var n=Ix();let r;o(()=>{r=C(n,1,`push svelte-1xr8x74`,null,r,{on:D(s)}),re(n,`aria-label`,`bit ${i??``}`),re(n,`title`,`bit ${i??``}`)}),O(`pointerdown`,n,e=>c(e,i)),O(`pointerup`,n,()=>l(i)),e(`pointercancel`,n,()=>l(i)),e(`lostpointercapture`,n,()=>l(i)),A(t,n)};b(p,e=>{r.mode===`led`?e(h):r.mode===`switch`?e(g,1):e(_,-1)});var v=m(p,2),x=a(v,!0);y(u),o(e=>{d=C(u,1,`cell svelte-1xr8x74`,null,d,{gap:i%4==0&&i!==0}),f(x,e)},[()=>i.toString(16).toUpperCase()]),A(n,u)}),y(u),A(n,u),s()}u([`click`,`pointerdown`,`pointerup`]);var Bx=n(`<button><span> </span> <small class="svelte-1u92r28"> </small></button>`),Vx=n(`<div class="dpad svelte-1u92r28"></div>`),Hx=n(`<span class="dim"> </span> <button class="svelte-1u92r28">Defaults</button>`,1),Ux=n(`<div class="gamepad svelte-1u92r28"><div class="controls svelte-1u92r28"><!> <div class="buttons svelte-1u92r28"></div></div> <div class="bind svelte-1u92r28"><button> </button> <!></div></div>`);function Wx(n,r){v(r,!0);let l=(n,i=d,s=d,c=d)=>{var l=Bx();let u,h;var g=t(l),_=a(g,!0),v=m(g,2),b=a(v,!0);y(l),o((e,t)=>{u=C(l,1,`ctl svelte-1u92r28`,null,u,{on:r.value>>i()&1,target:D(p)===i()}),re(l,`title`,`bit ${i()??``} · key ${e??``}`),h=se(l,``,h,{"grid-area":c()}),f(_,s()),f(b,t)},[()=>S(L.keys[i()]),()=>D(p)===i()?`?`:S(L.keys[i()])]),O(`pointerdown`,l,e=>ne(e,i())),O(`pointerup`,l,()=>k(i())),e(`pointercancel`,l,()=>k(i())),e(`lostpointercapture`,l,()=>k(i())),A(n,l)},u=c(!1),p=c(-1),g=0,_=0,x=()=>r.onchange(g|_);ce(()=>r.onchange(0));function S(e){if(!e)return`—`;let t={ArrowUp:`↑`,ArrowDown:`↓`,ArrowLeft:`←`,ArrowRight:`→`};return t[e]?t[e]:e===`Space`?`␣`:e.replace(/^(Key|Digit)/,``).replace(/^Numpad/,`N`)}function w(e){let t=e;return!!t&&(t.isContentEditable||[`INPUT`,`TEXTAREA`,`SELECT`].includes(t.tagName))}function T(e){if(D(u)&&D(p)>=0){e.preventDefault(),e.code!==`Escape`&&(L.keys.forEach((t,n)=>{t===e.code&&(L.keys[n]=``)}),L.keys[D(p)]=e.code),i(p,-1);return}if(D(u)||w(e.target)||e.ctrlKey||e.metaKey||e.altKey)return;let t=L.keys.indexOf(e.code);t<0||(e.preventDefault(),_|=1<<t,x())}function ee(e){let t=L.keys.indexOf(e.code);t<0||!(_&1<<t)||(_&=~(1<<t),x())}function te(){_=0,x()}function ne(e,t){D(u)?i(p,t,!0):(e.currentTarget.setPointerCapture(e.pointerId),g|=1<<t,x())}function k(e){g&1<<e&&(g&=~(1<<e),x())}let ie=[{offset:0,area:`up`,symbol:`▲`},{offset:1,area:`down`,symbol:`▼`},{offset:2,area:`left`,symbol:`◀`},{offset:3,area:`right`,symbol:`▶`}],ae=[`A`,`B`,`X`,`Y`];var oe=Ux();e(`keydown`,le,T),e(`keyup`,le,ee),e(`blur`,le,te);var ue=t(oe),de=t(ue);E(de,16,()=>[0,1,2],e=>e,(e,t)=>{var n=Vx();E(n,21,()=>ie,e=>e.offset,(e,n)=>{l(e,()=>t*4+D(n).offset,()=>D(n).symbol,()=>D(n).area)}),y(n),A(e,n)});var fe=m(de,2);E(fe,22,()=>ae,e=>e,(e,t,n)=>{l(e,()=>12+D(n),()=>t,()=>`auto`)}),y(fe),y(ue);var pe=m(ue,2),me=t(pe);let he;var ge=a(me,!0),_e=m(me,2),ve=e=>{var t=Hx(),n=h(t),r=a(n,!0),i=m(n,2);o(()=>f(r,D(p)>=0?`Press a key (Esc cancels)…`:`Click a control, then press a key`)),O(`click`,i,()=>L.keys=[...Ln]),A(e,t)};b(_e,e=>{D(u)&&e(ve)}),y(pe),y(oe),o(()=>{he=C(me,1,`svelte-1u92r28`,null,he,{active:D(u)}),f(ge,D(u)?`Done`:`Bind keys`)}),O(`click`,me,()=>(i(u,!D(u)),i(p,-1))),A(n,oe),s()}u([`pointerdown`,`pointerup`,`click`]);var Gx=n(`<span> </span>`),Kx=n(`<span class="info svelte-e97mzq"><button type="button" class="svelte-e97mzq">i</button> <span class="tip svelte-e97mzq" role="tooltip"></span></span>`);function qx(e,n){var r=Kx(),i=t(r),s=m(i,2);E(s,21,()=>n.lines,T,(e,t)=>{var n=Gx(),r=a(n,!0);o(()=>f(r,D(t))),A(e,n)}),y(s),y(r),o(()=>re(i,`aria-label`,n.label)),A(e,r)}var Jx=n(`<input spellcheck="false"/>`),Yx=n(`<output class="value svelte-1vmk4lm"> </output>`),Xx=n(`<option> </option>`),Zx=n(`<div class="int svelte-1vmk4lm"><!> <select title="Number base"></select> <label title="Interpret as two's complement"><input type="checkbox"/> signed</label></div>`);function Qx(n,r){v(r,!0);let u=oe(r,`signed`,15),d=oe(r,`base`,15),p=k(()=>({signed:u(),base:d()})),h=c(``),g=c(!1),w=k(()=>D(g)&&qn(D(h),D(p))===null);l(()=>{let e=Kn(r.value,D(p));D(g)||i(h,e,!0)});function T(){let e=qn(D(h),D(p));e!==null&&r.onchange?.(e)}let te=[{value:2,label:`bin`},{value:8,label:`oct`},{value:10,label:`dec`},{value:16,label:`hex`}];var ne=Zx(),re=t(ne),se=t=>{var n=Jx();x(n);let r;o(()=>r=C(n,1,`value svelte-1vmk4lm`,null,r,{invalid:D(w)})),O(`input`,n,T),e(`focus`,n,()=>i(g,!0)),e(`blur`,n,()=>i(g,!1)),ee(n,()=>D(h),e=>i(h,e)),A(t,n)},ce=e=>{var t=Yx(),n=a(t,!0);o(e=>f(n,e),[()=>Kn(r.value,D(p))]),A(e,t)};b(re,e=>{r.onchange?e(se):e(ce,-1)});var le=m(re,2);E(le,21,()=>te,e=>e.value,(e,t)=>{var n=Xx(),r=a(n,!0),i={};o(()=>{f(r,D(t).label),i!==(i=D(t).value)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(le),S(le);var ue=m(le,2),de=t(ue);x(de),_(),y(ue),y(ne),ae(le,d),ie(de,u),A(n,ne),s()}u([`input`]);var $x=n(`<div class="joystick svelte-s9fgav"><div class="pad svelte-s9fgav" role="slider" aria-label="Analog stick" tabindex="-1"><span class="knob svelte-s9fgav"></span></div> <div class="info mono svelte-s9fgav"><span> </span> <span> </span> <label title="Keep the position when the mouse is released"><input type="checkbox"/> hold</label></div></div>`);function eS(n,r){v(r,!0);let l=c(!1),u=c(!1),d=k(()=>(r.value&255)<<24>>24),p=k(()=>Yn(r.value)>>8);ce(()=>r.onchange(0));function h(e){let t=e.currentTarget.getBoundingClientRect(),n=e=>Math.max(-127,Math.min(127,Math.round((e*2-1)*127))),i=n((e.clientX-t.left)/t.width),a=-n((e.clientY-t.top)/t.height);r.onchange((a&255)<<8|i&255)}function g(e){e.currentTarget.setPointerCapture(e.pointerId),i(u,!0),h(e)}function b(e){D(u)&&h(e)}function S(){D(u)&&(i(u,!1),D(l)||r.onchange(0))}var C=$x(),w=t(C);se(w,``,{},{width:`104px`,height:`104px`});var T=t(w);let E;y(w);var ee=m(w,2),te=t(ee),ne=a(te),ae=m(te,2),oe=a(ae),le=m(ae,2),ue=t(le);x(ue),_(),y(le),y(ee),y(C),o(()=>{re(w,`aria-valuenow`,D(d)),E=se(T,``,E,{left:`${(D(d)+127)/254*100}%`,top:`${(127-D(p))/254*100}%`}),f(ne,`X ${D(d)??``}`),f(oe,`Y ${D(p)??``}`)}),O(`pointerdown`,w,g),O(`pointermove`,w,b),O(`pointerup`,w,S),e(`pointercancel`,w,S),O(`change`,ue,()=>!D(l)&&r.onchange(0)),ie(ue,()=>D(l),e=>i(l,e)),A(n,C),s()}u([`pointerdown`,`pointermove`,`pointerup`,`change`]);var tS=n(`<span></span>`),nS=n(`<div class="matrix svelte-yf105x"></div>`);function rS(e,t){let n=Array.from({length:16},(e,t)=>t);var r=nS();E(r,20,()=>n,e=>e,(e,n)=>{var r=tS();let i;o(()=>{i=C(r,1,`led svelte-yf105x`,null,i,{on:t.value>>n&1}),re(r,`title`,`bit ${n??``}`)}),A(e,r)}),y(r),A(e,r)}var iS=n(`<option> </option>`),aS=n(`<div class="port svelte-1kf7ree"><div class="head svelte-1kf7ree"><b class="mono svelte-1kf7ree"> </b> <select class="svelte-1kf7ree"></select> <span class="mono dim"> </span> <!></div> <!></div>`),oS=n(`<section class="panel"><header><h2>Inputs <span class="dim">IN $d %n</span></h2> <label>Set all <select><option>…</option><!></select></label></header> <div class="ports svelte-1kf7ree"></div></section> <section class="panel"><header><h2>Outputs <span class="dim">OUT $d %n</span></h2> <label>Set all <select><option>…</option><!></select></label></header> <div class="ports svelte-1kf7ree"></div></section>`,1);function sS(e,n){v(n,!0);let r=[{value:`switches`,label:`Switches`},{value:`buttons`,label:`Buttons`},{value:`gamepad`,label:`Game controller`},{value:`joystick`,label:`Analog stick`},{value:`integer`,label:`Integer`}],i=[{value:`leds`,label:`LEDs`},{value:`matrix`,label:`4×4 matrix`},{value:`integer`,label:`Integer`}],c={switches:[`One switch per bit: bit 15 (MSB) on the left, bit 0 (LSB) on the right.`,`The label under each switch is its bit number in hex (F = 15).`,`Up / green = 1.`],buttons:[`One push button per bit: bit 15 (MSB) on the left, bit 0 (LSB) on the right.`,`The label under each button is its bit number in hex (F = 15).`,`A bit is 1 only while its button is held.`],gamepad:[`D-pads, left to right: pad 1 = bits 0–3, pad 2 = bits 4–7, pad 3 = bits 8–11.`,`Within a pad: up = lowest bit, then down, left, right (pad 1: up 0, down 1, left 2, right 3).`,`Buttons: A = bit 12, B = bit 13, X = bit 14, Y = bit 15.`,`A bit is 1 while pressed. The small text on each control is its keyboard key.`],joystick:[`Bits 0–7 (low byte): X axis, signed 8-bit, left −127 … right +127.`,`Bits 8–15 (high byte): Y axis, signed 8-bit, down −127 … up +127.`,`Centre = 0x0000. Example: full right + full up = 0x7F7F; full left = 0x0081.`],integer:[`The number is the 16-bit port value.`,`Signed: two’s complement, −32768 … 32767. Unsigned: 0 … 65535.`,`Prefixes 0b / 0o / 0x are optional when typing.`]},l={leds:[`One LED per bit: bit 15 (MSB) on the left, bit 0 (LSB) on the right.`,`The label under each LED is its bit number in hex (F = 15).`],matrix:[`Bit 0 is the top-left LED; bits run left to right, then top to bottom.`,`Row 1 = bits 0–3, row 2 = bits 4–7, row 3 = bits 8–11, row 4 = bits 12–15.`,`So bit 15 is the bottom-right LED.`],integer:[`The number is the 16-bit port value.`,`Signed: shown as two’s complement (0xFFFF = −1).`]},u=k(()=>(R.frame,Array.from(R.cpu.outputs))),d=Array.from({length:16},(e,t)=>t);function p(e){for(let t of L.inputs)t.kind=e;for(let e of d)R.setInput(e,0)}function g(e){for(let t of L.outputs)t.kind=e}var _=oS(),x=h(_),C=t(x),w=m(t(C),2),T=m(t(w)),ee=t(T);ee.value=ee.__value=``;var te=m(ee);E(te,17,()=>r,e=>e.value,(e,t)=>{var n=iS(),r=a(n,!0),i={};o(()=>{f(r,D(t).label),i!==(i=D(t).value)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(T),y(w),y(C);var ne=m(C,2);E(ne,20,()=>d,e=>e,(e,n)=>{let i=k(()=>R.inputValues[n]),s=k(()=>e=>R.setInput(n,e));var l=aS(),u=t(l),d=t(u),p=a(d),h=m(d,2);E(h,21,()=>r,e=>e.value,(e,t)=>{var n=iS(),r=a(n,!0),i={};o(()=>{f(r,D(t).label),i!==(i=D(t).value)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(h),S(h);var g=m(h,2),_=a(g,!0);qx(m(g,2),{get lines(){return c[L.inputs[n].kind]},get label(){return`Bit mapping of input ${n??``}`}}),y(u);var v=m(u,2),x=e=>{zx(e,{mode:`switch`,get value(){return D(i)},onchange:D(s)})},C=e=>{zx(e,{mode:`button`,get value(){return D(i)},onchange:D(s)})},w=e=>{Wx(e,{get value(){return D(i)},onchange:D(s)})},T=e=>{eS(e,{get value(){return D(i)},onchange:D(s)})},ee=e=>{Qx(e,{get value(){return D(i)},onchange:D(s),get signed(){return L.inputs[n].signed},set signed(e){L.inputs[n].signed=e},get base(){return L.inputs[n].base},set base(e){L.inputs[n].base=e}})};b(v,e=>{L.inputs[n].kind===`switches`?e(x):L.inputs[n].kind===`buttons`?e(C,1):L.inputs[n].kind===`gamepad`?e(w,2):L.inputs[n].kind===`joystick`?e(T,3):e(ee,-1)}),y(l),o(e=>{f(p,`%${n??``}`),re(h,`aria-label`,`Input ${n??``} method`),f(_,e)},[()=>Jn(D(i))]),O(`change`,h,()=>R.setInput(n,0)),ae(h,()=>L.inputs[n].kind,e=>L.inputs[n].kind=e),A(e,l)}),y(ne),y(x);var ie=m(x,2),oe=t(ie),se=m(t(oe),2),ce=m(t(se)),le=t(ce);le.value=le.__value=``;var ue=m(le);E(ue,17,()=>i,e=>e.value,(e,t)=>{var n=iS(),r=a(n,!0),i={};o(()=>{f(r,D(t).label),i!==(i=D(t).value)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(ce),y(se),y(oe);var de=m(oe,2);E(de,20,()=>d,e=>e,(e,n)=>{let r=k(()=>D(u)[n]);var s=aS(),c=t(s),d=t(c),p=a(d),h=m(d,2);E(h,21,()=>i,e=>e.value,(e,t)=>{var n=iS(),r=a(n,!0),i={};o(()=>{f(r,D(t).label),i!==(i=D(t).value)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(h),S(h);var g=m(h,2),_=a(g,!0);qx(m(g,2),{get lines(){return l[L.outputs[n].kind]},get label(){return`Bit mapping of output ${n??``}`}}),y(c);var v=m(c,2),x=e=>{zx(e,{mode:`led`,get value(){return D(r)}})},C=e=>{rS(e,{get value(){return D(r)}})},w=e=>{Qx(e,{get value(){return D(r)},get signed(){return L.outputs[n].signed},set signed(e){L.outputs[n].signed=e},get base(){return L.outputs[n].base},set base(e){L.outputs[n].base=e}})};b(v,e=>{L.outputs[n].kind===`leds`?e(x):L.outputs[n].kind===`matrix`?e(C,1):e(w,-1)}),y(s),o(e=>{f(p,`%${n??``}`),re(h,`aria-label`,`Output ${n??``} method`),f(_,e)},[()=>Jn(D(r))]),ae(h,()=>L.outputs[n].kind,e=>L.outputs[n].kind=e),A(e,s)}),y(de),y(ie),O(`change`,T,e=>{e.currentTarget.value&&p(e.currentTarget.value),e.currentTarget.value=``}),O(`change`,ce,e=>{e.currentTarget.value&&g(e.currentTarget.value),e.currentTarget.value=``}),A(e,_),s()}u([`change`]);function cS(e,t){let{lineOfAddr:n}=t,r=0;for(let e=0;e<n.length;e++)n[e]>r&&(r=n[e]);let i=new Float64Array(r+1),a=new Float64Array(r+1),o=0,s=0;for(let t=0;t<n.length;t++){let r=n[t];if(r<=0)continue;let c=e.execCount[t];i[r]+=c,a[r]+=e.stallClocks[t],o+=c,i[r]>s&&(s=i[r])}return{counts:i,stall:a,total:o,max:s}}var lS=n(`<option> </option>`),uS=n(`<button title="Show the assembly generated from the C source">View assembly</button>`),dS=n(`<span class="mono dim"> </span>`),fS=n(`<span class="dim"> </span>`),pS=n(`<b> </b> (read-only). Breakpoints, stepping and
							the heat map now work on these instructions.`,1),mS=n(`<b> </b> (read-only). This image is what is running;
							your source is kept and not in use.`,1),hS=n(`<div class="image-banner svelte-1uha8ag"><span><!></span> <button class="svelte-1uha8ag">Back to source</button></div>`),gS=n(`<div> </div>`),_S=n(`<div class="dim"> </div>`),vS=n(`<div class="app svelte-1uha8ag"><div class="toolbar svelte-1uha8ag"><strong class="title svelte-1uha8ag">ILF-16 Emulator</strong> <select aria-label="Load example"><option>Examples…</option><optgroup label="Assembly"></optgroup><optgroup label="C"></optgroup></select> <button title="Open an .asm or .c file, or .rom.coe (+ .ram.coe) images">Open…</button> <input type="file" accept=".asm,.c,.txt,.coe" multiple="" hidden=""/> <input class="file-name mono svelte-1uha8ag" type="text" aria-label="File name" title="Name used for saved files (without extension). Opening a file or an example replaces it." placeholder="program" spellcheck="false"/> <select aria-label="Language" title="Language of the source. C is compiled to assembly first."><option>Assembly</option><option>C</option></select> <button> </button> <button title="Assemble and save the .rom.coe and .ram.coe memory files for the FPGA block memories">Save .coe</button> <span class="sep svelte-1uha8ag"></span> <button> </button> <!> <button class="primary svelte-1uha8ag" title="Run / pause (F8)"> </button> <button>Step</button> <button title="Reset the CPU, RAM, outputs and display">Reset</button> <span class="sep svelte-1uha8ag"></span> <label title="Real time: 48 MHz clock, 12 MIPS, STL stalls for its true duration. Unlimited: as fast as this machine can go, STL takes no time.">Speed <select><option>Real time (12 MIPS)</option><option>Unlimited</option></select></label> <label title="Shade each line by how often it has run since the last reset, with its share of all executed instructions in the margin. Hover over a number for the exact count."><input type="checkbox"/> Heat map</label> <span> </span> <!> <!></div> <div class="main svelte-1uha8ag"><div class="left svelte-1uha8ag"><!> <div class="editor-wrap svelte-1uha8ag"><!></div> <div class="messages mono svelte-1uha8ag"><!> <!></div></div> <div role="separator" aria-orientation="vertical" title="Drag to resize the editor. Double-click for the usual width."></div> <div class="right svelte-1uha8ag"><div class="top svelte-1uha8ag"><!> <!></div> <!></div></div></div>`);function yS(n,r){v(r,!0);let u={"vga-demo.asm":ue,"bad-apple.asm":de,"mandelbrot.asm":ge,"mandelbrot-zoom.asm":_e,"game-of-life.asm":he,"snake.asm":be,"cube.asm":pe,"numbers.asm":ve,"raycaster.asm":ye,"blocks.asm":fe,"fire.asm":me},d={"vga-demo.c":je,"bad-apple.c":xe,"mandelbrot.c":Ee,"mandelbrot-zoom.c":De,"game-of-life.c":Te,"snake.c":Ae,"cube.c":Ce,"numbers.c":Oe,"raycaster.c":ke,"blocks.c":Se,"fire.c":we},p=`ilf16.source.v1`,oe=`ilf16.name.v1`,j=`ilf16.language.v1`;function Me(){try{return localStorage.getItem(p)??`@define x_pos $6\r
@define y_pos $7\r
@define color $8\r
@define square_color $9\r
\r
LDI square_color 15\r
\r
.frame\r
    LDI y_pos 0\r
    .line\r
        LDI x_pos 0\r
        .line_loop\r
            AND $1 x_pos 0x60\r
            AND $2 y_pos 0x60\r
            AND $1 $1 $2\r
            ADD $0 $1 0x60\r
            BEQ .draw_square\r
            GFXSP color x_pos y_pos\r
            BRN .draw_end\r
            .draw_square\r
            GFXSP square_color x_pos y_pos\r
            .draw_end\r
            ADD color color 1\r
            AND color color 0xF\r
            ADD x_pos x_pos 1\r
            ADD $0 x_pos 256\r
            BLT .line_loop\r
        ADD color color 1\r
        AND color color 0xF\r
        ADD y_pos y_pos 1\r
        ADD $0 y_pos 256\r
        BLT .line\r
    ADD color color 1\r
    AND color color 0xF\r
    BRN .frame`}catch{return ue}}function Ne(){try{return localStorage.getItem(oe)??`vga-demo`}catch{return`vga-demo`}}function Pe(){try{return localStorage.getItem(j)===`c`?`c`:`asm`}catch{return`asm`}}let Fe=Me(),Ie=c(g(Pe())),Le=k(()=>D(Ie)===`c`?`c`:`asm`),Re=c(g(Ne())),ze=c(``);function Be(e){try{localStorage.setItem(oe,e)}catch{}}function Ve(e){i(Ie,e,!0),i(qe,!0);try{localStorage.setItem(j,e)}catch{}}let He={get value(){return D(M)?D(ze):D(Re)},set value(e){D(M)?i(ze,e,!0):(i(Re,e,!0),Be(e))}},Ue=()=>He.value.replace(/[\\/:*?"<>|]/g,``).trim()||`program`,We=Fe,Ge,Ke,qe=c(!0),M=c(``),Je=c(!1),Ye=c(``),Xe=0;function Ze(e){D(M)||(Fe=e,i(qe,!0),clearTimeout(Xe),Xe=window.setTimeout(()=>{try{localStorage.setItem(p,Fe)}catch{}},500))}function Qe(){let e=R.build(Fe,D(Ie));if(e){i(qe,!1);let e=R.program,t=R.diagnostics.length;i(Ye,`${D(Ie)===`c`?`Compiled`:`Assembled`}: ${e.rom.length} instructions, ${e.ram.length} RAM words`+(t?`, ${t} warning(s)`:``))}else i(Ye,``);return e}ce(()=>{Qe()});function $e(){if(R.status===`running`)return R.pause();R.status===`halted`&&R.reset(),(!D(qe)||D(M)||Qe())&&R.run()}function et(){(!D(qe)||D(M)||Qe())&&R.step()}function tt(){D(qe)&&!D(M)?Qe():R.reset()}let nt=e=>e.replace(/\.(asm|c|txt|(rom\.|ram\.)?coe)$/i,``)||`program`,rt=e=>/\.c$/i.test(e)?`c`:`asm`;function it(e,t=D(Re),n=D(Ie)){i(M,``),i(Je,!1),i(Re,t,!0),Be(t),Ve(n),Ge.setDoc(e),Qe()}function at(e){let t=u[e]??d[e];t&&it(t,nt(e),rt(e))}function ot(){if(D(qe)&&!Qe())return;let e=R.program?.asm;if(!e)return;let t=bt(e);t.program&&(t.program.debug=R.program?.debug,i(M,`${Ue()}.c`),i(Je,!0),i(ze,D(Re),!0),Ge.setDoc(e),R.diagnostics=t.diagnostics,R.loadProgram(t.program),i(qe,!1),i(Ye,`Assembly generated from ${D(M)}: ${t.program.rom.length} instructions`))}async function st(e){if(!e?.length)return;let t=Array.from(e);try{let e=t.filter(e=>e.name.toLowerCase().endsWith(`.coe`));if(e.length){let t=e.find(e=>!e.name.toLowerCase().includes(`.ram.`))??null,n=e.find(e=>e.name.toLowerCase().includes(`.ram.`))??null;if(!t)throw Error(`Select the .rom.coe file (optionally together with the .ram.coe)`);let r=wt(St(await t.text()),n?St(await n.text()):[]);i(M,t.name+(n?` + `+n.name:``)),i(Je,!1),i(ze,nt(t.name),!0),Ge.setDoc(_t(r.rom)),R.diagnostics=[],R.loadProgram(r),i(qe,!1),i(Ye,`Loaded ${t.name}${n?` + `+n.name:` (no RAM image)`}: ${r.rom.length} instructions`)}else it(await t[0].text(),nt(t[0].name),rt(t[0].name))}catch(e){i(Ye,``),R.diagnostics=[{severity:`error`,line:0,message:e.message}]}Ke.value=``}function ct(e,t){let n=URL.createObjectURL(new Blob([t],{type:`text/plain`})),r=document.createElement(`a`);r.href=n,r.download=e,r.click(),URL.revokeObjectURL(n)}function lt(){D(Je)?ct(`${Ue()}.asm`,Ge.getDoc()):ct(`${Ue()}.${D(Le)}`,Fe)}function ut(){if(D(qe)&&!D(M)&&!Qe())return;let e=R.program;if(!e)return;let t=Ue();ct(`${t}.rom.coe`,Ct(e.rom,8)),ct(`${t}.ram.coe`,Ct(e.ram,4)),i(Ye,`Saved ${t}.rom.coe (${e.rom.length} instructions) and ${t}.ram.coe (${e.ram.length} words)`)}let dt=k(()=>(R.frame,D(qe)||!R.program||R.status!==`paused`&&R.status!==`halted`?0:R.program.lineOfAddr[R.cpu.pc]??0)),ft=c(null),pt=0;l(()=>{if(R.frame,!L.heatmap||D(qe)||!R.program){i(ft,null);return}let e=performance.now();R.status===`running`&&e-pt<250||(pt=e,i(ft,cS(R.cpu,R.program)))});let mt,ht=c(!1);function gt(e){if(!D(ht))return;let t=mt.getBoundingClientRect();L.editorWidth=Math.max(240,Math.min(e.clientX-t.left,t.width-360))/t.width}let N={empty:`No program`,ready:`Ready`,running:`Running`,paused:`Paused`,halted:`Halted`};function vt(e){e.key===`F8`?(e.preventDefault(),$e()):e.key===`F10`&&(e.preventDefault(),R.status!==`running`&&et())}var yt=vS();e(`keydown`,le,vt);var xt=t(yt),Tt=m(t(xt),2),Et=t(Tt);Et.value=Et.__value=``;var Dt=m(Et);E(Dt,20,()=>Object.keys(u),e=>e,(e,t)=>{var n=lS(),r=a(n,!0),i={};o(()=>{f(r,t),i!==(i=t)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(Dt);var Ot=m(Dt);E(Ot,20,()=>Object.keys(d),e=>e,(e,t)=>{var n=lS(),r=a(n,!0),i={};o(()=>{f(r,t),i!==(i=t)&&(n.value=(n.__value=i)??``)}),A(e,n)}),y(Ot),y(Tt);var kt=m(Tt,2),At=m(kt,2);ne(At,e=>Ke=e,()=>Ke);var jt=m(At,2);x(jt);var Mt=m(jt,2),Nt=t(Mt);Nt.value=Nt.__value=`asm`;var Pt=m(Nt);Pt.value=Pt.__value=`c`,y(Mt);var P;S(Mt);var F=m(Mt,2),I=a(F),Ft=m(F,2),It=m(Ft,4),Lt=a(It,!0),Rt=m(It,2),zt=e=>{var t=uS();O(`click`,t,ot),A(e,t)};b(Rt,e=>{D(Ie)===`c`&&!D(M)&&e(zt)});var Bt=m(Rt,2),Vt=a(Bt,!0),Ht=m(Bt,2),Ut=m(Ht,2),Wt=m(Ut,4),Gt=m(t(Wt)),Kt=t(Gt);Kt.value=Kt.__value=`realtime`;var qt=m(Kt);qt.value=qt.__value=`unlimited`,y(Gt),S(Gt),y(Wt);var Jt=m(Wt,2),Yt=t(Jt);x(Yt),_(),y(Jt);var Xt=m(Jt,2),Zt=a(Xt,!0),Qt=m(Xt,2),$t=e=>{var t=dS(),n=a(t);o((e,t)=>f(n,`${e??``} MIPS · ${t??``}% of real time`),[()=>R.mips.toFixed(2),()=>(R.realtimeRatio*100).toFixed(0)]),A(e,t)};b(Qt,e=>{R.status===`running`&&e($t)});var en=m(Qt,2),tn=e=>{var t=fS(),n=a(t);o(()=>f(n,`source changed — will ${D(Ie)===`c`?`re-compile`:`re-assemble`} on run`)),A(e,t)};b(en,e=>{!D(M)&&D(qe)&&R.program&&e(tn)}),y(xt);var nn=m(xt,2);let rn;var an=t(nn),on=t(an),sn=e=>{var n=hS(),r=t(n),i=t(r),s=e=>{var t=pS(),n=h(t),r=a(n);_(),o(()=>f(r,`Assembly generated from ${D(M)??``}`)),A(e,t)},c=e=>{var t=mS(),n=h(t),r=a(n);_(),o(()=>f(r,`Disassembly of ${D(M)??``}`)),A(e,t)};b(i,e=>{D(Je)?e(s):e(c,-1)}),y(r);var l=m(r,2);y(n),O(`click`,l,()=>it(Fe)),A(e,n)};b(on,e=>{D(M)&&e(sn)});var cn=m(on,2),ln=t(cn);{let e=k(()=>!!D(M)),t=k(()=>D(M)?`asm`:D(Ie));ne(Nx(ln,{get readOnly(){return D(e)},get language(){return D(t)},get initialDoc(){return We},get currentLine(){return D(dt)},get heat(){return D(ft)},get diagnostics(){return R.diagnostics},onDocChange:Ze,onBreakpointsChange:e=>R.setBreakLines(e)}),e=>Ge=e,()=>Ge)}y(cn);var un=m(cn,2),dn=t(un);E(dn,17,()=>R.diagnostics,T,(e,t)=>{var n=gS(),r=a(n);o(()=>{C(n,1,w(D(t).severity),`svelte-1uha8ag`),f(r,`${D(t).severity??``}${D(t).line?` (line ${D(t).line})`:``}: ${D(t).message??``}`)}),A(e,n)},e=>{var t=_S(),n=a(t,!0);o(()=>f(n,D(Ye)||`Click the gutter to set breakpoints. F8 run/pause, F10 step.`)),A(e,t)});var fn=m(dn,2),pn=e=>{var t=_S(),n=a(t,!0);o(()=>f(n,D(Ye))),A(e,t)};b(fn,e=>{R.diagnostics.length&&D(Ye)&&e(pn)}),y(un),y(an);var mn=m(an,2);let hn;var gn=m(mn,2),_n=t(gn),vn=t(_n);gr(vn,{}),fr(m(vn,2),{}),y(_n),sS(m(_n,2),{}),y(gn),y(nn),ne(nn,e=>mt=e,()=>mt),y(yt),o(()=>{Mt.disabled=!!D(M),P!==(P=D(Ie))&&(Mt.value=(Mt.__value=P)??``,te(Mt,P)),F.disabled=!!D(M)&&!D(Je),f(I,`Save .${(D(Je)?`asm`:D(Le))??``}`),It.disabled=!!D(M),re(It,`title`,`${D(Ie)===`c`?`Compile`:`Assemble`} the source and reset the CPU`),f(Lt,D(Ie)===`c`?`Compile`:`Assemble`),f(Vt,R.status===`running`?`⏸ Pause`:`▶ Run`),Ht.disabled=R.status===`running`,re(Ht,`title`,D(Ie)===`c`&&!D(M)?`Run to the next line of the source (F10)`:`Execute one instruction (F10)`),C(Xt,1,`status ${R.status??``}`,`svelte-1uha8ag`),f(Zt,N[R.status]),rn=se(nn,``,rn,{"--editor-width":`${L.editorWidth*100}%`}),hn=C(mn,1,`splitter svelte-1uha8ag`,null,hn,{active:D(ht)})}),O(`change`,Tt,e=>{at(e.currentTarget.value),e.currentTarget.value=``}),O(`click`,kt,()=>Ke.click()),O(`change`,At,e=>st(e.currentTarget.files)),ee(jt,()=>He.value,e=>He.value=e),O(`change`,Mt,e=>Ve(e.currentTarget.value)),O(`click`,F,lt),O(`click`,Ft,ut),O(`click`,It,Qe),O(`click`,Bt,$e),O(`click`,Ht,et),O(`click`,Ut,tt),ae(Gt,()=>L.speed,e=>L.speed=e),ie(Yt,()=>L.heatmap,e=>L.heatmap=e),O(`pointerdown`,mn,e=>{i(ht,!0),e.currentTarget.setPointerCapture(e.pointerId),e.preventDefault()}),O(`pointermove`,mn,gt),O(`pointerup`,mn,()=>i(ht,!1)),e(`pointercancel`,mn,()=>i(ht,!1)),O(`dblclick`,mn,()=>L.editorWidth=.4),A(n,yt),s()}u([`change`,`click`,`pointerdown`,`pointermove`,`pointerup`,`dblclick`]);export{yS as component};