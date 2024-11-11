--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mux4x1x16e.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:53
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/mux4x1x16e.vhf -w D:/Personal/Projects/ILF-16/ILF-16/mux4x1x16e.sch
--Design Name: mux4x1x16e
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M4_1E_HXILINX_mux4x1x16e -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_mux4x1x16e is
  
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
end M4_1E_HXILINX_mux4x1x16e;

architecture M4_1E_HXILINX_mux4x1x16e_V of M4_1E_HXILINX_mux4x1x16e is
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
end M4_1E_HXILINX_mux4x1x16e_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4x1x16e is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16e;

architecture BEHAVIORAL of mux4x1x16e is
   attribute HU_SET     : string ;
   component M4_1E_HXILINX_mux4x1x16e
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_407";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_408";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_409";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_410";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_411";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_412";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_413";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_414";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_415";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_416";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_417";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_418";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_419";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_420";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_421";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_422";
begin
   XLXI_1 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(0),
                D1=>D1(0),
                D2=>D2(0),
                D3=>D3(0),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(0));
   
   XLXI_2 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(1),
                D1=>D1(1),
                D2=>D2(1),
                D3=>D3(1),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(1));
   
   XLXI_3 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(2),
                D1=>D1(2),
                D2=>D2(2),
                D3=>D3(2),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(2));
   
   XLXI_4 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(3),
                D1=>D1(3),
                D2=>D2(3),
                D3=>D3(3),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(3));
   
   XLXI_5 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(4),
                D1=>D1(4),
                D2=>D2(4),
                D3=>D3(4),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(4));
   
   XLXI_6 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(5),
                D1=>D1(5),
                D2=>D2(5),
                D3=>D3(5),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(5));
   
   XLXI_7 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(6),
                D1=>D1(6),
                D2=>D2(6),
                D3=>D3(6),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(6));
   
   XLXI_8 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(7),
                D1=>D1(7),
                D2=>D2(7),
                D3=>D3(7),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(7));
   
   XLXI_9 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(8),
                D1=>D1(8),
                D2=>D2(8),
                D3=>D3(8),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(8));
   
   XLXI_10 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(9),
                D1=>D1(9),
                D2=>D2(9),
                D3=>D3(9),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(9));
   
   XLXI_11 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(10),
                D1=>D1(10),
                D2=>D2(10),
                D3=>D3(10),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(10));
   
   XLXI_12 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(11),
                D1=>D1(11),
                D2=>D2(11),
                D3=>D3(11),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(11));
   
   XLXI_13 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(12),
                D1=>D1(12),
                D2=>D2(12),
                D3=>D3(12),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(12));
   
   XLXI_14 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(13),
                D1=>D1(13),
                D2=>D2(13),
                D3=>D3(13),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(13));
   
   XLXI_15 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(14),
                D1=>D1(14),
                D2=>D2(14),
                D3=>D3(14),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(14));
   
   XLXI_16 : M4_1E_HXILINX_mux4x1x16e
      port map (D0=>D0(15),
                D1=>D1(15),
                D2=>D2(15),
                D3=>D3(15),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(15));
   
end BEHAVIORAL;


