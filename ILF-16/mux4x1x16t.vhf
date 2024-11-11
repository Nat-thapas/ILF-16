--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : mux4x1x16t.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:53
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/mux4x1x16t.vhf -w D:/Personal/Projects/ILF-16/ILF-16/mux4x1x16t.sch
--Design Name: mux4x1x16t
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

entity mux4x1x16t is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16t;

architecture BEHAVIORAL of mux4x1x16t is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   component LUT6
      -- synopsys translate_off
      generic( INIT : bit_vector :=  x"0000000000000000");
      -- synopsys translate_on
      port ( O  : out   std_logic; 
             I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I5 : in    std_logic; 
             I4 : in    std_logic);
   end component;
   attribute INIT of LUT6 : component is "0000000000000000";
   attribute BOX_TYPE of LUT6 : component is "BLACK_BOX";
   
   attribute INIT of XLXI_1 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_33 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_34 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_35 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_36 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_37 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_38 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_39 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_40 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_41 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_42 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_43 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_44 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_45 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_46 : label is "F7D5B391E6C4A280";
   attribute INIT of XLXI_47 : label is "F7D5B391E6C4A280";
begin
   XLXI_1 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(0),
                I3=>D2(0),
                I4=>D1(0),
                I5=>D0(0),
                O=>O(0));
   
   XLXI_33 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(1),
                I3=>D2(1),
                I4=>D1(1),
                I5=>D0(1),
                O=>O(1));
   
   XLXI_34 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(2),
                I3=>D2(2),
                I4=>D1(2),
                I5=>D0(2),
                O=>O(2));
   
   XLXI_35 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(3),
                I3=>D2(3),
                I4=>D1(3),
                I5=>D0(3),
                O=>O(3));
   
   XLXI_36 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(4),
                I3=>D2(4),
                I4=>D1(4),
                I5=>D0(4),
                O=>O(4));
   
   XLXI_37 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(5),
                I3=>D2(5),
                I4=>D1(5),
                I5=>D0(5),
                O=>O(5));
   
   XLXI_38 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(6),
                I3=>D2(6),
                I4=>D1(6),
                I5=>D0(6),
                O=>O(6));
   
   XLXI_39 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(7),
                I3=>D2(7),
                I4=>D1(7),
                I5=>D0(7),
                O=>O(7));
   
   XLXI_40 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(8),
                I3=>D2(8),
                I4=>D1(8),
                I5=>D0(8),
                O=>O(8));
   
   XLXI_41 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(9),
                I3=>D2(9),
                I4=>D1(9),
                I5=>D0(9),
                O=>O(9));
   
   XLXI_42 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(10),
                I3=>D2(10),
                I4=>D1(10),
                I5=>D0(10),
                O=>O(10));
   
   XLXI_43 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(11),
                I3=>D2(11),
                I4=>D1(11),
                I5=>D0(11),
                O=>O(11));
   
   XLXI_44 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(12),
                I3=>D2(12),
                I4=>D1(12),
                I5=>D0(12),
                O=>O(12));
   
   XLXI_45 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(13),
                I3=>D2(13),
                I4=>D1(13),
                I5=>D0(13),
                O=>O(13));
   
   XLXI_46 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(14),
                I3=>D2(14),
                I4=>D1(14),
                I5=>D0(14),
                O=>O(14));
   
   XLXI_47 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"F7D5B391E6C4A280")
   -- synopsys translate_on
      port map (I0=>S1,
                I1=>S0,
                I2=>D3(15),
                I3=>D2(15),
                I4=>D1(15),
                I5=>D0(15),
                O=>O(15));
   
end BEHAVIORAL;


