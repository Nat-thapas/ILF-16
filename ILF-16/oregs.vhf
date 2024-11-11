--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : oregs.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:12:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/oregs.vhf -w D:/Personal/Projects/ILF-16/ILF-16/oregs.sch
--Design Name: oregs
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_oregs -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_oregs is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_oregs;

architecture Behavioral of FD16CE_HXILINX_oregs is

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

----- CELL D4_16E_HXILINX_oregs -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_oregs is
  
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
end D4_16E_HXILINX_oregs;

architecture D4_16E_HXILINX_oregs_V of D4_16E_HXILINX_oregs is
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

end D4_16E_HXILINX_oregs_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity oregs is
   port ( ADDR : in    std_logic_vector (3 downto 0); 
          CLK  : in    std_logic; 
          DIN  : in    std_logic_vector (15 downto 0); 
          WE   : in    std_logic; 
          DO0  : out   std_logic_vector (15 downto 0); 
          DO1  : out   std_logic_vector (15 downto 0); 
          DO2  : out   std_logic_vector (15 downto 0); 
          DO3  : out   std_logic_vector (15 downto 0); 
          DO4  : out   std_logic_vector (15 downto 0); 
          DO5  : out   std_logic_vector (15 downto 0); 
          DO6  : out   std_logic_vector (15 downto 0); 
          DO7  : out   std_logic_vector (15 downto 0); 
          DO8  : out   std_logic_vector (15 downto 0); 
          DO9  : out   std_logic_vector (15 downto 0); 
          DO10 : out   std_logic_vector (15 downto 0); 
          DO11 : out   std_logic_vector (15 downto 0); 
          DO12 : out   std_logic_vector (15 downto 0); 
          DO13 : out   std_logic_vector (15 downto 0); 
          DO14 : out   std_logic_vector (15 downto 0); 
          DO15 : out   std_logic_vector (15 downto 0));
end oregs;

architecture BEHAVIORAL of oregs is
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
   signal XLXN_422 : std_logic;
   signal XLXN_423 : std_logic;
   signal XLXN_424 : std_logic;
   component D4_16E_HXILINX_oregs
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
   
   component FD16CE_HXILINX_oregs
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
   
   attribute HU_SET of XLXI_3 : label is "XLXI_3_442";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_443";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_444";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_445";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_446";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_447";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_448";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_449";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_450";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_451";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_452";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_453";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_454";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_455";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_456";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_457";
   attribute HU_SET of XLXI_322 : label is "XLXI_322_458";
begin
   XLXI_3 : D4_16E_HXILINX_oregs
      port map (A0=>ADDR(0),
                A1=>ADDR(1),
                A2=>ADDR(2),
                A3=>ADDR(3),
                E=>XLXN_213,
                D0=>XLXN_422,
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
   
   XLXI_4 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_132,
                CLR=>XLXN_3,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO1(15 downto 0));
   
   XLXI_5 : GND
      port map (G=>XLXN_3);
   
   XLXI_6 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_135,
                CLR=>XLXN_4,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO2(15 downto 0));
   
   XLXI_7 : GND
      port map (G=>XLXN_4);
   
   XLXI_8 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_136,
                CLR=>XLXN_5,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO3(15 downto 0));
   
   XLXI_9 : GND
      port map (G=>XLXN_5);
   
   XLXI_10 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_137,
                CLR=>XLXN_6,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO4(15 downto 0));
   
   XLXI_11 : GND
      port map (G=>XLXN_6);
   
   XLXI_12 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_138,
                CLR=>XLXN_7,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO5(15 downto 0));
   
   XLXI_13 : GND
      port map (G=>XLXN_7);
   
   XLXI_14 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_139,
                CLR=>XLXN_8,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO6(15 downto 0));
   
   XLXI_15 : GND
      port map (G=>XLXN_8);
   
   XLXI_16 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_140,
                CLR=>XLXN_9,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO7(15 downto 0));
   
   XLXI_17 : GND
      port map (G=>XLXN_9);
   
   XLXI_18 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_141,
                CLR=>XLXN_10,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO8(15 downto 0));
   
   XLXI_19 : GND
      port map (G=>XLXN_10);
   
   XLXI_20 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_142,
                CLR=>XLXN_11,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO9(15 downto 0));
   
   XLXI_21 : GND
      port map (G=>XLXN_11);
   
   XLXI_22 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_143,
                CLR=>XLXN_12,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO10(15 downto 0));
   
   XLXI_23 : GND
      port map (G=>XLXN_12);
   
   XLXI_24 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_144,
                CLR=>XLXN_13,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO11(15 downto 0));
   
   XLXI_25 : GND
      port map (G=>XLXN_13);
   
   XLXI_26 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_145,
                CLR=>XLXN_14,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO12(15 downto 0));
   
   XLXI_27 : GND
      port map (G=>XLXN_14);
   
   XLXI_28 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_146,
                CLR=>XLXN_15,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO13(15 downto 0));
   
   XLXI_29 : GND
      port map (G=>XLXN_15);
   
   XLXI_30 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_147,
                CLR=>XLXN_16,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO14(15 downto 0));
   
   XLXI_31 : GND
      port map (G=>XLXN_16);
   
   XLXI_32 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_148,
                CLR=>XLXN_17,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO15(15 downto 0));
   
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
   
   XLXI_322 : FD16CE_HXILINX_oregs
      port map (C=>CLK,
                CE=>XLXN_423,
                CLR=>XLXN_424,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO0(15 downto 0));
   
   XLXI_323 : AND2
      port map (I0=>WE,
                I1=>XLXN_422,
                O=>XLXN_423);
   
   XLXI_324 : GND
      port map (G=>XLXN_424);
   
end BEHAVIORAL;


