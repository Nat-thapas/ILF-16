--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : cu.vhf
-- /___/   /\     Timestamp : 11/11/2024 13:46:08
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/Personal/Projects/ILF-16/ILF-16/ipcore_dir -intstyle ise -family spartan6 -flat -suppress -vhdl D:/Personal/Projects/ILF-16/ILF-16/cu.vhf -w D:/Personal/Projects/ILF-16/ILF-16/cu.sch
--Design Name: cu
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

entity cu is
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
end cu;

architecture BEHAVIORAL of cu is
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


