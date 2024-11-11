--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : alu.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:27:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/alu.vhf -w D:/Personal/Projects/ILF-16/ILF-16/alu.sch
--Design Name: alu
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL NOR12_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOR12_HXILINX_alu is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic;
    I8  : in std_logic;
    I9  : in std_logic;
    I10 : in std_logic;
    I11 : in std_logic
  );
end NOR12_HXILINX_alu;

architecture NOR12_HXILINX_alu_V of NOR12_HXILINX_alu is
begin
  O <= not (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11);
end NOR12_HXILINX_alu_V;
----- CELL NOR16_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOR16_HXILINX_alu is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic;
    I8  : in std_logic;
    I9  : in std_logic;
    I10 : in std_logic;
    I11 : in std_logic;
    I12 : in std_logic;
    I13 : in std_logic;
    I14 : in std_logic;
    I15 : in std_logic
  );
end NOR16_HXILINX_alu;

architecture NOR16_HXILINX_alu_V of NOR16_HXILINX_alu is
begin
  O <= not (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11 or I12 or I13 or I14 or I15);
end NOR16_HXILINX_alu_V;
----- CELL M2_1E_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_alu is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_alu;

architecture M2_1E_HXILINX_alu_V of M2_1E_HXILINX_alu is
begin
  process (D0, D1, E, S0)
  begin
    if( E = '0') then
    O <= '0';
    else
      case S0 is
      when '0' => O <= D0;
      when '1' => O <= D1;
      when others => NULL;
      end case;
    end if;
    end process; 
end M2_1E_HXILINX_alu_V;
----- CELL COMPM16_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPM16_HXILINX_alu is
port(
    GT  : out std_logic;
    LT  : out std_logic;

    A   : in std_logic_vector(15 downto 0);
    B   : in std_logic_vector(15 downto 0)
  );
end COMPM16_HXILINX_alu;

architecture COMPM16_HXILINX_alu_V of COMPM16_HXILINX_alu is
begin
     
  GT <= '1' when ( A > B ) else '0';
  LT <= '1' when ( A < B ) else '0';

end COMPM16_HXILINX_alu_V;
----- CELL M2_1_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_alu is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_alu;

architecture M2_1_HXILINX_alu_V of M2_1_HXILINX_alu is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_alu_V;
----- CELL ADSU16_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADSU16_HXILINX_alu is
port(
    CO   : out std_logic;
    OFL  : out std_logic;
    S    : out std_logic_vector(15 downto 0);

    A    : in std_logic_vector(15 downto 0);
    ADD  : in std_logic;
    B    : in std_logic_vector(15 downto 0);
    CI   : in std_logic
  );
end ADSU16_HXILINX_alu;

architecture ADSU16_HXILINX_alu_V of ADSU16_HXILINX_alu is

begin
  adsu_p : process (A, ADD, B, CI)
    variable adsu_tmp : std_logic_vector(16 downto 0);
  begin
    if(ADD = '1') then
     adsu_tmp := conv_std_logic_vector((conv_integer(A) + conv_integer(B) + conv_integer(CI)),17);
    else
     adsu_tmp := conv_std_logic_vector((conv_integer(A) - conv_integer(not CI) - conv_integer(B)),17);
  end if;
      
  S   <= adsu_tmp(15 downto 0);
   
  if (ADD='1') then
    CO <= adsu_tmp(16);
    OFL <=  ( A(15) and B(15) and (not adsu_tmp(15)) ) or ( (not A(15)) and (not B(15)) and adsu_tmp(15) );  
  else
    CO <= not adsu_tmp(16);
    OFL <=  ( A(15) and (not B(15)) and (not adsu_tmp(15)) ) or ( (not A(15)) and B(15) and adsu_tmp(15) );  
  end if;
 
  end process;
  
end ADSU16_HXILINX_alu_V;
----- CELL XNOR8_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity XNOR8_HXILINX_alu is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic;
    I6  : in std_logic;
    I7  : in std_logic
  );
end XNOR8_HXILINX_alu;

architecture XNOR8_HXILINX_alu_V of XNOR8_HXILINX_alu is
begin
  O <= not (I0 xor I1 xor I2 xor I3 xor I4 xor I5 xor I6 xor I7);
end XNOR8_HXILINX_alu_V;
----- CELL COMP16_HXILINX_alu -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMP16_HXILINX_alu is
port(
    EQ  : out std_logic;

    A   : in std_logic_vector(15 downto 0);
    B   : in std_logic_vector(15 downto 0)
  );
end COMP16_HXILINX_alu;

architecture COMP16_HXILINX_alu_V of COMP16_HXILINX_alu is
begin
  EQ <= '1' when (A=B) else '0';
end COMP16_HXILINX_alu_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4x1x16t_MUSER_alu is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16t_MUSER_alu;

architecture BEHAVIORAL of mux4x1x16t_MUSER_alu is
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

entity mux2x1x16e_MUSER_alu is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          E  : in    std_logic; 
          S  : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux2x1x16e_MUSER_alu;

architecture BEHAVIORAL of mux2x1x16e_MUSER_alu is
   attribute HU_SET     : string ;
   component M2_1E_HXILINX_alu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_728";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_729";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_730";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_731";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_732";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_733";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_734";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_735";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_736";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_737";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_738";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_739";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_740";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_741";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_742";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_743";
