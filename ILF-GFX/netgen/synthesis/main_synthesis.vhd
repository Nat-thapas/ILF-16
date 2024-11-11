--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: main_synthesis.vhd
-- /___/   /\     Timestamp: Sun Nov 10 21:30:40 2024
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm main -w -dir netgen/synthesis -ofmt vhdl -sim main.ngc main_synthesis.vhd 
-- Device	: xc6slx9-2-tqg144
-- Input file	: main.ngc
-- Output file	: D:\Personal\Projects\ILF-16\ILF-GFX\netgen\synthesis\main_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: main
-- Xilinx	: D:\Programs\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity main is
  port (
    BTN1 : in STD_LOGIC := 'X'; 
    K5_1 : in STD_LOGIC := 'X'; 
    K5_3 : in STD_LOGIC := 'X'; 
    K5_5 : in STD_LOGIC := 'X'; 
    K5_7 : in STD_LOGIC := 'X'; 
    K5_9 : in STD_LOGIC := 'X'; 
    K5_11 : in STD_LOGIC := 'X'; 
    K5_13 : in STD_LOGIC := 'X'; 
    K5_15 : in STD_LOGIC := 'X'; 
    OSC : in STD_LOGIC := 'X'; 
    K1_1 : out STD_LOGIC; 
    K1_3 : out STD_LOGIC; 
    K1_5 : out STD_LOGIC; 
    K1_7 : out STD_LOGIC; 
    K1_9 : out STD_LOGIC; 
    K1_11 : out STD_LOGIC; 
    K1_13 : out STD_LOGIC; 
    K1_15 : out STD_LOGIC 
  );
end main;

