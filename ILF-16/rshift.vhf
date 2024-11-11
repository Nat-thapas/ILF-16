--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : rshift.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/rshift.vhf -w D:/Personal/Projects/ILF-16/ILF-16/rshift.sch
--Design Name: rshift
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL NOR12_HXILINX_rshift -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOR12_HXILINX_rshift is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic;
    I8  : in std_logic;
    I9  : in std_logic;
    I10 : in std_logic;
    I11 : in std_logic
  );
end NOR12_HXILINX_rshift;

architecture NOR12_HXILINX_rshift_V of NOR12_HXILINX_rshift is
begin
  O <= not (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11);
end NOR12_HXILINX_rshift_V;
----- CELL M2_1E_HXILINX_rshift -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_rshift is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_rshift;

architecture M2_1E_HXILINX_rshift_V of M2_1E_HXILINX_rshift is
begin
  process (D0, D1, E, S0)
  begin
    if( E = '0') then
    O <= '0';
    else
      case S0 is
      when '0' => O <= D0;
      when '1' => O <= D1;
      when others => NULL;
      end case;
    end if;
    end process; 
end M2_1E_HXILINX_rshift_V;
----- CELL M2_1_HXILINX_rshift -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_rshift is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_rshift;

architecture M2_1_HXILINX_rshift_V of M2_1_HXILINX_rshift is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_rshift_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity rshift is
   port ( I : in    std_logic_vector (15 downto 0); 
          S : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end rshift;

architecture BEHAVIORAL of rshift is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_39  : std_logic;
   signal XLXN_56  : std_logic;
   signal XLXN_57  : std_logic;
   signal XLXN_73  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_75  : std_logic;
   signal XLXN_76  : std_logic;
   signal XLXN_77  : std_logic;
   signal XLXN_78  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_81  : std_logic;
   signal XLXN_82  : std_logic;
   signal XLXN_83  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_85  : std_logic;
   signal XLXN_86  : std_logic;
   signal XLXN_87  : std_logic;
   signal XLXN_88  : std_logic;
   signal XLXN_89  : std_logic;
   signal XLXN_90  : std_logic;
   signal XLXN_91  : std_logic;
   signal XLXN_116 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_118 : std_logic;
   signal XLXN_120 : std_logic;
   signal XLXN_121 : std_logic;
   signal XLXN_122 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_125 : std_logic;
   signal XLXN_126 : std_logic;
   signal XLXN_127 : std_logic;
   signal XLXN_128 : std_logic;
   signal XLXN_129 : std_logic;
   signal XLXN_130 : std_logic;
   signal XLXN_131 : std_logic;
   signal XLXN_132 : std_logic;
   signal XLXN_133 : std_logic;
   signal XLXN_134 : std_logic;
   signal XLXN_135 : std_logic;
   signal XLXN_144 : std_logic;
   signal XLXN_145 : std_logic;
   signal XLXN_147 : std_logic;
   signal XLXN_148 : std_logic;
   signal XLXN_149 : std_logic;
   signal XLXN_150 : std_logic;
   signal XLXN_151 : std_logic;
   signal XLXN_153 : std_logic;
   signal XLXN_154 : std_logic;
   signal XLXN_158 : std_logic;
   signal XLXN_201 : std_logic;
   signal XLXN_226 : std_logic;
   signal XLXN_246 : std_logic;
   component M2_1_HXILINX_rshift
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component M2_1E_HXILINX_rshift
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component NOR12_HXILINX_rshift
      port ( I0  : in    std_logic; 
             I1  : in    std_logic; 
             I10 : in    std_logic; 
             I11 : in    std_logic; 
             I2  : in    std_logic; 
             I3  : in    std_logic; 
             I4  : in    std_logic; 
             I5  : in    std_logic; 
             I6  : in    std_logic; 
             I7  : in    std_logic; 
             I8  : in    std_logic; 
             I9  : in    std_logic; 
             O   : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_459";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_460";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_461";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_462";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_463";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_464";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_465";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_466";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_467";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_468";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_469";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_470";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_471";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_472";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_473";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_474";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_475";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_476";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_477";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_478";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_479";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_480";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_481";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_482";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_483";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_484";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_485";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_486";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_487";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_488";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_489";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_490";
   attribute HU_SET of XLXI_65 : label is "XLXI_65_491";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_492";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_493";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_494";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_495";
   attribute HU_SET of XLXI_70 : label is "XLXI_70_496";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_497";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_498";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_499";
   attribute HU_SET of XLXI_74 : label is "XLXI_74_500";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_501";
   attribute HU_SET of XLXI_76 : label is "XLXI_76_502";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_503";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_504";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_505";
   attribute HU_SET of XLXI_80 : label is "XLXI_80_506";
   attribute HU_SET of XLXI_230 : label is "XLXI_230_507";
   attribute HU_SET of XLXI_232 : label is "XLXI_232_508";
   attribute HU_SET of XLXI_233 : label is "XLXI_233_509";
   attribute HU_SET of XLXI_234 : label is "XLXI_234_510";
   attribute HU_SET of XLXI_235 : label is "XLXI_235_511";
   attribute HU_SET of XLXI_236 : label is "XLXI_236_512";
   attribute HU_SET of XLXI_237 : label is "XLXI_237_513";
   attribute HU_SET of XLXI_238 : label is "XLXI_238_514";
   attribute HU_SET of XLXI_239 : label is "XLXI_239_515";
   attribute HU_SET of XLXI_240 : label is "XLXI_240_516";
   attribute HU_SET of XLXI_241 : label is "XLXI_241_517";
   attribute HU_SET of XLXI_242 : label is "XLXI_242_518";
   attribute HU_SET of XLXI_243 : label is "XLXI_243_519";
   attribute HU_SET of XLXI_244 : label is "XLXI_244_520";
   attribute HU_SET of XLXI_245 : label is "XLXI_245_521";
   attribute HU_SET of XLXI_246 : label is "XLXI_246_522";
   attribute HU_SET of XLXI_247 : label is "XLXI_247_523";
begin
   XLXI_1 : M2_1_HXILINX_rshift
      port map (D0=>I(0),
                D1=>I(1),
                S0=>S(0),
                O=>XLXN_56);
   
   XLXI_2 : M2_1_HXILINX_rshift
      port map (D0=>I(1),
                D1=>I(2),
                S0=>S(0),
                O=>XLXN_57);
   
   XLXI_3 : M2_1_HXILINX_rshift
      port map (D0=>I(2),
                D1=>I(3),
                S0=>S(0),
                O=>XLXN_87);
   
   XLXI_4 : M2_1_HXILINX_rshift
      port map (D0=>I(3),
                D1=>I(4),
                S0=>S(0),
                O=>XLXN_86);
   
   XLXI_5 : M2_1_HXILINX_rshift
      port map (D0=>I(4),
                D1=>I(5),
                S0=>S(0),
                O=>XLXN_85);
   
   XLXI_6 : M2_1_HXILINX_rshift
      port map (D0=>I(5),
                D1=>I(6),
                S0=>S(0),
                O=>XLXN_84);
   
   XLXI_7 : M2_1_HXILINX_rshift
      port map (D0=>I(6),
                D1=>I(7),
                S0=>S(0),
                O=>XLXN_83);
   
   XLXI_8 : M2_1_HXILINX_rshift
      port map (D0=>I(7),
                D1=>I(8),
                S0=>S(0),
                O=>XLXN_82);
   
   XLXI_9 : M2_1_HXILINX_rshift
      port map (D0=>I(8),
                D1=>I(9),
                S0=>S(0),
                O=>XLXN_81);
   
   XLXI_10 : M2_1_HXILINX_rshift
      port map (D0=>I(9),
                D1=>I(10),
                S0=>S(0),
                O=>XLXN_80);
   
   XLXI_11 : M2_1_HXILINX_rshift
      port map (D0=>I(10),
                D1=>I(11),
                S0=>S(0),
                O=>XLXN_78);
   
   XLXI_12 : M2_1_HXILINX_rshift
      port map (D0=>I(10),
                D1=>I(12),
                S0=>S(0),
                O=>XLXN_77);
   
   XLXI_13 : M2_1_HXILINX_rshift
      port map (D0=>I(12),
                D1=>I(13),
                S0=>S(0),
                O=>XLXN_76);
   
   XLXI_14 : M2_1_HXILINX_rshift
      port map (D0=>I(13),
                D1=>I(14),
                S0=>S(0),
                O=>XLXN_75);
   
   XLXI_15 : M2_1_HXILINX_rshift
      port map (D0=>I(14),
                D1=>I(15),
                S0=>S(0),
                O=>XLXN_74);
   
   XLXI_16 : M2_1_HXILINX_rshift
      port map (D0=>I(15),
                D1=>XLXN_39,
                S0=>S(0),
                O=>XLXN_73);
   
   XLXI_17 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_56,
                D1=>XLXN_87,
                S0=>S(1),
                O=>XLXN_88);
   
   XLXI_18 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_57,
                D1=>XLXN_86,
                S0=>S(1),
                O=>XLXN_89);
   
   XLXI_19 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_87,
                D1=>XLXN_85,
                S0=>S(1),
                O=>XLXN_90);
   
   XLXI_20 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_86,
                D1=>XLXN_84,
                S0=>S(1),
                O=>XLXN_91);
   
   XLXI_21 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_85,
                D1=>XLXN_83,
                S0=>S(1),
                O=>XLXN_135);
   
   XLXI_22 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_84,
                D1=>XLXN_82,
                S0=>S(1),
                O=>XLXN_134);
   
   XLXI_23 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_83,
                D1=>XLXN_81,
                S0=>S(1),
                O=>XLXN_133);
   
   XLXI_24 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_82,
                D1=>XLXN_80,
                S0=>S(1),
                O=>XLXN_132);
   
   XLXI_25 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_81,
                D1=>XLXN_78,
                S0=>S(1),
                O=>XLXN_131);
   
   XLXI_26 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_80,
                D1=>XLXN_77,
                S0=>S(1),
                O=>XLXN_130);
   
   XLXI_27 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_78,
                D1=>XLXN_76,
                S0=>S(1),
                O=>XLXN_129);
   
   XLXI_28 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_77,
                D1=>XLXN_75,
                S0=>S(1),
                O=>XLXN_128);
   
   XLXI_29 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_76,
                D1=>XLXN_74,
                S0=>S(1),
                O=>XLXN_127);
   
   XLXI_30 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_75,
                D1=>XLXN_73,
                S0=>S(1),
                O=>XLXN_126);
   
   XLXI_31 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_74,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_125);
   
   XLXI_32 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_73,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_124);
   
   XLXI_65 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_88,
                D1=>XLXN_135,
                S0=>S(2),
                O=>XLXN_123);
   
   XLXI_66 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_89,
                D1=>XLXN_134,
                S0=>S(2),
                O=>XLXN_122);
   
   XLXI_67 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_90,
                D1=>XLXN_133,
                S0=>S(2),
                O=>XLXN_121);
   
   XLXI_68 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_91,
                D1=>XLXN_132,
                S0=>S(2),
                O=>XLXN_120);
   
   XLXI_69 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_135,
                D1=>XLXN_131,
                S0=>S(2),
                O=>XLXN_118);
   
   XLXI_70 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_134,
                D1=>XLXN_130,
                S0=>S(2),
                O=>XLXN_117);
   
   XLXI_71 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_133,
                D1=>XLXN_129,
                S0=>S(2),
                O=>XLXN_116);
   
   XLXI_72 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_132,
                D1=>XLXN_128,
                S0=>S(2),
                O=>XLXN_144);
   
   XLXI_73 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_131,
                D1=>XLXN_127,
                S0=>S(2),
                O=>XLXN_154);
   
   XLXI_74 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_130,
                D1=>XLXN_126,
                S0=>S(2),
                O=>XLXN_153);
   
   XLXI_75 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_129,
                D1=>XLXN_125,
                S0=>S(2),
                O=>XLXN_151);
   
   XLXI_76 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_128,
                D1=>XLXN_124,
                S0=>S(2),
                O=>XLXN_150);
   
   XLXI_77 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_127,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_149);
   
   XLXI_78 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_126,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_148);
   
   XLXI_79 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_125,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_147);
   
   XLXI_80 : M2_1_HXILINX_rshift
      port map (D0=>XLXN_124,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_145);
   
   XLXI_225 : GND
      port map (G=>XLXN_39);
   
   XLXI_226 : GND
      port map (G=>XLXN_158);
   
   XLXI_227 : GND
      port map (G=>XLXN_201);
   
   XLXI_228 : GND
      port map (G=>XLXN_226);
   
   XLXI_230 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_123,
                D1=>XLXN_154,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(0));
   
   XLXI_232 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_121,
                D1=>XLXN_151,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(2));
   
   XLXI_233 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_120,
                D1=>XLXN_150,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(3));
   
   XLXI_234 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_118,
                D1=>XLXN_149,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(4));
   
   XLXI_235 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_117,
                D1=>XLXN_148,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(5));
   
   XLXI_236 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_116,
                D1=>XLXN_147,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(6));
   
   XLXI_237 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_144,
                D1=>XLXN_145,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(7));
   
   XLXI_238 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_154,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(8));
   
   XLXI_239 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_153,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(9));
   
   XLXI_240 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_151,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(10));
   
   XLXI_241 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_150,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(11));
   
   XLXI_242 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_149,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(12));
   
   XLXI_243 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_148,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(13));
   
   XLXI_244 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_147,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(14));
   
   XLXI_245 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_145,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(15));
   
   XLXI_246 : M2_1E_HXILINX_rshift
      port map (D0=>XLXN_122,
                D1=>XLXN_153,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(1));
   
   XLXI_247 : NOR12_HXILINX_rshift
      port map (I0=>S(15),
                I1=>S(14),
                I2=>S(13),
                I3=>S(12),
                I4=>S(11),
                I5=>S(10),
                I6=>S(9),
                I7=>S(8),
                I8=>S(7),
                I9=>S(6),
                I10=>S(5),
                I11=>S(4),
                O=>XLXN_246);
   
end BEHAVIORAL;


