--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : spacewire_rx_x2.vhf
-- /___/   /\     Timestamp : 11/11/2024 17:43:46
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/spacewire_rx_x2.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/spacewire_rx_x2.sch
--Design Name: spacewire_rx_x2
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_spacewire_rx_x2 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_spacewire_rx_x2 is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_spacewire_rx_x2;

architecture Behavioral of FD16CE_HXILINX_spacewire_rx_x2 is

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

----- CELL CB4CE_HXILINX_spacewire_rx_x2 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CE_HXILINX_spacewire_rx_x2 is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    Q2   : out STD_LOGIC;
    Q3   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB4CE_HXILINX_spacewire_rx_x2;

architecture Behavioral of CB4CE_HXILINX_spacewire_rx_x2 is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q3 <= COUNT(3);
Q2 <= COUNT(2);
Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;

----- CELL SR16CE_HXILINX_spacewire_rx_x2 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR16CE_HXILINX_spacewire_rx_x2 is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    SLI : in STD_LOGIC
    );
end SR16CE_HXILINX_spacewire_rx_x2;

architecture Behavioral of SR16CE_HXILINX_spacewire_rx_x2 is
signal q_tmp : std_logic_vector(15 downto 0);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      q_tmp <= ( q_tmp(14 downto 0) & SLI );
    end if;
  end if;
end process;

Q <= q_tmp;


end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity fd32ce_MUSER_spacewire_rx_x2 is
   port ( CE  : in    std_logic; 
          CLK : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (31 downto 0); 
          Q   : out   std_logic_vector (31 downto 0));
end fd32ce_MUSER_spacewire_rx_x2;

