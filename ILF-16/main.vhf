--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : main.vhf
-- /___/   /\     Timestamp : 11/11/2024 22:45:04
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/main.vhf -w D:/Personal/Projects/ILF-16/ILF-16/main.sch
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

----- CELL FD8CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_main is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_main;

architecture Behavioral of FD8CE_HXILINX_main is

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

----- CELL NOR12_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOR12_HXILINX_main is
  
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
end NOR12_HXILINX_main;

architecture NOR12_HXILINX_main_V of NOR12_HXILINX_main is
begin
  O <= not (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11);
end NOR12_HXILINX_main_V;
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

----- CELL NOR16_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOR16_HXILINX_main is
  
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
end NOR16_HXILINX_main;

architecture NOR16_HXILINX_main_V of NOR16_HXILINX_main is
begin
  O <= not (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11 or I12 or I13 or I14 or I15);
end NOR16_HXILINX_main_V;
----- CELL M2_1E_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_main is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_main;

architecture M2_1E_HXILINX_main_V of M2_1E_HXILINX_main is
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
end M2_1E_HXILINX_main_V;
----- CELL D4_16E_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D4_16E_HXILINX_main is
  
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
end D4_16E_HXILINX_main;

architecture D4_16E_HXILINX_main_V of D4_16E_HXILINX_main is
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

end D4_16E_HXILINX_main_V;
----- CELL COMPM16_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPM16_HXILINX_main is
port(
    GT  : out std_logic;
    LT  : out std_logic;

    A   : in std_logic_vector(15 downto 0);
    B   : in std_logic_vector(15 downto 0)
  );
end COMPM16_HXILINX_main;

architecture COMPM16_HXILINX_main_V of COMPM16_HXILINX_main is
begin
     
  GT <= '1' when ( A > B ) else '0';
  LT <= '1' when ( A < B ) else '0';

end COMPM16_HXILINX_main_V;
----- CELL OR16_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR16_HXILINX_main is
  
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
end OR16_HXILINX_main;

architecture OR16_HXILINX_main_V of OR16_HXILINX_main is
begin
  O <=  (I0 or I1 or I2 or I3 or I4 or I5 or I6 or I7 or I8 or I9 or I10 or I11 or I12 or I13 or I14 or I15);
end OR16_HXILINX_main_V;
----- CELL CB16CLED_HXILINX_main -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CLED_HXILINX_main is
port (
       CEO : out STD_LOGIC;
       Q   : out STD_LOGIC_VECTOR(15 downto 0);
       TC  : out STD_LOGIC;
       C   : in STD_LOGIC;
       CE  : in STD_LOGIC;
       CLR : in STD_LOGIC;
       D   : in STD_LOGIC_VECTOR (15 downto 0);	
       L   : in STD_LOGIC;
       UP  : in STD_LOGIC );
end CB16CLED_HXILINX_main;

architecture Behavioral of CB16CLED_HXILINX_main is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

  constant TERMINAL_COUNT_UP : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  constant TERMINAL_COUNT_DOWN : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (L = '1') then
      COUNT <= D;
    elsif (CE='1') then
      if (UP='1') then
        COUNT <= COUNT+1;
      elsif (UP='0') then
        COUNT <= COUNT-1;
      end if;
    end if;
  end if;
end process;

TC  <= '0' when  (CLR = '1') else 
       '1' when  (((COUNT = TERMINAL_COUNT_UP) and (UP = '1')) or 
        ((COUNT = TERMINAL_COUNT_DOWN) and (UP = '0'))) else '0'; 
CEO <= '1' when  ((((COUNT = TERMINAL_COUNT_UP) and (UP = '1')) or 
        ((COUNT = TERMINAL_COUNT_DOWN) and (UP = '0'))) and CE='1') else '0'; 

Q   <= COUNT;

end Behavioral;
----- CELL CB16CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CE_HXILINX_main is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB16CE_HXILINX_main;

architecture Behavioral of CB16CE_HXILINX_main is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  
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

----- CELL M4_1E_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_main is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_main;

architecture M4_1E_HXILINX_main_V of M4_1E_HXILINX_main is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_main_V;
----- CELL SR8CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR8CE_HXILINX_main is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0);
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    SLI : in STD_LOGIC
    );
end SR8CE_HXILINX_main;

architecture Behavioral of SR8CE_HXILINX_main is
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

----- CELL M2_1_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_main is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_main;

architecture M2_1_HXILINX_main_V of M2_1_HXILINX_main is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_main_V;
----- CELL ADSU16_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADSU16_HXILINX_main is
port(
    CO   : out std_logic;
    OFL  : out std_logic;
    S    : out std_logic_vector(15 downto 0);

    A    : in std_logic_vector(15 downto 0);
    ADD  : in std_logic;
    B    : in std_logic_vector(15 downto 0);
    CI   : in std_logic
  );
end ADSU16_HXILINX_main;

architecture ADSU16_HXILINX_main_V of ADSU16_HXILINX_main is

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
  
end ADSU16_HXILINX_main_V;
----- CELL XNOR8_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity XNOR8_HXILINX_main is
  
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
end XNOR8_HXILINX_main;

architecture XNOR8_HXILINX_main_V of XNOR8_HXILINX_main is
begin
  O <= not (I0 xor I1 xor I2 xor I3 xor I4 xor I5 xor I6 xor I7);
end XNOR8_HXILINX_main_V;
----- CELL COMP16_HXILINX_main -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMP16_HXILINX_main is
port(
    EQ  : out std_logic;

    A   : in std_logic_vector(15 downto 0);
    B   : in std_logic_vector(15 downto 0)
  );
end COMP16_HXILINX_main;

architecture COMP16_HXILINX_main_V of COMP16_HXILINX_main is
begin
  EQ <= '1' when (A=B) else '0';
end COMP16_HXILINX_main_V;
----- CELL CB2CE_HXILINX_main -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_main is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_main;

architecture Behavioral of CB2CE_HXILINX_main is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');
  
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

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity spacewire_tx_x2_MUSER_main is
   port ( BGN  : in    std_logic; 
          CE   : in    std_logic; 
          CLK  : in    std_logic; 
          CLR  : in    std_logic; 
          DATA : in    std_logic_vector (31 downto 0); 
          D1   : out   std_logic; 
          D2   : out   std_logic; 
          S1   : out   std_logic; 
          S2   : out   std_logic);
end spacewire_tx_x2_MUSER_main;

architecture BEHAVIORAL of spacewire_tx_x2_MUSER_main is
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
   
   component M2_1_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component FJKCE_HXILINX_main
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
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_565";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_566";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_567";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_568";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_569";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_570";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_571";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_572";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_573";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_574";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_575";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_576";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_577";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_578";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_579";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_581";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_582";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_583";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_584";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_585";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_586";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_587";
   attribute HU_SET of XLXI_81 : label is "XLXI_81_588";
   attribute HU_SET of XLXI_83 : label is "XLXI_83_589";
   attribute HU_SET of XLXI_85 : label is "XLXI_85_590";
   attribute HU_SET of XLXI_87 : label is "XLXI_87_591";
   attribute HU_SET of XLXI_89 : label is "XLXI_89_592";
   attribute HU_SET of XLXI_91 : label is "XLXI_91_593";
   attribute HU_SET of XLXI_93 : label is "XLXI_93_594";
   attribute HU_SET of XLXI_95 : label is "XLXI_95_595";
   attribute HU_SET of XLXI_97 : label is "XLXI_97_596";
   attribute HU_SET of XLXI_107 : label is "XLXI_107_580";
begin
   XLXI_1 : FDCE
      port map (C=>CLK,
                CE=>CE,
                CLR=>CLRNTXE,
                D=>DATA(15),
                Q=>XLXN_1);
   
   XLXI_2 : M2_1_HXILINX_main
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
   
   XLXI_4 : M2_1_HXILINX_main
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
   
   XLXI_6 : M2_1_HXILINX_main
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
   
   XLXI_8 : M2_1_HXILINX_main
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
   
   XLXI_10 : M2_1_HXILINX_main
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
   
   XLXI_12 : M2_1_HXILINX_main
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
   
   XLXI_14 : M2_1_HXILINX_main
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
   
   XLXI_16 : M2_1_HXILINX_main
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
   
   XLXI_18 : M2_1_HXILINX_main
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
   
   XLXI_20 : M2_1_HXILINX_main
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
   
   XLXI_22 : M2_1_HXILINX_main
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
   
   XLXI_24 : M2_1_HXILINX_main
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
   
   XLXI_26 : M2_1_HXILINX_main
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
   
   XLXI_28 : M2_1_HXILINX_main
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
   
   XLXI_30 : M2_1_HXILINX_main
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
   
   XLXI_67 : M2_1_HXILINX_main
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
   
   XLXI_69 : M2_1_HXILINX_main
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
   
   XLXI_71 : M2_1_HXILINX_main
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
   
   XLXI_73 : M2_1_HXILINX_main
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
   
   XLXI_75 : M2_1_HXILINX_main
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
   
   XLXI_77 : M2_1_HXILINX_main
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
   
   XLXI_79 : M2_1_HXILINX_main
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
   
   XLXI_81 : M2_1_HXILINX_main
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
   
   XLXI_83 : M2_1_HXILINX_main
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
   
   XLXI_85 : M2_1_HXILINX_main
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
   
   XLXI_87 : M2_1_HXILINX_main
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
   
   XLXI_89 : M2_1_HXILINX_main
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
   
   XLXI_91 : M2_1_HXILINX_main
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
   
   XLXI_93 : M2_1_HXILINX_main
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
   
   XLXI_95 : M2_1_HXILINX_main
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
   
   XLXI_97 : FJKCE_HXILINX_main
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
   
   XLXI_107 : CB4CE_HXILINX_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity gfx_inst_encoder_MUSER_main is
   port ( A        : in    std_logic_vector (15 downto 0); 
          B        : in    std_logic_vector (15 downto 0); 
          C        : in    std_logic_vector (15 downto 0); 
          ID       : in    std_logic_vector (7 downto 0); 
          GFX_INST : out   std_logic_vector (31 downto 0));
end gfx_inst_encoder_MUSER_main;

architecture BEHAVIORAL of gfx_inst_encoder_MUSER_main is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_4 : BUF
      port map (I=>ID(3),
                O=>GFX_INST(31));
   
   XLXI_5 : BUF
      port map (I=>ID(2),
                O=>GFX_INST(30));
   
   XLXI_6 : BUF
      port map (I=>ID(1),
                O=>GFX_INST(29));
   
   XLXI_7 : BUF
      port map (I=>ID(0),
                O=>GFX_INST(28));
   
   XLXI_8 : GND
      port map (G=>GFX_INST(27));
   
   XLXI_9 : GND
      port map (G=>GFX_INST(26));
   
   XLXI_10 : GND
      port map (G=>GFX_INST(25));
   
   XLXI_11 : GND
      port map (G=>GFX_INST(24));
   
   XLXI_12 : GND
      port map (G=>GFX_INST(23));
   
   XLXI_13 : GND
      port map (G=>GFX_INST(22));
   
   XLXI_14 : GND
      port map (G=>GFX_INST(21));
   
   XLXI_15 : GND
      port map (G=>GFX_INST(20));
   
   XLXI_16 : BUF
      port map (I=>C(3),
                O=>GFX_INST(19));
   
   XLXI_17 : BUF
      port map (I=>C(2),
                O=>GFX_INST(18));
   
   XLXI_18 : BUF
      port map (I=>C(1),
                O=>GFX_INST(17));
   
   XLXI_19 : BUF
      port map (I=>C(0),
                O=>GFX_INST(16));
   
   XLXI_20 : BUF
      port map (I=>A(7),
                O=>GFX_INST(15));
   
   XLXI_21 : BUF
      port map (I=>A(6),
                O=>GFX_INST(14));
   
   XLXI_22 : BUF
      port map (I=>A(5),
                O=>GFX_INST(13));
   
   XLXI_23 : BUF
      port map (I=>A(4),
                O=>GFX_INST(12));
   
   XLXI_24 : BUF
      port map (I=>A(3),
                O=>GFX_INST(11));
   
   XLXI_25 : BUF
      port map (I=>A(2),
                O=>GFX_INST(10));
   
   XLXI_26 : BUF
      port map (I=>A(1),
                O=>GFX_INST(9));
   
   XLXI_27 : BUF
      port map (I=>A(0),
                O=>GFX_INST(8));
   
   XLXI_28 : BUF
      port map (I=>B(7),
                O=>GFX_INST(7));
   
   XLXI_29 : BUF
      port map (I=>B(6),
                O=>GFX_INST(6));
   
   XLXI_30 : BUF
      port map (I=>B(5),
                O=>GFX_INST(5));
   
   XLXI_31 : BUF
      port map (I=>B(4),
                O=>GFX_INST(4));
   
   XLXI_32 : BUF
      port map (I=>B(3),
                O=>GFX_INST(3));
   
   XLXI_33 : BUF
      port map (I=>B(2),
                O=>GFX_INST(2));
   
   XLXI_34 : BUF
      port map (I=>B(1),
                O=>GFX_INST(1));
   
   XLXI_35 : BUF
      port map (I=>B(0),
                O=>GFX_INST(0));
   
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_597";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_598";
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

entity cu_MUSER_main is
   port ( FLG            : in    std_logic; 
          ID             : in    std_logic_vector (7 downto 0); 
          RUN            : in    std_logic; 
          STG            : in    std_logic_vector (1 downto 0); 
          ALU_OP         : out   std_logic_vector (3 downto 0); 
          ARG_BUF_CE     : out   std_logic; 
          CFIMM          : out   std_logic; 
          FLG_IDX        : out   std_logic_vector (3 downto 0); 
          FLG_INV        : out   std_logic; 
          FLG_REG_CE     : out   std_logic; 
          GFX_TX_E       : out   std_logic; 
          HLT            : out   std_logic; 
          OUT_REG_WE     : out   std_logic; 
          PC_CE          : out   std_logic; 
          PC_L           : out   std_logic; 
          RAM_WE         : out   std_logic; 
          REG_DATA_SEL_0 : out   std_logic; 
          REG_DATA_SEL_1 : out   std_logic; 
          REG_WE         : out   std_logic; 
          SET_MOV_SEL    : out   std_logic; 
          STL_CNT_L      : out   std_logic);
end cu_MUSER_main;

architecture BEHAVIORAL of cu_MUSER_main is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_81        : std_logic;
   signal XLXN_184       : std_logic;
   signal XLXN_394       : std_logic;
   signal XLXN_406       : std_logic;
   signal XLXN_454       : std_logic;
   signal XLXN_456       : std_logic;
   signal XLXN_458       : std_logic;
   signal XLXN_460       : std_logic;
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component AND4B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute INIT of C_IMM_REG_LUT : label is "0040000000000000";
   attribute INIT of GFX_INST_LUT : label is "0030000000000000";
   attribute INIT of HLT_INST_LUT : label is "0000000000000004";
   attribute INIT of OUT_INST_LUT : label is "0008000000000000";
   attribute INIT of REG_DATA_SEL_LUT_0 : label is "0001000000FF0000";
   attribute INIT of REG_DATA_SEL_LUT_1 : label is "0004000000FF0000";
   attribute INIT of REG_FILE_WE_LUT : label is "0005000000FF00F0";
   attribute INIT of STL_INST_LUT : label is "0000000000000002";
   attribute INIT of STR_INST_LUT : label is "0002000000000000";
begin
   C_IMM_REG_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0040000000000000")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>CFIMM);
   
   GFX_INST_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0030000000000000")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>XLXN_460);
   
   HLT_INST_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0000000000000004")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>XLXN_458);
   
   OUT_INST_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0008000000000000")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>XLXN_456);
   
   REG_DATA_SEL_LUT_0 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0001000000FF0000")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>REG_DATA_SEL_0);
   
   REG_DATA_SEL_LUT_1 : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0004000000FF0000")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>REG_DATA_SEL_1);
   
   REG_FILE_WE_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0005000000FF00F0")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>XLXN_81);
   
   STL_INST_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0000000000000002")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>XLXN_454);
   
   STR_INST_LUT : LUT6
   -- synopsys translate_off
   generic map( INIT => x"0002000000000000")
   -- synopsys translate_on
      port map (I0=>ID(2),
                I1=>ID(3),
                I2=>ID(4),
                I3=>ID(5),
                I4=>ID(6),
                I5=>ID(7),
                O=>XLXN_184);
   
   XLXI_27 : BUF
      port map (I=>ID(4),
                O=>FLG_INV);
   
   XLXI_75 : AND3
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                O=>PC_CE);
   
   XLXI_76 : AND3B2
      port map (I0=>ID(7),
                I1=>ID(6),
                I2=>ID(5),
                O=>XLXN_406);
   
   XLXI_82 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_81,
                O=>REG_WE);
   
   XLXI_119 : AND5
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>FLG,
                I4=>XLXN_406,
                O=>PC_L);
   
   XLXI_133 : AND4B3
      port map (I0=>ID(7),
                I1=>ID(6),
                I2=>ID(5),
                I3=>ID(4),
                O=>XLXN_394);
   
   XLXI_135 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_394,
                O=>FLG_REG_CE);
   
   XLXI_146 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_184,
                O=>RAM_WE);
   
   XLXI_148 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_454,
                O=>STL_CNT_L);
   
   XLXI_149 : BUF
      port map (I=>ID(0),
                O=>ALU_OP(0));
   
   XLXI_150 : BUF
      port map (I=>ID(1),
                O=>ALU_OP(1));
   
   XLXI_151 : BUF
      port map (I=>ID(2),
                O=>ALU_OP(2));
   
   XLXI_152 : BUF
      port map (I=>ID(3),
                O=>ALU_OP(3));
   
   XLXI_157 : BUF
      port map (I=>ID(3),
                O=>FLG_IDX(3));
   
   XLXI_158 : BUF
      port map (I=>ID(2),
                O=>FLG_IDX(2));
   
   XLXI_159 : BUF
      port map (I=>ID(1),
                O=>FLG_IDX(1));
   
   XLXI_160 : BUF
      port map (I=>ID(0),
                O=>FLG_IDX(0));
   
   XLXI_161 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_456,
                O=>OUT_REG_WE);
   
   XLXI_163 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_458,
                O=>HLT);
   
   XLXI_165 : AND4
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                I3=>XLXN_460,
                O=>GFX_TX_E);
   
   XLXI_166 : AND3B1
      port map (I0=>STG(1),
                I1=>STG(0),
                I2=>RUN,
                O=>ARG_BUF_CE);
   
   XLXI_167 : INV
      port map (I=>FLG,
                O=>SET_MOV_SEL);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity oregs_MUSER_main is
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
end oregs_MUSER_main;

