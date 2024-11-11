--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mock_ram.vhf
-- /___/   /\     Timestamp : 11/10/2024 23:45:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/mock_ram.vhf -w D:/Personal/Projects/ILF-16/ILF-16/mock_ram.sch
--Design Name: mock_ram
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

entity mock_ram is
   port ( ADDR : in    std_logic_vector (15 downto 0); 
          CLK  : in    std_logic; 
          DIN  : in    std_logic_vector (15 downto 0); 
          WE   : in    std_logic; 
          DO   : out   std_logic_vector (15 downto 0));
end mock_ram;

architecture BEHAVIORAL of mock_ram is
begin
end BEHAVIORAL;


