--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : inp_stab.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:13:08
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/inp_stab.vhf -w D:/Personal/Projects/ILF-16/ILF-16/inp_stab.sch
--Design Name: inp_stab
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_inp_stab -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_inp_stab is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_inp_stab;

architecture Behavioral of FD16CE_HXILINX_inp_stab is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4x1x16t_MUSER_inp_stab is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16t_MUSER_inp_stab;

architecture BEHAVIORAL of mux4x1x16t_MUSER_inp_stab is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux16x1x16tb_MUSER_inp_stab is
   port ( D0  : in    std_logic_vector (15 downto 0); 
          D1  : in    std_logic_vector (15 downto 0); 
          D2  : in    std_logic_vector (15 downto 0); 
          D3  : in    std_logic_vector (15 downto 0); 
          D4  : in    std_logic_vector (15 downto 0); 
          D5  : in    std_logic_vector (15 downto 0); 
          D6  : in    std_logic_vector (15 downto 0); 
          D7  : in    std_logic_vector (15 downto 0); 
          D8  : in    std_logic_vector (15 downto 0); 
          D9  : in    std_logic_vector (15 downto 0); 
          D10 : in    std_logic_vector (15 downto 0); 
          D11 : in    std_logic_vector (15 downto 0); 
          D12 : in    std_logic_vector (15 downto 0); 
          D13 : in    std_logic_vector (15 downto 0); 
          D14 : in    std_logic_vector (15 downto 0); 
          D15 : in    std_logic_vector (15 downto 0); 
          S   : in    std_logic_vector (3 downto 0); 
          O   : out   std_logic_vector (15 downto 0));
end mux16x1x16tb_MUSER_inp_stab;