architecture BEHAVIORAL of oregs_MUSER_main is
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
   component D4_16E_HXILINX_main
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
   
   component FD16CE_HXILINX_main
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
   
   attribute HU_SET of XLXI_3 : label is "XLXI_3_599";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_600";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_601";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_602";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_603";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_604";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_605";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_606";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_607";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_608";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_609";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_610";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_611";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_612";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_613";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_614";
   attribute HU_SET of XLXI_322 : label is "XLXI_322_615";
begin
   XLXI_3 : D4_16E_HXILINX_main
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
   
   XLXI_4 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_132,
                CLR=>XLXN_3,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO1(15 downto 0));
   
   XLXI_5 : GND
      port map (G=>XLXN_3);
   
   XLXI_6 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_135,
                CLR=>XLXN_4,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO2(15 downto 0));
   
   XLXI_7 : GND
      port map (G=>XLXN_4);
   
   XLXI_8 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_136,
                CLR=>XLXN_5,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO3(15 downto 0));
   
   XLXI_9 : GND
      port map (G=>XLXN_5);
   
   XLXI_10 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_137,
                CLR=>XLXN_6,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO4(15 downto 0));
   
   XLXI_11 : GND
      port map (G=>XLXN_6);
   
   XLXI_12 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_138,
                CLR=>XLXN_7,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO5(15 downto 0));
   
   XLXI_13 : GND
      port map (G=>XLXN_7);
   
   XLXI_14 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_139,
                CLR=>XLXN_8,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO6(15 downto 0));
   
   XLXI_15 : GND
      port map (G=>XLXN_8);
   
   XLXI_16 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_140,
                CLR=>XLXN_9,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO7(15 downto 0));
   
   XLXI_17 : GND
      port map (G=>XLXN_9);
   
   XLXI_18 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_141,
                CLR=>XLXN_10,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO8(15 downto 0));
   
   XLXI_19 : GND
      port map (G=>XLXN_10);
   
   XLXI_20 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_142,
                CLR=>XLXN_11,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO9(15 downto 0));
   
   XLXI_21 : GND
      port map (G=>XLXN_11);
   
   XLXI_22 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_143,
                CLR=>XLXN_12,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO10(15 downto 0));
   
   XLXI_23 : GND
      port map (G=>XLXN_12);
   
   XLXI_24 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_144,
                CLR=>XLXN_13,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO11(15 downto 0));
   
   XLXI_25 : GND
      port map (G=>XLXN_13);
   
   XLXI_26 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_145,
                CLR=>XLXN_14,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO12(15 downto 0));
   
   XLXI_27 : GND
      port map (G=>XLXN_14);
   
   XLXI_28 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_146,
                CLR=>XLXN_15,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO13(15 downto 0));
   
   XLXI_29 : GND
      port map (G=>XLXN_15);
   
   XLXI_30 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_147,
                CLR=>XLXN_16,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>DO14(15 downto 0));
   
   XLXI_31 : GND
      port map (G=>XLXN_16);
   
   XLXI_32 : FD16CE_HXILINX_main
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
   
   XLXI_322 : FD16CE_HXILINX_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity flgchk_MUSER_main is
   port ( E      : in    std_logic; 
          FLG    : in    std_logic_vector (15 downto 0); 
          IDX    : in    std_logic_vector (3 downto 0); 
          FSTATE : out   std_logic);
end flgchk_MUSER_main;

architecture BEHAVIORAL of flgchk_MUSER_main is
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
   component D4_16E_HXILINX_main
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
   
   component OR16_HXILINX_main
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_616";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_617";
begin
   XLXI_1 : D4_16E_HXILINX_main
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
   
   XLXI_38 : OR16_HXILINX_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux4x1x16t_MUSER_main is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16t_MUSER_main;

architecture BEHAVIORAL of mux4x1x16t_MUSER_main is
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

entity mux2x1x16e_MUSER_main is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          E  : in    std_logic; 
          S  : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux2x1x16e_MUSER_main;

architecture BEHAVIORAL of mux2x1x16e_MUSER_main is
   attribute HU_SET     : string ;
   component M2_1E_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_618";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_619";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_620";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_621";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_622";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_623";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_624";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_625";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_626";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_627";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_628";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_629";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_630";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_631";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_632";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_633";
begin
   XLXI_1 : M2_1E_HXILINX_main
      port map (D0=>D0(0),
                D1=>D1(0),
                E=>E,
                S0=>S,
                O=>O(0));
   
   XLXI_2 : M2_1E_HXILINX_main
      port map (D0=>D0(1),
                D1=>D1(1),
                E=>E,
                S0=>S,
                O=>O(1));
   
   XLXI_3 : M2_1E_HXILINX_main
      port map (D0=>D0(2),
                D1=>D1(2),
                E=>E,
                S0=>S,
                O=>O(2));
   
   XLXI_4 : M2_1E_HXILINX_main
      port map (D0=>D0(3),
                D1=>D1(3),
                E=>E,
                S0=>S,
                O=>O(3));
   
   XLXI_5 : M2_1E_HXILINX_main
      port map (D0=>D0(4),
                D1=>D1(4),
                E=>E,
                S0=>S,
                O=>O(4));
   
   XLXI_6 : M2_1E_HXILINX_main
      port map (D0=>D0(5),
                D1=>D1(5),
                E=>E,
                S0=>S,
                O=>O(5));
   
   XLXI_7 : M2_1E_HXILINX_main
      port map (D0=>D0(6),
                D1=>D1(6),
                E=>E,
                S0=>S,
                O=>O(6));
   
   XLXI_8 : M2_1E_HXILINX_main
      port map (D0=>D0(7),
                D1=>D1(7),
                E=>E,
                S0=>S,
                O=>O(7));
   
   XLXI_9 : M2_1E_HXILINX_main
      port map (D0=>D0(8),
                D1=>D1(8),
                E=>E,
                S0=>S,
                O=>O(8));
   
   XLXI_10 : M2_1E_HXILINX_main
      port map (D0=>D0(9),
                D1=>D1(9),
                E=>E,
                S0=>S,
                O=>O(9));
   
   XLXI_11 : M2_1E_HXILINX_main
      port map (D0=>D0(10),
                D1=>D1(10),
                E=>E,
                S0=>S,
                O=>O(10));
   
   XLXI_12 : M2_1E_HXILINX_main
      port map (D0=>D0(11),
                D1=>D1(11),
                E=>E,
                S0=>S,
                O=>O(11));
   
   XLXI_13 : M2_1E_HXILINX_main
      port map (D0=>D0(12),
                D1=>D1(12),
                E=>E,
                S0=>S,
                O=>O(12));
   
   XLXI_14 : M2_1E_HXILINX_main
      port map (D0=>D0(13),
                D1=>D1(13),
                E=>E,
                S0=>S,
                O=>O(13));
   
   XLXI_15 : M2_1E_HXILINX_main
      port map (D0=>D0(14),
                D1=>D1(14),
                E=>E,
                S0=>S,
                O=>O(14));
   
   XLXI_16 : M2_1E_HXILINX_main
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

