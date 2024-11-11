--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : spacewire_rx_x1.vhf
-- /___/   /\     Timestamp : 11/11/2024 00:27:31
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/spacewire_rx_x1.vhf -w D:/Personal/Projects/ILF-16/ILF-16/spacewire_rx_x1.sch
--Design Name: spacewire_rx_x1
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FD8CE_HXILINX_spacewire_rx_x1 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_spacewire_rx_x1 is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_spacewire_rx_x1;

architecture Behavioral of FD8CE_HXILINX_spacewire_rx_x1 is

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

----- CELL SR8CE_HXILINX_spacewire_rx_x1 -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR8CE_HXILINX_spacewire_rx_x1 is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    SLI : in STD_LOGIC
    );
end SR8CE_HXILINX_spacewire_rx_x1;

architecture Behavioral of SR8CE_HXILINX_spacewire_rx_x1 is
signal q_tmp : std_logic_vector(7 downto 0);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      q_tmp <= ( q_tmp(6 downto 0) & SLI );
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

entity spacewire_rx_x1 is
   port ( CLK  : in    std_logic; 
          CLR  : in    std_logic; 
          D    : in    std_logic; 
          S    : in    std_logic; 
          DATA : out   std_logic_vector (7 downto 0));
end spacewire_rx_x1;

architecture BEHAVIORAL of spacewire_rx_x1 is
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   attribute HU_SET     : string ;
   signal DES      : std_logic_vector (7 downto 0);
   signal RDES     : std_logic_vector (7 downto 0);
   signal XLXN_172 : std_logic;
   signal XLXN_173 : std_logic;
   signal XLXN_198 : std_logic;
   signal XLXN_199 : std_logic;
   signal XLXN_200 : std_logic;
   signal XLXN_201 : std_logic;
   signal XLXN_202 : std_logic;
   signal XLXN_231 : std_logic;
   signal XLXN_235 : std_logic;
   signal XLXN_236 : std_logic;
   signal XLXN_244 : std_logic;
   signal XLXN_246 : std_logic;
   signal XLXN_247 : std_logic;
   signal XLXN_253 : std_logic;
   signal XLXN_269 : std_logic;
   signal XLXN_275 : std_logic;
   signal XLXN_279 : std_logic;
   signal XLXN_285 : std_logic;
   signal XLXN_286 : std_logic;
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
   
   component SR8CE_HXILINX_spacewire_rx_x1
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             SLI : in    std_logic; 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component FD8CE_HXILINX_spacewire_rx_x1
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FDCE
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   attribute INIT of XLXI_103 : label is "6FF6";
   attribute HU_SET of XLXI_104 : label is "XLXI_104_16";
   attribute HU_SET of XLXI_114 : label is "XLXI_114_17";
begin
   D_Stabilizer : FD
      port map (C=>CLK,
                D=>D,
                Q=>XLXN_172);
   
   S_Stabilizer : FD
      port map (C=>CLK,
                D=>S,
                Q=>XLXN_173);
   
   XLXI_89 : FD
      port map (C=>CLK,
                D=>XLXN_172,
                Q=>XLXN_199);
   
   XLXI_90 : FD
      port map (C=>CLK,
                D=>XLXN_173,
                Q=>XLXN_200);
   
   XLXI_91 : FD
      port map (C=>CLK,
                D=>XLXN_199,
                Q=>XLXN_198);
   
   XLXI_92 : FD
      port map (C=>CLK,
                D=>XLXN_200,
                Q=>XLXN_201);
   
   XLXI_103 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"6FF6")
   -- synopsys translate_on
      port map (I0=>XLXN_201,
                I1=>XLXN_200,
                I2=>XLXN_198,
                I3=>XLXN_199,
                O=>XLXN_202);
   
   XLXI_104 : SR8CE_HXILINX_spacewire_rx_x1
      port map (C=>CLK,
                CE=>XLXN_202,
                CLR=>CLR,
                SLI=>XLXN_199,
                Q(7 downto 0)=>RDES(7 downto 0));
   
   XLXI_106 : BUF
      port map (I=>RDES(7),
                O=>DES(0));
   
   XLXI_107 : BUF
      port map (I=>RDES(6),
                O=>DES(1));
   
   XLXI_108 : BUF
      port map (I=>RDES(5),
                O=>DES(2));
   
   XLXI_109 : BUF
      port map (I=>RDES(4),
                O=>DES(3));
   
   XLXI_110 : BUF
      port map (I=>RDES(3),
                O=>DES(4));
   
   XLXI_111 : BUF
      port map (I=>RDES(2),
                O=>DES(5));
   
   XLXI_112 : BUF
      port map (I=>RDES(1),
                O=>DES(6));
   
   XLXI_113 : BUF
      port map (I=>RDES(0),
                O=>DES(7));
   
   XLXI_114 : FD8CE_HXILINX_spacewire_rx_x1
      port map (C=>CLK,
                CE=>XLXN_286,
                CLR=>XLXN_231,
                D(7 downto 0)=>DES(7 downto 0),
                Q(7 downto 0)=>DATA(7 downto 0));
   
   XLXI_115 : GND
      port map (G=>XLXN_231);
   
   XLXI_124 : FDCE
      port map (C=>CLK,
                CE=>XLXN_202,
                CLR=>CLR,
                D=>XLXN_253,
                Q=>XLXN_275);
   
   XLXI_125 : FDCE
      port map (C=>CLK,
                CE=>XLXN_235,
                CLR=>CLR,
                D=>XLXN_244,
                Q=>XLXN_269);
   
   XLXI_126 : FDCE
      port map (C=>CLK,
                CE=>XLXN_236,
                CLR=>CLR,
                D=>XLXN_247,
                Q=>XLXN_246);
   
   XLXI_127 : AND2
      port map (I0=>XLXN_202,
                I1=>XLXN_275,
                O=>XLXN_235);
   
   XLXI_133 : INV
      port map (I=>XLXN_275,
                O=>XLXN_253);
   
   XLXI_134 : INV
      port map (I=>XLXN_269,
                O=>XLXN_244);
   
   XLXI_136 : INV
      port map (I=>XLXN_246,
                O=>XLXN_247);
   
   XLXI_137 : AND3
      port map (I0=>XLXN_202,
                I1=>XLXN_269,
                I2=>XLXN_275,
                O=>XLXN_236);
   
   XLXI_146 : AND3
      port map (I0=>XLXN_246,
                I1=>XLXN_269,
                I2=>XLXN_275,
                O=>XLXN_279);
   
   XLXI_148 : FDE
      port map (C=>CLK,
                CE=>XLXN_285,
                D=>XLXN_279,
                Q=>XLXN_286);
   
   XLXI_150 : OR2
      port map (I0=>XLXN_202,
                I1=>XLXN_286,
                O=>XLXN_285);
   
end BEHAVIORAL;


