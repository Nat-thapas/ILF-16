--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : spacewire_tx_x2.vhf
-- /___/   /\     Timestamp : 11/11/2024 17:53:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/spacewire_tx_x2.vhf -w D:/Personal/Projects/ILF-16/ILF-16/spacewire_tx_x2.sch
--Design Name: spacewire_tx_x2
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FJKCE_HXILINX_spacewire_tx_x2 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FJKCE_HXILINX_spacewire_tx_x2 is
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
end FJKCE_HXILINX_spacewire_tx_x2;

architecture Behavioral of FJKCE_HXILINX_spacewire_tx_x2 is
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

----- CELL CB4CE_HXILINX_spacewire_tx_x2 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CE_HXILINX_spacewire_tx_x2 is
  
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
end CB4CE_HXILINX_spacewire_tx_x2;

architecture Behavioral of CB4CE_HXILINX_spacewire_tx_x2 is

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

----- CELL M2_1_HXILINX_spacewire_tx_x2 -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_spacewire_tx_x2 is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_spacewire_tx_x2;

architecture M2_1_HXILINX_spacewire_tx_x2_V of M2_1_HXILINX_spacewire_tx_x2 is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_spacewire_tx_x2_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity spacewire_tx_x2 is
   port ( BGN  : in    std_logic; 
          CE   : in    std_logic; 
          CLK  : in    std_logic; 
          CLR  : in    std_logic; 
          DATA : in    std_logic_vector (31 downto 0); 
          D1   : out   std_logic; 
          D2   : out   std_logic; 
          S1   : out   std_logic; 
          S2   : out   std_logic);
end spacewire_tx_x2;

architecture BEHAVIORAL of spacewire_tx_x2 is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal CLRNTXE  : std_logic;
   signal SER1     : std_logic;
   signal SER2     : std_logic;
   signal STP      : std_logic;
   signal TXC1     : std_logic;
   signal TXC2     : std_logic;
   signal TXE      : std_logic;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_15  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_20  : std_logic;
   signal XLXN_24  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_29  : std_logic;
   signal XLXN_30  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_39  : std_logic;
   signal XLXN_40  : std_logic;
   signal XLXN_44  : std_logic;
   signal XLXN_45  : std_logic;
   signal XLXN_49  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_54  : std_logic;
   signal XLXN_55  : std_logic;
   signal XLXN_59  : std_logic;
   signal XLXN_60  : std_logic;
   signal XLXN_64  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_69  : std_logic;
   signal XLXN_70  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_75  : std_logic;
   signal XLXN_89  : std_logic;
   signal XLXN_190 : std_logic;
   signal XLXN_191 : std_logic;
   signal XLXN_192 : std_logic;
   signal XLXN_197 : std_logic;
   signal XLXN_198 : std_logic;
   signal XLXN_200 : std_logic;
   signal XLXN_201 : std_logic;
   signal XLXN_203 : std_logic;
   signal XLXN_204 : std_logic;
   signal XLXN_206 : std_logic;
   signal XLXN_207 : std_logic;
   signal XLXN_209 : std_logic;
   signal XLXN_210 : std_logic;
   signal XLXN_212 : std_logic;
   signal XLXN_213 : std_logic;
   signal XLXN_215 : std_logic;
   signal XLXN_216 : std_logic;
   signal XLXN_218 : std_logic;
   signal XLXN_219 : std_logic;
   signal XLXN_221 : std_logic;
   signal XLXN_222 : std_logic;
   signal XLXN_224 : std_logic;
   signal XLXN_225 : std_logic;
   signal XLXN_227 : std_logic;
   signal XLXN_228 : std_logic;
   signal XLXN_230 : std_logic;
   signal XLXN_231 : std_logic;
   signal XLXN_233 : std_logic;
   signal XLXN_234 : std_logic;
   signal XLXN_236 : std_logic;
   signal XLXN_297 : std_logic;
   signal XLXN_299 : std_logic;
   signal XLXN_305 : std_logic;
   signal XLXN_306 : std_logic;
   signal XLXN_365 : std_logic;
   signal XLXN_764 : std_logic;
   signal XLXN_768 : std_logic;
   signal XLXN_769 : std_logic;
   signal XLXN_788 : std_logic;
   component FDCE
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component M2_1_HXILINX_spacewire_tx_x2
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component FJKCE_HXILINX_spacewire_tx_x2
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             J   : in    std_logic; 
             K   : in    std_logic; 
             Q   : out   std_logic);
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
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component CB4CE_HXILINX_spacewire_tx_x2
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
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_564";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_565";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_566";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_567";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_568";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_569";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_570";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_571";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_572";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_573";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_574";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_575";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_576";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_577";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_578";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_580";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_581";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_582";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_583";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_584";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_585";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_586";
   attribute HU_SET of XLXI_81 : label is "XLXI_81_587";
   attribute HU_SET of XLXI_83 : label is "XLXI_83_588";
   attribute HU_SET of XLXI_85 : label is "XLXI_85_589";
   attribute HU_SET of XLXI_87 : label is "XLXI_87_590";
   attribute HU_SET of XLXI_89 : label is "XLXI_89_591";
   attribute HU_SET of XLXI_91 : label is "XLXI_91_592";
   attribute HU_SET of XLXI_93 : label is "XLXI_93_593";
   attribute HU_SET of XLXI_95 : label is "XLXI_95_594";
   attribute HU_SET of XLXI_97 : label is "XLXI_97_595";
   attribute HU_SET of XLXI_107 : label is "XLXI_107_579";