entity logic_MUSER_main is
   port ( A : in    std_logic_vector (15 downto 0); 
          B : in    std_logic_vector (15 downto 0); 
          M : in    std_logic_vector (2 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end logic_MUSER_main;

architecture BEHAVIORAL of logic_MUSER_main is
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

entity mult_MUSER_main is
   port ( A      : in    std_logic_vector (15 downto 0); 
          B      : in    std_logic_vector (15 downto 0); 
          Signed : in    std_logic; 
          H      : out   std_logic_vector (15 downto 0); 
          L      : out   std_logic_vector (15 downto 0));
end mult_MUSER_main;

architecture BEHAVIORAL of mult_MUSER_main is
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
   
   component M2_1_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_206 : label is "XLXI_206_634";
   attribute HU_SET of XLXI_209 : label is "XLXI_209_635";
   attribute HU_SET of XLXI_273 : label is "XLXI_273_636";
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
   
   XLXI_206 : M2_1_HXILINX_main
      port map (D0=>XLXN_189,
                D1=>A(15),
                S0=>Signed,
                O=>XLXN_188);
   
   XLXI_208 : GND
      port map (G=>XLXN_189);
   
   XLXI_209 : M2_1_HXILINX_main
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
   
   XLXI_273 : M2_1_HXILINX_main
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

entity rshift_MUSER_main is
   port ( I : in    std_logic_vector (15 downto 0); 
          S : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end rshift_MUSER_main;

architecture BEHAVIORAL of rshift_MUSER_main is
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
   component M2_1_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component M2_1E_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component NOR12_HXILINX_main
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_637";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_638";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_639";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_640";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_641";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_642";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_643";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_644";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_645";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_646";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_647";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_648";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_649";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_650";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_651";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_652";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_653";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_654";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_655";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_656";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_657";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_658";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_659";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_660";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_661";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_662";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_663";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_664";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_665";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_666";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_667";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_668";
   attribute HU_SET of XLXI_65 : label is "XLXI_65_669";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_670";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_671";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_672";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_673";
   attribute HU_SET of XLXI_70 : label is "XLXI_70_674";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_675";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_676";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_677";
   attribute HU_SET of XLXI_74 : label is "XLXI_74_678";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_679";
   attribute HU_SET of XLXI_76 : label is "XLXI_76_680";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_681";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_682";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_683";
   attribute HU_SET of XLXI_80 : label is "XLXI_80_684";
   attribute HU_SET of XLXI_230 : label is "XLXI_230_685";
   attribute HU_SET of XLXI_232 : label is "XLXI_232_686";
   attribute HU_SET of XLXI_233 : label is "XLXI_233_687";
   attribute HU_SET of XLXI_234 : label is "XLXI_234_688";
   attribute HU_SET of XLXI_235 : label is "XLXI_235_689";
   attribute HU_SET of XLXI_236 : label is "XLXI_236_690";
   attribute HU_SET of XLXI_237 : label is "XLXI_237_691";
   attribute HU_SET of XLXI_238 : label is "XLXI_238_692";
   attribute HU_SET of XLXI_239 : label is "XLXI_239_693";
   attribute HU_SET of XLXI_240 : label is "XLXI_240_694";
   attribute HU_SET of XLXI_241 : label is "XLXI_241_695";
   attribute HU_SET of XLXI_242 : label is "XLXI_242_696";
   attribute HU_SET of XLXI_243 : label is "XLXI_243_697";
   attribute HU_SET of XLXI_244 : label is "XLXI_244_698";
   attribute HU_SET of XLXI_245 : label is "XLXI_245_699";
   attribute HU_SET of XLXI_246 : label is "XLXI_246_700";
   attribute HU_SET of XLXI_247 : label is "XLXI_247_701";
begin
   XLXI_1 : M2_1_HXILINX_main
      port map (D0=>I(0),
                D1=>I(1),
                S0=>S(0),
                O=>XLXN_56);
   
   XLXI_2 : M2_1_HXILINX_main
      port map (D0=>I(1),
                D1=>I(2),
                S0=>S(0),
                O=>XLXN_57);
   
   XLXI_3 : M2_1_HXILINX_main
      port map (D0=>I(2),
                D1=>I(3),
                S0=>S(0),
                O=>XLXN_87);
   
   XLXI_4 : M2_1_HXILINX_main
      port map (D0=>I(3),
                D1=>I(4),
                S0=>S(0),
                O=>XLXN_86);
   
   XLXI_5 : M2_1_HXILINX_main
      port map (D0=>I(4),
                D1=>I(5),
                S0=>S(0),
                O=>XLXN_85);
   
   XLXI_6 : M2_1_HXILINX_main
      port map (D0=>I(5),
                D1=>I(6),
                S0=>S(0),
                O=>XLXN_84);
   
   XLXI_7 : M2_1_HXILINX_main
      port map (D0=>I(6),
                D1=>I(7),
                S0=>S(0),
                O=>XLXN_83);
   
   XLXI_8 : M2_1_HXILINX_main
      port map (D0=>I(7),
                D1=>I(8),
                S0=>S(0),
                O=>XLXN_82);
   
   XLXI_9 : M2_1_HXILINX_main
      port map (D0=>I(8),
                D1=>I(9),
                S0=>S(0),
                O=>XLXN_81);
   
   XLXI_10 : M2_1_HXILINX_main
      port map (D0=>I(9),
                D1=>I(10),
                S0=>S(0),
                O=>XLXN_80);
   
   XLXI_11 : M2_1_HXILINX_main
      port map (D0=>I(10),
                D1=>I(11),
                S0=>S(0),
                O=>XLXN_78);
   
   XLXI_12 : M2_1_HXILINX_main
      port map (D0=>I(10),
                D1=>I(12),
                S0=>S(0),
                O=>XLXN_77);
   
   XLXI_13 : M2_1_HXILINX_main
      port map (D0=>I(12),
                D1=>I(13),
                S0=>S(0),
                O=>XLXN_76);
   
   XLXI_14 : M2_1_HXILINX_main
      port map (D0=>I(13),
                D1=>I(14),
                S0=>S(0),
                O=>XLXN_75);
   
   XLXI_15 : M2_1_HXILINX_main
      port map (D0=>I(14),
                D1=>I(15),
                S0=>S(0),
                O=>XLXN_74);
   
   XLXI_16 : M2_1_HXILINX_main
      port map (D0=>I(15),
                D1=>XLXN_39,
                S0=>S(0),
                O=>XLXN_73);
   
   XLXI_17 : M2_1_HXILINX_main
      port map (D0=>XLXN_56,
                D1=>XLXN_87,
                S0=>S(1),
                O=>XLXN_88);
   
   XLXI_18 : M2_1_HXILINX_main
      port map (D0=>XLXN_57,
                D1=>XLXN_86,
                S0=>S(1),
                O=>XLXN_89);
   
   XLXI_19 : M2_1_HXILINX_main
      port map (D0=>XLXN_87,
                D1=>XLXN_85,
                S0=>S(1),
                O=>XLXN_90);
   
   XLXI_20 : M2_1_HXILINX_main
      port map (D0=>XLXN_86,
                D1=>XLXN_84,
                S0=>S(1),
                O=>XLXN_91);
   
   XLXI_21 : M2_1_HXILINX_main
      port map (D0=>XLXN_85,
                D1=>XLXN_83,
                S0=>S(1),
                O=>XLXN_135);
   
   XLXI_22 : M2_1_HXILINX_main
      port map (D0=>XLXN_84,
                D1=>XLXN_82,
                S0=>S(1),
                O=>XLXN_134);
   
   XLXI_23 : M2_1_HXILINX_main
      port map (D0=>XLXN_83,
                D1=>XLXN_81,
                S0=>S(1),
                O=>XLXN_133);
   
   XLXI_24 : M2_1_HXILINX_main
      port map (D0=>XLXN_82,
                D1=>XLXN_80,
                S0=>S(1),
                O=>XLXN_132);
   
   XLXI_25 : M2_1_HXILINX_main
      port map (D0=>XLXN_81,
                D1=>XLXN_78,
                S0=>S(1),
                O=>XLXN_131);
   
   XLXI_26 : M2_1_HXILINX_main
      port map (D0=>XLXN_80,
                D1=>XLXN_77,
                S0=>S(1),
                O=>XLXN_130);
   
   XLXI_27 : M2_1_HXILINX_main
      port map (D0=>XLXN_78,
                D1=>XLXN_76,
                S0=>S(1),
                O=>XLXN_129);
   
   XLXI_28 : M2_1_HXILINX_main
      port map (D0=>XLXN_77,
                D1=>XLXN_75,
                S0=>S(1),
                O=>XLXN_128);
   
   XLXI_29 : M2_1_HXILINX_main
      port map (D0=>XLXN_76,
                D1=>XLXN_74,
                S0=>S(1),
                O=>XLXN_127);
   
   XLXI_30 : M2_1_HXILINX_main
      port map (D0=>XLXN_75,
                D1=>XLXN_73,
                S0=>S(1),
                O=>XLXN_126);
   
   XLXI_31 : M2_1_HXILINX_main
      port map (D0=>XLXN_74,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_125);
   
   XLXI_32 : M2_1_HXILINX_main
      port map (D0=>XLXN_73,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_124);
   
   XLXI_65 : M2_1_HXILINX_main
      port map (D0=>XLXN_88,
                D1=>XLXN_135,
                S0=>S(2),
                O=>XLXN_123);
   
   XLXI_66 : M2_1_HXILINX_main
      port map (D0=>XLXN_89,
                D1=>XLXN_134,
                S0=>S(2),
                O=>XLXN_122);
   
   XLXI_67 : M2_1_HXILINX_main
      port map (D0=>XLXN_90,
                D1=>XLXN_133,
                S0=>S(2),
                O=>XLXN_121);
   
   XLXI_68 : M2_1_HXILINX_main
      port map (D0=>XLXN_91,
                D1=>XLXN_132,
                S0=>S(2),
                O=>XLXN_120);
   
   XLXI_69 : M2_1_HXILINX_main
      port map (D0=>XLXN_135,
                D1=>XLXN_131,
                S0=>S(2),
                O=>XLXN_118);
   
   XLXI_70 : M2_1_HXILINX_main
      port map (D0=>XLXN_134,
                D1=>XLXN_130,
                S0=>S(2),
                O=>XLXN_117);
   
   XLXI_71 : M2_1_HXILINX_main
      port map (D0=>XLXN_133,
                D1=>XLXN_129,
                S0=>S(2),
                O=>XLXN_116);
   
   XLXI_72 : M2_1_HXILINX_main
      port map (D0=>XLXN_132,
                D1=>XLXN_128,
                S0=>S(2),
                O=>XLXN_144);
   
   XLXI_73 : M2_1_HXILINX_main
      port map (D0=>XLXN_131,
                D1=>XLXN_127,
                S0=>S(2),
                O=>XLXN_154);
   
   XLXI_74 : M2_1_HXILINX_main
      port map (D0=>XLXN_130,
                D1=>XLXN_126,
                S0=>S(2),
                O=>XLXN_153);
   
   XLXI_75 : M2_1_HXILINX_main
      port map (D0=>XLXN_129,
                D1=>XLXN_125,
                S0=>S(2),
                O=>XLXN_151);
   
   XLXI_76 : M2_1_HXILINX_main
      port map (D0=>XLXN_128,
                D1=>XLXN_124,
                S0=>S(2),
                O=>XLXN_150);
   
   XLXI_77 : M2_1_HXILINX_main
      port map (D0=>XLXN_127,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_149);
   
   XLXI_78 : M2_1_HXILINX_main
      port map (D0=>XLXN_126,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_148);
   
   XLXI_79 : M2_1_HXILINX_main
      port map (D0=>XLXN_125,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_147);
   
   XLXI_80 : M2_1_HXILINX_main
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
   
   XLXI_230 : M2_1E_HXILINX_main
      port map (D0=>XLXN_123,
                D1=>XLXN_154,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(0));
   
   XLXI_232 : M2_1E_HXILINX_main
      port map (D0=>XLXN_121,
                D1=>XLXN_151,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(2));
   
   XLXI_233 : M2_1E_HXILINX_main
      port map (D0=>XLXN_120,
                D1=>XLXN_150,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(3));
   
   XLXI_234 : M2_1E_HXILINX_main
      port map (D0=>XLXN_118,
                D1=>XLXN_149,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(4));
   
   XLXI_235 : M2_1E_HXILINX_main
      port map (D0=>XLXN_117,
                D1=>XLXN_148,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(5));
   
   XLXI_236 : M2_1E_HXILINX_main
      port map (D0=>XLXN_116,
                D1=>XLXN_147,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(6));
   
   XLXI_237 : M2_1E_HXILINX_main
      port map (D0=>XLXN_144,
                D1=>XLXN_145,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(7));
   
   XLXI_238 : M2_1E_HXILINX_main
      port map (D0=>XLXN_154,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(8));
   
   XLXI_239 : M2_1E_HXILINX_main
      port map (D0=>XLXN_153,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(9));
   
   XLXI_240 : M2_1E_HXILINX_main
      port map (D0=>XLXN_151,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(10));
   
   XLXI_241 : M2_1E_HXILINX_main
      port map (D0=>XLXN_150,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(11));
   
   XLXI_242 : M2_1E_HXILINX_main
      port map (D0=>XLXN_149,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(12));
   
   XLXI_243 : M2_1E_HXILINX_main
      port map (D0=>XLXN_148,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(13));
   
   XLXI_244 : M2_1E_HXILINX_main
      port map (D0=>XLXN_147,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(14));
   
   XLXI_245 : M2_1E_HXILINX_main
      port map (D0=>XLXN_145,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(15));
   
   XLXI_246 : M2_1E_HXILINX_main
      port map (D0=>XLXN_122,
                D1=>XLXN_153,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(1));
   
   XLXI_247 : NOR12_HXILINX_main
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

entity lshift_MUSER_main is
   port ( I : in    std_logic_vector (15 downto 0); 
          S : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end lshift_MUSER_main;

architecture BEHAVIORAL of lshift_MUSER_main is
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
   component M2_1_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component M2_1E_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component NOR12_HXILINX_main
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_702";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_703";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_704";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_705";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_706";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_707";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_708";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_709";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_710";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_711";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_712";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_713";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_714";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_715";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_716";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_717";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_718";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_719";
   attribute HU_SET of XLXI_19 : label is "XLXI_19_720";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_721";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_722";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_723";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_724";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_725";
   attribute HU_SET of XLXI_25 : label is "XLXI_25_726";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_727";
   attribute HU_SET of XLXI_27 : label is "XLXI_27_728";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_729";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_730";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_731";
   attribute HU_SET of XLXI_31 : label is "XLXI_31_732";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_733";
   attribute HU_SET of XLXI_65 : label is "XLXI_65_734";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_735";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_736";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_737";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_738";
   attribute HU_SET of XLXI_70 : label is "XLXI_70_739";
   attribute HU_SET of XLXI_71 : label is "XLXI_71_740";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_741";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_742";
   attribute HU_SET of XLXI_74 : label is "XLXI_74_743";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_744";
   attribute HU_SET of XLXI_76 : label is "XLXI_76_745";
   attribute HU_SET of XLXI_77 : label is "XLXI_77_746";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_747";
   attribute HU_SET of XLXI_79 : label is "XLXI_79_748";
   attribute HU_SET of XLXI_80 : label is "XLXI_80_749";
   attribute HU_SET of XLXI_230 : label is "XLXI_230_750";
   attribute HU_SET of XLXI_232 : label is "XLXI_232_751";
   attribute HU_SET of XLXI_233 : label is "XLXI_233_752";
   attribute HU_SET of XLXI_234 : label is "XLXI_234_753";
   attribute HU_SET of XLXI_235 : label is "XLXI_235_754";
   attribute HU_SET of XLXI_236 : label is "XLXI_236_755";
   attribute HU_SET of XLXI_237 : label is "XLXI_237_756";
   attribute HU_SET of XLXI_238 : label is "XLXI_238_757";
   attribute HU_SET of XLXI_239 : label is "XLXI_239_758";
   attribute HU_SET of XLXI_240 : label is "XLXI_240_759";
   attribute HU_SET of XLXI_241 : label is "XLXI_241_760";
   attribute HU_SET of XLXI_242 : label is "XLXI_242_761";
   attribute HU_SET of XLXI_243 : label is "XLXI_243_762";
   attribute HU_SET of XLXI_244 : label is "XLXI_244_763";
   attribute HU_SET of XLXI_245 : label is "XLXI_245_764";
   attribute HU_SET of XLXI_246 : label is "XLXI_246_765";
   attribute HU_SET of XLXI_247 : label is "XLXI_247_766";
begin
   XLXI_1 : M2_1_HXILINX_main
      port map (D0=>I(15),
                D1=>I(14),
                S0=>S(0),
                O=>XLXN_56);
   
   XLXI_2 : M2_1_HXILINX_main
      port map (D0=>I(14),
                D1=>I(13),
                S0=>S(0),
                O=>XLXN_57);
   
   XLXI_3 : M2_1_HXILINX_main
      port map (D0=>I(13),
                D1=>I(12),
                S0=>S(0),
                O=>XLXN_87);
   
   XLXI_4 : M2_1_HXILINX_main
      port map (D0=>I(12),
                D1=>I(11),
                S0=>S(0),
                O=>XLXN_86);
   
   XLXI_5 : M2_1_HXILINX_main
      port map (D0=>I(11),
                D1=>I(10),
                S0=>S(0),
                O=>XLXN_85);
   
   XLXI_6 : M2_1_HXILINX_main
      port map (D0=>I(10),
                D1=>I(9),
                S0=>S(0),
                O=>XLXN_84);
   
   XLXI_7 : M2_1_HXILINX_main
      port map (D0=>I(9),
                D1=>I(8),
                S0=>S(0),
                O=>XLXN_83);
   
   XLXI_8 : M2_1_HXILINX_main
      port map (D0=>I(8),
                D1=>I(7),
                S0=>S(0),
                O=>XLXN_82);
   
   XLXI_9 : M2_1_HXILINX_main
      port map (D0=>I(7),
                D1=>I(6),
                S0=>S(0),
                O=>XLXN_81);
   
   XLXI_10 : M2_1_HXILINX_main
      port map (D0=>I(6),
                D1=>I(5),
                S0=>S(0),
                O=>XLXN_80);
   
   XLXI_11 : M2_1_HXILINX_main
      port map (D0=>I(5),
                D1=>I(4),
                S0=>S(0),
                O=>XLXN_78);
   
   XLXI_12 : M2_1_HXILINX_main
      port map (D0=>I(5),
                D1=>I(3),
                S0=>S(0),
                O=>XLXN_77);
   
   XLXI_13 : M2_1_HXILINX_main
      port map (D0=>I(3),
                D1=>I(2),
                S0=>S(0),
                O=>XLXN_76);
   
   XLXI_14 : M2_1_HXILINX_main
      port map (D0=>I(2),
                D1=>I(1),
                S0=>S(0),
                O=>XLXN_75);
   
   XLXI_15 : M2_1_HXILINX_main
      port map (D0=>I(1),
                D1=>I(0),
                S0=>S(0),
                O=>XLXN_74);
   
   XLXI_16 : M2_1_HXILINX_main
      port map (D0=>I(0),
                D1=>XLXN_39,
                S0=>S(0),
                O=>XLXN_73);
   
   XLXI_17 : M2_1_HXILINX_main
      port map (D0=>XLXN_56,
                D1=>XLXN_87,
                S0=>S(1),
                O=>XLXN_88);
   
   XLXI_18 : M2_1_HXILINX_main
      port map (D0=>XLXN_57,
                D1=>XLXN_86,
                S0=>S(1),
                O=>XLXN_89);
   
   XLXI_19 : M2_1_HXILINX_main
      port map (D0=>XLXN_87,
                D1=>XLXN_85,
                S0=>S(1),
                O=>XLXN_90);
   
   XLXI_20 : M2_1_HXILINX_main
      port map (D0=>XLXN_86,
                D1=>XLXN_84,
                S0=>S(1),
                O=>XLXN_91);
   
   XLXI_21 : M2_1_HXILINX_main
      port map (D0=>XLXN_85,
                D1=>XLXN_83,
                S0=>S(1),
                O=>XLXN_135);
   
   XLXI_22 : M2_1_HXILINX_main
      port map (D0=>XLXN_84,
                D1=>XLXN_82,
                S0=>S(1),
                O=>XLXN_134);
   
   XLXI_23 : M2_1_HXILINX_main
      port map (D0=>XLXN_83,
                D1=>XLXN_81,
                S0=>S(1),
                O=>XLXN_133);
   
   XLXI_24 : M2_1_HXILINX_main
      port map (D0=>XLXN_82,
                D1=>XLXN_80,
                S0=>S(1),
                O=>XLXN_132);
   
   XLXI_25 : M2_1_HXILINX_main
      port map (D0=>XLXN_81,
                D1=>XLXN_78,
                S0=>S(1),
                O=>XLXN_131);
   
   XLXI_26 : M2_1_HXILINX_main
      port map (D0=>XLXN_80,
                D1=>XLXN_77,
                S0=>S(1),
                O=>XLXN_130);
   
   XLXI_27 : M2_1_HXILINX_main
      port map (D0=>XLXN_78,
                D1=>XLXN_76,
                S0=>S(1),
                O=>XLXN_129);
   
   XLXI_28 : M2_1_HXILINX_main
      port map (D0=>XLXN_77,
                D1=>XLXN_75,
                S0=>S(1),
                O=>XLXN_128);
   
   XLXI_29 : M2_1_HXILINX_main
      port map (D0=>XLXN_76,
                D1=>XLXN_74,
                S0=>S(1),
                O=>XLXN_127);
   
   XLXI_30 : M2_1_HXILINX_main
      port map (D0=>XLXN_75,
                D1=>XLXN_73,
                S0=>S(1),
                O=>XLXN_126);
   
   XLXI_31 : M2_1_HXILINX_main
      port map (D0=>XLXN_74,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_125);
   
   XLXI_32 : M2_1_HXILINX_main
      port map (D0=>XLXN_73,
                D1=>XLXN_158,
                S0=>S(1),
                O=>XLXN_124);
   
   XLXI_65 : M2_1_HXILINX_main
      port map (D0=>XLXN_88,
                D1=>XLXN_135,
                S0=>S(2),
                O=>XLXN_123);
   
   XLXI_66 : M2_1_HXILINX_main
      port map (D0=>XLXN_89,
                D1=>XLXN_134,
                S0=>S(2),
                O=>XLXN_122);
   
   XLXI_67 : M2_1_HXILINX_main
      port map (D0=>XLXN_90,
                D1=>XLXN_133,
                S0=>S(2),
                O=>XLXN_121);
   
   XLXI_68 : M2_1_HXILINX_main
      port map (D0=>XLXN_91,
                D1=>XLXN_132,
                S0=>S(2),
                O=>XLXN_120);
   
   XLXI_69 : M2_1_HXILINX_main
      port map (D0=>XLXN_135,
                D1=>XLXN_131,
                S0=>S(2),
                O=>XLXN_118);
   
   XLXI_70 : M2_1_HXILINX_main
      port map (D0=>XLXN_134,
                D1=>XLXN_130,
                S0=>S(2),
                O=>XLXN_117);
   
   XLXI_71 : M2_1_HXILINX_main
      port map (D0=>XLXN_133,
                D1=>XLXN_129,
                S0=>S(2),
                O=>XLXN_116);
   
   XLXI_72 : M2_1_HXILINX_main
      port map (D0=>XLXN_132,
                D1=>XLXN_128,
                S0=>S(2),
                O=>XLXN_144);
   
   XLXI_73 : M2_1_HXILINX_main
      port map (D0=>XLXN_131,
                D1=>XLXN_127,
                S0=>S(2),
                O=>XLXN_154);
   
   XLXI_74 : M2_1_HXILINX_main
      port map (D0=>XLXN_130,
                D1=>XLXN_126,
                S0=>S(2),
                O=>XLXN_153);
   
   XLXI_75 : M2_1_HXILINX_main
      port map (D0=>XLXN_129,
                D1=>XLXN_125,
                S0=>S(2),
                O=>XLXN_151);
   
   XLXI_76 : M2_1_HXILINX_main
      port map (D0=>XLXN_128,
                D1=>XLXN_124,
                S0=>S(2),
                O=>XLXN_150);
   
   XLXI_77 : M2_1_HXILINX_main
      port map (D0=>XLXN_127,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_149);
   
   XLXI_78 : M2_1_HXILINX_main
      port map (D0=>XLXN_126,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_148);
   
   XLXI_79 : M2_1_HXILINX_main
      port map (D0=>XLXN_125,
                D1=>XLXN_201,
                S0=>S(2),
                O=>XLXN_147);
   
   XLXI_80 : M2_1_HXILINX_main
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
   
   XLXI_230 : M2_1E_HXILINX_main
      port map (D0=>XLXN_123,
                D1=>XLXN_154,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(15));
   
   XLXI_232 : M2_1E_HXILINX_main
      port map (D0=>XLXN_121,
                D1=>XLXN_151,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(13));
   
   XLXI_233 : M2_1E_HXILINX_main
      port map (D0=>XLXN_120,
                D1=>XLXN_150,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(12));
   
   XLXI_234 : M2_1E_HXILINX_main
      port map (D0=>XLXN_118,
                D1=>XLXN_149,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(11));
   
   XLXI_235 : M2_1E_HXILINX_main
      port map (D0=>XLXN_117,
                D1=>XLXN_148,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(10));
   
   XLXI_236 : M2_1E_HXILINX_main
      port map (D0=>XLXN_116,
                D1=>XLXN_147,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(9));
   
   XLXI_237 : M2_1E_HXILINX_main
      port map (D0=>XLXN_144,
                D1=>XLXN_145,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(8));
   
   XLXI_238 : M2_1E_HXILINX_main
      port map (D0=>XLXN_154,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(7));
   
   XLXI_239 : M2_1E_HXILINX_main
      port map (D0=>XLXN_153,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(6));
   
   XLXI_240 : M2_1E_HXILINX_main
      port map (D0=>XLXN_151,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(5));
   
   XLXI_241 : M2_1E_HXILINX_main
      port map (D0=>XLXN_150,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(4));
   
   XLXI_242 : M2_1E_HXILINX_main
      port map (D0=>XLXN_149,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(3));
   
   XLXI_243 : M2_1E_HXILINX_main
      port map (D0=>XLXN_148,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(2));
   
   XLXI_244 : M2_1E_HXILINX_main
      port map (D0=>XLXN_147,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(1));
   
   XLXI_245 : M2_1E_HXILINX_main
      port map (D0=>XLXN_145,
                D1=>XLXN_226,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(0));
   
   XLXI_246 : M2_1E_HXILINX_main
      port map (D0=>XLXN_122,
                D1=>XLXN_153,
                E=>XLXN_246,
                S0=>S(3),
                O=>O(14));
   
   XLXI_247 : NOR12_HXILINX_main
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

entity alu_MUSER_main is
   port ( A  : in    std_logic_vector (15 downto 0); 
          B  : in    std_logic_vector (15 downto 0); 
          OP : in    std_logic_vector (3 downto 0); 
          F  : out   std_logic_vector (15 downto 0); 
          O  : out   std_logic_vector (15 downto 0));
end alu_MUSER_main;

architecture BEHAVIORAL of alu_MUSER_main is
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
   component ADSU16_HXILINX_main
      port ( A   : in    std_logic_vector (15 downto 0); 
             ADD : in    std_logic; 
             B   : in    std_logic_vector (15 downto 0); 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             OFL : out   std_logic; 
             S   : out   std_logic_vector (15 downto 0));
   end component;
   
   component mux2x1x16e_MUSER_main
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             E  : in    std_logic; 
             O  : out   std_logic_vector (15 downto 0); 
             S  : in    std_logic);
   end component;
   
   component mux4x1x16t_MUSER_main
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
   component lshift_MUSER_main
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (15 downto 0); 
             S : in    std_logic_vector (15 downto 0));
   end component;
   
   component logic_MUSER_main
      port ( A : in    std_logic_vector (15 downto 0); 
             B : in    std_logic_vector (15 downto 0); 
             M : in    std_logic_vector (2 downto 0); 
             O : out   std_logic_vector (15 downto 0));
   end component;
   
   component mult_MUSER_main
      port ( A      : in    std_logic_vector (15 downto 0); 
             B      : in    std_logic_vector (15 downto 0); 
             H      : out   std_logic_vector (15 downto 0); 
             L      : out   std_logic_vector (15 downto 0); 
             Signed : in    std_logic);
   end component;
   
   component rshift_MUSER_main
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (15 downto 0); 
             S : in    std_logic_vector (15 downto 0));
   end component;
   
   component COMPM16_HXILINX_main
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
   
   component COMP16_HXILINX_main
      port ( A  : in    std_logic_vector (15 downto 0); 
             B  : in    std_logic_vector (15 downto 0); 
             EQ : out   std_logic);
   end component;
   
   component NOR16_HXILINX_main
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
   
   component XNOR8_HXILINX_main
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
   
   attribute HU_SET of Adder_Subtracter : label is "Adder_Subtracter_767";
   attribute HU_SET of Signed_Comparator : label is "Signed_Comparator_769";
   attribute HU_SET of Unsigned_Comparator : label is "Unsigned_Comparator_768";
   attribute HU_SET of XLXI_67 : label is "XLXI_67_770";
   attribute HU_SET of XLXI_68 : label is "XLXI_68_771";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_772";
   attribute HU_SET of XLXI_73 : label is "XLXI_73_773";
begin
   F(15 downto 0) <= F_DUMMY(15 downto 0);
   O(15 downto 0) <= O_DUMMY(15 downto 0);
   Adder_Subtracter : ADSU16_HXILINX_main
      port map (A(15 downto 0)=>A(15 downto 0),
                ADD=>XLXN_13,
                B(15 downto 0)=>B(15 downto 0),
                CI=>OP(0),
                CO=>XLXN_19,
                OFL=>F_DUMMY(11),
                S(15 downto 0)=>XLXN_55(15 downto 0));
   
   Arithmetic_Logic_Selector : mux2x1x16e_MUSER_main
      port map (D0(15 downto 0)=>XLXN_54(15 downto 0),
                D1(15 downto 0)=>XLXN_53(15 downto 0),
                E=>XLXN_65,
                S=>OP(3),
                O(15 downto 0)=>O_DUMMY(15 downto 0));
   
   Arithmetic_Mode_Selector : mux4x1x16t_MUSER_main
      port map (D0(15 downto 0)=>XLXN_55(15 downto 0),
                D1(15 downto 0)=>XLXN_56(15 downto 0),
                D2(15 downto 0)=>XLXN_57(15 downto 0),
                D3(15 downto 0)=>XLXN_58(15 downto 0),
                S0=>OP(1),
                S1=>OP(2),
                O(15 downto 0)=>XLXN_54(15 downto 0));
   
   Left_Shift : lshift_MUSER_main
      port map (I(15 downto 0)=>A(15 downto 0),
                S(15 downto 0)=>B(15 downto 0),
                O(15 downto 0)=>XLXN_38(15 downto 0));
   
   Logic_Unit : logic_MUSER_main
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                M(2 downto 0)=>M(2 downto 0),
                O(15 downto 0)=>XLXN_53(15 downto 0));
   
   Multiplier : mult_MUSER_main
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                Signed=>OP(0),
                H(15 downto 0)=>XLXN_58(15 downto 0),
                L(15 downto 0)=>XLXN_57(15 downto 0));
   
   Right_Shift : rshift_MUSER_main
      port map (I(15 downto 0)=>A(15 downto 0),
                S(15 downto 0)=>B(15 downto 0),
                O(15 downto 0)=>XLXN_37(15 downto 0));
   
   Shift_Direction_Selector : mux2x1x16e_MUSER_main
      port map (D0(15 downto 0)=>XLXN_37(15 downto 0),
                D1(15 downto 0)=>XLXN_38(15 downto 0),
                E=>XLXN_39,
                S=>OP(0),
                O(15 downto 0)=>XLXN_56(15 downto 0));
   
   Signed_Comparator : COMPM16_HXILINX_main
      port map (A(15 downto 0)=>SIA(15 downto 0),
                B(15 downto 0)=>SIB(15 downto 0),
                GT=>F_DUMMY(2),
                LT=>F_DUMMY(3));
   
   Unsigned_Comparator : COMPM16_HXILINX_main
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
   
   XLXI_67 : COMP16_HXILINX_main
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                EQ=>F_DUMMY(4));
   
   XLXI_68 : NOR16_HXILINX_main
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
   
   XLXI_72 : XNOR8_HXILINX_main
      port map (I0=>O_DUMMY(0),
                I1=>O_DUMMY(1),
                I2=>O_DUMMY(2),
                I3=>O_DUMMY(3),
                I4=>O_DUMMY(4),
                I5=>O_DUMMY(5),
                I6=>O_DUMMY(6),
                I7=>O_DUMMY(7),
                O=>XLXN_169);
   
   XLXI_73 : XNOR8_HXILINX_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ram_wrapper_MUSER_main is
   port ( ADDR : in    std_logic_vector (15 downto 0); 
          CLK  : in    std_logic; 
          DIN  : in    std_logic_vector (15 downto 0); 
          WE   : in    std_logic; 
          DO   : out   std_logic_vector (15 downto 0));
