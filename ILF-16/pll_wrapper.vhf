--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : pll_wrapper.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/pll_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-16/pll_wrapper.sch
--Design Name: pll_wrapper
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

entity pll_wrapper is
   port ( CLK     : in    std_logic; 
          SYS_CLK : out   std_logic; 
          TX_CLK  : out   std_logic);
end pll_wrapper;

architecture BEHAVIORAL of pll_wrapper is
   component sys_tx_clk_pll
      port ( clk_in1  : in    std_logic; 
             clk_out1 : out   std_logic; 
             clk_out2 : out   std_logic);
   end component;
   
begin
   XLXI_1 : sys_tx_clk_pll
      port map (clk_in1=>CLK,
                clk_out1=>SYS_CLK,
                clk_out2=>TX_CLK);
   
end BEHAVIORAL;


