--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mult.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:54
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/mult.vhf -w D:/Personal/Projects/ILF-16/ILF-16/mult.sch
--Design Name: mult
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M2_1_HXILINX_mult -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_mult is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_mult;

architecture M2_1_HXILINX_mult_V of M2_1_HXILINX_mult is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_mult_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mult is
   port ( A      : in    std_logic_vector (15 downto 0); 
          B      : in    std_logic_vector (15 downto 0); 
          Signed : in    std_logic; 
          H      : out   std_logic_vector (15 downto 0); 
          L      : out   std_logic_vector (15 downto 0));
end mult;

architecture BEHAVIORAL of mult is
   attribute AREG        : string ;
   attribute BREG        : string ;
   attribute PREG        : string ;
   attribute B_INPUT     : string ;
   attribute BOX_TYPE    : string ;
   attribute HU_SET      : string ;
   signal AE       : std_logic_vector (17 downto 0);
   signal BCIN     : std_logic_vector (17 downto 0);
   signal BE       : std_logic_vector (17 downto 0);
   signal P        : std_logic_vector (35 downto 0);
   signal XLXN_37  : std_logic;
   signal XLXN_188 : std_logic;
   signal XLXN_189 : std_logic;
   signal XLXN_210 : std_logic;
   signal XLXN_212 : std_logic;
   signal XLXN_253 : std_logic;
   component MULT18X18SIO
      -- synopsys translate_off
      generic( AREG : integer :=  1;
               BREG : integer :=  1;
               PREG : integer :=  1;
               B_INPUT : string :=  "DIRECT");
      -- synopsys translate_on
      port ( A     : in    std_logic_vector (17 downto 0); 
             B     : in    std_logic_vector (17 downto 0); 
             CEA   : in    std_logic; 
             CEB   : in    std_logic; 
             CEP   : in    std_logic; 
             CLK   : in    std_logic; 
             RSTA  : in    std_logic; 
             RSTB  : in    std_logic; 
             RSTP  : in    std_logic; 
             BCIN  : in    std_logic_vector (17 downto 0); 
             P     : out   std_logic_vector (35 downto 0); 
             BCOUT : out   std_logic_vector (17 downto 0));
   end component;
   attribute AREG of MULT18X18SIO : component is "1";
   attribute BREG of MULT18X18SIO : component is "1";
   attribute PREG of MULT18X18SIO : component is "1";
   attribute B_INPUT of MULT18X18SIO : component is "DIRECT";
   attribute BOX_TYPE of MULT18X18SIO : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component M2_1_HXILINX_mult
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_206 : label is "XLXI_206_439";
   attribute HU_SET of XLXI_209 : label is "XLXI_209_440";
   attribute HU_SET of XLXI_273 : label is "XLXI_273_441";
