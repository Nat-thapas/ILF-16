--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : sdp_vram_wrapper.vhf
-- /___/   /\     Timestamp : 11/11/2024 15:47:02
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-GFX/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-GFX/sdp_vram_wrapper.vhf -w D:/Personal/Projects/ILF-16/ILF-GFX/sdp_vram_wrapper.sch
--Design Name: sdp_vram_wrapper
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

entity sdp_vram_wrapper is
   port ( DIN  : in    std_logic_vector (3 downto 0); 
          RAD  : in    std_logic_vector (15 downto 0); 
          RCLK : in    std_logic; 
          WAD  : in    std_logic_vector (15 downto 0); 
          WCLK : in    std_logic; 
          WE   : in    std_logic; 
          DO   : out   std_logic_vector (3 downto 0));
end sdp_vram_wrapper;

architecture BEHAVIORAL of sdp_vram_wrapper is
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