end ram_wrapper_MUSER_main;

architecture BEHAVIORAL of ram_wrapper_MUSER_main is
   attribute BOX_TYPE   : string ;
   signal ADDRA : std_logic_vector (12 downto 0);
   component ram
      port ( addra : in    std_logic_vector (12 downto 0); 
             dina  : in    std_logic_vector (15 downto 0); 
             wea   : in    std_logic_vector (0 downto 0); 
             clka  : in    std_logic; 
             douta : out   std_logic_vector (15 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : ram
      port map (addra(12 downto 0)=>ADDRA(12 downto 0),
                clka=>CLK,
                dina(15 downto 0)=>DIN(15 downto 0),
                wea(0)=>WE,
                douta(15 downto 0)=>DO(15 downto 0));
   
   XLXI_4 : BUF
      port map (I=>ADDR(0),
                O=>ADDRA(0));
   
   XLXI_5 : BUF
      port map (I=>ADDR(1),
                O=>ADDRA(1));
   
   XLXI_6 : BUF
      port map (I=>ADDR(2),
                O=>ADDRA(2));
   
   XLXI_7 : BUF
      port map (I=>ADDR(3),
                O=>ADDRA(3));
   
   XLXI_8 : BUF
      port map (I=>ADDR(4),
                O=>ADDRA(4));
   
   XLXI_9 : BUF
      port map (I=>ADDR(5),
                O=>ADDRA(5));
   
   XLXI_10 : BUF
      port map (I=>ADDR(6),
                O=>ADDRA(6));
   
   XLXI_11 : BUF
      port map (I=>ADDR(7),
                O=>ADDRA(7));
   
   XLXI_12 : BUF
      port map (I=>ADDR(8),
                O=>ADDRA(8));
   
   XLXI_13 : BUF
      port map (I=>ADDR(9),
                O=>ADDRA(9));
   
   XLXI_14 : BUF
      port map (I=>ADDR(10),
                O=>ADDRA(10));
   
   XLXI_15 : BUF
      port map (I=>ADDR(11),
                O=>ADDRA(11));
   
   XLXI_16 : BUF
      port map (I=>ADDR(12),
                O=>ADDRA(12));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity rom_wrapper_MUSER_main is
   port ( ADDR : in    std_logic_vector (15 downto 0); 
          CLK  : in    std_logic; 
          DO   : out   std_logic_vector (31 downto 0));
end rom_wrapper_MUSER_main;

architecture BEHAVIORAL of rom_wrapper_MUSER_main is
   attribute BOX_TYPE   : string ;
   signal ADDRA : std_logic_vector (13 downto 0);
   component rom
      port ( addra : in    std_logic_vector (13 downto 0); 
             clka  : in    std_logic; 
             douta : out   std_logic_vector (31 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : rom
      port map (addra(13 downto 0)=>ADDRA(13 downto 0),
                clka=>CLK,
                douta(31 downto 0)=>DO(31 downto 0));
   
   XLXI_2 : BUF
      port map (I=>ADDR(0),
                O=>ADDRA(0));
   
   XLXI_3 : BUF
      port map (I=>ADDR(1),
                O=>ADDRA(1));
   
   XLXI_4 : BUF
      port map (I=>ADDR(2),
                O=>ADDRA(2));
   
   XLXI_5 : BUF
      port map (I=>ADDR(3),
                O=>ADDRA(3));
   
   XLXI_6 : BUF
      port map (I=>ADDR(4),
                O=>ADDRA(4));
   
   XLXI_7 : BUF
      port map (I=>ADDR(5),
                O=>ADDRA(5));
   
   XLXI_8 : BUF
      port map (I=>ADDR(6),
                O=>ADDRA(6));
   
   XLXI_9 : BUF
      port map (I=>ADDR(7),
                O=>ADDRA(7));
   
   XLXI_10 : BUF
      port map (I=>ADDR(8),
                O=>ADDRA(8));
   
   XLXI_11 : BUF
      port map (I=>ADDR(9),
                O=>ADDRA(9));
   
   XLXI_14 : BUF
      port map (I=>ADDR(10),
                O=>ADDRA(10));
   
   XLXI_15 : BUF
      port map (I=>ADDR(11),
                O=>ADDRA(11));
   
   XLXI_16 : BUF
      port map (I=>ADDR(12),
                O=>ADDRA(12));
   
   XLXI_17 : BUF
      port map (I=>ADDR(13),
                O=>ADDRA(13));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux16x1x16tb_MUSER_main is
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
end mux16x1x16tb_MUSER_main;

architecture BEHAVIORAL of mux16x1x16tb_MUSER_main is
   signal XLXN_1 : std_logic_vector (15 downto 0);
   signal XLXN_2 : std_logic_vector (15 downto 0);
   signal XLXN_3 : std_logic_vector (15 downto 0);
   signal XLXN_4 : std_logic_vector (15 downto 0);
   component mux4x1x16t_MUSER_main
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
begin
   MH1 : mux4x1x16t_MUSER_main
      port map (D0(15 downto 0)=>XLXN_1(15 downto 0),
                D1(15 downto 0)=>XLXN_2(15 downto 0),
                D2(15 downto 0)=>XLXN_3(15 downto 0),
                D3(15 downto 0)=>XLXN_4(15 downto 0),
                S0=>S(2),
                S1=>S(3),
                O(15 downto 0)=>O(15 downto 0));
   
   ML1 : mux4x1x16t_MUSER_main
      port map (D0(15 downto 0)=>D0(15 downto 0),
                D1(15 downto 0)=>D1(15 downto 0),
                D2(15 downto 0)=>D2(15 downto 0),
                D3(15 downto 0)=>D3(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_1(15 downto 0));
   
   ML2 : mux4x1x16t_MUSER_main
      port map (D0(15 downto 0)=>D4(15 downto 0),
                D1(15 downto 0)=>D5(15 downto 0),
                D2(15 downto 0)=>D6(15 downto 0),
                D3(15 downto 0)=>D7(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_2(15 downto 0));
   
   ML3 : mux4x1x16t_MUSER_main
      port map (D0(15 downto 0)=>D8(15 downto 0),
                D1(15 downto 0)=>D9(15 downto 0),
                D2(15 downto 0)=>D10(15 downto 0),
                D3(15 downto 0)=>D11(15 downto 0),
                S0=>S(0),
                S1=>S(1),
                O(15 downto 0)=>XLXN_3(15 downto 0));
   
   ML4 : mux4x1x16t_MUSER_main
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

entity inp_stab_MUSER_main is
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
end inp_stab_MUSER_main;

architecture BEHAVIORAL of inp_stab_MUSER_main is
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
   component mux16x1x16tb_MUSER_main
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
   
   component FD16CE_HXILINX_main
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
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_774";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_775";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_776";
   attribute HU_SET of XLXI_17 : label is "XLXI_17_777";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_778";
   attribute HU_SET of XLXI_23 : label is "XLXI_23_779";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_780";
   attribute HU_SET of XLXI_29 : label is "XLXI_29_781";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_782";
   attribute HU_SET of XLXI_35 : label is "XLXI_35_783";
   attribute HU_SET of XLXI_38 : label is "XLXI_38_784";
   attribute HU_SET of XLXI_41 : label is "XLXI_41_785";
   attribute HU_SET of XLXI_44 : label is "XLXI_44_786";
   attribute HU_SET of XLXI_47 : label is "XLXI_47_787";
   attribute HU_SET of XLXI_50 : label is "XLXI_50_788";
   attribute HU_SET of XLXI_53 : label is "XLXI_53_789";
   attribute HU_SET of XLXI_58 : label is "XLXI_58_790";
   attribute HU_SET of XLXI_61 : label is "XLXI_61_791";
   attribute HU_SET of XLXI_66 : label is "XLXI_66_792";
   attribute HU_SET of XLXI_69 : label is "XLXI_69_793";
   attribute HU_SET of XLXI_72 : label is "XLXI_72_794";
   attribute HU_SET of XLXI_75 : label is "XLXI_75_795";
   attribute HU_SET of XLXI_78 : label is "XLXI_78_796";
   attribute HU_SET of XLXI_81 : label is "XLXI_81_797";
   attribute HU_SET of XLXI_84 : label is "XLXI_84_798";
   attribute HU_SET of XLXI_90 : label is "XLXI_90_799";
   attribute HU_SET of XLXI_93 : label is "XLXI_93_800";
   attribute HU_SET of XLXI_96 : label is "XLXI_96_801";
   attribute HU_SET of XLXI_99 : label is "XLXI_99_802";
   attribute HU_SET of XLXI_102 : label is "XLXI_102_803";
   attribute HU_SET of XLXI_105 : label is "XLXI_105_804";
   attribute HU_SET of XLXI_108 : label is "XLXI_108_805";
begin
   XLXI_1 : mux16x1x16tb_MUSER_main
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
   
   XLXI_2 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_2,
                CLR=>XLXN_3,
                D(15 downto 0)=>I0(15 downto 0),
                Q(15 downto 0)=>XLXN_137(15 downto 0));
   
   XLXI_3 : VCC
      port map (P=>XLXN_2);
   
   XLXI_4 : GND
      port map (G=>XLXN_3);
   
   XLXI_5 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_6,
                CLR=>XLXN_7,
                D(15 downto 0)=>I1(15 downto 0),
                Q(15 downto 0)=>XLXN_141(15 downto 0));
   
   XLXI_6 : VCC
      port map (P=>XLXN_6);
   
   XLXI_7 : GND
      port map (G=>XLXN_7);
   
   XLXI_14 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_17,
                CLR=>XLXN_18,
                D(15 downto 0)=>I2(15 downto 0),
                Q(15 downto 0)=>XLXN_145(15 downto 0));
   
   XLXI_15 : VCC
      port map (P=>XLXN_17);
   
   XLXI_16 : GND
      port map (G=>XLXN_18);
   
   XLXI_17 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_21,
                CLR=>XLXN_22,
                D(15 downto 0)=>I3(15 downto 0),
                Q(15 downto 0)=>XLXN_149(15 downto 0));
   
   XLXI_18 : VCC
      port map (P=>XLXN_21);
   
   XLXI_19 : GND
      port map (G=>XLXN_22);
   
   XLXI_20 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_25,
                CLR=>XLXN_26,
                D(15 downto 0)=>I4(15 downto 0),
                Q(15 downto 0)=>XLXN_153(15 downto 0));
   
   XLXI_21 : VCC
      port map (P=>XLXN_25);
   
   XLXI_22 : GND
      port map (G=>XLXN_26);
   
   XLXI_23 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_29,
                CLR=>XLXN_30,
                D(15 downto 0)=>I5(15 downto 0),
                Q(15 downto 0)=>XLXN_157(15 downto 0));
   
   XLXI_24 : VCC
      port map (P=>XLXN_29);
   
   XLXI_25 : GND
      port map (G=>XLXN_30);
   
   XLXI_26 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_33,
                CLR=>XLXN_34,
                D(15 downto 0)=>I6(15 downto 0),
                Q(15 downto 0)=>XLXN_161(15 downto 0));
   
   XLXI_27 : VCC
      port map (P=>XLXN_33);
   
   XLXI_28 : GND
      port map (G=>XLXN_34);
   
   XLXI_29 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_37,
                CLR=>XLXN_38,
                D(15 downto 0)=>I7(15 downto 0),
                Q(15 downto 0)=>XLXN_165(15 downto 0));
   
   XLXI_30 : VCC
      port map (P=>XLXN_37);
   
   XLXI_31 : GND
      port map (G=>XLXN_38);
   
   XLXI_32 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_41,
                CLR=>XLXN_42,
                D(15 downto 0)=>I8(15 downto 0),
                Q(15 downto 0)=>XLXN_169(15 downto 0));
   
   XLXI_33 : VCC
      port map (P=>XLXN_41);
   
   XLXI_34 : GND
      port map (G=>XLXN_42);
   
   XLXI_35 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_45,
                CLR=>XLXN_46,
                D(15 downto 0)=>I9(15 downto 0),
                Q(15 downto 0)=>XLXN_177(15 downto 0));
   
   XLXI_36 : VCC
      port map (P=>XLXN_45);
   
   XLXI_37 : GND
      port map (G=>XLXN_46);
   
   XLXI_38 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_49,
                CLR=>XLXN_50,
                D(15 downto 0)=>I10(15 downto 0),
                Q(15 downto 0)=>XLXN_181(15 downto 0));
   
   XLXI_39 : VCC
      port map (P=>XLXN_49);
   
   XLXI_40 : GND
      port map (G=>XLXN_50);
   
   XLXI_41 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_53,
                CLR=>XLXN_54,
                D(15 downto 0)=>I11(15 downto 0),
                Q(15 downto 0)=>XLXN_185(15 downto 0));
   
   XLXI_42 : VCC
      port map (P=>XLXN_53);
   
   XLXI_43 : GND
      port map (G=>XLXN_54);
   
   XLXI_44 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_57,
                CLR=>XLXN_58,
                D(15 downto 0)=>I12(15 downto 0),
                Q(15 downto 0)=>XLXN_189(15 downto 0));
   
   XLXI_45 : VCC
      port map (P=>XLXN_57);
   
   XLXI_46 : GND
      port map (G=>XLXN_58);
   
   XLXI_47 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_61,
                CLR=>XLXN_62,
                D(15 downto 0)=>I13(15 downto 0),
                Q(15 downto 0)=>XLXN_193(15 downto 0));
   
   XLXI_48 : VCC
      port map (P=>XLXN_61);
   
   XLXI_49 : GND
      port map (G=>XLXN_62);
   
   XLXI_50 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_65,
                CLR=>XLXN_66,
                D(15 downto 0)=>I14(15 downto 0),
                Q(15 downto 0)=>XLXN_197(15 downto 0));
   
   XLXI_51 : VCC
      port map (P=>XLXN_65);
   
   XLXI_52 : GND
      port map (G=>XLXN_66);
   
   XLXI_53 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_69,
                CLR=>XLXN_70,
                D(15 downto 0)=>I15(15 downto 0),
                Q(15 downto 0)=>XLXN_201(15 downto 0));
   
   XLXI_54 : VCC
      port map (P=>XLXN_69);
   
   XLXI_55 : GND
      port map (G=>XLXN_70);
   
   XLXI_58 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_134,
                CLR=>XLXN_135,
                D(15 downto 0)=>XLXN_137(15 downto 0),
                Q(15 downto 0)=>XLXN_72(15 downto 0));
   
   XLXI_59 : VCC
      port map (P=>XLXN_134);
   
   XLXI_60 : GND
      port map (G=>XLXN_135);
   
   XLXI_61 : FD16CE_HXILINX_main
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
   
   XLXI_66 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_143,
                CLR=>XLXN_144,
                D(15 downto 0)=>XLXN_145(15 downto 0),
                Q(15 downto 0)=>XLXN_75(15 downto 0));
   
   XLXI_67 : GND
      port map (G=>XLXN_148);
   
   XLXI_68 : VCC
      port map (P=>XLXN_147);
   
   XLXI_69 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_147,
                CLR=>XLXN_148,
                D(15 downto 0)=>XLXN_149(15 downto 0),
                Q(15 downto 0)=>XLXN_76(15 downto 0));
   
   XLXI_70 : GND
      port map (G=>XLXN_152);
   
   XLXI_71 : VCC
      port map (P=>XLXN_151);
   
   XLXI_72 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_151,
                CLR=>XLXN_152,
                D(15 downto 0)=>XLXN_153(15 downto 0),
                Q(15 downto 0)=>XLXN_77(15 downto 0));
   
   XLXI_73 : GND
      port map (G=>XLXN_156);
   
   XLXI_74 : VCC
      port map (P=>XLXN_155);
   
   XLXI_75 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_155,
                CLR=>XLXN_156,
                D(15 downto 0)=>XLXN_157(15 downto 0),
                Q(15 downto 0)=>XLXN_78(15 downto 0));
   
   XLXI_76 : GND
      port map (G=>XLXN_160);
   
   XLXI_77 : VCC
      port map (P=>XLXN_159);
   
   XLXI_78 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_159,
                CLR=>XLXN_160,
                D(15 downto 0)=>XLXN_161(15 downto 0),
                Q(15 downto 0)=>XLXN_79(15 downto 0));
   
   XLXI_79 : GND
      port map (G=>XLXN_164);
   
   XLXI_80 : VCC
      port map (P=>XLXN_163);
   
   XLXI_81 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_163,
                CLR=>XLXN_164,
                D(15 downto 0)=>XLXN_165(15 downto 0),
                Q(15 downto 0)=>XLXN_80(15 downto 0));
   
   XLXI_82 : GND
      port map (G=>XLXN_168);
   
   XLXI_83 : VCC
      port map (P=>XLXN_167);
   
   XLXI_84 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_167,
                CLR=>XLXN_168,
                D(15 downto 0)=>XLXN_169(15 downto 0),
                Q(15 downto 0)=>XLXN_81(15 downto 0));
   
   XLXI_88 : GND
      port map (G=>XLXN_176);
   
   XLXI_89 : VCC
      port map (P=>XLXN_175);
   
   XLXI_90 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_175,
                CLR=>XLXN_176,
                D(15 downto 0)=>XLXN_177(15 downto 0),
                Q(15 downto 0)=>XLXN_84(15 downto 0));
   
   XLXI_91 : GND
      port map (G=>XLXN_180);
   
   XLXI_92 : VCC
      port map (P=>XLXN_179);
   
   XLXI_93 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_179,
                CLR=>XLXN_180,
                D(15 downto 0)=>XLXN_181(15 downto 0),
                Q(15 downto 0)=>XLXN_85(15 downto 0));
   
   XLXI_94 : GND
      port map (G=>XLXN_184);
   
   XLXI_95 : VCC
      port map (P=>XLXN_183);
   
   XLXI_96 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_183,
                CLR=>XLXN_184,
                D(15 downto 0)=>XLXN_185(15 downto 0),
                Q(15 downto 0)=>XLXN_86(15 downto 0));
   
   XLXI_97 : GND
      port map (G=>XLXN_188);
   
   XLXI_98 : VCC
      port map (P=>XLXN_187);
   
   XLXI_99 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_187,
                CLR=>XLXN_188,
                D(15 downto 0)=>XLXN_189(15 downto 0),
                Q(15 downto 0)=>XLXN_87(15 downto 0));
   
   XLXI_100 : GND
      port map (G=>XLXN_192);
   
   XLXI_101 : VCC
      port map (P=>XLXN_191);
   
   XLXI_102 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_191,
                CLR=>XLXN_192,
                D(15 downto 0)=>XLXN_193(15 downto 0),
                Q(15 downto 0)=>XLXN_88(15 downto 0));
   
   XLXI_103 : GND
      port map (G=>XLXN_196);
   
   XLXI_104 : VCC
      port map (P=>XLXN_195);
   
   XLXI_105 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_195,
                CLR=>XLXN_196,
                D(15 downto 0)=>XLXN_197(15 downto 0),
                Q(15 downto 0)=>XLXN_89(15 downto 0));
   
   XLXI_106 : GND
      port map (G=>XLXN_200);
   
   XLXI_107 : VCC
      port map (P=>XLXN_199);
   
   XLXI_108 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_199,
                CLR=>XLXN_200,
                D(15 downto 0)=>XLXN_201(15 downto 0),
                Q(15 downto 0)=>XLXN_90(15 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity gnd16_MUSER_main is
   port ( GNDO : out   std_logic_vector (15 downto 0));
end gnd16_MUSER_main;

architecture BEHAVIORAL of gnd16_MUSER_main is
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

entity mux4x1x16e_MUSER_main is
   port ( D0 : in    std_logic_vector (15 downto 0); 
          D1 : in    std_logic_vector (15 downto 0); 
          D2 : in    std_logic_vector (15 downto 0); 
          D3 : in    std_logic_vector (15 downto 0); 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          S1 : in    std_logic; 
          O  : out   std_logic_vector (15 downto 0));
end mux4x1x16e_MUSER_main;

architecture BEHAVIORAL of mux4x1x16e_MUSER_main is
   attribute HU_SET     : string ;
   component M4_1E_HXILINX_main
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_806";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_807";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_808";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_809";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_810";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_811";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_812";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_813";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_814";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_815";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_816";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_817";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_818";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_819";
   attribute HU_SET of XLXI_15 : label is "XLXI_15_820";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_821";
begin
   XLXI_1 : M4_1E_HXILINX_main
      port map (D0=>D0(0),
                D1=>D1(0),
                D2=>D2(0),
                D3=>D3(0),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(0));
   
   XLXI_2 : M4_1E_HXILINX_main
      port map (D0=>D0(1),
                D1=>D1(1),
                D2=>D2(1),
                D3=>D3(1),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(1));
   
   XLXI_3 : M4_1E_HXILINX_main
      port map (D0=>D0(2),
                D1=>D1(2),
                D2=>D2(2),
                D3=>D3(2),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(2));
   
   XLXI_4 : M4_1E_HXILINX_main
      port map (D0=>D0(3),
                D1=>D1(3),
                D2=>D2(3),
                D3=>D3(3),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(3));
   
   XLXI_5 : M4_1E_HXILINX_main
      port map (D0=>D0(4),
                D1=>D1(4),
                D2=>D2(4),
                D3=>D3(4),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(4));
   
   XLXI_6 : M4_1E_HXILINX_main
      port map (D0=>D0(5),
                D1=>D1(5),
                D2=>D2(5),
                D3=>D3(5),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(5));
   
   XLXI_7 : M4_1E_HXILINX_main
      port map (D0=>D0(6),
                D1=>D1(6),
                D2=>D2(6),
                D3=>D3(6),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(6));
   
   XLXI_8 : M4_1E_HXILINX_main
      port map (D0=>D0(7),
                D1=>D1(7),
                D2=>D2(7),
                D3=>D3(7),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(7));
   
   XLXI_9 : M4_1E_HXILINX_main
      port map (D0=>D0(8),
                D1=>D1(8),
                D2=>D2(8),
                D3=>D3(8),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(8));
   
   XLXI_10 : M4_1E_HXILINX_main
      port map (D0=>D0(9),
                D1=>D1(9),
                D2=>D2(9),
                D3=>D3(9),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(9));
   
   XLXI_11 : M4_1E_HXILINX_main
      port map (D0=>D0(10),
                D1=>D1(10),
                D2=>D2(10),
                D3=>D3(10),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(10));
   
   XLXI_12 : M4_1E_HXILINX_main
      port map (D0=>D0(11),
                D1=>D1(11),
                D2=>D2(11),
                D3=>D3(11),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(11));
   
   XLXI_13 : M4_1E_HXILINX_main
      port map (D0=>D0(12),
                D1=>D1(12),
                D2=>D2(12),
                D3=>D3(12),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(12));
   
   XLXI_14 : M4_1E_HXILINX_main
      port map (D0=>D0(13),
                D1=>D1(13),
                D2=>D2(13),
                D3=>D3(13),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(13));
   
   XLXI_15 : M4_1E_HXILINX_main
      port map (D0=>D0(14),
                D1=>D1(14),
                D2=>D2(14),
                D3=>D3(14),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(14));
   
   XLXI_16 : M4_1E_HXILINX_main
      port map (D0=>D0(15),
                D1=>D1(15),
                D2=>D2(15),
                D3=>D3(15),
                E=>E,
                S0=>S0,
                S1=>S1,
                O=>O(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity idu_MUSER_main is
   port ( INST   : in    std_logic_vector (31 downto 0); 
          A      : out   std_logic_vector (15 downto 0); 
          AFREG  : out   std_logic; 
          A_L4   : out   std_logic_vector (3 downto 0); 
          B      : out   std_logic_vector (15 downto 0); 
          BFREG  : out   std_logic; 
          B_L4   : out   std_logic_vector (3 downto 0); 
          DEST   : out   std_logic_vector (3 downto 0); 
          DEST16 : out   std_logic_vector (15 downto 0); 
          ID     : out   std_logic_vector (7 downto 0));
end idu_MUSER_main;

architecture BEHAVIORAL of idu_MUSER_main is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   signal ARGC        : std_logic_vector (1 downto 0);
   signal DATA        : std_logic_vector (15 downto 0);
   signal DATA_H4     : std_logic_vector (15 downto 0);
   signal DATA_H8     : std_logic_vector (15 downto 0);
   signal DATA_H12    : std_logic_vector (15 downto 0);
   signal DATA_L4     : std_logic_vector (15 downto 0);
   signal DATA_L8     : std_logic_vector (15 downto 0);
   signal DATA_L12    : std_logic_vector (15 downto 0);
   signal XLXN_3      : std_logic;
   signal XLXN_5      : std_logic;
   signal XLXN_6      : std_logic;
   signal XLXN_833    : std_logic;
   signal XLXN_834    : std_logic;
   signal XLXN_835    : std_logic;
   signal BFREG_DUMMY : std_logic;
   signal A_DUMMY     : std_logic_vector (15 downto 0);
   signal B_DUMMY     : std_logic_vector (15 downto 0);
   signal AFREG_DUMMY : std_logic;
   signal DEST_DUMMY  : std_logic_vector (3 downto 0);
   component mux4x1x16e_MUSER_main
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             E  : in    std_logic; 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute INIT of XLXI_4 : label is "0600";
   attribute INIT of XLXI_5 : label is "0D00";
   attribute INIT of XLXI_6 : label is "0FF0";
   attribute INIT of XLXI_470 : label is "0600";
   attribute INIT of XLXI_471 : label is "0B00";
   attribute INIT of XLXI_472 : label is "0F00";
begin
   A(15 downto 0) <= A_DUMMY(15 downto 0);
   AFREG <= AFREG_DUMMY;
   B(15 downto 0) <= B_DUMMY(15 downto 0);
   BFREG <= BFREG_DUMMY;
   DEST(3 downto 0) <= DEST_DUMMY(3 downto 0);
   A_Data_Selector : mux4x1x16e_MUSER_main
      port map (D0(15 downto 0)=>DATA(15 downto 0),
                D1(15 downto 0)=>DATA_H12(15 downto 0),
                D2(15 downto 0)=>DATA_H8(15 downto 0),
                D3(15 downto 0)=>DATA_H4(15 downto 0),
                E=>XLXN_6,
                S0=>XLXN_3,
                S1=>XLXN_5,
                O(15 downto 0)=>A_DUMMY(15 downto 0));
   
   B_Data_Selector : mux4x1x16e_MUSER_main
      port map (D0(15 downto 0)=>DATA(15 downto 0),
                D1(15 downto 0)=>DATA_L12(15 downto 0),
                D2(15 downto 0)=>DATA_L8(15 downto 0),
                D3(15 downto 0)=>DATA_L4(15 downto 0),
                E=>XLXN_835,
                S0=>XLXN_833,
                S1=>XLXN_834,
                O(15 downto 0)=>B_DUMMY(15 downto 0));
   
   XLXI_4 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0600")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_3);
   
   XLXI_5 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0D00")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_5);
   
   XLXI_6 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0FF0")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_6);
   
   XLXI_19 : BUF
      port map (I=>INST(0),
                O=>DATA(0));
   
   XLXI_24 : BUF
      port map (I=>INST(1),
                O=>DATA(1));
   
   XLXI_25 : BUF
      port map (I=>INST(2),
                O=>DATA(2));
   
   XLXI_26 : BUF
      port map (I=>INST(3),
                O=>DATA(3));
   
   XLXI_27 : BUF
      port map (I=>INST(4),
                O=>DATA(4));
   
   XLXI_28 : BUF
      port map (I=>INST(5),
                O=>DATA(5));
   
   XLXI_29 : BUF
      port map (I=>INST(6),
                O=>DATA(6));
   
   XLXI_30 : BUF
      port map (I=>INST(7),
                O=>DATA(7));
   
   XLXI_31 : BUF
      port map (I=>INST(8),
                O=>DATA(8));
   
   XLXI_32 : BUF
      port map (I=>INST(9),
                O=>DATA(9));
   
   XLXI_33 : BUF
      port map (I=>INST(10),
                O=>DATA(10));
   
   XLXI_34 : BUF
      port map (I=>INST(11),
                O=>DATA(11));
   
   XLXI_35 : BUF
      port map (I=>INST(12),
                O=>DATA(12));
   
   XLXI_36 : BUF
      port map (I=>INST(13),
                O=>DATA(13));
   
   XLXI_37 : BUF
      port map (I=>INST(14),
                O=>DATA(14));
   
   XLXI_38 : BUF
      port map (I=>INST(15),
                O=>DATA(15));
   
   XLXI_39 : BUF
      port map (I=>INST(16),
                O=>DEST_DUMMY(0));
   
   XLXI_40 : BUF
      port map (I=>INST(17),
                O=>DEST_DUMMY(1));
   
   XLXI_41 : BUF
      port map (I=>INST(18),
                O=>DEST_DUMMY(2));
   
   XLXI_42 : BUF
      port map (I=>INST(19),
                O=>DEST_DUMMY(3));
   
   XLXI_43 : BUF
      port map (I=>INST(20),
                O=>BFREG_DUMMY);
   
   XLXI_44 : BUF
      port map (I=>INST(21),
                O=>AFREG_DUMMY);
   
   XLXI_45 : BUF
      port map (I=>INST(22),
                O=>ARGC(0));
   
   XLXI_46 : BUF
      port map (I=>INST(23),
                O=>ARGC(1));
   
   XLXI_47 : BUF
      port map (I=>INST(24),
                O=>ID(0));
   
   XLXI_48 : BUF
      port map (I=>INST(25),
                O=>ID(1));
   
   XLXI_49 : BUF
      port map (I=>INST(26),
                O=>ID(2));
   
   XLXI_50 : BUF
      port map (I=>INST(27),
                O=>ID(3));
   
   XLXI_51 : BUF
      port map (I=>INST(28),
                O=>ID(4));
   
   XLXI_52 : BUF
      port map (I=>INST(29),
                O=>ID(5));
   
   XLXI_53 : BUF
      port map (I=>INST(30),
                O=>ID(6));
   
   XLXI_54 : BUF
      port map (I=>INST(31),
                O=>ID(7));
   
   XLXI_59 : BUF
      port map (I=>DATA(15),
                O=>DATA_H12(11));
   
   XLXI_60 : BUF
      port map (I=>DATA(14),
                O=>DATA_H12(10));
   
   XLXI_61 : BUF
      port map (I=>DATA(13),
                O=>DATA_H12(9));
   
   XLXI_62 : BUF
      port map (I=>DATA(12),
                O=>DATA_H12(8));
   
   XLXI_63 : BUF
      port map (I=>DATA(11),
                O=>DATA_H12(7));
   
   XLXI_64 : BUF
      port map (I=>DATA(10),
                O=>DATA_H12(6));
   
   XLXI_65 : BUF
      port map (I=>DATA(9),
                O=>DATA_H12(5));
   
   XLXI_66 : BUF
      port map (I=>DATA(8),
                O=>DATA_H12(4));
   
   XLXI_67 : BUF
      port map (I=>DATA(7),
                O=>DATA_H12(3));
   
   XLXI_68 : BUF
      port map (I=>DATA(6),
                O=>DATA_H12(2));
   
   XLXI_69 : BUF
      port map (I=>DATA(5),
                O=>DATA_H12(1));
   
   XLXI_70 : BUF
      port map (I=>DATA(4),
                O=>DATA_H12(0));
   
   XLXI_75 : BUF
      port map (I=>DATA(11),
                O=>DATA_L12(11));
   
   XLXI_76 : BUF
      port map (I=>DATA(10),
                O=>DATA_L12(10));
   
   XLXI_77 : BUF
      port map (I=>DATA(9),
                O=>DATA_L12(9));
   
   XLXI_78 : BUF
      port map (I=>DATA(8),
                O=>DATA_L12(8));
   
   XLXI_79 : BUF
      port map (I=>DATA(7),
                O=>DATA_L12(7));
   
   XLXI_80 : BUF
      port map (I=>DATA(6),
                O=>DATA_L12(6));
   
   XLXI_81 : BUF
      port map (I=>DATA(5),
                O=>DATA_L12(5));
   
   XLXI_82 : BUF
      port map (I=>DATA(4),
                O=>DATA_L12(4));
   
   XLXI_83 : BUF
      port map (I=>DATA(3),
                O=>DATA_L12(3));
   
   XLXI_84 : BUF
      port map (I=>DATA(2),
                O=>DATA_L12(2));
   
   XLXI_85 : BUF
      port map (I=>DATA(1),
                O=>DATA_L12(1));
   
   XLXI_86 : BUF
      port map (I=>DATA(0),
                O=>DATA_L12(0));
   
   XLXI_135 : GND
      port map (G=>DATA_H12(15));
   
   XLXI_136 : GND
      port map (G=>DATA_H12(14));
   
   XLXI_137 : GND
      port map (G=>DATA_H12(13));
   
   XLXI_138 : GND
      port map (G=>DATA_H12(12));
   
   XLXI_167 : GND
      port map (G=>DATA_L12(15));
   
   XLXI_168 : GND
      port map (G=>DATA_L12(14));
   
   XLXI_169 : GND
      port map (G=>DATA_L12(13));
   
   XLXI_170 : GND
      port map (G=>DATA_L12(12));
   
   XLXI_239 : BUF
      port map (I=>DATA(8),
                O=>DATA_H8(0));
   
   XLXI_240 : BUF
      port map (I=>DATA(9),
                O=>DATA_H8(1));
   
   XLXI_241 : BUF
      port map (I=>DATA(10),
                O=>DATA_H8(2));
   
   XLXI_242 : BUF
      port map (I=>DATA(11),
                O=>DATA_H8(3));
   
   XLXI_243 : BUF
      port map (I=>DATA(12),
                O=>DATA_H8(4));
   
   XLXI_244 : BUF
      port map (I=>DATA(13),
                O=>DATA_H8(5));
   
   XLXI_245 : BUF
      port map (I=>DATA(14),
                O=>DATA_H8(6));
   
   XLXI_246 : BUF
      port map (I=>DATA(15),
                O=>DATA_H8(7));
   
   XLXI_247 : GND
      port map (G=>DATA_H8(8));
   
   XLXI_248 : GND
      port map (G=>DATA_H8(9));
   
   XLXI_249 : GND
      port map (G=>DATA_H8(10));
   
   XLXI_250 : GND
      port map (G=>DATA_H8(11));
   
   XLXI_252 : GND
      port map (G=>DATA_H8(12));
   
   XLXI_253 : GND
      port map (G=>DATA_H8(13));
   
   XLXI_255 : GND
      port map (G=>DATA_H8(14));
   
   XLXI_256 : GND
      port map (G=>DATA_H8(15));
   
   XLXI_257 : BUF
      port map (I=>DATA(0),
                O=>DATA_L8(0));
   
   XLXI_258 : BUF
      port map (I=>DATA(1),
                O=>DATA_L8(1));
   
   XLXI_259 : BUF
      port map (I=>DATA(2),
                O=>DATA_L8(2));
   
   XLXI_260 : BUF
      port map (I=>DATA(3),
                O=>DATA_L8(3));
   
   XLXI_261 : BUF
      port map (I=>DATA(4),
                O=>DATA_L8(4));
   
   XLXI_262 : BUF
      port map (I=>DATA(5),
                O=>DATA_L8(5));
   
   XLXI_263 : BUF
      port map (I=>DATA(6),
                O=>DATA_L8(6));
   
   XLXI_264 : BUF
      port map (I=>DATA(7),
                O=>DATA_L8(7));
   
   XLXI_265 : GND
      port map (G=>DATA_L8(8));
   
   XLXI_266 : GND
      port map (G=>DATA_L8(9));
   
   XLXI_267 : GND
      port map (G=>DATA_L8(10));
   
   XLXI_268 : GND
      port map (G=>DATA_L8(11));
   
   XLXI_269 : GND
      port map (G=>DATA_L8(12));
   
   XLXI_270 : GND
      port map (G=>DATA_L8(13));
   
   XLXI_271 : GND
      port map (G=>DATA_L8(14));
   
   XLXI_272 : GND
      port map (G=>DATA_L8(15));
   
   XLXI_277 : BUF
      port map (I=>DATA(12),
                O=>DATA_H4(0));
   
   XLXI_278 : BUF
      port map (I=>DATA(13),
                O=>DATA_H4(1));
   
   XLXI_279 : BUF
      port map (I=>DATA(14),
                O=>DATA_H4(2));
   
   XLXI_280 : BUF
      port map (I=>DATA(15),
                O=>DATA_H4(3));
   
   XLXI_281 : GND
      port map (G=>DATA_H4(4));
   
   XLXI_282 : GND
      port map (G=>DATA_H4(5));
   
   XLXI_283 : GND
      port map (G=>DATA_H4(6));
   
   XLXI_284 : GND
      port map (G=>DATA_H4(7));
   
   XLXI_289 : GND
      port map (G=>DATA_H4(8));
   
   XLXI_290 : GND
      port map (G=>DATA_H4(9));
   
   XLXI_291 : GND
      port map (G=>DATA_H4(10));
   
   XLXI_292 : GND
      port map (G=>DATA_H4(11));
   
   XLXI_293 : GND
      port map (G=>DATA_H4(12));
   
   XLXI_294 : GND
      port map (G=>DATA_H4(13));
   
   XLXI_295 : GND
      port map (G=>DATA_H4(14));
   
   XLXI_296 : GND
      port map (G=>DATA_H4(15));
   
   XLXI_297 : GND
      port map (G=>DATA_L4(4));
   
   XLXI_298 : GND
      port map (G=>DATA_L4(5));
   
   XLXI_299 : GND
      port map (G=>DATA_L4(6));
   
   XLXI_300 : GND
      port map (G=>DATA_L4(7));
   
   XLXI_301 : GND
      port map (G=>DATA_L4(8));
   
   XLXI_302 : GND
      port map (G=>DATA_L4(9));
   
   XLXI_303 : GND
      port map (G=>DATA_L4(10));
   
   XLXI_304 : GND
      port map (G=>DATA_L4(11));
   
   XLXI_305 : GND
      port map (G=>DATA_L4(12));
   
   XLXI_306 : GND
      port map (G=>DATA_L4(13));
   
   XLXI_307 : GND
      port map (G=>DATA_L4(14));
   
   XLXI_308 : GND
      port map (G=>DATA_L4(15));
   
   XLXI_309 : BUF
      port map (I=>DATA(2),
                O=>DATA_L4(2));
   
   XLXI_310 : BUF
      port map (I=>DATA(0),
                O=>DATA_L4(0));
   
   XLXI_311 : BUF
      port map (I=>DATA(1),
                O=>DATA_L4(1));
   
   XLXI_312 : BUF
      port map (I=>DATA(3),
                O=>DATA_L4(3));
   
   XLXI_470 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0600")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_833);
   
   XLXI_471 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0B00")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_834);
   
   XLXI_472 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"0F00")
   -- synopsys translate_on
      port map (I0=>BFREG_DUMMY,
                I1=>AFREG_DUMMY,
                I2=>ARGC(0),
                I3=>ARGC(1),
                O=>XLXN_835);
   
   XLXI_473 : BUF
      port map (I=>A_DUMMY(0),
                O=>A_L4(0));
   
   XLXI_474 : BUF
      port map (I=>A_DUMMY(1),
                O=>A_L4(1));
   
   XLXI_475 : BUF
      port map (I=>A_DUMMY(2),
                O=>A_L4(2));
   
   XLXI_476 : BUF
      port map (I=>A_DUMMY(3),
                O=>A_L4(3));
   
   XLXI_490 : BUF
      port map (I=>B_DUMMY(0),
                O=>B_L4(0));
   
   XLXI_491 : BUF
      port map (I=>B_DUMMY(1),
                O=>B_L4(1));
   
   XLXI_492 : BUF
      port map (I=>B_DUMMY(2),
                O=>B_L4(2));
   
   XLXI_493 : BUF
      port map (I=>B_DUMMY(3),
                O=>B_L4(3));
   
   XLXI_494 : BUF
      port map (I=>DEST_DUMMY(0),
                O=>DEST16(0));
   
   XLXI_495 : BUF
      port map (I=>DEST_DUMMY(1),
                O=>DEST16(1));
   
   XLXI_496 : BUF
      port map (I=>DEST_DUMMY(2),
                O=>DEST16(2));
   
   XLXI_497 : BUF
      port map (I=>DEST_DUMMY(3),
                O=>DEST16(3));
   
   XLXI_498 : GND
      port map (G=>DEST16(4));
   
   XLXI_499 : GND
      port map (G=>DEST16(5));
   
   XLXI_500 : GND
      port map (G=>DEST16(6));
   
   XLXI_501 : GND
      port map (G=>DEST16(7));
   
   XLXI_502 : GND
      port map (G=>DEST16(8));
   
   XLXI_503 : GND
      port map (G=>DEST16(9));
   
   XLXI_504 : GND
      port map (G=>DEST16(10));
   
   XLXI_505 : GND
      port map (G=>DEST16(11));
   
   XLXI_506 : GND
      port map (G=>DEST16(12));
   
   XLXI_507 : GND
      port map (G=>DEST16(13));
   
   XLXI_508 : GND
      port map (G=>DEST16(14));
   
   XLXI_509 : GND
      port map (G=>DEST16(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity regs_MUSER_main is
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
end regs_MUSER_main;

architecture BEHAVIORAL of regs_MUSER_main is
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
   component mux16x1x16tb_MUSER_main
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
   
   component gnd16_MUSER_main
      port ( GNDO : out   std_logic_vector (15 downto 0));
   end component;
   
   component D4_16E_HXILINX_main
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
   
   component FD16CE_HXILINX_main
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
         "Write_Address_Decoder_822";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_823";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_824";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_825";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_826";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_827";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_828";
   attribute HU_SET of XLXI_16 : label is "XLXI_16_829";
   attribute HU_SET of XLXI_18 : label is "XLXI_18_830";
   attribute HU_SET of XLXI_20 : label is "XLXI_20_831";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_832";
   attribute HU_SET of XLXI_24 : label is "XLXI_24_833";
   attribute HU_SET of XLXI_26 : label is "XLXI_26_834";
   attribute HU_SET of XLXI_28 : label is "XLXI_28_835";
   attribute HU_SET of XLXI_30 : label is "XLXI_30_836";
   attribute HU_SET of XLXI_32 : label is "XLXI_32_837";
begin
   Output_1_Data_Selector : mux16x1x16tb_MUSER_main
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
   
   Output_2_Data_Selector : mux16x1x16tb_MUSER_main
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
   
   Output_3_Data_Selector : mux16x1x16tb_MUSER_main
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
   
   R0_Data : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_606(15 downto 0));
   
   Write_Address_Decoder : D4_16E_HXILINX_main
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
   
   XLXI_4 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_132,
                CLR=>XLXN_3,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_607(15 downto 0));
   
   XLXI_5 : GND
      port map (G=>XLXN_3);
   
   XLXI_6 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_135,
                CLR=>XLXN_4,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_608(15 downto 0));
   
   XLXI_7 : GND
      port map (G=>XLXN_4);
   
   XLXI_8 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_136,
                CLR=>XLXN_5,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_609(15 downto 0));
   
   XLXI_9 : GND
      port map (G=>XLXN_5);
   
   XLXI_10 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_137,
                CLR=>XLXN_6,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_610(15 downto 0));
   
   XLXI_11 : GND
      port map (G=>XLXN_6);
   
   XLXI_12 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_138,
                CLR=>XLXN_7,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_611(15 downto 0));
   
   XLXI_13 : GND
      port map (G=>XLXN_7);
   
   XLXI_14 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_139,
                CLR=>XLXN_8,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_618(15 downto 0));
   
   XLXI_15 : GND
      port map (G=>XLXN_8);
   
   XLXI_16 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_140,
                CLR=>XLXN_9,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_619(15 downto 0));
   
   XLXI_17 : GND
      port map (G=>XLXN_9);
   
   XLXI_18 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_141,
                CLR=>XLXN_10,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_471(15 downto 0));
   
   XLXI_19 : GND
      port map (G=>XLXN_10);
   
   XLXI_20 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_142,
                CLR=>XLXN_11,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_472(15 downto 0));
   
   XLXI_21 : GND
      port map (G=>XLXN_11);
   
   XLXI_22 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_143,
                CLR=>XLXN_12,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_473(15 downto 0));
   
   XLXI_23 : GND
      port map (G=>XLXN_12);
   
   XLXI_24 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_144,
                CLR=>XLXN_13,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_475(15 downto 0));
   
   XLXI_25 : GND
      port map (G=>XLXN_13);
   
   XLXI_26 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_145,
                CLR=>XLXN_14,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_476(15 downto 0));
   
   XLXI_27 : GND
      port map (G=>XLXN_14);
   
   XLXI_28 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_146,
                CLR=>XLXN_15,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_494(15 downto 0));
   
   XLXI_29 : GND
      port map (G=>XLXN_15);
   
   XLXI_30 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_147,
                CLR=>XLXN_16,
                D(15 downto 0)=>DIN(15 downto 0),
                Q(15 downto 0)=>XLXN_478(15 downto 0));
   
   XLXI_31 : GND
      port map (G=>XLXN_16);
   
   XLXI_32 : FD16CE_HXILINX_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity cpu_MUSER_main is
   port ( CLK     : in    std_logic; 
          I0      : in    std_logic_vector (15 downto 0); 
          I1      : in    std_logic_vector (15 downto 0); 
          I2      : in    std_logic_vector (15 downto 0); 
          I3      : in    std_logic_vector (15 downto 0); 
          I4      : in    std_logic_vector (15 downto 0); 
          I5      : in    std_logic_vector (15 downto 0); 
          I6      : in    std_logic_vector (15 downto 0); 
          I7      : in    std_logic_vector (15 downto 0); 
          I8      : in    std_logic_vector (15 downto 0); 
          I9      : in    std_logic_vector (15 downto 0); 
          I10     : in    std_logic_vector (15 downto 0); 
          I11     : in    std_logic_vector (15 downto 0); 
          I12     : in    std_logic_vector (15 downto 0); 
          I13     : in    std_logic_vector (15 downto 0); 
          I14     : in    std_logic_vector (15 downto 0); 
          I15     : in    std_logic_vector (15 downto 0); 
          START   : in    std_logic; 
          TSTL    : in    std_logic; 
          TXCLK   : in    std_logic; 
          FLGS    : out   std_logic_vector (15 downto 0); 
          FLG_IDX : out   std_logic_vector (3 downto 0); 
          GFX_D1  : out   std_logic; 
          GFX_D2  : out   std_logic; 
          GFX_S1  : out   std_logic; 
          GFX_S2  : out   std_logic; 
          O0      : out   std_logic_vector (15 downto 0); 
          O1      : out   std_logic_vector (15 downto 0); 
          O2      : out   std_logic_vector (15 downto 0); 
          O3      : out   std_logic_vector (15 downto 0); 
          O4      : out   std_logic_vector (15 downto 0); 
          O5      : out   std_logic_vector (15 downto 0); 
          O6      : out   std_logic_vector (15 downto 0); 
          O7      : out   std_logic_vector (15 downto 0); 
          O8      : out   std_logic_vector (15 downto 0); 
          O9      : out   std_logic_vector (15 downto 0); 
          O10     : out   std_logic_vector (15 downto 0); 
          O11     : out   std_logic_vector (15 downto 0); 
          O12     : out   std_logic_vector (15 downto 0); 
          O13     : out   std_logic_vector (15 downto 0); 
          O14     : out   std_logic_vector (15 downto 0); 
          O15     : out   std_logic_vector (15 downto 0));