architecture Structure of main is
  component h_counter
    port (
      clk : in STD_LOGIC := 'X'; 
      ce : in STD_LOGIC := 'X'; 
      thresh0 : out STD_LOGIC; 
      q : out STD_LOGIC_VECTOR ( 10 downto 0 ) 
    );
  end component;
  component v_counter
    port (
      clk : in STD_LOGIC := 'X'; 
      ce : in STD_LOGIC := 'X'; 
      q : out STD_LOGIC_VECTOR ( 9 downto 0 ) 
    );
  end component;
  component sdp_vram
    port (
      clka : in STD_LOGIC := 'X'; 
      clkb : in STD_LOGIC := 'X'; 
      wea : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
      addra : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      dina : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
      addrb : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
      doutb : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
    );
  end component;
  signal BTN1_IBUF_476 : STD_LOGIC; 
  signal OSC_IBUFG_485 : STD_LOGIC; 
  signal XLXN_1266 : STD_LOGIC; 
  signal XLXN_1269 : STD_LOGIC; 
  signal XLXN_1268 : STD_LOGIC; 
  signal XLXN_1267 : STD_LOGIC; 
  signal XLXN_1271 : STD_LOGIC; 
  signal VGA_CLK : STD_LOGIC; 
  signal XLXN_77 : STD_LOGIC; 
  signal CLK : STD_LOGIC; 
  signal XLXN_937 : STD_LOGIC; 
  signal XLXN_796 : STD_LOGIC; 
  signal XLXN_936 : STD_LOGIC; 
  signal XLXN_939 : STD_LOGIC; 
  signal XLXN_940 : STD_LOGIC; 
  signal XLXN_120 : STD_LOGIC; 
  signal XLXN_701 : STD_LOGIC; 
  signal XLXN_702 : STD_LOGIC; 
  signal XLXN_795 : STD_LOGIC; 
  signal XLXN_793 : STD_LOGIC; 
  signal HSYNC : STD_LOGIC; 
  signal VSYNC : STD_LOGIC; 
  signal K1_5_OBUF_631 : STD_LOGIC; 
  signal K1_7_OBUF_632 : STD_LOGIC; 
  signal K1_9_OBUF_633 : STD_LOGIC; 
  signal K1_11_OBUF_634 : STD_LOGIC; 
  signal K1_13_OBUF_635 : STD_LOGIC; 
  signal K1_15_OBUF_636 : STD_LOGIC; 
  signal K1_3_OBUF_637 : STD_LOGIC; 
  signal K1_1_OBUF_638 : STD_LOGIC; 
  signal DISP_EN : STD_LOGIC; 
  signal XLXN_703 : STD_LOGIC; 
  signal XLXN_772 : STD_LOGIC; 
  signal XLXN_794 : STD_LOGIC; 
  signal XLXN_817 : STD_LOGIC; 
  signal XLXN_339 : STD_LOGIC; 
  signal XLXN_376 : STD_LOGIC; 
  signal XLXN_341 : STD_LOGIC; 
  signal XLXN_344 : STD_LOGIC; 
  signal XLXN_374 : STD_LOGIC; 
  signal XLXN_347 : STD_LOGIC; 
  signal XLXN_348 : STD_LOGIC; 
  signal XLXN_349 : STD_LOGIC; 
  signal XLXN_350 : STD_LOGIC; 
  signal XLXN_352 : STD_LOGIC; 
  signal XLXN_353 : STD_LOGIC; 
  signal XLXN_354 : STD_LOGIC; 
  signal XLXN_355 : STD_LOGIC; 
  signal XLXN_356 : STD_LOGIC; 
  signal XLXN_357 : STD_LOGIC; 
  signal XLXN_358 : STD_LOGIC; 
  signal XLXN_359 : STD_LOGIC; 
  signal XLXN_361 : STD_LOGIC; 
  signal XLXN_404 : STD_LOGIC; 
  signal XLXN_405 : STD_LOGIC; 
  signal XLXN_406 : STD_LOGIC; 
  signal XLXN_407 : STD_LOGIC; 
  signal XLXN_408 : STD_LOGIC; 
  signal XLXN_409 : STD_LOGIC; 
  signal XLXN_410 : STD_LOGIC; 
  signal XLXN_411 : STD_LOGIC; 
  signal XLXN_412 : STD_LOGIC; 
  signal XLXN_413 : STD_LOGIC; 
  signal XLXN_414 : STD_LOGIC; 
  signal XLXN_415 : STD_LOGIC; 
  signal XLXN_416 : STD_LOGIC; 
  signal XLXN_418 : STD_LOGIC; 
  signal XLXN_419 : STD_LOGIC; 
  signal XLXN_420 : STD_LOGIC; 
  signal XLXN_421 : STD_LOGIC; 
  signal XLXN_422 : STD_LOGIC; 
  signal XLXN_423 : STD_LOGIC; 
  signal H_1435 : STD_LOGIC; 
  signal H_298 : STD_LOGIC; 
  signal H_1066 : STD_LOGIC; 
  signal H_1578 : STD_LOGIC; 
  signal Y_767 : STD_LOGIC; 
  signal Y_773 : STD_LOGIC; 
  signal Y_797 : STD_LOGIC; 
  signal Y_770 : STD_LOGIC; 
  signal XLXN_2450 : STD_LOGIC; 
  signal XLXN_2449 : STD_LOGIC; 
  signal XLXN_2452 : STD_LOGIC; 
  signal XLXN_2451 : STD_LOGIC; 
  signal XLXN_2454 : STD_LOGIC; 
  signal XLXN_2453 : STD_LOGIC; 
  signal XLXN_2206 : STD_LOGIC; 
  signal XLXN_2208 : STD_LOGIC; 
  signal XLXI_48_XLXI_1_clkfbout_buf : STD_LOGIC; 
  signal XLXI_48_XLXI_1_clkout0 : STD_LOGIC; 
  signal XLXI_48_XLXI_1_clkfbout : STD_LOGIC; 
  signal XLXI_662_XLXI_1_clkfbout_buf : STD_LOGIC; 
  signal XLXI_662_XLXI_1_clkout1 : STD_LOGIC; 
  signal XLXI_662_XLXI_1_clkout0 : STD_LOGIC; 
  signal XLXI_662_XLXI_1_clkfbout : STD_LOGIC; 
  signal Receiver_XLXN_181 : STD_LOGIC; 
  signal Receiver_XLXN_125 : STD_LOGIC; 
  signal Receiver_XLXN_49 : STD_LOGIC; 
  signal Receiver_XLXN_48 : STD_LOGIC; 
  signal Receiver_XLXN_90 : STD_LOGIC; 
  signal Receiver_XLXN_78 : STD_LOGIC; 
  signal Receiver_XLXN_88 : STD_LOGIC; 
  signal Receiver_XLXN_64 : STD_LOGIC; 
  signal Receiver_XLXN_36 : STD_LOGIC; 
  signal Receiver_XLXN_34 : STD_LOGIC; 
  signal Receiver_XLXN_29 : STD_LOGIC; 
  signal Receiver_XLXN_28 : STD_LOGIC; 
  signal Receiver_XLXN_35 : STD_LOGIC; 
  signal Receiver_XLXN_15 : STD_LOGIC; 
  signal Receiver_XLXN_31 : STD_LOGIC; 
  signal Receiver_XLXN_27 : STD_LOGIC; 
  signal Receiver_XLXN_9 : STD_LOGIC; 
  signal Receiver_XLXN_11 : STD_LOGIC; 
  signal Receiver_XLXN_10 : STD_LOGIC; 
  signal Receiver_XLXN_12 : STD_LOGIC; 
  signal Receiver_XLXN_76 : STD_LOGIC; 
  signal Receiver_XLXN_65 : STD_LOGIC; 
  signal SYNC_V_n0013_inv : STD_LOGIC; 
  signal SYNC_V_q_tmp_q_tmp_MUX_3_o : STD_LOGIC; 
  signal SYNC_H_n0013_inv : STD_LOGIC; 
  signal SYNC_H_q_tmp_q_tmp_MUX_3_o : STD_LOGIC; 
  signal DISP_Y_n0013_inv : STD_LOGIC; 
  signal DISP_Y_q_tmp_q_tmp_MUX_3_o : STD_LOGIC; 
  signal DISP_X_n0013_inv : STD_LOGIC; 
  signal DISP_X_q_tmp_q_tmp_MUX_3_o : STD_LOGIC; 
  signal DISP_Y_REG_Mcount_COUNT_cy_6_rt_336 : STD_LOGIC; 
  signal DISP_Y_REG_Mcount_COUNT_cy_5_rt_335 : STD_LOGIC; 
  signal DISP_Y_REG_Mcount_COUNT_cy_4_rt_334 : STD_LOGIC; 
  signal DISP_Y_REG_Mcount_COUNT_cy_3_rt_333 : STD_LOGIC; 
  signal DISP_Y_REG_Mcount_COUNT_cy_2_rt_332 : STD_LOGIC; 
  signal DISP_Y_REG_Mcount_COUNT_cy_1_rt_331 : STD_LOGIC; 
  signal DISP_Y_REG_N1 : STD_LOGIC; 
  signal DISP_Y_REG_N0 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_xor_7_rt_375 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_cy_6_rt_374 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_cy_5_rt_373 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_cy_4_rt_372 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_cy_3_rt_371 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_cy_2_rt_370 : STD_LOGIC; 
  signal DISP_X_REG_Mcount_COUNT_cy_1_rt_369 : STD_LOGIC; 
  signal DISP_X_REG_N01 : STD_LOGIC; 
  signal DISP_X_REG_N1 : STD_LOGIC; 
  signal DISP_X_REG_N0 : STD_LOGIC; 
  signal DISP_X_REG_TC : STD_LOGIC; 
  signal XLXI_288_N01 : STD_LOGIC; 
  signal XLXI_290_N01 : STD_LOGIC; 
  signal XLXI_289_N01 : STD_LOGIC; 
  signal XLXI_287_N01 : STD_LOGIC; 
  signal XLXI_251_N01 : STD_LOGIC; 
  signal XLXI_248_N01 : STD_LOGIC; 
  signal XLXI_247_N01 : STD_LOGIC; 
  signal XLXI_250_N01 : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_67_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_66_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_65_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_64_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_63_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_62_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_61_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_60_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_59_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_58_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_57_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_976_XLXI_56_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT3_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT1_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT4_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT5_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT2_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_48_XLXI_1_pll_base_inst_LOCKED_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT3_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT4_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT5_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT2_UNCONNECTED : STD_LOGIC; 
  signal NLW_XLXI_662_XLXI_1_pll_base_inst_LOCKED_UNCONNECTED : STD_LOGIC; 
  signal XLXN_1873 : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal XLXN_2204 : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal XLXN_2205 : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal DISP_ADDR_X : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal DISP_ADDR_Y : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal H_CNT : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal Y_CNT : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal XLXN_957 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal DRAW_ADDR : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXN_1248 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal CLR : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal DISP_ADDR : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXN_42 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXN_43 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXN_98 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXN_97 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXN_40 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXN_41 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_976_DH : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_976_DL : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_976_QH : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_976_QL : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_874_DH : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_874_DL : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_874_QH : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal XLXI_874_QL : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Receiver_XLXI_22_Result : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal Receiver_XLXI_22_COUNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal Receiver_XLXI_21_Result : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal Receiver_XLXI_21_COUNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal DISP_Y_REG_Mcount_COUNT_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal DISP_Y_REG_Mcount_COUNT_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal DISP_Y_REG_Result : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal DISP_X_REG_Mcount_COUNT_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal DISP_X_REG_Mcount_COUNT_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal DISP_X_REG_Result : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XLXI_480 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => DISP_EN,
      D => XLXN_703,
      Q => XLXN_701
    );
  XLXI_481 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => DISP_EN,
      D => XLXN_701,
      Q => XLXN_702
    );
  XLXI_546 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_796,
      D => XLXN_794,
      Q => XLXN_795
    );
  XLXI_547 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_796,
      D => XLXN_795,
      Q => XLXN_793
    );
  XLXI_595 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_939,
      Q => HSYNC
    );
  XLXI_596 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_940,
      Q => VSYNC
    );
  XLXI_1248 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_2454,
      Q => K1_5_OBUF_631
    );
  XLXI_1249 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_2453,
      Q => K1_7_OBUF_632
    );
  XLXI_1250 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_2452,
      Q => K1_9_OBUF_633
    );
  XLXI_1251 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_2451,
      Q => K1_11_OBUF_634
    );
  XLXI_1252 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_2450,
      Q => K1_13_OBUF_635
    );
  XLXI_1253 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => XLXN_2449,
      Q => K1_15_OBUF_636
    );
  XLXI_1269 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => VSYNC,
      Q => K1_3_OBUF_637
    );
  XLXI_1286 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      D => HSYNC,
      Q => K1_1_OBUF_638
    );
  XLXI_1 : IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT",
      DIFF_TERM => TRUE,
      IBUF_DELAY_VALUE => "0",
      IFD_DELAY_VALUE => "AUTO"
    )
    port map (
      I => K5_1,
      IB => K5_3,
      O => XLXN_1266
    );
  XLXI_2 : IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT",
      DIFF_TERM => TRUE,
      IBUF_DELAY_VALUE => "0",
      IFD_DELAY_VALUE => "AUTO"
    )
    port map (
      I => K5_5,
      IB => K5_7,
      O => XLXN_1269
    );
  XLXI_3 : IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT",
      DIFF_TERM => TRUE,
      IBUF_DELAY_VALUE => "0",
      IFD_DELAY_VALUE => "AUTO"
    )
    port map (
      I => K5_9,
      IB => K5_11,
      O => XLXN_1268
    );
  XLXI_4 : IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT",
      DIFF_TERM => TRUE,
      IBUF_DELAY_VALUE => "0",
      IFD_DELAY_VALUE => "AUTO"
    )
    port map (
      I => K5_13,
      IB => K5_15,
      O => XLXN_1267
    );
  XLXI_658 : BUFG
    port map (
      O => XLXN_1271,
      I => OSC_IBUFG_485
    );
  XLXI_594 : AND2
    port map (
      I0 => XLXN_936,
      I1 => XLXN_937,
      O => DISP_EN
    );
  XLXI_483 : AND2B2
    port map (
      I0 => XLXN_702,
      I1 => XLXN_701,
      O => XLXN_703
    );
  XLXI_484 : AND2B1
    port map (
      I0 => XLXN_701,
      I1 => XLXN_702,
      O => XLXN_772
    );
  XLXI_548 : AND2B2
    port map (
      I0 => XLXN_793,
      I1 => XLXN_795,
      O => XLXN_794
    );
  XLXI_549 : AND2B1
    port map (
      I0 => XLXN_795,
      I1 => XLXN_793,
      O => XLXN_817
    );
  XLXI_84 : BUF
    port map (
      I => DISP_ADDR_X(0),
      O => DISP_ADDR(0)
    );
  XLXI_85 : BUF
    port map (
      I => DISP_ADDR_X(1),
      O => DISP_ADDR(1)
    );
  XLXI_86 : BUF
    port map (
      I => DISP_ADDR_X(2),
      O => DISP_ADDR(2)
    );
  XLXI_87 : BUF
    port map (
      I => DISP_ADDR_X(3),
      O => DISP_ADDR(3)
    );
  XLXI_88 : BUF
    port map (
      I => DISP_ADDR_X(4),
      O => DISP_ADDR(4)
    );
  XLXI_89 : BUF
    port map (
      I => DISP_ADDR_X(5),
      O => DISP_ADDR(5)
    );
  XLXI_90 : BUF
    port map (
      I => DISP_ADDR_X(6),
      O => DISP_ADDR(6)
    );
  XLXI_91 : BUF
    port map (
      I => DISP_ADDR_X(7),
      O => DISP_ADDR(7)
    );
  XLXI_104 : BUF
    port map (
      I => DISP_ADDR_Y(0),
      O => DISP_ADDR(8)
    );
  XLXI_105 : BUF
    port map (
      I => DISP_ADDR_Y(1),
      O => DISP_ADDR(9)
    );
  XLXI_106 : BUF
    port map (
      I => DISP_ADDR_Y(2),
      O => DISP_ADDR(10)
    );
  XLXI_107 : BUF
    port map (
      I => DISP_ADDR_Y(3),
      O => DISP_ADDR(11)
    );
  XLXI_108 : BUF
    port map (
      I => DISP_ADDR_Y(4),
      O => DISP_ADDR(12)
    );
  XLXI_109 : BUF
    port map (
      I => DISP_ADDR_Y(5),
      O => DISP_ADDR(13)
    );
  XLXI_110 : BUF
    port map (
      I => DISP_ADDR_Y(6),
      O => DISP_ADDR(14)
    );
  XLXI_111 : BUF
    port map (
      I => DISP_ADDR_Y(7),
      O => DISP_ADDR(15)
    );
  XLXI_139 : BUF
    port map (
      I => H_CNT(0),
      O => XLXN_339
    );
  XLXI_262 : INV
    port map (
      I => H_CNT(0),
      O => XLXN_376
    );
  XLXI_195 : BUF
    port map (
      I => H_CNT(1),
      O => XLXN_341
    );
  XLXI_198 : INV
    port map (
      I => H_CNT(2),
      O => XLXN_344
    );
  XLXI_199 : BUF
    port map (
      I => H_CNT(3),
      O => XLXN_374
    );
  XLXI_201 : BUF
    port map (
      I => H_CNT(4),
      O => XLXN_347
    );
  XLXI_202 : INV
    port map (
      I => H_CNT(4),
      O => XLXN_348
    );
  XLXI_203 : BUF
    port map (
      I => H_CNT(5),
      O => XLXN_349
    );
  XLXI_204 : INV
    port map (
      I => H_CNT(5),
      O => XLXN_350
    );
  XLXI_206 : INV
    port map (
      I => H_CNT(6),
      O => XLXN_352
    );
  XLXI_207 : BUF
    port map (
      I => H_CNT(7),
      O => XLXN_353
    );
  XLXI_208 : INV
    port map (
      I => H_CNT(7),
      O => XLXN_354
    );
  XLXI_209 : BUF
    port map (
      I => H_CNT(8),
      O => XLXN_355
    );
  XLXI_210 : INV
    port map (
      I => H_CNT(8),
      O => XLXN_356
    );
  XLXI_211 : BUF
    port map (
      I => H_CNT(9),
      O => XLXN_357
    );
  XLXI_212 : INV
    port map (
      I => H_CNT(9),
      O => XLXN_358
    );
  XLXI_213 : BUF
    port map (
      I => H_CNT(10),
      O => XLXN_359
    );
  XLXI_214 : INV
    port map (
      I => H_CNT(10),
      O => XLXN_361
    );
  XLXI_254 : BUF
    port map (
      I => Y_CNT(0),
      O => XLXN_404
    );
  XLXI_263 : INV
    port map (
      I => Y_CNT(0),
      O => XLXN_405
    );
  XLXI_264 : BUF
    port map (
      I => Y_CNT(1),
      O => XLXN_406
    );
  XLXI_265 : INV
    port map (
      I => Y_CNT(1),
      O => XLXN_407
    );
  XLXI_266 : BUF
    port map (
      I => Y_CNT(2),
      O => XLXN_408
    );
  XLXI_267 : INV
    port map (
      I => Y_CNT(2),
      O => XLXN_409
    );
  XLXI_268 : BUF
    port map (
      I => Y_CNT(3),
      O => XLXN_410
    );
  XLXI_269 : INV
    port map (
      I => Y_CNT(3),
      O => XLXN_411
    );
  XLXI_270 : BUF
    port map (
      I => Y_CNT(4),
      O => XLXN_412
    );
  XLXI_271 : INV
    port map (
      I => Y_CNT(4),
      O => XLXN_413
    );
  XLXI_272 : BUF
    port map (
      I => Y_CNT(5),
      O => XLXN_414
    );
  XLXI_273 : INV
    port map (
      I => Y_CNT(5),
      O => XLXN_415
    );
  XLXI_276 : BUF
    port map (
      I => Y_CNT(6),
      O => XLXN_416
    );
  XLXI_277 : INV
    port map (
      I => Y_CNT(6),
      O => XLXN_418
    );
  XLXI_278 : BUF
    port map (
      I => Y_CNT(7),
      O => XLXN_419
    );
  XLXI_279 : INV
    port map (
      I => Y_CNT(7),
      O => XLXN_420
    );
  XLXI_280 : BUF
    port map (
      I => Y_CNT(8),
      O => XLXN_421
    );
  XLXI_281 : INV
    port map (
      I => Y_CNT(8),
      O => XLXN_422
    );
  XLXI_282 : BUF
    port map (
      I => Y_CNT(9),
      O => XLXN_423
    );
  B1 : LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      I0 => CLR(0),
      I1 => CLR(1),
      I2 => CLR(2),
      I3 => CLR(3),
      O => XLXN_2450
    );
  B2 : LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      I0 => CLR(0),
      I1 => CLR(1),
      I2 => CLR(2),
      I3 => CLR(3),
      O => XLXN_2449
    );
  G1 : LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      I0 => CLR(0),
      I1 => CLR(1),
      I2 => CLR(2),
      I3 => CLR(3),
      O => XLXN_2452
    );
  G2 : LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      I0 => CLR(0),
      I1 => CLR(1),
      I2 => CLR(2),
      I3 => CLR(3),
      O => XLXN_2451
    );
  R1 : LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      I0 => CLR(0),
      I1 => CLR(1),
      I2 => CLR(2),
      I3 => CLR(3),
      O => XLXN_2454
    );
  R2 : LUT4
    generic map(
      INIT => X"F0F0"
    )
    port map (
      I0 => CLR(0),
      I1 => CLR(1),
      I2 => CLR(2),
      I3 => CLR(3),
      O => XLXN_2453
    );
  XLXI_1074 : GND
    port map (
      G => XLXN_2206
    );
  XLXI_1075 : VCC
    port map (
      P => XLXN_2208
    );
  XLXI_48_XLXI_1_clkout1_buf : BUFG
    port map (
      O => VGA_CLK,
      I => XLXI_48_XLXI_1_clkout0
    );
  XLXI_48_XLXI_1_clkf_buf : BUFG
    port map (
      O => XLXI_48_XLXI_1_clkfbout_buf,
      I => XLXI_48_XLXI_1_clkfbout
    );
  XLXI_662_XLXI_1_clkout2_buf : BUFG
    port map (
      O => XLXN_77,
      I => XLXI_662_XLXI_1_clkout1
    );
  XLXI_662_XLXI_1_clkout1_buf : BUFG
    port map (
      O => CLK,
      I => XLXI_662_XLXI_1_clkout0
    );
  XLXI_662_XLXI_1_clkf_buf : BUFG
    port map (
      O => XLXI_662_XLXI_1_clkfbout_buf,
      I => XLXI_662_XLXI_1_clkfbout
    );
  XLXI_598_XLXI_4 : AND2
    port map (
      I0 => DISP_EN,
      I1 => XLXN_957(3),
      O => CLR(3)
    );
  XLXI_598_XLXI_3 : AND2
    port map (
      I0 => DISP_EN,
      I1 => XLXN_957(2),
      O => CLR(2)
    );
  XLXI_598_XLXI_2 : AND2
    port map (
      I0 => DISP_EN,
      I1 => XLXN_957(1),
      O => CLR(1)
    );
  XLXI_598_XLXI_1 : AND2
    port map (
      I0 => DISP_EN,
      I1 => XLXN_957(0),
      O => CLR(0)
    );
  Receiver_XLXI_40 : AND2B1
    port map (
      I0 => Receiver_XLXN_78,
      I1 => Receiver_XLXN_90,
      O => Receiver_XLXN_181
    );
  Receiver_XLXI_39 : AND2B1
    port map (
      I0 => Receiver_XLXN_88,
      I1 => Receiver_XLXN_64,
      O => Receiver_XLXN_125
    );
  Receiver_XLXI_14 : LUT4
    generic map(
      INIT => X"6FF6"
    )
    port map (
      I0 => Receiver_XLXN_36,
      I1 => Receiver_XLXN_35,
      I2 => Receiver_XLXN_34,
      I3 => Receiver_XLXN_15,
      O => Receiver_XLXN_49
    );
  Receiver_XLXI_13 : LUT4
    generic map(
      INIT => X"6FF6"
    )
    port map (
      I0 => Receiver_XLXN_29,
      I1 => Receiver_XLXN_31,
      I2 => Receiver_XLXN_28,
      I3 => Receiver_XLXN_27,
      O => Receiver_XLXN_48
    );
  Receiver_XLXI_32 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_76,
      Q => Receiver_XLXN_90
    );
  Receiver_XLXI_31 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_90,
      Q => Receiver_XLXN_78
    );
  Receiver_XLXI_29 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_64,
      Q => Receiver_XLXN_88
    );
  Receiver_XLXI_28 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_65,
      Q => Receiver_XLXN_64
    );
  Receiver_XLXI_12 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_35,
      Q => Receiver_XLXN_36
    );
  Receiver_XLXI_11 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_15,
      Q => Receiver_XLXN_34
    );
  Receiver_XLXI_10 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_31,
      Q => Receiver_XLXN_29
    );
  Receiver_XLXI_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_27,
      Q => Receiver_XLXN_28
    );
  Receiver_XLXI_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_9,
      Q => Receiver_XLXN_35
    );
  Receiver_XLXI_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_10,
      Q => Receiver_XLXN_15
    );
  Receiver_XLXI_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_11,
      Q => Receiver_XLXN_31
    );
  Receiver_XLXI_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => Receiver_XLXN_12,
      Q => Receiver_XLXN_27
    );
  Receiver_XLXI_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => XLXN_1267,
      Q => Receiver_XLXN_9
    );
  Receiver_XLXI_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => XLXN_1269,
      Q => Receiver_XLXN_11
    );
  Receiver_XLXI_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => XLXN_1268,
      Q => Receiver_XLXN_10
    );
  Receiver_XLXI_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      D => XLXN_1266,
      Q => Receiver_XLXN_12
    );
  Receiver_XLXI_18_XLXI_16 : BUF
    port map (
      I => Receiver_XLXN_40(0),
      O => Receiver_XLXN_42(15)
    );
  Receiver_XLXI_18_XLXI_15 : BUF
    port map (
      I => Receiver_XLXN_40(1),
      O => Receiver_XLXN_42(14)
    );
  Receiver_XLXI_18_XLXI_14 : BUF
    port map (
      I => Receiver_XLXN_40(2),
      O => Receiver_XLXN_42(13)
    );
  Receiver_XLXI_18_XLXI_13 : BUF
    port map (
      I => Receiver_XLXN_40(3),
      O => Receiver_XLXN_42(12)
    );
  Receiver_XLXI_18_XLXI_12 : BUF
    port map (
      I => Receiver_XLXN_40(4),
      O => Receiver_XLXN_42(11)
    );
  Receiver_XLXI_18_XLXI_11 : BUF
    port map (
      I => Receiver_XLXN_40(5),
      O => Receiver_XLXN_42(10)
    );
  Receiver_XLXI_18_XLXI_10 : BUF
    port map (
      I => Receiver_XLXN_40(6),
      O => Receiver_XLXN_42(9)
    );
  Receiver_XLXI_18_XLXI_9 : BUF
    port map (
      I => Receiver_XLXN_40(7),
      O => Receiver_XLXN_42(8)
    );
  Receiver_XLXI_18_XLXI_8 : BUF
    port map (
      I => Receiver_XLXN_40(8),
      O => Receiver_XLXN_42(7)
    );
  Receiver_XLXI_18_XLXI_7 : BUF
    port map (
      I => Receiver_XLXN_40(9),
      O => Receiver_XLXN_42(6)
    );
  Receiver_XLXI_18_XLXI_6 : BUF
    port map (
      I => Receiver_XLXN_40(10),
      O => Receiver_XLXN_42(5)
    );
  Receiver_XLXI_18_XLXI_5 : BUF
    port map (
      I => Receiver_XLXN_40(11),
      O => Receiver_XLXN_42(4)
    );
  Receiver_XLXI_18_XLXI_4 : BUF
    port map (
      I => Receiver_XLXN_40(12),
      O => Receiver_XLXN_42(3)
    );
  Receiver_XLXI_18_XLXI_3 : BUF
    port map (
      I => Receiver_XLXN_40(13),
      O => Receiver_XLXN_42(2)
    );
  Receiver_XLXI_18_XLXI_2 : BUF
    port map (
      I => Receiver_XLXN_40(14),
      O => Receiver_XLXN_42(1)
    );
  Receiver_XLXI_18_XLXI_1 : BUF
    port map (
      I => Receiver_XLXN_40(15),
      O => Receiver_XLXN_42(0)
    );
  Receiver_XLXI_17_XLXI_16 : BUF
    port map (
      I => Receiver_XLXN_41(0),
      O => Receiver_XLXN_43(15)
    );
  Receiver_XLXI_17_XLXI_15 : BUF
    port map (
      I => Receiver_XLXN_41(1),
      O => Receiver_XLXN_43(14)
    );
  Receiver_XLXI_17_XLXI_14 : BUF
    port map (
      I => Receiver_XLXN_41(2),
      O => Receiver_XLXN_43(13)
    );
  Receiver_XLXI_17_XLXI_13 : BUF
    port map (
      I => Receiver_XLXN_41(3),
      O => Receiver_XLXN_43(12)
    );
  Receiver_XLXI_17_XLXI_12 : BUF
    port map (
      I => Receiver_XLXN_41(4),
      O => Receiver_XLXN_43(11)
    );
  Receiver_XLXI_17_XLXI_11 : BUF
    port map (
      I => Receiver_XLXN_41(5),
      O => Receiver_XLXN_43(10)
    );
  Receiver_XLXI_17_XLXI_10 : BUF
    port map (
      I => Receiver_XLXN_41(6),
      O => Receiver_XLXN_43(9)
    );
  Receiver_XLXI_17_XLXI_9 : BUF
    port map (
      I => Receiver_XLXN_41(7),
      O => Receiver_XLXN_43(8)
    );
  Receiver_XLXI_17_XLXI_8 : BUF
    port map (
      I => Receiver_XLXN_41(8),
      O => Receiver_XLXN_43(7)
    );
  Receiver_XLXI_17_XLXI_7 : BUF
    port map (
      I => Receiver_XLXN_41(9),
      O => Receiver_XLXN_43(6)
    );
  Receiver_XLXI_17_XLXI_6 : BUF
    port map (
      I => Receiver_XLXN_41(10),
      O => Receiver_XLXN_43(5)
    );
  Receiver_XLXI_17_XLXI_5 : BUF
    port map (
      I => Receiver_XLXN_41(11),
      O => Receiver_XLXN_43(4)
    );
  Receiver_XLXI_17_XLXI_4 : BUF
    port map (
      I => Receiver_XLXN_41(12),
      O => Receiver_XLXN_43(3)
    );
  Receiver_XLXI_17_XLXI_3 : BUF
    port map (
      I => Receiver_XLXN_41(13),
      O => Receiver_XLXN_43(2)
    );
  Receiver_XLXI_17_XLXI_2 : BUF
    port map (
      I => Receiver_XLXN_41(14),
      O => Receiver_XLXN_43(1)
    );
  Receiver_XLXI_17_XLXI_1 : BUF
    port map (
      I => Receiver_XLXN_41(15),
      O => Receiver_XLXN_43(0)
    );
  Receiver_XLXI_46_XLXI_18 : BUF
    port map (
      I => Receiver_XLXN_97(15),
      O => XLXN_1873(15)
    );
  Receiver_XLXI_46_XLXI_17 : BUF
    port map (
      I => Receiver_XLXN_97(14),
      O => XLXN_1873(14)
    );
  Receiver_XLXI_46_XLXI_16 : BUF
    port map (
      I => Receiver_XLXN_97(13),
      O => XLXN_1873(13)
    );
  Receiver_XLXI_46_XLXI_15 : BUF
    port map (
      I => Receiver_XLXN_97(12),
      O => XLXN_1873(12)
    );
  Receiver_XLXI_46_XLXI_14 : BUF
    port map (
      I => Receiver_XLXN_97(11),
      O => XLXN_1873(11)
    );
  Receiver_XLXI_46_XLXI_13 : BUF
    port map (
      I => Receiver_XLXN_97(10),
      O => XLXN_1873(10)
    );
  Receiver_XLXI_46_XLXI_12 : BUF
    port map (
      I => Receiver_XLXN_97(9),
      O => XLXN_1873(9)
    );
  Receiver_XLXI_46_XLXI_11 : BUF
    port map (
      I => Receiver_XLXN_97(8),
      O => XLXN_1873(8)
    );
  Receiver_XLXI_46_XLXI_10 : BUF
    port map (
      I => Receiver_XLXN_97(7),
      O => XLXN_1873(7)
    );
  Receiver_XLXI_46_XLXI_9 : BUF
    port map (
      I => Receiver_XLXN_97(6),
      O => XLXN_1873(6)
    );
  Receiver_XLXI_46_XLXI_8 : BUF
    port map (
      I => Receiver_XLXN_97(5),
      O => XLXN_1873(5)
    );
  Receiver_XLXI_46_XLXI_7 : BUF
    port map (
      I => Receiver_XLXN_97(4),
      O => XLXN_1873(4)
    );
  Receiver_XLXI_46_XLXI_6 : BUF
    port map (
      I => Receiver_XLXN_97(3),
      O => XLXN_1873(3)
    );
  Receiver_XLXI_46_XLXI_5 : BUF
    port map (
      I => Receiver_XLXN_97(2),
      O => XLXN_1873(2)
    );
  Receiver_XLXI_46_XLXI_2 : BUF
    port map (
      I => Receiver_XLXN_97(1),
      O => XLXN_1873(1)
    );
  Receiver_XLXI_46_XLXI_1 : BUF
    port map (
      I => Receiver_XLXN_97(0),
      O => XLXN_1873(0)
    );
  Receiver_XLXI_46_XLXI_34 : BUF
    port map (
      I => Receiver_XLXN_98(15),
      O => XLXN_1873(31)
    );
  Receiver_XLXI_46_XLXI_33 : BUF
    port map (
      I => Receiver_XLXN_98(14),
      O => XLXN_1873(30)
    );
  Receiver_XLXI_46_XLXI_32 : BUF
    port map (
      I => Receiver_XLXN_98(13),
      O => XLXN_1873(29)
    );
  Receiver_XLXI_46_XLXI_31 : BUF
    port map (
      I => Receiver_XLXN_98(12),
      O => XLXN_1873(28)
    );
  Receiver_XLXI_46_XLXI_30 : BUF
    port map (
      I => Receiver_XLXN_98(11),
      O => XLXN_1873(27)
    );
  Receiver_XLXI_46_XLXI_29 : BUF
    port map (
      I => Receiver_XLXN_98(10),
      O => XLXN_1873(26)
    );
  Receiver_XLXI_46_XLXI_28 : BUF
    port map (
      I => Receiver_XLXN_98(9),
      O => XLXN_1873(25)
    );
  Receiver_XLXI_46_XLXI_27 : BUF
    port map (
      I => Receiver_XLXN_98(8),
      O => XLXN_1873(24)
    );
  Receiver_XLXI_46_XLXI_26 : BUF
    port map (
      I => Receiver_XLXN_98(7),
      O => XLXN_1873(23)
    );
  Receiver_XLXI_46_XLXI_25 : BUF
    port map (
      I => Receiver_XLXN_98(6),
      O => XLXN_1873(22)
    );
  Receiver_XLXI_46_XLXI_24 : BUF
    port map (
      I => Receiver_XLXN_98(5),
      O => XLXN_1873(21)
    );
  Receiver_XLXI_46_XLXI_23 : BUF
    port map (
      I => Receiver_XLXN_98(4),
      O => XLXN_1873(20)
    );
  Receiver_XLXI_46_XLXI_22 : BUF
    port map (
      I => Receiver_XLXN_98(3),
      O => XLXN_1873(19)
    );
  Receiver_XLXI_46_XLXI_21 : BUF
    port map (
      I => Receiver_XLXN_98(2),
      O => XLXN_1873(18)
    );
  Receiver_XLXI_46_XLXI_20 : BUF
    port map (
      I => Receiver_XLXN_98(1),
      O => XLXN_1873(17)
    );
  Receiver_XLXI_46_XLXI_19 : BUF
    port map (
      I => Receiver_XLXN_98(0),
      O => XLXN_1873(16)
    );
  XLXI_976_XLXI_67 : BUF
    port map (
      I => XLXI_976_QH(15),
      O => NLW_XLXI_976_XLXI_67_O_UNCONNECTED
    );
  XLXI_976_XLXI_66 : BUF
    port map (
      I => XLXI_976_QH(14),
      O => NLW_XLXI_976_XLXI_66_O_UNCONNECTED
    );
  XLXI_976_XLXI_65 : BUF
    port map (
      I => XLXI_976_QH(13),
      O => NLW_XLXI_976_XLXI_65_O_UNCONNECTED
    );
  XLXI_976_XLXI_64 : BUF
    port map (
      I => XLXI_976_QH(12),
      O => NLW_XLXI_976_XLXI_64_O_UNCONNECTED
    );
  XLXI_976_XLXI_63 : BUF
    port map (
      I => XLXI_976_QH(11),
      O => NLW_XLXI_976_XLXI_63_O_UNCONNECTED
    );
  XLXI_976_XLXI_62 : BUF
    port map (
      I => XLXI_976_QH(10),
      O => NLW_XLXI_976_XLXI_62_O_UNCONNECTED
    );
  XLXI_976_XLXI_61 : BUF
    port map (
      I => XLXI_976_QH(9),
      O => NLW_XLXI_976_XLXI_61_O_UNCONNECTED
    );
  XLXI_976_XLXI_60 : BUF
    port map (
      I => XLXI_976_QH(8),
      O => NLW_XLXI_976_XLXI_60_O_UNCONNECTED
    );
  XLXI_976_XLXI_59 : BUF
    port map (
      I => XLXI_976_QH(7),
      O => NLW_XLXI_976_XLXI_59_O_UNCONNECTED
    );
  XLXI_976_XLXI_58 : BUF
    port map (
      I => XLXI_976_QH(6),
      O => NLW_XLXI_976_XLXI_58_O_UNCONNECTED
    );
  XLXI_976_XLXI_57 : BUF
    port map (
      I => XLXI_976_QH(5),
      O => NLW_XLXI_976_XLXI_57_O_UNCONNECTED
    );
  XLXI_976_XLXI_56 : BUF
    port map (
      I => XLXI_976_QH(4),
      O => NLW_XLXI_976_XLXI_56_O_UNCONNECTED
    );
  XLXI_976_XLXI_55 : BUF
    port map (
      I => XLXI_976_QH(3),
      O => XLXN_2205(19)
    );
  XLXI_976_XLXI_54 : BUF
    port map (
      I => XLXI_976_QH(2),
      O => XLXN_2205(18)
    );
  XLXI_976_XLXI_53 : BUF
    port map (
      I => XLXI_976_QH(1),
      O => XLXN_2205(17)
    );
  XLXI_976_XLXI_52 : BUF
    port map (
      I => XLXI_976_QH(0),
      O => XLXN_2205(16)
    );
  XLXI_976_XLXI_51 : BUF
    port map (
      I => XLXI_976_QL(15),
      O => XLXN_2205(15)
    );
  XLXI_976_XLXI_50 : BUF
    port map (
      I => XLXI_976_QL(14),
      O => XLXN_2205(14)
    );
  XLXI_976_XLXI_49 : BUF
    port map (
      I => XLXI_976_QL(13),
      O => XLXN_2205(13)
    );
  XLXI_976_XLXI_48 : BUF
    port map (
      I => XLXI_976_QL(12),
      O => XLXN_2205(12)
    );
  XLXI_976_XLXI_47 : BUF
    port map (
      I => XLXI_976_QL(11),
      O => XLXN_2205(11)
    );
  XLXI_976_XLXI_46 : BUF
    port map (
      I => XLXI_976_QL(10),
      O => XLXN_2205(10)
    );
  XLXI_976_XLXI_45 : BUF
    port map (
      I => XLXI_976_QL(9),
      O => XLXN_2205(9)
    );
  XLXI_976_XLXI_44 : BUF
    port map (
      I => XLXI_976_QL(8),
      O => XLXN_2205(8)
    );
  XLXI_976_XLXI_43 : BUF
    port map (
      I => XLXI_976_QL(7),
      O => XLXN_2205(7)
    );
  XLXI_976_XLXI_42 : BUF
    port map (
      I => XLXI_976_QL(6),
      O => XLXN_2205(6)
    );
  XLXI_976_XLXI_41 : BUF
    port map (
      I => XLXI_976_QL(5),
      O => XLXN_2205(5)
    );
  XLXI_976_XLXI_40 : BUF
    port map (
      I => XLXI_976_QL(4),
      O => XLXN_2205(4)
    );
  XLXI_976_XLXI_39 : BUF
    port map (
      I => XLXI_976_QL(3),
      O => XLXN_2205(3)
    );
  XLXI_976_XLXI_38 : BUF
    port map (
      I => XLXI_976_QL(2),
      O => XLXN_2205(2)
    );
  XLXI_976_XLXI_37 : BUF
    port map (
      I => XLXI_976_QL(1),
      O => XLXN_2205(1)
    );
  XLXI_976_XLXI_36 : BUF
    port map (
      I => XLXI_976_QL(0),
      O => XLXN_2205(0)
    );
  XLXI_976_XLXI_35 : BUF
    port map (
      I => XLXN_2204(31),
      O => XLXI_976_DH(15)
    );
  XLXI_976_XLXI_34 : BUF
    port map (
      I => XLXN_2204(30),
      O => XLXI_976_DH(14)
    );
  XLXI_976_XLXI_33 : BUF
    port map (
      I => XLXN_2204(29),
      O => XLXI_976_DH(13)
    );
  XLXI_976_XLXI_32 : BUF
    port map (
      I => XLXN_2204(28),
      O => XLXI_976_DH(12)
    );
  XLXI_976_XLXI_31 : BUF
    port map (
      I => XLXN_2204(27),
      O => XLXI_976_DH(11)
    );
  XLXI_976_XLXI_30 : BUF
    port map (
      I => XLXN_2204(26),
      O => XLXI_976_DH(10)
    );
  XLXI_976_XLXI_29 : BUF
    port map (
      I => XLXN_2204(25),
      O => XLXI_976_DH(9)
    );
  XLXI_976_XLXI_28 : BUF
    port map (
      I => XLXN_2204(24),
      O => XLXI_976_DH(8)
    );
  XLXI_976_XLXI_27 : BUF
    port map (
      I => XLXN_2204(23),
      O => XLXI_976_DH(7)
    );
  XLXI_976_XLXI_26 : BUF
    port map (
      I => XLXN_2204(22),
      O => XLXI_976_DH(6)
    );
  XLXI_976_XLXI_25 : BUF
    port map (
      I => XLXN_2204(21),
      O => XLXI_976_DH(5)
    );
  XLXI_976_XLXI_24 : BUF
    port map (
      I => XLXN_2204(20),
      O => XLXI_976_DH(4)
    );
  XLXI_976_XLXI_23 : BUF
    port map (
      I => XLXN_2204(19),
      O => XLXI_976_DH(3)
    );
  XLXI_976_XLXI_22 : BUF
    port map (
      I => XLXN_2204(18),
      O => XLXI_976_DH(2)
    );
  XLXI_976_XLXI_21 : BUF
    port map (
      I => XLXN_2204(17),
      O => XLXI_976_DH(1)
    );
  XLXI_976_XLXI_20 : BUF
    port map (
      I => XLXN_2204(16),
      O => XLXI_976_DH(0)
    );
  XLXI_976_XLXI_19 : BUF
    port map (
      I => XLXN_2204(15),
      O => XLXI_976_DL(15)
    );
  XLXI_976_XLXI_18 : BUF
    port map (
      I => XLXN_2204(14),
      O => XLXI_976_DL(14)
    );
  XLXI_976_XLXI_17 : BUF
    port map (
      I => XLXN_2204(13),
      O => XLXI_976_DL(13)
    );
  XLXI_976_XLXI_16 : BUF
    port map (
      I => XLXN_2204(12),
      O => XLXI_976_DL(12)
    );
  XLXI_976_XLXI_15 : BUF
    port map (
      I => XLXN_2204(11),
      O => XLXI_976_DL(11)
    );
  XLXI_976_XLXI_14 : BUF
    port map (
      I => XLXN_2204(10),
      O => XLXI_976_DL(10)
    );
  XLXI_976_XLXI_13 : BUF
    port map (
      I => XLXN_2204(9),
      O => XLXI_976_DL(9)
    );
  XLXI_976_XLXI_12 : BUF
    port map (
      I => XLXN_2204(8),
      O => XLXI_976_DL(8)
    );
  XLXI_976_XLXI_11 : BUF
    port map (
      I => XLXN_2204(7),
      O => XLXI_976_DL(7)
    );
  XLXI_976_XLXI_10 : BUF
    port map (
      I => XLXN_2204(6),
      O => XLXI_976_DL(6)
    );
  XLXI_976_XLXI_9 : BUF
    port map (
      I => XLXN_2204(5),
      O => XLXI_976_DL(5)
    );
  XLXI_976_XLXI_8 : BUF
    port map (
      I => XLXN_2204(4),
      O => XLXI_976_DL(4)
    );
  XLXI_976_XLXI_7 : BUF
    port map (
      I => XLXN_2204(3),
      O => XLXI_976_DL(3)
    );
  XLXI_976_XLXI_6 : BUF
    port map (
      I => XLXN_2204(2),
      O => XLXI_976_DL(2)
    );
  XLXI_976_XLXI_4 : BUF
    port map (
      I => XLXN_2204(1),
      O => XLXI_976_DL(1)
    );
  XLXI_976_XLXI_3 : BUF
    port map (
      I => XLXN_2204(0),
      O => XLXI_976_DL(0)
    );
  XLXI_874_XLXI_67 : BUF
    port map (
      I => XLXI_874_QH(15),
      O => XLXN_2204(31)
    );
  XLXI_874_XLXI_66 : BUF
    port map (
      I => XLXI_874_QH(14),
      O => XLXN_2204(30)
    );
  XLXI_874_XLXI_65 : BUF
    port map (
      I => XLXI_874_QH(13),
      O => XLXN_2204(29)
    );
  XLXI_874_XLXI_64 : BUF
    port map (
      I => XLXI_874_QH(12),
      O => XLXN_2204(28)
    );
  XLXI_874_XLXI_63 : BUF
    port map (
      I => XLXI_874_QH(11),
      O => XLXN_2204(27)
    );
  XLXI_874_XLXI_62 : BUF
    port map (
      I => XLXI_874_QH(10),
      O => XLXN_2204(26)
    );
  XLXI_874_XLXI_61 : BUF
    port map (
      I => XLXI_874_QH(9),
      O => XLXN_2204(25)
    );
  XLXI_874_XLXI_60 : BUF
    port map (
      I => XLXI_874_QH(8),
      O => XLXN_2204(24)
    );
  XLXI_874_XLXI_59 : BUF
    port map (
      I => XLXI_874_QH(7),
      O => XLXN_2204(23)
    );
  XLXI_874_XLXI_58 : BUF
    port map (
      I => XLXI_874_QH(6),
      O => XLXN_2204(22)
    );
  XLXI_874_XLXI_57 : BUF
    port map (
      I => XLXI_874_QH(5),
      O => XLXN_2204(21)
    );
  XLXI_874_XLXI_56 : BUF
    port map (
      I => XLXI_874_QH(4),
      O => XLXN_2204(20)
    );
  XLXI_874_XLXI_55 : BUF
    port map (
      I => XLXI_874_QH(3),
      O => XLXN_2204(19)
    );
  XLXI_874_XLXI_54 : BUF
    port map (
      I => XLXI_874_QH(2),
      O => XLXN_2204(18)
    );
  XLXI_874_XLXI_53 : BUF
    port map (
      I => XLXI_874_QH(1),
      O => XLXN_2204(17)
    );
  XLXI_874_XLXI_52 : BUF
    port map (
      I => XLXI_874_QH(0),
      O => XLXN_2204(16)
    );
  XLXI_874_XLXI_51 : BUF
    port map (
      I => XLXI_874_QL(15),
      O => XLXN_2204(15)
    );
  XLXI_874_XLXI_50 : BUF
    port map (
      I => XLXI_874_QL(14),
      O => XLXN_2204(14)
    );
  XLXI_874_XLXI_49 : BUF
    port map (
      I => XLXI_874_QL(13),
      O => XLXN_2204(13)
    );
  XLXI_874_XLXI_48 : BUF
    port map (
      I => XLXI_874_QL(12),
      O => XLXN_2204(12)
    );
  XLXI_874_XLXI_47 : BUF
    port map (
      I => XLXI_874_QL(11),
      O => XLXN_2204(11)
    );
  XLXI_874_XLXI_46 : BUF
    port map (
      I => XLXI_874_QL(10),
      O => XLXN_2204(10)
    );
  XLXI_874_XLXI_45 : BUF
    port map (
      I => XLXI_874_QL(9),
      O => XLXN_2204(9)
    );
  XLXI_874_XLXI_44 : BUF
    port map (
      I => XLXI_874_QL(8),
      O => XLXN_2204(8)
    );
  XLXI_874_XLXI_43 : BUF
    port map (
      I => XLXI_874_QL(7),
      O => XLXN_2204(7)
    );
  XLXI_874_XLXI_42 : BUF
    port map (
      I => XLXI_874_QL(6),
      O => XLXN_2204(6)
    );
  XLXI_874_XLXI_41 : BUF
    port map (
      I => XLXI_874_QL(5),
      O => XLXN_2204(5)
    );
  XLXI_874_XLXI_40 : BUF
    port map (
      I => XLXI_874_QL(4),
      O => XLXN_2204(4)
    );
  XLXI_874_XLXI_39 : BUF
    port map (
      I => XLXI_874_QL(3),
      O => XLXN_2204(3)
    );
  XLXI_874_XLXI_38 : BUF
    port map (
      I => XLXI_874_QL(2),
      O => XLXN_2204(2)
    );
  XLXI_874_XLXI_37 : BUF
    port map (
      I => XLXI_874_QL(1),
      O => XLXN_2204(1)
    );
  XLXI_874_XLXI_36 : BUF
    port map (
      I => XLXI_874_QL(0),
      O => XLXN_2204(0)
    );
  XLXI_874_XLXI_35 : BUF
    port map (
      I => XLXN_1873(31),
      O => XLXI_874_DH(15)
    );
  XLXI_874_XLXI_34 : BUF
    port map (
      I => XLXN_1873(30),
      O => XLXI_874_DH(14)
    );
  XLXI_874_XLXI_33 : BUF
    port map (
      I => XLXN_1873(29),
      O => XLXI_874_DH(13)
    );
  XLXI_874_XLXI_32 : BUF
    port map (
      I => XLXN_1873(28),
      O => XLXI_874_DH(12)
    );
  XLXI_874_XLXI_31 : BUF
    port map (
      I => XLXN_1873(27),
      O => XLXI_874_DH(11)
    );
  XLXI_874_XLXI_30 : BUF
    port map (
      I => XLXN_1873(26),
      O => XLXI_874_DH(10)
    );
  XLXI_874_XLXI_29 : BUF
    port map (
      I => XLXN_1873(25),
      O => XLXI_874_DH(9)
    );
  XLXI_874_XLXI_28 : BUF
    port map (
      I => XLXN_1873(24),
      O => XLXI_874_DH(8)
    );
  XLXI_874_XLXI_27 : BUF
    port map (
      I => XLXN_1873(23),
      O => XLXI_874_DH(7)
    );
  XLXI_874_XLXI_26 : BUF
    port map (
      I => XLXN_1873(22),
      O => XLXI_874_DH(6)
    );
  XLXI_874_XLXI_25 : BUF
    port map (
      I => XLXN_1873(21),
      O => XLXI_874_DH(5)
    );
  XLXI_874_XLXI_24 : BUF
    port map (
      I => XLXN_1873(20),
      O => XLXI_874_DH(4)
    );
  XLXI_874_XLXI_23 : BUF
    port map (
      I => XLXN_1873(19),
      O => XLXI_874_DH(3)
    );
  XLXI_874_XLXI_22 : BUF
    port map (
      I => XLXN_1873(18),
      O => XLXI_874_DH(2)
    );
  XLXI_874_XLXI_21 : BUF
    port map (
      I => XLXN_1873(17),
      O => XLXI_874_DH(1)
    );
  XLXI_874_XLXI_20 : BUF
    port map (
      I => XLXN_1873(16),
      O => XLXI_874_DH(0)
    );
  XLXI_874_XLXI_19 : BUF
    port map (
      I => XLXN_1873(15),
      O => XLXI_874_DL(15)
    );
  XLXI_874_XLXI_18 : BUF
    port map (
      I => XLXN_1873(14),
      O => XLXI_874_DL(14)
    );
  XLXI_874_XLXI_17 : BUF
    port map (
      I => XLXN_1873(13),
      O => XLXI_874_DL(13)
    );
  XLXI_874_XLXI_16 : BUF
    port map (
      I => XLXN_1873(12),
      O => XLXI_874_DL(12)
    );
  XLXI_874_XLXI_15 : BUF
    port map (
      I => XLXN_1873(11),
      O => XLXI_874_DL(11)
    );
  XLXI_874_XLXI_14 : BUF
    port map (
      I => XLXN_1873(10),
      O => XLXI_874_DL(10)
    );
  XLXI_874_XLXI_13 : BUF
    port map (
      I => XLXN_1873(9),
      O => XLXI_874_DL(9)
    );
  XLXI_874_XLXI_12 : BUF
    port map (
      I => XLXN_1873(8),
      O => XLXI_874_DL(8)
    );
  XLXI_874_XLXI_11 : BUF
    port map (
      I => XLXN_1873(7),
      O => XLXI_874_DL(7)
    );
  XLXI_874_XLXI_10 : BUF
    port map (
      I => XLXN_1873(6),
      O => XLXI_874_DL(6)
    );
  XLXI_874_XLXI_9 : BUF
    port map (
      I => XLXN_1873(5),
      O => XLXI_874_DL(5)
    );
  XLXI_874_XLXI_8 : BUF
    port map (
      I => XLXN_1873(4),
      O => XLXI_874_DL(4)
    );
  XLXI_874_XLXI_7 : BUF
    port map (
      I => XLXN_1873(3),
      O => XLXI_874_DL(3)
    );
  XLXI_874_XLXI_6 : BUF
    port map (
      I => XLXN_1873(2),
      O => XLXI_874_DL(2)
    );
  XLXI_874_XLXI_4 : BUF
    port map (
      I => XLXN_1873(1),
      O => XLXI_874_DL(1)
    );
  XLXI_874_XLXI_3 : BUF
    port map (
      I => XLXN_1873(0),
      O => XLXI_874_DL(0)
    );
  XLXI_655_XLXI_20 : BUF
    port map (
      I => XLXN_2205(19),
      O => XLXN_1248(3)
    );
  XLXI_655_XLXI_19 : BUF
    port map (
      I => XLXN_2205(18),
      O => XLXN_1248(2)
    );
  XLXI_655_XLXI_18 : BUF
    port map (
      I => XLXN_2205(17),
      O => XLXN_1248(1)
    );
  XLXI_655_XLXI_17 : BUF
    port map (
      I => XLXN_2205(16),
      O => XLXN_1248(0)
    );
  XLXI_655_XLXI_16 : BUF
    port map (
      I => XLXN_2205(7),
      O => DRAW_ADDR(15)
    );
  XLXI_655_XLXI_15 : BUF
    port map (
      I => XLXN_2205(6),
      O => DRAW_ADDR(14)
    );
  XLXI_655_XLXI_14 : BUF
    port map (
      I => XLXN_2205(5),
      O => DRAW_ADDR(13)
    );
  XLXI_655_XLXI_13 : BUF
    port map (
      I => XLXN_2205(4),
      O => DRAW_ADDR(12)
    );
  XLXI_655_XLXI_12 : BUF
    port map (
      I => XLXN_2205(3),
      O => DRAW_ADDR(11)
    );
  XLXI_655_XLXI_11 : BUF
    port map (
      I => XLXN_2205(2),
      O => DRAW_ADDR(10)
    );
  XLXI_655_XLXI_10 : BUF
    port map (
      I => XLXN_2205(1),
      O => DRAW_ADDR(9)
    );
  XLXI_655_XLXI_9 : BUF
    port map (
      I => XLXN_2205(0),
      O => DRAW_ADDR(8)
    );
  XLXI_655_XLXI_8 : BUF
    port map (
      I => XLXN_2205(15),
      O => DRAW_ADDR(7)
    );
  XLXI_655_XLXI_7 : BUF
    port map (
      I => XLXN_2205(14),
      O => DRAW_ADDR(6)
    );
  XLXI_655_XLXI_6 : BUF
    port map (
      I => XLXN_2205(13),
      O => DRAW_ADDR(5)
    );
  XLXI_655_XLXI_5 : BUF
    port map (
      I => XLXN_2205(12),
      O => DRAW_ADDR(4)
    );
  XLXI_655_XLXI_4 : BUF
    port map (
      I => XLXN_2205(11),
      O => DRAW_ADDR(3)
    );
  XLXI_655_XLXI_3 : BUF
    port map (
      I => XLXN_2205(10),
      O => DRAW_ADDR(2)
    );
  XLXI_655_XLXI_2 : BUF
    port map (
      I => XLXN_2205(9),
      O => DRAW_ADDR(1)
    );
  XLXI_655_XLXI_1 : BUF
    port map (
      I => XLXN_2205(8),
      O => DRAW_ADDR(0)
    );
  BTN1_IBUF : IBUF
    port map (
      I => BTN1,
      O => BTN1_IBUF_476
    );
  OSC_IBUFG : IBUFG
    port map (
      I => OSC,
      O => OSC_IBUFG_485
    );
  K1_1_OBUF : OBUF
    port map (
      I => K1_1_OBUF_638,
      O => K1_1
    );
  K1_3_OBUF : OBUF
    port map (
      I => K1_3_OBUF_637,
      O => K1_3
    );
  K1_5_OBUF : OBUF
    port map (
      I => K1_5_OBUF_631,
      O => K1_5
    );
  K1_7_OBUF : OBUF
    port map (
      I => K1_7_OBUF_632,
      O => K1_7
    );
  K1_9_OBUF : OBUF
    port map (
      I => K1_9_OBUF_633,
      O => K1_9
    );
  K1_11_OBUF : OBUF
    port map (
      I => K1_11_OBUF_634,
      O => K1_11
    );
  K1_13_OBUF : OBUF
    port map (
      I => K1_13_OBUF_635,
      O => K1_13
    );
  K1_15_OBUF : OBUF
    port map (
      I => K1_15_OBUF_636,
      O => K1_15
    );
  XLXI_48_XLXI_1_pll_base_inst : PLL_BASE
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 47,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 50.000000,
      CLKOUT0_DIVIDE => 11,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLK_FEEDBACK => "CLKFBOUT",
      COMPENSATION => "SYSTEM_SYNCHRONOUS",
      DIVCLK_DIVIDE => 1,
      REF_JITTER => 0.010000,
      RESET_ON_LOSS_OF_LOCK => FALSE
    )
    port map (
      CLKIN => XLXN_1271,
      CLKFBIN => XLXI_48_XLXI_1_clkfbout_buf,
      CLKOUT0 => XLXI_48_XLXI_1_clkout0,
      CLKFBOUT => XLXI_48_XLXI_1_clkfbout,
      RST => XLXN_2206,
      CLKOUT3 => NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT3_UNCONNECTED,
      CLKOUT1 => NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT1_UNCONNECTED,
      CLKOUT4 => NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT5_UNCONNECTED,
      CLKOUT2 => NLW_XLXI_48_XLXI_1_pll_base_inst_CLKOUT2_UNCONNECTED,
      LOCKED => NLW_XLXI_48_XLXI_1_pll_base_inst_LOCKED_UNCONNECTED
    );
  XLXI_662_XLXI_1_pll_base_inst : PLL_BASE
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 36,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 50.000000,
      CLKOUT0_DIVIDE => 18,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 2,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLK_FEEDBACK => "CLKFBOUT",
      COMPENSATION => "SYSTEM_SYNCHRONOUS",
      DIVCLK_DIVIDE => 1,
      REF_JITTER => 0.010000,
      RESET_ON_LOSS_OF_LOCK => FALSE
    )
    port map (
      CLKIN => XLXN_1271,
      CLKFBIN => XLXI_662_XLXI_1_clkfbout_buf,
      CLKOUT1 => XLXI_662_XLXI_1_clkout1,
      CLKOUT0 => XLXI_662_XLXI_1_clkout0,
      CLKFBOUT => XLXI_662_XLXI_1_clkfbout,
      RST => XLXN_2206,
      CLKOUT3 => NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT3_UNCONNECTED,
      CLKOUT4 => NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT5_UNCONNECTED,
      CLKOUT2 => NLW_XLXI_662_XLXI_1_pll_base_inst_CLKOUT2_UNCONNECTED,
      LOCKED => NLW_XLXI_662_XLXI_1_pll_base_inst_LOCKED_UNCONNECTED
    );
  XLXI_49_XLXI_1 : h_counter
    port map (
      clk => VGA_CLK,
      ce => XLXN_2208,
      thresh0 => XLXN_120,
      q(10) => H_CNT(10),
      q(9) => H_CNT(9),
      q(8) => H_CNT(8),
      q(7) => H_CNT(7),
      q(6) => H_CNT(6),
      q(5) => H_CNT(5),
      q(4) => H_CNT(4),
      q(3) => H_CNT(3),
      q(2) => H_CNT(2),
      q(1) => H_CNT(1),
      q(0) => H_CNT(0)
    );
  XLXI_50_XLXI_1 : v_counter
    port map (
      clk => VGA_CLK,
      ce => XLXN_120,
      q(9) => Y_CNT(9),
      q(8) => Y_CNT(8),
      q(7) => Y_CNT(7),
      q(6) => Y_CNT(6),
      q(5) => Y_CNT(5),
      q(4) => Y_CNT(4),
      q(3) => Y_CNT(3),
      q(2) => Y_CNT(2),
      q(1) => Y_CNT(1),
      q(0) => Y_CNT(0)
    );
  XLXI_659_XLXI_1 : sdp_vram
    port map (
      clka => CLK,
      clkb => VGA_CLK,
      wea(0) => XLXN_2208,
      addra(15) => DRAW_ADDR(15),
      addra(14) => DRAW_ADDR(14),
      addra(13) => DRAW_ADDR(13),
      addra(12) => DRAW_ADDR(12),
      addra(11) => DRAW_ADDR(11),
      addra(10) => DRAW_ADDR(10),
      addra(9) => DRAW_ADDR(9),
      addra(8) => DRAW_ADDR(8),
      addra(7) => DRAW_ADDR(7),
      addra(6) => DRAW_ADDR(6),
      addra(5) => DRAW_ADDR(5),
      addra(4) => DRAW_ADDR(4),
      addra(3) => DRAW_ADDR(3),
      addra(2) => DRAW_ADDR(2),
      addra(1) => DRAW_ADDR(1),
      addra(0) => DRAW_ADDR(0),
      dina(3) => XLXN_1248(3),
      dina(2) => XLXN_1248(2),
      dina(1) => XLXN_1248(1),
      dina(0) => XLXN_1248(0),
      addrb(15) => DISP_ADDR(15),
      addrb(14) => DISP_ADDR(14),
      addrb(13) => DISP_ADDR(13),
      addrb(12) => DISP_ADDR(12),
      addrb(11) => DISP_ADDR(11),
      addrb(10) => DISP_ADDR(10),
      addrb(9) => DISP_ADDR(9),
      addrb(8) => DISP_ADDR(8),
      addrb(7) => DISP_ADDR(7),
      addrb(6) => DISP_ADDR(6),
      addrb(5) => DISP_ADDR(5),
      addrb(4) => DISP_ADDR(4),
      addrb(3) => DISP_ADDR(3),
      addrb(2) => DISP_ADDR(2),
      addrb(1) => DISP_ADDR(1),
      addrb(0) => DISP_ADDR(0),
      doutb(3) => XLXN_957(3),
      doutb(2) => XLXN_957(2),
      doutb(1) => XLXN_957(1),
      doutb(0) => XLXN_957(0)
    );
  Receiver_XLXI_16_q_tmp_15 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(14),
      Q => Receiver_XLXN_40(15)
    );
  Receiver_XLXI_16_q_tmp_14 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(13),
      Q => Receiver_XLXN_40(14)
    );
  Receiver_XLXI_16_q_tmp_13 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(12),
      Q => Receiver_XLXN_40(13)
    );
  Receiver_XLXI_16_q_tmp_12 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(11),
      Q => Receiver_XLXN_40(12)
    );
  Receiver_XLXI_16_q_tmp_11 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(10),
      Q => Receiver_XLXN_40(11)
    );
  Receiver_XLXI_16_q_tmp_10 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(9),
      Q => Receiver_XLXN_40(10)
    );
  Receiver_XLXI_16_q_tmp_9 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(8),
      Q => Receiver_XLXN_40(9)
    );
  Receiver_XLXI_16_q_tmp_8 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(7),
      Q => Receiver_XLXN_40(8)
    );
  Receiver_XLXI_16_q_tmp_7 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(6),
      Q => Receiver_XLXN_40(7)
    );
  Receiver_XLXI_16_q_tmp_6 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(5),
      Q => Receiver_XLXN_40(6)
    );
  Receiver_XLXI_16_q_tmp_5 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(4),
      Q => Receiver_XLXN_40(5)
    );
  Receiver_XLXI_16_q_tmp_4 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(3),
      Q => Receiver_XLXN_40(4)
    );
  Receiver_XLXI_16_q_tmp_3 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(2),
      Q => Receiver_XLXN_40(3)
    );
  Receiver_XLXI_16_q_tmp_2 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(1),
      Q => Receiver_XLXN_40(2)
    );
  Receiver_XLXI_16_q_tmp_1 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_40(0),
      Q => Receiver_XLXN_40(1)
    );
  Receiver_XLXI_16_q_tmp_0 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_15,
      Q => Receiver_XLXN_40(0)
    );
  Receiver_XLXI_15_q_tmp_15 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(14),
      Q => Receiver_XLXN_41(15)
    );
  Receiver_XLXI_15_q_tmp_14 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(13),
      Q => Receiver_XLXN_41(14)
    );
  Receiver_XLXI_15_q_tmp_13 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(12),
      Q => Receiver_XLXN_41(13)
    );
  Receiver_XLXI_15_q_tmp_12 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(11),
      Q => Receiver_XLXN_41(12)
    );
  Receiver_XLXI_15_q_tmp_11 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(10),
      Q => Receiver_XLXN_41(11)
    );
  Receiver_XLXI_15_q_tmp_10 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(9),
      Q => Receiver_XLXN_41(10)
    );
  Receiver_XLXI_15_q_tmp_9 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(8),
      Q => Receiver_XLXN_41(9)
    );
  Receiver_XLXI_15_q_tmp_8 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(7),
      Q => Receiver_XLXN_41(8)
    );
  Receiver_XLXI_15_q_tmp_7 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(6),
      Q => Receiver_XLXN_41(7)
    );
  Receiver_XLXI_15_q_tmp_6 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(5),
      Q => Receiver_XLXN_41(6)
    );
  Receiver_XLXI_15_q_tmp_5 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(4),
      Q => Receiver_XLXN_41(5)
    );
  Receiver_XLXI_15_q_tmp_4 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(3),
      Q => Receiver_XLXN_41(4)
    );
  Receiver_XLXI_15_q_tmp_3 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(2),
      Q => Receiver_XLXN_41(3)
    );
  Receiver_XLXI_15_q_tmp_2 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(1),
      Q => Receiver_XLXN_41(2)
    );
  Receiver_XLXI_15_q_tmp_1 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_41(0),
      Q => Receiver_XLXN_41(1)
    );
  Receiver_XLXI_15_q_tmp_0 : FDCE
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXN_27,
      Q => Receiver_XLXN_41(0)
    );
  Receiver_XLXI_22_Mcount_COUNT_xor_0_11_INV_0 : INV
    port map (
      I => Receiver_XLXI_22_COUNT(0),
      O => Receiver_XLXI_22_Result(0)
    );
  Receiver_XLXI_22_Result_2_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => Receiver_XLXI_22_COUNT(2),
      I1 => Receiver_XLXI_22_COUNT(0),
      I2 => Receiver_XLXI_22_COUNT(1),
      O => Receiver_XLXI_22_Result(2)
    );
  Receiver_XLXI_22_Result_3_1 : LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      I0 => Receiver_XLXI_22_COUNT(2),
      I1 => Receiver_XLXI_22_COUNT(3),
      I2 => Receiver_XLXI_22_COUNT(0),
      I3 => Receiver_XLXI_22_COUNT(1),
      O => Receiver_XLXI_22_Result(3)
    );
  Receiver_XLXI_22_TC11 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => Receiver_XLXI_22_COUNT(0),
      I1 => Receiver_XLXI_22_COUNT(1),
      I2 => Receiver_XLXI_22_COUNT(2),
      I3 => Receiver_XLXI_22_COUNT(3),
      O => Receiver_XLXN_76
    );
  Receiver_XLXI_22_Mcount_COUNT_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Receiver_XLXI_22_COUNT(1),
      I1 => Receiver_XLXI_22_COUNT(0),
      O => Receiver_XLXI_22_Result(1)
    );
  Receiver_XLXI_22_COUNT_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_22_Result(3),
      Q => Receiver_XLXI_22_COUNT(3)
    );
  Receiver_XLXI_22_COUNT_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_22_Result(2),
      Q => Receiver_XLXI_22_COUNT(2)
    );
  Receiver_XLXI_22_COUNT_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_22_Result(1),
      Q => Receiver_XLXI_22_COUNT(1)
    );
  Receiver_XLXI_22_COUNT_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_49,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_22_Result(0),
      Q => Receiver_XLXI_22_COUNT(0)
    );
  Receiver_XLXI_21_Mcount_COUNT_xor_0_11_INV_0 : INV
    port map (
      I => Receiver_XLXI_21_COUNT(0),
      O => Receiver_XLXI_21_Result(0)
    );
  Receiver_XLXI_21_Result_2_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => Receiver_XLXI_21_COUNT(2),
      I1 => Receiver_XLXI_21_COUNT(0),
      I2 => Receiver_XLXI_21_COUNT(1),
      O => Receiver_XLXI_21_Result(2)
    );
  Receiver_XLXI_21_Result_3_1 : LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      I0 => Receiver_XLXI_21_COUNT(2),
      I1 => Receiver_XLXI_21_COUNT(3),
      I2 => Receiver_XLXI_21_COUNT(0),
      I3 => Receiver_XLXI_21_COUNT(1),
      O => Receiver_XLXI_21_Result(3)
    );
  Receiver_XLXI_21_TC11 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => Receiver_XLXI_21_COUNT(0),
      I1 => Receiver_XLXI_21_COUNT(1),
      I2 => Receiver_XLXI_21_COUNT(2),
      I3 => Receiver_XLXI_21_COUNT(3),
      O => Receiver_XLXN_65
    );
  Receiver_XLXI_21_Mcount_COUNT_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Receiver_XLXI_21_COUNT(1),
      I1 => Receiver_XLXI_21_COUNT(0),
      O => Receiver_XLXI_21_Result(1)
    );
  Receiver_XLXI_21_COUNT_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_21_Result(3),
      Q => Receiver_XLXI_21_COUNT(3)
    );
  Receiver_XLXI_21_COUNT_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_21_Result(2),
      Q => Receiver_XLXI_21_COUNT(2)
    );
  Receiver_XLXI_21_COUNT_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_21_Result(1),
      Q => Receiver_XLXI_21_COUNT(1)
    );
  Receiver_XLXI_21_COUNT_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_48,
      CLR => BTN1_IBUF_476,
      D => Receiver_XLXI_21_Result(0),
      Q => Receiver_XLXI_21_COUNT(0)
    );
  Receiver_XLXI_20_Q_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(15),
      Q => Receiver_XLXN_98(15)
    );
  Receiver_XLXI_20_Q_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(14),
      Q => Receiver_XLXN_98(14)
    );
  Receiver_XLXI_20_Q_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(13),
      Q => Receiver_XLXN_98(13)
    );
  Receiver_XLXI_20_Q_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(12),
      Q => Receiver_XLXN_98(12)
    );
  Receiver_XLXI_20_Q_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(11),
      Q => Receiver_XLXN_98(11)
    );
  Receiver_XLXI_20_Q_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(10),
      Q => Receiver_XLXN_98(10)
    );
  Receiver_XLXI_20_Q_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(9),
      Q => Receiver_XLXN_98(9)
    );
  Receiver_XLXI_20_Q_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(8),
      Q => Receiver_XLXN_98(8)
    );
  Receiver_XLXI_20_Q_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(7),
      Q => Receiver_XLXN_98(7)
    );
  Receiver_XLXI_20_Q_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(6),
      Q => Receiver_XLXN_98(6)
    );
  Receiver_XLXI_20_Q_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(5),
      Q => Receiver_XLXN_98(5)
    );
  Receiver_XLXI_20_Q_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(4),
      Q => Receiver_XLXN_98(4)
    );
  Receiver_XLXI_20_Q_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(3),
      Q => Receiver_XLXN_98(3)
    );
  Receiver_XLXI_20_Q_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(2),
      Q => Receiver_XLXN_98(2)
    );
  Receiver_XLXI_20_Q_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(1),
      Q => Receiver_XLXN_98(1)
    );
  Receiver_XLXI_20_Q_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_181,
      CLR => XLXN_2206,
      D => Receiver_XLXN_42(0),
      Q => Receiver_XLXN_98(0)
    );
  Receiver_XLXI_19_Q_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(15),
      Q => Receiver_XLXN_97(15)
    );
  Receiver_XLXI_19_Q_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(14),
      Q => Receiver_XLXN_97(14)
    );
  Receiver_XLXI_19_Q_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(13),
      Q => Receiver_XLXN_97(13)
    );
  Receiver_XLXI_19_Q_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(12),
      Q => Receiver_XLXN_97(12)
    );
  Receiver_XLXI_19_Q_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(11),
      Q => Receiver_XLXN_97(11)
    );
  Receiver_XLXI_19_Q_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(10),
      Q => Receiver_XLXN_97(10)
    );
  Receiver_XLXI_19_Q_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(9),
      Q => Receiver_XLXN_97(9)
    );
  Receiver_XLXI_19_Q_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(8),
      Q => Receiver_XLXN_97(8)
    );
  Receiver_XLXI_19_Q_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(7),
      Q => Receiver_XLXN_97(7)
    );
  Receiver_XLXI_19_Q_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(6),
      Q => Receiver_XLXN_97(6)
    );
  Receiver_XLXI_19_Q_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(5),
      Q => Receiver_XLXN_97(5)
    );
  Receiver_XLXI_19_Q_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(4),
      Q => Receiver_XLXN_97(4)
    );
  Receiver_XLXI_19_Q_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(3),
      Q => Receiver_XLXN_97(3)
    );
  Receiver_XLXI_19_Q_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(2),
      Q => Receiver_XLXN_97(2)
    );
  Receiver_XLXI_19_Q_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(1),
      Q => Receiver_XLXN_97(1)
    );
  Receiver_XLXI_19_Q_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => XLXN_77,
      CE => Receiver_XLXN_125,
      CLR => XLXN_2206,
      D => Receiver_XLXN_43(0),
      Q => Receiver_XLXN_97(0)
    );
  XLXI_976_XLXI_1_Q_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(15),
      Q => XLXI_976_QL(15)
    );
  XLXI_976_XLXI_1_Q_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(14),
      Q => XLXI_976_QL(14)
    );
  XLXI_976_XLXI_1_Q_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(13),
      Q => XLXI_976_QL(13)
    );
  XLXI_976_XLXI_1_Q_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(12),
      Q => XLXI_976_QL(12)
    );
  XLXI_976_XLXI_1_Q_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(11),
      Q => XLXI_976_QL(11)
    );
  XLXI_976_XLXI_1_Q_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(10),
      Q => XLXI_976_QL(10)
    );
  XLXI_976_XLXI_1_Q_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(9),
      Q => XLXI_976_QL(9)
    );
  XLXI_976_XLXI_1_Q_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(8),
      Q => XLXI_976_QL(8)
    );
  XLXI_976_XLXI_1_Q_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(7),
      Q => XLXI_976_QL(7)
    );
  XLXI_976_XLXI_1_Q_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(6),
      Q => XLXI_976_QL(6)
    );
  XLXI_976_XLXI_1_Q_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(5),
      Q => XLXI_976_QL(5)
    );
  XLXI_976_XLXI_1_Q_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(4),
      Q => XLXI_976_QL(4)
    );
  XLXI_976_XLXI_1_Q_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(3),
      Q => XLXI_976_QL(3)
    );
  XLXI_976_XLXI_1_Q_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(2),
      Q => XLXI_976_QL(2)
    );
  XLXI_976_XLXI_1_Q_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(1),
      Q => XLXI_976_QL(1)
    );
  XLXI_976_XLXI_1_Q_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DL(0),
      Q => XLXI_976_QL(0)
    );
  XLXI_976_XLXI_2_Q_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(15),
      Q => XLXI_976_QH(15)
    );
  XLXI_976_XLXI_2_Q_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(14),
      Q => XLXI_976_QH(14)
    );
  XLXI_976_XLXI_2_Q_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(13),
      Q => XLXI_976_QH(13)
    );
  XLXI_976_XLXI_2_Q_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(12),
      Q => XLXI_976_QH(12)
    );
  XLXI_976_XLXI_2_Q_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(11),
      Q => XLXI_976_QH(11)
    );
  XLXI_976_XLXI_2_Q_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(10),
      Q => XLXI_976_QH(10)
    );
  XLXI_976_XLXI_2_Q_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(9),
      Q => XLXI_976_QH(9)
    );
  XLXI_976_XLXI_2_Q_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(8),
      Q => XLXI_976_QH(8)
    );
  XLXI_976_XLXI_2_Q_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(7),
      Q => XLXI_976_QH(7)
    );
  XLXI_976_XLXI_2_Q_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(6),
      Q => XLXI_976_QH(6)
    );
  XLXI_976_XLXI_2_Q_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(5),
      Q => XLXI_976_QH(5)
    );
  XLXI_976_XLXI_2_Q_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(4),
      Q => XLXI_976_QH(4)
    );
  XLXI_976_XLXI_2_Q_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(3),
      Q => XLXI_976_QH(3)
    );
  XLXI_976_XLXI_2_Q_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(2),
      Q => XLXI_976_QH(2)
    );
  XLXI_976_XLXI_2_Q_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(1),
      Q => XLXI_976_QH(1)
    );
  XLXI_976_XLXI_2_Q_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_976_DH(0),
      Q => XLXI_976_QH(0)
    );
  XLXI_874_XLXI_1_Q_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(15),
      Q => XLXI_874_QL(15)
    );
  XLXI_874_XLXI_1_Q_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(14),
      Q => XLXI_874_QL(14)
    );
  XLXI_874_XLXI_1_Q_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(13),
      Q => XLXI_874_QL(13)
    );
  XLXI_874_XLXI_1_Q_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(12),
      Q => XLXI_874_QL(12)
    );
  XLXI_874_XLXI_1_Q_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(11),
      Q => XLXI_874_QL(11)
    );
  XLXI_874_XLXI_1_Q_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(10),
      Q => XLXI_874_QL(10)
    );
  XLXI_874_XLXI_1_Q_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(9),
      Q => XLXI_874_QL(9)
    );
  XLXI_874_XLXI_1_Q_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(8),
      Q => XLXI_874_QL(8)
    );
  XLXI_874_XLXI_1_Q_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(7),
      Q => XLXI_874_QL(7)
    );
  XLXI_874_XLXI_1_Q_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(6),
      Q => XLXI_874_QL(6)
    );
  XLXI_874_XLXI_1_Q_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(5),
      Q => XLXI_874_QL(5)
    );
  XLXI_874_XLXI_1_Q_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(4),
      Q => XLXI_874_QL(4)
    );
  XLXI_874_XLXI_1_Q_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(3),
      Q => XLXI_874_QL(3)
    );
  XLXI_874_XLXI_1_Q_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(2),
      Q => XLXI_874_QL(2)
    );
  XLXI_874_XLXI_1_Q_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(1),
      Q => XLXI_874_QL(1)
    );
  XLXI_874_XLXI_1_Q_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DL(0),
      Q => XLXI_874_QL(0)
    );
  XLXI_874_XLXI_2_Q_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(15),
      Q => XLXI_874_QH(15)
    );
  XLXI_874_XLXI_2_Q_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(14),
      Q => XLXI_874_QH(14)
    );
  XLXI_874_XLXI_2_Q_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(13),
      Q => XLXI_874_QH(13)
    );
  XLXI_874_XLXI_2_Q_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(12),
      Q => XLXI_874_QH(12)
    );
  XLXI_874_XLXI_2_Q_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(11),
      Q => XLXI_874_QH(11)
    );
  XLXI_874_XLXI_2_Q_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(10),
      Q => XLXI_874_QH(10)
    );
  XLXI_874_XLXI_2_Q_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(9),
      Q => XLXI_874_QH(9)
    );
  XLXI_874_XLXI_2_Q_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(8),
      Q => XLXI_874_QH(8)
    );
  XLXI_874_XLXI_2_Q_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(7),
      Q => XLXI_874_QH(7)
    );
  XLXI_874_XLXI_2_Q_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(6),
      Q => XLXI_874_QH(6)
    );
  XLXI_874_XLXI_2_Q_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(5),
      Q => XLXI_874_QH(5)
    );
  XLXI_874_XLXI_2_Q_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(4),
      Q => XLXI_874_QH(4)
    );
  XLXI_874_XLXI_2_Q_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(3),
      Q => XLXI_874_QH(3)
    );
  XLXI_874_XLXI_2_Q_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(2),
      Q => XLXI_874_QH(2)
    );
  XLXI_874_XLXI_2_Q_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(1),
      Q => XLXI_874_QH(1)
    );
  XLXI_874_XLXI_2_Q_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK,
      CE => XLXN_2208,
      CLR => XLXN_2206,
      D => XLXI_874_DH(0),
      Q => XLXI_874_QH(0)
    );
  SYNC_V_Mmux_q_tmp_q_tmp_MUX_3_o11 : LUT3
    generic map(
      INIT => X"4C"
    )
    port map (
      I0 => XLXN_940,
      I1 => Y_770,
      I2 => Y_773,
      O => SYNC_V_q_tmp_q_tmp_MUX_3_o
    );
  SYNC_V_n0013_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => Y_770,
      I1 => Y_773,
      O => SYNC_V_n0013_inv
    );
  SYNC_V_q_tmp : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => SYNC_V_n0013_inv,
      CLR => XLXN_2206,
      D => SYNC_V_q_tmp_q_tmp_MUX_3_o,
      Q => XLXN_940
    );
  SYNC_H_Mmux_q_tmp_q_tmp_MUX_3_o11 : LUT3
    generic map(
      INIT => X"4C"
    )
    port map (
      I0 => XLXN_939,
      I1 => H_1435,
      I2 => H_1578,
      O => SYNC_H_q_tmp_q_tmp_MUX_3_o
    );
  SYNC_H_n0013_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => H_1435,
      I1 => H_1578,
      O => SYNC_H_n0013_inv
    );
  SYNC_H_q_tmp : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => SYNC_H_n0013_inv,
      CLR => XLXN_2206,
      D => SYNC_H_q_tmp_q_tmp_MUX_3_o,
      Q => XLXN_939
    );
  DISP_Y_Mmux_q_tmp_q_tmp_MUX_3_o11 : LUT3
    generic map(
      INIT => X"70"
    )
    port map (
      I0 => XLXN_936,
      I1 => Y_767,
      I2 => Y_797,
      O => DISP_Y_q_tmp_q_tmp_MUX_3_o
    );
  DISP_Y_n0013_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => Y_797,
      I1 => Y_767,
      O => DISP_Y_n0013_inv
    );
  DISP_Y_q_tmp : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => DISP_Y_n0013_inv,
      CLR => XLXN_2206,
      D => DISP_Y_q_tmp_q_tmp_MUX_3_o,
      Q => XLXN_936
    );
  DISP_X_Mmux_q_tmp_q_tmp_MUX_3_o11 : LUT3
    generic map(
      INIT => X"4C"
    )
    port map (
      I0 => XLXN_937,
      I1 => H_298,
      I2 => H_1066,
      O => DISP_X_q_tmp_q_tmp_MUX_3_o
    );
  DISP_X_n0013_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => H_298,
      I1 => H_1066,
      O => DISP_X_n0013_inv
    );
  DISP_X_q_tmp : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => DISP_X_n0013_inv,
      CLR => XLXN_2206,
      D => DISP_X_q_tmp_q_tmp_MUX_3_o,
      Q => XLXN_937
    );
  DISP_Y_REG_Mcount_COUNT_lut_0_INV_0 : INV
    port map (
      I => DISP_ADDR_Y(0),
      O => DISP_Y_REG_Mcount_COUNT_lut(0)
    );
  DISP_Y_REG_Mcount_COUNT_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_Y(6),
      O => DISP_Y_REG_Mcount_COUNT_cy_6_rt_336
    );
  DISP_Y_REG_Mcount_COUNT_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_Y(5),
      O => DISP_Y_REG_Mcount_COUNT_cy_5_rt_335
    );
  DISP_Y_REG_Mcount_COUNT_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_Y(4),
      O => DISP_Y_REG_Mcount_COUNT_cy_4_rt_334
    );
  DISP_Y_REG_Mcount_COUNT_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_Y(3),
      O => DISP_Y_REG_Mcount_COUNT_cy_3_rt_333
    );
  DISP_Y_REG_Mcount_COUNT_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_Y(2),
      O => DISP_Y_REG_Mcount_COUNT_cy_2_rt_332
    );
  DISP_Y_REG_Mcount_COUNT_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_Y(1),
      O => DISP_Y_REG_Mcount_COUNT_cy_1_rt_331
    );
  DISP_Y_REG_Mcount_COUNT_xor_7_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(6),
      LI => DISP_ADDR_Y(7),
      O => DISP_Y_REG_Result(7)
    );
  DISP_Y_REG_Mcount_COUNT_xor_6_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(5),
      LI => DISP_Y_REG_Mcount_COUNT_cy_6_rt_336,
      O => DISP_Y_REG_Result(6)
    );
  DISP_Y_REG_Mcount_COUNT_cy_6_Q : MUXCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(5),
      DI => DISP_Y_REG_N1,
      S => DISP_Y_REG_Mcount_COUNT_cy_6_rt_336,
      O => DISP_Y_REG_Mcount_COUNT_cy(6)
    );
  DISP_Y_REG_Mcount_COUNT_xor_5_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(4),
      LI => DISP_Y_REG_Mcount_COUNT_cy_5_rt_335,
      O => DISP_Y_REG_Result(5)
    );
  DISP_Y_REG_Mcount_COUNT_cy_5_Q : MUXCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(4),
      DI => DISP_Y_REG_N1,
      S => DISP_Y_REG_Mcount_COUNT_cy_5_rt_335,
      O => DISP_Y_REG_Mcount_COUNT_cy(5)
    );
  DISP_Y_REG_Mcount_COUNT_xor_4_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(3),
      LI => DISP_Y_REG_Mcount_COUNT_cy_4_rt_334,
      O => DISP_Y_REG_Result(4)
    );
  DISP_Y_REG_Mcount_COUNT_cy_4_Q : MUXCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(3),
      DI => DISP_Y_REG_N1,
      S => DISP_Y_REG_Mcount_COUNT_cy_4_rt_334,
      O => DISP_Y_REG_Mcount_COUNT_cy(4)
    );
  DISP_Y_REG_Mcount_COUNT_xor_3_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(2),
      LI => DISP_Y_REG_Mcount_COUNT_cy_3_rt_333,
      O => DISP_Y_REG_Result(3)
    );
  DISP_Y_REG_Mcount_COUNT_cy_3_Q : MUXCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(2),
      DI => DISP_Y_REG_N1,
      S => DISP_Y_REG_Mcount_COUNT_cy_3_rt_333,
      O => DISP_Y_REG_Mcount_COUNT_cy(3)
    );
  DISP_Y_REG_Mcount_COUNT_xor_2_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(1),
      LI => DISP_Y_REG_Mcount_COUNT_cy_2_rt_332,
      O => DISP_Y_REG_Result(2)
    );
  DISP_Y_REG_Mcount_COUNT_cy_2_Q : MUXCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(1),
      DI => DISP_Y_REG_N1,
      S => DISP_Y_REG_Mcount_COUNT_cy_2_rt_332,
      O => DISP_Y_REG_Mcount_COUNT_cy(2)
    );
  DISP_Y_REG_Mcount_COUNT_xor_1_Q : XORCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(0),
      LI => DISP_Y_REG_Mcount_COUNT_cy_1_rt_331,
      O => DISP_Y_REG_Result(1)
    );
  DISP_Y_REG_Mcount_COUNT_cy_1_Q : MUXCY
    port map (
      CI => DISP_Y_REG_Mcount_COUNT_cy(0),
      DI => DISP_Y_REG_N1,
      S => DISP_Y_REG_Mcount_COUNT_cy_1_rt_331,
      O => DISP_Y_REG_Mcount_COUNT_cy(1)
    );
  DISP_Y_REG_Mcount_COUNT_xor_0_Q : XORCY
    port map (
      CI => DISP_Y_REG_N1,
      LI => DISP_Y_REG_Mcount_COUNT_lut(0),
      O => DISP_Y_REG_Result(0)
    );
  DISP_Y_REG_Mcount_COUNT_cy_0_Q : MUXCY
    port map (
      CI => DISP_Y_REG_N1,
      DI => DISP_Y_REG_N0,
      S => DISP_Y_REG_Mcount_COUNT_lut(0),
      O => DISP_Y_REG_Mcount_COUNT_cy(0)
    );
  DISP_Y_REG_COUNT_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(7),
      Q => DISP_ADDR_Y(7)
    );
  DISP_Y_REG_COUNT_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(6),
      Q => DISP_ADDR_Y(6)
    );
  DISP_Y_REG_COUNT_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(5),
      Q => DISP_ADDR_Y(5)
    );
  DISP_Y_REG_COUNT_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(4),
      Q => DISP_ADDR_Y(4)
    );
  DISP_Y_REG_COUNT_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(3),
      Q => DISP_ADDR_Y(3)
    );
  DISP_Y_REG_COUNT_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(2),
      Q => DISP_ADDR_Y(2)
    );
  DISP_Y_REG_COUNT_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(1),
      Q => DISP_ADDR_Y(1)
    );
  DISP_Y_REG_COUNT_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_817,
      CLR => XLXN_2206,
      D => DISP_Y_REG_Result(0),
      Q => DISP_ADDR_Y(0)
    );
  DISP_Y_REG_XST_GND : GND
    port map (
      G => DISP_Y_REG_N1
    );
  DISP_Y_REG_XST_VCC : VCC
    port map (
      P => DISP_Y_REG_N0
    );
  DISP_X_REG_Mcount_COUNT_lut_0_INV_0 : INV
    port map (
      I => DISP_ADDR_X(0),
      O => DISP_X_REG_Mcount_COUNT_lut(0)
    );
  DISP_X_REG_Mcount_COUNT_xor_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(7),
      O => DISP_X_REG_Mcount_COUNT_xor_7_rt_375
    );
  DISP_X_REG_Mcount_COUNT_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(6),
      O => DISP_X_REG_Mcount_COUNT_cy_6_rt_374
    );
  DISP_X_REG_Mcount_COUNT_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(5),
      O => DISP_X_REG_Mcount_COUNT_cy_5_rt_373
    );
  DISP_X_REG_Mcount_COUNT_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(4),
      O => DISP_X_REG_Mcount_COUNT_cy_4_rt_372
    );
  DISP_X_REG_Mcount_COUNT_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(3),
      O => DISP_X_REG_Mcount_COUNT_cy_3_rt_371
    );
  DISP_X_REG_Mcount_COUNT_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(2),
      O => DISP_X_REG_Mcount_COUNT_cy_2_rt_370
    );
  DISP_X_REG_Mcount_COUNT_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => DISP_ADDR_X(1),
      O => DISP_X_REG_Mcount_COUNT_cy_1_rt_369
    );
  DISP_X_REG_TC_7_Q : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => DISP_ADDR_X(7),
      I1 => DISP_ADDR_X(6),
      I2 => DISP_ADDR_X(5),
      I3 => DISP_ADDR_X(4),
      I4 => DISP_ADDR_X(3),
      I5 => DISP_X_REG_N01,
      O => DISP_X_REG_TC
    );
  DISP_X_REG_TC_7_SW0 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => DISP_ADDR_X(2),
      I1 => DISP_ADDR_X(0),
      I2 => DISP_ADDR_X(1),
      O => DISP_X_REG_N01
    );
  DISP_X_REG_CEO1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DISP_X_REG_TC,
      I1 => XLXN_772,
      O => XLXN_796
    );
  DISP_X_REG_Mcount_COUNT_xor_7_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(6),
      LI => DISP_X_REG_Mcount_COUNT_xor_7_rt_375,
      O => DISP_X_REG_Result(7)
    );
  DISP_X_REG_Mcount_COUNT_xor_6_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(5),
      LI => DISP_X_REG_Mcount_COUNT_cy_6_rt_374,
      O => DISP_X_REG_Result(6)
    );
  DISP_X_REG_Mcount_COUNT_cy_6_Q : MUXCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(5),
      DI => DISP_X_REG_N1,
      S => DISP_X_REG_Mcount_COUNT_cy_6_rt_374,
      O => DISP_X_REG_Mcount_COUNT_cy(6)
    );
  DISP_X_REG_Mcount_COUNT_xor_5_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(4),
      LI => DISP_X_REG_Mcount_COUNT_cy_5_rt_373,
      O => DISP_X_REG_Result(5)
    );
  DISP_X_REG_Mcount_COUNT_cy_5_Q : MUXCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(4),
      DI => DISP_X_REG_N1,
      S => DISP_X_REG_Mcount_COUNT_cy_5_rt_373,
      O => DISP_X_REG_Mcount_COUNT_cy(5)
    );
  DISP_X_REG_Mcount_COUNT_xor_4_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(3),
      LI => DISP_X_REG_Mcount_COUNT_cy_4_rt_372,
      O => DISP_X_REG_Result(4)
    );
  DISP_X_REG_Mcount_COUNT_cy_4_Q : MUXCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(3),
      DI => DISP_X_REG_N1,
      S => DISP_X_REG_Mcount_COUNT_cy_4_rt_372,
      O => DISP_X_REG_Mcount_COUNT_cy(4)
    );
  DISP_X_REG_Mcount_COUNT_xor_3_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(2),
      LI => DISP_X_REG_Mcount_COUNT_cy_3_rt_371,
      O => DISP_X_REG_Result(3)
    );
  DISP_X_REG_Mcount_COUNT_cy_3_Q : MUXCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(2),
      DI => DISP_X_REG_N1,
      S => DISP_X_REG_Mcount_COUNT_cy_3_rt_371,
      O => DISP_X_REG_Mcount_COUNT_cy(3)
    );
  DISP_X_REG_Mcount_COUNT_xor_2_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(1),
      LI => DISP_X_REG_Mcount_COUNT_cy_2_rt_370,
      O => DISP_X_REG_Result(2)
    );
  DISP_X_REG_Mcount_COUNT_cy_2_Q : MUXCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(1),
      DI => DISP_X_REG_N1,
      S => DISP_X_REG_Mcount_COUNT_cy_2_rt_370,
      O => DISP_X_REG_Mcount_COUNT_cy(2)
    );
  DISP_X_REG_Mcount_COUNT_xor_1_Q : XORCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(0),
      LI => DISP_X_REG_Mcount_COUNT_cy_1_rt_369,
      O => DISP_X_REG_Result(1)
    );
  DISP_X_REG_Mcount_COUNT_cy_1_Q : MUXCY
    port map (
      CI => DISP_X_REG_Mcount_COUNT_cy(0),
      DI => DISP_X_REG_N1,
      S => DISP_X_REG_Mcount_COUNT_cy_1_rt_369,
      O => DISP_X_REG_Mcount_COUNT_cy(1)
    );
  DISP_X_REG_Mcount_COUNT_xor_0_Q : XORCY
    port map (
      CI => DISP_X_REG_N1,
      LI => DISP_X_REG_Mcount_COUNT_lut(0),
      O => DISP_X_REG_Result(0)
    );
  DISP_X_REG_Mcount_COUNT_cy_0_Q : MUXCY
    port map (
      CI => DISP_X_REG_N1,
      DI => DISP_X_REG_N0,
      S => DISP_X_REG_Mcount_COUNT_lut(0),
      O => DISP_X_REG_Mcount_COUNT_cy(0)
    );
  DISP_X_REG_COUNT_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(7),
      Q => DISP_ADDR_X(7)
    );
  DISP_X_REG_COUNT_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(6),
      Q => DISP_ADDR_X(6)
    );
  DISP_X_REG_COUNT_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(5),
      Q => DISP_ADDR_X(5)
    );
  DISP_X_REG_COUNT_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(4),
      Q => DISP_ADDR_X(4)
    );
  DISP_X_REG_COUNT_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(3),
      Q => DISP_ADDR_X(3)
    );
  DISP_X_REG_COUNT_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(2),
      Q => DISP_ADDR_X(2)
    );
  DISP_X_REG_COUNT_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(1),
      Q => DISP_ADDR_X(1)
    );
  DISP_X_REG_COUNT_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => VGA_CLK,
      CE => XLXN_772,
      CLR => XLXN_2206,
      D => DISP_X_REG_Result(0),
      Q => DISP_ADDR_X(0)
    );
  DISP_X_REG_XST_GND : GND
    port map (
      G => DISP_X_REG_N1
    );
  DISP_X_REG_XST_VCC : VCC
    port map (
      P => DISP_X_REG_N0
    );
  XLXI_288_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_423,
      I1 => XLXN_421,
      I2 => XLXN_420,
      I3 => XLXN_418,
      I4 => XLXN_415,
      I5 => XLXI_288_N01,
      O => Y_770
    );
  XLXI_288_O_SW0 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => XLXN_405,
      I1 => XLXN_409,
      I2 => XLXN_406,
      I3 => XLXN_411,
      I4 => XLXN_413,
      O => XLXI_288_N01
    );
  XLXI_290_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_423,
      I1 => XLXN_421,
      I2 => XLXN_420,
      I3 => XLXN_418,
      I4 => XLXN_415,
      I5 => XLXI_290_N01,
      O => Y_797
    );
  XLXI_290_O_SW0 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => XLXN_412,
      I1 => XLXN_410,
      I2 => XLXN_408,
      I3 => XLXN_407,
      I4 => XLXN_404,
      O => XLXI_290_N01
    );
  XLXI_289_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_423,
      I1 => XLXN_421,
      I2 => XLXN_420,
      I3 => XLXN_418,
      I4 => XLXN_415,
      I5 => XLXI_289_N01,
      O => Y_773
    );
  XLXI_289_O_SW0 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => XLXN_413,
      I1 => XLXN_411,
      I2 => XLXN_408,
      I3 => XLXN_407,
      I4 => XLXN_404,
      O => XLXI_289_N01
    );
  XLXI_287_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_423,
      I1 => XLXN_422,
      I2 => XLXN_419,
      I3 => XLXN_416,
      I4 => XLXN_414,
      I5 => XLXI_287_N01,
      O => Y_767
    );
  XLXI_287_O_SW0 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => XLXN_412,
      I1 => XLXN_410,
      I2 => XLXN_408,
      I3 => XLXN_406,
      I4 => XLXN_404,
      O => XLXI_287_N01
    );
  XLXI_251_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_357,
      I1 => XLXN_356,
      I2 => XLXN_354,
      I3 => XLXN_352,
      I4 => XLXN_349,
      I5 => XLXI_251_N01,
      O => H_1578
    );
  XLXI_251_O_SW0 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_348,
      I1 => XLXN_374,
      I2 => XLXN_344,
      I3 => XLXN_359,
      I4 => XLXN_341,
      I5 => XLXN_376,
      O => XLXI_251_N01
    );
  XLXI_248_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_358,
      I1 => XLXN_356,
      I2 => XLXN_354,
      I3 => XLXN_352,
      I4 => XLXN_349,
      I5 => XLXI_248_N01,
      O => H_1066
    );
  XLXI_248_O_SW0 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_348,
      I1 => XLXN_374,
      I2 => XLXN_344,
      I3 => XLXN_359,
      I4 => XLXN_341,
      I5 => XLXN_376,
      O => XLXI_248_N01
    );
  XLXI_247_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_358,
      I1 => XLXN_355,
      I2 => XLXN_354,
      I3 => XLXN_352,
      I4 => XLXN_349,
      I5 => XLXI_247_N01,
      O => H_298
    );
  XLXI_247_O_SW0 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_361,
      I1 => XLXN_341,
      I2 => XLXN_344,
      I3 => XLXN_374,
      I4 => XLXN_376,
      I5 => XLXN_348,
      O => XLXI_247_N01
    );
  XLXI_250_O : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_358,
      I1 => XLXN_355,
      I2 => XLXN_353,
      I3 => XLXN_352,
      I4 => XLXN_350,
      I5 => XLXI_250_N01,
      O => H_1435
    );
  XLXI_250_O_SW0 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => XLXN_339,
      I1 => XLXN_347,
      I2 => XLXN_341,
      I3 => XLXN_344,
      I4 => XLXN_374,
      I5 => XLXN_359,
      O => XLXI_250_N01
    );

end Structure;

-- synthesis translate_on
