--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : regs.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:27:30
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/regs.vhf -w D:/Personal/Projects/ILF-16/ILF-16/regs.sch
--Design Name: regs
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_regs -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_regs is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_regs;

architecture Behavioral of FD16CE_HXILINX_regs is

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

----- CELL D4_16E_HXILINX_regs -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_regs is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;
    D4  : out std_logic;
    D5  : out std_logic;
    D6  : out std_logic;
    D7  : out std_logic;
    D8  : out std_logic;
    D9  : out std_logic;
    D10  : out std_logic;
    D11  : out std_logic;
    D12  : out std_logic;
    D13  : out std_logic;
    D14  : out std_logic;
    D15  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    E   : in std_logic
  );
end D4_16E_HXILINX_regs;

architecture D4_16E_HXILINX_regs_V of D4_16E_HXILINX_regs is
  signal d_tmp : std_logic_vector(15 downto 0);
begin
  process (A0, A1, A2, A3, E)
  variable sel   : std_logic_vector(3 downto 0);
  begin
    sel := A3&A2&A1&A0;
    if( E = '0') then
    d_tmp <= "0000000000000000";
    else
      case sel is
      when "0000" => d_tmp <= "0000000000000001";
      when "0001" => d_tmp <= "0000000000000010";
      when "0010" => d_tmp <= "0000000000000100";
      when "0011" => d_tmp <= "0000000000001000";
      when "0100" => d_tmp <= "0000000000010000";
      when "0101" => d_tmp <= "0000000000100000";
      when "0110" => d_tmp <= "0000000001000000";
      when "0111" => d_tmp <= "0000000010000000";
      when "1000" => d_tmp <= "0000000100000000";
      when "1001" => d_tmp <= "0000001000000000";
      when "1010" => d_tmp <= "0000010000000000";
      when "1011" => d_tmp <= "0000100000000000";
      when "1100" => d_tmp <= "0001000000000000";
      when "1101" => d_tmp <= "0010000000000000";
      when "1110" => d_tmp <= "0100000000000000";
      when "1111" => d_tmp <= "1000000000000000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D15 <= d_tmp(15);
    D14 <= d_tmp(14);
    D13 <= d_tmp(13);
    D12 <= d_tmp(12);
    D11 <= d_tmp(11);
    D10 <= d_tmp(10);
    D9  <= d_tmp(9);
    D8  <= d_tmp(8);
    D7  <= d_tmp(7);
    D6  <= d_tmp(6);
    D5  <= d_tmp(5);
    D4  <= d_tmp(4);
    D3  <= d_tmp(3);
    D2  <= d_tmp(2);
    D1  <= d_tmp(1);
    D0  <= d_tmp(0);

end D4_16E_HXILINX_regs_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4x1x16t_MUSER_regs is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16t_MUSER_regs;

architecture BEHAVIORAL of mux4x1x16t_MUSER_regs is
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

entity mux16x1x16tb_MUSER_regs is
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
end mux16x1x16tb_MUSER_regs;

