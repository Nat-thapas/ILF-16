--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : main.vhf
-- /___/   /\     Timestamp : 11/11/2024 17:43:47
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/main.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/main.sch
--Design Name: main
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_main is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_main;

architecture Behavioral of FD16CE_HXILINX_main is

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

----- CELL FJKCE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FJKCE_HXILINX_main is
  generic(
    INIT : bit := '0'
    );
  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    J   : in STD_LOGIC;
    K   : in STD_LOGIC
    );
end FJKCE_HXILINX_main;

architecture Behavioral of FJKCE_HXILINX_main is
signal q_tmp : std_logic := TO_X01(INIT);

begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(CE= '1') then
      if(J='0') then
        if(K='1') then
        q_tmp <= '0';
      end if;
      else
        if(K='0') then
        q_tmp <= '1';
        else
        q_tmp <= not q_tmp;
        end if;
      end if;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL CB4CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CE_HXILINX_main is
  
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
end CB4CE_HXILINX_main;

architecture Behavioral of CB4CE_HXILINX_main is

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

----- CELL AND12_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND12_HXILINX_main is
  
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
    I10  : in std_logic;
    I11  : in std_logic
  );
end AND12_HXILINX_main;

architecture AND12_HXILINX_main_V of AND12_HXILINX_main is
begin
  O <= I0 and I1 and I2 and I3 and I4 and I5 and I6 and I7 and I8 and I9 and I10 and I11;
end AND12_HXILINX_main_V;
----- CELL SR16CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR16CE_HXILINX_main is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    SLI : in STD_LOGIC
    );
end SR16CE_HXILINX_main;

architecture Behavioral of SR16CE_HXILINX_main is
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

----- CELL CB8CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB8CE_HXILINX_main is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB8CE_HXILINX_main;

architecture Behavioral of CB8CE_HXILINX_main is

  signal COUNT : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');
  
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

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity buf4be_MUSER_main is
   port ( Enable : in    std_logic; 
          I      : in    std_logic_vector (3 downto 0); 
          O      : out   std_logic_vector (3 downto 0));
end buf4be_MUSER_main;