begin
   XLXI_1 : MULT18X18SIO
      port map (A(17 downto 0)=>AE(17 downto 0),
                B(17 downto 0)=>BE(17 downto 0),
                BCIN(17 downto 0)=>BCIN(17 downto 0),
                CEA=>XLXN_37,
                CEB=>XLXN_37,
                CEP=>XLXN_37,
                CLK=>XLXN_37,
                RSTA=>XLXN_37,
                RSTB=>XLXN_37,
                RSTP=>XLXN_37,
                BCOUT=>open,
                P(35 downto 0)=>P(35 downto 0));
   
   XLXI_2 : GND
      port map (G=>BCIN(0));
   
   XLXI_3 : GND
      port map (G=>BCIN(1));
   
   XLXI_4 : GND
      port map (G=>BCIN(2));
   
   XLXI_5 : GND
      port map (G=>BCIN(3));
   
   XLXI_6 : GND
      port map (G=>BCIN(4));
   
   XLXI_7 : GND
      port map (G=>BCIN(5));
   
   XLXI_8 : GND
      port map (G=>BCIN(6));
   
   XLXI_9 : GND
      port map (G=>BCIN(7));
   
   XLXI_10 : GND
      port map (G=>BCIN(8));
   
   XLXI_11 : GND
      port map (G=>BCIN(9));
   
   XLXI_12 : GND
      port map (G=>BCIN(10));
   
   XLXI_13 : GND
      port map (G=>BCIN(11));
   
   XLXI_14 : GND
      port map (G=>BCIN(12));
   
   XLXI_15 : GND
      port map (G=>BCIN(13));
   
   XLXI_16 : GND
      port map (G=>BCIN(14));
   
   XLXI_17 : GND
      port map (G=>BCIN(15));
   
   XLXI_18 : GND
      port map (G=>BCIN(16));
   
   XLXI_19 : GND
      port map (G=>BCIN(17));
   
   XLXI_38 : GND
      port map (G=>XLXN_37);
   
   XLXI_39 : BUF
      port map (I=>A(0),
                O=>AE(0));
   
   XLXI_40 : BUF
      port map (I=>A(1),
                O=>AE(1));
   
   XLXI_41 : BUF
      port map (I=>A(2),
                O=>AE(2));
   
   XLXI_42 : BUF
      port map (I=>A(3),
                O=>AE(3));
   
   XLXI_43 : BUF
      port map (I=>A(4),
                O=>AE(4));
   
   XLXI_44 : BUF
      port map (I=>A(5),
                O=>AE(5));
   
   XLXI_45 : BUF
      port map (I=>A(6),
                O=>AE(6));
   
   XLXI_47 : BUF
      port map (I=>A(7),
                O=>AE(7));
   
   XLXI_48 : BUF
      port map (I=>A(8),
                O=>AE(8));
   
   XLXI_49 : BUF
      port map (I=>A(9),
                O=>AE(9));
   
   XLXI_50 : BUF
      port map (I=>A(10),
                O=>AE(10));
   
   XLXI_51 : BUF
      port map (I=>A(11),
                O=>AE(11));
   
   XLXI_52 : BUF
      port map (I=>A(12),
                O=>AE(12));
   
   XLXI_53 : BUF
      port map (I=>A(13),
                O=>AE(13));
   
   XLXI_54 : BUF
      port map (I=>A(14),
                O=>AE(14));
   
   XLXI_55 : BUF
      port map (I=>A(15),
                O=>AE(15));
   
   XLXI_56 : BUF
      port map (I=>XLXN_188,
                O=>AE(16));
   
   XLXI_57 : BUF
      port map (I=>XLXN_188,
                O=>AE(17));
   
   XLXI_78 : BUF
      port map (I=>B(0),
                O=>BE(0));
   
   XLXI_79 : BUF
      port map (I=>B(1),
                O=>BE(1));
   
   XLXI_80 : BUF
      port map (I=>B(2),
                O=>BE(2));
   
   XLXI_81 : BUF
      port map (I=>B(3),
                O=>BE(3));
   
   XLXI_82 : BUF
      port map (I=>B(4),
                O=>BE(4));
   
   XLXI_83 : BUF
      port map (I=>B(5),
                O=>BE(5));
   
   XLXI_84 : BUF
      port map (I=>B(6),
                O=>BE(6));
   
   XLXI_85 : BUF
      port map (I=>B(7),
                O=>BE(7));
   
   XLXI_86 : BUF
      port map (I=>B(8),
                O=>BE(8));
   
   XLXI_87 : BUF
      port map (I=>B(9),
                O=>BE(9));
   
   XLXI_88 : BUF
      port map (I=>B(10),
                O=>BE(10));
   
   XLXI_89 : BUF
      port map (I=>B(11),
                O=>BE(11));
   
   XLXI_90 : BUF
      port map (I=>B(12),
                O=>BE(12));
   
   XLXI_91 : BUF
      port map (I=>B(13),
                O=>BE(13));
   
   XLXI_92 : BUF
      port map (I=>B(14),
                O=>BE(14));
   
   XLXI_93 : BUF
      port map (I=>B(15),
                O=>BE(15));
   
   XLXI_94 : BUF
      port map (I=>XLXN_210,
                O=>BE(16));
   
   XLXI_95 : BUF
      port map (I=>XLXN_210,
                O=>BE(17));
   
   XLXI_206 : M2_1_HXILINX_mult
      port map (D0=>XLXN_189,
                D1=>A(15),
                S0=>Signed,
                O=>XLXN_188);
   
   XLXI_208 : GND
      port map (G=>XLXN_189);
   
   XLXI_209 : M2_1_HXILINX_mult
      port map (D0=>XLXN_212,
                D1=>B(15),
                S0=>Signed,
                O=>XLXN_210);
   
   XLXI_210 : GND
      port map (G=>XLXN_212);
   
   XLXI_211 : BUF
      port map (I=>P(0),
                O=>L(0));
   
   XLXI_213 : BUF
      port map (I=>P(1),
                O=>L(1));
   
   XLXI_214 : BUF
      port map (I=>P(2),
                O=>L(2));
   
   XLXI_215 : BUF
      port map (I=>P(3),
                O=>L(3));
   
   XLXI_245 : BUF
      port map (I=>P(4),
                O=>L(4));
   
   XLXI_246 : BUF
      port map (I=>P(5),
                O=>L(5));
   
   XLXI_247 : BUF
      port map (I=>P(6),
                O=>L(6));
   
   XLXI_248 : BUF
      port map (I=>P(7),
                O=>L(7));
   
   XLXI_249 : BUF
      port map (I=>P(8),
                O=>L(8));
   
   XLXI_250 : BUF
      port map (I=>P(9),
                O=>L(9));
   
   XLXI_251 : BUF
      port map (I=>P(10),
                O=>L(10));
   
   XLXI_252 : BUF
      port map (I=>P(11),
                O=>L(11));
   
   XLXI_253 : BUF
      port map (I=>P(12),
                O=>L(12));
   
   XLXI_254 : BUF
      port map (I=>P(13),
                O=>L(13));
   
   XLXI_255 : BUF
      port map (I=>P(14),
                O=>L(14));
   
   XLXI_256 : BUF
      port map (I=>P(15),
                O=>L(15));
   
   XLXI_257 : BUF
      port map (I=>P(16),
                O=>H(0));
   
   XLXI_258 : BUF
      port map (I=>P(17),
                O=>H(1));
   
   XLXI_259 : BUF
      port map (I=>P(18),
                O=>H(2));
   
   XLXI_260 : BUF
      port map (I=>P(19),
                O=>H(3));
   
   XLXI_261 : BUF
      port map (I=>P(20),
                O=>H(4));
   
   XLXI_262 : BUF
      port map (I=>P(21),
                O=>H(5));
   
   XLXI_263 : BUF
      port map (I=>P(22),
                O=>H(6));
   
   XLXI_264 : BUF
      port map (I=>P(23),
                O=>H(7));
   
   XLXI_265 : BUF
      port map (I=>P(24),
                O=>H(8));
   
   XLXI_266 : BUF
      port map (I=>P(25),
                O=>H(9));
   
   XLXI_267 : BUF
      port map (I=>P(26),
                O=>H(10));
   
   XLXI_268 : BUF
      port map (I=>P(27),
                O=>H(11));
   
   XLXI_269 : BUF
      port map (I=>P(28),
                O=>H(12));
   
   XLXI_270 : BUF
      port map (I=>P(29),
                O=>H(13));
   
   XLXI_271 : BUF
      port map (I=>P(30),
                O=>H(14));
   
   XLXI_272 : BUF
      port map (I=>XLXN_253,
                O=>H(15));
   
   XLXI_273 : M2_1_HXILINX_mult
      port map (D0=>P(31),
                D1=>P(35),
                S0=>Signed,
                O=>XLXN_253);
   
end BEHAVIORAL;