begin
   XLXI_1 : M2_1E_HXILINX_alu
      port map (D0=>D0(0),
                D1=>D1(0),
                E=>E,
                S0=>S,
                O=>O(0));
   
   XLXI_2 : M2_1E_HXILINX_alu
      port map (D0=>D0(1),
                D1=>D1(1),
                E=>E,
                S0=>S,
                O=>O(1));
   
   XLXI_3 : M2_1E_HXILINX_alu
      port map (D0=>D0(2),
                D1=>D1(2),
                E=>E,
                S0=>S,
                O=>O(2));
   
   XLXI_4 : M2_1E_HXILINX_alu
      port map (D0=>D0(3),
                D1=>D1(3),
                E=>E,
                S0=>S,
                O=>O(3));
   
   XLXI_5 : M2_1E_HXILINX_alu
      port map (D0=>D0(4),
                D1=>D1(4),
                E=>E,
                S0=>S,
                O=>O(4));
   
   XLXI_6 : M2_1E_HXILINX_alu
      port map (D0=>D0(5),
                D1=>D1(5),
                E=>E,
                S0=>S,
                O=>O(5));
   
   XLXI_7 : M2_1E_HXILINX_alu
      port map (D0=>D0(6),
                D1=>D1(6),
                E=>E,
                S0=>S,
                O=>O(6));
   
   XLXI_8 : M2_1E_HXILINX_alu
      port map (D0=>D0(7),
                D1=>D1(7),
                E=>E,
                S0=>S,
                O=>O(7));
   
   XLXI_9 : M2_1E_HXILINX_alu
      port map (D0=>D0(8),
                D1=>D1(8),
                E=>E,
                S0=>S,
                O=>O(8));
   
   XLXI_10 : M2_1E_HXILINX_alu
      port map (D0=>D0(9),
                D1=>D1(9),
                E=>E,
                S0=>S,
                O=>O(9));
   
   XLXI_11 : M2_1E_HXILINX_alu
      port map (D0=>D0(10),
                D1=>D1(10),
                E=>E,
                S0=>S,
                O=>O(10));
   
   XLXI_12 : M2_1E_HXILINX_alu
      port map (D0=>D0(11),
                D1=>D1(11),
                E=>E,
                S0=>S,
                O=>O(11));
   
   XLXI_13 : M2_1E_HXILINX_alu
      port map (D0=>D0(12),
                D1=>D1(12),
                E=>E,
                S0=>S,
                O=>O(12));
   
   XLXI_14 : M2_1E_HXILINX_alu
      port map (D0=>D0(13),
                D1=>D1(13),
                E=>E,
                S0=>S,
                O=>O(13));
   
   XLXI_15 : M2_1E_HXILINX_alu
      port map (D0=>D0(14),
                D1=>D1(14),
                E=>E,
                S0=>S,
                O=>O(14));
   
   XLXI_16 : M2_1E_HXILINX_alu
      port map (D0=>D0(15),
                D1=>D1(15),
                E=>E,
                S0=>S,
                O=>O(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity logic_MUSER_alu is
   port ( A : in    std_logic_vector (15 downto 0); 
          B : in    std_logic_vector (15 downto 0); 
          M : in    std_logic_vector (2 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end logic_MUSER_alu;

architecture BEHAVIORAL of logic_MUSER_alu is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mult_MUSER_alu is
   port ( A      : in    std_logic_vector (15 downto 0); 
          B      : in    std_logic_vector (15 downto 0); 
          Signed : in    std_logic; 
          H      : out   std_logic_vector (15 downto 0); 
          L      : out   std_logic_vector (15 downto 0));
end mult_MUSER_alu;

architecture BEHAVIORAL of mult_MUSER_alu is
   attribute AREG        : string ;
   attribute BREG        : string ;
   attribute PREG        : string ;
   attribute B_INPUT     : string ;
   attribute BOX_TYPE    : string ;
   attribute HU_SET      : string ;
   signal AE       : std_logic_vector (17 downto 0);
   signal BCIN     : std_logic_vector (17 downto 0);
   signal BE       : std_logic_vector (17 downto 0);
   signal P        : std_logic_vector (35 downto 0);
   signal XLXN_37  : std_logic;
   signal XLXN_188 : std_logic;
   signal XLXN_189 : std_logic;
   signal XLXN_210 : std_logic;
   signal XLXN_212 : std_logic;
   signal XLXN_253 : std_logic;
   component MULT18X18SIO
      -- synopsys translate_off
      generic( AREG : integer :=  1;
               BREG : integer :=  1;
               PREG : integer :=  1;
               B_INPUT : string :=  "DIRECT");
      -- synopsys translate_on
      port ( A     : in    std_logic_vector (17 downto 0); 
             B     : in    std_logic_vector (17 downto 0); 
             CEA   : in    std_logic; 
             CEB   : in    std_logic; 
             CEP   : in    std_logic; 
             CLK   : in    std_logic; 
             RSTA  : in    std_logic; 
             RSTB  : in    std_logic; 
             RSTP  : in    std_logic; 
             BCIN  : in    std_logic_vector (17 downto 0); 
             P     : out   std_logic_vector (35 downto 0); 
             BCOUT : out   std_logic_vector (17 downto 0));
   end component;
   attribute AREG of MULT18X18SIO : component is "1";
   attribute BREG of MULT18X18SIO : component is "1";
   attribute PREG of MULT18X18SIO : component is "1";
   attribute B_INPUT of MULT18X18SIO : component is "DIRECT";
   attribute BOX_TYPE of MULT18X18SIO : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component M2_1_HXILINX_alu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_206 : label is "XLXI_206_744";
   attribute HU_SET of XLXI_209 : label is "XLXI_209_745";
   attribute HU_SET of XLXI_273 : label is "XLXI_273_746";
begin
   XLXI_1 : MULT18X18SIO
      port map (A(17 downto 0)=>AE(17 downto 0),
                B(17 downto 0)=>BE(17 downto 0),
                BCIN(17 downto 0)=>BCIN(17 downto 0),
                CEA=>XLXN_37,
                CEB=>XLXN_37,
                CEP=>XLXN_37,
                CLK=>XLXN_37,
                RSTA=>XLXN_37,
                RSTB=>XLXN_37,
                RSTP=>XLXN_37,
                BCOUT=>open,
                P(35 downto 0)=>P(35 downto 0));
   
   XLXI_2 : GND
      port map (G=>BCIN(0));
   
   XLXI_3 : GND
      port map (G=>BCIN(1));
   
   XLXI_4 : GND
      port map (G=>BCIN(2));
   
   XLXI_5 : GND
      port map (G=>BCIN(3));
   
   XLXI_6 : GND
      port map (G=>BCIN(4));
   
   XLXI_7 : GND
      port map (G=>BCIN(5));
   
   XLXI_8 : GND
      port map (G=>BCIN(6));
   
   XLXI_9 : GND
      port map (G=>BCIN(7));
   
   XLXI_10 : GND
      port map (G=>BCIN(8));
   
   XLXI_11 : GND
      port map (G=>BCIN(9));
   
   XLXI_12 : GND
      port map (G=>BCIN(10));
   
   XLXI_13 : GND
      port map (G=>BCIN(11));
   
   XLXI_14 : GND
      port map (G=>BCIN(12));
   
   XLXI_15 : GND
      port map (G=>BCIN(13));
   
   XLXI_16 : GND
      port map (G=>BCIN(14));
   
   XLXI_17 : GND
      port map (G=>BCIN(15));
   
   XLXI_18 : GND
      port map (G=>BCIN(16));
   
   XLXI_19 : GND
      port map (G=>BCIN(17));
   
   XLXI_38 : GND
      port map (G=>XLXN_37);
   
   XLXI_39 : BUF
      port map (I=>A(0),
                O=>AE(0));
   
   XLXI_40 : BUF
      port map (I=>A(1),
                O=>AE(1));
   
   XLXI_41 : BUF
      port map (I=>A(2),
                O=>AE(2));
   
   XLXI_42 : BUF
      port map (I=>A(3),
                O=>AE(3));
   
   XLXI_43 : BUF
      port map (I=>A(4),
                O=>AE(4));
   
   XLXI_44 : BUF
      port map (I=>A(5),
                O=>AE(5));
   
   XLXI_45 : BUF
      port map (I=>A(6),
                O=>AE(6));
   
   XLXI_47 : BUF
      port map (I=>A(7),
                O=>AE(7));
   
   XLXI_48 : BUF
      port map (I=>A(8),
                O=>AE(8));
   
   XLXI_49 : BUF
      port map (I=>A(9),
                O=>AE(9));
   
   XLXI_50 : BUF
      port map (I=>A(10),
                O=>AE(10));
   
   XLXI_51 : BUF
      port map (I=>A(11),
                O=>AE(11));
   
   XLXI_52 : BUF
      port map (I=>A(12),
                O=>AE(12));
   
   XLXI_53 : BUF
      port map (I=>A(13),
                O=>AE(13));
   
   XLXI_54 : BUF
      port map (I=>A(14),
                O=>AE(14));
   
   XLXI_55 : BUF
      port map (I=>A(15),
                O=>AE(15));
   
   XLXI_56 : BUF
      port map (I=>XLXN_188,
                O=>AE(16));
   
   XLXI_57 : BUF
      port map (I=>XLXN_188,
                O=>AE(17));
   
   XLXI_78 : BUF
      port map (I=>B(0),
                O=>BE(0));
   
   XLXI_79 : BUF
      port map (I=>B(1),
                O=>BE(1));
   
   XLXI_80 : BUF
      port map (I=>B(2),
                O=>BE(2));
   
   XLXI_81 : BUF
      port map (I=>B(3),
                O=>BE(3));
   
   XLXI_82 : BUF
      port map (I=>B(4),
                O=>BE(4));
   
   XLXI_83 : BUF
      port map (I=>B(5),
                O=>BE(5));
   
   XLXI_84 : BUF
      port map (I=>B(6),
                O=>BE(6));
   
   XLXI_85 : BUF
      port map (I=>B(7),
                O=>BE(7));
   
   XLXI_86 : BUF
      port map (I=>B(8),
                O=>BE(8));
   
   XLXI_87 : BUF
      port map (I=>B(9),
                O=>BE(9));
   
   XLXI_88 : BUF
      port map (I=>B(10),
                O=>BE(10));
   
   XLXI_89 : BUF
      port map (I=>B(11),
                O=>BE(11));
   
   XLXI_90 : BUF
      port map (I=>B(12),
                O=>BE(12));
   
   XLXI_91 : BUF
      port map (I=>B(13),
                O=>BE(13));
   
   XLXI_92 : BUF
      port map (I=>B(14),
                O=>BE(14));
   
   XLXI_93 : BUF
      port map (I=>B(15),
                O=>BE(15));
   
   XLXI_94 : BUF
      port map (I=>XLXN_210,
                O=>BE(16));
   
   XLXI_95 : BUF
      port map (I=>XLXN_210,
                O=>BE(17));
   
   XLXI_206 : M2_1_HXILINX_alu
      port map (D0=>XLXN_189,
                D1=>A(15),
                S0=>Signed,
                O=>XLXN_188);
   
   XLXI_208 : GND
      port map (G=>XLXN_189);
   
   XLXI_209 : M2_1_HXILINX_alu
      port map (D0=>XLXN_212,
                D1=>B(15),
                S0=>Signed,
                O=>XLXN_210);
   
   XLXI_210 : GND
      port map (G=>XLXN_212);
   
   XLXI_211 : BUF
      port map (I=>P(0),
                O=>L(0));
   
   XLXI_213 : BUF
      port map (I=>P(1),
                O=>L(1));
   
   XLXI_214 : BUF
      port map (I=>P(2),
                O=>L(2));
   
   XLXI_215 : BUF
      port map (I=>P(3),
                O=>L(3));
   
   XLXI_245 : BUF
      port map (I=>P(4),
                O=>L(4));
   
   XLXI_246 : BUF
      port map (I=>P(5),
                O=>L(5));
   
   XLXI_247 : BUF
      port map (I=>P(6),
                O=>L(6));
   
   XLXI_248 : BUF
      port map (I=>P(7),
                O=>L(7));
   
   XLXI_249 : BUF
      port map (I=>P(8),
                O=>L(8));
   
   XLXI_250 : BUF
      port map (I=>P(9),
                O=>L(9));
   
   XLXI_251 : BUF
      port map (I=>P(10),
                O=>L(10));
   
   XLXI_252 : BUF
      port map (I=>P(11),
                O=>L(11));
   
   XLXI_253 : BUF
      port map (I=>P(12),
                O=>L(12));
   
   XLXI_254 : BUF
      port map (I=>P(13),
                O=>L(13));
   
   XLXI_255 : BUF
      port map (I=>P(14),
                O=>L(14));
   
   XLXI_256 : BUF
      port map (I=>P(15),
                O=>L(15));
   
   XLXI_257 : BUF
      port map (I=>P(16),
                O=>H(0));
   
   XLXI_258 : BUF
      port map (I=>P(17),
                O=>H(1));
   
   XLXI_259 : BUF
      port map (I=>P(18),
                O=>H(2));
   
   XLXI_260 : BUF
      port map (I=>P(19),
                O=>H(3));
   
   XLXI_261 : BUF
      port map (I=>P(20),
                O=>H(4));
   
   XLXI_262 : BUF
      port map (I=>P(21),
                O=>H(5));
   
   XLXI_263 : BUF
      port map (I=>P(22),
                O=>H(6));
   
   XLXI_264 : BUF
      port map (I=>P(23),
                O=>H(7));
   
   XLXI_265 : BUF
      port map (I=>P(24),
                O=>H(8));
   
   XLXI_266 : BUF
      port map (I=>P(25),
                O=>H(9));
   
   XLXI_267 : BUF
      port map (I=>P(26),
                O=>H(10));
   
   XLXI_268 : BUF
      port map (I=>P(27),
                O=>H(11));
   
   XLXI_269 : BUF
      port map (I=>P(28),
                O=>H(12));
   
   XLXI_270 : BUF
      port map (I=>P(29),
                O=>H(13));
   
   XLXI_271 : BUF
      port map (I=>P(30),
                O=>H(14));
   
   XLXI_272 : BUF
      port map (I=>XLXN_253,
                O=>H(15));
   
   XLXI_273 : M2_1_HXILINX_alu
      port map (D0=>P(31),
                D1=>P(35),
                S0=>Signed,
                O=>XLXN_253);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity rshift_MUSER_alu is
   port ( I : in    std_logic_vector (15 downto 0); 
          S : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end rshift_MUSER_alu;

architecture BEHAVIORAL of rshift_MUSER_alu is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_39  : std_logic;
   signal XLXN_56  : std_logic;
   signal XLXN_57  : std_logic;
   signal XLXN_73  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_75  : std_logic;
   signal XLXN_76  : std_logic;
   signal XLXN_77  : std_logic;
   signal XLXN_78  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_81  : std_logic;
   signal XLXN_82  : std_logic;
   signal XLXN_83  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_85  : std_logic;
   signal XLXN_86  : std_logic;
   signal XLXN_87  : std_logic;
   signal XLXN_88  : std_logic;
   signal XLXN_89  : std_logic;
   signal XLXN_90  : std_logic;
   signal XLXN_91  : std_logic;
   signal XLXN_116 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_118 : std_logic;
   signal XLXN_120 : std_logic;
   signal XLXN_121 : std_logic;
   signal XLXN_122 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_125 : std_logic;
   signal XLXN_126 : std_logic;
   signal XLXN_127 : std_logic;
   signal XLXN_128 : std_logic;
   signal XLXN_129 : std_logic;
   signal XLXN_130 : std_logic;
   signal XLXN_131 : std_logic;
   signal XLXN_132 : std_logic;
   signal XLXN_133 : std_logic;
   signal XLXN_134 : std_logic;
   signal XLXN_135 : std_logic;
   signal XLXN_144 : std_logic;
   signal XLXN_145 : std_logic;
   signal XLXN_147 : std_logic;
   signal XLXN_148 : std_logic;
   signal XLXN_149 : std_logic;
   signal XLXN_150 : std_logic;
   signal XLXN_151 : std_logic;
   signal XLXN_153 : std_logic;
   signal XLXN_154 : std_logic;
   signal XLXN_158 : std_logic;
   signal XLXN_201 : std_logic;
   signal XLXN_226 : std_logic;
   signal XLXN_246 : std_logic;
   component M2_1_HXILINX_alu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component M2_1E_HXILINX_alu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component NOR12_HXILINX_alu
      port ( I0  : in    std_logic; 
             I1  : in    std_logic; 
             I10 : in    std_logic; 
             I11 : in    std_logic; 
             I2  : in    std_logic; 
             I3  : in    std_logic; 
             I4  : in    std_logic; 
             I5  : in    std_logic; 
             I6  : in    std_logic; 
             I7  : in    std_logic; 
             I8  : in    std_logic; 
             I9  : in    std_logic; 
             O   : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_747";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_748";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_749";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_750";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_751";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_752";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_753";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_754";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_755";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_756";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_757";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_758";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_759";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_760";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_761";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_762";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_763";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_764";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_765";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_766";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_767";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_768";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_769";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_770";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_771";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_772";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_773";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_774";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_775";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_776";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_777";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_778";
   attribute HU_SET of XLXI_65 : label is "XLXI_65_779";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_780";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_781";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_782";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_783";
   attribute HU_SET of XLXI_70 : label is "XLXI_70_784";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_785";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_786";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_787";
   attribute HU_SET of XLXI_74 : label is "XLXI_74_788";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_789";
   attribute HU_SET of XLXI_76 : label is "XLXI_76_790";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_791";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_792";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_793";
   attribute HU_SET of XLXI_80 : label is "XLXI_80_794";
   attribute HU_SET of XLXI_230 : label is "XLXI_230_795";
   attribute HU_SET of XLXI_232 : label is "XLXI_232_796";
   attribute HU_SET of XLXI_233 : label is "XLXI_233_797";
   attribute HU_SET of XLXI_234 : label is "XLXI_234_798";
   attribute HU_SET of XLXI_235 : label is "XLXI_235_799";
   attribute HU_SET of XLXI_236 : label is "XLXI_236_800";
   attribute HU_SET of XLXI_237 : label is "XLXI_237_801";
   attribute HU_SET of XLXI_238 : label is "XLXI_238_802";
   attribute HU_SET of XLXI_239 : label is "XLXI_239_803";
   attribute HU_SET of XLXI_240 : label is "XLXI_240_804";
   attribute HU_SET of XLXI_241 : label is "XLXI_241_805";
   attribute HU_SET of XLXI_242 : label is "XLXI_242_806";
   attribute HU_SET of XLXI_243 : label is "XLXI_243_807";
   attribute HU_SET of XLXI_244 : label is "XLXI_244_808";
   attribute HU_SET of XLXI_245 : label is "XLXI_245_809";
   attribute HU_SET of XLXI_246 : label is "XLXI_246_810";
   attribute HU_SET of XLXI_247 : label is "XLXI_247_811";
begin
   XLXI_1 : M2_1_HXILINX_alu
      port map (D0=>I(0),
                D1=>I(1),
                S0=>S(0),
                O=>XLXN_56);
   
   XLXI_2 : M2_1_HXILINX_alu
      port map (D0=>I(1),
                D1=>I(2),
                S0=>S(0),
                O=>XLXN_57);
   
   XLXI_3 : M2_1_HXILINX_alu
      port map (D0=>I(2),
                D1=>I(3),
                S0=>S(0),
                O=>XLXN_87);
   
   XLXI_4 : M2_1_HXILINX_alu
      port map (D0=>I(3),
                D1=>I(4),
                S0=>S(0),
                O=>XLXN_86);
   
   XLXI_5 : M2_1_HXILINX_alu
      port map (D0=>I(4),
                D1=>I(5),
                S0=>S(0),
                O=>XLXN_85);
   
   XLXI_6 : M2_1_HXILINX_alu
      port map (D0=>I(5),
                D1=>I(6),
                S0=>S(0),
                O=>XLXN_84);
   
   XLXI_7 : M2_1_HXILINX_alu
      port map (D0=>I(6),
                D1=>I(7),
                S0=>S(0),
                O=>XLXN_83);
   
   XLXI_8 : M2_1_HXILINX_alu
      port map (D0=>I(7),
                D1=>I(8),
                S0=>S(0),
                O=>XLXN_82);
   
   XLXI_9 : M2_1_HXILINX_alu
      port map (D0=>I(8),
                D1=>I(9),
                S0=>S(0),
                O=>XLXN_81);
   
   XLXI_10 : M2_1_HXILINX_alu
      port map (D0=>I(9),
                D1=>I(10),
                S0=>S(0),
                O=>XLXN_80);
   
   XLXI_11 : M2_1_HXILINX_alu
      port map (D0=>I(10),
                D1=>I(11),
                S0=>S(0),
                O=>XLXN_78);
   
   XLXI_12 : M2_1_HXILINX_alu
      port map (D0=>I(10),
                D1=>I(12),
                S0=>S(0),
                O=>XLXN_77);
   
   XLXI_13 : M2_1_HXILINX_alu
      port map (D0=>I(12),
                D1=>I(13),
                S0=>S(0),
                O=>XLXN_76);
   
   XLXI_14 : M2_1_HXILINX_alu
      port map (D0=>I(13),
                D1=>I(14),
                S0=>S(0),
                O=>XLXN_75);
   
   XLXI_15 : M2_1_HXILINX_alu
      port map (D0=>I(14),
                D1=>I(15),
                S0=>S(0),
                O=>XLXN_74);
   
   XLXI_16 : M2_1_HXILINX_alu
      port map (D0=>I(15),
                D1=>XLXN_39,
                S0=>S(0),
                O=>XLXN_73);
   
   XLXI_17 : M2_1_HXILINX_alu
      port map (D0=>XLXN_56,
                D1=>XLXN_87,
                S0=>S(1),
                O=>XLXN_88);
   
   XLXI_18 : M2_1_HXILINX_alu
      port map (D0=>XLXN_57,
                D1=>XLXN_86,
                S0=>S(1),
                O=>XLXN_89);
   
   XLXI_19 : M2_1_HXILINX_alu
      port map (D0=>XLXN_87,
                D1=>XLXN_85,
                S0=>S(1),
                O=>XLXN_90);
   
   XLXI_20 : M2_1_HXILINX_alu
      port map (D0=>XLXN_86,
                D1=>XLXN_84,
                S0=>S(1),
                O=>XLXN_91);
   
   XLXI_21 : M2_1_HXILINX_alu
      port map (D0=>XLXN_85,
                D1=>XLXN_83,
                S0=>S(1),
                O=>XLXN_135);
   
   XLXI_22 : M2_1_HXILINX_alu
      port map (D0=>XLXN_84,
                D1=>XLXN_82,
                S0=>S(1),
                O=>XLXN_134);
   
   XLXI_23 : M2_1_HXILINX_alu
      port map (D0=>XLXN_83,
                D1=>XLXN_81,
                S0=>S(1),
                O=>XLXN_133);
   
   XLXI_24 : M2_1_HXILINX_alu
      port map (D0=>XLXN_82,
                D1=>XLXN_80,
                S0=>S(1),
                O=>XLXN_132);
   
   XLXI_25 : M2_1_HXILINX_alu
      port map (D0=>XLXN_81,
                D1=>XLXN_78,
                S0=>S(1),
                O=>XLXN_131);
   
   XLXI_26 : M2_1_HXILINX_alu
      port map (D0=>XLXN_80,
                D1=>XLXN_77,
                S0=>S(1),
                O=>XLXN_130);
   
   XLXI_27 : M2_1_HXILINX_alu
      port map (D0=>XLXN_78,
                D1=>XLXN_76,
                S0=>S(1),
                O=>XLXN_129);
   
   XLXI_28 : M2_1_HXILINX_alu
      port map (D0=>XLXN_77,
                D1=>XLXN_75,
                S0=>S(1),
                O=>XLXN_128);
   
   XLXI_29 : M2_1_HXILINX_alu
      port map (D0=>XLXN_76,
                D1=>XLXN_74,
                S0=>S(1),
                O=>XLXN_127);
   
   XLXI_30 : M2_1_HXILINX_alu
      port map (D0=>XLXN_75,
                D1=>XLXN_73,
                S0=>S(1),
                O=>XLXN_126);
   
   XLXI_31 : M2_1_HXILINX_alu
      port map (D0=>XLXN_74,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_125);
   
   XLXI_32 : M2_1_HXILINX_alu
      port map (D0=>XLXN_73,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_124);
   
   XLXI_65 : M2_1_HXILINX_alu
      port map (D0=>XLXN_88,
                D1=>XLXN_135,
                S0=>S(2),
                O=>XLXN_123);
   
   XLXI_66 : M2_1_HXILINX_alu
      port map (D0=>XLXN_89,
                D1=>XLXN_134,
                S0=>S(2),
                O=>XLXN_122);
   
   XLXI_67 : M2_1_HXILINX_alu
      port map (D0=>XLXN_90,
                D1=>XLXN_133,
                S0=>S(2),
                O=>XLXN_121);
   
   XLXI_68 : M2_1_HXILINX_alu
      port map (D0=>XLXN_91,
                D1=>XLXN_132,
                S0=>S(2),
                O=>XLXN_120);
   
   XLXI_69 : M2_1_HXILINX_alu
      port map (D0=>XLXN_135,
                D1=>XLXN_131,
                S0=>S(2),
                O=>XLXN_118);
   
   XLXI_70 : M2_1_HXILINX_alu
      port map (D0=>XLXN_134,
                D1=>XLXN_130,
                S0=>S(2),
                O=>XLXN_117);
   
   XLXI_71 : M2_1_HXILINX_alu
      port map (D0=>XLXN_133,
                D1=>XLXN_129,
                S0=>S(2),
                O=>XLXN_116);
   
   XLXI_72 : M2_1_HXILINX_alu
      port map (D0=>XLXN_132,
                D1=>XLXN_128,
                S0=>S(2),
                O=>XLXN_144);
   
   XLXI_73 : M2_1_HXILINX_alu
      port map (D0=>XLXN_131,
                D1=>XLXN_127,
                S0=>S(2),
                O=>XLXN_154);
   
   XLXI_74 : M2_1_HXILINX_alu
      port map (D0=>XLXN_130,
                D1=>XLXN_126,
                S0=>S(2),
                O=>XLXN_153);
   
   XLXI_75 : M2_1_HXILINX_alu
      port map (D0=>XLXN_129,
                D1=>XLXN_125,
                S0=>S(2),
                O=>XLXN_151);
   
   XLXI_76 : M2_1_HXILINX_alu
      port map (D0=>XLXN_128,
                D1=>XLXN_124,
                S0=>S(2),
                O=>XLXN_150);
   
   XLXI_77 : M2_1_HXILINX_alu
      port map (D0=>XLXN_127,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_149);
   
   XLXI_78 : M2_1_HXILINX_alu
      port map (D0=>XLXN_126,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_148);
   
   XLXI_79 : M2_1_HXILINX_alu
      port map (D0=>XLXN_125,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_147);
   
   XLXI_80 : M2_1_HXILINX_alu
      port map (D0=>XLXN_124,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_145);
   
   XLXI_225 : GND
      port map (G=>XLXN_39);
   
   XLXI_226 : GND
      port map (G=>XLXN_158);
   
   XLXI_227 : GND
      port map (G=>XLXN_201);
   
   XLXI_228 : GND
      port map (G=>XLXN_226);
   
   XLXI_230 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_123,
                D1=>XLXN_154,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(0));
   
   XLXI_232 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_121,
                D1=>XLXN_151,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(2));
   
   XLXI_233 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_120,
                D1=>XLXN_150,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(3));
   
   XLXI_234 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_118,
                D1=>XLXN_149,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(4));
   
   XLXI_235 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_117,
                D1=>XLXN_148,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(5));
   
   XLXI_236 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_116,
                D1=>XLXN_147,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(6));
   
   XLXI_237 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_144,
                D1=>XLXN_145,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(7));
   
   XLXI_238 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_154,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(8));
   
   XLXI_239 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_153,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(9));
   
   XLXI_240 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_151,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(10));
   
   XLXI_241 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_150,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(11));
   
   XLXI_242 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_149,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(12));
   
   XLXI_243 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_148,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(13));
   
   XLXI_244 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_147,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(14));
   
   XLXI_245 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_145,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(15));
   
   XLXI_246 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_122,
                D1=>XLXN_153,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(1));
   
   XLXI_247 : NOR12_HXILINX_alu
      port map (I0=>S(15),
                I1=>S(14),
                I2=>S(13),
                I3=>S(12),
                I4=>S(11),
                I5=>S(10),
                I6=>S(9),
                I7=>S(8),
                I8=>S(7),
                I9=>S(6),
                I10=>S(5),
                I11=>S(4),
                O=>XLXN_246);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lshift_MUSER_alu is
   port ( I : in    std_logic_vector (15 downto 0); 
          S : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end lshift_MUSER_alu;

architecture BEHAVIORAL of lshift_MUSER_alu is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_39  : std_logic;
   signal XLXN_56  : std_logic;
   signal XLXN_57  : std_logic;
   signal XLXN_73  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_75  : std_logic;
   signal XLXN_76  : std_logic;
   signal XLXN_77  : std_logic;
   signal XLXN_78  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_81  : std_logic;
   signal XLXN_82  : std_logic;
   signal XLXN_83  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_85  : std_logic;
   signal XLXN_86  : std_logic;
   signal XLXN_87  : std_logic;
   signal XLXN_88  : std_logic;
   signal XLXN_89  : std_logic;
   signal XLXN_90  : std_logic;
   signal XLXN_91  : std_logic;
   signal XLXN_116 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_118 : std_logic;
   signal XLXN_120 : std_logic;
   signal XLXN_121 : std_logic;
   signal XLXN_122 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_125 : std_logic;
   signal XLXN_126 : std_logic;
   signal XLXN_127 : std_logic;
   signal XLXN_128 : std_logic;
   signal XLXN_129 : std_logic;
   signal XLXN_130 : std_logic;
   signal XLXN_131 : std_logic;
   signal XLXN_132 : std_logic;
   signal XLXN_133 : std_logic;
   signal XLXN_134 : std_logic;
   signal XLXN_135 : std_logic;
   signal XLXN_144 : std_logic;
   signal XLXN_145 : std_logic;
   signal XLXN_147 : std_logic;
   signal XLXN_148 : std_logic;
   signal XLXN_149 : std_logic;
   signal XLXN_150 : std_logic;
   signal XLXN_151 : std_logic;
   signal XLXN_153 : std_logic;
   signal XLXN_154 : std_logic;
   signal XLXN_158 : std_logic;
   signal XLXN_201 : std_logic;
   signal XLXN_226 : std_logic;
   signal XLXN_246 : std_logic;
   component M2_1_HXILINX_alu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component M2_1E_HXILINX_alu
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component NOR12_HXILINX_alu
      port ( I0  : in    std_logic; 
             I1  : in    std_logic; 
             I10 : in    std_logic; 
             I11 : in    std_logic; 
             I2  : in    std_logic; 
             I3  : in    std_logic; 
             I4  : in    std_logic; 
             I5  : in    std_logic; 
             I6  : in    std_logic; 
             I7  : in    std_logic; 
             I8  : in    std_logic; 
             I9  : in    std_logic; 
             O   : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_812";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_813";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_814";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_815";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_816";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_817";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_818";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_819";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_820";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_821";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_822";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_823";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_824";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_825";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_826";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_827";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_828";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_829";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_830";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_831";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_832";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_833";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_834";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_835";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_836";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_837";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_838";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_839";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_840";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_841";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_842";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_843";
   attribute HU_SET of XLXI_65 : label is "XLXI_65_844";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_845";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_846";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_847";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_848";
   attribute HU_SET of XLXI_70 : label is "XLXI_70_849";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_850";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_851";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_852";
   attribute HU_SET of XLXI_74 : label is "XLXI_74_853";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_854";
   attribute HU_SET of XLXI_76 : label is "XLXI_76_855";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_856";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_857";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_858";
   attribute HU_SET of XLXI_80 : label is "XLXI_80_859";
   attribute HU_SET of XLXI_230 : label is "XLXI_230_860";
   attribute HU_SET of XLXI_232 : label is "XLXI_232_861";
   attribute HU_SET of XLXI_233 : label is "XLXI_233_862";
   attribute HU_SET of XLXI_234 : label is "XLXI_234_863";
   attribute HU_SET of XLXI_235 : label is "XLXI_235_864";
   attribute HU_SET of XLXI_236 : label is "XLXI_236_865";
   attribute HU_SET of XLXI_237 : label is "XLXI_237_866";
   attribute HU_SET of XLXI_238 : label is "XLXI_238_867";
   attribute HU_SET of XLXI_239 : label is "XLXI_239_868";
   attribute HU_SET of XLXI_240 : label is "XLXI_240_869";
   attribute HU_SET of XLXI_241 : label is "XLXI_241_870";
   attribute HU_SET of XLXI_242 : label is "XLXI_242_871";
   attribute HU_SET of XLXI_243 : label is "XLXI_243_872";
   attribute HU_SET of XLXI_244 : label is "XLXI_244_873";
   attribute HU_SET of XLXI_245 : label is "XLXI_245_874";
   attribute HU_SET of XLXI_246 : label is "XLXI_246_875";
   attribute HU_SET of XLXI_247 : label is "XLXI_247_876";
begin
   XLXI_1 : M2_1_HXILINX_alu
      port map (D0=>I(15),
                D1=>I(14),
                S0=>S(0),
                O=>XLXN_56);
   
   XLXI_2 : M2_1_HXILINX_alu
      port map (D0=>I(14),
                D1=>I(13),
                S0=>S(0),
                O=>XLXN_57);
   
   XLXI_3 : M2_1_HXILINX_alu
      port map (D0=>I(13),
                D1=>I(12),
                S0=>S(0),
                O=>XLXN_87);
   
   XLXI_4 : M2_1_HXILINX_alu
      port map (D0=>I(12),
                D1=>I(11),
                S0=>S(0),
                O=>XLXN_86);
   
   XLXI_5 : M2_1_HXILINX_alu
      port map (D0=>I(11),
                D1=>I(10),
                S0=>S(0),
                O=>XLXN_85);
   
   XLXI_6 : M2_1_HXILINX_alu
      port map (D0=>I(10),
                D1=>I(9),
                S0=>S(0),
                O=>XLXN_84);
   
   XLXI_7 : M2_1_HXILINX_alu
      port map (D0=>I(9),
                D1=>I(8),
                S0=>S(0),
                O=>XLXN_83);
   
   XLXI_8 : M2_1_HXILINX_alu
      port map (D0=>I(8),
                D1=>I(7),
                S0=>S(0),
                O=>XLXN_82);
   
   XLXI_9 : M2_1_HXILINX_alu
      port map (D0=>I(7),
                D1=>I(6),
                S0=>S(0),
                O=>XLXN_81);
   
   XLXI_10 : M2_1_HXILINX_alu
      port map (D0=>I(6),
                D1=>I(5),
                S0=>S(0),
                O=>XLXN_80);
   
   XLXI_11 : M2_1_HXILINX_alu
      port map (D0=>I(5),
                D1=>I(4),
                S0=>S(0),
                O=>XLXN_78);
   
   XLXI_12 : M2_1_HXILINX_alu
      port map (D0=>I(5),
                D1=>I(3),
                S0=>S(0),
                O=>XLXN_77);
   
   XLXI_13 : M2_1_HXILINX_alu
      port map (D0=>I(3),
                D1=>I(2),
                S0=>S(0),
                O=>XLXN_76);
   
   XLXI_14 : M2_1_HXILINX_alu
      port map (D0=>I(2),
                D1=>I(1),
                S0=>S(0),
                O=>XLXN_75);
   
   XLXI_15 : M2_1_HXILINX_alu
      port map (D0=>I(1),
                D1=>I(0),
                S0=>S(0),
                O=>XLXN_74);
   
   XLXI_16 : M2_1_HXILINX_alu
      port map (D0=>I(0),
                D1=>XLXN_39,
                S0=>S(0),
                O=>XLXN_73);
   
   XLXI_17 : M2_1_HXILINX_alu
      port map (D0=>XLXN_56,
                D1=>XLXN_87,
                S0=>S(1),
                O=>XLXN_88);
   
   XLXI_18 : M2_1_HXILINX_alu
      port map (D0=>XLXN_57,
                D1=>XLXN_86,
                S0=>S(1),
                O=>XLXN_89);
   
   XLXI_19 : M2_1_HXILINX_alu
      port map (D0=>XLXN_87,
                D1=>XLXN_85,
                S0=>S(1),
                O=>XLXN_90);
   
   XLXI_20 : M2_1_HXILINX_alu
      port map (D0=>XLXN_86,
                D1=>XLXN_84,
                S0=>S(1),
                O=>XLXN_91);
   
   XLXI_21 : M2_1_HXILINX_alu
      port map (D0=>XLXN_85,
                D1=>XLXN_83,
                S0=>S(1),
                O=>XLXN_135);
   
   XLXI_22 : M2_1_HXILINX_alu
      port map (D0=>XLXN_84,
                D1=>XLXN_82,
                S0=>S(1),
                O=>XLXN_134);
   
   XLXI_23 : M2_1_HXILINX_alu
      port map (D0=>XLXN_83,
                D1=>XLXN_81,
                S0=>S(1),
                O=>XLXN_133);
   
   XLXI_24 : M2_1_HXILINX_alu
      port map (D0=>XLXN_82,
                D1=>XLXN_80,
                S0=>S(1),
                O=>XLXN_132);
   
   XLXI_25 : M2_1_HXILINX_alu
      port map (D0=>XLXN_81,
                D1=>XLXN_78,
                S0=>S(1),
                O=>XLXN_131);
   
   XLXI_26 : M2_1_HXILINX_alu
      port map (D0=>XLXN_80,
                D1=>XLXN_77,
                S0=>S(1),
                O=>XLXN_130);
   
   XLXI_27 : M2_1_HXILINX_alu
      port map (D0=>XLXN_78,
                D1=>XLXN_76,
                S0=>S(1),
                O=>XLXN_129);
   
   XLXI_28 : M2_1_HXILINX_alu
      port map (D0=>XLXN_77,
                D1=>XLXN_75,
                S0=>S(1),
                O=>XLXN_128);
   
   XLXI_29 : M2_1_HXILINX_alu
      port map (D0=>XLXN_76,
                D1=>XLXN_74,
                S0=>S(1),
                O=>XLXN_127);
   
   XLXI_30 : M2_1_HXILINX_alu
      port map (D0=>XLXN_75,
                D1=>XLXN_73,
                S0=>S(1),
                O=>XLXN_126);
   
   XLXI_31 : M2_1_HXILINX_alu
      port map (D0=>XLXN_74,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_125);
   
   XLXI_32 : M2_1_HXILINX_alu
      port map (D0=>XLXN_73,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_124);
   
   XLXI_65 : M2_1_HXILINX_alu
      port map (D0=>XLXN_88,
                D1=>XLXN_135,
                S0=>S(2),
                O=>XLXN_123);
   
   XLXI_66 : M2_1_HXILINX_alu
      port map (D0=>XLXN_89,
                D1=>XLXN_134,
                S0=>S(2),
                O=>XLXN_122);
   
   XLXI_67 : M2_1_HXILINX_alu
      port map (D0=>XLXN_90,
                D1=>XLXN_133,
                S0=>S(2),
                O=>XLXN_121);
   
   XLXI_68 : M2_1_HXILINX_alu
      port map (D0=>XLXN_91,
                D1=>XLXN_132,
                S0=>S(2),
                O=>XLXN_120);
   
   XLXI_69 : M2_1_HXILINX_alu
      port map (D0=>XLXN_135,
                D1=>XLXN_131,
                S0=>S(2),
                O=>XLXN_118);
   
   XLXI_70 : M2_1_HXILINX_alu
      port map (D0=>XLXN_134,
                D1=>XLXN_130,
                S0=>S(2),
                O=>XLXN_117);
   
   XLXI_71 : M2_1_HXILINX_alu
      port map (D0=>XLXN_133,
                D1=>XLXN_129,
                S0=>S(2),
                O=>XLXN_116);
   
   XLXI_72 : M2_1_HXILINX_alu
      port map (D0=>XLXN_132,
                D1=>XLXN_128,
                S0=>S(2),
                O=>XLXN_144);
   
   XLXI_73 : M2_1_HXILINX_alu
      port map (D0=>XLXN_131,
                D1=>XLXN_127,
                S0=>S(2),
                O=>XLXN_154);
   
   XLXI_74 : M2_1_HXILINX_alu
      port map (D0=>XLXN_130,
                D1=>XLXN_126,
                S0=>S(2),
                O=>XLXN_153);
   
   XLXI_75 : M2_1_HXILINX_alu
      port map (D0=>XLXN_129,
                D1=>XLXN_125,
                S0=>S(2),
                O=>XLXN_151);
   
   XLXI_76 : M2_1_HXILINX_alu
      port map (D0=>XLXN_128,
                D1=>XLXN_124,
                S0=>S(2),
                O=>XLXN_150);
   
   XLXI_77 : M2_1_HXILINX_alu
      port map (D0=>XLXN_127,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_149);
   
   XLXI_78 : M2_1_HXILINX_alu
      port map (D0=>XLXN_126,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_148);
   
   XLXI_79 : M2_1_HXILINX_alu
      port map (D0=>XLXN_125,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_147);
   
   XLXI_80 : M2_1_HXILINX_alu
      port map (D0=>XLXN_124,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_145);
   
   XLXI_225 : GND
      port map (G=>XLXN_39);
   
   XLXI_226 : GND
      port map (G=>XLXN_158);
   
   XLXI_227 : GND
      port map (G=>XLXN_201);
   
   XLXI_228 : GND
      port map (G=>XLXN_226);
   
   XLXI_230 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_123,
                D1=>XLXN_154,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(15));
   
   XLXI_232 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_121,
                D1=>XLXN_151,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(13));
   
   XLXI_233 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_120,
                D1=>XLXN_150,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(12));
   
   XLXI_234 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_118,
                D1=>XLXN_149,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(11));
   
   XLXI_235 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_117,
                D1=>XLXN_148,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(10));
   
   XLXI_236 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_116,
                D1=>XLXN_147,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(9));
   
   XLXI_237 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_144,
                D1=>XLXN_145,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(8));
   
   XLXI_238 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_154,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(7));
   
   XLXI_239 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_153,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(6));
   
   XLXI_240 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_151,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(5));
   
   XLXI_241 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_150,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(4));
   
   XLXI_242 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_149,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(3));
   
   XLXI_243 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_148,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(2));
   
   XLXI_244 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_147,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(1));
   
   XLXI_245 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_145,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(0));
   
   XLXI_246 : M2_1E_HXILINX_alu
      port map (D0=>XLXN_122,
                D1=>XLXN_153,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(14));
   
   XLXI_247 : NOR12_HXILINX_alu
      port map (I0=>S(15),
                I1=>S(14),
                I2=>S(13),
                I3=>S(12),
                I4=>S(11),
                I5=>S(10),
                I6=>S(9),
                I7=>S(8),
                I8=>S(7),
                I9=>S(6),
                I10=>S(5),
                I11=>S(4),
                O=>XLXN_246);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity alu is
   port ( A  : in    std_logic_vector (15 downto 0); 
          B  : in    std_logic_vector (15 downto 0); 
          OP : in    std_logic_vector (3 downto 0); 
          F  : out   std_logic_vector (15 downto 0); 
          O  : out   std_logic_vector (15 downto 0));
