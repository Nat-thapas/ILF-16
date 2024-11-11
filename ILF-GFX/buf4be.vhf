--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : buf4be.vhf
-- /___/   /\     Timestamp : 11/10/2024 15:16:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/buf4be.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/buf4be.sch
--Design Name: buf4be
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

entity buf4be is
   port ( Enable : in    std_logic; 
          I      : in    std_logic_vector (3 downto 0); 
          O      : out   std_logic_vector (3 downto 0));
end buf4be;

architecture BEHAVIORAL of buf4be is
   attribute BOX_TYPE   : string ;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>Enable,
                I1=>I(0),
                O=>O(0));
   
   XLXI_2 : AND2
      port map (I0=>Enable,
                I1=>I(1),
                O=>O(1));
   
   XLXI_3 : AND2
      port map (I0=>Enable,
                I1=>I(2),
                O=>O(2));
   
   XLXI_4 : AND2
      port map (I0=>Enable,
                I1=>I(3),
                O=>O(3));
   
end BEHAVIORAL;