end cpu_MUSER_main;

architecture BEHAVIORAL of cpu_MUSER_main is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal A              : std_logic_vector (15 downto 0);
   signal AFREG          : std_logic;
   signal ALUO           : std_logic_vector (15 downto 0);
   signal ALU_OP         : std_logic_vector (3 downto 0);
   signal ARG_BUF_CE     : std_logic;
   signal A_L4           : std_logic_vector (3 downto 0);
   signal B              : std_logic_vector (15 downto 0);
   signal BFREG          : std_logic;
   signal C              : std_logic_vector (15 downto 0);
   signal FLG            : std_logic;
   signal FLG_INV        : std_logic;
   signal FLG_REG_CE     : std_logic;
   signal GFX_TX_E       : std_logic;
   signal HLT            : std_logic;
   signal ID             : std_logic_vector (7 downto 0);
   signal NEHLT          : std_logic;
   signal NSTL           : std_logic;
   signal OUT_REG_WE     : std_logic;
   signal PC             : std_logic_vector (15 downto 0);
   signal PC_CE          : std_logic;
   signal PC_L           : std_logic;
   signal RAM_WE         : std_logic;
   signal RDA            : std_logic_vector (15 downto 0);
   signal RDB            : std_logic_vector (15 downto 0);
   signal RDC            : std_logic_vector (15 downto 0);
   signal REG_DATA_SEL_0 : std_logic;
   signal REG_DATA_SEL_1 : std_logic;
   signal RUN            : std_logic;
   signal SET_MOV_SEL    : std_logic;
   signal STARTED        : std_logic;
   signal STG            : std_logic_vector (1 downto 0);
   signal STL_CNT_L      : std_logic;
   signal XLXN_1         : std_logic_vector (15 downto 0);
   signal XLXN_30        : std_logic_vector (15 downto 0);
   signal XLXN_32        : std_logic_vector (15 downto 0);
   signal XLXN_51        : std_logic;
   signal XLXN_52        : std_logic;
   signal XLXN_58        : std_logic_vector (15 downto 0);
   signal XLXN_59        : std_logic_vector (15 downto 0);
   signal XLXN_60        : std_logic_vector (15 downto 0);
   signal XLXN_86        : std_logic_vector (31 downto 0);
   signal XLXN_254       : std_logic;
   signal XLXN_282       : std_logic;
   signal XLXN_296       : std_logic_vector (3 downto 0);
   signal XLXN_303       : std_logic_vector (3 downto 0);
   signal XLXN_307       : std_logic_vector (15 downto 0);
   signal XLXN_342       : std_logic;
   signal XLXN_344       : std_logic_vector (3 downto 0);
   signal XLXN_348       : std_logic_vector (15 downto 0);
   signal XLXN_370       : std_logic;
   signal XLXN_673       : std_logic;
   signal XLXN_679       : std_logic;
   signal XLXN_680       : std_logic;
   signal XLXN_684       : std_logic;
   signal XLXN_687       : std_logic_vector (15 downto 0);
   signal XLXN_691       : std_logic;
   signal XLXN_692       : std_logic;
   signal XLXN_696       : std_logic;
   signal XLXN_697       : std_logic;
   signal XLXN_728       : std_logic;
   signal XLXN_729       : std_logic;
   signal XLXN_740       : std_logic;
   signal XLXN_742       : std_logic;
   signal XLXN_760       : std_logic;
   signal XLXN_761       : std_logic;
   signal XLXN_762       : std_logic_vector (15 downto 0);
   signal XLXN_817       : std_logic_vector (15 downto 0);
   signal XLXN_818       : std_logic_vector (15 downto 0);
   signal XLXN_819       : std_logic_vector (15 downto 0);
   signal XLXN_821       : std_logic;
   signal XLXN_837       : std_logic_vector (31 downto 0);
   signal XLXN_843       : std_logic;
   signal XLXN_848       : std_logic;
   signal XLXN_849       : std_logic_vector (31 downto 0);
   signal XLXN_853       : std_logic;
   signal XLXN_854       : std_logic;
   signal XLXN_855       : std_logic;
   signal FLG_IDX_DUMMY  : std_logic_vector (3 downto 0);
   signal FLGS_DUMMY     : std_logic_vector (15 downto 0);
   component alu_MUSER_main
      port ( A  : in    std_logic_vector (15 downto 0); 
             B  : in    std_logic_vector (15 downto 0); 
             F  : out   std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             OP : in    std_logic_vector (3 downto 0));
   end component;
   
   component mux2x1x16e_MUSER_main
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             E  : in    std_logic; 
             O  : out   std_logic_vector (15 downto 0); 
             S  : in    std_logic);
   end component;
   
   component cu_MUSER_main
      port ( ALU_OP         : out   std_logic_vector (3 downto 0); 
             ARG_BUF_CE     : out   std_logic; 
             CFIMM          : out   std_logic; 
             FLG            : in    std_logic; 
             FLG_IDX        : out   std_logic_vector (3 downto 0); 
             FLG_INV        : out   std_logic; 
             FLG_REG_CE     : out   std_logic; 
             GFX_TX_E       : out   std_logic; 
             HLT            : out   std_logic; 
             ID             : in    std_logic_vector (7 downto 0); 
             OUT_REG_WE     : out   std_logic; 
             PC_CE          : out   std_logic; 
             PC_L           : out   std_logic; 
             RAM_WE         : out   std_logic; 
             REG_DATA_SEL_0 : out   std_logic; 
             REG_DATA_SEL_1 : out   std_logic; 
             REG_WE         : out   std_logic; 
             RUN            : in    std_logic; 
             SET_MOV_SEL    : out   std_logic; 
             STG            : in    std_logic_vector (1 downto 0); 
             STL_CNT_L      : out   std_logic);
   end component;
   
   component flgchk_MUSER_main
      port ( E      : in    std_logic; 
             FLG    : in    std_logic_vector (15 downto 0); 
             FSTATE : out   std_logic; 
             IDX    : in    std_logic_vector (3 downto 0));
   end component;
   
   component FD16CE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             Q   : out   std_logic_vector (15 downto 0));
   end component;
   
   component ram_wrapper_MUSER_main
      port ( ADDR : in    std_logic_vector (15 downto 0); 
             CLK  : in    std_logic; 
             DIN  : in    std_logic_vector (15 downto 0); 
             DO   : out   std_logic_vector (15 downto 0); 
             WE   : in    std_logic);
   end component;
   
   component fd32ce_MUSER_main
      port ( CE  : in    std_logic; 
             CLK : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (31 downto 0); 
             Q   : out   std_logic_vector (31 downto 0));
   end component;
   
   component gfx_inst_encoder_MUSER_main
      port ( A        : in    std_logic_vector (15 downto 0); 
             B        : in    std_logic_vector (15 downto 0); 
             C        : in    std_logic_vector (15 downto 0); 
             GFX_INST : out   std_logic_vector (31 downto 0); 
             ID       : in    std_logic_vector (7 downto 0));
   end component;
   
   component spacewire_tx_x2_MUSER_main
      port ( BGN  : in    std_logic; 
             CE   : in    std_logic; 
             CLK  : in    std_logic; 
             CLR  : in    std_logic; 
             D1   : out   std_logic; 
             D2   : out   std_logic; 
             DATA : in    std_logic_vector (31 downto 0); 
             S1   : out   std_logic; 
             S2   : out   std_logic);
   end component;
   
   component inp_stab_MUSER_main
      port ( CLK : in    std_logic; 
             I0  : in    std_logic_vector (15 downto 0); 
             I1  : in    std_logic_vector (15 downto 0); 
             I10 : in    std_logic_vector (15 downto 0); 
             I11 : in    std_logic_vector (15 downto 0); 
             I12 : in    std_logic_vector (15 downto 0); 
             I13 : in    std_logic_vector (15 downto 0); 
             I14 : in    std_logic_vector (15 downto 0); 
             I15 : in    std_logic_vector (15 downto 0); 
             I2  : in    std_logic_vector (15 downto 0); 
             I3  : in    std_logic_vector (15 downto 0); 
             I4  : in    std_logic_vector (15 downto 0); 
             I5  : in    std_logic_vector (15 downto 0); 
             I6  : in    std_logic_vector (15 downto 0); 
             I7  : in    std_logic_vector (15 downto 0); 
             I8  : in    std_logic_vector (15 downto 0); 
             I9  : in    std_logic_vector (15 downto 0); 
             O   : out   std_logic_vector (15 downto 0); 
             S   : in    std_logic_vector (3 downto 0));
   end component;
   
   component idu_MUSER_main
      port ( A      : out   std_logic_vector (15 downto 0); 
             AFREG  : out   std_logic; 
             A_L4   : out   std_logic_vector (3 downto 0); 
             B      : out   std_logic_vector (15 downto 0); 
             BFREG  : out   std_logic; 
             B_L4   : out   std_logic_vector (3 downto 0); 
             DEST   : out   std_logic_vector (3 downto 0); 
             DEST16 : out   std_logic_vector (15 downto 0); 
             ID     : out   std_logic_vector (7 downto 0); 
             INST   : in    std_logic_vector (31 downto 0));
   end component;
   
   component rom_wrapper_MUSER_main
      port ( ADDR : in    std_logic_vector (15 downto 0); 
             CLK  : in    std_logic; 
             DO   : out   std_logic_vector (31 downto 0));
   end component;
   
   component oregs_MUSER_main
      port ( ADDR : in    std_logic_vector (3 downto 0); 
             CLK  : in    std_logic; 
             DIN  : in    std_logic_vector (15 downto 0); 
             DO0  : out   std_logic_vector (15 downto 0); 
             DO1  : out   std_logic_vector (15 downto 0); 
             DO10 : out   std_logic_vector (15 downto 0); 
             DO11 : out   std_logic_vector (15 downto 0); 
             DO12 : out   std_logic_vector (15 downto 0); 
             DO13 : out   std_logic_vector (15 downto 0); 
             DO14 : out   std_logic_vector (15 downto 0); 
             DO15 : out   std_logic_vector (15 downto 0); 
             DO2  : out   std_logic_vector (15 downto 0); 
             DO3  : out   std_logic_vector (15 downto 0); 
             DO4  : out   std_logic_vector (15 downto 0); 
             DO5  : out   std_logic_vector (15 downto 0); 
             DO6  : out   std_logic_vector (15 downto 0); 
             DO7  : out   std_logic_vector (15 downto 0); 
             DO8  : out   std_logic_vector (15 downto 0); 
             DO9  : out   std_logic_vector (15 downto 0); 
             WE   : in    std_logic);
   end component;
   
   component CB16CLED_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (15 downto 0); 
             L   : in    std_logic; 
             UP  : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component mux4x1x16t_MUSER_main
      port ( D0 : in    std_logic_vector (15 downto 0); 
             D1 : in    std_logic_vector (15 downto 0); 
             D2 : in    std_logic_vector (15 downto 0); 
             D3 : in    std_logic_vector (15 downto 0); 
             O  : out   std_logic_vector (15 downto 0); 
             S0 : in    std_logic; 
             S1 : in    std_logic);
   end component;
   
   component regs_MUSER_main
      port ( CLK  : in    std_logic; 
             DIN  : in    std_logic_vector (15 downto 0); 
             DO1  : out   std_logic_vector (15 downto 0); 
             DO2  : out   std_logic_vector (15 downto 0); 
             DO3  : out   std_logic_vector (15 downto 0); 
             RAD1 : in    std_logic_vector (3 downto 0); 
             RAD2 : in    std_logic_vector (3 downto 0); 
             RAD3 : in    std_logic_vector (3 downto 0); 
             WAD  : in    std_logic_vector (3 downto 0); 
             WE   : in    std_logic);
   end component;
   
   component CB2CE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component gnd16_MUSER_main
      port ( GNDO : out   std_logic_vector (15 downto 0));
   end component;
   
   component COMP16_HXILINX_main
      port ( A  : in    std_logic_vector (15 downto 0); 
             B  : in    std_logic_vector (15 downto 0); 
             EQ : out   std_logic);
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component FDCE
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component OR2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2B1 : component is "BLACK_BOX";
   
   attribute HU_SET of Flag_Register : label is "Flag_Register_842";
   attribute HU_SET of Program_Counter : label is "Program_Counter_838";
   attribute HU_SET of Stage_Counter : label is "Stage_Counter_839";
   attribute HU_SET of Stall_Counter : label is "Stall_Counter_840";
   attribute HU_SET of STL_CNT_ZERO_CMP : label is "STL_CNT_ZERO_CMP_841";
   attribute HU_SET of XLXI_281 : label is "XLXI_281_843";
   attribute HU_SET of XLXI_282 : label is "XLXI_282_844";
   attribute HU_SET of XLXI_283 : label is "XLXI_283_845";