architecture BEHAVIORAL of buf4be_MUSER_main is
   attribute BOX_TYPE   : string ;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>Enable,
                I1=>I(0),
                O=>O(0));
   
   XLXI_2 : AND2
      port map (I0=>Enable,
                I1=>I(1),
                O=>O(1));
   
   XLXI_3 : AND2
      port map (I0=>Enable,
                I1=>I(2),
                O=>O(2));
   
   XLXI_4 : AND2
      port map (I0=>Enable,
                I1=>I(3),
                O=>O(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity sdp_vram_wrapper_MUSER_main is
   port ( DIN  : in    std_logic_vector (3 downto 0); 
          RAD  : in    std_logic_vector (15 downto 0); 
          RCLK : in    std_logic; 
          WAD  : in    std_logic_vector (15 downto 0); 
          WCLK : in    std_logic; 
          WE   : in    std_logic; 
          DO   : out   std_logic_vector (3 downto 0));
end sdp_vram_wrapper_MUSER_main;

architecture BEHAVIORAL of sdp_vram_wrapper_MUSER_main is
   component sdp_vram
      port ( addra : in    std_logic_vector (15 downto 0); 
             dina  : in    std_logic_vector (3 downto 0); 
             wea   : in    std_logic_vector (0 downto 0); 
             clka  : in    std_logic; 
             addrb : in    std_logic_vector (15 downto 0); 
             clkb  : in    std_logic; 
             doutb : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   XLXI_1 : sdp_vram
      port map (addra(15 downto 0)=>WAD(15 downto 0),
                addrb(15 downto 0)=>RAD(15 downto 0),
                clka=>WCLK,
                clkb=>RCLK,
                dina(3 downto 0)=>DIN(3 downto 0),
                wea(0)=>WE,
                doutb(3 downto 0)=>DO(3 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity v_counter_wrapper_MUSER_main is
   port ( CE  : in    std_logic; 
          CLK : in    std_logic; 
          Q   : out   std_logic_vector (9 downto 0));
end v_counter_wrapper_MUSER_main;

architecture BEHAVIORAL of v_counter_wrapper_MUSER_main is
   component v_counter
      port ( clk : in    std_logic; 
             ce  : in    std_logic; 
             q   : out   std_logic_vector (9 downto 0));
   end component;
   
begin
   XLXI_1 : v_counter
      port map (ce=>CE,
                clk=>CLK,
                q(9 downto 0)=>Q(9 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity h_counter_wrapper_MUSER_main is
   port ( CE  : in    std_logic; 
          CLK : in    std_logic; 
          Q   : out   std_logic_vector (10 downto 0); 
          TC  : out   std_logic);
end h_counter_wrapper_MUSER_main;

architecture BEHAVIORAL of h_counter_wrapper_MUSER_main is
   component h_counter
      port ( clk     : in    std_logic; 
             ce      : in    std_logic; 
             thresh0 : out   std_logic; 
             q       : out   std_logic_vector (10 downto 0));
   end component;
   
begin
   XLXI_1 : h_counter
      port map (ce=>CE,
                clk=>CLK,
                q(10 downto 0)=>Q(10 downto 0),
                thresh0=>TC);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity fd32ce_MUSER_main is
   port ( CE  : in    std_logic; 
          CLK : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (31 downto 0); 
          Q   : out   std_logic_vector (31 downto 0));
end fd32ce_MUSER_main;

architecture BEHAVIORAL of fd32ce_MUSER_main is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal DH  : std_logic_vector (15 downto 0);
   signal DL  : std_logic_vector (15 downto 0);
   signal QH  : std_logic_vector (15 downto 0);
   signal QL  : std_logic_vector (15 downto 0);
   component FD16CE_HXILINX_main
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_30";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_31";
begin
   XLXI_1 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D(15 downto 0)=>DL(15 downto 0),
                Q(15 downto 0)=>QL(15 downto 0));
   
   XLXI_2 : FD16CE_HXILINX_main
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

entity decoder_MUSER_main is
   port ( INST : in    std_logic_vector (31 downto 0); 
          ADDR : out   std_logic_vector (15 downto 0); 
          CLR  : out   std_logic_vector (3 downto 0));
end decoder_MUSER_main;

architecture BEHAVIORAL of decoder_MUSER_main is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>INST(8),
                O=>ADDR(0));
   
   XLXI_2 : BUF
      port map (I=>INST(9),
                O=>ADDR(1));
   
   XLXI_3 : BUF
      port map (I=>INST(10),
                O=>ADDR(2));
   
   XLXI_4 : BUF
      port map (I=>INST(11),
                O=>ADDR(3));
   
   XLXI_5 : BUF
      port map (I=>INST(12),
                O=>ADDR(4));
   
   XLXI_6 : BUF
      port map (I=>INST(13),
                O=>ADDR(5));
   
   XLXI_7 : BUF
      port map (I=>INST(14),
                O=>ADDR(6));
   
   XLXI_8 : BUF
      port map (I=>INST(15),
                O=>ADDR(7));
   
   XLXI_9 : BUF
      port map (I=>INST(0),
                O=>ADDR(8));
   
   XLXI_10 : BUF
      port map (I=>INST(1),
                O=>ADDR(9));
   
   XLXI_11 : BUF
      port map (I=>INST(2),
                O=>ADDR(10));
   
   XLXI_12 : BUF
      port map (I=>INST(3),
                O=>ADDR(11));
   
   XLXI_13 : BUF
      port map (I=>INST(4),
                O=>ADDR(12));
   
   XLXI_14 : BUF
      port map (I=>INST(5),
                O=>ADDR(13));
   
   XLXI_15 : BUF
      port map (I=>INST(6),
                O=>ADDR(14));
   
   XLXI_16 : BUF
      port map (I=>INST(7),
                O=>ADDR(15));
   
   XLXI_17 : BUF
      port map (I=>INST(16),
                O=>CLR(0));
   
   XLXI_18 : BUF
      port map (I=>INST(17),
                O=>CLR(1));
   
   XLXI_19 : BUF
      port map (I=>INST(18),
                O=>CLR(2));
   
   XLXI_20 : BUF
      port map (I=>INST(19),
                O=>CLR(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bus_splicer_MUSER_main is
   port ( H : in    std_logic_vector (15 downto 0); 
          L : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (31 downto 0));
end bus_splicer_MUSER_main;

architecture BEHAVIORAL of bus_splicer_MUSER_main is
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

entity bus_reverser_MUSER_main is
   port ( I : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end bus_reverser_MUSER_main;

architecture BEHAVIORAL of bus_reverser_MUSER_main is
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

entity spacewire_rx_x2_MUSER_main is
   port ( CLR   : in    std_logic; 
          D1    : in    std_logic; 
          D2    : in    std_logic; 
          RXCLK : in    std_logic; 
          S1    : in    std_logic; 
          S2    : in    std_logic; 
          DATA  : out   std_logic_vector (31 downto 0));
end spacewire_rx_x2_MUSER_main;

architecture BEHAVIORAL of spacewire_rx_x2_MUSER_main is
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
   
   component SR16CE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             SLI : in    std_logic; 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component bus_reverser_MUSER_main
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (15 downto 0));
   end component;
   
   component FD16CE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component CB4CE_HXILINX_main
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
   
   component bus_splicer_MUSER_main
      port ( H : in    std_logic_vector (15 downto 0); 
             L : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (31 downto 0));
   end component;
   
   component fd32ce_MUSER_main
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
   attribute HU_SET of XLXI_15 : label is "XLXI_15_32";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_33";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_37";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_36";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_34";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_35";
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
   
   XLXI_15 : SR16CE_HXILINX_main
      port map (C=>RXCLK,
                CE=>XLXN_213,
                CLR=>CLR,
                SLI=>XLXN_27,
                Q(15 downto 0)=>XLXN_41(15 downto 0));
   
   XLXI_16 : SR16CE_HXILINX_main
      port map (C=>RXCLK,
                CE=>XLXN_49,
                CLR=>CLR,
                SLI=>XLXN_15,
                Q(15 downto 0)=>XLXN_40(15 downto 0));
   
   XLXI_17 : bus_reverser_MUSER_main
      port map (I(15 downto 0)=>XLXN_41(15 downto 0),
                O(15 downto 0)=>XLXN_43(15 downto 0));
   
   XLXI_18 : bus_reverser_MUSER_main
      port map (I(15 downto 0)=>XLXN_40(15 downto 0),
                O(15 downto 0)=>XLXN_42(15 downto 0));
   
   XLXI_19 : FD16CE_HXILINX_main
      port map (C=>RXCLK,
                CE=>XLXN_203,
                CLR=>XLXN_58,
                D(15 downto 0)=>XLXN_43(15 downto 0),
                Q(15 downto 0)=>XLXN_97(15 downto 0));
   
   XLXI_20 : FD16CE_HXILINX_main
      port map (C=>RXCLK,
                CE=>XLXN_190,
                CLR=>XLXN_80,
                D(15 downto 0)=>XLXN_42(15 downto 0),
                Q(15 downto 0)=>XLXN_98(15 downto 0));
   
   XLXI_21 : CB4CE_HXILINX_main
      port map (C=>RXCLK,
                CE=>XLXN_213,
                CLR=>CLR,
                CEO=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>open,
                TC=>XLXN_65);
   
   XLXI_22 : CB4CE_HXILINX_main
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
   
   XLXI_46 : bus_splicer_MUSER_main
      port map (H(15 downto 0)=>XLXN_98(15 downto 0),
                L(15 downto 0)=>XLXN_97(15 downto 0),
                O(31 downto 0)=>XLXN_182(31 downto 0));
   
   XLXI_47 : fd32ce_MUSER_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity sys_rx_pll_wrapper_MUSER_main is
   port ( CLK     : in    std_logic; 
          RX_CLK  : out   std_logic; 
          SYS_CLK : out   std_logic);
end sys_rx_pll_wrapper_MUSER_main;

architecture BEHAVIORAL of sys_rx_pll_wrapper_MUSER_main is
   component sys_rx_clk_pll
      port ( clk_in1  : in    std_logic; 
             clk_out1 : out   std_logic; 
             clk_out2 : out   std_logic);
   end component;
   
begin
   XLXI_1 : sys_rx_clk_pll
      port map (clk_in1=>CLK,
                clk_out1=>SYS_CLK,
                clk_out2=>RX_CLK);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity vgaclk_pll_wrapper_MUSER_main is
   port ( CLK  : in    std_logic; 
          CLKO : out   std_logic);
end vgaclk_pll_wrapper_MUSER_main;

architecture BEHAVIORAL of vgaclk_pll_wrapper_MUSER_main is
   component vgaclk_pll
      port ( clk_in1  : in    std_logic; 
             clk_out1 : out   std_logic);
   end component;
   
begin
   XLXI_1 : vgaclk_pll
      port map (clk_in1=>CLK,
                clk_out1=>CLKO);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity main is
   port ( BTN1  : in    std_logic; 
          BTN2  : in    std_logic; 
          K5_1  : in    std_logic; 
          K5_3  : in    std_logic; 
          K5_5  : in    std_logic; 
          K5_7  : in    std_logic; 
          K5_9  : in    std_logic; 
          K5_11 : in    std_logic; 
          K5_13 : in    std_logic; 
          K5_15 : in    std_logic; 
          OSC   : in    std_logic; 
          K1_1  : out   std_logic; 
          K1_3  : out   std_logic; 
          K1_5  : out   std_logic; 
          K1_7  : out   std_logic; 
          K1_9  : out   std_logic; 
          K1_11 : out   std_logic; 
          K1_13 : out   std_logic; 
          K1_15 : out   std_logic);
end main;

architecture BEHAVIORAL of main is
   attribute INIT             : string ;
   attribute BOX_TYPE         : string ;
   attribute HU_SET           : string ;
   attribute IOSTANDARD       : string ;
   attribute DIFF_TERM        : string ;
   attribute IBUF_DELAY_VALUE : string ;
   attribute IFD_DELAY_VALUE  : string ;
   signal CLK         : std_logic;
   signal CLR         : std_logic_vector (3 downto 0);
   signal CRS_DOM     : std_logic_vector (31 downto 0);
   signal DISP_ADDR   : std_logic_vector (15 downto 0);
   signal DISP_ADDR_X : std_logic_vector (7 downto 0);
   signal DISP_ADDR_Y : std_logic_vector (7 downto 0);
   signal DISP_EN     : std_logic;
   signal DRAW_ADDR   : std_logic_vector (15 downto 0);
   signal D1          : std_logic;
   signal D2          : std_logic;
   signal HSYNC       : std_logic;
   signal H_CNT       : std_logic_vector (10 downto 0);
   signal H_298       : std_logic;
   signal H_1066      : std_logic;
   signal H_1435      : std_logic;
   signal H_1578      : std_logic;
   signal STARTED     : std_logic;
   signal S1          : std_logic;
   signal S2          : std_logic;
   signal VGA_CLK     : std_logic;
   signal VSYNC       : std_logic;
   signal XLXN_77     : std_logic;
   signal XLXN_120    : std_logic;
   signal XLXN_339    : std_logic;
   signal XLXN_341    : std_logic;
   signal XLXN_344    : std_logic;
   signal XLXN_347    : std_logic;
   signal XLXN_348    : std_logic;
   signal XLXN_349    : std_logic;
   signal XLXN_350    : std_logic;
   signal XLXN_352    : std_logic;
   signal XLXN_353    : std_logic;
   signal XLXN_354    : std_logic;
   signal XLXN_355    : std_logic;
   signal XLXN_356    : std_logic;
   signal XLXN_357    : std_logic;
   signal XLXN_358    : std_logic;
   signal XLXN_359    : std_logic;
   signal XLXN_361    : std_logic;
   signal XLXN_363    : std_logic;
   signal XLXN_374    : std_logic;
   signal XLXN_376    : std_logic;
   signal XLXN_404    : std_logic;
   signal XLXN_405    : std_logic;
   signal XLXN_406    : std_logic;
   signal XLXN_407    : std_logic;
   signal XLXN_408    : std_logic;
   signal XLXN_409    : std_logic;
   signal XLXN_410    : std_logic;
   signal XLXN_411    : std_logic;
   signal XLXN_412    : std_logic;
   signal XLXN_413    : std_logic;
   signal XLXN_414    : std_logic;
   signal XLXN_415    : std_logic;
   signal XLXN_416    : std_logic;
   signal XLXN_418    : std_logic;
   signal XLXN_419    : std_logic;
   signal XLXN_420    : std_logic;
   signal XLXN_421    : std_logic;
   signal XLXN_422    : std_logic;
   signal XLXN_423    : std_logic;
   signal XLXN_425    : std_logic;
   signal XLXN_426    : std_logic;
   signal XLXN_698    : std_logic;
   signal XLXN_701    : std_logic;
   signal XLXN_702    : std_logic;
   signal XLXN_703    : std_logic;
   signal XLXN_772    : std_logic;
   signal XLXN_779    : std_logic;
   signal XLXN_793    : std_logic;
   signal XLXN_794    : std_logic;
   signal XLXN_795    : std_logic;
   signal XLXN_817    : std_logic;
   signal XLXN_935    : std_logic;
   signal XLXN_936    : std_logic;
   signal XLXN_937    : std_logic;
   signal XLXN_939    : std_logic;
   signal XLXN_940    : std_logic;
   signal XLXN_957    : std_logic_vector (3 downto 0);
   signal XLXN_1248   : std_logic_vector (3 downto 0);
   signal XLXN_1271   : std_logic;
   signal XLXN_1281   : std_logic;
   signal XLXN_1874   : std_logic;
   signal XLXN_2204   : std_logic_vector (31 downto 0);
   signal XLXN_2205   : std_logic_vector (31 downto 0);
   signal XLXN_2206   : std_logic;
   signal XLXN_2208   : std_logic;
   signal XLXN_2449   : std_logic;
   signal XLXN_2450   : std_logic;
   signal XLXN_2451   : std_logic;
   signal XLXN_2452   : std_logic;
   signal XLXN_2453   : std_logic;
   signal XLXN_2454   : std_logic;
   signal XLXN_2456   : std_logic;
   signal XLXN_2458   : std_logic;
   signal XLXN_2471   : std_logic;
   signal Y_CNT       : std_logic_vector (9 downto 0);
   signal Y_767       : std_logic;
   signal Y_770       : std_logic;
   signal Y_773       : std_logic;
   signal Y_797       : std_logic;
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
   
   component FJKCE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             J   : in    std_logic; 
             K   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component CB8CE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (7 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component spacewire_rx_x2_MUSER_main
      port ( CLR   : in    std_logic; 
             D1    : in    std_logic; 
             D2    : in    std_logic; 
             DATA  : out   std_logic_vector (31 downto 0); 
             RXCLK : in    std_logic; 
             S1    : in    std_logic; 
             S2    : in    std_logic);
   end component;
   
   component IBUFDS
      -- synopsys translate_off
      generic( DIFF_TERM : boolean :=  FALSE);
      -- synopsys translate_on
      port ( I  : in    std_logic; 
             IB : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFDS : component is "DEFAULT";
   attribute DIFF_TERM of IBUFDS : component is "FALSE";
   attribute IBUF_DELAY_VALUE of IBUFDS : component is "0";
   attribute IFD_DELAY_VALUE of IBUFDS : component is "AUTO";
   attribute BOX_TYPE of IBUFDS : component is "BLACK_BOX";
   
   component vgaclk_pll_wrapper_MUSER_main
      port ( CLK  : in    std_logic; 
             CLKO : out   std_logic);
   end component;
   
   component h_counter_wrapper_MUSER_main
      port ( CE  : in    std_logic; 
             CLK : in    std_logic; 
             Q   : out   std_logic_vector (10 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component v_counter_wrapper_MUSER_main
      port ( CE  : in    std_logic; 
             CLK : in    std_logic; 
             Q   : out   std_logic_vector (9 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND12_HXILINX_main
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component buf4be_MUSER_main
      port ( Enable : in    std_logic; 
             I      : in    std_logic_vector (3 downto 0); 
             O      : out   std_logic_vector (3 downto 0));
   end component;
   
   component decoder_MUSER_main
      port ( ADDR : out   std_logic_vector (15 downto 0); 
             CLR  : out   std_logic_vector (3 downto 0); 
             INST : in    std_logic_vector (31 downto 0));
   end component;
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component sdp_vram_wrapper_MUSER_main
      port ( DIN  : in    std_logic_vector (3 downto 0); 
             DO   : out   std_logic_vector (3 downto 0); 
             RAD  : in    std_logic_vector (15 downto 0); 
             RCLK : in    std_logic; 
             WAD  : in    std_logic_vector (15 downto 0); 
             WCLK : in    std_logic; 
             WE   : in    std_logic);
   end component;
   
   component sys_rx_pll_wrapper_MUSER_main
      port ( CLK     : in    std_logic; 
             RX_CLK  : out   std_logic; 
             SYS_CLK : out   std_logic);
   end component;
   
   component fd32ce_MUSER_main
      port ( CE  : in    std_logic; 
             CLK : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (31 downto 0); 
             Q   : out   std_logic_vector (31 downto 0));
   end component;
   
   component FDCE
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   attribute INIT of B1 : label is "1DA6";
   attribute INIT of B2 : label is "F0C0";
   attribute HU_SET of DISP_X : label is "DISP_X_46";
   attribute HU_SET of DISP_X_REG : label is "DISP_X_REG_50";
   attribute HU_SET of DISP_Y : label is "DISP_Y_49";
   attribute HU_SET of DISP_Y_REG : label is "DISP_Y_REG_51";
   attribute INIT of G1 : label is "6EB8";
   attribute INIT of G2 : label is "9CC0";
   attribute INIT of R1 : label is "C7A4";
   attribute INIT of R2 : label is "E7D0";
   attribute HU_SET of SYNC_H : label is "SYNC_H_47";
   attribute HU_SET of SYNC_V : label is "SYNC_V_48";
   attribute DIFF_TERM of XLXI_1 : label is "TRUE";
   attribute DIFF_TERM of XLXI_2 : label is "TRUE";
   attribute DIFF_TERM of XLXI_3 : label is "TRUE";
   attribute DIFF_TERM of XLXI_4 : label is "TRUE";
   attribute HU_SET of XLXI_247 : label is "XLXI_247_38";
   attribute HU_SET of XLXI_248 : label is "XLXI_248_39";
   attribute HU_SET of XLXI_250 : label is "XLXI_250_40";
   attribute HU_SET of XLXI_251 : label is "XLXI_251_41";
   attribute HU_SET of XLXI_287 : label is "XLXI_287_42";
   attribute HU_SET of XLXI_288 : label is "XLXI_288_44";
   attribute HU_SET of XLXI_289 : label is "XLXI_289_43";
   attribute HU_SET of XLXI_290 : label is "XLXI_290_45";
begin
   B1 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"1DA6")
   -- synopsys translate_on
      port map (I0=>CLR(0),
                I1=>CLR(1),
                I2=>CLR(2),
                I3=>CLR(3),
                O=>XLXN_2450);
   
   B2 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"F0C0")
   -- synopsys translate_on
      port map (I0=>CLR(0),
                I1=>CLR(1),
                I2=>CLR(2),
                I3=>CLR(3),
                O=>XLXN_2449);
   
   DISP_X : FJKCE_HXILINX_main
      port map (C=>VGA_CLK,
                CE=>XLXN_935,
                CLR=>XLXN_698,
                J=>H_298,
                K=>H_1066,
                Q=>XLXN_937);
   
   DISP_X_REG : CB8CE_HXILINX_main
      port map (C=>VGA_CLK,
                CE=>XLXN_772,
                CLR=>XLXN_779,
                CEO=>XLXN_2471,
                Q(7 downto 0)=>DISP_ADDR_X(7 downto 0),
                TC=>open);
   
   DISP_Y : FJKCE_HXILINX_main
      port map (C=>VGA_CLK,
                CE=>XLXN_935,
                CLR=>XLXN_698,
                J=>Y_797,
                K=>Y_767,
                Q=>XLXN_936);
   
   DISP_Y_REG : CB8CE_HXILINX_main
      port map (C=>VGA_CLK,
                CE=>XLXN_817,
                CLR=>XLXN_779,
                CEO=>open,
                Q(7 downto 0)=>DISP_ADDR_Y(7 downto 0),
                TC=>open);
   
   G1 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"6EB8")
   -- synopsys translate_on
      port map (I0=>CLR(0),
                I1=>CLR(1),
                I2=>CLR(2),
                I3=>CLR(3),
                O=>XLXN_2452);
   
   G2 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"9CC0")
   -- synopsys translate_on
      port map (I0=>CLR(0),
                I1=>CLR(1),
                I2=>CLR(2),
                I3=>CLR(3),
                O=>XLXN_2451);
   
   Receiver : spacewire_rx_x2_MUSER_main
      port map (CLR=>BTN1,
                D1=>D1,
                D2=>D2,
                RXCLK=>XLXN_77,
                S1=>S1,
                S2=>S2,
                DATA(31 downto 0)=>CRS_DOM(31 downto 0));
   
   R1 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"C7A4")
   -- synopsys translate_on
      port map (I0=>CLR(0),
                I1=>CLR(1),
                I2=>CLR(2),
                I3=>CLR(3),
                O=>XLXN_2454);
   
   R2 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"E7D0")
   -- synopsys translate_on
      port map (I0=>CLR(0),
                I1=>CLR(1),
                I2=>CLR(2),
                I3=>CLR(3),
                O=>XLXN_2453);
   
   SYNC_H : FJKCE_HXILINX_main
      port map (C=>VGA_CLK,
                CE=>XLXN_935,
                CLR=>XLXN_698,
                J=>H_1435,
                K=>H_1578,
                Q=>XLXN_939);
   
   SYNC_V : FJKCE_HXILINX_main
      port map (C=>VGA_CLK,
                CE=>XLXN_935,
                CLR=>XLXN_698,
                J=>Y_770,
                K=>Y_773,
                Q=>XLXN_940);
   
   XLXI_1 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>K5_1,
                IB=>K5_3,
                O=>D1);
   
   XLXI_2 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>K5_5,
                IB=>K5_7,
                O=>S1);
   
   XLXI_3 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>K5_9,
                IB=>K5_11,
                O=>D2);
   
   XLXI_4 : IBUFDS
   -- synopsys translate_off
   generic map( DIFF_TERM => TRUE)
   -- synopsys translate_on
      port map (I=>K5_13,
                IB=>K5_15,
                O=>S2);
   
   XLXI_48 : vgaclk_pll_wrapper_MUSER_main
      port map (CLK=>XLXN_1271,
                CLKO=>VGA_CLK);
   
   XLXI_49 : h_counter_wrapper_MUSER_main
      port map (CE=>XLXN_935,
                CLK=>VGA_CLK,
                Q(10 downto 0)=>H_CNT(10 downto 0),
                TC=>XLXN_120);
   
   XLXI_50 : v_counter_wrapper_MUSER_main
      port map (CE=>XLXN_120,
                CLK=>VGA_CLK,
                Q(9 downto 0)=>Y_CNT(9 downto 0));
   
   XLXI_51 : VCC
      port map (P=>XLXN_935);
   
   XLXI_84 : BUF
      port map (I=>DISP_ADDR_X(0),
                O=>DISP_ADDR(0));
   
   XLXI_85 : BUF
      port map (I=>DISP_ADDR_X(1),
                O=>DISP_ADDR(1));
   
   XLXI_86 : BUF
      port map (I=>DISP_ADDR_X(2),
                O=>DISP_ADDR(2));
   
   XLXI_87 : BUF
      port map (I=>DISP_ADDR_X(3),
                O=>DISP_ADDR(3));
   
   XLXI_88 : BUF
      port map (I=>DISP_ADDR_X(4),
                O=>DISP_ADDR(4));
   
   XLXI_89 : BUF
      port map (I=>DISP_ADDR_X(5),
                O=>DISP_ADDR(5));
   
   XLXI_90 : BUF
      port map (I=>DISP_ADDR_X(6),
                O=>DISP_ADDR(6));
   
   XLXI_91 : BUF
      port map (I=>DISP_ADDR_X(7),
                O=>DISP_ADDR(7));
   
   XLXI_104 : BUF
      port map (I=>DISP_ADDR_Y(0),
                O=>DISP_ADDR(8));
   
   XLXI_105 : BUF
      port map (I=>DISP_ADDR_Y(1),
                O=>DISP_ADDR(9));
   
   XLXI_106 : BUF
      port map (I=>DISP_ADDR_Y(2),
                O=>DISP_ADDR(10));
   
   XLXI_107 : BUF
      port map (I=>DISP_ADDR_Y(3),
                O=>DISP_ADDR(11));
   
   XLXI_108 : BUF
      port map (I=>DISP_ADDR_Y(4),
                O=>DISP_ADDR(12));
   
   XLXI_109 : BUF
      port map (I=>DISP_ADDR_Y(5),
                O=>DISP_ADDR(13));
   
   XLXI_110 : BUF
      port map (I=>DISP_ADDR_Y(6),
                O=>DISP_ADDR(14));
   
   XLXI_111 : BUF
      port map (I=>DISP_ADDR_Y(7),
                O=>DISP_ADDR(15));
   
   XLXI_139 : BUF
      port map (I=>H_CNT(0),
                O=>XLXN_339);
   
   XLXI_195 : BUF
      port map (I=>H_CNT(1),
                O=>XLXN_341);
   
   XLXI_198 : INV
      port map (I=>H_CNT(2),
                O=>XLXN_344);
   
   XLXI_199 : BUF
      port map (I=>H_CNT(3),
                O=>XLXN_374);
   
   XLXI_201 : BUF
      port map (I=>H_CNT(4),
                O=>XLXN_347);
   
   XLXI_202 : INV
      port map (I=>H_CNT(4),
                O=>XLXN_348);
   
   XLXI_203 : BUF
      port map (I=>H_CNT(5),
                O=>XLXN_349);
   
   XLXI_204 : INV
      port map (I=>H_CNT(5),
                O=>XLXN_350);
   
   XLXI_206 : INV
      port map (I=>H_CNT(6),
                O=>XLXN_352);
   
   XLXI_207 : BUF
      port map (I=>H_CNT(7),
                O=>XLXN_353);
   
   XLXI_208 : INV
      port map (I=>H_CNT(7),
                O=>XLXN_354);
   
   XLXI_209 : BUF
      port map (I=>H_CNT(8),
                O=>XLXN_355);
   
   XLXI_210 : INV
      port map (I=>H_CNT(8),
                O=>XLXN_356);
   
   XLXI_211 : BUF
      port map (I=>H_CNT(9),
                O=>XLXN_357);
   
   XLXI_212 : INV
      port map (I=>H_CNT(9),
                O=>XLXN_358);
   
   XLXI_213 : BUF
      port map (I=>H_CNT(10),
                O=>XLXN_359);
   
   XLXI_214 : INV
      port map (I=>H_CNT(10),
                O=>XLXN_361);
   
   XLXI_245 : VCC
      port map (P=>XLXN_363);
   
   XLXI_247 : AND12_HXILINX_main
      port map (I0=>XLXN_376,
                I1=>XLXN_341,
                I2=>XLXN_344,
                I3=>XLXN_374,
                I4=>XLXN_348,
                I5=>XLXN_349,
                I6=>XLXN_352,
                I7=>XLXN_354,
                I8=>XLXN_355,
                I9=>XLXN_358,
                I10=>XLXN_361,
                I11=>XLXN_363,
                O=>H_298);
   
   XLXI_248 : AND12_HXILINX_main
      port map (I0=>XLXN_376,
                I1=>XLXN_341,
                I2=>XLXN_344,
                I3=>XLXN_374,
                I4=>XLXN_348,
                I5=>XLXN_349,
                I6=>XLXN_352,
                I7=>XLXN_354,
                I8=>XLXN_356,
                I9=>XLXN_358,
                I10=>XLXN_359,
                I11=>XLXN_363,
                O=>H_1066);
   
   XLXI_250 : AND12_HXILINX_main
      port map (I0=>XLXN_339,
                I1=>XLXN_341,
                I2=>XLXN_344,
                I3=>XLXN_374,
                I4=>XLXN_347,
                I5=>XLXN_350,
                I6=>XLXN_352,
                I7=>XLXN_353,
                I8=>XLXN_355,
                I9=>XLXN_358,
                I10=>XLXN_359,
                I11=>XLXN_363,
                O=>H_1435);
   
   XLXI_251 : AND12_HXILINX_main
      port map (I0=>XLXN_376,
                I1=>XLXN_341,
                I2=>XLXN_344,
                I3=>XLXN_374,
                I4=>XLXN_348,
                I5=>XLXN_349,
                I6=>XLXN_352,
                I7=>XLXN_354,
                I8=>XLXN_356,
                I9=>XLXN_357,
                I10=>XLXN_359,
                I11=>XLXN_363,
                O=>H_1578);
   
   XLXI_254 : BUF
      port map (I=>Y_CNT(0),
                O=>XLXN_404);
   
   XLXI_262 : INV
      port map (I=>H_CNT(0),
                O=>XLXN_376);
   
   XLXI_263 : INV
      port map (I=>Y_CNT(0),
                O=>XLXN_405);
   
   XLXI_264 : BUF
      port map (I=>Y_CNT(1),
                O=>XLXN_406);
   
   XLXI_265 : INV
      port map (I=>Y_CNT(1),
                O=>XLXN_407);
   
   XLXI_266 : BUF
      port map (I=>Y_CNT(2),
                O=>XLXN_408);
   
   XLXI_267 : INV
      port map (I=>Y_CNT(2),
                O=>XLXN_409);
   
   XLXI_268 : BUF
      port map (I=>Y_CNT(3),
                O=>XLXN_410);
   
   XLXI_269 : INV
      port map (I=>Y_CNT(3),
                O=>XLXN_411);
   
   XLXI_270 : BUF
      port map (I=>Y_CNT(4),
                O=>XLXN_412);
   
   XLXI_271 : INV
      port map (I=>Y_CNT(4),
                O=>XLXN_413);
   
   XLXI_272 : BUF
      port map (I=>Y_CNT(5),
                O=>XLXN_414);
   
   XLXI_273 : INV
      port map (I=>Y_CNT(5),
                O=>XLXN_415);
   
   XLXI_276 : BUF
      port map (I=>Y_CNT(6),
                O=>XLXN_416);
   
   XLXI_277 : INV
      port map (I=>Y_CNT(6),
                O=>XLXN_418);
   
   XLXI_278 : BUF
      port map (I=>Y_CNT(7),
                O=>XLXN_419);
   
   XLXI_279 : INV
      port map (I=>Y_CNT(7),
                O=>XLXN_420);
   
   XLXI_280 : BUF
      port map (I=>Y_CNT(8),
                O=>XLXN_421);
   
   XLXI_281 : INV
      port map (I=>Y_CNT(8),
                O=>XLXN_422);
   
   XLXI_282 : BUF
      port map (I=>Y_CNT(9),
                O=>XLXN_423);
   
   XLXI_284 : VCC
      port map (P=>XLXN_425);
   
   XLXI_285 : VCC
      port map (P=>XLXN_426);
   
   XLXI_287 : AND12_HXILINX_main
      port map (I0=>XLXN_404,
                I1=>XLXN_406,
                I2=>XLXN_408,
                I3=>XLXN_410,
                I4=>XLXN_412,
                I5=>XLXN_414,
                I6=>XLXN_416,
                I7=>XLXN_419,
                I8=>XLXN_422,
                I9=>XLXN_423,
                I10=>XLXN_425,
                I11=>XLXN_426,
                O=>Y_767);
   
   XLXI_288 : AND12_HXILINX_main
      port map (I0=>XLXN_405,
                I1=>XLXN_406,
                I2=>XLXN_409,
                I3=>XLXN_411,
                I4=>XLXN_413,
                I5=>XLXN_415,
                I6=>XLXN_418,
                I7=>XLXN_420,
                I8=>XLXN_421,
                I9=>XLXN_423,
                I10=>XLXN_425,
                I11=>XLXN_426,
                O=>Y_770);
   
   XLXI_289 : AND12_HXILINX_main
      port map (I0=>XLXN_404,
                I1=>XLXN_407,
                I2=>XLXN_408,
                I3=>XLXN_411,
                I4=>XLXN_413,
                I5=>XLXN_415,
                I6=>XLXN_418,
                I7=>XLXN_420,
                I8=>XLXN_421,
                I9=>XLXN_423,
                I10=>XLXN_425,
                I11=>XLXN_426,
                O=>Y_773);
   
   XLXI_290 : AND12_HXILINX_main
      port map (I0=>XLXN_404,
                I1=>XLXN_407,
                I2=>XLXN_408,
                I3=>XLXN_410,
                I4=>XLXN_412,
                I5=>XLXN_415,
                I6=>XLXN_418,
                I7=>XLXN_420,
                I8=>XLXN_421,
                I9=>XLXN_423,
                I10=>XLXN_425,
                I11=>XLXN_426,
                O=>Y_797);
   
   XLXI_479 : GND
      port map (G=>XLXN_698);
   
   XLXI_480 : FDE
      port map (C=>VGA_CLK,
                CE=>DISP_EN,
                D=>XLXN_703,
                Q=>XLXN_701);
   
   XLXI_481 : FDE
      port map (C=>VGA_CLK,
                CE=>DISP_EN,
                D=>XLXN_701,
                Q=>XLXN_702);
   
   XLXI_483 : AND2B2
      port map (I0=>XLXN_702,
                I1=>XLXN_701,
                O=>XLXN_703);
   
   XLXI_546 : FDE
      port map (C=>VGA_CLK,
                CE=>XLXN_2471,
                D=>XLXN_794,
                Q=>XLXN_795);
   
   XLXI_547 : FDE
      port map (C=>VGA_CLK,
                CE=>XLXN_2471,
                D=>XLXN_795,
                Q=>XLXN_793);
   
   XLXI_548 : AND2B2
      port map (I0=>XLXN_793,
                I1=>XLXN_795,
                O=>XLXN_794);
   
   XLXI_563 : GND
      port map (G=>XLXN_779);
   
   XLXI_594 : AND2
      port map (I0=>XLXN_936,
                I1=>XLXN_937,
                O=>DISP_EN);
   
   XLXI_595 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_939,
                Q=>HSYNC);
   
   XLXI_596 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_940,
                Q=>VSYNC);
   
   XLXI_598 : buf4be_MUSER_main
      port map (Enable=>DISP_EN,
                I(3 downto 0)=>XLXN_957(3 downto 0),
                O(3 downto 0)=>CLR(3 downto 0));
   
   XLXI_655 : decoder_MUSER_main
      port map (INST(31 downto 0)=>XLXN_2205(31 downto 0),
                ADDR(15 downto 0)=>DRAW_ADDR(15 downto 0),
                CLR(3 downto 0)=>XLXN_1248(3 downto 0));
   
   XLXI_658 : BUFG
      port map (I=>OSC,
                O=>XLXN_1271);
   
   XLXI_659 : sdp_vram_wrapper_MUSER_main
      port map (DIN(3 downto 0)=>XLXN_1248(3 downto 0),
                RAD(15 downto 0)=>DISP_ADDR(15 downto 0),
                RCLK=>VGA_CLK,
                WAD(15 downto 0)=>DRAW_ADDR(15 downto 0),
                WCLK=>CLK,
                WE=>XLXN_1281,
                DO(3 downto 0)=>XLXN_957(3 downto 0));
   
   XLXI_662 : sys_rx_pll_wrapper_MUSER_main
      port map (CLK=>XLXN_1271,
                RX_CLK=>XLXN_77,
                SYS_CLK=>CLK);
   
   XLXI_673 : VCC
      port map (P=>XLXN_1281);
   
   XLXI_874 : fd32ce_MUSER_main
      port map (CE=>STARTED,
                CLK=>CLK,
                CLR=>XLXN_1874,
                D(31 downto 0)=>CRS_DOM(31 downto 0),
                Q(31 downto 0)=>XLXN_2204(31 downto 0));
   
   XLXI_875 : GND
      port map (G=>XLXN_1874);
   
   XLXI_976 : fd32ce_MUSER_main
      port map (CE=>XLXN_2208,
                CLK=>CLK,
                CLR=>XLXN_2206,
                D(31 downto 0)=>XLXN_2204(31 downto 0),
                Q(31 downto 0)=>XLXN_2205(31 downto 0));
   
   XLXI_1074 : GND
      port map (G=>XLXN_2206);
   
   XLXI_1075 : VCC
      port map (P=>XLXN_2208);
   
   XLXI_1248 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_2454,
                Q=>K1_5);
   
   XLXI_1249 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_2453,
                Q=>K1_7);
   
   XLXI_1250 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_2452,
                Q=>K1_9);
   
   XLXI_1251 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_2451,
                Q=>K1_11);
   
   XLXI_1252 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_2450,
                Q=>K1_13);
   
   XLXI_1253 : FD
      port map (C=>VGA_CLK,
                D=>XLXN_2449,
                Q=>K1_15);
   
   XLXI_1269 : FD
      port map (C=>VGA_CLK,
                D=>VSYNC,
                Q=>K1_3);
   
   XLXI_1286 : FD
      port map (C=>VGA_CLK,
                D=>HSYNC,
                Q=>K1_1);
   
   XLXI_1287 : FDCE
      port map (C=>CLK,
                CE=>BTN2,
                CLR=>XLXN_2458,
                D=>XLXN_2456,
                Q=>STARTED);
   
   XLXI_1288 : VCC
      port map (P=>XLXN_2456);
   
   XLXI_1289 : GND
      port map (G=>XLXN_2458);
   
   XLXI_1290 : AND3B1
      port map (I0=>XLXN_701,
                I1=>XLXN_702,
                I2=>DISP_EN,
                O=>XLXN_772);
   
   XLXI_1291 : AND3B1
      port map (I0=>XLXN_795,
                I1=>XLXN_793,
                I2=>XLXN_2471,
                O=>XLXN_817);
   
end BEHAVIORAL;


