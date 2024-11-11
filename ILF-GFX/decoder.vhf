--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : decoder.vhf
-- /___/   /\     Timestamp : 11/10/2024 18:46:53
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/decoder.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/decoder.sch
--Design Name: decoder
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

entity decoder is
   port ( INST : in    std_logic_vector (31 downto 0); 
          ADDR : out   std_logic_vector (15 downto 0); 
          CLR  : out   std_logic_vector (3 downto 0));
end decoder;

architecture BEHAVIORAL of decoder is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>INST(8),
                O=>ADDR(0));
   
   XLXI_2 : BUF
      port map (I=>INST(9),
                O=>ADDR(1));
   
   XLXI_3 : BUF
      port map (I=>INST(10),
                O=>ADDR(2));
   
   XLXI_4 : BUF
      port map (I=>INST(11),
                O=>ADDR(3));
   
   XLXI_5 : BUF
      port map (I=>INST(12),
                O=>ADDR(4));
   
   XLXI_6 : BUF
      port map (I=>INST(13),
                O=>ADDR(5));
   
   XLXI_7 : BUF
      port map (I=>INST(14),
                O=>ADDR(6));
   
   XLXI_8 : BUF
      port map (I=>INST(15),
                O=>ADDR(7));
   
   XLXI_9 : BUF
      port map (I=>INST(0),
                O=>ADDR(8));
   
   XLXI_10 : BUF
      port map (I=>INST(1),
                O=>ADDR(9));
   
   XLXI_11 : BUF
      port map (I=>INST(2),
                O=>ADDR(10));
   
   XLXI_12 : BUF
      port map (I=>INST(3),
                O=>ADDR(11));
   
   XLXI_13 : BUF
      port map (I=>INST(4),
                O=>ADDR(12));
   
   XLXI_14 : BUF
      port map (I=>INST(5),
                O=>ADDR(13));
   
   XLXI_15 : BUF
      port map (I=>INST(6),
                O=>ADDR(14));
   
   XLXI_16 : BUF
      port map (I=>INST(7),
                O=>ADDR(15));
   
   XLXI_17 : BUF
      port map (I=>INST(16),
                O=>CLR(0));
   
   XLXI_18 : BUF
      port map (I=>INST(17),
                O=>CLR(1));
   
   XLXI_19 : BUF
      port map (I=>INST(18),
                O=>CLR(2));
   
   XLXI_20 : BUF
      port map (I=>INST(19),
                O=>CLR(3));
   
end BEHAVIORAL;