begin
   FLGS(15 downto 0) <= FLGS_DUMMY(15 downto 0);
   FLG_IDX(3 downto 0) <= FLG_IDX_DUMMY(3 downto 0);
   Arithmetic_Logic_Unit : alu_MUSER_main
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                OP(3 downto 0)=>ALU_OP(3 downto 0),
                F(15 downto 0)=>XLXN_1(15 downto 0),
                O(15 downto 0)=>ALUO(15 downto 0));
   
   A_IMM_REG_Selector : mux2x1x16e_MUSER_main
      port map (D0(15 downto 0)=>XLXN_30(15 downto 0),
                D1(15 downto 0)=>RDA(15 downto 0),
                E=>XLXN_51,
                S=>AFREG,
                O(15 downto 0)=>XLXN_819(15 downto 0));
   
   B_IMM_REG_Selector : mux2x1x16e_MUSER_main
      port map (D0(15 downto 0)=>XLXN_32(15 downto 0),
                D1(15 downto 0)=>RDB(15 downto 0),
                E=>XLXN_52,
                S=>BFREG,
                O(15 downto 0)=>XLXN_818(15 downto 0));
   
   Control_Unit : cu_MUSER_main
      port map (FLG=>FLG,
                ID(7 downto 0)=>ID(7 downto 0),
                RUN=>RUN,
                STG(1 downto 0)=>STG(1 downto 0),
                ALU_OP(3 downto 0)=>ALU_OP(3 downto 0),
                ARG_BUF_CE=>ARG_BUF_CE,
                CFIMM=>XLXN_729,
                FLG_IDX(3 downto 0)=>FLG_IDX_DUMMY(3 downto 0),
                FLG_INV=>FLG_INV,
                FLG_REG_CE=>FLG_REG_CE,
                GFX_TX_E=>GFX_TX_E,
                HLT=>NEHLT,
                OUT_REG_WE=>OUT_REG_WE,
                PC_CE=>PC_CE,
                PC_L=>PC_L,
                RAM_WE=>RAM_WE,
                REG_DATA_SEL_0=>REG_DATA_SEL_0,
                REG_DATA_SEL_1=>REG_DATA_SEL_1,
                REG_WE=>XLXN_728,
                SET_MOV_SEL=>SET_MOV_SEL,
                STL_CNT_L=>STL_CNT_L);
   
   C_IMM_REG_Selector : mux2x1x16e_MUSER_main
      port map (D0(15 downto 0)=>RDC(15 downto 0),
                D1(15 downto 0)=>XLXN_348(15 downto 0),
                E=>XLXN_673,
                S=>XLXN_729,
                O(15 downto 0)=>XLXN_817(15 downto 0));
   
   Flag_Checker : flgchk_MUSER_main
      port map (E=>XLXN_680,
                FLG(15 downto 0)=>FLGS_DUMMY(15 downto 0),
                IDX(3 downto 0)=>FLG_IDX_DUMMY(3 downto 0),
                FSTATE=>XLXN_370);
   
   Flag_Register : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_855,
                CLR=>XLXN_282,
                D(15 downto 0)=>XLXN_1(15 downto 0),
                Q(15 downto 0)=>FLGS_DUMMY(15 downto 0));
   
   General_Purpose_RAM : ram_wrapper_MUSER_main
      port map (ADDR(15 downto 0)=>A(15 downto 0),
                CLK=>CLK,
                DIN(15 downto 0)=>C(15 downto 0),
                WE=>RAM_WE,
                DO(15 downto 0)=>XLXN_58(15 downto 0));
   
   GFX_Instruction_Buffer : fd32ce_MUSER_main
      port map (CE=>GFX_TX_E,
                CLK=>CLK,
                CLR=>XLXN_843,
                D(31 downto 0)=>XLXN_837(31 downto 0),
                Q(31 downto 0)=>XLXN_849(31 downto 0));
   
   GFX_Instruction_Encoder : gfx_inst_encoder_MUSER_main
      port map (A(15 downto 0)=>A(15 downto 0),
                B(15 downto 0)=>B(15 downto 0),
                C(15 downto 0)=>C(15 downto 0),
                ID(7 downto 0)=>ID(7 downto 0),
                GFX_INST(31 downto 0)=>XLXN_837(31 downto 0));
   
   GFX_Instruction_Transmitter : spacewire_tx_x2_MUSER_main
      port map (BGN=>XLXN_848,
                CE=>XLXN_740,
                CLK=>TXCLK,
                CLR=>XLXN_742,
                DATA(31 downto 0)=>XLXN_849(31 downto 0),
                D1=>GFX_D1,
                D2=>GFX_D2,
                S1=>GFX_S1,
                S2=>GFX_S2);
   
   Input_Stablilizer_Selector : inp_stab_MUSER_main
      port map (CLK=>CLK,
                I0(15 downto 0)=>I0(15 downto 0),
                I1(15 downto 0)=>I1(15 downto 0),
                I2(15 downto 0)=>I2(15 downto 0),
                I3(15 downto 0)=>I3(15 downto 0),
                I4(15 downto 0)=>I4(15 downto 0),
                I5(15 downto 0)=>I5(15 downto 0),
                I6(15 downto 0)=>I6(15 downto 0),
                I7(15 downto 0)=>I7(15 downto 0),
                I8(15 downto 0)=>I8(15 downto 0),
                I9(15 downto 0)=>I9(15 downto 0),
                I10(15 downto 0)=>I10(15 downto 0),
                I11(15 downto 0)=>I11(15 downto 0),
                I12(15 downto 0)=>I12(15 downto 0),
                I13(15 downto 0)=>I13(15 downto 0),
                I14(15 downto 0)=>I14(15 downto 0),
                I15(15 downto 0)=>I15(15 downto 0),
                S(3 downto 0)=>A_L4(3 downto 0),
                O(15 downto 0)=>XLXN_59(15 downto 0));
   
   Instruction_Decode_Unit : idu_MUSER_main
      port map (INST(31 downto 0)=>XLXN_86(31 downto 0),
                A(15 downto 0)=>XLXN_30(15 downto 0),
                AFREG=>AFREG,
                A_L4(3 downto 0)=>XLXN_296(3 downto 0),
                B(15 downto 0)=>XLXN_32(15 downto 0),
                BFREG=>BFREG,
                B_L4(3 downto 0)=>XLXN_303(3 downto 0),
                DEST(3 downto 0)=>XLXN_344(3 downto 0),
                DEST16(15 downto 0)=>XLXN_348(15 downto 0),
                ID(7 downto 0)=>ID(7 downto 0));
   
   Instruction_ROM : rom_wrapper_MUSER_main
      port map (ADDR(15 downto 0)=>PC(15 downto 0),
                CLK=>CLK,
                DO(31 downto 0)=>XLXN_86(31 downto 0));
   
   Output_Registers : oregs_MUSER_main
      port map (ADDR(3 downto 0)=>A_L4(3 downto 0),
                CLK=>CLK,
                DIN(15 downto 0)=>C(15 downto 0),
                WE=>OUT_REG_WE,
                DO0(15 downto 0)=>O0(15 downto 0),
                DO1(15 downto 0)=>O1(15 downto 0),
                DO2(15 downto 0)=>O2(15 downto 0),
                DO3(15 downto 0)=>O3(15 downto 0),
                DO4(15 downto 0)=>O4(15 downto 0),
                DO5(15 downto 0)=>O5(15 downto 0),
                DO6(15 downto 0)=>O6(15 downto 0),
                DO7(15 downto 0)=>O7(15 downto 0),
                DO8(15 downto 0)=>O8(15 downto 0),
                DO9(15 downto 0)=>O9(15 downto 0),
                DO10(15 downto 0)=>O10(15 downto 0),
                DO11(15 downto 0)=>O11(15 downto 0),
                DO12(15 downto 0)=>O12(15 downto 0),
                DO13(15 downto 0)=>O13(15 downto 0),
                DO14(15 downto 0)=>O14(15 downto 0),
                DO15(15 downto 0)=>O15(15 downto 0));
   
   Program_Counter : CB16CLED_HXILINX_main
      port map (C=>CLK,
                CE=>PC_CE,
                CLR=>XLXN_342,
                D(15 downto 0)=>A(15 downto 0),
                L=>PC_L,
                UP=>XLXN_679,
                CEO=>open,
                Q(15 downto 0)=>PC(15 downto 0),
                TC=>open);
   
   Register_Data_Input_Selector : mux4x1x16t_MUSER_main
      port map (D0(15 downto 0)=>ALUO(15 downto 0),
                D1(15 downto 0)=>XLXN_58(15 downto 0),
                D2(15 downto 0)=>XLXN_59(15 downto 0),
                D3(15 downto 0)=>XLXN_60(15 downto 0),
                S0=>REG_DATA_SEL_0,
                S1=>REG_DATA_SEL_1,
                O(15 downto 0)=>XLXN_307(15 downto 0));
   
   Register_File : regs_MUSER_main
      port map (CLK=>CLK,
                DIN(15 downto 0)=>XLXN_307(15 downto 0),
                RAD1(3 downto 0)=>XLXN_296(3 downto 0),
                RAD2(3 downto 0)=>XLXN_303(3 downto 0),
                RAD3(3 downto 0)=>XLXN_344(3 downto 0),
                WAD(3 downto 0)=>XLXN_344(3 downto 0),
                WE=>XLXN_728,
                DO1(15 downto 0)=>RDA(15 downto 0),
                DO2(15 downto 0)=>RDB(15 downto 0),
                DO3(15 downto 0)=>RDC(15 downto 0));
   
   SET_MOV_Data_Selector : mux2x1x16e_MUSER_main
      port map (D0(15 downto 0)=>A(15 downto 0),
                D1(15 downto 0)=>B(15 downto 0),
                E=>XLXN_254,
                S=>SET_MOV_SEL,
                O(15 downto 0)=>XLXN_60(15 downto 0));
   
   Stage_Counter : CB2CE_HXILINX_main
      port map (C=>CLK,
                CE=>RUN,
                CLR=>XLXN_684,
                CEO=>open,
                Q0=>STG(0),
                Q1=>STG(1),
                TC=>open);
   
   Stall_Counter : CB16CLED_HXILINX_main
      port map (C=>CLK,
                CE=>XLXN_696,
                CLR=>XLXN_692,
                D(15 downto 0)=>A(15 downto 0),
                L=>STL_CNT_L,
                UP=>XLXN_691,
                CEO=>open,
                Q(15 downto 0)=>XLXN_687(15 downto 0),
                TC=>XLXN_697);
   
   Stall_Zero_Reference : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_762(15 downto 0));
   
   STL_CNT_ZERO_CMP : COMP16_HXILINX_main
      port map (A(15 downto 0)=>XLXN_687(15 downto 0),
                B(15 downto 0)=>XLXN_762(15 downto 0),
                EQ=>NSTL);
   
   XLXI_34 : VCC
      port map (P=>XLXN_51);
   
   XLXI_35 : VCC
      port map (P=>XLXN_52);
   
   XLXI_69 : BUF
      port map (I=>A(0),
                O=>A_L4(0));
   
   XLXI_70 : BUF
      port map (I=>A(1),
                O=>A_L4(1));
   
   XLXI_71 : BUF
      port map (I=>A(2),
                O=>A_L4(2));
   
   XLXI_72 : BUF
      port map (I=>A(3),
                O=>A_L4(3));
   
   XLXI_95 : VCC
      port map (P=>XLXN_254);
   
   XLXI_113 : GND
      port map (G=>XLXN_282);
   
   XLXI_122 : GND
      port map (G=>XLXN_342);
   
   XLXI_128 : XOR2
      port map (I0=>FLG_INV,
                I1=>XLXN_370,
                O=>FLG);
   
   XLXI_220 : VCC
      port map (P=>XLXN_673);
   
   XLXI_227 : VCC
      port map (P=>XLXN_679);
   
   XLXI_228 : VCC
      port map (P=>XLXN_680);
   
   XLXI_235 : GND
      port map (G=>XLXN_684);
   
   XLXI_240 : GND
      port map (G=>XLXN_691);
   
   XLXI_241 : GND
      port map (G=>XLXN_692);
   
   XLXI_242 : INV
      port map (I=>XLXN_697,
                O=>XLXN_696);
   
   XLXI_249 : VCC
      port map (P=>XLXN_740);
   
   XLXI_250 : GND
      port map (G=>XLXN_742);
   
   XLXI_258 : GND
      port map (G=>XLXN_760);
   
   XLXI_259 : VCC
      port map (P=>XLXN_761);
   
   XLXI_260 : FDCE
      port map (C=>CLK,
                CE=>START,
                CLR=>XLXN_760,
                D=>XLXN_761,
                Q=>STARTED);
   
   XLXI_262 : AND4B2
      port map (I0=>TSTL,
                I1=>HLT,
                I2=>STARTED,
                I3=>NSTL,
                O=>RUN);
   
   XLXI_281 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>ARG_BUF_CE,
                CLR=>XLXN_821,
                D(15 downto 0)=>XLXN_819(15 downto 0),
                Q(15 downto 0)=>A(15 downto 0));
   
   XLXI_282 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>ARG_BUF_CE,
                CLR=>XLXN_821,
                D(15 downto 0)=>XLXN_818(15 downto 0),
                Q(15 downto 0)=>B(15 downto 0));
   
   XLXI_283 : FD16CE_HXILINX_main
      port map (C=>CLK,
                CE=>ARG_BUF_CE,
                CLR=>XLXN_821,
                D(15 downto 0)=>XLXN_817(15 downto 0),
                Q(15 downto 0)=>C(15 downto 0));
   
   XLXI_284 : GND
      port map (G=>XLXN_821);
   
   XLXI_290 : GND
      port map (G=>XLXN_843);
   
   XLXI_292 : FD
      port map (C=>CLK,
                D=>GFX_TX_E,
                Q=>XLXN_848);
   
   XLXI_294 : VCC
      port map (P=>XLXN_853);
   
   XLXI_295 : FDCE
      port map (C=>CLK,
                CE=>NEHLT,
                CLR=>XLXN_854,
                D=>XLXN_853,
                Q=>HLT);
   
   XLXI_296 : GND
      port map (G=>XLXN_854);
   
   XLXI_297 : OR2B1
      port map (I0=>STARTED,
                I1=>FLG_REG_CE,
                O=>XLXN_855);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity spacewire_rx_x1_MUSER_main is
   port ( CLK  : in    std_logic; 
          CLR  : in    std_logic; 
          D    : in    std_logic; 
          S    : in    std_logic; 
          DATA : out   std_logic_vector (7 downto 0));
