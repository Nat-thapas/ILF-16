--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : gnd16.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:13:01
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/gnd16.vhf -w D:/Personal/Projects/ILF-16/ILF-16/gnd16.sch
--Design Name: gnd16
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

entity gnd16 is
   port ( GNDO : out   std_logic_vector (15 downto 0));
end gnd16;

architecture BEHAVIORAL of gnd16 is
   attribute BOX_TYPE   : string ;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : GND
      port map (G=>GNDO(0));
   
   XLXI_2 : GND
      port map (G=>GNDO(1));
   
   XLXI_3 : GND
      port map (G=>GNDO(2));
   
   XLXI_4 : GND
      port map (G=>GNDO(3));
   
   XLXI_5 : GND
      port map (G=>GNDO(4));
   
   XLXI_6 : GND
      port map (G=>GNDO(5));
   
   XLXI_7 : GND
      port map (G=>GNDO(6));
   
   XLXI_8 : GND
      port map (G=>GNDO(7));
   
   XLXI_9 : GND
      port map (G=>GNDO(8));
   
   XLXI_10 : GND
      port map (G=>GNDO(9));
   
   XLXI_11 : GND
      port map (G=>GNDO(10));
   
   XLXI_12 : GND
      port map (G=>GNDO(11));
   
   XLXI_13 : GND
      port map (G=>GNDO(12));
   
   XLXI_14 : GND
      port map (G=>GNDO(13));
   
   XLXI_15 : GND
      port map (G=>GNDO(14));
   
   XLXI_16 : GND
      port map (G=>GNDO(15));
   
end BEHAVIORAL;


