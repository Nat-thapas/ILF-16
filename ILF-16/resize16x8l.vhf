--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : resize16x8l.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:27:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/resize16x8l.vhf -w D:/Personal/Projects/ILF-16/ILF-16/resize16x8l.sch
--Design Name: resize16x8l
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

entity resize16x8l is
   port ( I : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end resize16x8l;

architecture BEHAVIORAL of resize16x8l is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>I(0),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>I(1),
                O=>O(1));
   
   XLXI_3 : BUF
      port map (I=>I(2),
                O=>O(2));
   
   XLXI_4 : BUF
      port map (I=>I(3),
                O=>O(3));
   
   XLXI_5 : BUF
      port map (I=>I(4),
                O=>O(4));
   
   XLXI_6 : BUF
      port map (I=>I(5),
                O=>O(5));
   
   XLXI_7 : BUF
      port map (I=>I(6),
                O=>O(6));
   
   XLXI_8 : BUF
      port map (I=>I(7),
                O=>O(7));
   
end BEHAVIORAL;