architecture BEHAVIORAL of fd32ce_MUSER_spacewire_rx_x2 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal DH  : std_logic_vector (15 downto 0);
   signal DL  : std_logic_vector (15 downto 0);
   signal QH  : std_logic_vector (15 downto 0);
   signal QL  : std_logic_vector (15 downto 0);
   component FD16CE_HXILINX_spacewire_rx_x2
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
begin
   XLXI_1 : FD16CE_HXILINX_spacewire_rx_x2
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D(15 downto 0)=>DL(15 downto 0),
                Q(15 downto 0)=>QL(15 downto 0));
   
   XLXI_2 : FD16CE_HXILINX_spacewire_rx_x2
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D(15 downto 0)=>DH(15 downto 0),
                Q(15 downto 0)=>QH(15 downto 0));
   
   XLXI_3 : BUF
      port map (I=>D(0),
                O=>DL(0));
   
   XLXI_4 : BUF
      port map (I=>D(1),
                O=>DL(1));
   
   XLXI_6 : BUF
      port map (I=>D(2),
                O=>DL(2));
   
   XLXI_7 : BUF
      port map (I=>D(3),
                O=>DL(3));
   
   XLXI_8 : BUF
      port map (I=>D(4),
                O=>DL(4));
   
   XLXI_9 : BUF
      port map (I=>D(5),
                O=>DL(5));
   
   XLXI_10 : BUF
      port map (I=>D(6),
                O=>DL(6));
   
   XLXI_11 : BUF
      port map (I=>D(7),
                O=>DL(7));
   
   XLXI_12 : BUF
      port map (I=>D(8),
                O=>DL(8));
   
   XLXI_13 : BUF
      port map (I=>D(9),
                O=>DL(9));
   
   XLXI_14 : BUF
      port map (I=>D(10),
                O=>DL(10));
   
   XLXI_15 : BUF
      port map (I=>D(11),
                O=>DL(11));
   
   XLXI_16 : BUF
      port map (I=>D(12),
                O=>DL(12));
   
   XLXI_17 : BUF
      port map (I=>D(13),
                O=>DL(13));
   
   XLXI_18 : BUF
      port map (I=>D(14),
                O=>DL(14));
   
   XLXI_19 : BUF
      port map (I=>D(15),
                O=>DL(15));
   
   XLXI_20 : BUF
      port map (I=>D(16),
                O=>DH(0));
   
   XLXI_21 : BUF
      port map (I=>D(17),
                O=>DH(1));
   
   XLXI_22 : BUF
      port map (I=>D(18),
                O=>DH(2));
   
   XLXI_23 : BUF
      port map (I=>D(19),
                O=>DH(3));
   
   XLXI_24 : BUF
      port map (I=>D(20),
                O=>DH(4));
   
   XLXI_25 : BUF
      port map (I=>D(21),
                O=>DH(5));
   
   XLXI_26 : BUF
      port map (I=>D(22),
                O=>DH(6));
   
   XLXI_27 : BUF
      port map (I=>D(23),
                O=>DH(7));
   
   XLXI_28 : BUF
      port map (I=>D(24),
                O=>DH(8));
   
   XLXI_29 : BUF
      port map (I=>D(25),
                O=>DH(9));
   
   XLXI_30 : BUF
      port map (I=>D(26),
                O=>DH(10));
   
   XLXI_31 : BUF
      port map (I=>D(27),
                O=>DH(11));
   
   XLXI_32 : BUF
      port map (I=>D(28),
                O=>DH(12));
   
   XLXI_33 : BUF
      port map (I=>D(29),
                O=>DH(13));
   
   XLXI_34 : BUF
      port map (I=>D(30),
                O=>DH(14));
   
   XLXI_35 : BUF
      port map (I=>D(31),
                O=>DH(15));
   
   XLXI_36 : BUF
      port map (I=>QL(0),
                O=>Q(0));
   
   XLXI_37 : BUF
      port map (I=>QL(1),
                O=>Q(1));
   
   XLXI_38 : BUF
      port map (I=>QL(2),
                O=>Q(2));
   
   XLXI_39 : BUF
      port map (I=>QL(3),
                O=>Q(3));
   
   XLXI_40 : BUF
      port map (I=>QL(4),
                O=>Q(4));
   
   XLXI_41 : BUF
      port map (I=>QL(5),
                O=>Q(5));
   
   XLXI_42 : BUF
      port map (I=>QL(6),
                O=>Q(6));
   
   XLXI_43 : BUF
      port map (I=>QL(7),
                O=>Q(7));
   
   XLXI_44 : BUF
      port map (I=>QL(8),
                O=>Q(8));
   
   XLXI_45 : BUF
      port map (I=>QL(9),
                O=>Q(9));
   
   XLXI_46 : BUF
      port map (I=>QL(10),
                O=>Q(10));
   
   XLXI_47 : BUF
      port map (I=>QL(11),
                O=>Q(11));
   
   XLXI_48 : BUF
      port map (I=>QL(12),
                O=>Q(12));
   
   XLXI_49 : BUF
      port map (I=>QL(13),
                O=>Q(13));
   
   XLXI_50 : BUF
      port map (I=>QL(14),
                O=>Q(14));
   
   XLXI_51 : BUF
      port map (I=>QL(15),
                O=>Q(15));
   
   XLXI_52 : BUF
      port map (I=>QH(0),
                O=>Q(16));
   
   XLXI_53 : BUF
      port map (I=>QH(1),
                O=>Q(17));
   
   XLXI_54 : BUF
      port map (I=>QH(2),
                O=>Q(18));
   
   XLXI_55 : BUF
      port map (I=>QH(3),
                O=>Q(19));
   
   XLXI_56 : BUF
      port map (I=>QH(4),
                O=>Q(20));
   
   XLXI_57 : BUF
      port map (I=>QH(5),
                O=>Q(21));
   
   XLXI_58 : BUF
      port map (I=>QH(6),
                O=>Q(22));
   
   XLXI_59 : BUF
      port map (I=>QH(7),
                O=>Q(23));
   
   XLXI_60 : BUF
      port map (I=>QH(8),
                O=>Q(24));
   
   XLXI_61 : BUF
      port map (I=>QH(9),
                O=>Q(25));
   
   XLXI_62 : BUF
      port map (I=>QH(10),
                O=>Q(26));
   
   XLXI_63 : BUF
      port map (I=>QH(11),
                O=>Q(27));
   
   XLXI_64 : BUF
      port map (I=>QH(12),
                O=>Q(28));
   
   XLXI_65 : BUF
      port map (I=>QH(13),
                O=>Q(29));
   
   XLXI_66 : BUF
      port map (I=>QH(14),
                O=>Q(30));
   
   XLXI_67 : BUF
      port map (I=>QH(15),
                O=>Q(31));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bus_splicer_MUSER_spacewire_rx_x2 is
   port ( H : in    std_logic_vector (15 downto 0); 
          L : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (31 downto 0));
end bus_splicer_MUSER_spacewire_rx_x2;

