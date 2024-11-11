--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : idu.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:13:02
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/idu.vhf -w D:/Personal/Projects/ILF-16/ILF-16/idu.sch
--Design Name: idu
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M4_1E_HXILINX_idu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_idu is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_idu;

architecture M4_1E_HXILINX_idu_V of M4_1E_HXILINX_idu is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_idu_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4x1x16e_MUSER_idu is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16e_MUSER_idu;

architecture BEHAVIORAL of mux4x1x16e_MUSER_idu is
   attribute HU_SET     : string ;
   component M4_1E_HXILINX_idu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_990";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_991";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_992";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_993";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_994";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_995";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_996";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_997";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_998";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_999";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_1000";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_1001";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_1002";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_1003";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_1004";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_1005";
begin
   XLXI_1 : M4_1E_HXILINX_idu
      port map (D0=>D0(0),
                D1=>D1(0),
                D2=>D2(0),
                D3=>D3(0),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(0));
   
   XLXI_2 : M4_1E_HXILINX_idu
      port map (D0=>D0(1),
                D1=>D1(1),
                D2=>D2(1),
                D3=>D3(1),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(1));
   
   XLXI_3 : M4_1E_HXILINX_idu
      port map (D0=>D0(2),
                D1=>D1(2),
                D2=>D2(2),
                D3=>D3(2),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(2));
   
   XLXI_4 : M4_1E_HXILINX_idu
      port map (D0=>D0(3),
                D1=>D1(3),
                D2=>D2(3),
                D3=>D3(3),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(3));
   
   XLXI_5 : M4_1E_HXILINX_idu
      port map (D0=>D0(4),
                D1=>D1(4),
                D2=>D2(4),
                D3=>D3(4),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(4));
   
   XLXI_6 : M4_1E_HXILINX_idu
      port map (D0=>D0(5),
                D1=>D1(5),
                D2=>D2(5),
                D3=>D3(5),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(5));
   
   XLXI_7 : M4_1E_HXILINX_idu
      port map (D0=>D0(6),
                D1=>D1(6),
                D2=>D2(6),
                D3=>D3(6),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(6));
   
   XLXI_8 : M4_1E_HXILINX_idu
      port map (D0=>D0(7),
                D1=>D1(7),
                D2=>D2(7),
                D3=>D3(7),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(7));
   
   XLXI_9 : M4_1E_HXILINX_idu
      port map (D0=>D0(8),
                D1=>D1(8),
                D2=>D2(8),
                D3=>D3(8),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(8));
   
   XLXI_10 : M4_1E_HXILINX_idu
      port map (D0=>D0(9),
                D1=>D1(9),
                D2=>D2(9),
                D3=>D3(9),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(9));
   
   XLXI_11 : M4_1E_HXILINX_idu
      port map (D0=>D0(10),
                D1=>D1(10),
                D2=>D2(10),
                D3=>D3(10),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(10));
   
   XLXI_12 : M4_1E_HXILINX_idu
      port map (D0=>D0(11),
                D1=>D1(11),
                D2=>D2(11),
                D3=>D3(11),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(11));
   
   XLXI_13 : M4_1E_HXILINX_idu
      port map (D0=>D0(12),
                D1=>D1(12),
                D2=>D2(12),
                D3=>D3(12),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(12));
   
   XLXI_14 : M4_1E_HXILINX_idu
      port map (D0=>D0(13),
                D1=>D1(13),
                D2=>D2(13),
                D3=>D3(13),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(13));
   
   XLXI_15 : M4_1E_HXILINX_idu
      port map (D0=>D0(14),
                D1=>D1(14),
                D2=>D2(14),
                D3=>D3(14),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(14));
   
   XLXI_16 : M4_1E_HXILINX_idu
      port map (D0=>D0(15),
                D1=>D1(15),
                D2=>D2(15),
                D3=>D3(15),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity idu is
   port ( INST   : in    std_logic_vector (31 downto 0); 
          A      : out   std_logic_vector (15 downto 0); 
          AFREG  : out   std_logic; 
          A_L4   : out   std_logic_vector (3 downto 0); 
          B      : out   std_logic_vector (15 downto 0); 
          BFREG  : out   std_logic; 
          B_L4   : out   std_logic_vector (3 downto 0); 
          DEST   : out   std_logic_vector (3 downto 0); 
          DEST16 : out   std_logic_vector (15 downto 0); 
          ID     : out   std_logic_vector (7 downto 0));
end idu;

architecture BEHAVIORAL of idu is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   signal ARGC        : std_logic_vector (1 downto 0);
   signal DATA        : std_logic_vector (15 downto 0);
   signal DATA_H4     : std_logic_vector (15 downto 0);
   signal DATA_H8     : std_logic_vector (15 downto 0);
   signal DATA_H12    : std_logic_vector (15 downto 0);
   signal DATA_L4     : std_logic_vector (15 downto 0);
   signal DATA_L8     : std_logic_vector (15 downto 0);
   signal DATA_L12    : std_logic_vector (15 downto 0);
   signal XLXN_3      : std_logic;
   signal XLXN_5      : std_logic;
   signal XLXN_6      : std_logic;
   signal XLXN_833    : std_logic;
   signal XLXN_834    : std_logic;
   signal XLXN_835    : std_logic;
   signal BFREG_DUMMY : std_logic;
   signal A_DUMMY     : std_logic_vector (15 downto 0);
   signal B_DUMMY     : std_logic_vector (15 downto 0);
   signal AFREG_DUMMY : std_logic;
   signal DEST_DUMMY  : std_logic_vector (3 downto 0);
   component mux4x1x16e_MUSER_idu
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             E  : in    std_logic; 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
   component LUT4
      -- synopsys translate_off
      generic( INIT : bit_vector :=  x"0000");
      -- synopsys translate_on
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute INIT of LUT4 : component is "0000";
   attribute BOX_TYPE of LUT4 : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute INIT of XLXI_4 : label is "0600";
   attribute INIT of XLXI_5 : label is "0D00";
   attribute INIT of XLXI_6 : label is "0FF0";
   attribute INIT of XLXI_470 : label is "0600";
   attribute INIT of XLXI_471 : label is "0B00";
   attribute INIT of XLXI_472 : label is "0F00";
begin
   A(15 downto 0) <= A_DUMMY(15 downto 0);
   AFREG <= AFREG_DUMMY;
   B(15 downto 0) <= B_DUMMY(15 downto 0);
   BFREG <= BFREG_DUMMY;
   DEST(3 downto 0) <= DEST_DUMMY(3 downto 0);
   A_Data_Selector : mux4x1x16e_MUSER_idu
      port map (D0(15 downto 0)=>DATA(15 downto 0),
                D1(15 downto 0)=>DATA_H12(15 downto 0),
                D2(15 downto 0)=>DATA_H8(15 downto 0),
                D3(15 downto 0)=>DATA_H4(15 downto 0),
                E=>XLXN_6,
                S0=>XLXN_3,
                S1=>XLXN_5,
                O(15 downto 0)=>A_DUMMY(15 downto 0));
   
   B_Data_Selector : mux4x1x16e_MUSER_idu
      port map (D0(15 downto 0)=>DATA(15 downto 0),
                D1(15 downto 0)=>DATA_L12(15 downto 0),
                D2(15 downto 0)=>DATA_L8(15 downto 0),
                D3(15 downto 0)=>DATA_L4(15 downto 0),
                E=>XLXN_835,
                S0=>XLXN_833,
                S1=>XLXN_834,
                O(15 downto 0)=>B_DUMMY(15 downto 0));
   
   XLXI_4 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0600")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_3);
   
   XLXI_5 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0D00")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_5);
   
   XLXI_6 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0FF0")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_6);
   
   XLXI_19 : BUF
      port map (I=>INST(0),
                O=>DATA(0));
   
   XLXI_24 : BUF
      port map (I=>INST(1),
                O=>DATA(1));
   
   XLXI_25 : BUF
      port map (I=>INST(2),
                O=>DATA(2));
   
   XLXI_26 : BUF
      port map (I=>INST(3),
                O=>DATA(3));
   
   XLXI_27 : BUF
      port map (I=>INST(4),
                O=>DATA(4));
   
   XLXI_28 : BUF
      port map (I=>INST(5),
                O=>DATA(5));
   
   XLXI_29 : BUF
      port map (I=>INST(6),
                O=>DATA(6));
   
   XLXI_30 : BUF
      port map (I=>INST(7),
                O=>DATA(7));
   
   XLXI_31 : BUF
      port map (I=>INST(8),
                O=>DATA(8));
   
   XLXI_32 : BUF
      port map (I=>INST(9),
                O=>DATA(9));
   
   XLXI_33 : BUF
      port map (I=>INST(10),
                O=>DATA(10));
   
   XLXI_34 : BUF
      port map (I=>INST(11),
                O=>DATA(11));
   
   XLXI_35 : BUF
      port map (I=>INST(12),
                O=>DATA(12));
   
   XLXI_36 : BUF
      port map (I=>INST(13),
                O=>DATA(13));
   
   XLXI_37 : BUF
      port map (I=>INST(14),
                O=>DATA(14));
   
   XLXI_38 : BUF
      port map (I=>INST(15),
                O=>DATA(15));
   
   XLXI_39 : BUF
      port map (I=>INST(16),
                O=>DEST_DUMMY(0));
   
   XLXI_40 : BUF
      port map (I=>INST(17),
                O=>DEST_DUMMY(1));
   
   XLXI_41 : BUF
      port map (I=>INST(18),
                O=>DEST_DUMMY(2));
   
   XLXI_42 : BUF
      port map (I=>INST(19),
                O=>DEST_DUMMY(3));
   
   XLXI_43 : BUF
      port map (I=>INST(20),
                O=>BFREG_DUMMY);
   
   XLXI_44 : BUF
      port map (I=>INST(21),
                O=>AFREG_DUMMY);
   
   XLXI_45 : BUF
      port map (I=>INST(22),
                O=>ARGC(0));
   
   XLXI_46 : BUF
      port map (I=>INST(23),
                O=>ARGC(1));
   
   XLXI_47 : BUF
      port map (I=>INST(24),
                O=>ID(0));
   
   XLXI_48 : BUF
      port map (I=>INST(25),
                O=>ID(1));
   
   XLXI_49 : BUF
      port map (I=>INST(26),
                O=>ID(2));
   
   XLXI_50 : BUF
      port map (I=>INST(27),
                O=>ID(3));
   
   XLXI_51 : BUF
      port map (I=>INST(28),
                O=>ID(4));
   
   XLXI_52 : BUF
      port map (I=>INST(29),
                O=>ID(5));
   
   XLXI_53 : BUF
      port map (I=>INST(30),
                O=>ID(6));
   
   XLXI_54 : BUF
      port map (I=>INST(31),
                O=>ID(7));
   
   XLXI_59 : BUF
      port map (I=>DATA(15),
                O=>DATA_H12(11));
   
   XLXI_60 : BUF
      port map (I=>DATA(14),
                O=>DATA_H12(10));
   
   XLXI_61 : BUF
      port map (I=>DATA(13),
                O=>DATA_H12(9));
   
   XLXI_62 : BUF
      port map (I=>DATA(12),
                O=>DATA_H12(8));
   
   XLXI_63 : BUF
      port map (I=>DATA(11),
                O=>DATA_H12(7));
   
   XLXI_64 : BUF
      port map (I=>DATA(10),
                O=>DATA_H12(6));
   
   XLXI_65 : BUF
      port map (I=>DATA(9),
                O=>DATA_H12(5));
   
   XLXI_66 : BUF
      port map (I=>DATA(8),
                O=>DATA_H12(4));
   
   XLXI_67 : BUF
      port map (I=>DATA(7),
                O=>DATA_H12(3));
   
   XLXI_68 : BUF
      port map (I=>DATA(6),
                O=>DATA_H12(2));
   
   XLXI_69 : BUF
      port map (I=>DATA(5),
                O=>DATA_H12(1));
   
   XLXI_70 : BUF
      port map (I=>DATA(4),
                O=>DATA_H12(0));
   
   XLXI_75 : BUF
      port map (I=>DATA(11),
                O=>DATA_L12(11));
   
   XLXI_76 : BUF
      port map (I=>DATA(10),
                O=>DATA_L12(10));
   
   XLXI_77 : BUF
      port map (I=>DATA(9),
                O=>DATA_L12(9));
   
   XLXI_78 : BUF
      port map (I=>DATA(8),
                O=>DATA_L12(8));
   
   XLXI_79 : BUF
      port map (I=>DATA(7),
                O=>DATA_L12(7));
   
   XLXI_80 : BUF
      port map (I=>DATA(6),
                O=>DATA_L12(6));
   
   XLXI_81 : BUF
      port map (I=>DATA(5),
                O=>DATA_L12(5));
   
   XLXI_82 : BUF
      port map (I=>DATA(4),
                O=>DATA_L12(4));
   
   XLXI_83 : BUF
      port map (I=>DATA(3),
                O=>DATA_L12(3));
   
   XLXI_84 : BUF
      port map (I=>DATA(2),
                O=>DATA_L12(2));
   
   XLXI_85 : BUF
      port map (I=>DATA(1),
                O=>DATA_L12(1));
   
   XLXI_86 : BUF
      port map (I=>DATA(0),
                O=>DATA_L12(0));
   
   XLXI_135 : GND
      port map (G=>DATA_H12(15));
   
   XLXI_136 : GND
      port map (G=>DATA_H12(14));
   
   XLXI_137 : GND
      port map (G=>DATA_H12(13));
   
   XLXI_138 : GND
      port map (G=>DATA_H12(12));
   
   XLXI_167 : GND
      port map (G=>DATA_L12(15));
   
   XLXI_168 : GND
      port map (G=>DATA_L12(14));
   
   XLXI_169 : GND
      port map (G=>DATA_L12(13));
   
   XLXI_170 : GND
      port map (G=>DATA_L12(12));
   
   XLXI_239 : BUF
      port map (I=>DATA(8),
                O=>DATA_H8(0));
   
   XLXI_240 : BUF
      port map (I=>DATA(9),
                O=>DATA_H8(1));
   
   XLXI_241 : BUF
      port map (I=>DATA(10),
                O=>DATA_H8(2));
   
   XLXI_242 : BUF
      port map (I=>DATA(11),
                O=>DATA_H8(3));
   
   XLXI_243 : BUF
      port map (I=>DATA(12),
                O=>DATA_H8(4));
   
   XLXI_244 : BUF
      port map (I=>DATA(13),
                O=>DATA_H8(5));
   
   XLXI_245 : BUF
      port map (I=>DATA(14),
                O=>DATA_H8(6));
   
   XLXI_246 : BUF
      port map (I=>DATA(15),
                O=>DATA_H8(7));
   
   XLXI_247 : GND
      port map (G=>DATA_H8(8));
   
   XLXI_248 : GND
      port map (G=>DATA_H8(9));
   
   XLXI_249 : GND
      port map (G=>DATA_H8(10));
   
   XLXI_250 : GND
      port map (G=>DATA_H8(11));
   
   XLXI_252 : GND
      port map (G=>DATA_H8(12));
   
   XLXI_253 : GND
      port map (G=>DATA_H8(13));
   
   XLXI_255 : GND
      port map (G=>DATA_H8(14));
   
   XLXI_256 : GND
      port map (G=>DATA_H8(15));
   
   XLXI_257 : BUF
      port map (I=>DATA(0),
                O=>DATA_L8(0));
   
   XLXI_258 : BUF
      port map (I=>DATA(1),
                O=>DATA_L8(1));
   
   XLXI_259 : BUF
      port map (I=>DATA(2),
                O=>DATA_L8(2));
   
   XLXI_260 : BUF
      port map (I=>DATA(3),
                O=>DATA_L8(3));
   
   XLXI_261 : BUF
      port map (I=>DATA(4),
                O=>DATA_L8(4));
   
   XLXI_262 : BUF
      port map (I=>DATA(5),
                O=>DATA_L8(5));
   
   XLXI_263 : BUF
      port map (I=>DATA(6),
                O=>DATA_L8(6));
   
   XLXI_264 : BUF
      port map (I=>DATA(7),
                O=>DATA_L8(7));
   
   XLXI_265 : GND
      port map (G=>DATA_L8(8));
   
   XLXI_266 : GND
      port map (G=>DATA_L8(9));
   
   XLXI_267 : GND
      port map (G=>DATA_L8(10));
   
   XLXI_268 : GND
      port map (G=>DATA_L8(11));
   
   XLXI_269 : GND
      port map (G=>DATA_L8(12));
   
   XLXI_270 : GND
      port map (G=>DATA_L8(13));
   
   XLXI_271 : GND
      port map (G=>DATA_L8(14));
   
   XLXI_272 : GND
      port map (G=>DATA_L8(15));
   
   XLXI_277 : BUF
      port map (I=>DATA(12),
                O=>DATA_H4(0));
   
   XLXI_278 : BUF
      port map (I=>DATA(13),
                O=>DATA_H4(1));
   
   XLXI_279 : BUF
      port map (I=>DATA(14),
                O=>DATA_H4(2));
   
   XLXI_280 : BUF
      port map (I=>DATA(15),
                O=>DATA_H4(3));
   
   XLXI_281 : GND
      port map (G=>DATA_H4(4));
   
   XLXI_282 : GND
      port map (G=>DATA_H4(5));
   
   XLXI_283 : GND
      port map (G=>DATA_H4(6));
   
   XLXI_284 : GND
      port map (G=>DATA_H4(7));
   
   XLXI_289 : GND
      port map (G=>DATA_H4(8));
   
   XLXI_290 : GND
      port map (G=>DATA_H4(9));
   
   XLXI_291 : GND
      port map (G=>DATA_H4(10));
   
   XLXI_292 : GND
      port map (G=>DATA_H4(11));
   
   XLXI_293 : GND
      port map (G=>DATA_H4(12));
   
   XLXI_294 : GND
      port map (G=>DATA_H4(13));
   
   XLXI_295 : GND
      port map (G=>DATA_H4(14));
   
   XLXI_296 : GND
      port map (G=>DATA_H4(15));
   
   XLXI_297 : GND
      port map (G=>DATA_L4(4));
   
   XLXI_298 : GND
      port map (G=>DATA_L4(5));
   
   XLXI_299 : GND
      port map (G=>DATA_L4(6));
   
   XLXI_300 : GND
      port map (G=>DATA_L4(7));
   
   XLXI_301 : GND
      port map (G=>DATA_L4(8));
   
   XLXI_302 : GND
      port map (G=>DATA_L4(9));
   
   XLXI_303 : GND
      port map (G=>DATA_L4(10));
   
   XLXI_304 : GND
      port map (G=>DATA_L4(11));
   
   XLXI_305 : GND
      port map (G=>DATA_L4(12));
   
   XLXI_306 : GND
      port map (G=>DATA_L4(13));
   
   XLXI_307 : GND
      port map (G=>DATA_L4(14));
   
   XLXI_308 : GND
      port map (G=>DATA_L4(15));
   
   XLXI_309 : BUF
      port map (I=>DATA(2),
                O=>DATA_L4(2));
   
   XLXI_310 : BUF
      port map (I=>DATA(0),
                O=>DATA_L4(0));
   
   XLXI_311 : BUF
      port map (I=>DATA(1),
                O=>DATA_L4(1));
   
   XLXI_312 : BUF
      port map (I=>DATA(3),
                O=>DATA_L4(3));
   
   XLXI_470 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0600")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_833);
   
   XLXI_471 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0B00")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_834);
   
   XLXI_472 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0F00")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_835);
   
   XLXI_473 : BUF
      port map (I=>A_DUMMY(0),
                O=>A_L4(0));
   
   XLXI_474 : BUF
      port map (I=>A_DUMMY(1),
                O=>A_L4(1));
   
   XLXI_475 : BUF
      port map (I=>A_DUMMY(2),
                O=>A_L4(2));
   
   XLXI_476 : BUF
      port map (I=>A_DUMMY(3),
                O=>A_L4(3));
   
   XLXI_490 : BUF
      port map (I=>B_DUMMY(0),
                O=>B_L4(0));
   
   XLXI_491 : BUF
      port map (I=>B_DUMMY(1),
                O=>B_L4(1));
   
   XLXI_492 : BUF
      port map (I=>B_DUMMY(2),
                O=>B_L4(2));
   
   XLXI_493 : BUF
      port map (I=>B_DUMMY(3),
                O=>B_L4(3));
   
   XLXI_494 : BUF
      port map (I=>DEST_DUMMY(0),
                O=>DEST16(0));
   
   XLXI_495 : BUF
      port map (I=>DEST_DUMMY(1),
                O=>DEST16(1));
   
   XLXI_496 : BUF
      port map (I=>DEST_DUMMY(2),
                O=>DEST16(2));
   
   XLXI_497 : BUF
      port map (I=>DEST_DUMMY(3),
                O=>DEST16(3));
   
   XLXI_498 : GND
      port map (G=>DEST16(4));
   
   XLXI_499 : GND
      port map (G=>DEST16(5));
   
   XLXI_500 : GND
      port map (G=>DEST16(6));
   
   XLXI_501 : GND
      port map (G=>DEST16(7));
   
   XLXI_502 : GND
      port map (G=>DEST16(8));
   
   XLXI_503 : GND
      port map (G=>DEST16(9));
   
   XLXI_504 : GND
      port map (G=>DEST16(10));
   
   XLXI_505 : GND
      port map (G=>DEST16(11));
   
   XLXI_506 : GND
      port map (G=>DEST16(12));
   
   XLXI_507 : GND
      port map (G=>DEST16(13));
   
   XLXI_508 : GND
      port map (G=>DEST16(14));
   
   XLXI_509 : GND
      port map (G=>DEST16(15));
   
end BEHAVIORAL;


