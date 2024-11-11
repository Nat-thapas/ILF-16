--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : rom_wrapper.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:27:36
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/rom_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-16/rom_wrapper.sch
--Design Name: rom_wrapper
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

entity rom_wrapper is
   port ( ADDR : in    std_logic_vector (15 downto 0); 
          CLK  : in    std_logic; 
          DO   : out   std_logic_vector (31 downto 0));
end rom_wrapper;

architecture BEHAVIORAL of rom_wrapper is
   attribute BOX_TYPE   : string ;
   signal ADDRA : std_logic_vector (13 downto 0);
   component rom
      port ( addra : in    std_logic_vector (13 downto 0); 
             clka  : in    std_logic; 
             douta : out   std_logic_vector (31 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : rom
      port map (addra(13 downto 0)=>ADDRA(13 downto 0),
                clka=>CLK,
                douta(31 downto 0)=>DO(31 downto 0));
   
   XLXI_2 : BUF
      port map (I=>ADDR(0),
                O=>ADDRA(0));
   
   XLXI_3 : BUF
      port map (I=>ADDR(1),
                O=>ADDRA(1));
   
   XLXI_4 : BUF
      port map (I=>ADDR(2),
                O=>ADDRA(2));
   
   XLXI_5 : BUF
      port map (I=>ADDR(3),
                O=>ADDRA(3));
   
   XLXI_6 : BUF
      port map (I=>ADDR(4),
                O=>ADDRA(4));
   
   XLXI_7 : BUF
      port map (I=>ADDR(5),
                O=>ADDRA(5));
   
   XLXI_8 : BUF
      port map (I=>ADDR(6),
                O=>ADDRA(6));
   
   XLXI_9 : BUF
      port map (I=>ADDR(7),
                O=>ADDRA(7));
   
   XLXI_10 : BUF
      port map (I=>ADDR(8),
                O=>ADDRA(8));
   
   XLXI_11 : BUF
      port map (I=>ADDR(9),
                O=>ADDRA(9));
   
   XLXI_14 : BUF
      port map (I=>ADDR(10),
                O=>ADDRA(10));
   
   XLXI_15 : BUF
      port map (I=>ADDR(11),
                O=>ADDRA(11));
   
   XLXI_16 : BUF
      port map (I=>ADDR(12),
                O=>ADDRA(12));
   
   XLXI_17 : BUF
      port map (I=>ADDR(13),
                O=>ADDRA(13));
   
end BEHAVIORAL;


