--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : flgchk.vhf
-- /___/   /\     Timestamp : 11/11/2024 13:07:48
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/flgchk.vhf -w D:/Personal/Projects/ILF-16/ILF-16/flgchk.sch
--Design Name: flgchk
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL D4_16E_HXILINX_flgchk -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_flgchk is
  
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
end D4_16E_HXILINX_flgchk;

architecture D4_16E_HXILINX_flgchk_V of D4_16E_HXILINX_flgchk is
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

end D4_16E_HXILINX_flgchk_V;
----- CELL OR16_HXILINX_flgchk -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR16_HXILINX_flgchk is
  
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
end OR16_HXILINX_flgchk;

architecture OR16_HXILINX_flgchk_V of OR16_HXILINX_flgchk is
begin
  O <=  (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11 or I12 or I13 or I14 or I15);
end OR16_HXILINX_flgchk_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity flgchk is
   port ( E      : in    std_logic; 
          FLG    : in    std_logic_vector (15 downto 0); 
          IDX    : in    std_logic_vector (3 downto 0); 
          FSTATE : out   std_logic);
end flgchk;

architecture BEHAVIORAL of flgchk is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_39 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_41 : std_logic;
   signal XLXN_42 : std_logic;
   signal XLXN_64 : std_logic;
   signal XLXN_65 : std_logic;
   signal XLXN_66 : std_logic;
   signal XLXN_67 : std_logic;
   signal XLXN_68 : std_logic;
   signal XLXN_69 : std_logic;
   signal XLXN_70 : std_logic;
   signal XLXN_71 : std_logic;
   signal XLXN_72 : std_logic;
   signal XLXN_73 : std_logic;
   signal XLXN_75 : std_logic;
   signal XLXN_77 : std_logic;
   signal XLXN_78 : std_logic;
   signal XLXN_79 : std_logic;
   signal XLXN_80 : std_logic;
   signal XLXN_81 : std_logic;
   component D4_16E_HXILINX_flgchk
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
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR16_HXILINX_flgchk
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_1";
begin
   XLXI_1 : D4_16E_HXILINX_flgchk
      port map (A0=>IDX(0),
                A1=>IDX(1),
                A2=>IDX(2),
                A3=>IDX(3),
                E=>E,
                D0=>XLXN_26,
                D1=>XLXN_27,
                D2=>XLXN_28,
                D3=>XLXN_30,
                D4=>XLXN_31,
                D5=>XLXN_32,
                D6=>XLXN_33,
                D7=>XLXN_34,
                D8=>XLXN_35,
                D9=>XLXN_36,
                D10=>XLXN_37,
                D11=>XLXN_38,
                D12=>XLXN_39,
                D13=>XLXN_40,
                D14=>XLXN_41,
                D15=>XLXN_42);
   
   XLXI_5 : AND2
      port map (I0=>FLG(0),
                I1=>XLXN_26,
                O=>XLXN_64);
   
   XLXI_6 : AND2
      port map (I0=>FLG(1),
                I1=>XLXN_27,
                O=>XLXN_65);
   
   XLXI_9 : AND2
      port map (I0=>FLG(2),
                I1=>XLXN_28,
                O=>XLXN_66);
   
   XLXI_10 : AND2
      port map (I0=>FLG(3),
                I1=>XLXN_30,
                O=>XLXN_67);
   
   XLXI_11 : AND2
      port map (I0=>FLG(4),
                I1=>XLXN_31,
                O=>XLXN_68);
   
   XLXI_12 : AND2
      port map (I0=>FLG(5),
                I1=>XLXN_32,
                O=>XLXN_69);
   
   XLXI_13 : AND2
      port map (I0=>FLG(6),
                I1=>XLXN_33,
                O=>XLXN_70);
   
   XLXI_14 : AND2
      port map (I0=>FLG(7),
                I1=>XLXN_34,
                O=>XLXN_71);
   
   XLXI_15 : AND2
      port map (I0=>FLG(8),
                I1=>XLXN_35,
                O=>XLXN_72);
   
   XLXI_16 : AND2
      port map (I0=>FLG(9),
                I1=>XLXN_36,
                O=>XLXN_73);
   
   XLXI_17 : AND2
      port map (I0=>FLG(10),
                I1=>XLXN_37,
                O=>XLXN_75);
   
   XLXI_18 : AND2
      port map (I0=>FLG(11),
                I1=>XLXN_38,
                O=>XLXN_77);
   
   XLXI_19 : AND2
      port map (I0=>FLG(12),
                I1=>XLXN_39,
                O=>XLXN_78);
   
   XLXI_20 : AND2
      port map (I0=>FLG(13),
                I1=>XLXN_40,
                O=>XLXN_79);
   
   XLXI_21 : AND2
      port map (I0=>FLG(14),
                I1=>XLXN_41,
                O=>XLXN_80);
   
   XLXI_22 : AND2
      port map (I0=>FLG(15),
                I1=>XLXN_42,
                O=>XLXN_81);
   
   XLXI_38 : OR16_HXILINX_flgchk
      port map (I0=>XLXN_81,
                I1=>XLXN_80,
                I2=>XLXN_79,
                I3=>XLXN_78,
                I4=>XLXN_77,
                I5=>XLXN_75,
                I6=>XLXN_73,
                I7=>XLXN_72,
                I8=>XLXN_71,
                I9=>XLXN_70,
                I10=>XLXN_69,
                I11=>XLXN_68,
                I12=>XLXN_67,
                I13=>XLXN_66,
                I14=>XLXN_65,
                I15=>XLXN_64,
                O=>FSTATE);
   
end BEHAVIORAL;