end spacewire_rx_x1_MUSER_main;

architecture BEHAVIORAL of spacewire_rx_x1_MUSER_main is
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
   
   component SR8CE_HXILINX_main
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
   
   component FD8CE_HXILINX_main
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
   attribute HU_SET of XLXI_104 : label is "XLXI_104_846";
   attribute HU_SET of XLXI_114 : label is "XLXI_114_847";
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
   
   XLXI_104 : SR8CE_HXILINX_main
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
   
   XLXI_114 : FD8CE_HXILINX_main
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity resize8x16x0l_MUSER_main is
   port ( L : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (15 downto 0));
end resize8x16x0l_MUSER_main;

architecture BEHAVIORAL of resize8x16x0l_MUSER_main is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>L(0),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>L(1),
                O=>O(1));
   
   XLXI_3 : BUF
      port map (I=>L(2),
                O=>O(2));
   
   XLXI_4 : BUF
      port map (I=>L(3),
                O=>O(3));
   
   XLXI_5 : BUF
      port map (I=>L(4),
                O=>O(4));
   
   XLXI_6 : BUF
      port map (I=>L(5),
                O=>O(5));
   
   XLXI_7 : BUF
      port map (I=>L(6),
                O=>O(6));
   
   XLXI_8 : BUF
      port map (I=>L(7),
                O=>O(7));
   
   XLXI_20 : GND
      port map (G=>O(8));
   
   XLXI_21 : GND
      port map (G=>O(9));
   
   XLXI_22 : GND
      port map (G=>O(10));
   
   XLXI_23 : GND
      port map (G=>O(11));
   
   XLXI_24 : GND
      port map (G=>O(12));
   
   XLXI_26 : GND
      port map (G=>O(13));
   
   XLXI_27 : GND
      port map (G=>O(14));
   
   XLXI_28 : GND
      port map (G=>O(15));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity resize8x4l_MUSER_main is
   port ( I : in    std_logic_vector (7 downto 0); 
          O : out   std_logic_vector (3 downto 0));
