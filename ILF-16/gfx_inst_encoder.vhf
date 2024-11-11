--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : gfx_inst_encoder.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:56
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/gfx_inst_encoder.vhf -w D:/Personal/Projects/ILF-16/ILF-16/gfx_inst_encoder.sch
--Design Name: gfx_inst_encoder
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

entity gfx_inst_encoder is
   port ( A        : in    std_logic_vector (15 downto 0); 
          B        : in    std_logic_vector (15 downto 0); 
          C        : in    std_logic_vector (15 downto 0); 
          ID       : in    std_logic_vector (7 downto 0); 
          GFX_INST : out   std_logic_vector (31 downto 0));
end gfx_inst_encoder;

architecture BEHAVIORAL of gfx_inst_encoder is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_4 : BUF
      port map (I=>ID(3),
                O=>GFX_INST(31));
   
   XLXI_5 : BUF
      port map (I=>ID(2),
                O=>GFX_INST(30));
   
   XLXI_6 : BUF
      port map (I=>ID(1),
                O=>GFX_INST(29));
   
   XLXI_7 : BUF
      port map (I=>ID(0),
                O=>GFX_INST(28));
   
   XLXI_8 : GND
      port map (G=>GFX_INST(27));
   
   XLXI_9 : GND
      port map (G=>GFX_INST(26));
   
   XLXI_10 : GND
      port map (G=>GFX_INST(25));
   
   XLXI_11 : GND
      port map (G=>GFX_INST(24));
   
   XLXI_12 : GND
      port map (G=>GFX_INST(23));
   
   XLXI_13 : GND
      port map (G=>GFX_INST(22));
   
   XLXI_14 : GND
      port map (G=>GFX_INST(21));
   
   XLXI_15 : GND
      port map (G=>GFX_INST(20));
   
   XLXI_16 : BUF
      port map (I=>C(3),
                O=>GFX_INST(19));
   
   XLXI_17 : BUF
      port map (I=>C(2),
                O=>GFX_INST(18));
   
   XLXI_18 : BUF
      port map (I=>C(1),
                O=>GFX_INST(17));
   
   XLXI_19 : BUF
      port map (I=>C(0),
                O=>GFX_INST(16));
   
   XLXI_20 : BUF
      port map (I=>A(7),
                O=>GFX_INST(15));
   
   XLXI_21 : BUF
      port map (I=>A(6),
                O=>GFX_INST(14));
   
   XLXI_22 : BUF
      port map (I=>A(5),
                O=>GFX_INST(13));
   
   XLXI_23 : BUF
      port map (I=>A(4),
                O=>GFX_INST(12));
   
   XLXI_24 : BUF
      port map (I=>A(3),
                O=>GFX_INST(11));
   
   XLXI_25 : BUF
      port map (I=>A(2),
                O=>GFX_INST(10));
   
   XLXI_26 : BUF
      port map (I=>A(1),
                O=>GFX_INST(9));
   
   XLXI_27 : BUF
      port map (I=>A(0),
                O=>GFX_INST(8));
   
   XLXI_28 : BUF
      port map (I=>B(7),
                O=>GFX_INST(7));
   
   XLXI_29 : BUF
      port map (I=>B(6),
                O=>GFX_INST(6));
   
   XLXI_30 : BUF
      port map (I=>B(5),
                O=>GFX_INST(5));
   
   XLXI_31 : BUF
      port map (I=>B(4),
                O=>GFX_INST(4));
   
   XLXI_32 : BUF
      port map (I=>B(3),
                O=>GFX_INST(3));
   
   XLXI_33 : BUF
      port map (I=>B(2),
                O=>GFX_INST(2));
   
   XLXI_34 : BUF
      port map (I=>B(1),
                O=>GFX_INST(1));
   
   XLXI_35 : BUF
      port map (I=>B(0),
                O=>GFX_INST(0));
   
end BEHAVIORAL;