begin
   XLXI_1 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>DATA(15),
                Q=>XLXN_1);
   
   XLXI_2 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(14),
                D1=>XLXN_1,
                S0=>TXE,
                O=>XLXN_3);
   
   XLXI_3 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_3,
                Q=>XLXN_2);
   
   XLXI_4 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(13),
                D1=>XLXN_2,
                S0=>TXE,
                O=>XLXN_15);
   
   XLXI_5 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_15,
                Q=>XLXN_14);
   
   XLXI_6 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(12),
                D1=>XLXN_14,
                S0=>TXE,
                O=>XLXN_20);
   
   XLXI_7 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_20,
                Q=>XLXN_19);
   
   XLXI_8 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(11),
                D1=>XLXN_19,
                S0=>TXE,
                O=>XLXN_25);
   
   XLXI_9 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_25,
                Q=>XLXN_24);
   
   XLXI_10 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(10),
                D1=>XLXN_24,
                S0=>TXE,
                O=>XLXN_30);
   
   XLXI_11 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_30,
                Q=>XLXN_29);
   
   XLXI_12 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(9),
                D1=>XLXN_29,
                S0=>TXE,
                O=>XLXN_35);
   
   XLXI_13 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_35,
                Q=>XLXN_34);
   
   XLXI_14 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(8),
                D1=>XLXN_34,
                S0=>TXE,
                O=>XLXN_40);
   
   XLXI_15 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_40,
                Q=>XLXN_39);
   
   XLXI_16 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(7),
                D1=>XLXN_39,
                S0=>TXE,
                O=>XLXN_45);
   
   XLXI_17 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_45,
                Q=>XLXN_44);
   
   XLXI_18 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(6),
                D1=>XLXN_44,
                S0=>TXE,
                O=>XLXN_50);
   
   XLXI_19 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_50,
                Q=>XLXN_49);
   
   XLXI_20 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(5),
                D1=>XLXN_49,
                S0=>TXE,
                O=>XLXN_55);
   
   XLXI_21 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_55,
                Q=>XLXN_54);
   
   XLXI_22 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(4),
                D1=>XLXN_54,
                S0=>TXE,
                O=>XLXN_60);
   
   XLXI_23 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_60,
                Q=>XLXN_59);
   
   XLXI_24 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(3),
                D1=>XLXN_59,
                S0=>TXE,
                O=>XLXN_65);
   
   XLXI_25 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_65,
                Q=>XLXN_64);
   
   XLXI_26 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(2),
                D1=>XLXN_64,
                S0=>TXE,
                O=>XLXN_70);
   
   XLXI_27 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_70,
                Q=>XLXN_69);
   
   XLXI_28 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(1),
                D1=>XLXN_69,
                S0=>TXE,
                O=>XLXN_75);
   
   XLXI_29 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_75,
                Q=>XLXN_74);
   
   XLXI_30 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(0),
                D1=>XLXN_74,
                S0=>TXE,
                O=>XLXN_89);
   
   XLXI_33 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_89,
                Q=>SER1);
   
   XLXI_66 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>DATA(31),
                Q=>XLXN_190);
   
   XLXI_67 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(30),
                D1=>XLXN_190,
                S0=>TXE,
                O=>XLXN_192);
   
   XLXI_68 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_192,
                Q=>XLXN_191);
   
   XLXI_69 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(29),
                D1=>XLXN_191,
                S0=>TXE,
                O=>XLXN_198);
   
   XLXI_70 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_198,
                Q=>XLXN_197);
   
   XLXI_71 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(28),
                D1=>XLXN_197,
                S0=>TXE,
                O=>XLXN_201);
   
   XLXI_72 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_201,
                Q=>XLXN_200);
   
   XLXI_73 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(27),
                D1=>XLXN_200,
                S0=>TXE,
                O=>XLXN_204);
   
   XLXI_74 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_204,
                Q=>XLXN_203);
   
   XLXI_75 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(26),
                D1=>XLXN_203,
                S0=>TXE,
                O=>XLXN_207);
   
   XLXI_76 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_207,
                Q=>XLXN_206);
   
   XLXI_77 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(25),
                D1=>XLXN_206,
                S0=>TXE,
                O=>XLXN_210);
   
   XLXI_78 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_210,
                Q=>XLXN_209);
   
   XLXI_79 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(24),
                D1=>XLXN_209,
                S0=>TXE,
                O=>XLXN_213);
   
   XLXI_80 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_213,
                Q=>XLXN_212);
   
   XLXI_81 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(23),
                D1=>XLXN_212,
                S0=>TXE,
                O=>XLXN_216);
   
   XLXI_82 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_216,
                Q=>XLXN_215);
   
   XLXI_83 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(22),
                D1=>XLXN_215,
                S0=>TXE,
                O=>XLXN_219);
   
   XLXI_84 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_219,
                Q=>XLXN_218);
   
   XLXI_85 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(21),
                D1=>XLXN_218,
                S0=>TXE,
                O=>XLXN_222);
   
   XLXI_86 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_222,
                Q=>XLXN_221);
   
   XLXI_87 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(20),
                D1=>XLXN_221,
                S0=>TXE,
                O=>XLXN_225);
   
   XLXI_88 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_225,
                Q=>XLXN_224);
   
   XLXI_89 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(19),
                D1=>XLXN_224,
                S0=>TXE,
                O=>XLXN_228);
   
   XLXI_90 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_228,
                Q=>XLXN_227);
   
   XLXI_91 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(18),
                D1=>XLXN_227,
                S0=>TXE,
                O=>XLXN_231);
   
   XLXI_92 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_231,
                Q=>XLXN_230);
   
   XLXI_93 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(17),
                D1=>XLXN_230,
                S0=>TXE,
                O=>XLXN_234);
   
   XLXI_94 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_234,
                Q=>XLXN_233);
   
   XLXI_95 : M2_1_HXILINX_spacewire_tx_x2
      port map (D0=>DATA(16),
                D1=>XLXN_233,
                S0=>TXE,
                O=>XLXN_236);
   
   XLXI_96 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>XLXN_236,
                Q=>SER2);
   
   XLXI_97 : FJKCE_HXILINX_spacewire_tx_x2
      port map (C=>CLK,
                CE=>CE,
                CLR=>XLXN_297,
                J=>BGN,
                K=>STP,
                Q=>XLXN_788);
   
   XLXI_98 : GND
      port map (G=>XLXN_297);
   
   XLXI_99 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>SER1,
                Q=>XLXN_305);
   
   XLXI_100 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>XLXN_299,
                Q=>TXC1);
   
   XLXI_101 : INV
      port map (I=>TXC1,
                O=>XLXN_299);
   
   XLXI_104 : XOR2
      port map (I0=>TXC1,
                I1=>XLXN_305,
                O=>XLXN_306);
   
   XLXI_105 : FD
      port map (C=>CLK,
                D=>XLXN_305,
                Q=>D1);
   
   XLXI_106 : FD
      port map (C=>CLK,
                D=>XLXN_306,
                Q=>S1);
   
   XLXI_107 : CB4CE_HXILINX_spacewire_tx_x2
      port map (C=>CLK,
                CE=>TXE,
                CLR=>XLXN_365,
                CEO=>open,
                Q0=>open,
                Q1=>open,
                Q2=>open,
                Q3=>open,
                TC=>STP);
   
   XLXI_108 : GND
      port map (G=>XLXN_365);
   
   XLXI_119 : AND2B1
      port map (I0=>TXE,
                I1=>CLR,
                O=>CLRNTXE);
   
   XLXI_254 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>XLXN_764,
                Q=>TXC2);
   
   XLXI_255 : INV
      port map (I=>TXC2,
                O=>XLXN_764);
   
   XLXI_256 : XOR2
      port map (I0=>TXC2,
                I1=>XLXN_768,
                O=>XLXN_769);
   
   XLXI_257 : FD
      port map (C=>CLK,
                D=>XLXN_769,
                Q=>S2);
   
   XLXI_258 : FDE
      port map (C=>CLK,
                CE=>TXE,
                D=>SER2,
                Q=>XLXN_768);
   
   XLXI_259 : FD
      port map (C=>CLK,
                D=>XLXN_768,
                Q=>D2);
   
   XLXI_266 : AND2
      port map (I0=>CE,
                I1=>XLXN_788,
                O=>TXE);
   
end BEHAVIORAL;


