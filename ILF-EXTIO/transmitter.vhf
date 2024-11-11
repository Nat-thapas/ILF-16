--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : transmitter.vhf
-- /___/   /\     Timestamp : 11/10/2024 22:51:45
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-EXTIO/transmitter.vhf -w D:/Personal/Projects/ILF-16/ILF-EXTIO/transmitter.sch
--Design Name: transmitter
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FJKCE_HXILINX_transmitter -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FJKCE_HXILINX_transmitter is
  generic(
    INIT : bit := '0'
    );
  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    J   : in STD_LOGIC;
    K   : in STD_LOGIC
    );
end FJKCE_HXILINX_transmitter;

architecture Behavioral of FJKCE_HXILINX_transmitter is
signal q_tmp : std_logic := TO_X01(INIT);

begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(CE= '1') then
      if(J='0') then
        if(K='1') then
        q_tmp <= '0';
      end if;
      else
        if(K='0') then
        q_tmp <= '1';
        else
        q_tmp <= not q_tmp;
        end if;
      end if;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL M2_1_HXILINX_transmitter -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_transmitter is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_transmitter;

architecture M2_1_HXILINX_transmitter_V of M2_1_HXILINX_transmitter is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_transmitter_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity transmitter is
   port ( BGN  : in    std_logic; 
          CE   : in    std_logic; 
          CLK  : in    std_logic; 
          CLR  : in    std_logic; 
          DATA : in    std_logic_vector (7 downto 0); 
          D    : out   std_logic; 
          S    : out   std_logic);
end transmitter;

architecture BEHAVIORAL of transmitter is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal SER      : std_logic;
   signal STP      : std_logic;
   signal TXC      : std_logic;
   signal TXE      : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_29  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_33  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_39  : std_logic;
   signal XLXN_215 : std_logic;
   signal XLXN_228 : std_logic;
   signal XLXN_284 : std_logic;
   signal XLXN_285 : std_logic;
   signal XLXN_287 : std_logic;
   signal XLXN_289 : std_logic;
   signal XLXN_291 : std_logic;
   signal XLXN_292 : std_logic;
   signal XLXN_301 : std_logic;
   signal XLXN_304 : std_logic;
   signal XLXN_313 : std_logic;
   signal XLXN_410 : std_logic;
   component M2_1_HXILINX_transmitter
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component FDCE
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
   component FJKCE_HXILINX_transmitter
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             J   : in    std_logic; 
             K   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_14 : label is "XLXI_14_7";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_1";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_2";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_3";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_4";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_5";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_6";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_0";
begin
   XLXI_14 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(6),
                D1=>DATA(7),
                S0=>TXE,
                O=>XLXN_14);
   
   XLXI_15 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_14,
                Q=>XLXN_11);
   
   XLXI_16 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(5),
                D1=>XLXN_11,
                S0=>TXE,
                O=>XLXN_19);
   
   XLXI_17 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_19,
                Q=>XLXN_17);
   
   XLXI_18 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(4),
                D1=>XLXN_17,
                S0=>TXE,
                O=>XLXN_23);
   
   XLXI_19 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_23,
                Q=>XLXN_21);
   
   XLXI_20 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(3),
                D1=>XLXN_21,
                S0=>TXE,
                O=>XLXN_27);
   
   XLXI_21 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_27,
                Q=>XLXN_25);
   
   XLXI_22 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(2),
                D1=>XLXN_25,
                S0=>TXE,
                O=>XLXN_31);
   
   XLXI_23 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_31,
                Q=>XLXN_29);
   
   XLXI_24 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(1),
                D1=>XLXN_29,
                S0=>TXE,
                O=>XLXN_35);
   
   XLXI_25 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_35,
                Q=>XLXN_33);
   
   XLXI_26 : M2_1_HXILINX_transmitter
      port map (D0=>DATA(0),
                D1=>XLXN_33,
                S0=>TXE,
                O=>XLXN_39);
   
   XLXI_27 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D=>XLXN_39,
                Q=>SER);
   
   XLXI_67 : XOR2
      port map (I0=>TXC,
                I1=>XLXN_313,
                O=>XLXN_410);
   
   XLXI_69 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>SER,
                Q=>XLXN_313);
   
   XLXI_75 : FJKCE_HXILINX_transmitter
      port map (C=>CLK,
                CE=>CE,
                CLR=>XLXN_215,
                J=>BGN,
                K=>STP,
                Q=>TXE);
   
   XLXI_109 : GND
      port map (G=>XLXN_215);
   
   XLXI_114 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>XLXN_228,
                Q=>TXC);
   
   XLXI_115 : INV
      port map (I=>TXC,
                O=>XLXN_228);
   
   XLXI_119 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>XLXN_287,
                Q=>XLXN_304);
   
   XLXI_120 : FDE
      port map (C=>CLK,
                CE=>XLXN_284,
                D=>XLXN_289,
                Q=>XLXN_301);
   
   XLXI_121 : FDE
      port map (C=>CLK,
                CE=>XLXN_285,
                D=>XLXN_291,
                Q=>XLXN_292);
   
   XLXI_122 : AND3
      port map (I0=>TXE,
                I1=>XLXN_301,
                I2=>XLXN_304,
                O=>XLXN_285);
   
   XLXI_123 : AND2
      port map (I0=>TXE,
                I1=>XLXN_304,
                O=>XLXN_284);
   
   XLXI_128 : INV
      port map (I=>XLXN_304,
                O=>XLXN_287);
   
   XLXI_129 : INV
      port map (I=>XLXN_301,
                O=>XLXN_289);
   
   XLXI_130 : INV
      port map (I=>XLXN_292,
                O=>XLXN_291);
   
   XLXI_131 : AND3
      port map (I0=>XLXN_292,
                I1=>XLXN_301,
                I2=>XLXN_304,
                O=>STP);
   
   XLXI_175 : FD
      port map (C=>CLK,
                D=>XLXN_313,
                Q=>D);
   
   XLXI_176 : FD
      port map (C=>CLK,
                D=>XLXN_410,
                Q=>S);
   
end BEHAVIORAL;


