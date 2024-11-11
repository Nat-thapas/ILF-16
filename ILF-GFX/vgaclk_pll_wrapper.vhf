--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : vgaclk_pll_wrapper.vhf
-- /___/   /\     Timestamp : 11/10/2024 15:16:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/vgaclk_pll_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/vgaclk_pll_wrapper.sch
--Design Name: vgaclk_pll_wrapper
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity vgaclk_pll_wrapper is
   port ( CLK  : in    std_logic; 
          CLKO : out   std_logic);
end vgaclk_pll_wrapper;

architecture BEHAVIORAL of vgaclk_pll_wrapper is
   component vgaclk_pll
      port ( clk_in1  : in    std_logic; 
             clk_out1 : out   std_logic);
   end component;
   
begin
   XLXI_1 : vgaclk_pll
      port map (clk_in1=>CLK,
                clk_out1=>CLKO);
   
end BEHAVIORAL;


