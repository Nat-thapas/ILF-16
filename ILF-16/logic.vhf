--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : logic.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:27:30
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/logic.vhf -w D:/Personal/Projects/ILF-16/ILF-16/logic.sch
--Design Name: logic
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

entity logic is
   port ( A : in    std_logic_vector (15 downto 0); 
          B : in    std_logic_vector (15 downto 0); 
          M : in    std_logic_vector (2 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end logic;

architecture BEHAVIORAL of logic is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   component LUT5
      -- synopsys translate_off
      generic( INIT : bit_vector :=  x"00000000");
      -- synopsys translate_on
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic; 
             I4 : in    std_logic);
   end component;
   attribute INIT of LUT5 : component is "00000000";
   attribute BOX_TYPE of LUT5 : component is "BLACK_BOX";
   
   attribute INIT of XLXI_1 : label is "9176E85A";
   attribute INIT of XLXI_19 : label is "9176E85A";
   attribute INIT of XLXI_20 : label is "9176E85A";
   attribute INIT of XLXI_21 : label is "9176E85A";
   attribute INIT of XLXI_22 : label is "9176E85A";
   attribute INIT of XLXI_23 : label is "9176E85A";
   attribute INIT of XLXI_24 : label is "9176E85A";
   attribute INIT of XLXI_25 : label is "9176E85A";
   attribute INIT of XLXI_26 : label is "9176E85A";
   attribute INIT of XLXI_27 : label is "9176E85A";
   attribute INIT of XLXI_28 : label is "9176E85A";
   attribute INIT of XLXI_29 : label is "9176E85A";
   attribute INIT of XLXI_30 : label is "9176E85A";
   attribute INIT of XLXI_31 : label is "9176E85A";
   attribute INIT of XLXI_33 : label is "9176E85A";
   attribute INIT of XLXI_34 : label is "9176E85A";
begin
   XLXI_1 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(0),
                I1=>B(0),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(0));
   
   XLXI_19 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(1),
                I1=>B(1),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(1));
   
   XLXI_20 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(2),
                I1=>B(2),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(2));
   
   XLXI_21 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(3),
                I1=>B(3),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(3));
   
   XLXI_22 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(4),
                I1=>B(4),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(4));
   
   XLXI_23 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(5),
                I1=>B(5),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(5));
   
   XLXI_24 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(6),
                I1=>B(6),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(6));
   
   XLXI_25 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(7),
                I1=>B(7),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(7));
   
   XLXI_26 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(8),
                I1=>B(8),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(8));
   
   XLXI_27 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(9),
                I1=>B(9),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(9));
   
   XLXI_28 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(10),
                I1=>B(10),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(10));
   
   XLXI_29 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(11),
                I1=>B(11),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(11));
   
   XLXI_30 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(12),
                I1=>B(12),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(12));
   
   XLXI_31 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(13),
                I1=>B(13),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(13));
   
   XLXI_33 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(14),
                I1=>B(14),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(14));
   
   XLXI_34 : LUT5
   -- synopsys translate_off
   generic map( INIT => x"9176E85A")
   -- synopsys translate_on
      port map (I0=>A(15),
                I1=>B(15),
                I2=>M(0),
                I3=>M(1),
                I4=>M(2),
                O=>O(15));
   
end BEHAVIORAL;


