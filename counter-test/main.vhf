--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : main.vhf
-- /___/   /\     Timestamp : 11/11/2024 16:21:07
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/counter-test/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/counter-test/main.vhf -w D:/Personal/Projects/ILF-16/counter-test/main.sch
--Design Name: main
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

entity main is
   port ( BTN1 : in    std_logic; 
          LED  : out   std_logic_vector (3 downto 0); 
          LED7 : out   std_logic);
end main;

architecture BEHAVIORAL of main is
   component counter10
      port ( clk     : in    std_logic; 
             thresh0 : out   std_logic; 
             q       : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   XLXI_1 : counter10
      port map (clk=>BTN1,
                q(3 downto 0)=>LED(3 downto 0),
                thresh0=>LED7);
   
end BEHAVIORAL;