architecture BEHAVIORAL of mux16x1x16tb_MUSER_inp_stab is
   signal XLXN_1 : std_logic_vector (15 downto 0);
   signal XLXN_2 : std_logic_vector (15 downto 0);
   signal XLXN_3 : std_logic_vector (15 downto 0);
   signal XLXN_4 : std_logic_vector (15 downto 0);
   component mux4x1x16t_MUSER_inp_stab
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
begin
   MH1 : mux4x1x16t_MUSER_inp_stab
      port map (D0(15 downto 0)=>XLXN_1(15 downto 0),
                D1(15 downto 0)=>XLXN_2(15 downto 0),
                D2(15 downto 0)=>XLXN_3(15 downto 0),
                D3(15 downto 0)=>XLXN_4(15 downto 0),
                S0=>S(2),
                S1=>S(3),
                O(15 downto 0)=>O(15 downto 0));
   
   ML1 : mux4x1x16t_MUSER_inp_stab
      port map (D0(15 downto 0)=>D0(15 downto 0),
                D1(15 downto 0)=>D1(15 downto 0),
                D2(15 downto 0)=>D2(15 downto 0),
                D3(15 downto 0)=>D3(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_1(15 downto 0));
   
   ML2 : mux4x1x16t_MUSER_inp_stab
      port map (D0(15 downto 0)=>D4(15 downto 0),
                D1(15 downto 0)=>D5(15 downto 0),
                D2(15 downto 0)=>D6(15 downto 0),
                D3(15 downto 0)=>D7(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_2(15 downto 0));
   
   ML3 : mux4x1x16t_MUSER_inp_stab
      port map (D0(15 downto 0)=>D8(15 downto 0),
                D1(15 downto 0)=>D9(15 downto 0),
                D2(15 downto 0)=>D10(15 downto 0),
                D3(15 downto 0)=>D11(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_3(15 downto 0));
   
   ML4 : mux4x1x16t_MUSER_inp_stab
      port map (D0(15 downto 0)=>D12(15 downto 0),
                D1(15 downto 0)=>D13(15 downto 0),
                D2(15 downto 0)=>D14(15 downto 0),
                D3(15 downto 0)=>D15(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_4(15 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity inp_stab is
   port ( CLK : in    std_logic; 
          I0  : in    std_logic_vector (15 downto 0); 
          I1  : in    std_logic_vector (15 downto 0); 
          I2  : in    std_logic_vector (15 downto 0); 
          I3  : in    std_logic_vector (15 downto 0); 
          I4  : in    std_logic_vector (15 downto 0); 
          I5  : in    std_logic_vector (15 downto 0); 
          I6  : in    std_logic_vector (15 downto 0); 
          I7  : in    std_logic_vector (15 downto 0); 
          I8  : in    std_logic_vector (15 downto 0); 
          I9  : in    std_logic_vector (15 downto 0); 
          I10 : in    std_logic_vector (15 downto 0); 
          I11 : in    std_logic_vector (15 downto 0); 
          I12 : in    std_logic_vector (15 downto 0); 
          I13 : in    std_logic_vector (15 downto 0); 
          I14 : in    std_logic_vector (15 downto 0); 
          I15 : in    std_logic_vector (15 downto 0); 
          S   : in    std_logic_vector (3 downto 0); 
          O   : out   std_logic_vector (15 downto 0));
end inp_stab;

architecture BEHAVIORAL of inp_stab is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_7   : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_18  : std_logic;
   signal XLXN_21  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_26  : std_logic;
   signal XLXN_29  : std_logic;
   signal XLXN_30  : std_logic;
   signal XLXN_33  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_37  : std_logic;
   signal XLXN_38  : std_logic;
   signal XLXN_41  : std_logic;
   signal XLXN_42  : std_logic;
   signal XLXN_45  : std_logic;
   signal XLXN_46  : std_logic;
   signal XLXN_49  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_53  : std_logic;
   signal XLXN_54  : std_logic;
   signal XLXN_57  : std_logic;
   signal XLXN_58  : std_logic;
   signal XLXN_61  : std_logic;
   signal XLXN_62  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_66  : std_logic;
   signal XLXN_69  : std_logic;
   signal XLXN_70  : std_logic;
   signal XLXN_72  : std_logic_vector (15 downto 0);
   signal XLXN_73  : std_logic_vector (15 downto 0);
   signal XLXN_75  : std_logic_vector (15 downto 0);
   signal XLXN_76  : std_logic_vector (15 downto 0);
   signal XLXN_77  : std_logic_vector (15 downto 0);
   signal XLXN_78  : std_logic_vector (15 downto 0);
   signal XLXN_79  : std_logic_vector (15 downto 0);
   signal XLXN_80  : std_logic_vector (15 downto 0);
   signal XLXN_81  : std_logic_vector (15 downto 0);
   signal XLXN_84  : std_logic_vector (15 downto 0);
   signal XLXN_85  : std_logic_vector (15 downto 0);
   signal XLXN_86  : std_logic_vector (15 downto 0);
   signal XLXN_87  : std_logic_vector (15 downto 0);
   signal XLXN_88  : std_logic_vector (15 downto 0);
   signal XLXN_89  : std_logic_vector (15 downto 0);
   signal XLXN_90  : std_logic_vector (15 downto 0);
   signal XLXN_134 : std_logic;
   signal XLXN_135 : std_logic;
   signal XLXN_137 : std_logic_vector (15 downto 0);
   signal XLXN_138 : std_logic;
   signal XLXN_139 : std_logic;
   signal XLXN_141 : std_logic_vector (15 downto 0);
   signal XLXN_143 : std_logic;
   signal XLXN_144 : std_logic;
   signal XLXN_145 : std_logic_vector (15 downto 0);
   signal XLXN_147 : std_logic;
   signal XLXN_148 : std_logic;
   signal XLXN_149 : std_logic_vector (15 downto 0);
   signal XLXN_151 : std_logic;
   signal XLXN_152 : std_logic;
   signal XLXN_153 : std_logic_vector (15 downto 0);
   signal XLXN_155 : std_logic;
   signal XLXN_156 : std_logic;
   signal XLXN_157 : std_logic_vector (15 downto 0);
   signal XLXN_159 : std_logic;
   signal XLXN_160 : std_logic;
   signal XLXN_161 : std_logic_vector (15 downto 0);
   signal XLXN_163 : std_logic;
   signal XLXN_164 : std_logic;
   signal XLXN_165 : std_logic_vector (15 downto 0);
   signal XLXN_167 : std_logic;
   signal XLXN_168 : std_logic;
   signal XLXN_169 : std_logic_vector (15 downto 0);
   signal XLXN_175 : std_logic;
   signal XLXN_176 : std_logic;
   signal XLXN_177 : std_logic_vector (15 downto 0);
   signal XLXN_179 : std_logic;
   signal XLXN_180 : std_logic;
   signal XLXN_181 : std_logic_vector (15 downto 0);
   signal XLXN_183 : std_logic;
   signal XLXN_184 : std_logic;
   signal XLXN_185 : std_logic_vector (15 downto 0);
   signal XLXN_187 : std_logic;
   signal XLXN_188 : std_logic;
   signal XLXN_189 : std_logic_vector (15 downto 0);
   signal XLXN_191 : std_logic;
   signal XLXN_192 : std_logic;
   signal XLXN_193 : std_logic_vector (15 downto 0);
   signal XLXN_195 : std_logic;
   signal XLXN_196 : std_logic;
   signal XLXN_197 : std_logic_vector (15 downto 0);
   signal XLXN_199 : std_logic;
   signal XLXN_200 : std_logic;
   signal XLXN_201 : std_logic_vector (15 downto 0);
   component mux16x1x16tb_MUSER_inp_stab
      port ( D0  : in    std_logic_vector (15 downto 0); 
             D1  : in    std_logic_vector (15 downto 0); 
             D10 : in    std_logic_vector (15 downto 0); 
             D11 : in    std_logic_vector (15 downto 0); 
             D12 : in    std_logic_vector (15 downto 0); 
             D13 : in    std_logic_vector (15 downto 0); 
             D14 : in    std_logic_vector (15 downto 0); 
             D15 : in    std_logic_vector (15 downto 0); 
             D2  : in    std_logic_vector (15 downto 0); 
             D3  : in    std_logic_vector (15 downto 0); 
             D4  : in    std_logic_vector (15 downto 0); 
             D5  : in    std_logic_vector (15 downto 0); 
             D6  : in    std_logic_vector (15 downto 0); 
             D7  : in    std_logic_vector (15 downto 0); 
             D8  : in    std_logic_vector (15 downto 0); 
             D9  : in    std_logic_vector (15 downto 0); 
             O   : out   std_logic_vector (15 downto 0); 
             S   : in    std_logic_vector (3 downto 0));
   end component;
   
   component FD16CE_HXILINX_inp_stab
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1300";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_1301";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_1302";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_1303";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_1304";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_1305";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_1306";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_1307";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_1308";
   attribute HU_SET of XLXI_35 : label is "XLXI_35_1309";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_1310";
   attribute HU_SET of XLXI_41 : label is "XLXI_41_1311";
   attribute HU_SET of XLXI_44 : label is "XLXI_44_1312";
   attribute HU_SET of XLXI_47 : label is "XLXI_47_1313";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_1314";
   attribute HU_SET of XLXI_53 : label is "XLXI_53_1315";
   attribute HU_SET of XLXI_58 : label is "XLXI_58_1316";
   attribute HU_SET of XLXI_61 : label is "XLXI_61_1317";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_1318";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_1319";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_1320";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_1321";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_1322";
   attribute HU_SET of XLXI_81 : label is "XLXI_81_1323";
   attribute HU_SET of XLXI_84 : label is "XLXI_84_1324";
   attribute HU_SET of XLXI_90 : label is "XLXI_90_1325";
   attribute HU_SET of XLXI_93 : label is "XLXI_93_1326";
   attribute HU_SET of XLXI_96 : label is "XLXI_96_1327";
   attribute HU_SET of XLXI_99 : label is "XLXI_99_1328";
   attribute HU_SET of XLXI_102 : label is "XLXI_102_1329";
   attribute HU_SET of XLXI_105 : label is "XLXI_105_1330";
   attribute HU_SET of XLXI_108 : label is "XLXI_108_1331";
begin
   XLXI_1 : mux16x1x16tb_MUSER_inp_stab
      port map (D0(15 downto 0)=>XLXN_72(15 downto 0),
                D1(15 downto 0)=>XLXN_73(15 downto 0),
                D2(15 downto 0)=>XLXN_75(15 downto 0),
                D3(15 downto 0)=>XLXN_76(15 downto 0),
                D4(15 downto 0)=>XLXN_77(15 downto 0),
                D5(15 downto 0)=>XLXN_78(15 downto 0),
                D6(15 downto 0)=>XLXN_79(15 downto 0),
                D7(15 downto 0)=>XLXN_80(15 downto 0),
                D8(15 downto 0)=>XLXN_81(15 downto 0),
                D9(15 downto 0)=>XLXN_84(15 downto 0),
                D10(15 downto 0)=>XLXN_85(15 downto 0),
                D11(15 downto 0)=>XLXN_86(15 downto 0),
                D12(15 downto 0)=>XLXN_87(15 downto 0),
                D13(15 downto 0)=>XLXN_88(15 downto 0),
                D14(15 downto 0)=>XLXN_89(15 downto 0),
                D15(15 downto 0)=>XLXN_90(15 downto 0),
                S(3 downto 0)=>S(3 downto 0),
                O(15 downto 0)=>O(15 downto 0));
   
   XLXI_2 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_2,
                CLR=>XLXN_3,
                D(15 downto 0)=>I0(15 downto 0),
                Q(15 downto 0)=>XLXN_137(15 downto 0));
   
   XLXI_3 : VCC
      port map (P=>XLXN_2);
   
   XLXI_4 : GND
      port map (G=>XLXN_3);
   
   XLXI_5 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_6,
                CLR=>XLXN_7,
                D(15 downto 0)=>I1(15 downto 0),
                Q(15 downto 0)=>XLXN_141(15 downto 0));
   
   XLXI_6 : VCC
      port map (P=>XLXN_6);
   
   XLXI_7 : GND
      port map (G=>XLXN_7);
   
   XLXI_14 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_17,
                CLR=>XLXN_18,
                D(15 downto 0)=>I2(15 downto 0),
                Q(15 downto 0)=>XLXN_145(15 downto 0));
   
   XLXI_15 : VCC
      port map (P=>XLXN_17);
   
   XLXI_16 : GND
      port map (G=>XLXN_18);
   
   XLXI_17 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_21,
                CLR=>XLXN_22,
                D(15 downto 0)=>I3(15 downto 0),
                Q(15 downto 0)=>XLXN_149(15 downto 0));
   
   XLXI_18 : VCC
      port map (P=>XLXN_21);
   
   XLXI_19 : GND
      port map (G=>XLXN_22);
   
   XLXI_20 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_25,
                CLR=>XLXN_26,
                D(15 downto 0)=>I4(15 downto 0),
                Q(15 downto 0)=>XLXN_153(15 downto 0));
   
   XLXI_21 : VCC
      port map (P=>XLXN_25);
   
   XLXI_22 : GND
      port map (G=>XLXN_26);
   
   XLXI_23 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_29,
                CLR=>XLXN_30,
                D(15 downto 0)=>I5(15 downto 0),
                Q(15 downto 0)=>XLXN_157(15 downto 0));
   
   XLXI_24 : VCC
      port map (P=>XLXN_29);
   
   XLXI_25 : GND
      port map (G=>XLXN_30);
   
   XLXI_26 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_33,
                CLR=>XLXN_34,
                D(15 downto 0)=>I6(15 downto 0),
                Q(15 downto 0)=>XLXN_161(15 downto 0));
   
   XLXI_27 : VCC
      port map (P=>XLXN_33);
   
   XLXI_28 : GND
      port map (G=>XLXN_34);
   
   XLXI_29 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_37,
                CLR=>XLXN_38,
                D(15 downto 0)=>I7(15 downto 0),
                Q(15 downto 0)=>XLXN_165(15 downto 0));
   
   XLXI_30 : VCC
      port map (P=>XLXN_37);
   
   XLXI_31 : GND
      port map (G=>XLXN_38);
   
   XLXI_32 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_41,
                CLR=>XLXN_42,
                D(15 downto 0)=>I8(15 downto 0),
                Q(15 downto 0)=>XLXN_169(15 downto 0));
   
   XLXI_33 : VCC
      port map (P=>XLXN_41);
   
   XLXI_34 : GND
      port map (G=>XLXN_42);
   
   XLXI_35 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_45,
                CLR=>XLXN_46,
                D(15 downto 0)=>I9(15 downto 0),
                Q(15 downto 0)=>XLXN_177(15 downto 0));
   
   XLXI_36 : VCC
      port map (P=>XLXN_45);
   
   XLXI_37 : GND
      port map (G=>XLXN_46);
   
   XLXI_38 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_49,
                CLR=>XLXN_50,
                D(15 downto 0)=>I10(15 downto 0),
                Q(15 downto 0)=>XLXN_181(15 downto 0));
   
   XLXI_39 : VCC
      port map (P=>XLXN_49);
   
   XLXI_40 : GND
      port map (G=>XLXN_50);
   
   XLXI_41 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_53,
                CLR=>XLXN_54,
                D(15 downto 0)=>I11(15 downto 0),
                Q(15 downto 0)=>XLXN_185(15 downto 0));
   
   XLXI_42 : VCC
      port map (P=>XLXN_53);
   
   XLXI_43 : GND
      port map (G=>XLXN_54);
   
   XLXI_44 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_57,
                CLR=>XLXN_58,
                D(15 downto 0)=>I12(15 downto 0),
                Q(15 downto 0)=>XLXN_189(15 downto 0));
   
   XLXI_45 : VCC
      port map (P=>XLXN_57);
   
   XLXI_46 : GND
      port map (G=>XLXN_58);
   
   XLXI_47 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_61,
                CLR=>XLXN_62,
                D(15 downto 0)=>I13(15 downto 0),
                Q(15 downto 0)=>XLXN_193(15 downto 0));
   
   XLXI_48 : VCC
      port map (P=>XLXN_61);
   
   XLXI_49 : GND
      port map (G=>XLXN_62);
   
   XLXI_50 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_65,
                CLR=>XLXN_66,
                D(15 downto 0)=>I14(15 downto 0),
                Q(15 downto 0)=>XLXN_197(15 downto 0));
   
   XLXI_51 : VCC
      port map (P=>XLXN_65);
   
   XLXI_52 : GND
      port map (G=>XLXN_66);
   
   XLXI_53 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_69,
                CLR=>XLXN_70,
                D(15 downto 0)=>I15(15 downto 0),
                Q(15 downto 0)=>XLXN_201(15 downto 0));
   
   XLXI_54 : VCC
      port map (P=>XLXN_69);
   
   XLXI_55 : GND
      port map (G=>XLXN_70);
   
   XLXI_58 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_134,
                CLR=>XLXN_135,
                D(15 downto 0)=>XLXN_137(15 downto 0),
                Q(15 downto 0)=>XLXN_72(15 downto 0));
   
   XLXI_59 : VCC
      port map (P=>XLXN_134);
   
   XLXI_60 : GND
      port map (G=>XLXN_135);
   
   XLXI_61 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_138,
                CLR=>XLXN_139,
                D(15 downto 0)=>XLXN_141(15 downto 0),
                Q(15 downto 0)=>XLXN_73(15 downto 0));
   
   XLXI_62 : GND
      port map (G=>XLXN_139);
   
   XLXI_63 : VCC
      port map (P=>XLXN_138);
   
   XLXI_64 : GND
      port map (G=>XLXN_144);
   
   XLXI_65 : VCC
      port map (P=>XLXN_143);
   
   XLXI_66 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_143,
                CLR=>XLXN_144,
                D(15 downto 0)=>XLXN_145(15 downto 0),
                Q(15 downto 0)=>XLXN_75(15 downto 0));
   
   XLXI_67 : GND
      port map (G=>XLXN_148);
   
   XLXI_68 : VCC
      port map (P=>XLXN_147);
   
   XLXI_69 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_147,
                CLR=>XLXN_148,
                D(15 downto 0)=>XLXN_149(15 downto 0),
                Q(15 downto 0)=>XLXN_76(15 downto 0));
   
   XLXI_70 : GND
      port map (G=>XLXN_152);
   
   XLXI_71 : VCC
      port map (P=>XLXN_151);
   
   XLXI_72 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_151,
                CLR=>XLXN_152,
                D(15 downto 0)=>XLXN_153(15 downto 0),
                Q(15 downto 0)=>XLXN_77(15 downto 0));
   
   XLXI_73 : GND
      port map (G=>XLXN_156);
   
   XLXI_74 : VCC
      port map (P=>XLXN_155);
   
   XLXI_75 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_155,
                CLR=>XLXN_156,
                D(15 downto 0)=>XLXN_157(15 downto 0),
                Q(15 downto 0)=>XLXN_78(15 downto 0));
   
   XLXI_76 : GND
      port map (G=>XLXN_160);
   
   XLXI_77 : VCC
      port map (P=>XLXN_159);
   
   XLXI_78 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_159,
                CLR=>XLXN_160,
                D(15 downto 0)=>XLXN_161(15 downto 0),
                Q(15 downto 0)=>XLXN_79(15 downto 0));
   
   XLXI_79 : GND
      port map (G=>XLXN_164);
   
   XLXI_80 : VCC
      port map (P=>XLXN_163);
   
   XLXI_81 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_163,
                CLR=>XLXN_164,
                D(15 downto 0)=>XLXN_165(15 downto 0),
                Q(15 downto 0)=>XLXN_80(15 downto 0));
   
   XLXI_82 : GND
      port map (G=>XLXN_168);
   
   XLXI_83 : VCC
      port map (P=>XLXN_167);
   
   XLXI_84 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_167,
                CLR=>XLXN_168,
                D(15 downto 0)=>XLXN_169(15 downto 0),
                Q(15 downto 0)=>XLXN_81(15 downto 0));
   
   XLXI_88 : GND
      port map (G=>XLXN_176);
   
   XLXI_89 : VCC
      port map (P=>XLXN_175);
   
   XLXI_90 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_175,
                CLR=>XLXN_176,
                D(15 downto 0)=>XLXN_177(15 downto 0),
                Q(15 downto 0)=>XLXN_84(15 downto 0));
   
   XLXI_91 : GND
      port map (G=>XLXN_180);
   
   XLXI_92 : VCC
      port map (P=>XLXN_179);
   
   XLXI_93 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_179,
                CLR=>XLXN_180,
                D(15 downto 0)=>XLXN_181(15 downto 0),
                Q(15 downto 0)=>XLXN_85(15 downto 0));
   
   XLXI_94 : GND
      port map (G=>XLXN_184);
   
   XLXI_95 : VCC
      port map (P=>XLXN_183);
   
   XLXI_96 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_183,
                CLR=>XLXN_184,
                D(15 downto 0)=>XLXN_185(15 downto 0),
                Q(15 downto 0)=>XLXN_86(15 downto 0));
   
   XLXI_97 : GND
      port map (G=>XLXN_188);
   
   XLXI_98 : VCC
      port map (P=>XLXN_187);
   
   XLXI_99 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_187,
                CLR=>XLXN_188,
                D(15 downto 0)=>XLXN_189(15 downto 0),
                Q(15 downto 0)=>XLXN_87(15 downto 0));
   
   XLXI_100 : GND
      port map (G=>XLXN_192);
   
   XLXI_101 : VCC
      port map (P=>XLXN_191);
   
   XLXI_102 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_191,
                CLR=>XLXN_192,
                D(15 downto 0)=>XLXN_193(15 downto 0),
                Q(15 downto 0)=>XLXN_88(15 downto 0));
   
   XLXI_103 : GND
      port map (G=>XLXN_196);
   
   XLXI_104 : VCC
      port map (P=>XLXN_195);
   
   XLXI_105 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_195,
                CLR=>XLXN_196,
                D(15 downto 0)=>XLXN_197(15 downto 0),
                Q(15 downto 0)=>XLXN_89(15 downto 0));
   
   XLXI_106 : GND
      port map (G=>XLXN_200);
   
   XLXI_107 : VCC
      port map (P=>XLXN_199);
   
   XLXI_108 : FD16CE_HXILINX_inp_stab
      port map (C=>CLK,
                CE=>XLXN_199,
                CLR=>XLXN_200,
                D(15 downto 0)=>XLXN_201(15 downto 0),
                Q(15 downto 0)=>XLXN_90(15 downto 0));
   
end BEHAVIORAL;