end alu;

architecture BEHAVIORAL of alu is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal M        : std_logic_vector (2 downto 0);
   signal SIA      : std_logic_vector (15 downto 0);
   signal SIB      : std_logic_vector (15 downto 0);
   signal XLXN_13  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_37  : std_logic_vector (15 downto 0);
   signal XLXN_38  : std_logic_vector (15 downto 0);
   signal XLXN_39  : std_logic;
   signal XLXN_53  : std_logic_vector (15 downto 0);
   signal XLXN_54  : std_logic_vector (15 downto 0);
   signal XLXN_55  : std_logic_vector (15 downto 0);
   signal XLXN_56  : std_logic_vector (15 downto 0);
   signal XLXN_57  : std_logic_vector (15 downto 0);
   signal XLXN_58  : std_logic_vector (15 downto 0);
   signal XLXN_65  : std_logic;
   signal XLXN_169 : std_logic;
   signal XLXN_170 : std_logic;
   signal F_DUMMY  : std_logic_vector (15 downto 0);
   signal O_DUMMY  : std_logic_vector (15 downto 0);
   component ADSU16_HXILINX_alu
      port ( A   : in    std_logic_vector (15 downto 0); 
             ADD : in    std_logic; 
             B   : in    std_logic_vector (15 downto 0); 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             OFL : out   std_logic; 
             S   : out   std_logic_vector (15 downto 0));
   end component;
   
   component mux2x1x16e_MUSER_alu
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             E  : in    std_logic; 
             O  : out   std_logic_vector (15 downto 0); 
             S  : in    std_logic);
   end component;
   
   component mux4x1x16t_MUSER_alu
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
   component lshift_MUSER_alu
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (15 downto 0); 
             S : in    std_logic_vector (15 downto 0));
   end component;
   
   component logic_MUSER_alu
      port ( A : in    std_logic_vector (15 downto 0); 
             B : in    std_logic_vector (15 downto 0); 
             M : in    std_logic_vector (2 downto 0); 
             O : out   std_logic_vector (15 downto 0));
   end component;
   
   component mult_MUSER_alu
      port ( A      : in    std_logic_vector (15 downto 0); 
             B      : in    std_logic_vector (15 downto 0); 
             H      : out   std_logic_vector (15 downto 0); 
             L      : out   std_logic_vector (15 downto 0); 
             Signed : in    std_logic);
   end component;
   
   component rshift_MUSER_alu
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (15 downto 0); 
             S : in    std_logic_vector (15 downto 0));
   end component;
   
   component COMPM16_HXILINX_alu
      port ( A  : in    std_logic_vector (15 downto 0); 
             B  : in    std_logic_vector (15 downto 0); 
             GT : out   std_logic; 
             LT : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component COMP16_HXILINX_alu
      port ( A  : in    std_logic_vector (15 downto 0); 
             B  : in    std_logic_vector (15 downto 0); 
             EQ : out   std_logic);
   end component;
   
   component NOR16_HXILINX_alu
      port ( I0  : in    std_logic; 
             I1  : in    std_logic; 
             I10 : in    std_logic; 
             I11 : in    std_logic; 
             I12 : in    std_logic; 
             I13 : in    std_logic; 
             I14 : in    std_logic; 
             I15 : in    std_logic; 
             I2  : in    std_logic; 
             I3  : in    std_logic; 
             I4  : in    std_logic; 
             I5  : in    std_logic; 
             I6  : in    std_logic; 
             I7  : in    std_logic; 
             I8  : in    std_logic; 
             I9  : in    std_logic; 
             O   : out   std_logic);
   end component;
   
   component NOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR2 : component is "BLACK_BOX";
   
   component XNOR8_HXILINX_alu
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             I7 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component XNOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XNOR2 : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of Adder_Subtracter : label is "Adder_Subtracter_877";
   attribute HU_SET of Signed_Comparator : label is "Signed_Comparator_879";
   attribute HU_SET of Unsigned_Comparator : label is "Unsigned_Comparator_878";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_880";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_881";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_882";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_883";
begin
   F(15 downto 0) <= F_DUMMY(15 downto 0);
   O(15 downto 0) <= O_DUMMY(15 downto 0);
   Adder_Subtracter : ADSU16_HXILINX_alu
      port map (A(15 downto 0)=>A(15 downto 0),
                ADD=>XLXN_13,
                B(15 downto 0)=>B(15 downto 0),
                CI=>OP(0),
                CO=>XLXN_19,
                OFL=>F_DUMMY(11),
                S(15 downto 0)=>XLXN_55(15 downto 0));
   
   Arithmetic_Logic_Selector : mux2x1x16e_MUSER_alu
      port map (D0(15 downto 0)=>XLXN_54(15 downto 0),
                D1(15 downto 0)=>XLXN_53(15 downto 0),
                E=>XLXN_65,
                S=>OP(3),
                O(15 downto 0)=>O_DUMMY(15 downto 0));
   
   Arithmetic_Mode_Selector : mux4x1x16t_MUSER_alu
      port map (D0(15 downto 0)=>XLXN_55(15 downto 0),
                D1(15 downto 0)=>XLXN_56(15 downto 0),
                D2(15 downto 0)=>XLXN_57(15 downto 0),
                D3(15 downto 0)=>XLXN_58(15 downto 0),
                S0=>OP(1),
                S1=>OP(2),
                O(15 downto 0)=>XLXN_54(15 downto 0));
   
   Left_Shift : lshift_MUSER_alu
      port map (I(15 downto 0)=>A(15 downto 0),
                S(15 downto 0)=>B(15 downto 0),
                O(15 downto 0)=>XLXN_38(15 downto 0));
   
   Logic_Unit : logic_MUSER_alu
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                M(2 downto 0)=>M(2 downto 0),
                O(15 downto 0)=>XLXN_53(15 downto 0));
   
   Multiplier : mult_MUSER_alu
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                Signed=>OP(0),
                H(15 downto 0)=>XLXN_58(15 downto 0),
                L(15 downto 0)=>XLXN_57(15 downto 0));
   
   Right_Shift : rshift_MUSER_alu
      port map (I(15 downto 0)=>A(15 downto 0),
                S(15 downto 0)=>B(15 downto 0),
                O(15 downto 0)=>XLXN_37(15 downto 0));
   
   Shift_Direction_Selector : mux2x1x16e_MUSER_alu
      port map (D0(15 downto 0)=>XLXN_37(15 downto 0),
                D1(15 downto 0)=>XLXN_38(15 downto 0),
                E=>XLXN_39,
                S=>OP(0),
                O(15 downto 0)=>XLXN_56(15 downto 0));
   
   Signed_Comparator : COMPM16_HXILINX_alu
      port map (A(15 downto 0)=>SIA(15 downto 0),
                B(15 downto 0)=>SIB(15 downto 0),
                GT=>F_DUMMY(2),
                LT=>F_DUMMY(3));
   
   Unsigned_Comparator : COMPM16_HXILINX_alu
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                GT=>F_DUMMY(0),
                LT=>F_DUMMY(1));
   
   XLXI_2 : INV
      port map (I=>OP(0),
                O=>XLXN_13);
   
   XLXI_5 : XOR2
      port map (I0=>OP(0),
                I1=>XLXN_19,
                O=>F_DUMMY(10));
   
   XLXI_10 : BUF
      port map (I=>OP(0),
                O=>M(0));
   
   XLXI_11 : BUF
      port map (I=>OP(1),
                O=>M(1));
   
   XLXI_12 : BUF
      port map (I=>OP(2),
                O=>M(2));
   
   XLXI_21 : VCC
      port map (P=>XLXN_39);
   
   XLXI_28 : VCC
      port map (P=>XLXN_65);
   
   XLXI_33 : INV
      port map (I=>A(15),
                O=>SIA(15));
   
   XLXI_34 : BUF
      port map (I=>A(1),
                O=>SIA(1));
   
   XLXI_35 : BUF
      port map (I=>A(2),
                O=>SIA(2));
   
   XLXI_36 : BUF
      port map (I=>A(3),
                O=>SIA(3));
   
   XLXI_37 : BUF
      port map (I=>A(4),
                O=>SIA(4));
   
   XLXI_38 : BUF
      port map (I=>A(5),
                O=>SIA(5));
   
   XLXI_39 : BUF
      port map (I=>A(6),
                O=>SIA(6));
   
   XLXI_40 : BUF
      port map (I=>A(7),
                O=>SIA(7));
   
   XLXI_41 : BUF
      port map (I=>A(8),
                O=>SIA(8));
   
   XLXI_42 : BUF
      port map (I=>A(9),
                O=>SIA(9));
   
   XLXI_43 : BUF
      port map (I=>A(10),
                O=>SIA(10));
   
   XLXI_44 : BUF
      port map (I=>A(11),
                O=>SIA(11));
   
   XLXI_45 : BUF
      port map (I=>A(12),
                O=>SIA(12));
   
   XLXI_46 : BUF
      port map (I=>A(13),
                O=>SIA(13));
   
   XLXI_47 : BUF
      port map (I=>A(14),
                O=>SIA(14));
   
   XLXI_50 : BUF
      port map (I=>A(0),
                O=>SIA(0));
   
   XLXI_51 : BUF
      port map (I=>B(1),
                O=>SIB(1));
   
   XLXI_52 : BUF
      port map (I=>B(2),
                O=>SIB(2));
   
   XLXI_53 : BUF
      port map (I=>B(3),
                O=>SIB(3));
   
   XLXI_54 : BUF
      port map (I=>B(4),
                O=>SIB(4));
   
   XLXI_55 : BUF
      port map (I=>B(5),
                O=>SIB(5));
   
   XLXI_56 : BUF
      port map (I=>B(6),
                O=>SIB(6));
   
   XLXI_57 : BUF
      port map (I=>B(7),
                O=>SIB(7));
   
   XLXI_58 : BUF
      port map (I=>B(8),
                O=>SIB(8));
   
   XLXI_59 : BUF
      port map (I=>B(9),
                O=>SIB(9));
   
   XLXI_60 : BUF
      port map (I=>B(10),
                O=>SIB(10));
   
   XLXI_61 : BUF
      port map (I=>B(11),
                O=>SIB(11));
   
   XLXI_62 : BUF
      port map (I=>B(12),
                O=>SIB(12));
   
   XLXI_63 : BUF
      port map (I=>B(13),
                O=>SIB(13));
   
   XLXI_64 : BUF
      port map (I=>B(14),
                O=>SIB(14));
   
   XLXI_65 : INV
      port map (I=>B(15),
                O=>SIB(15));
   
   XLXI_66 : BUF
      port map (I=>B(0),
                O=>SIB(0));
   
   XLXI_67 : COMP16_HXILINX_alu
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                EQ=>F_DUMMY(4));
   
   XLXI_68 : NOR16_HXILINX_alu
      port map (I0=>O_DUMMY(0),
                I1=>O_DUMMY(1),
                I2=>O_DUMMY(2),
                I3=>O_DUMMY(3),
                I4=>O_DUMMY(4),
                I5=>O_DUMMY(5),
                I6=>O_DUMMY(6),
                I7=>O_DUMMY(7),
                I8=>O_DUMMY(8),
                I9=>O_DUMMY(9),
                I10=>O_DUMMY(10),
                I11=>O_DUMMY(11),
                I12=>O_DUMMY(12),
                I13=>O_DUMMY(13),
                I14=>O_DUMMY(14),
                I15=>O_DUMMY(15),
                O=>F_DUMMY(5));
   
   XLXI_69 : NOR2
      port map (I0=>F_DUMMY(5),
                I1=>O_DUMMY(15),
                O=>F_DUMMY(7));
   
   XLXI_70 : INV
      port map (I=>O_DUMMY(0),
                O=>F_DUMMY(8));
   
   XLXI_72 : XNOR8_HXILINX_alu
      port map (I0=>O_DUMMY(0),
                I1=>O_DUMMY(1),
                I2=>O_DUMMY(2),
                I3=>O_DUMMY(3),
                I4=>O_DUMMY(4),
                I5=>O_DUMMY(5),
                I6=>O_DUMMY(6),
                I7=>O_DUMMY(7),
                O=>XLXN_169);
   
   XLXI_73 : XNOR8_HXILINX_alu
      port map (I0=>O_DUMMY(8),
                I1=>O_DUMMY(9),
                I2=>O_DUMMY(10),
                I3=>O_DUMMY(11),
                I4=>O_DUMMY(12),
                I5=>O_DUMMY(13),
                I6=>O_DUMMY(14),
                I7=>O_DUMMY(15),
                O=>XLXN_170);
   
   XLXI_74 : XNOR2
      port map (I0=>XLXN_169,
                I1=>XLXN_170,
                O=>F_DUMMY(9));
   
   XLXI_75 : GND
      port map (G=>F_DUMMY(12));
   
   XLXI_76 : GND
      port map (G=>F_DUMMY(13));
   
   XLXI_77 : GND
      port map (G=>F_DUMMY(14));
   
   XLXI_78 : VCC
      port map (P=>F_DUMMY(15));
   
   XLXI_79 : BUF
      port map (I=>O_DUMMY(15),
                O=>F_DUMMY(6));
   
end BEHAVIORAL;


