--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mux2x1x16e.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:52
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/mux2x1x16e.vhf -w D:/Personal/Projects/ILF-16/ILF-16/mux2x1x16e.sch
--Design Name: mux2x1x16e
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M2_1E_HXILINX_mux2x1x16e -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_mux2x1x16e is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_mux2x1x16e;

architecture M2_1E_HXILINX_mux2x1x16e_V of M2_1E_HXILINX_mux2x1x16e is
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
end M2_1E_HXILINX_mux2x1x16e_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux2x1x16e is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          E  : in    std_logic; 
          S  : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux2x1x16e;

architecture BEHAVIORAL of mux2x1x16e is
   attribute HU_SET     : string ;
   component M2_1E_HXILINX_mux2x1x16e
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_391";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_392";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_393";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_394";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_395";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_396";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_397";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_398";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_399";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_400";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_401";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_402";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_403";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_404";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_405";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_406";
begin
   XLXI_1 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(0),
                D1=>D1(0),
                E=>E,
                S0=>S,
                O=>O(0));
   
   XLXI_2 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(1),
                D1=>D1(1),
                E=>E,
                S0=>S,
                O=>O(1));
   
   XLXI_3 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(2),
                D1=>D1(2),
                E=>E,
                S0=>S,
                O=>O(2));
   
   XLXI_4 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(3),
                D1=>D1(3),
                E=>E,
                S0=>S,
                O=>O(3));
   
   XLXI_5 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(4),
                D1=>D1(4),
                E=>E,
                S0=>S,
                O=>O(4));
   
   XLXI_6 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(5),
                D1=>D1(5),
                E=>E,
                S0=>S,
                O=>O(5));
   
   XLXI_7 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(6),
                D1=>D1(6),
                E=>E,
                S0=>S,
                O=>O(6));
   
   XLXI_8 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(7),
                D1=>D1(7),
                E=>E,
                S0=>S,
                O=>O(7));
   
   XLXI_9 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(8),
                D1=>D1(8),
                E=>E,
                S0=>S,
                O=>O(8));
   
   XLXI_10 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(9),
                D1=>D1(9),
                E=>E,
                S0=>S,
                O=>O(9));
   
   XLXI_11 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(10),
                D1=>D1(10),
                E=>E,
                S0=>S,
                O=>O(10));
   
   XLXI_12 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(11),
                D1=>D1(11),
                E=>E,
                S0=>S,
                O=>O(11));
   
   XLXI_13 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(12),
                D1=>D1(12),
                E=>E,
                S0=>S,
                O=>O(12));
   
   XLXI_14 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(13),
                D1=>D1(13),
                E=>E,
                S0=>S,
                O=>O(13));
   
   XLXI_15 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(14),
                D1=>D1(14),
                E=>E,
                S0=>S,
                O=>O(14));
   
   XLXI_16 : M2_1E_HXILINX_mux2x1x16e
      port map (D0=>D0(15),
                D1=>D1(15),
                E=>E,
                S0=>S,
                O=>O(15));
   
end BEHAVIORAL;


