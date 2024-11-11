--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ram_wrapper.vhf
-- /___/   /\     Timestamp : 11/11/2024 21:12:38
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/ram_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-16/ram_wrapper.sch
--Design Name: ram_wrapper
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ram_wrapper is
   port ( ADDR : in    std_logic_vector (15 downto 0); 
          CLK  : in    std_logic; 
          DIN  : in    std_logic_vector (15 downto 0); 
          WE   : in    std_logic; 
          DO   : out   std_logic_vector (15 downto 0));
end ram_wrapper;

architecture BEHAVIORAL of ram_wrapper is
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


