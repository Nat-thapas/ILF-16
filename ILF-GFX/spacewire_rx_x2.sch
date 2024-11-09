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
        <signal name="XLXN_48" />
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
        <signal name="XLXN_92" />
        <signal name="XLXN_97(15:0)" />
        <signal name="XLXN_98(15:0)" />
        <signal name="XLXN_99(31:0)" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101" />
        <signal name="XLXN_103" />
        <signal name="CLK" />
        <signal name="XLXN_112" />
        <signal name="DATA(31:0)" />
        <signal name="RE" />
        <signal name="RST" />
        <signal name="EMPTY" />
        <signal name="FULL" />
        <signal name="XLXN_119" />
        <signal name="XLXN_120" />
        <signal name="XLXN_121" />
        <port polarity="Input" name="D1" />
        <port polarity="Input" name="S1" />
        <port polarity="Input" name="D2" />
        <port polarity="Input" name="S2" />
        <port polarity="Input" name="CLR" />
        <port polarity="Input" name="RXCLK" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="DATA(31:0)" />
        <port polarity="Input" name="RE" />
        <port polarity="Input" name="RST" />
        <port polarity="Output" name="EMPTY" />
        <port polarity="Output" name="FULL" />
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
        <blockdef name="rx_buffer_wrapper">
            <timestamp>2024-11-9T16:34:49</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
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
        <blockdef name="fdce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
            <blockpin signalname="XLXN_48" name="O" />
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
            <blockpin signalname="XLXN_48" name="CE" />
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
            <blockpin signalname="XLXN_48" name="CE" />
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
        <block symbolname="fd" name="XLXI_32">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_76" name="D" />
            <blockpin signalname="XLXN_90" name="Q" />
        </block>
        <block symbolname="gnd" name="XLXI_34">
            <blockpin signalname="XLXN_80" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_20">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_92" name="CE" />
            <blockpin signalname="XLXN_80" name="CLR" />
            <blockpin signalname="XLXN_42(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_98(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_27">
            <blockpin signalname="XLXN_58" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_19">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_119" name="CE" />
            <blockpin signalname="XLXN_58" name="CLR" />
            <blockpin signalname="XLXN_43(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_97(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="fd" name="XLXI_28">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_65" name="D" />
            <blockpin signalname="XLXN_64" name="Q" />
        </block>
        <block symbolname="and2b1" name="XLXI_39">
            <blockpin signalname="XLXN_88" name="I0" />
            <blockpin signalname="XLXN_64" name="I1" />
            <blockpin signalname="XLXN_119" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_40">
            <blockpin signalname="XLXN_78" name="I0" />
            <blockpin signalname="XLXN_90" name="I1" />
            <blockpin signalname="XLXN_92" name="O" />
        </block>
        <block symbolname="rx_buffer_wrapper" name="XLXI_45">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_99(31:0)" name="DIN(31:0)" />
            <blockpin signalname="DATA(31:0)" name="DO(31:0)" />
            <blockpin signalname="EMPTY" name="EMP" />
            <blockpin signalname="FULL" name="FULL" />
            <blockpin signalname="RE" name="RE" />
            <blockpin signalname="RST" name="RST" />
            <blockpin signalname="XLXN_103" name="WE" />
        </block>
        <block symbolname="bus_splicer" name="XLXI_46">
            <blockpin signalname="XLXN_98(15:0)" name="H(15:0)" />
            <blockpin signalname="XLXN_97(15:0)" name="L(15:0)" />
            <blockpin signalname="XLXN_99(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="and2" name="XLXI_47">
            <blockpin signalname="XLXN_101" name="I0" />
            <blockpin signalname="XLXN_100" name="I1" />
            <blockpin signalname="XLXN_103" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_49">
            <blockpin signalname="XLXN_103" name="I0" />
            <blockpin signalname="CLK" name="I1" />
            <blockpin signalname="XLXN_112" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_50">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_119" name="CE" />
            <blockpin signalname="XLXN_112" name="CLR" />
            <blockpin signalname="XLXN_120" name="D" />
            <blockpin signalname="XLXN_100" name="Q" />
        </block>
        <block symbolname="vcc" name="XLXI_51">
            <blockpin signalname="XLXN_120" name="P" />
        </block>
        <block symbolname="fdce" name="XLXI_52">
            <blockpin signalname="RXCLK" name="C" />
            <blockpin signalname="XLXN_92" name="CE" />
            <blockpin signalname="XLXN_112" name="CLR" />
            <blockpin signalname="XLXN_121" name="D" />
            <blockpin signalname="XLXN_101" name="Q" />
        </block>
        <block symbolname="vcc" name="XLXI_53">
            <blockpin signalname="XLXN_121" name="P" />
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
            <wire x2="2896" y1="2080" y2="2080" x1="2592" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="2592" y1="512" y2="512" x1="2480" />
            <wire x2="2656" y1="512" y2="512" x1="2592" />
            <wire x2="2592" y1="512" y2="1040" x1="2592" />
            <wire x2="2896" y1="1040" y2="1040" x1="2592" />
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
        <instance x="3456" y="2272" name="XLXI_32" orien="R0" />
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
            <wire x2="416" y1="432" y2="432" x1="384" />
            <wire x2="384" y1="432" y2="528" x1="384" />
            <wire x2="864" y1="528" y2="528" x1="384" />
            <wire x2="1424" y1="528" y2="528" x1="864" />
            <wire x2="384" y1="528" y2="912" x1="384" />
            <wire x2="416" y1="912" y2="912" x1="384" />
            <wire x2="384" y1="912" y2="1008" x1="384" />
            <wire x2="384" y1="1008" y2="1472" x1="384" />
            <wire x2="416" y1="1472" y2="1472" x1="384" />
            <wire x2="384" y1="1472" y2="1568" x1="384" />
            <wire x2="864" y1="1568" y2="1568" x1="384" />
            <wire x2="1424" y1="1568" y2="1568" x1="864" />
            <wire x2="384" y1="1568" y2="1952" x1="384" />
            <wire x2="416" y1="1952" y2="1952" x1="384" />
            <wire x2="384" y1="1952" y2="2000" x1="384" />
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
            <wire x2="4400" y1="576" y2="1056" x1="4400" />
            <wire x2="4400" y1="1056" y2="1264" x1="4400" />
            <wire x2="4656" y1="1056" y2="1056" x1="4400" />
            <wire x2="4656" y1="1616" y2="1616" x1="4400" />
            <wire x2="4400" y1="1616" y2="2096" x1="4400" />
            <wire x2="4400" y1="2096" y2="2304" x1="4400" />
            <wire x2="4656" y1="2096" y2="2096" x1="4400" />
        </branch>
        <instance x="3456" y="1232" name="XLXI_28" orien="R0" />
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
        <branch name="XLXN_92">
            <wire x2="4304" y1="1552" y2="1584" x1="4304" />
            <wire x2="4432" y1="1552" y2="1552" x1="4304" />
            <wire x2="4656" y1="1552" y2="1552" x1="4432" />
            <wire x2="4432" y1="1552" y2="2032" x1="4432" />
            <wire x2="4656" y1="2032" y2="2032" x1="4432" />
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
            <wire x2="5200" y1="1488" y2="1488" x1="5040" />
            <wire x2="5296" y1="512" y2="512" x1="5200" />
            <wire x2="5200" y1="512" y2="1488" x1="5200" />
        </branch>
        <branch name="XLXN_99(31:0)">
            <wire x2="5856" y1="448" y2="448" x1="5680" />
        </branch>
        <instance x="5856" y="736" name="XLXI_45" orien="R0">
        </instance>
        <instance x="5296" y="784" name="XLXI_47" orien="R0" />
        <branch name="XLXN_100">
            <wire x2="5120" y1="928" y2="928" x1="5040" />
            <wire x2="5120" y1="656" y2="928" x1="5120" />
            <wire x2="5296" y1="656" y2="656" x1="5120" />
        </branch>
        <branch name="XLXN_101">
            <wire x2="5152" y1="1968" y2="1968" x1="5040" />
            <wire x2="5152" y1="720" y2="1968" x1="5152" />
            <wire x2="5296" y1="720" y2="720" x1="5152" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="5600" y1="688" y2="688" x1="5552" />
            <wire x2="5600" y1="688" y2="800" x1="5600" />
            <wire x2="5600" y1="640" y2="688" x1="5600" />
            <wire x2="5856" y1="640" y2="640" x1="5600" />
        </branch>
        <instance x="5536" y="800" name="XLXI_49" orien="R90" />
        <branch name="CLK">
            <wire x2="5760" y1="2400" y2="2400" x1="256" />
            <wire x2="5760" y1="672" y2="672" x1="5664" />
            <wire x2="5760" y1="672" y2="2400" x1="5760" />
            <wire x2="5664" y1="672" y2="800" x1="5664" />
            <wire x2="5856" y1="512" y2="512" x1="5760" />
            <wire x2="5760" y1="512" y2="672" x1="5760" />
        </branch>
        <branch name="XLXN_112">
            <wire x2="4656" y1="1152" y2="1152" x1="4624" />
            <wire x2="4624" y1="1152" y2="1184" x1="4624" />
            <wire x2="5248" y1="1184" y2="1184" x1="4624" />
            <wire x2="5632" y1="1184" y2="1184" x1="5248" />
            <wire x2="5248" y1="1184" y2="2224" x1="5248" />
            <wire x2="4656" y1="2192" y2="2192" x1="4624" />
            <wire x2="4624" y1="2192" y2="2224" x1="4624" />
            <wire x2="5248" y1="2224" y2="2224" x1="4624" />
            <wire x2="5632" y1="1056" y2="1184" x1="5632" />
        </branch>
        <branch name="DATA(31:0)">
            <wire x2="6400" y1="448" y2="448" x1="6240" />
        </branch>
        <iomarker fontsize="28" x="6400" y="448" name="DATA(31:0)" orien="R0" />
        <branch name="RE">
            <wire x2="5792" y1="2480" y2="2480" x1="240" />
            <wire x2="5856" y1="576" y2="576" x1="5792" />
            <wire x2="5792" y1="576" y2="2480" x1="5792" />
        </branch>
        <branch name="RST">
            <wire x2="5824" y1="2560" y2="2560" x1="256" />
            <wire x2="5824" y1="704" y2="2560" x1="5824" />
            <wire x2="5856" y1="704" y2="704" x1="5824" />
        </branch>
        <iomarker fontsize="28" x="288" y="2000" name="RXCLK" orien="R180" />
        <branch name="EMPTY">
            <wire x2="6400" y1="576" y2="576" x1="6240" />
        </branch>
        <branch name="FULL">
            <wire x2="6400" y1="512" y2="512" x1="6240" />
        </branch>
        <iomarker fontsize="28" x="6400" y="512" name="FULL" orien="R0" />
        <iomarker fontsize="28" x="6400" y="576" name="EMPTY" orien="R0" />
        <instance x="4656" y="1184" name="XLXI_50" orien="R0" />
        <branch name="XLXN_119">
            <wire x2="4304" y1="512" y2="544" x1="4304" />
            <wire x2="4432" y1="512" y2="512" x1="4304" />
            <wire x2="4656" y1="512" y2="512" x1="4432" />
            <wire x2="4432" y1="512" y2="992" x1="4432" />
            <wire x2="4656" y1="992" y2="992" x1="4432" />
        </branch>
        <branch name="XLXN_120">
            <wire x2="4656" y1="928" y2="928" x1="4624" />
        </branch>
        <instance x="4624" y="992" name="XLXI_51" orien="R270" />
        <instance x="4656" y="2224" name="XLXI_52" orien="R0" />
        <branch name="XLXN_121">
            <wire x2="4656" y1="1968" y2="1968" x1="4624" />
        </branch>
        <instance x="4624" y="2032" name="XLXI_53" orien="R270" />
        <iomarker fontsize="28" x="256" y="2560" name="RST" orien="R180" />
        <iomarker fontsize="28" x="240" y="2480" name="RE" orien="R180" />
        <iomarker fontsize="28" x="256" y="2400" name="CLK" orien="R180" />
    </sheet>
</drawing>