architecture BEHAVIORAL of bus_splicer_MUSER_spacewire_rx_x2 is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>L(0),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>L(1),
                O=>O(1));
   
   XLXI_5 : BUF
      port map (I=>L(2),
                O=>O(2));
   
   XLXI_6 : BUF
      port map (I=>L(3),
                O=>O(3));
   
   XLXI_7 : BUF
      port map (I=>L(4),
                O=>O(4));
   
   XLXI_8 : BUF
      port map (I=>L(5),
                O=>O(5));
   
   XLXI_9 : BUF
      port map (I=>L(6),
                O=>O(6));
   
   XLXI_10 : BUF
      port map (I=>L(7),
                O=>O(7));
   
   XLXI_11 : BUF
      port map (I=>L(8),
                O=>O(8));
   
   XLXI_12 : BUF
      port map (I=>L(9),
                O=>O(9));
   
   XLXI_13 : BUF
      port map (I=>L(10),
                O=>O(10));
   
   XLXI_14 : BUF
      port map (I=>L(11),
                O=>O(11));
   
   XLXI_15 : BUF
      port map (I=>L(12),
                O=>O(12));
   
   XLXI_16 : BUF
      port map (I=>L(13),
                O=>O(13));
   
   XLXI_17 : BUF
      port map (I=>L(14),
                O=>O(14));
   
   XLXI_18 : BUF
      port map (I=>L(15),
                O=>O(15));
   
   XLXI_19 : BUF
      port map (I=>H(0),
                O=>O(16));
   
   XLXI_20 : BUF
      port map (I=>H(1),
                O=>O(17));
   
   XLXI_21 : BUF
      port map (I=>H(2),
                O=>O(18));
   
   XLXI_22 : BUF
      port map (I=>H(3),
                O=>O(19));
   
   XLXI_23 : BUF
      port map (I=>H(4),
                O=>O(20));
   
   XLXI_24 : BUF
      port map (I=>H(5),
                O=>O(21));
   
   XLXI_25 : BUF
      port map (I=>H(6),
                O=>O(22));
   
   XLXI_26 : BUF
      port map (I=>H(7),
                O=>O(23));
   
   XLXI_27 : BUF
      port map (I=>H(8),
                O=>O(24));
   
   XLXI_28 : BUF
      port map (I=>H(9),
                O=>O(25));
   
   XLXI_29 : BUF
      port map (I=>H(10),
                O=>O(26));
   
   XLXI_30 : BUF
      port map (I=>H(11),
                O=>O(27));
   
   XLXI_31 : BUF
      port map (I=>H(12),
                O=>O(28));
   
   XLXI_32 : BUF
      port map (I=>H(13),
                O=>O(29));
   
   XLXI_33 : BUF
      port map (I=>H(14),
                O=>O(30));
   
   XLXI_34 : BUF
      port map (I=>H(15),
                O=>O(31));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bus_reverser_MUSER_spacewire_rx_x2 is
   port ( I : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end bus_reverser_MUSER_spacewire_rx_x2;

architecture BEHAVIORAL of bus_reverser_MUSER_spacewire_rx_x2 is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>I(15),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>I(14),
                O=>O(1));
   
   XLXI_3 : BUF
      port map (I=>I(13),
                O=>O(2));
   
   XLXI_4 : BUF
      port map (I=>I(12),
                O=>O(3));
   
   XLXI_5 : BUF
      port map (I=>I(11),
                O=>O(4));
   
   XLXI_6 : BUF
      port map (I=>I(10),
                O=>O(5));
   
   XLXI_7 : BUF
      port map (I=>I(9),
                O=>O(6));
   
   XLXI_8 : BUF
      port map (I=>I(8),
                O=>O(7));
   
   XLXI_9 : BUF
      port map (I=>I(7),
                O=>O(8));
   
   XLXI_10 : BUF
      port map (I=>I(6),
                O=>O(9));
   
   XLXI_11 : BUF
      port map (I=>I(5),
                O=>O(10));
   
   XLXI_12 : BUF
      port map (I=>I(4),
                O=>O(11));
   
   XLXI_13 : BUF
      port map (I=>I(3),
                O=>O(12));
   
   XLXI_14 : BUF
      port map (I=>I(2),
                O=>O(13));
   
   XLXI_15 : BUF
      port map (I=>I(1),
                O=>O(14));
   
   XLXI_16 : BUF
      port map (I=>I(0),
                O=>O(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity spacewire_rx_x2 is
   port ( CLR   : in    std_logic; 
          D1    : in    std_logic; 
          D2    : in    std_logic; 
          RXCLK : in    std_logic; 
          S1    : in    std_logic; 
          S2    : in    std_logic; 
          DATA  : out   std_logic_vector (31 downto 0));
end spacewire_rx_x2;

architecture BEHAVIORAL of spacewire_rx_x2 is
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   attribute HU_SET     : string ;
   signal XLXN_9   : std_logic;
   signal XLXN_10  : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_15  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_28  : std_logic;
   signal XLXN_29  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_36  : std_logic;
   signal XLXN_40  : std_logic_vector (15 downto 0);
   signal XLXN_41  : std_logic_vector (15 downto 0);
   signal XLXN_42  : std_logic_vector (15 downto 0);
   signal XLXN_43  : std_logic_vector (15 downto 0);
   signal XLXN_49  : std_logic;
   signal XLXN_58  : std_logic;
   signal XLXN_64  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_76  : std_logic;
   signal XLXN_78  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_88  : std_logic;
   signal XLXN_90  : std_logic;
   signal XLXN_97  : std_logic_vector (15 downto 0);
   signal XLXN_98  : std_logic_vector (15 downto 0);
   signal XLXN_182 : std_logic_vector (31 downto 0);
   signal XLXN_186 : std_logic;
   signal XLXN_190 : std_logic;
   signal XLXN_200 : std_logic;
   signal XLXN_203 : std_logic;
   signal XLXN_204 : std_logic;
   signal XLXN_205 : std_logic;
   signal XLXN_210 : std_logic;
   signal XLXN_213 : std_logic;
   signal XLXN_214 : std_logic;
   signal XLXN_215 : std_logic;
   signal XLXN_216 : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component LUT4
      -- synopsys translate_off
      generic( INIT : bit_vector :=  x"0000");
      -- synopsys translate_on
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute INIT of LUT4 : component is "0000";
   attribute BOX_TYPE of LUT4 : component is "BLACK_BOX";
   
   component SR16CE_HXILINX_spacewire_rx_x2
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             SLI : in    std_logic; 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component bus_reverser_MUSER_spacewire_rx_x2
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (15 downto 0));
   end component;
   
   component FD16CE_HXILINX_spacewire_rx_x2
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component CB4CE_HXILINX_spacewire_rx_x2
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component bus_splicer_MUSER_spacewire_rx_x2
      port ( H : in    std_logic_vector (15 downto 0); 
             L : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (31 downto 0));
   end component;
   
   component fd32ce_MUSER_spacewire_rx_x2
      port ( CE  : in    std_logic; 
             CLK : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (31 downto 0); 
             Q   : out   std_logic_vector (31 downto 0));
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   attribute INIT of XLXI_13 : label is "6FF6";
   attribute INIT of XLXI_14 : label is "6FF6";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_2";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_3";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_7";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_6";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_4";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_5";
begin
   XLXI_1 : FD
      port map (C=>RXCLK,
                D=>D1,
                Q=>XLXN_12);
   
   XLXI_2 : FD
      port map (C=>RXCLK,
                D=>S1,
                Q=>XLXN_11);
   
   XLXI_3 : FD
      port map (C=>RXCLK,
                D=>D2,
                Q=>XLXN_10);
   
   XLXI_4 : FD
      port map (C=>RXCLK,
                D=>S2,
                Q=>XLXN_9);
   
   XLXI_5 : FD
      port map (C=>RXCLK,
                D=>XLXN_12,
                Q=>XLXN_27);
   
   XLXI_6 : FD
      port map (C=>RXCLK,
                D=>XLXN_11,
                Q=>XLXN_31);
   
   XLXI_7 : FD
      port map (C=>RXCLK,
                D=>XLXN_10,
                Q=>XLXN_15);
   
   XLXI_8 : FD
      port map (C=>RXCLK,
                D=>XLXN_9,
                Q=>XLXN_35);
   
   XLXI_9 : FD
      port map (C=>RXCLK,
                D=>XLXN_27,
                Q=>XLXN_28);
   
   XLXI_10 : FD
      port map (C=>RXCLK,
                D=>XLXN_31,
                Q=>XLXN_29);
   
   XLXI_11 : FD
      port map (C=>RXCLK,
                D=>XLXN_15,
                Q=>XLXN_34);
   
   XLXI_12 : FD
      port map (C=>RXCLK,
                D=>XLXN_35,
                Q=>XLXN_36);
   
   XLXI_13 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"6FF6")
   -- synopsys translate_on
      port map (I0=>XLXN_29,
                I1=>XLXN_31,
                I2=>XLXN_28,
                I3=>XLXN_27,
                O=>XLXN_213);
   
   XLXI_14 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"6FF6")
   -- synopsys translate_on
      port map (I0=>XLXN_36,
                I1=>XLXN_35,
                I2=>XLXN_34,
                I3=>XLXN_15,
                O=>XLXN_49);
   
   XLXI_15 : SR16CE_HXILINX_spacewire_rx_x2
      port map (C=>RXCLK,
                CE=>XLXN_213,
                CLR=>CLR,
                SLI=>XLXN_27,
                Q(15 downto 0)=>XLXN_41(15 downto 0));
   
   XLXI_16 : SR16CE_HXILINX_spacewire_rx_x2
      port map (C=>RXCLK,
                CE=>XLXN_49,
                CLR=>CLR,
                SLI=>XLXN_15,
                Q(15 downto 0)=>XLXN_40(15 downto 0));
   
   XLXI_17 : bus_reverser_MUSER_spacewire_rx_x2
      port map (I(15 downto 0)=>XLXN_41(15 downto 0),
                O(15 downto 0)=>XLXN_43(15 downto 0));
   
   XLXI_18 : bus_reverser_MUSER_spacewire_rx_x2
      port map (I(15 downto 0)=>XLXN_40(15 downto 0),
                O(15 downto 0)=>XLXN_42(15 downto 0));
   
   XLXI_19 : FD16CE_HXILINX_spacewire_rx_x2
      port map (C=>RXCLK,
                CE=>XLXN_203,
                CLR=>XLXN_58,
                D(15 downto 0)=>XLXN_43(15 downto 0),
                Q(15 downto 0)=>XLXN_97(15 downto 0));
   
   XLXI_20 : FD16CE_HXILINX_spacewire_rx_x2
      port map (C=>RXCLK,
                CE=>XLXN_190,
                CLR=>XLXN_80,
                D(15 downto 0)=>XLXN_42(15 downto 0),
                Q(15 downto 0)=>XLXN_98(15 downto 0));
   
   XLXI_21 : CB4CE_HXILINX_spacewire_rx_x2
      port map (C=>RXCLK,
                CE=>XLXN_213,
                CLR=>CLR,
                CEO=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>open,
                TC=>XLXN_65);
   
   XLXI_22 : CB4CE_HXILINX_spacewire_rx_x2
      port map (C=>RXCLK,
                CE=>XLXN_49,
                CLR=>CLR,
                CEO=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>open,
                TC=>XLXN_76);
   
   XLXI_27 : GND
      port map (G=>XLXN_58);
   
   XLXI_29 : FD
      port map (C=>RXCLK,
                D=>XLXN_64,
                Q=>XLXN_88);
   
   XLXI_31 : FD
      port map (C=>RXCLK,
                D=>XLXN_90,
                Q=>XLXN_78);
   
   XLXI_34 : GND
      port map (G=>XLXN_80);
   
   XLXI_39 : AND2B1
      port map (I0=>XLXN_88,
                I1=>XLXN_64,
                O=>XLXN_203);
   
   XLXI_40 : AND2B1
      port map (I0=>XLXN_78,
                I1=>XLXN_90,
                O=>XLXN_190);
   
   XLXI_46 : bus_splicer_MUSER_spacewire_rx_x2
      port map (H(15 downto 0)=>XLXN_98(15 downto 0),
                L(15 downto 0)=>XLXN_97(15 downto 0),
                O(31 downto 0)=>XLXN_182(31 downto 0));
   
   XLXI_47 : fd32ce_MUSER_spacewire_rx_x2
      port map (CE=>XLXN_214,
                CLK=>RXCLK,
                CLR=>XLXN_186,
                D(31 downto 0)=>XLXN_182(31 downto 0),
                Q(31 downto 0)=>DATA(31 downto 0));
   
   XLXI_50 : GND
      port map (G=>XLXN_186);
   
   XLXI_57 : AND2
      port map (I0=>XLXN_216,
                I1=>XLXN_215,
                O=>XLXN_214);
   
   XLXI_58 : FDE
      port map (C=>RXCLK,
                CE=>XLXN_205,
                D=>XLXN_200,
                Q=>XLXN_215);
   
   XLXI_59 : INV
      port map (I=>XLXN_215,
                O=>XLXN_200);
   
   XLXI_60 : OR2
      port map (I0=>XLXN_204,
                I1=>XLXN_203,
                O=>XLXN_205);
   
   XLXI_61 : FDE
      port map (C=>RXCLK,
                CE=>XLXN_205,
                D=>XLXN_210,
                Q=>XLXN_216);
   
   XLXI_62 : INV
      port map (I=>XLXN_216,
                O=>XLXN_210);
   
   XLXI_63 : FDE
      port map (C=>RXCLK,
                CE=>XLXN_213,
                D=>XLXN_65,
                Q=>XLXN_64);
   
   XLXI_64 : FDE
      port map (C=>RXCLK,
                CE=>XLXN_49,
                D=>XLXN_76,
                Q=>XLXN_90);
   
   XLXI_65 : AND2
      port map (I0=>XLXN_216,
                I1=>XLXN_215,
                O=>XLXN_204);
   
end BEHAVIORAL;


