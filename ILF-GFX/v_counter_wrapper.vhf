--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : v_counter_wrapper.vhf
-- /___/   /\     Timestamp : 11/11/2024 16:30:38
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/v_counter_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/v_counter_wrapper.sch
--Design Name: v_counter_wrapper
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

entity v_counter_wrapper is
   port ( CE  : in    std_logic; 
          CLK : in    std_logic; 
          Q   : out   std_logic_vector (9 downto 0));
end v_counter_wrapper;

architecture BEHAVIORAL of v_counter_wrapper is
   component v_counter
      port ( clk : in    std_logic; 
             ce  : in    std_logic; 
             q   : out   std_logic_vector (9 downto 0));
   end component;
   
begin
   XLXI_1 : v_counter
      port map (ce=>CE,
                clk=>CLK,
                q(9 downto 0)=>Q(9 downto 0));
   
end BEHAVIORAL;


