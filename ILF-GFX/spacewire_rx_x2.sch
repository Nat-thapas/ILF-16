<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D1" />
        <signal name="S1" />
        <signal name="D2" />
        <signal name="S2" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_15" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_31" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="CLR" />
        <signal name="XLXN_40(15:0)" />
        <signal name="XLXN_41(15:0)" />
        <signal name="XLXN_42(15:0)" />
        <signal name="XLXN_43(15:0)" />
        <signal name="XLXN_49" />
        <signal name="XLXN_65" />
        <signal name="XLXN_64" />
        <signal name="XLXN_76" />
        <signal name="XLXN_78" />
        <signal name="XLXN_80" />
        <signal name="XLXN_58" />
        <signal name="RXCLK" />
        <signal name="XLXN_88" />
        <signal name="XLXN_90" />
        <signal name="XLXN_97(15:0)" />
        <signal name="XLXN_98(15:0)" />
        <signal name="XLXN_182(31:0)" />
        <signal name="DATA(31:0)" />
        <signal name="XLXN_186" />
        <signal name="XLXN_190" />
        <signal name="XLXN_199" />
        <signal name="XLXN_200" />
        <signal name="XLXN_203" />
        <signal name="XLXN_204" />
        <signal name="XLXN_205" />
        <signal name="XLXN_209" />
        <signal name="XLXN_210" />
        <signal name="XLXN_213" />
        <signal name="XLXN_214" />
        <signal name="XLXN_215" />
        <signal name="XLXN_216" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="S1" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="S2" />
        <port polarity="Input" name="CLR" />
        <port polarity="Input" name="RXCLK" />
        <port polarity="Output" name="DATA(31:0)" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="lut4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <blockdef name="sr16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
        </blockdef>
        <blockdef name="bus_reverser">
            <timestamp>2024-11-9T15:32:20</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
        </blockdef>
        <blockdef name="fd16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="64" x="320" y="-268" height="24" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="cb4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="bus_splicer">
            <timestamp>2024-11-9T16:8:31</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
        </blockdef>
        <blockdef name="fd32ce">
            <timestamp>2024-11-10T12:8:53</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="fde">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="fd" name="XLXI_1">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="D1" name="D" />
            <blockpin signalname="XLXN_12" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_2">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="S1" name="D" />
            <blockpin signalname="XLXN_11" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_3">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="D2" name="D" />
            <blockpin signalname="XLXN_10" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_4">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="S2" name="D" />
            <blockpin signalname="XLXN_9" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_5">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_12" name="D" />
            <blockpin signalname="XLXN_27" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_6">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_11" name="D" />
            <blockpin signalname="XLXN_31" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_7">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_10" name="D" />
            <blockpin signalname="XLXN_15" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_8">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_9" name="D" />
            <blockpin signalname="XLXN_35" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_9">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_27" name="D" />
            <blockpin signalname="XLXN_28" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_10">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_31" name="D" />
            <blockpin signalname="XLXN_29" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_11">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_15" name="D" />
            <blockpin signalname="XLXN_34" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_12">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_35" name="D" />
            <blockpin signalname="XLXN_36" name="Q" />
        </block>
        <block symbolname="lut4" name="XLXI_13">
            <attr value="6FF6" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="XLXN_29" name="I0" />
            <blockpin signalname="XLXN_31" name="I1" />
            <blockpin signalname="XLXN_28" name="I2" />
            <blockpin signalname="XLXN_27" name="I3" />
            <blockpin signalname="XLXN_213" name="O" />
        </block>
        <block symbolname="lut4" name="XLXI_14">
            <attr value="6FF6" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="XLXN_36" name="I0" />
            <blockpin signalname="XLXN_35" name="I1" />
            <blockpin signalname="XLXN_34" name="I2" />
            <blockpin signalname="XLXN_15" name="I3" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="sr16ce" name="XLXI_15">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_213" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_27" name="SLI" />
            <blockpin signalname="XLXN_41(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="sr16ce" name="XLXI_16">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_49" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_15" name="SLI" />
            <blockpin signalname="XLXN_40(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="bus_reverser" name="XLXI_17">
            <blockpin signalname="XLXN_41(15:0)" name="I(15:0)" />
            <blockpin signalname="XLXN_43(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="bus_reverser" name="XLXI_18">
            <blockpin signalname="XLXN_40(15:0)" name="I(15:0)" />
            <blockpin signalname="XLXN_42(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="cb4ce" name="XLXI_21">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_213" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin name="CEO" />
            <blockpin name="Q0" />
            <blockpin name="Q1" />
            <blockpin name="Q2" />
            <blockpin name="Q3" />
            <blockpin signalname="XLXN_65" name="TC" />
        </block>
        <block symbolname="cb4ce" name="XLXI_22">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_49" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin name="CEO" />
            <blockpin name="Q0" />
            <blockpin name="Q1" />
            <blockpin name="Q2" />
            <blockpin name="Q3" />
            <blockpin signalname="XLXN_76" name="TC" />
        </block>
        <block symbolname="fd" name="XLXI_29">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_64" name="D" />
            <blockpin signalname="XLXN_88" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_31">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_90" name="D" />
            <blockpin signalname="XLXN_78" name="Q" />
        </block>
        <block symbolname="gnd" name="XLXI_34">
            <blockpin signalname="XLXN_80" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_20">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_190" name="CE" />
            <blockpin signalname="XLXN_80" name="CLR" />
            <blockpin signalname="XLXN_42(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_98(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_27">
            <blockpin signalname="XLXN_58" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_19">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_203" name="CE" />
            <blockpin signalname="XLXN_58" name="CLR" />
            <blockpin signalname="XLXN_43(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_97(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="and2b1" name="XLXI_39">
            <blockpin signalname="XLXN_88" name="I0" />
            <blockpin signalname="XLXN_64" name="I1" />
            <blockpin signalname="XLXN_203" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_40">
            <blockpin signalname="XLXN_78" name="I0" />
            <blockpin signalname="XLXN_90" name="I1" />
            <blockpin signalname="XLXN_190" name="O" />
        </block>
        <block symbolname="bus_splicer" name="XLXI_46">
            <blockpin signalname="XLXN_98(15:0)" name="H(15:0)" />
            <blockpin signalname="XLXN_97(15:0)" name="L(15:0)" />
            <blockpin signalname="XLXN_182(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="fd32ce" name="XLXI_47">
            <blockpin signalname="XLXN_214" name="CE" />
            <blockpin signalname="RXCLK" name="CLK" />
            <blockpin signalname="XLXN_186" name="CLR" />
            <blockpin signalname="XLXN_182(31:0)" name="D(31:0)" />
            <blockpin signalname="DATA(31:0)" name="Q(31:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_50">
            <blockpin signalname="XLXN_186" name="G" />
        </block>
        <block symbolname="and2" name="XLXI_57">
            <blockpin signalname="XLXN_216" name="I0" />
            <blockpin signalname="XLXN_215" name="I1" />
            <blockpin signalname="XLXN_214" name="O" />
        </block>
        <block symbolname="fde" name="XLXI_58">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_205" name="CE" />
            <blockpin signalname="XLXN_200" name="D" />
            <blockpin signalname="XLXN_215" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_59">
            <blockpin signalname="XLXN_215" name="I" />
            <blockpin signalname="XLXN_200" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_60">
            <blockpin signalname="XLXN_204" name="I0" />
            <blockpin signalname="XLXN_203" name="I1" />
            <blockpin signalname="XLXN_205" name="O" />
        </block>
        <block symbolname="fde" name="XLXI_61">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_205" name="CE" />
            <blockpin signalname="XLXN_210" name="D" />
            <blockpin signalname="XLXN_216" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_62">
            <blockpin signalname="XLXN_216" name="I" />
            <blockpin signalname="XLXN_210" name="O" />
        </block>
        <block symbolname="fde" name="XLXI_63">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_213" name="CE" />
            <blockpin signalname="XLXN_65" name="D" />
            <blockpin signalname="XLXN_64" name="Q" />
        </block>
        <block symbolname="fde" name="XLXI_64">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_49" name="CE" />
            <blockpin signalname="XLXN_76" name="D" />
            <blockpin signalname="XLXN_90" name="Q" />
        </block>
        <block symbolname="and2" name="XLXI_65">
            <blockpin signalname="XLXN_216" name="I0" />
            <blockpin signalname="XLXN_215" name="I1" />
            <blockpin signalname="XLXN_204" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="416" y="560" name="XLXI_1" orien="R0" />
        <instance x="416" y="1040" name="XLXI_2" orien="R0" />
        <instance x="416" y="1600" name="XLXI_3" orien="R0" />
        <instance x="416" y="2080" name="XLXI_4" orien="R0" />
        <branch name="D1">
            <wire x2="416" y1="304" y2="304" x1="224" />
        </branch>
        <branch name="S1">
            <wire x2="416" y1="784" y2="784" x1="224" />
        </branch>
        <branch name="D2">
            <wire x2="416" y1="1344" y2="1344" x1="224" />
        </branch>
        <branch name="S2">
            <wire x2="416" y1="1824" y2="1824" x1="224" />
        </branch>
        <iomarker fontsize="28" x="224" y="304" name="D1" orien="R180" />
        <iomarker fontsize="28" x="224" y="784" name="S1" orien="R180" />
        <iomarker fontsize="28" x="224" y="1344" name="D2" orien="R180" />
        <iomarker fontsize="28" x="224" y="1824" name="S2" orien="R180" />
        <branch name="XLXN_9">
            <wire x2="896" y1="1824" y2="1824" x1="800" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="896" y1="1344" y2="1344" x1="800" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="896" y1="784" y2="784" x1="800" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="896" y1="304" y2="304" x1="800" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1360" y1="1344" y2="1344" x1="1280" />
            <wire x2="1456" y1="1344" y2="1344" x1="1360" />
            <wire x2="1984" y1="1200" y2="1200" x1="1360" />
            <wire x2="1984" y1="1200" y2="1424" x1="1984" />
            <wire x2="2096" y1="1424" y2="1424" x1="1984" />
            <wire x2="2528" y1="1200" y2="1200" x1="1984" />
            <wire x2="2528" y1="1200" y2="1424" x1="2528" />
            <wire x2="2656" y1="1424" y2="1424" x1="2528" />
            <wire x2="1360" y1="1200" y2="1344" x1="1360" />
        </branch>
        <instance x="896" y="560" name="XLXI_5" orien="R0" />
        <instance x="896" y="1040" name="XLXI_6" orien="R0" />
        <instance x="896" y="1600" name="XLXI_7" orien="R0" />
        <instance x="896" y="2080" name="XLXI_8" orien="R0" />
        <instance x="1456" y="2080" name="XLXI_12" orien="R0" />
        <instance x="1456" y="1600" name="XLXI_11" orien="R0" />
        <instance x="1456" y="1040" name="XLXI_10" orien="R0" />
        <instance x="1456" y="560" name="XLXI_9" orien="R0" />
        <instance x="2096" y="704" name="XLXI_13" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="176" y="-364" type="instance" />
        </instance>
        <instance x="2096" y="1744" name="XLXI_14" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="176" y="-364" type="instance" />
        </instance>
        <branch name="XLXN_27">
            <wire x2="1360" y1="304" y2="304" x1="1280" />
            <wire x2="1456" y1="304" y2="304" x1="1360" />
            <wire x2="1360" y1="160" y2="304" x1="1360" />
            <wire x2="1984" y1="160" y2="160" x1="1360" />
            <wire x2="1984" y1="160" y2="384" x1="1984" />
            <wire x2="2096" y1="384" y2="384" x1="1984" />
            <wire x2="2560" y1="160" y2="160" x1="1984" />
            <wire x2="2560" y1="160" y2="384" x1="2560" />
            <wire x2="2656" y1="384" y2="384" x1="2560" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="1952" y1="304" y2="304" x1="1840" />
            <wire x2="1952" y1="304" y2="448" x1="1952" />
            <wire x2="2096" y1="448" y2="448" x1="1952" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="1984" y1="784" y2="784" x1="1840" />
            <wire x2="2096" y1="576" y2="576" x1="1984" />
            <wire x2="1984" y1="576" y2="784" x1="1984" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="1360" y1="784" y2="784" x1="1280" />
            <wire x2="1456" y1="784" y2="784" x1="1360" />
            <wire x2="1360" y1="592" y2="784" x1="1360" />
            <wire x2="1952" y1="592" y2="592" x1="1360" />
            <wire x2="2096" y1="512" y2="512" x1="1952" />
            <wire x2="1952" y1="512" y2="592" x1="1952" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="1952" y1="1344" y2="1344" x1="1840" />
            <wire x2="1952" y1="1344" y2="1488" x1="1952" />
            <wire x2="2096" y1="1488" y2="1488" x1="1952" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="1360" y1="1824" y2="1824" x1="1280" />
            <wire x2="1456" y1="1824" y2="1824" x1="1360" />
            <wire x2="1360" y1="1680" y2="1824" x1="1360" />
            <wire x2="1952" y1="1680" y2="1680" x1="1360" />
            <wire x2="2096" y1="1552" y2="1552" x1="1952" />
            <wire x2="1952" y1="1552" y2="1680" x1="1952" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="1984" y1="1824" y2="1824" x1="1840" />
            <wire x2="2096" y1="1616" y2="1616" x1="1984" />
            <wire x2="1984" y1="1616" y2="1824" x1="1984" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="2200" y="1704">(I0 ^ I1) | (I2 ^ I3)</text>
        <text style="fontsize:24;fontname:Arial" x="2200" y="664">(I0 ^ I1) | (I2 ^ I3)</text>
        <instance x="2656" y="704" name="XLXI_15" orien="R0" />
        <instance x="2656" y="1744" name="XLXI_16" orien="R0" />
        <branch name="CLR">
            <wire x2="2560" y1="2080" y2="2080" x1="240" />
            <wire x2="2560" y1="2080" y2="2240" x1="2560" />
            <wire x2="2896" y1="2240" y2="2240" x1="2560" />
            <wire x2="2560" y1="672" y2="1200" x1="2560" />
            <wire x2="2560" y1="1200" y2="1712" x1="2560" />
            <wire x2="2560" y1="1712" y2="2080" x1="2560" />
            <wire x2="2656" y1="1712" y2="1712" x1="2560" />
            <wire x2="2896" y1="1200" y2="1200" x1="2560" />
            <wire x2="2656" y1="672" y2="672" x1="2560" />
        </branch>
        <iomarker fontsize="28" x="240" y="2080" name="CLR" orien="R180" />
        <branch name="XLXN_40(15:0)">
            <wire x2="3456" y1="1488" y2="1488" x1="3040" />
        </branch>
        <branch name="XLXN_41(15:0)">
            <wire x2="3456" y1="448" y2="448" x1="3040" />
        </branch>
        <branch name="XLXN_42(15:0)">
            <wire x2="4656" y1="1488" y2="1488" x1="3840" />
        </branch>
        <branch name="XLXN_43(15:0)">
            <wire x2="4656" y1="448" y2="448" x1="3840" />
        </branch>
        <instance x="2896" y="1232" name="XLXI_21" orien="R0" />
        <instance x="2896" y="2272" name="XLXI_22" orien="R0" />
        <branch name="XLXN_49">
            <wire x2="2592" y1="1552" y2="1552" x1="2480" />
            <wire x2="2656" y1="1552" y2="1552" x1="2592" />
            <wire x2="2592" y1="1552" y2="2080" x1="2592" />
            <wire x2="2832" y1="2080" y2="2080" x1="2592" />
            <wire x2="2896" y1="2080" y2="2080" x1="2832" />
            <wire x2="2832" y1="2080" y2="2336" x1="2832" />
            <wire x2="3392" y1="2336" y2="2336" x1="2832" />
            <wire x2="3456" y1="2080" y2="2080" x1="3392" />
            <wire x2="3392" y1="2080" y2="2336" x1="3392" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="3360" y1="1104" y2="1104" x1="3280" />
            <wire x2="3360" y1="976" y2="1104" x1="3360" />
            <wire x2="3456" y1="976" y2="976" x1="3360" />
        </branch>
        <instance x="3936" y="1232" name="XLXI_29" orien="R0" />
        <branch name="XLXN_76">
            <wire x2="3360" y1="2144" y2="2144" x1="3280" />
            <wire x2="3360" y1="2016" y2="2144" x1="3360" />
            <wire x2="3456" y1="2016" y2="2016" x1="3360" />
        </branch>
        <instance x="3936" y="2272" name="XLXI_31" orien="R0" />
        <branch name="XLXN_80">
            <wire x2="4656" y1="1712" y2="1712" x1="4624" />
        </branch>
        <instance x="4496" y="1648" name="XLXI_34" orien="R90" />
        <instance x="4656" y="1744" name="XLXI_20" orien="R0" />
        <branch name="XLXN_58">
            <wire x2="4656" y1="672" y2="672" x1="4624" />
        </branch>
        <instance x="4496" y="608" name="XLXI_27" orien="R90" />
        <instance x="4656" y="704" name="XLXI_19" orien="R0" />
        <branch name="XLXN_64">
            <wire x2="3872" y1="976" y2="976" x1="3840" />
            <wire x2="3936" y1="976" y2="976" x1="3872" />
            <wire x2="4272" y1="816" y2="816" x1="3872" />
            <wire x2="3872" y1="816" y2="976" x1="3872" />
            <wire x2="4272" y1="800" y2="816" x1="4272" />
        </branch>
        <instance x="4400" y="800" name="XLXI_39" orien="R270" />
        <branch name="XLXN_88">
            <wire x2="4336" y1="976" y2="976" x1="4320" />
            <wire x2="4336" y1="800" y2="976" x1="4336" />
        </branch>
        <branch name="XLXN_90">
            <wire x2="3872" y1="2016" y2="2016" x1="3840" />
            <wire x2="3936" y1="2016" y2="2016" x1="3872" />
            <wire x2="4272" y1="1856" y2="1856" x1="3872" />
            <wire x2="3872" y1="1856" y2="2016" x1="3872" />
            <wire x2="4272" y1="1840" y2="1856" x1="4272" />
        </branch>
        <instance x="4400" y="1840" name="XLXI_40" orien="R270" />
        <branch name="XLXN_78">
            <wire x2="4336" y1="2016" y2="2016" x1="4320" />
            <wire x2="4336" y1="1840" y2="2016" x1="4336" />
        </branch>
        <instance x="3456" y="1520" name="XLXI_18" orien="R0">
        </instance>
        <instance x="3456" y="480" name="XLXI_17" orien="R0">
        </instance>
        <instance x="5296" y="544" name="XLXI_46" orien="R0">
        </instance>
        <branch name="XLXN_97(15:0)">
            <wire x2="5296" y1="448" y2="448" x1="5040" />
        </branch>
        <branch name="XLXN_98(15:0)">
            <wire x2="5120" y1="1488" y2="1488" x1="5040" />
            <wire x2="5120" y1="512" y2="1488" x1="5120" />
            <wire x2="5296" y1="512" y2="512" x1="5120" />
        </branch>
        <iomarker fontsize="28" x="288" y="2000" name="RXCLK" orien="R180" />
        <branch name="XLXN_182(31:0)">
            <wire x2="6016" y1="448" y2="448" x1="5680" />
        </branch>
        <instance x="6016" y="672" name="XLXI_47" orien="R0">
        </instance>
        <branch name="DATA(31:0)">
            <wire x2="6480" y1="448" y2="448" x1="6400" />
        </branch>
        <iomarker fontsize="28" x="6480" y="448" name="DATA(31:0)" orien="R0" />
        <branch name="XLXN_186">
            <wire x2="6016" y1="640" y2="640" x1="5984" />
        </branch>
        <instance x="5856" y="576" name="XLXI_50" orien="R90" />
        <instance x="4576" y="1280" name="XLXI_58" orien="R0" />
        <branch name="XLXN_200">
            <wire x2="4560" y1="800" y2="1024" x1="4560" />
            <wire x2="4576" y1="1024" y2="1024" x1="4560" />
            <wire x2="4656" y1="800" y2="800" x1="4560" />
        </branch>
        <instance x="4880" y="768" name="XLXI_59" orien="R180" />
        <instance x="5296" y="848" name="XLXI_60" orien="R0" />
        <branch name="XLXN_203">
            <wire x2="4304" y1="512" y2="544" x1="4304" />
            <wire x2="4432" y1="512" y2="512" x1="4304" />
            <wire x2="4656" y1="512" y2="512" x1="4432" />
            <wire x2="4432" y1="512" y2="720" x1="4432" />
            <wire x2="5296" y1="720" y2="720" x1="4432" />
        </branch>
        <instance x="5280" y="1152" name="XLXI_57" orien="R0" />
        <branch name="XLXN_190">
            <wire x2="4304" y1="1552" y2="1584" x1="4304" />
            <wire x2="4656" y1="1552" y2="1552" x1="4304" />
        </branch>
        <branch name="RXCLK">
            <wire x2="384" y1="2000" y2="2000" x1="288" />
            <wire x2="384" y1="2000" y2="2048" x1="384" />
            <wire x2="864" y1="2048" y2="2048" x1="384" />
            <wire x2="1424" y1="2048" y2="2048" x1="864" />
            <wire x2="2528" y1="2048" y2="2048" x1="1424" />
            <wire x2="2528" y1="2048" y2="2144" x1="2528" />
            <wire x2="2864" y1="2144" y2="2144" x1="2528" />
            <wire x2="2896" y1="2144" y2="2144" x1="2864" />
            <wire x2="2864" y1="2144" y2="2304" x1="2864" />
            <wire x2="3424" y1="2304" y2="2304" x1="2864" />
            <wire x2="3904" y1="2304" y2="2304" x1="3424" />
            <wire x2="4400" y1="2304" y2="2304" x1="3904" />
            <wire x2="5808" y1="2304" y2="2304" x1="4400" />
            <wire x2="416" y1="432" y2="432" x1="384" />
            <wire x2="384" y1="432" y2="528" x1="384" />
            <wire x2="864" y1="528" y2="528" x1="384" />
            <wire x2="1424" y1="528" y2="528" x1="864" />
            <wire x2="384" y1="528" y2="912" x1="384" />
            <wire x2="416" y1="912" y2="912" x1="384" />
            <wire x2="384" y1="912" y2="1008" x1="384" />
            <wire x2="864" y1="1008" y2="1008" x1="384" />
            <wire x2="1424" y1="1008" y2="1008" x1="864" />
            <wire x2="2528" y1="1008" y2="1008" x1="1424" />
            <wire x2="2528" y1="1008" y2="1104" x1="2528" />
            <wire x2="2864" y1="1104" y2="1104" x1="2528" />
            <wire x2="2896" y1="1104" y2="1104" x1="2864" />
            <wire x2="2864" y1="1104" y2="1264" x1="2864" />
            <wire x2="3424" y1="1264" y2="1264" x1="2864" />
            <wire x2="3904" y1="1264" y2="1264" x1="3424" />
            <wire x2="4400" y1="1264" y2="1264" x1="3904" />
            <wire x2="384" y1="1008" y2="1472" x1="384" />
            <wire x2="416" y1="1472" y2="1472" x1="384" />
            <wire x2="384" y1="1472" y2="1568" x1="384" />
            <wire x2="864" y1="1568" y2="1568" x1="384" />
            <wire x2="1424" y1="1568" y2="1568" x1="864" />
            <wire x2="384" y1="1568" y2="1952" x1="384" />
            <wire x2="416" y1="1952" y2="1952" x1="384" />
            <wire x2="384" y1="1952" y2="2000" x1="384" />
            <wire x2="896" y1="432" y2="432" x1="864" />
            <wire x2="864" y1="432" y2="528" x1="864" />
            <wire x2="896" y1="912" y2="912" x1="864" />
            <wire x2="864" y1="912" y2="1008" x1="864" />
            <wire x2="896" y1="1472" y2="1472" x1="864" />
            <wire x2="864" y1="1472" y2="1568" x1="864" />
            <wire x2="896" y1="1952" y2="1952" x1="864" />
            <wire x2="864" y1="1952" y2="2048" x1="864" />
            <wire x2="1456" y1="432" y2="432" x1="1424" />
            <wire x2="1424" y1="432" y2="528" x1="1424" />
            <wire x2="1456" y1="912" y2="912" x1="1424" />
            <wire x2="1424" y1="912" y2="1008" x1="1424" />
            <wire x2="1456" y1="1472" y2="1472" x1="1424" />
            <wire x2="1424" y1="1472" y2="1568" x1="1424" />
            <wire x2="1456" y1="1952" y2="1952" x1="1424" />
            <wire x2="1424" y1="1952" y2="2048" x1="1424" />
            <wire x2="2656" y1="576" y2="576" x1="2528" />
            <wire x2="2528" y1="576" y2="1008" x1="2528" />
            <wire x2="2656" y1="1616" y2="1616" x1="2528" />
            <wire x2="2528" y1="1616" y2="2048" x1="2528" />
            <wire x2="3456" y1="1104" y2="1104" x1="3424" />
            <wire x2="3424" y1="1104" y2="1264" x1="3424" />
            <wire x2="3456" y1="2144" y2="2144" x1="3424" />
            <wire x2="3424" y1="2144" y2="2304" x1="3424" />
            <wire x2="3936" y1="1104" y2="1104" x1="3904" />
            <wire x2="3904" y1="1104" y2="1264" x1="3904" />
            <wire x2="3936" y1="2144" y2="2144" x1="3904" />
            <wire x2="3904" y1="2144" y2="2304" x1="3904" />
            <wire x2="4656" y1="576" y2="576" x1="4400" />
            <wire x2="4400" y1="576" y2="1152" x1="4400" />
            <wire x2="4576" y1="1152" y2="1152" x1="4400" />
            <wire x2="4400" y1="1152" y2="1264" x1="4400" />
            <wire x2="4656" y1="1616" y2="1616" x1="4400" />
            <wire x2="4400" y1="1616" y2="2160" x1="4400" />
            <wire x2="4400" y1="2160" y2="2304" x1="4400" />
            <wire x2="4656" y1="2160" y2="2160" x1="4400" />
            <wire x2="6016" y1="576" y2="576" x1="5808" />
            <wire x2="5808" y1="576" y2="2304" x1="5808" />
        </branch>
        <branch name="XLXN_205">
            <wire x2="4576" y1="1088" y2="1088" x1="4544" />
            <wire x2="4544" y1="1088" y2="1248" x1="4544" />
            <wire x2="5744" y1="1248" y2="1248" x1="4544" />
            <wire x2="5744" y1="1248" y2="2256" x1="5744" />
            <wire x2="4656" y1="2096" y2="2096" x1="4624" />
            <wire x2="4624" y1="2096" y2="2256" x1="4624" />
            <wire x2="5744" y1="2256" y2="2256" x1="4624" />
            <wire x2="5744" y1="752" y2="752" x1="5552" />
            <wire x2="5744" y1="752" y2="1248" x1="5744" />
        </branch>
        <instance x="4656" y="2288" name="XLXI_61" orien="R0" />
        <instance x="4960" y="1776" name="XLXI_62" orien="R180" />
        <branch name="XLXN_210">
            <wire x2="4640" y1="1808" y2="2032" x1="4640" />
            <wire x2="4656" y1="2032" y2="2032" x1="4640" />
            <wire x2="4736" y1="1808" y2="1808" x1="4640" />
        </branch>
        <instance x="3456" y="1232" name="XLXI_63" orien="R0" />
        <instance x="3456" y="2272" name="XLXI_64" orien="R0" />
        <branch name="XLXN_213">
            <wire x2="2592" y1="512" y2="512" x1="2480" />
            <wire x2="2656" y1="512" y2="512" x1="2592" />
            <wire x2="2592" y1="512" y2="1040" x1="2592" />
            <wire x2="2832" y1="1040" y2="1040" x1="2592" />
            <wire x2="2896" y1="1040" y2="1040" x1="2832" />
            <wire x2="2832" y1="1040" y2="1296" x1="2832" />
            <wire x2="3392" y1="1296" y2="1296" x1="2832" />
            <wire x2="3456" y1="1040" y2="1040" x1="3392" />
            <wire x2="3392" y1="1040" y2="1296" x1="3392" />
        </branch>
        <branch name="XLXN_204">
            <wire x2="5296" y1="784" y2="784" x1="5200" />
            <wire x2="5200" y1="784" y2="848" x1="5200" />
            <wire x2="5600" y1="848" y2="848" x1="5200" />
            <wire x2="5600" y1="848" y2="912" x1="5600" />
            <wire x2="5600" y1="912" y2="912" x1="5536" />
        </branch>
        <branch name="XLXN_214">
            <wire x2="5776" y1="1056" y2="1056" x1="5536" />
            <wire x2="6016" y1="512" y2="512" x1="5776" />
            <wire x2="5776" y1="512" y2="848" x1="5776" />
            <wire x2="5776" y1="848" y2="1056" x1="5776" />
        </branch>
        <instance x="5280" y="1008" name="XLXI_65" orien="R0" />
        <branch name="XLXN_215">
            <wire x2="4976" y1="800" y2="800" x1="4880" />
            <wire x2="4976" y1="800" y2="1024" x1="4976" />
            <wire x2="5168" y1="1024" y2="1024" x1="4976" />
            <wire x2="5280" y1="1024" y2="1024" x1="5168" />
            <wire x2="4976" y1="1024" y2="1024" x1="4960" />
            <wire x2="5280" y1="880" y2="880" x1="5168" />
            <wire x2="5168" y1="880" y2="1024" x1="5168" />
        </branch>
        <branch name="XLXN_216">
            <wire x2="5056" y1="1808" y2="1808" x1="4960" />
            <wire x2="5056" y1="1808" y2="2032" x1="5056" />
            <wire x2="5200" y1="2032" y2="2032" x1="5056" />
            <wire x2="5056" y1="2032" y2="2032" x1="5040" />
            <wire x2="5280" y1="944" y2="944" x1="5200" />
            <wire x2="5200" y1="944" y2="1088" x1="5200" />
            <wire x2="5280" y1="1088" y2="1088" x1="5200" />
            <wire x2="5200" y1="1088" y2="1968" x1="5200" />
            <wire x2="5200" y1="1968" y2="2032" x1="5200" />
        </branch>
    </sheet>
</drawing>