--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : fd32ce.vhf
-- /___/   /\     Timestamp : 11/11/2024 01:07:01
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/fd32ce.vhf -w D:/Personal/Projects/ILF-16/ILF-16/fd32ce.sch
--Design Name: fd32ce
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD16CE_HXILINX_fd32ce -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD16CE_HXILINX_fd32ce is
port (
    Q   : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(15 downto 0)
    );
end FD16CE_HXILINX_fd32ce;

architecture Behavioral of FD16CE_HXILINX_fd32ce is

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

entity fd32ce is
   port ( CE  : in    std_logic; 
          CLK : in    std_logic; 
          CLR : in    std_logic; 
          D   : in    std_logic_vector (31 downto 0); 
          Q   : out   std_logic_vector (31 downto 0));
end fd32ce;

architecture BEHAVIORAL of fd32ce is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal DH  : std_logic_vector (15 downto 0);
   signal DL  : std_logic_vector (15 downto 0);
   signal QH  : std_logic_vector (15 downto 0);
   signal QL  : std_logic_vector (15 downto 0);
   component FD16CE_HXILINX_fd32ce
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_281";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_282";
begin
   XLXI_1 : FD16CE_HXILINX_fd32ce
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLR,
                D(15 downto 0)=>DL(15 downto 0),
                Q(15 downto 0)=>QL(15 downto 0));
   
   XLXI_2 : FD16CE_HXILINX_fd32ce
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


