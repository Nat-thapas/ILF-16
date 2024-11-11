--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : BTN_inputs.vhf
-- /___/   /\     Timestamp : 11/10/2024 22:42:46
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-EXTIO/BTN_inputs.vhf -w D:/Personal/Projects/ILF-16/ILF-EXTIO/BTN_inputs.sch
--Design Name: BTN_inputs
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

entity BTN_inputs is
   port ( BTN1 : in    std_logic; 
          BTN2 : in    std_logic; 
          BTN3 : in    std_logic; 
          BTN4 : in    std_logic; 
          BTN5 : in    std_logic; 
          BTN6 : in    std_logic; 
          BTNS : out   std_logic_vector (7 downto 0));
end BTN_inputs;

architecture BEHAVIORAL of BTN_inputs is
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
   XLXI_1 : BUF
      port map (I=>BTN1,
                O=>BTNS(0));
   
   XLXI_2 : BUF
      port map (I=>BTN2,
                O=>BTNS(1));
   
   XLXI_3 : BUF
      port map (I=>BTN3,
                O=>BTNS(2));
   
   XLXI_4 : BUF
      port map (I=>BTN4,
                O=>BTNS(3));
   
   XLXI_5 : BUF
      port map (I=>BTN5,
                O=>BTNS(4));
   
   XLXI_6 : BUF
      port map (I=>BTN6,
                O=>BTNS(5));
   
   XLXI_7 : GND
      port map (G=>BTNS(6));
   
   XLXI_8 : GND
      port map (G=>BTNS(7));
   
end BEHAVIORAL;


