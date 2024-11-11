--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : rx_buffer_wrapper.vhf
-- /___/   /\     Timestamp : 11/10/2024 15:16:24
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/rx_buffer_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/rx_buffer_wrapper.sch
--Design Name: rx_buffer_wrapper
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

entity rx_buffer_wrapper is
   port ( CLK  : in    std_logic; 
          DIN  : in    std_logic_vector (31 downto 0); 
          RE   : in    std_logic; 
          RST  : in    std_logic; 
          WE   : in    std_logic; 
          DO   : out   std_logic_vector (31 downto 0); 
          EMP  : out   std_logic; 
          FULL : out   std_logic);
end rx_buffer_wrapper;

architecture BEHAVIORAL of rx_buffer_wrapper is
   component rx_buffer_fifo
      port ( clk   : in    std_logic; 
             rst   : in    std_logic; 
             din   : in    std_logic_vector (31 downto 0); 
             wr_en : in    std_logic; 
             full  : out   std_logic; 
             dout  : out   std_logic_vector (31 downto 0); 
             rd_en : in    std_logic; 
             empty : out   std_logic);
   end component;
   
begin
   XLXI_1 : rx_buffer_fifo
      port map (clk=>CLK,
                din(31 downto 0)=>DIN(31 downto 0),
                rd_en=>RE,
                rst=>RST,
                wr_en=>WE,
                dout(31 downto 0)=>DO(31 downto 0),
                empty=>EMP,
                full=>FULL);
   
end BEHAVIORAL;


