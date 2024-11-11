--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : bus_splicer.vhf
-- /___/   /\     Timestamp : 11/10/2024 15:16:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/bus_splicer.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/bus_splicer.sch
--Design Name: bus_splicer
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

entity bus_splicer is
   port ( H : in    std_logic_vector (15 downto 0); 
          L : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (31 downto 0));
end bus_splicer;

architecture BEHAVIORAL of bus_splicer is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>L(0),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>L(1),
                O=>O(1));
   
   XLXI_5 : BUF
      port map (I=>L(2),
                O=>O(2));
   
   XLXI_6 : BUF
      port map (I=>L(3),
                O=>O(3));
   
   XLXI_7 : BUF
      port map (I=>L(4),
                O=>O(4));
   
   XLXI_8 : BUF
      port map (I=>L(5),
                O=>O(5));
   
   XLXI_9 : BUF
      port map (I=>L(6),
                O=>O(6));
   
   XLXI_10 : BUF
      port map (I=>L(7),
                O=>O(7));
   
   XLXI_11 : BUF
      port map (I=>L(8),
                O=>O(8));
   
   XLXI_12 : BUF
      port map (I=>L(9),
                O=>O(9));
   
   XLXI_13 : BUF
      port map (I=>L(10),
                O=>O(10));
   
   XLXI_14 : BUF
      port map (I=>L(11),
                O=>O(11));
   
   XLXI_15 : BUF
      port map (I=>L(12),
                O=>O(12));
   
   XLXI_16 : BUF
      port map (I=>L(13),
                O=>O(13));
   
   XLXI_17 : BUF
      port map (I=>L(14),
                O=>O(14));
   
   XLXI_18 : BUF
      port map (I=>L(15),
                O=>O(15));
   
   XLXI_19 : BUF
      port map (I=>H(0),
                O=>O(16));
   
   XLXI_20 : BUF
      port map (I=>H(1),
                O=>O(17));
   
   XLXI_21 : BUF
      port map (I=>H(2),
                O=>O(18));
   
   XLXI_22 : BUF
      port map (I=>H(3),
                O=>O(19));
   
   XLXI_23 : BUF
      port map (I=>H(4),
                O=>O(20));
   
   XLXI_24 : BUF
      port map (I=>H(5),
                O=>O(21));
   
   XLXI_25 : BUF
      port map (I=>H(6),
                O=>O(22));
   
   XLXI_26 : BUF
      port map (I=>H(7),
                O=>O(23));
   
   XLXI_27 : BUF
      port map (I=>H(8),
                O=>O(24));
   
   XLXI_28 : BUF
      port map (I=>H(9),
                O=>O(25));
   
   XLXI_29 : BUF
      port map (I=>H(10),
                O=>O(26));
   
   XLXI_30 : BUF
      port map (I=>H(11),
                O=>O(27));
   
   XLXI_31 : BUF
      port map (I=>H(12),
                O=>O(28));
   
   XLXI_32 : BUF
      port map (I=>H(13),
                O=>O(29));
   
   XLXI_33 : BUF
      port map (I=>H(14),
                O=>O(30));
   
   XLXI_34 : BUF
      port map (I=>H(15),
                O=>O(31));
   
end BEHAVIORAL;