architecture BEHAVIORAL of mux16x1x16tb_MUSER_regs is
   signal XLXN_1 : std_logic_vector (15 downto 0);
   signal XLXN_2 : std_logic_vector (15 downto 0);
   signal XLXN_3 : std_logic_vector (15 downto 0);
   signal XLXN_4 : std_logic_vector (15 downto 0);
   component mux4x1x16t_MUSER_regs
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
begin
   MH1 : mux4x1x16t_MUSER_regs
      port map (D0(15 downto 0)=>XLXN_1(15 downto 0),
                D1(15 downto 0)=>XLXN_2(15 downto 0),
                D2(15 downto 0)=>XLXN_3(15 downto 0),
                D3(15 downto 0)=>XLXN_4(15 downto 0),
                S0=>S(2),
                S1=>S(3),
                O(15 downto 0)=>O(15 downto 0));
   
   ML1 : mux4x1x16t_MUSER_regs
      port map (D0(15 downto 0)=>D0(15 downto 0),
                D1(15 downto 0)=>D1(15 downto 0),
                D2(15 downto 0)=>D2(15 downto 0),
                D3(15 downto 0)=>D3(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_1(15 downto 0));
   
   ML2 : mux4x1x16t_MUSER_regs
      port map (D0(15 downto 0)=>D4(15 downto 0),
                D1(15 downto 0)=>D5(15 downto 0),
                D2(15 downto 0)=>D6(15 downto 0),
                D3(15 downto 0)=>D7(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_2(15 downto 0));
   
   ML3 : mux4x1x16t_MUSER_regs
      port map (D0(15 downto 0)=>D8(15 downto 0),
                D1(15 downto 0)=>D9(15 downto 0),
                D2(15 downto 0)=>D10(15 downto 0),
                D3(15 downto 0)=>D11(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_3(15 downto 0));
   
   ML4 : mux4x1x16t_MUSER_regs
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

entity gnd16_MUSER_regs is
   port ( GNDO : out   std_logic_vector (15 downto 0));
end gnd16_MUSER_regs;

architecture BEHAVIORAL of gnd16_MUSER_regs is
   attribute BOX_TYPE   : string ;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : GND
      port map (G=>GNDO(0));
   
   XLXI_2 : GND
      port map (G=>GNDO(1));
   
   XLXI_3 : GND
      port map (G=>GNDO(2));
   
   XLXI_4 : GND
      port map (G=>GNDO(3));
   
   XLXI_5 : GND
      port map (G=>GNDO(4));
   
   XLXI_6 : GND
      port map (G=>GNDO(5));
   
   XLXI_7 : GND
      port map (G=>GNDO(6));
   
   XLXI_8 : GND
      port map (G=>GNDO(7));
   
   XLXI_9 : GND
      port map (G=>GNDO(8));
   
   XLXI_10 : GND
      port map (G=>GNDO(9));
   
   XLXI_11 : GND
      port map (G=>GNDO(10));
   
   XLXI_12 : GND
      port map (G=>GNDO(11));
   
   XLXI_13 : GND
      port map (G=>GNDO(12));
   
   XLXI_14 : GND
      port map (G=>GNDO(13));
   
   XLXI_15 : GND
      port map (G=>GNDO(14));
   
   XLXI_16 : GND
      port map (G=>GNDO(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity regs is
   port ( CLK  : in    std_logic; 
          DIN  : in    std_logic_vector (15 downto 0); 
          RAD1 : in    std_logic_vector (3 downto 0); 
          RAD2 : in    std_logic_vector (3 downto 0); 
          RAD3 : in    std_logic_vector (3 downto 0); 
          WAD  : in    std_logic_vector (3 downto 0); 
          WE   : in    std_logic; 
          DO1  : out   std_logic_vector (15 downto 0); 
          DO2  : out   std_logic_vector (15 downto 0); 
          DO3  : out   std_logic_vector (15 downto 0));
end regs;

architecture BEHAVIORAL of regs is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_7   : std_logic;
   signal XLXN_8   : std_logic;
   signal XLXN_9   : std_logic;
   signal XLXN_10  : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_13  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_15  : std_logic;
   signal XLXN_16  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_132 : std_logic;
   signal XLXN_135 : std_logic;
   signal XLXN_136 : std_logic;
   signal XLXN_137 : std_logic;
   signal XLXN_138 : std_logic;
   signal XLXN_139 : std_logic;
   signal XLXN_140 : std_logic;
   signal XLXN_141 : std_logic;
   signal XLXN_142 : std_logic;
   signal XLXN_143 : std_logic;
   signal XLXN_144 : std_logic;
   signal XLXN_145 : std_logic;
   signal XLXN_146 : std_logic;
   signal XLXN_147 : std_logic;
   signal XLXN_148 : std_logic;
   signal XLXN_213 : std_logic;
   signal XLXN_230 : std_logic;
   signal XLXN_231 : std_logic;
   signal XLXN_232 : std_logic;
   signal XLXN_233 : std_logic;
   signal XLXN_234 : std_logic;
   signal XLXN_235 : std_logic;
   signal XLXN_236 : std_logic;
   signal XLXN_237 : std_logic;
   signal XLXN_238 : std_logic;
   signal XLXN_239 : std_logic;
   signal XLXN_240 : std_logic;
   signal XLXN_241 : std_logic;
   signal XLXN_242 : std_logic;
   signal XLXN_243 : std_logic;
   signal XLXN_244 : std_logic;
   signal XLXN_471 : std_logic_vector (15 downto 0);
   signal XLXN_472 : std_logic_vector (15 downto 0);
   signal XLXN_473 : std_logic_vector (15 downto 0);
   signal XLXN_475 : std_logic_vector (15 downto 0);
   signal XLXN_476 : std_logic_vector (15 downto 0);
   signal XLXN_478 : std_logic_vector (15 downto 0);
   signal XLXN_479 : std_logic_vector (15 downto 0);
   signal XLXN_494 : std_logic_vector (15 downto 0);
   signal XLXN_606 : std_logic_vector (15 downto 0);
   signal XLXN_607 : std_logic_vector (15 downto 0);
   signal XLXN_608 : std_logic_vector (15 downto 0);
   signal XLXN_609 : std_logic_vector (15 downto 0);
   signal XLXN_610 : std_logic_vector (15 downto 0);
   signal XLXN_611 : std_logic_vector (15 downto 0);
   signal XLXN_618 : std_logic_vector (15 downto 0);
   signal XLXN_619 : std_logic_vector (15 downto 0);
   component mux16x1x16tb_MUSER_regs
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
   
   component gnd16_MUSER_regs
      port ( GNDO : out   std_logic_vector (15 downto 0));
   end component;
   
   component D4_16E_HXILINX_regs
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             E   : in    std_logic; 
             D0  : out   std_logic; 
             D1  : out   std_logic; 
             D10 : out   std_logic; 
             D11 : out   std_logic; 
             D12 : out   std_logic; 
             D13 : out   std_logic; 
             D14 : out   std_logic; 
             D15 : out   std_logic; 
             D2  : out   std_logic; 
             D3  : out   std_logic; 
             D4  : out   std_logic; 
             D5  : out   std_logic; 
             D6  : out   std_logic; 
             D7  : out   std_logic; 
             D8  : out   std_logic; 
             D9  : out   std_logic);
   end component;
   
   component FD16CE_HXILINX_regs
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of Write_Address_Decoder : label is 
         "Write_Address_Decoder_0";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_1";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_2";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_3";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_4";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_5";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_6";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_7";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_8";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_9";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_10";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_11";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_12";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_13";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_14";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_15";
begin
   Output_1_Data_Selector : mux16x1x16tb_MUSER_regs
      port map (D0(15 downto 0)=>XLXN_606(15 downto 0),
                D1(15 downto 0)=>XLXN_607(15 downto 0),
                D2(15 downto 0)=>XLXN_608(15 downto 0),
                D3(15 downto 0)=>XLXN_609(15 downto 0),
                D4(15 downto 0)=>XLXN_610(15 downto 0),
                D5(15 downto 0)=>XLXN_611(15 downto 0),
                D6(15 downto 0)=>XLXN_618(15 downto 0),
                D7(15 downto 0)=>XLXN_619(15 downto 0),
                D8(15 downto 0)=>XLXN_471(15 downto 0),
                D9(15 downto 0)=>XLXN_472(15 downto 0),
                D10(15 downto 0)=>XLXN_473(15 downto 0),
                D11(15 downto 0)=>XLXN_475(15 downto 0),
                D12(15 downto 0)=>XLXN_476(15 downto 0),
                D13(15 downto 0)=>XLXN_494(15 downto 0),
                D14(15 downto 0)=>XLXN_478(15 downto 0),
                D15(15 downto 0)=>XLXN_479(15 downto 0),
                S(3 downto 0)=>RAD1(3 downto 0),
                O(15 downto 0)=>DO1(15 downto 0));
   
   Output_2_Data_Selector : mux16x1x16tb_MUSER_regs
      port map (D0(15 downto 0)=>XLXN_606(15 downto 0),
                D1(15 downto 0)=>XLXN_607(15 downto 0),
                D2(15 downto 0)=>XLXN_608(15 downto 0),
                D3(15 downto 0)=>XLXN_609(15 downto 0),
                D4(15 downto 0)=>XLXN_610(15 downto 0),
                D5(15 downto 0)=>XLXN_611(15 downto 0),
                D6(15 downto 0)=>XLXN_618(15 downto 0),
                D7(15 downto 0)=>XLXN_619(15 downto 0),
                D8(15 downto 0)=>XLXN_471(15 downto 0),
                D9(15 downto 0)=>XLXN_472(15 downto 0),
                D10(15 downto 0)=>XLXN_473(15 downto 0),
                D11(15 downto 0)=>XLXN_475(15 downto 0),
                D12(15 downto 0)=>XLXN_476(15 downto 0),
                D13(15 downto 0)=>XLXN_494(15 downto 0),
                D14(15 downto 0)=>XLXN_478(15 downto 0),
                D15(15 downto 0)=>XLXN_479(15 downto 0),
                S(3 downto 0)=>RAD2(3 downto 0),
                O(15 downto 0)=>DO2(15 downto 0));
   
   Output_3_Data_Selector : mux16x1x16tb_MUSER_regs
      port map (D0(15 downto 0)=>XLXN_606(15 downto 0),
                D1(15 downto 0)=>XLXN_607(15 downto 0),
                D2(15 downto 0)=>XLXN_608(15 downto 0),
                D3(15 downto 0)=>XLXN_609(15 downto 0),
                D4(15 downto 0)=>XLXN_610(15 downto 0),
                D5(15 downto 0)=>XLXN_611(15 downto 0),
                D6(15 downto 0)=>XLXN_618(15 downto 0),
                D7(15 downto 0)=>XLXN_619(15 downto 0),
                D8(15 downto 0)=>XLXN_471(15 downto 0),
                D9(15 downto 0)=>XLXN_472(15 downto 0),
                D10(15 downto 0)=>XLXN_473(15 downto 0),
                D11(15 downto 0)=>XLXN_475(15 downto 0),
                D12(15 downto 0)=>XLXN_476(15 downto 0),
                D13(15 downto 0)=>XLXN_494(15 downto 0),
                D14(15 downto 0)=>XLXN_478(15 downto 0),
                D15(15 downto 0)=>XLXN_479(15 downto 0),
                S(3 downto 0)=>RAD3(3 downto 0),
                O(15 downto 0)=>DO3(15 downto 0));
   
   R0_Data : gnd16_MUSER_regs
      port map (GNDO(15 downto 0)=>XLXN_606(15 downto 0));
   
   Write_Address_Decoder : D4_16E_HXILINX_regs
      port map (A0=>WAD(0),
                A1=>WAD(1),
                A2=>WAD(2),
                A3=>WAD(3),
                E=>XLXN_213,
                D0=>open,
                D1=>XLXN_230,
                D2=>XLXN_231,
                D3=>XLXN_232,
                D4=>XLXN_233,
                D5=>XLXN_234,
                D6=>XLXN_235,
                D7=>XLXN_236,
                D8=>XLXN_237,
                D9=>XLXN_238,
                D10=>XLXN_239,
                D11=>XLXN_240,
                D12=>XLXN_241,
                D13=>XLXN_242,
                D14=>XLXN_243,
                D15=>XLXN_244);
   
   XLXI_4 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_132,
                CLR=>XLXN_3,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_607(15 downto 0));
   
   XLXI_5 : GND
      port map (G=>XLXN_3);
   
   XLXI_6 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_135,
                CLR=>XLXN_4,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_608(15 downto 0));
   
   XLXI_7 : GND
      port map (G=>XLXN_4);
   
   XLXI_8 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_136,
                CLR=>XLXN_5,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_609(15 downto 0));
   
   XLXI_9 : GND
      port map (G=>XLXN_5);
   
   XLXI_10 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_137,
                CLR=>XLXN_6,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_610(15 downto 0));
   
   XLXI_11 : GND
      port map (G=>XLXN_6);
   
   XLXI_12 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_138,
                CLR=>XLXN_7,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_611(15 downto 0));
   
   XLXI_13 : GND
      port map (G=>XLXN_7);
   
   XLXI_14 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_139,
                CLR=>XLXN_8,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_618(15 downto 0));
   
   XLXI_15 : GND
      port map (G=>XLXN_8);
   
   XLXI_16 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_140,
                CLR=>XLXN_9,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_619(15 downto 0));
   
   XLXI_17 : GND
      port map (G=>XLXN_9);
   
   XLXI_18 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_141,
                CLR=>XLXN_10,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_471(15 downto 0));
   
   XLXI_19 : GND
      port map (G=>XLXN_10);
   
   XLXI_20 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_142,
                CLR=>XLXN_11,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_472(15 downto 0));
   
   XLXI_21 : GND
      port map (G=>XLXN_11);
   
   XLXI_22 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_143,
                CLR=>XLXN_12,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_473(15 downto 0));
   
   XLXI_23 : GND
      port map (G=>XLXN_12);
   
   XLXI_24 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_144,
                CLR=>XLXN_13,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_475(15 downto 0));
   
   XLXI_25 : GND
      port map (G=>XLXN_13);
   
   XLXI_26 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_145,
                CLR=>XLXN_14,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_476(15 downto 0));
   
   XLXI_27 : GND
      port map (G=>XLXN_14);
   
   XLXI_28 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_146,
                CLR=>XLXN_15,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_494(15 downto 0));
   
   XLXI_29 : GND
      port map (G=>XLXN_15);
   
   XLXI_30 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_147,
                CLR=>XLXN_16,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_478(15 downto 0));
   
   XLXI_31 : GND
      port map (G=>XLXN_16);
   
   XLXI_32 : FD16CE_HXILINX_regs
      port map (C=>CLK,
                CE=>XLXN_148,
                CLR=>XLXN_17,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_479(15 downto 0));
   
   XLXI_33 : GND
      port map (G=>XLXN_17);
   
   XLXI_190 : AND2
      port map (I0=>WE,
                I1=>XLXN_230,
                O=>XLXN_132);
   
   XLXI_192 : AND2
      port map (I0=>WE,
                I1=>XLXN_231,
                O=>XLXN_135);
   
   XLXI_193 : AND2
      port map (I0=>WE,
                I1=>XLXN_232,
                O=>XLXN_136);
   
   XLXI_194 : AND2
      port map (I0=>WE,
                I1=>XLXN_233,
                O=>XLXN_137);
   
   XLXI_195 : AND2
      port map (I0=>WE,
                I1=>XLXN_234,
                O=>XLXN_138);
   
   XLXI_196 : AND2
      port map (I0=>WE,
                I1=>XLXN_235,
                O=>XLXN_139);
   
   XLXI_197 : AND2
      port map (I0=>WE,
                I1=>XLXN_236,
                O=>XLXN_140);
   
   XLXI_198 : AND2
      port map (I0=>WE,
                I1=>XLXN_237,
                O=>XLXN_141);
   
   XLXI_199 : AND2
      port map (I0=>WE,
                I1=>XLXN_238,
                O=>XLXN_142);
   
   XLXI_200 : AND2
      port map (I0=>WE,
                I1=>XLXN_239,
                O=>XLXN_143);
   
   XLXI_201 : AND2
      port map (I0=>WE,
                I1=>XLXN_240,
                O=>XLXN_144);
   
   XLXI_202 : AND2
      port map (I0=>WE,
                I1=>XLXN_241,
                O=>XLXN_145);
   
   XLXI_203 : AND2
      port map (I0=>WE,
                I1=>XLXN_242,
                O=>XLXN_146);
   
   XLXI_204 : AND2
      port map (I0=>WE,
                I1=>XLXN_243,
                O=>XLXN_147);
   
   XLXI_205 : AND2
      port map (I0=>WE,
                I1=>XLXN_244,
                O=>XLXN_148);
   
   XLXI_252 : VCC
      port map (P=>XLXN_213);
   
end BEHAVIORAL;