end resize8x4l_MUSER_main;

architecture BEHAVIORAL of resize8x4l_MUSER_main is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>I(0),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>I(1),
                O=>O(1));
   
   XLXI_3 : BUF
      port map (I=>I(2),
                O=>O(2));
   
   XLXI_4 : BUF
      port map (I=>I(3),
                O=>O(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity resize16x8l_MUSER_main is
   port ( I : in    std_logic_vector (15 downto 0); 
          O : out   std_logic_vector (7 downto 0));
end resize16x8l_MUSER_main;

architecture BEHAVIORAL of resize16x8l_MUSER_main is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>I(0),
                O=>O(0));
   
   XLXI_2 : BUF
      port map (I=>I(1),
                O=>O(1));
   
   XLXI_3 : BUF
      port map (I=>I(2),
                O=>O(2));
   
   XLXI_4 : BUF
      port map (I=>I(3),
                O=>O(3));
   
   XLXI_5 : BUF
      port map (I=>I(4),
                O=>O(4));
   
   XLXI_6 : BUF
      port map (I=>I(5),
                O=>O(5));
   
   XLXI_7 : BUF
      port map (I=>I(6),
                O=>O(6));
   
   XLXI_8 : BUF
      port map (I=>I(7),
                O=>O(7));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity pll_wrapper_MUSER_main is
   port ( CLK     : in    std_logic; 
          SYS_CLK : out   std_logic; 
          TX_CLK  : out   std_logic);
end pll_wrapper_MUSER_main;

architecture BEHAVIORAL of pll_wrapper_MUSER_main is
   component sys_tx_clk_pll
      port ( clk_in1  : in    std_logic; 
             clk_out1 : out   std_logic; 
             clk_out2 : out   std_logic);
   end component;
   
begin
   XLXI_1 : sys_tx_clk_pll
      port map (clk_in1=>CLK,
                clk_out1=>SYS_CLK,
                clk_out2=>TX_CLK);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity main is
   port ( BTN1        : in    std_logic; 
          BTN2        : in    std_logic; 
          BTN3        : in    std_logic; 
          DIP         : in    std_logic_vector (7 downto 0); 
          K1_1        : in    std_logic; 
          K1_3        : in    std_logic; 
          K2          : in    std_logic_vector (7 downto 0); 
          K3          : in    std_logic_vector (7 downto 0); 
          K4          : in    std_logic_vector (7 downto 0); 
          OSC         : in    std_logic; 
          SW          : in    std_logic_vector (7 downto 0); 
          K5_1        : out   std_logic; 
          K5_3        : out   std_logic; 
          K5_5        : out   std_logic; 
          K5_7        : out   std_logic; 
          K5_9        : out   std_logic; 
          K5_11       : out   std_logic; 
          K5_13       : out   std_logic; 
          K5_15       : out   std_logic; 
          LED         : out   std_logic_vector (7 downto 0); 
          MN          : out   std_logic_vector (7 downto 0); 
          SSD_COM     : out   std_logic_vector (3 downto 0); 
          SSD_Segment : out   std_logic_vector (7 downto 0));
end main;

architecture BEHAVIORAL of main is
   attribute IOSTANDARD : string ;
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal SYS_CLK     : std_logic;
   signal XLXN_2      : std_logic;
   signal XLXN_83     : std_logic_vector (15 downto 0);
   signal XLXN_84     : std_logic_vector (15 downto 0);
   signal XLXN_85     : std_logic_vector (15 downto 0);
   signal XLXN_86     : std_logic_vector (15 downto 0);
   signal XLXN_91     : std_logic_vector (7 downto 0);
   signal XLXN_98     : std_logic_vector (15 downto 0);
   signal XLXN_99     : std_logic_vector (15 downto 0);
   signal XLXN_101    : std_logic_vector (15 downto 0);
   signal XLXN_103    : std_logic_vector (15 downto 0);
   signal XLXN_104    : std_logic_vector (15 downto 0);
   signal XLXN_105    : std_logic_vector (15 downto 0);
   signal XLXN_106    : std_logic_vector (15 downto 0);
   signal XLXN_107    : std_logic_vector (15 downto 0);
   signal XLXN_108    : std_logic_vector (15 downto 0);
   signal XLXN_109    : std_logic_vector (15 downto 0);
   signal XLXN_110    : std_logic_vector (15 downto 0);
   signal XLXN_111    : std_logic_vector (15 downto 0);
   signal XLXN_112    : std_logic_vector (15 downto 0);
   signal XLXN_113    : std_logic_vector (15 downto 0);
   signal XLXN_114    : std_logic_vector (15 downto 0);
   signal XLXN_115    : std_logic_vector (15 downto 0);
   signal XLXN_116    : std_logic_vector (7 downto 0);
   signal XLXN_225    : std_logic;
   signal XLXN_226    : std_logic;
   signal XLXN_227    : std_logic;
   signal XLXN_228    : std_logic;
   signal XLXN_233    : std_logic;
   signal XLXN_234    : std_logic;
   component pll_wrapper_MUSER_main
      port ( CLK     : in    std_logic; 
             SYS_CLK : out   std_logic; 
             TX_CLK  : out   std_logic);
   end component;
   
   component resize8x16x0l_MUSER_main
      port ( L : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (15 downto 0));
   end component;
   
   component gnd16_MUSER_main
      port ( GNDO : out   std_logic_vector (15 downto 0));
   end component;
   
   component OBUFDS
      port ( I  : in    std_logic; 
             O  : out   std_logic; 
             OB : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUFDS : component is "DEFAULT";
   attribute BOX_TYPE of OBUFDS : component is "BLACK_BOX";
   
   component resize16x8l_MUSER_main
      port ( I : in    std_logic_vector (15 downto 0); 
             O : out   std_logic_vector (7 downto 0));
   end component;
   
   component resize8x4l_MUSER_main
      port ( I : in    std_logic_vector (7 downto 0); 
             O : out   std_logic_vector (3 downto 0));
   end component;
   
   component spacewire_rx_x1_MUSER_main
      port ( CLK  : in    std_logic; 
             CLR  : in    std_logic; 
             D    : in    std_logic; 
             DATA : out   std_logic_vector (7 downto 0); 
             S    : in    std_logic);
   end component;
   
   component cpu_MUSER_main
      port ( CLK    : in    std_logic; 
             GFX_D1 : out   std_logic; 
             GFX_D2 : out   std_logic; 
             GFX_S1 : out   std_logic; 
             GFX_S2 : out   std_logic; 
             I0     : in    std_logic_vector (15 downto 0); 
             I1     : in    std_logic_vector (15 downto 0); 
             I10    : in    std_logic_vector (15 downto 0); 
             I11    : in    std_logic_vector (15 downto 0); 
             I12    : in    std_logic_vector (15 downto 0); 
             I13    : in    std_logic_vector (15 downto 0); 
             I14    : in    std_logic_vector (15 downto 0); 
             I15    : in    std_logic_vector (15 downto 0); 
             I2     : in    std_logic_vector (15 downto 0); 
             I3     : in    std_logic_vector (15 downto 0); 
             I4     : in    std_logic_vector (15 downto 0); 
             I5     : in    std_logic_vector (15 downto 0); 
             I6     : in    std_logic_vector (15 downto 0); 
             I7     : in    std_logic_vector (15 downto 0); 
             I8     : in    std_logic_vector (15 downto 0); 
             I9     : in    std_logic_vector (15 downto 0); 
             O0     : out   std_logic_vector (15 downto 0); 
             O1     : out   std_logic_vector (15 downto 0); 
             O10    : out   std_logic_vector (15 downto 0); 
             O11    : out   std_logic_vector (15 downto 0); 
             O12    : out   std_logic_vector (15 downto 0); 
             O13    : out   std_logic_vector (15 downto 0); 
             O14    : out   std_logic_vector (15 downto 0); 
             O15    : out   std_logic_vector (15 downto 0); 
             O2     : out   std_logic_vector (15 downto 0); 
             O3     : out   std_logic_vector (15 downto 0); 
             O4     : out   std_logic_vector (15 downto 0); 
             O5     : out   std_logic_vector (15 downto 0); 
             O6     : out   std_logic_vector (15 downto 0); 
             O7     : out   std_logic_vector (15 downto 0); 
             O8     : out   std_logic_vector (15 downto 0); 
             O9     : out   std_logic_vector (15 downto 0); 
             START  : in    std_logic; 
             TSTL   : in    std_logic; 
             TXCLK  : in    std_logic);
   end component;
   
   component CB16CE_HXILINX_main
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_110 : label is "XLXI_110_848";
begin
   XLXI_2 : pll_wrapper_MUSER_main
      port map (CLK=>OSC,
                SYS_CLK=>SYS_CLK,
                TX_CLK=>XLXN_2);
   
   XLXI_15 : resize8x16x0l_MUSER_main
      port map (L(7 downto 0)=>SW(7 downto 0),
                O(15 downto 0)=>XLXN_98(15 downto 0));
   
   XLXI_16 : resize8x16x0l_MUSER_main
      port map (L(7 downto 0)=>DIP(7 downto 0),
                O(15 downto 0)=>XLXN_99(15 downto 0));
   
   XLXI_18 : resize8x16x0l_MUSER_main
      port map (L(7 downto 0)=>K2(7 downto 0),
                O(15 downto 0)=>XLXN_101(15 downto 0));
   
   XLXI_19 : resize8x16x0l_MUSER_main
      port map (L(7 downto 0)=>K3(7 downto 0),
                O(15 downto 0)=>XLXN_103(15 downto 0));
   
   XLXI_20 : resize8x16x0l_MUSER_main
      port map (L(7 downto 0)=>K4(7 downto 0),
                O(15 downto 0)=>XLXN_104(15 downto 0));
   
   XLXI_22 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_105(15 downto 0));
   
   XLXI_23 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_106(15 downto 0));
   
   XLXI_24 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_107(15 downto 0));
   
   XLXI_25 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_108(15 downto 0));
   
   XLXI_26 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_109(15 downto 0));
   
   XLXI_27 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_110(15 downto 0));
   
   XLXI_29 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_111(15 downto 0));
   
   XLXI_30 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_112(15 downto 0));
   
   XLXI_31 : gnd16_MUSER_main
      port map (GNDO(15 downto 0)=>XLXN_113(15 downto 0));
   
   XLXI_32 : OBUFDS
      port map (I=>XLXN_228,
                O=>K5_1,
                OB=>K5_3);
   
   XLXI_33 : OBUFDS
      port map (I=>XLXN_227,
                O=>K5_5,
                OB=>K5_7);
   
   XLXI_34 : OBUFDS
      port map (I=>XLXN_226,
                O=>K5_9,
                OB=>K5_11);
   
   XLXI_35 : OBUFDS
      port map (I=>XLXN_225,
                O=>K5_13,
                OB=>K5_15);
   
   XLXI_38 : resize16x8l_MUSER_main
      port map (I(15 downto 0)=>XLXN_83(15 downto 0),
                O(7 downto 0)=>LED(7 downto 0));
   
   XLXI_39 : resize16x8l_MUSER_main
      port map (I(15 downto 0)=>XLXN_84(15 downto 0),
                O(7 downto 0)=>MN(7 downto 0));
   
   XLXI_42 : resize16x8l_MUSER_main
      port map (I(15 downto 0)=>XLXN_85(15 downto 0),
                O(7 downto 0)=>SSD_Segment(7 downto 0));
   
   XLXI_44 : resize16x8l_MUSER_main
      port map (I(15 downto 0)=>XLXN_86(15 downto 0),
                O(7 downto 0)=>XLXN_91(7 downto 0));
   
   XLXI_45 : resize8x4l_MUSER_main
      port map (I(7 downto 0)=>XLXN_91(7 downto 0),
                O(3 downto 0)=>SSD_COM(3 downto 0));
   
   XLXI_88 : spacewire_rx_x1_MUSER_main
      port map (CLK=>SYS_CLK,
                CLR=>BTN1,
                D=>K1_1,
                S=>K1_3,
                DATA(7 downto 0)=>XLXN_116(7 downto 0));
   
   XLXI_89 : resize8x16x0l_MUSER_main
      port map (L(7 downto 0)=>XLXN_116(7 downto 0),
                O(15 downto 0)=>XLXN_115(15 downto 0));
   
   XLXI_108 : cpu_MUSER_main
      port map (CLK=>SYS_CLK,
                I0(15 downto 0)=>XLXN_98(15 downto 0),
                I1(15 downto 0)=>XLXN_99(15 downto 0),
                I2(15 downto 0)=>XLXN_115(15 downto 0),
                I3(15 downto 0)=>XLXN_101(15 downto 0),
                I4(15 downto 0)=>XLXN_103(15 downto 0),
                I5(15 downto 0)=>XLXN_104(15 downto 0),
                I6(15 downto 0)=>XLXN_105(15 downto 0),
                I7(15 downto 0)=>XLXN_106(15 downto 0),
                I8(15 downto 0)=>XLXN_107(15 downto 0),
                I9(15 downto 0)=>XLXN_108(15 downto 0),
                I10(15 downto 0)=>XLXN_109(15 downto 0),
                I11(15 downto 0)=>XLXN_110(15 downto 0),
                I12(15 downto 0)=>XLXN_111(15 downto 0),
                I13(15 downto 0)=>XLXN_112(15 downto 0),
                I14(15 downto 0)=>XLXN_113(15 downto 0),
                I15(15 downto 0)=>XLXN_114(15 downto 0),
                START=>BTN2,
                TSTL=>BTN3,
                TXCLK=>XLXN_2,
                GFX_D1=>XLXN_228,
                GFX_D2=>XLXN_226,
                GFX_S1=>XLXN_227,
                GFX_S2=>XLXN_225,
                O0(15 downto 0)=>XLXN_83(15 downto 0),
                O1(15 downto 0)=>XLXN_84(15 downto 0),
                O2(15 downto 0)=>XLXN_85(15 downto 0),
                O3(15 downto 0)=>XLXN_86(15 downto 0),
                O4=>open,
                O5=>open,
                O6=>open,
                O7=>open,
                O8=>open,
                O9=>open,
                O10=>open,
                O11=>open,
                O12=>open,
                O13=>open,
                O14=>open,
                O15=>open);
   
   XLXI_110 : CB16CE_HXILINX_main
      port map (C=>SYS_CLK,
                CE=>XLXN_234,
                CLR=>XLXN_233,
                CEO=>open,
                Q(15 downto 0)=>XLXN_114(15 downto 0),
                TC=>open);
   
   XLXI_112 : GND
      port map (G=>XLXN_233);
   
   XLXI_113 : VCC
      port map (P=>XLXN_234);
   
end BEHAVIORAL;


