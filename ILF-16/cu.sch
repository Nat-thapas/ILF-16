<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ID(7:0)" />
        <signal name="ID(7)" />
        <signal name="ID(6)" />
        <signal name="ID(5)" />
        <signal name="ID(4)" />
        <signal name="ID(3)" />
        <signal name="ID(2)" />
        <signal name="SET_MOV_SEL" />
        <signal name="PC_CE" />
        <signal name="FLG_INV" />
        <signal name="STG(1)" />
        <signal name="RUN" />
        <signal name="FLG" />
        <signal name="STG(1:0)" />
        <signal name="XLXN_81" />
        <signal name="REG_WE" />
        <signal name="CFIMM" />
        <signal name="XLXN_394" />
        <signal name="PC_L" />
        <signal name="XLXN_406" />
        <signal name="FLG_REG_CE" />
        <signal name="REG_DATA_SEL_0" />
        <signal name="REG_DATA_SEL_1" />
        <signal name="XLXN_184" />
        <signal name="RAM_WE" />
        <signal name="STG(0)" />
        <signal name="XLXN_454" />
        <signal name="STL_CNT_L" />
        <signal name="ALU_OP(0)" />
        <signal name="ALU_OP(1)" />
        <signal name="ALU_OP(2)" />
        <signal name="ALU_OP(3)" />
        <signal name="ID(1)" />
        <signal name="ID(0)" />
        <signal name="ALU_OP(3:0)" />
        <signal name="FLG_IDX(0)" />
        <signal name="FLG_IDX(3:0)" />
        <signal name="FLG_IDX(1)" />
        <signal name="FLG_IDX(2)" />
        <signal name="FLG_IDX(3)" />
        <signal name="XLXN_456" />
        <signal name="XLXN_457" />
        <signal name="OUT_REG_WE" />
        <port polarity="Input" name="ID(7:0)" />
        <port polarity="Output" name="SET_MOV_SEL" />
        <port polarity="Output" name="PC_CE" />
        <port polarity="Output" name="FLG_INV" />
        <port polarity="Input" name="RUN" />
        <port polarity="Input" name="FLG" />
        <port polarity="Input" name="STG(1:0)" />
        <port polarity="Output" name="REG_WE" />
        <port polarity="Output" name="CFIMM" />
        <port polarity="Output" name="PC_L" />
        <port polarity="Output" name="FLG_REG_CE" />
        <port polarity="Output" name="REG_DATA_SEL_0" />
        <port polarity="Output" name="REG_DATA_SEL_1" />
        <port polarity="Output" name="RAM_WE" />
        <port polarity="Output" name="STL_CNT_L" />
        <port polarity="Output" name="ALU_OP(3:0)" />
        <port polarity="Output" name="FLG_IDX(3:0)" />
        <port polarity="Output" name="OUT_REG_WE" />
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="lut6">
            <timestamp>2005-6-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-144" y2="-144" x1="0" />
            <line x2="64" y1="-208" y2="-208" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="64" y1="-304" y2="-304" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="and3b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="and5">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <arc ex="144" ey="-240" sx="144" sy="-144" r="48" cx="144" cy="-192" />
            <line x2="64" y1="-144" y2="-144" x1="144" />
            <line x2="144" y1="-240" y2="-240" x1="64" />
            <line x2="64" y1="-64" y2="-320" x1="64" />
            <line x2="192" y1="-192" y2="-192" x1="256" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="and4b3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="40" y1="-192" y2="-192" x1="0" />
            <circle r="12" cx="52" cy="-192" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
        </blockdef>
        <block symbolname="buf" name="XLXI_69">
            <blockpin signalname="FLG" name="I" />
            <blockpin signalname="SET_MOV_SEL" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_75">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="PC_CE" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_27">
            <blockpin signalname="ID(4)" name="I" />
            <blockpin signalname="FLG_INV" name="O" />
        </block>
        <block symbolname="lut6" name="REG_FILE_WE_LUT">
            <blockpin signalname="XLXN_81" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="and4" name="XLXI_82">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="XLXN_81" name="I3" />
            <blockpin signalname="REG_WE" name="O" />
        </block>
        <block symbolname="lut6" name="C_IMM_REG_LUT">
            <blockpin signalname="CFIMM" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="and4b3" name="XLXI_133">
            <blockpin signalname="ID(7)" name="I0" />
            <blockpin signalname="ID(6)" name="I1" />
            <blockpin signalname="ID(5)" name="I2" />
            <blockpin signalname="ID(4)" name="I3" />
            <blockpin signalname="XLXN_394" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_135">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="XLXN_394" name="I3" />
            <blockpin signalname="FLG_REG_CE" name="O" />
        </block>
        <block symbolname="and5" name="XLXI_119">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="FLG" name="I3" />
            <blockpin signalname="XLXN_406" name="I4" />
            <blockpin signalname="PC_L" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_76">
            <blockpin signalname="ID(7)" name="I0" />
            <blockpin signalname="ID(6)" name="I1" />
            <blockpin signalname="ID(5)" name="I2" />
            <blockpin signalname="XLXN_406" name="O" />
        </block>
        <block symbolname="lut6" name="REG_DATA_SEL_LUT_0">
            <blockpin signalname="REG_DATA_SEL_0" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="lut6" name="REG_DATA_SEL_LUT_1">
            <blockpin signalname="REG_DATA_SEL_1" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="lut6" name="STR_INST_LUT">
            <attr value="0002000000000000" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_184" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="and4" name="XLXI_146">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="XLXN_184" name="I3" />
            <blockpin signalname="RAM_WE" name="O" />
        </block>
        <block symbolname="lut6" name="STL_INST_LUT">
            <attr value="0000000000000002" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_454" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="and4" name="XLXI_148">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="XLXN_454" name="I3" />
            <blockpin signalname="STL_CNT_L" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_152">
            <blockpin signalname="ID(3)" name="I" />
            <blockpin signalname="ALU_OP(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_151">
            <blockpin signalname="ID(2)" name="I" />
            <blockpin signalname="ALU_OP(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_150">
            <blockpin signalname="ID(1)" name="I" />
            <blockpin signalname="ALU_OP(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_149">
            <blockpin signalname="ID(0)" name="I" />
            <blockpin signalname="ALU_OP(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_157">
            <blockpin signalname="ID(3)" name="I" />
            <blockpin signalname="FLG_IDX(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_158">
            <blockpin signalname="ID(2)" name="I" />
            <blockpin signalname="FLG_IDX(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_159">
            <blockpin signalname="ID(1)" name="I" />
            <blockpin signalname="FLG_IDX(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_160">
            <blockpin signalname="ID(0)" name="I" />
            <blockpin signalname="FLG_IDX(0)" name="O" />
        </block>
        <block symbolname="lut6" name="OUT_INST_LUT">
            <attr value="0008000000000000" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_456" name="O" />
            <blockpin signalname="ID(2)" name="I0" />
            <blockpin signalname="ID(3)" name="I1" />
            <blockpin signalname="ID(4)" name="I2" />
            <blockpin signalname="ID(5)" name="I3" />
            <blockpin signalname="ID(7)" name="I5" />
            <blockpin signalname="ID(6)" name="I4" />
        </block>
        <block symbolname="and4" name="XLXI_161">
            <blockpin signalname="STG(1)" name="I0" />
            <blockpin signalname="STG(0)" name="I1" />
            <blockpin signalname="RUN" name="I2" />
            <blockpin signalname="XLXN_456" name="I3" />
            <blockpin signalname="OUT_REG_WE" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="14080">
        <branch name="ID(7:0)">
            <wire x2="480" y1="160" y2="160" x1="288" />
            <wire x2="480" y1="160" y2="720" x1="480" />
            <wire x2="480" y1="720" y2="784" x1="480" />
            <wire x2="480" y1="784" y2="848" x1="480" />
            <wire x2="480" y1="848" y2="1200" x1="480" />
            <wire x2="480" y1="1200" y2="1472" x1="480" />
            <wire x2="480" y1="1472" y2="1520" x1="480" />
            <wire x2="480" y1="1520" y2="1568" x1="480" />
            <wire x2="480" y1="1568" y2="1616" x1="480" />
            <wire x2="480" y1="1616" y2="1680" x1="480" />
            <wire x2="480" y1="1680" y2="1728" x1="480" />
            <wire x2="480" y1="1728" y2="2112" x1="480" />
            <wire x2="480" y1="2112" y2="2160" x1="480" />
            <wire x2="480" y1="2160" y2="2208" x1="480" />
            <wire x2="480" y1="2208" y2="2256" x1="480" />
            <wire x2="480" y1="2256" y2="2320" x1="480" />
            <wire x2="480" y1="2320" y2="2368" x1="480" />
            <wire x2="480" y1="2368" y2="2560" x1="480" />
            <wire x2="480" y1="2560" y2="2624" x1="480" />
            <wire x2="480" y1="2624" y2="2688" x1="480" />
            <wire x2="480" y1="2688" y2="2752" x1="480" />
            <wire x2="480" y1="2752" y2="3392" x1="480" />
            <wire x2="480" y1="3392" y2="3440" x1="480" />
            <wire x2="480" y1="3440" y2="3488" x1="480" />
            <wire x2="480" y1="3488" y2="3536" x1="480" />
            <wire x2="480" y1="3536" y2="3600" x1="480" />
            <wire x2="480" y1="3600" y2="3648" x1="480" />
            <wire x2="480" y1="3648" y2="3952" x1="480" />
            <wire x2="480" y1="3952" y2="4000" x1="480" />
            <wire x2="480" y1="4000" y2="4048" x1="480" />
            <wire x2="480" y1="4048" y2="4096" x1="480" />
            <wire x2="480" y1="4096" y2="4160" x1="480" />
            <wire x2="480" y1="4160" y2="4208" x1="480" />
            <wire x2="480" y1="4208" y2="4512" x1="480" />
            <wire x2="480" y1="4512" y2="4560" x1="480" />
            <wire x2="480" y1="4560" y2="4608" x1="480" />
            <wire x2="480" y1="4608" y2="4656" x1="480" />
            <wire x2="480" y1="4656" y2="4720" x1="480" />
            <wire x2="480" y1="4720" y2="4768" x1="480" />
            <wire x2="480" y1="4768" y2="5152" x1="480" />
            <wire x2="480" y1="5152" y2="5200" x1="480" />
            <wire x2="480" y1="5200" y2="5248" x1="480" />
            <wire x2="480" y1="5248" y2="5296" x1="480" />
            <wire x2="480" y1="5296" y2="5360" x1="480" />
            <wire x2="480" y1="5360" y2="5408" x1="480" />
            <wire x2="480" y1="5408" y2="5680" x1="480" />
            <wire x2="480" y1="5680" y2="5760" x1="480" />
            <wire x2="480" y1="5760" y2="5840" x1="480" />
            <wire x2="480" y1="5840" y2="5920" x1="480" />
            <wire x2="480" y1="5920" y2="6080" x1="480" />
            <wire x2="480" y1="6080" y2="6160" x1="480" />
            <wire x2="480" y1="6160" y2="6240" x1="480" />
            <wire x2="480" y1="6240" y2="6320" x1="480" />
            <wire x2="480" y1="6320" y2="6592" x1="480" />
            <wire x2="480" y1="6592" y2="6640" x1="480" />
            <wire x2="480" y1="6640" y2="6688" x1="480" />
            <wire x2="480" y1="6688" y2="6736" x1="480" />
            <wire x2="480" y1="6736" y2="6800" x1="480" />
            <wire x2="480" y1="6800" y2="6848" x1="480" />
            <wire x2="480" y1="6848" y2="13920" x1="480" />
        </branch>
        <branch name="SET_MOV_SEL">
            <wire x2="1680" y1="3040" y2="3040" x1="944" />
        </branch>
        <instance x="720" y="672" name="XLXI_75" orien="R0" />
        <branch name="PC_CE">
            <wire x2="1680" y1="544" y2="544" x1="976" />
        </branch>
        <instance x="720" y="1232" name="XLXI_27" orien="R0" />
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1200" type="branch" />
            <wire x2="640" y1="1200" y2="1200" x1="576" />
            <wire x2="720" y1="1200" y2="1200" x1="640" />
        </branch>
        <branch name="FLG_INV">
            <wire x2="1680" y1="1200" y2="1200" x1="944" />
        </branch>
        <bustap x2="576" y1="1200" y2="1200" x1="480" />
        <iomarker fontsize="28" x="1680" y="544" name="PC_CE" orien="R0" />
        <iomarker fontsize="28" x="1680" y="1200" name="FLG_INV" orien="R0" />
        <iomarker fontsize="28" x="288" y="160" name="ID(7:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="240" name="STG(1:0)" orien="R180" />
        <branch name="STG(1:0)">
            <wire x2="400" y1="240" y2="240" x1="320" />
            <wire x2="432" y1="240" y2="240" x1="400" />
        </branch>
        <bustap x2="400" y1="240" y2="336" x1="400" />
        <bustap x2="432" y1="240" y2="336" x1="432" />
        <iomarker fontsize="28" x="256" y="320" name="RUN" orien="R180" />
        <iomarker fontsize="28" x="256" y="400" name="FLG" orien="R180" />
        <instance x="736" y="1824" name="REG_FILE_WE_LUT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="64" y="-480" type="instance" />
        </instance>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1472" type="branch" />
            <wire x2="640" y1="1472" y2="1472" x1="576" />
            <wire x2="736" y1="1472" y2="1472" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1520" type="branch" />
            <wire x2="640" y1="1520" y2="1520" x1="576" />
            <wire x2="736" y1="1520" y2="1520" x1="640" />
        </branch>
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1568" type="branch" />
            <wire x2="640" y1="1568" y2="1568" x1="576" />
            <wire x2="736" y1="1568" y2="1568" x1="640" />
        </branch>
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1616" type="branch" />
            <wire x2="640" y1="1616" y2="1616" x1="576" />
            <wire x2="736" y1="1616" y2="1616" x1="640" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1680" type="branch" />
            <wire x2="640" y1="1680" y2="1680" x1="576" />
            <wire x2="736" y1="1680" y2="1680" x1="640" />
        </branch>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="1728" type="branch" />
            <wire x2="640" y1="1728" y2="1728" x1="576" />
            <wire x2="736" y1="1728" y2="1728" x1="640" />
        </branch>
        <branch name="XLXN_81">
            <wire x2="1280" y1="1632" y2="1632" x1="1120" />
        </branch>
        <instance x="1280" y="1888" name="XLXI_82" orien="R0" />
        <branch name="REG_WE">
            <wire x2="1680" y1="1728" y2="1728" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1680" y="1728" name="REG_WE" orien="R0" />
        <bustap x2="576" y1="1472" y2="1472" x1="480" />
        <bustap x2="576" y1="1520" y2="1520" x1="480" />
        <bustap x2="576" y1="1568" y2="1568" x1="480" />
        <bustap x2="576" y1="1616" y2="1616" x1="480" />
        <bustap x2="576" y1="1680" y2="1680" x1="480" />
        <bustap x2="576" y1="1728" y2="1728" x1="480" />
        <instance x="736" y="2464" name="C_IMM_REG_LUT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="80" y="-480" type="instance" />
        </instance>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2368" type="branch" />
            <wire x2="640" y1="2368" y2="2368" x1="576" />
            <wire x2="736" y1="2368" y2="2368" x1="640" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2320" type="branch" />
            <wire x2="640" y1="2320" y2="2320" x1="576" />
            <wire x2="736" y1="2320" y2="2320" x1="640" />
        </branch>
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2256" type="branch" />
            <wire x2="640" y1="2256" y2="2256" x1="576" />
            <wire x2="736" y1="2256" y2="2256" x1="640" />
        </branch>
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2208" type="branch" />
            <wire x2="640" y1="2208" y2="2208" x1="576" />
            <wire x2="736" y1="2208" y2="2208" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2160" type="branch" />
            <wire x2="640" y1="2160" y2="2160" x1="576" />
            <wire x2="736" y1="2160" y2="2160" x1="640" />
        </branch>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2112" type="branch" />
            <wire x2="640" y1="2112" y2="2112" x1="576" />
            <wire x2="736" y1="2112" y2="2112" x1="640" />
        </branch>
        <bustap x2="576" y1="2112" y2="2112" x1="480" />
        <bustap x2="576" y1="2160" y2="2160" x1="480" />
        <bustap x2="576" y1="2208" y2="2208" x1="480" />
        <bustap x2="576" y1="2256" y2="2256" x1="480" />
        <bustap x2="576" y1="2320" y2="2320" x1="480" />
        <bustap x2="576" y1="2368" y2="2368" x1="480" />
        <branch name="CFIMM">
            <wire x2="1680" y1="2272" y2="2272" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1680" y="2272" name="CFIMM" orien="R0" />
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2560" type="branch" />
            <wire x2="640" y1="2560" y2="2560" x1="576" />
            <wire x2="720" y1="2560" y2="2560" x1="640" />
        </branch>
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2624" type="branch" />
            <wire x2="640" y1="2624" y2="2624" x1="576" />
            <wire x2="720" y1="2624" y2="2624" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2688" type="branch" />
            <wire x2="640" y1="2688" y2="2688" x1="576" />
            <wire x2="720" y1="2688" y2="2688" x1="640" />
        </branch>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="2752" type="branch" />
            <wire x2="640" y1="2752" y2="2752" x1="576" />
            <wire x2="720" y1="2752" y2="2752" x1="640" />
        </branch>
        <instance x="720" y="2816" name="XLXI_133" orien="R0" />
        <instance x="1120" y="2912" name="XLXI_135" orien="R0" />
        <branch name="XLXN_394">
            <wire x2="1120" y1="2656" y2="2656" x1="976" />
        </branch>
        <branch name="FLG">
            <wire x2="336" y1="400" y2="400" x1="256" />
            <wire x2="336" y1="400" y2="912" x1="336" />
            <wire x2="1040" y1="912" y2="912" x1="336" />
            <wire x2="336" y1="912" y2="3040" x1="336" />
            <wire x2="720" y1="3040" y2="3040" x1="336" />
            <wire x2="1040" y1="848" y2="912" x1="1040" />
            <wire x2="1120" y1="848" y2="848" x1="1040" />
        </branch>
        <branch name="RUN">
            <wire x2="368" y1="320" y2="320" x1="256" />
            <wire x2="368" y1="320" y2="480" x1="368" />
            <wire x2="720" y1="480" y2="480" x1="368" />
            <wire x2="368" y1="480" y2="944" x1="368" />
            <wire x2="368" y1="944" y2="1792" x1="368" />
            <wire x2="1120" y1="1792" y2="1792" x1="368" />
            <wire x2="368" y1="1792" y2="2832" x1="368" />
            <wire x2="1040" y1="2832" y2="2832" x1="368" />
            <wire x2="368" y1="2832" y2="4832" x1="368" />
            <wire x2="1200" y1="4832" y2="4832" x1="368" />
            <wire x2="368" y1="4832" y2="5472" x1="368" />
            <wire x2="1200" y1="5472" y2="5472" x1="368" />
            <wire x2="368" y1="5472" y2="6912" x1="368" />
            <wire x2="1200" y1="6912" y2="6912" x1="368" />
            <wire x2="368" y1="6912" y2="13920" x1="368" />
            <wire x2="1072" y1="944" y2="944" x1="368" />
            <wire x2="1040" y1="2720" y2="2832" x1="1040" />
            <wire x2="1120" y1="2720" y2="2720" x1="1040" />
            <wire x2="1120" y1="912" y2="912" x1="1072" />
            <wire x2="1072" y1="912" y2="944" x1="1072" />
            <wire x2="1280" y1="1696" y2="1696" x1="1120" />
            <wire x2="1120" y1="1696" y2="1792" x1="1120" />
            <wire x2="1280" y1="4736" y2="4736" x1="1200" />
            <wire x2="1200" y1="4736" y2="4832" x1="1200" />
            <wire x2="1280" y1="5376" y2="5376" x1="1200" />
            <wire x2="1200" y1="5376" y2="5472" x1="1200" />
            <wire x2="1280" y1="6816" y2="6816" x1="1200" />
            <wire x2="1200" y1="6816" y2="6912" x1="1200" />
        </branch>
        <branch name="PC_L">
            <wire x2="1680" y1="912" y2="912" x1="1376" />
        </branch>
        <instance x="1120" y="1104" name="XLXI_119" orien="R0" />
        <iomarker fontsize="28" x="1680" y="912" name="PC_L" orien="R0" />
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="720" type="branch" />
            <wire x2="640" y1="720" y2="720" x1="576" />
            <wire x2="720" y1="720" y2="720" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="784" type="branch" />
            <wire x2="640" y1="784" y2="784" x1="576" />
            <wire x2="720" y1="784" y2="784" x1="640" />
        </branch>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="848" type="branch" />
            <wire x2="640" y1="848" y2="848" x1="576" />
            <wire x2="720" y1="848" y2="848" x1="640" />
        </branch>
        <instance x="720" y="912" name="XLXI_76" orien="R0" />
        <bustap x2="576" y1="720" y2="720" x1="480" />
        <bustap x2="576" y1="784" y2="784" x1="480" />
        <bustap x2="576" y1="848" y2="848" x1="480" />
        <branch name="XLXN_406">
            <wire x2="1120" y1="784" y2="784" x1="976" />
        </branch>
        <bustap x2="576" y1="2560" y2="2560" x1="480" />
        <bustap x2="576" y1="2624" y2="2624" x1="480" />
        <bustap x2="576" y1="2688" y2="2688" x1="480" />
        <bustap x2="576" y1="2752" y2="2752" x1="480" />
        <branch name="FLG_REG_CE">
            <wire x2="1680" y1="2752" y2="2752" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1680" y="2752" name="FLG_REG_CE" orien="R0" />
        <instance x="720" y="3072" name="XLXI_69" orien="R0" />
        <iomarker fontsize="28" x="1680" y="3040" name="SET_MOV_SEL" orien="R0" />
        <instance x="736" y="3744" name="REG_DATA_SEL_LUT_0" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="-480" type="instance" />
        </instance>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3392" type="branch" />
            <wire x2="640" y1="3392" y2="3392" x1="576" />
            <wire x2="736" y1="3392" y2="3392" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3440" type="branch" />
            <wire x2="640" y1="3440" y2="3440" x1="576" />
            <wire x2="736" y1="3440" y2="3440" x1="640" />
        </branch>
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3488" type="branch" />
            <wire x2="640" y1="3488" y2="3488" x1="576" />
            <wire x2="736" y1="3488" y2="3488" x1="640" />
        </branch>
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3536" type="branch" />
            <wire x2="640" y1="3536" y2="3536" x1="576" />
            <wire x2="736" y1="3536" y2="3536" x1="640" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3600" type="branch" />
            <wire x2="640" y1="3600" y2="3600" x1="576" />
            <wire x2="736" y1="3600" y2="3600" x1="640" />
        </branch>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3648" type="branch" />
            <wire x2="640" y1="3648" y2="3648" x1="576" />
            <wire x2="736" y1="3648" y2="3648" x1="640" />
        </branch>
        <branch name="REG_DATA_SEL_0">
            <wire x2="1680" y1="3552" y2="3552" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1680" y="3552" name="REG_DATA_SEL_0" orien="R0" />
        <instance x="736" y="4304" name="REG_DATA_SEL_LUT_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="-480" type="instance" />
        </instance>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="3952" type="branch" />
            <wire x2="640" y1="3952" y2="3952" x1="576" />
            <wire x2="736" y1="3952" y2="3952" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4000" type="branch" />
            <wire x2="640" y1="4000" y2="4000" x1="576" />
            <wire x2="736" y1="4000" y2="4000" x1="640" />
        </branch>
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4048" type="branch" />
            <wire x2="640" y1="4048" y2="4048" x1="576" />
            <wire x2="736" y1="4048" y2="4048" x1="640" />
        </branch>
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4096" type="branch" />
            <wire x2="640" y1="4096" y2="4096" x1="576" />
            <wire x2="736" y1="4096" y2="4096" x1="640" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4160" type="branch" />
            <wire x2="640" y1="4160" y2="4160" x1="576" />
            <wire x2="736" y1="4160" y2="4160" x1="640" />
        </branch>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4208" type="branch" />
            <wire x2="640" y1="4208" y2="4208" x1="576" />
            <wire x2="736" y1="4208" y2="4208" x1="640" />
        </branch>
        <branch name="REG_DATA_SEL_1">
            <wire x2="1680" y1="4112" y2="4112" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1680" y="4112" name="REG_DATA_SEL_1" orien="R0" />
        <bustap x2="576" y1="3392" y2="3392" x1="480" />
        <bustap x2="576" y1="3440" y2="3440" x1="480" />
        <bustap x2="576" y1="3488" y2="3488" x1="480" />
        <bustap x2="576" y1="3536" y2="3536" x1="480" />
        <bustap x2="576" y1="3600" y2="3600" x1="480" />
        <bustap x2="576" y1="3648" y2="3648" x1="480" />
        <bustap x2="576" y1="3952" y2="3952" x1="480" />
        <bustap x2="576" y1="4000" y2="4000" x1="480" />
        <bustap x2="576" y1="4048" y2="4048" x1="480" />
        <bustap x2="576" y1="4096" y2="4096" x1="480" />
        <bustap x2="576" y1="4160" y2="4160" x1="480" />
        <bustap x2="576" y1="4208" y2="4208" x1="480" />
        <instance x="736" y="4864" name="STR_INST_LUT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="64" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="112" y="-512" type="instance" />
        </instance>
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4512" type="branch" />
            <wire x2="640" y1="4512" y2="4512" x1="576" />
            <wire x2="736" y1="4512" y2="4512" x1="640" />
        </branch>
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4560" type="branch" />
            <wire x2="640" y1="4560" y2="4560" x1="576" />
            <wire x2="736" y1="4560" y2="4560" x1="640" />
        </branch>
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4608" type="branch" />
            <wire x2="640" y1="4608" y2="4608" x1="576" />
            <wire x2="736" y1="4608" y2="4608" x1="640" />
        </branch>
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4656" type="branch" />
            <wire x2="640" y1="4656" y2="4656" x1="576" />
            <wire x2="736" y1="4656" y2="4656" x1="640" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4720" type="branch" />
            <wire x2="640" y1="4720" y2="4720" x1="576" />
            <wire x2="736" y1="4720" y2="4720" x1="640" />
        </branch>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="4768" type="branch" />
            <wire x2="640" y1="4768" y2="4768" x1="576" />
            <wire x2="736" y1="4768" y2="4768" x1="640" />
        </branch>
        <branch name="XLXN_184">
            <wire x2="1280" y1="4672" y2="4672" x1="1120" />
        </branch>
        <bustap x2="576" y1="4512" y2="4512" x1="480" />
        <bustap x2="576" y1="4560" y2="4560" x1="480" />
        <bustap x2="576" y1="4608" y2="4608" x1="480" />
        <bustap x2="576" y1="4656" y2="4656" x1="480" />
        <bustap x2="576" y1="4720" y2="4720" x1="480" />
        <bustap x2="576" y1="4768" y2="4768" x1="480" />
        <branch name="RAM_WE">
            <wire x2="1680" y1="4768" y2="4768" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1680" y="4768" name="RAM_WE" orien="R0" />
        <branch name="STG(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="400" y="400" type="branch" />
            <wire x2="400" y1="336" y2="400" x1="400" />
            <wire x2="400" y1="400" y2="544" x1="400" />
            <wire x2="720" y1="544" y2="544" x1="400" />
            <wire x2="400" y1="544" y2="976" x1="400" />
            <wire x2="1120" y1="976" y2="976" x1="400" />
            <wire x2="400" y1="976" y2="1824" x1="400" />
            <wire x2="1152" y1="1824" y2="1824" x1="400" />
            <wire x2="400" y1="1824" y2="2864" x1="400" />
            <wire x2="1072" y1="2864" y2="2864" x1="400" />
            <wire x2="400" y1="2864" y2="4864" x1="400" />
            <wire x2="1232" y1="4864" y2="4864" x1="400" />
            <wire x2="400" y1="4864" y2="5504" x1="400" />
            <wire x2="1232" y1="5504" y2="5504" x1="400" />
            <wire x2="400" y1="5504" y2="6944" x1="400" />
            <wire x2="1232" y1="6944" y2="6944" x1="400" />
            <wire x2="400" y1="6944" y2="13920" x1="400" />
            <wire x2="1120" y1="2784" y2="2784" x1="1072" />
            <wire x2="1072" y1="2784" y2="2864" x1="1072" />
            <wire x2="1280" y1="1760" y2="1760" x1="1152" />
            <wire x2="1152" y1="1760" y2="1824" x1="1152" />
            <wire x2="1280" y1="4800" y2="4800" x1="1232" />
            <wire x2="1232" y1="4800" y2="4864" x1="1232" />
            <wire x2="1280" y1="5440" y2="5440" x1="1232" />
            <wire x2="1232" y1="5440" y2="5504" x1="1232" />
            <wire x2="1280" y1="6880" y2="6880" x1="1232" />
            <wire x2="1232" y1="6880" y2="6944" x1="1232" />
        </branch>
        <branch name="STG(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="432" y="400" type="branch" />
            <wire x2="432" y1="336" y2="400" x1="432" />
            <wire x2="432" y1="400" y2="608" x1="432" />
            <wire x2="720" y1="608" y2="608" x1="432" />
            <wire x2="432" y1="608" y2="1040" x1="432" />
            <wire x2="1120" y1="1040" y2="1040" x1="432" />
            <wire x2="432" y1="1040" y2="1856" x1="432" />
            <wire x2="1184" y1="1856" y2="1856" x1="432" />
            <wire x2="432" y1="1856" y2="2896" x1="432" />
            <wire x2="1104" y1="2896" y2="2896" x1="432" />
            <wire x2="432" y1="2896" y2="4896" x1="432" />
            <wire x2="1264" y1="4896" y2="4896" x1="432" />
            <wire x2="432" y1="4896" y2="5536" x1="432" />
            <wire x2="1264" y1="5536" y2="5536" x1="432" />
            <wire x2="432" y1="5536" y2="6976" x1="432" />
            <wire x2="1264" y1="6976" y2="6976" x1="432" />
            <wire x2="432" y1="6976" y2="13920" x1="432" />
            <wire x2="1120" y1="2848" y2="2848" x1="1104" />
            <wire x2="1104" y1="2848" y2="2896" x1="1104" />
            <wire x2="1280" y1="1824" y2="1824" x1="1184" />
            <wire x2="1184" y1="1824" y2="1856" x1="1184" />
            <wire x2="1264" y1="4864" y2="4896" x1="1264" />
            <wire x2="1280" y1="4864" y2="4864" x1="1264" />
            <wire x2="1264" y1="5504" y2="5536" x1="1264" />
            <wire x2="1280" y1="5504" y2="5504" x1="1264" />
            <wire x2="1264" y1="6944" y2="6976" x1="1264" />
            <wire x2="1280" y1="6944" y2="6944" x1="1264" />
        </branch>
        <instance x="1280" y="4928" name="XLXI_146" orien="R0" />
        <instance x="736" y="5504" name="STL_INST_LUT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="64" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="112" y="-512" type="instance" />
        </instance>
        <bustap x2="576" y1="5152" y2="5152" x1="480" />
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5152" type="branch" />
            <wire x2="640" y1="5152" y2="5152" x1="576" />
            <wire x2="736" y1="5152" y2="5152" x1="640" />
        </branch>
        <bustap x2="576" y1="5200" y2="5200" x1="480" />
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5200" type="branch" />
            <wire x2="640" y1="5200" y2="5200" x1="576" />
            <wire x2="736" y1="5200" y2="5200" x1="640" />
        </branch>
        <bustap x2="576" y1="5248" y2="5248" x1="480" />
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5248" type="branch" />
            <wire x2="640" y1="5248" y2="5248" x1="576" />
            <wire x2="736" y1="5248" y2="5248" x1="640" />
        </branch>
        <bustap x2="576" y1="5296" y2="5296" x1="480" />
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5296" type="branch" />
            <wire x2="640" y1="5296" y2="5296" x1="576" />
            <wire x2="736" y1="5296" y2="5296" x1="640" />
        </branch>
        <bustap x2="576" y1="5360" y2="5360" x1="480" />
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5360" type="branch" />
            <wire x2="640" y1="5360" y2="5360" x1="576" />
            <wire x2="736" y1="5360" y2="5360" x1="640" />
        </branch>
        <bustap x2="576" y1="5408" y2="5408" x1="480" />
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5408" type="branch" />
            <wire x2="640" y1="5408" y2="5408" x1="576" />
            <wire x2="736" y1="5408" y2="5408" x1="640" />
        </branch>
        <instance x="1280" y="5568" name="XLXI_148" orien="R0" />
        <branch name="XLXN_454">
            <wire x2="1280" y1="5312" y2="5312" x1="1120" />
        </branch>
        <branch name="STL_CNT_L">
            <wire x2="1552" y1="5408" y2="5408" x1="1536" />
            <wire x2="1680" y1="5408" y2="5408" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1680" y="5408" name="STL_CNT_L" orien="R0" />
        <instance x="720" y="5952" name="XLXI_152" orien="R0" />
        <bustap x2="1104" y1="5680" y2="5680" x1="1200" />
        <bustap x2="1104" y1="5760" y2="5760" x1="1200" />
        <bustap x2="1104" y1="5840" y2="5840" x1="1200" />
        <bustap x2="1104" y1="5920" y2="5920" x1="1200" />
        <instance x="720" y="5872" name="XLXI_151" orien="R0" />
        <instance x="720" y="5792" name="XLXI_150" orien="R0" />
        <instance x="720" y="5712" name="XLXI_149" orien="R0" />
        <branch name="ALU_OP(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="5680" type="branch" />
            <wire x2="1024" y1="5680" y2="5680" x1="944" />
            <wire x2="1104" y1="5680" y2="5680" x1="1024" />
        </branch>
        <branch name="ALU_OP(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="5760" type="branch" />
            <wire x2="1024" y1="5760" y2="5760" x1="944" />
            <wire x2="1104" y1="5760" y2="5760" x1="1024" />
        </branch>
        <branch name="ALU_OP(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="5840" type="branch" />
            <wire x2="1024" y1="5840" y2="5840" x1="944" />
            <wire x2="1104" y1="5840" y2="5840" x1="1024" />
        </branch>
        <branch name="ALU_OP(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="5920" type="branch" />
            <wire x2="1024" y1="5920" y2="5920" x1="944" />
            <wire x2="1104" y1="5920" y2="5920" x1="1024" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5920" type="branch" />
            <wire x2="640" y1="5920" y2="5920" x1="576" />
            <wire x2="720" y1="5920" y2="5920" x1="640" />
        </branch>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5840" type="branch" />
            <wire x2="640" y1="5840" y2="5840" x1="576" />
            <wire x2="720" y1="5840" y2="5840" x1="640" />
        </branch>
        <branch name="ID(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5760" type="branch" />
            <wire x2="640" y1="5760" y2="5760" x1="576" />
            <wire x2="720" y1="5760" y2="5760" x1="640" />
        </branch>
        <branch name="ID(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="5680" type="branch" />
            <wire x2="640" y1="5680" y2="5680" x1="576" />
            <wire x2="720" y1="5680" y2="5680" x1="640" />
        </branch>
        <branch name="ALU_OP(3:0)">
            <wire x2="1200" y1="5680" y2="5760" x1="1200" />
            <wire x2="1200" y1="5760" y2="5840" x1="1200" />
            <wire x2="1200" y1="5840" y2="5920" x1="1200" />
            <wire x2="1216" y1="5680" y2="5680" x1="1200" />
            <wire x2="1680" y1="5680" y2="5680" x1="1216" />
        </branch>
        <instance x="720" y="6352" name="XLXI_157" orien="R0" />
        <bustap x2="1104" y1="6080" y2="6080" x1="1200" />
        <bustap x2="1104" y1="6160" y2="6160" x1="1200" />
        <bustap x2="1104" y1="6240" y2="6240" x1="1200" />
        <bustap x2="1104" y1="6320" y2="6320" x1="1200" />
        <instance x="720" y="6272" name="XLXI_158" orien="R0" />
        <instance x="720" y="6192" name="XLXI_159" orien="R0" />
        <instance x="720" y="6112" name="XLXI_160" orien="R0" />
        <branch name="FLG_IDX(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="6080" type="branch" />
            <wire x2="1024" y1="6080" y2="6080" x1="944" />
            <wire x2="1104" y1="6080" y2="6080" x1="1024" />
        </branch>
        <branch name="FLG_IDX(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="6160" type="branch" />
            <wire x2="1024" y1="6160" y2="6160" x1="944" />
            <wire x2="1104" y1="6160" y2="6160" x1="1024" />
        </branch>
        <branch name="FLG_IDX(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="6240" type="branch" />
            <wire x2="1024" y1="6240" y2="6240" x1="944" />
            <wire x2="1104" y1="6240" y2="6240" x1="1024" />
        </branch>
        <branch name="FLG_IDX(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1024" y="6320" type="branch" />
            <wire x2="1024" y1="6320" y2="6320" x1="944" />
            <wire x2="1104" y1="6320" y2="6320" x1="1024" />
        </branch>
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6320" type="branch" />
            <wire x2="640" y1="6320" y2="6320" x1="576" />
            <wire x2="720" y1="6320" y2="6320" x1="640" />
        </branch>
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6240" type="branch" />
            <wire x2="640" y1="6240" y2="6240" x1="576" />
            <wire x2="720" y1="6240" y2="6240" x1="640" />
        </branch>
        <branch name="ID(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6160" type="branch" />
            <wire x2="640" y1="6160" y2="6160" x1="576" />
            <wire x2="720" y1="6160" y2="6160" x1="640" />
        </branch>
        <branch name="ID(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6080" type="branch" />
            <wire x2="640" y1="6080" y2="6080" x1="576" />
            <wire x2="720" y1="6080" y2="6080" x1="640" />
        </branch>
        <branch name="FLG_IDX(3:0)">
            <wire x2="1200" y1="6080" y2="6160" x1="1200" />
            <wire x2="1200" y1="6160" y2="6240" x1="1200" />
            <wire x2="1200" y1="6240" y2="6320" x1="1200" />
            <wire x2="1216" y1="6080" y2="6080" x1="1200" />
            <wire x2="1680" y1="6080" y2="6080" x1="1216" />
        </branch>
        <bustap x2="576" y1="5680" y2="5680" x1="480" />
        <bustap x2="576" y1="5760" y2="5760" x1="480" />
        <bustap x2="576" y1="5840" y2="5840" x1="480" />
        <bustap x2="576" y1="5920" y2="5920" x1="480" />
        <bustap x2="576" y1="6080" y2="6080" x1="480" />
        <bustap x2="576" y1="6160" y2="6160" x1="480" />
        <bustap x2="576" y1="6240" y2="6240" x1="480" />
        <bustap x2="576" y1="6320" y2="6320" x1="480" />
        <iomarker fontsize="28" x="1680" y="5680" name="ALU_OP(3:0)" orien="R0" />
        <iomarker fontsize="28" x="1680" y="6080" name="FLG_IDX(3:0)" orien="R0" />
        <bustap x2="576" y1="6848" y2="6848" x1="480" />
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6848" type="branch" />
            <wire x2="640" y1="6848" y2="6848" x1="576" />
            <wire x2="736" y1="6848" y2="6848" x1="640" />
        </branch>
        <bustap x2="576" y1="6800" y2="6800" x1="480" />
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6800" type="branch" />
            <wire x2="640" y1="6800" y2="6800" x1="576" />
            <wire x2="736" y1="6800" y2="6800" x1="640" />
        </branch>
        <bustap x2="576" y1="6736" y2="6736" x1="480" />
        <branch name="ID(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6736" type="branch" />
            <wire x2="640" y1="6736" y2="6736" x1="576" />
            <wire x2="736" y1="6736" y2="6736" x1="640" />
        </branch>
        <bustap x2="576" y1="6688" y2="6688" x1="480" />
        <branch name="ID(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6688" type="branch" />
            <wire x2="640" y1="6688" y2="6688" x1="576" />
            <wire x2="736" y1="6688" y2="6688" x1="640" />
        </branch>
        <bustap x2="576" y1="6640" y2="6640" x1="480" />
        <branch name="ID(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6640" type="branch" />
            <wire x2="640" y1="6640" y2="6640" x1="576" />
            <wire x2="736" y1="6640" y2="6640" x1="640" />
        </branch>
        <bustap x2="576" y1="6592" y2="6592" x1="480" />
        <branch name="ID(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="640" y="6592" type="branch" />
            <wire x2="640" y1="6592" y2="6592" x1="576" />
            <wire x2="736" y1="6592" y2="6592" x1="640" />
        </branch>
        <instance x="736" y="6944" name="OUT_INST_LUT" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="64" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="112" y="-512" type="instance" />
        </instance>
        <instance x="1280" y="7008" name="XLXI_161" orien="R0" />
        <branch name="XLXN_456">
            <wire x2="1136" y1="6752" y2="6752" x1="1120" />
            <wire x2="1280" y1="6752" y2="6752" x1="1136" />
        </branch>
        <branch name="OUT_REG_WE">
            <wire x2="1552" y1="6848" y2="6848" x1="1536" />
            <wire x2="1680" y1="6848" y2="6848" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1680" y="6848" name="OUT_REG_WE" orien="R0" />
    </sheet>
</drawing>