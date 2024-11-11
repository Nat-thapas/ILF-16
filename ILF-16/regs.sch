<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DIN(15:0)" />
        <signal name="WAD(3:0)" />
        <signal name="WAD(0)" />
        <signal name="WAD(1)" />
        <signal name="WAD(2)" />
        <signal name="WAD(3)" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_132" />
        <signal name="XLXN_135" />
        <signal name="XLXN_136" />
        <signal name="XLXN_137" />
        <signal name="XLXN_138" />
        <signal name="XLXN_139" />
        <signal name="XLXN_140" />
        <signal name="XLXN_141" />
        <signal name="XLXN_142" />
        <signal name="XLXN_143" />
        <signal name="XLXN_144" />
        <signal name="XLXN_145" />
        <signal name="XLXN_146" />
        <signal name="XLXN_147" />
        <signal name="XLXN_148" />
        <signal name="XLXN_213" />
        <signal name="XLXN_230" />
        <signal name="XLXN_231" />
        <signal name="XLXN_232" />
        <signal name="XLXN_233" />
        <signal name="XLXN_234" />
        <signal name="XLXN_235" />
        <signal name="XLXN_236" />
        <signal name="XLXN_237" />
        <signal name="XLXN_238" />
        <signal name="XLXN_239" />
        <signal name="XLXN_240" />
        <signal name="XLXN_241" />
        <signal name="XLXN_242" />
        <signal name="XLXN_243" />
        <signal name="XLXN_244" />
        <signal name="WE" />
        <signal name="CLK" />
        <signal name="XLXN_471(15:0)" />
        <signal name="XLXN_472(15:0)" />
        <signal name="XLXN_473(15:0)" />
        <signal name="XLXN_475(15:0)" />
        <signal name="XLXN_476(15:0)" />
        <signal name="XLXN_494(15:0)" />
        <signal name="XLXN_478(15:0)" />
        <signal name="XLXN_479(15:0)" />
        <signal name="RAD2(3:0)" />
        <signal name="RAD1(3:0)" />
        <signal name="DO1(15:0)" />
        <signal name="DO2(15:0)" />
        <signal name="DO3(15:0)" />
        <signal name="RAD3(3:0)" />
        <signal name="XLXN_606(15:0)" />
        <signal name="XLXN_607(15:0)" />
        <signal name="XLXN_608(15:0)" />
        <signal name="XLXN_609(15:0)" />
        <signal name="XLXN_610(15:0)" />
        <signal name="XLXN_611(15:0)" />
        <signal name="XLXN_618(15:0)" />
        <signal name="XLXN_619(15:0)" />
        <port polarity="Input" name="DIN(15:0)" />
        <port polarity="Input" name="WAD(3:0)" />
        <port polarity="Input" name="WE" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RAD2(3:0)" />
        <port polarity="Input" name="RAD1(3:0)" />
        <port polarity="Output" name="DO1(15:0)" />
        <port polarity="Output" name="DO2(15:0)" />
        <port polarity="Output" name="DO3(15:0)" />
        <port polarity="Input" name="RAD3(3:0)" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="d4_16e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-1152" height="1088" />
            <line x2="320" y1="-1088" y2="-1088" x1="384" />
            <line x2="320" y1="-1024" y2="-1024" x1="384" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-1088" y2="-1088" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd16">
            <timestamp>2024-11-10T17:10:53</timestamp>
            <rect width="256" x="0" y="-64" height="64" />
            <line x2="320" y1="-32" y2="-32" x1="256" />
            <rect width="64" x="256" y="-44" height="24" />
        </blockdef>
        <blockdef name="mux16x1x16tb">
            <timestamp>2024-11-2T16:51:15</timestamp>
            <rect width="256" x="64" y="-1088" height="1088" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="384" y1="-1056" y2="-1056" x1="320" />
            <rect width="64" x="320" y="-1068" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
        </blockdef>
        <block symbolname="d4_16e" name="Write_Address_Decoder">
            <blockpin signalname="WAD(0)" name="A0" />
            <blockpin signalname="WAD(1)" name="A1" />
            <blockpin signalname="WAD(2)" name="A2" />
            <blockpin signalname="WAD(3)" name="A3" />
            <blockpin signalname="XLXN_213" name="E" />
            <blockpin name="D0" />
            <blockpin signalname="XLXN_230" name="D1" />
            <blockpin signalname="XLXN_239" name="D10" />
            <blockpin signalname="XLXN_240" name="D11" />
            <blockpin signalname="XLXN_241" name="D12" />
            <blockpin signalname="XLXN_242" name="D13" />
            <blockpin signalname="XLXN_243" name="D14" />
            <blockpin signalname="XLXN_244" name="D15" />
            <blockpin signalname="XLXN_231" name="D2" />
            <blockpin signalname="XLXN_232" name="D3" />
            <blockpin signalname="XLXN_233" name="D4" />
            <blockpin signalname="XLXN_234" name="D5" />
            <blockpin signalname="XLXN_235" name="D6" />
            <blockpin signalname="XLXN_236" name="D7" />
            <blockpin signalname="XLXN_237" name="D8" />
            <blockpin signalname="XLXN_238" name="D9" />
        </block>
        <block symbolname="fd16ce" name="XLXI_4">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_132" name="CE" />
            <blockpin signalname="XLXN_3" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_607(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_3" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_6">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_135" name="CE" />
            <blockpin signalname="XLXN_4" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_608(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_4" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_8">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_136" name="CE" />
            <blockpin signalname="XLXN_5" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_609(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_9">
            <blockpin signalname="XLXN_5" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_10">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_137" name="CE" />
            <blockpin signalname="XLXN_6" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_610(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_11">
            <blockpin signalname="XLXN_6" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_12">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_138" name="CE" />
            <blockpin signalname="XLXN_7" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_611(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_13">
            <blockpin signalname="XLXN_7" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_14">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_139" name="CE" />
            <blockpin signalname="XLXN_8" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_618(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="XLXN_8" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_16">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_140" name="CE" />
            <blockpin signalname="XLXN_9" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_619(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_17">
            <blockpin signalname="XLXN_9" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_18">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_141" name="CE" />
            <blockpin signalname="XLXN_10" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_471(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_19">
            <blockpin signalname="XLXN_10" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_20">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_142" name="CE" />
            <blockpin signalname="XLXN_11" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_472(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_21">
            <blockpin signalname="XLXN_11" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_22">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_143" name="CE" />
            <blockpin signalname="XLXN_12" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_473(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_23">
            <blockpin signalname="XLXN_12" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_24">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_144" name="CE" />
            <blockpin signalname="XLXN_13" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_475(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_25">
            <blockpin signalname="XLXN_13" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_26">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_145" name="CE" />
            <blockpin signalname="XLXN_14" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_476(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_27">
            <blockpin signalname="XLXN_14" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_28">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_146" name="CE" />
            <blockpin signalname="XLXN_15" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_494(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_29">
            <blockpin signalname="XLXN_15" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_30">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_147" name="CE" />
            <blockpin signalname="XLXN_16" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_478(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_31">
            <blockpin signalname="XLXN_16" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_32">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_148" name="CE" />
            <blockpin signalname="XLXN_17" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_479(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_33">
            <blockpin signalname="XLXN_17" name="G" />
        </block>
        <block symbolname="and2" name="XLXI_190">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_230" name="I1" />
            <blockpin signalname="XLXN_132" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_192">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_231" name="I1" />
            <blockpin signalname="XLXN_135" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_193">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_232" name="I1" />
            <blockpin signalname="XLXN_136" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_194">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_233" name="I1" />
            <blockpin signalname="XLXN_137" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_195">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_234" name="I1" />
            <blockpin signalname="XLXN_138" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_196">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_235" name="I1" />
            <blockpin signalname="XLXN_139" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_197">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_236" name="I1" />
            <blockpin signalname="XLXN_140" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_198">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_237" name="I1" />
            <blockpin signalname="XLXN_141" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_199">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_238" name="I1" />
            <blockpin signalname="XLXN_142" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_200">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_239" name="I1" />
            <blockpin signalname="XLXN_143" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_201">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_240" name="I1" />
            <blockpin signalname="XLXN_144" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_202">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_241" name="I1" />
            <blockpin signalname="XLXN_145" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_203">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_242" name="I1" />
            <blockpin signalname="XLXN_146" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_204">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_243" name="I1" />
            <blockpin signalname="XLXN_147" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_205">
            <blockpin signalname="WE" name="I0" />
            <blockpin signalname="XLXN_244" name="I1" />
            <blockpin signalname="XLXN_148" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_252">
            <blockpin signalname="XLXN_213" name="P" />
        </block>
        <block symbolname="gnd16" name="R0_Data">
            <blockpin signalname="XLXN_606(15:0)" name="GNDO(15:0)" />
        </block>
        <block symbolname="mux16x1x16tb" name="Output_1_Data_Selector">
            <blockpin signalname="XLXN_606(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_607(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_473(15:0)" name="D10(15:0)" />
            <blockpin signalname="XLXN_475(15:0)" name="D11(15:0)" />
            <blockpin signalname="XLXN_476(15:0)" name="D12(15:0)" />
            <blockpin signalname="XLXN_494(15:0)" name="D13(15:0)" />
            <blockpin signalname="XLXN_478(15:0)" name="D14(15:0)" />
            <blockpin signalname="XLXN_479(15:0)" name="D15(15:0)" />
            <blockpin signalname="XLXN_608(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_609(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_610(15:0)" name="D4(15:0)" />
            <blockpin signalname="XLXN_611(15:0)" name="D5(15:0)" />
            <blockpin signalname="XLXN_618(15:0)" name="D6(15:0)" />
            <blockpin signalname="XLXN_619(15:0)" name="D7(15:0)" />
            <blockpin signalname="XLXN_471(15:0)" name="D8(15:0)" />
            <blockpin signalname="XLXN_472(15:0)" name="D9(15:0)" />
            <blockpin signalname="DO1(15:0)" name="O(15:0)" />
            <blockpin signalname="RAD1(3:0)" name="S(3:0)" />
        </block>
        <block symbolname="mux16x1x16tb" name="Output_2_Data_Selector">
            <blockpin signalname="XLXN_606(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_607(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_473(15:0)" name="D10(15:0)" />
            <blockpin signalname="XLXN_475(15:0)" name="D11(15:0)" />
            <blockpin signalname="XLXN_476(15:0)" name="D12(15:0)" />
            <blockpin signalname="XLXN_494(15:0)" name="D13(15:0)" />
            <blockpin signalname="XLXN_478(15:0)" name="D14(15:0)" />
            <blockpin signalname="XLXN_479(15:0)" name="D15(15:0)" />
            <blockpin signalname="XLXN_608(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_609(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_610(15:0)" name="D4(15:0)" />
            <blockpin signalname="XLXN_611(15:0)" name="D5(15:0)" />
            <blockpin signalname="XLXN_618(15:0)" name="D6(15:0)" />
            <blockpin signalname="XLXN_619(15:0)" name="D7(15:0)" />
            <blockpin signalname="XLXN_471(15:0)" name="D8(15:0)" />
            <blockpin signalname="XLXN_472(15:0)" name="D9(15:0)" />
            <blockpin signalname="DO2(15:0)" name="O(15:0)" />
            <blockpin signalname="RAD2(3:0)" name="S(3:0)" />
        </block>
        <block symbolname="mux16x1x16tb" name="Output_3_Data_Selector">
            <blockpin signalname="XLXN_606(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_607(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_473(15:0)" name="D10(15:0)" />
            <blockpin signalname="XLXN_475(15:0)" name="D11(15:0)" />
            <blockpin signalname="XLXN_476(15:0)" name="D12(15:0)" />
            <blockpin signalname="XLXN_494(15:0)" name="D13(15:0)" />
            <blockpin signalname="XLXN_478(15:0)" name="D14(15:0)" />
            <blockpin signalname="XLXN_479(15:0)" name="D15(15:0)" />
            <blockpin signalname="XLXN_608(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_609(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_610(15:0)" name="D4(15:0)" />
            <blockpin signalname="XLXN_611(15:0)" name="D5(15:0)" />
            <blockpin signalname="XLXN_618(15:0)" name="D6(15:0)" />
            <blockpin signalname="XLXN_619(15:0)" name="D7(15:0)" />
            <blockpin signalname="XLXN_471(15:0)" name="D8(15:0)" />
            <blockpin signalname="XLXN_472(15:0)" name="D9(15:0)" />
            <blockpin signalname="DO3(15:0)" name="O(15:0)" />
            <blockpin signalname="RAD3(3:0)" name="S(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="7040">
        <branch name="DIN(15:0)">
            <wire x2="1392" y1="480" y2="480" x1="320" />
            <wire x2="1392" y1="480" y2="944" x1="1392" />
            <wire x2="1776" y1="944" y2="944" x1="1392" />
            <wire x2="1392" y1="944" y2="1344" x1="1392" />
            <wire x2="1776" y1="1344" y2="1344" x1="1392" />
            <wire x2="1392" y1="1344" y2="1744" x1="1392" />
            <wire x2="1776" y1="1744" y2="1744" x1="1392" />
            <wire x2="1392" y1="1744" y2="2144" x1="1392" />
            <wire x2="1776" y1="2144" y2="2144" x1="1392" />
            <wire x2="1392" y1="2144" y2="2544" x1="1392" />
            <wire x2="1776" y1="2544" y2="2544" x1="1392" />
            <wire x2="1392" y1="2544" y2="2944" x1="1392" />
            <wire x2="1776" y1="2944" y2="2944" x1="1392" />
            <wire x2="1392" y1="2944" y2="3344" x1="1392" />
            <wire x2="1776" y1="3344" y2="3344" x1="1392" />
            <wire x2="1392" y1="3344" y2="3744" x1="1392" />
            <wire x2="1776" y1="3744" y2="3744" x1="1392" />
            <wire x2="1392" y1="3744" y2="4144" x1="1392" />
            <wire x2="1776" y1="4144" y2="4144" x1="1392" />
            <wire x2="1392" y1="4144" y2="4544" x1="1392" />
            <wire x2="1776" y1="4544" y2="4544" x1="1392" />
            <wire x2="1392" y1="4544" y2="4944" x1="1392" />
            <wire x2="1776" y1="4944" y2="4944" x1="1392" />
            <wire x2="1392" y1="4944" y2="5344" x1="1392" />
            <wire x2="1776" y1="5344" y2="5344" x1="1392" />
            <wire x2="1392" y1="5344" y2="5744" x1="1392" />
            <wire x2="1776" y1="5744" y2="5744" x1="1392" />
            <wire x2="1392" y1="5744" y2="6144" x1="1392" />
            <wire x2="1776" y1="6144" y2="6144" x1="1392" />
            <wire x2="1392" y1="6144" y2="6544" x1="1392" />
            <wire x2="1776" y1="6544" y2="6544" x1="1392" />
        </branch>
        <branch name="WAD(3:0)">
            <wire x2="432" y1="400" y2="400" x1="320" />
            <wire x2="432" y1="400" y2="864" x1="432" />
            <wire x2="432" y1="864" y2="928" x1="432" />
            <wire x2="432" y1="928" y2="992" x1="432" />
            <wire x2="432" y1="992" y2="1056" x1="432" />
        </branch>
        <bustap x2="528" y1="864" y2="864" x1="432" />
        <branch name="WAD(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="864" type="branch" />
            <wire x2="544" y1="864" y2="864" x1="528" />
            <wire x2="576" y1="864" y2="864" x1="544" />
        </branch>
        <bustap x2="528" y1="928" y2="928" x1="432" />
        <branch name="WAD(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="928" type="branch" />
            <wire x2="544" y1="928" y2="928" x1="528" />
            <wire x2="576" y1="928" y2="928" x1="544" />
        </branch>
        <bustap x2="528" y1="992" y2="992" x1="432" />
        <branch name="WAD(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="992" type="branch" />
            <wire x2="544" y1="992" y2="992" x1="528" />
            <wire x2="576" y1="992" y2="992" x1="544" />
        </branch>
        <bustap x2="528" y1="1056" y2="1056" x1="432" />
        <branch name="WAD(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="1056" type="branch" />
            <wire x2="544" y1="1056" y2="1056" x1="528" />
            <wire x2="576" y1="1056" y2="1056" x1="544" />
        </branch>
        <instance x="576" y="1952" name="Write_Address_Decoder" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="-1248" type="instance" />
        </instance>
        <branch name="XLXN_3">
            <wire x2="1776" y1="1168" y2="1168" x1="1744" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1776" y1="1568" y2="1568" x1="1744" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1776" y1="1968" y2="1968" x1="1744" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1776" y1="2368" y2="2368" x1="1744" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1776" y1="2768" y2="2768" x1="1744" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1776" y1="3168" y2="3168" x1="1744" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1776" y1="3568" y2="3568" x1="1744" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1776" y1="3968" y2="3968" x1="1744" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1776" y1="4368" y2="4368" x1="1744" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1776" y1="4768" y2="4768" x1="1744" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1776" y1="5168" y2="5168" x1="1744" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1776" y1="5568" y2="5568" x1="1744" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1776" y1="5968" y2="5968" x1="1744" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1776" y1="6368" y2="6368" x1="1744" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1776" y1="6768" y2="6768" x1="1744" />
        </branch>
        <branch name="XLXN_132">
            <wire x2="1776" y1="1008" y2="1008" x1="1744" />
        </branch>
        <branch name="XLXN_135">
            <wire x2="1776" y1="1408" y2="1408" x1="1744" />
        </branch>
        <branch name="XLXN_136">
            <wire x2="1776" y1="1808" y2="1808" x1="1744" />
        </branch>
        <branch name="XLXN_137">
            <wire x2="1776" y1="2208" y2="2208" x1="1744" />
        </branch>
        <branch name="XLXN_138">
            <wire x2="1776" y1="2608" y2="2608" x1="1744" />
        </branch>
        <branch name="XLXN_139">
            <wire x2="1776" y1="3008" y2="3008" x1="1744" />
        </branch>
        <branch name="XLXN_140">
            <wire x2="1776" y1="3408" y2="3408" x1="1744" />
        </branch>
        <branch name="XLXN_141">
            <wire x2="1776" y1="3808" y2="3808" x1="1744" />
        </branch>
        <branch name="XLXN_142">
            <wire x2="1776" y1="4208" y2="4208" x1="1744" />
        </branch>
        <branch name="XLXN_143">
            <wire x2="1776" y1="4608" y2="4608" x1="1744" />
        </branch>
        <branch name="XLXN_144">
            <wire x2="1776" y1="5008" y2="5008" x1="1744" />
        </branch>
        <branch name="XLXN_145">
            <wire x2="1776" y1="5408" y2="5408" x1="1744" />
        </branch>
        <branch name="XLXN_146">
            <wire x2="1776" y1="5808" y2="5808" x1="1744" />
        </branch>
        <branch name="XLXN_147">
            <wire x2="1776" y1="6208" y2="6208" x1="1744" />
        </branch>
        <branch name="XLXN_148">
            <wire x2="1776" y1="6608" y2="6608" x1="1744" />
        </branch>
        <instance x="1776" y="1200" name="XLXI_4" orien="R0" />
        <instance x="1616" y="1104" name="XLXI_5" orien="R90" />
        <instance x="1776" y="1600" name="XLXI_6" orien="R0" />
        <instance x="1616" y="1504" name="XLXI_7" orien="R90" />
        <instance x="1776" y="2000" name="XLXI_8" orien="R0" />
        <instance x="1616" y="1904" name="XLXI_9" orien="R90" />
        <instance x="1776" y="2400" name="XLXI_10" orien="R0" />
        <instance x="1616" y="2304" name="XLXI_11" orien="R90" />
        <instance x="1776" y="2800" name="XLXI_12" orien="R0" />
        <instance x="1616" y="2704" name="XLXI_13" orien="R90" />
        <instance x="1776" y="3200" name="XLXI_14" orien="R0" />
        <instance x="1616" y="3104" name="XLXI_15" orien="R90" />
        <instance x="1776" y="3600" name="XLXI_16" orien="R0" />
        <instance x="1616" y="3504" name="XLXI_17" orien="R90" />
        <instance x="1776" y="4000" name="XLXI_18" orien="R0" />
        <instance x="1616" y="3904" name="XLXI_19" orien="R90" />
        <instance x="1776" y="4400" name="XLXI_20" orien="R0" />
        <instance x="1616" y="4304" name="XLXI_21" orien="R90" />
        <instance x="1776" y="4800" name="XLXI_22" orien="R0" />
        <instance x="1616" y="4704" name="XLXI_23" orien="R90" />
        <instance x="1776" y="5200" name="XLXI_24" orien="R0" />
        <instance x="1616" y="5104" name="XLXI_25" orien="R90" />
        <instance x="1776" y="5600" name="XLXI_26" orien="R0" />
        <instance x="1616" y="5504" name="XLXI_27" orien="R90" />
        <instance x="1776" y="6000" name="XLXI_28" orien="R0" />
        <instance x="1616" y="5904" name="XLXI_29" orien="R90" />
        <instance x="1776" y="6400" name="XLXI_30" orien="R0" />
        <instance x="1616" y="6304" name="XLXI_31" orien="R90" />
        <instance x="1776" y="6800" name="XLXI_32" orien="R0" />
        <instance x="1616" y="6704" name="XLXI_33" orien="R90" />
        <instance x="1488" y="1104" name="XLXI_190" orien="R0" />
        <instance x="1488" y="1504" name="XLXI_192" orien="R0" />
        <instance x="1488" y="1904" name="XLXI_193" orien="R0" />
        <instance x="1488" y="2304" name="XLXI_194" orien="R0" />
        <instance x="1488" y="2704" name="XLXI_195" orien="R0" />
        <instance x="1488" y="3104" name="XLXI_196" orien="R0" />
        <instance x="1488" y="3504" name="XLXI_197" orien="R0" />
        <instance x="1488" y="3904" name="XLXI_198" orien="R0" />
        <instance x="1488" y="4304" name="XLXI_199" orien="R0" />
        <instance x="1488" y="4704" name="XLXI_200" orien="R0" />
        <instance x="1488" y="5104" name="XLXI_201" orien="R0" />
        <instance x="1488" y="5504" name="XLXI_202" orien="R0" />
        <instance x="1488" y="5904" name="XLXI_203" orien="R0" />
        <instance x="1488" y="6304" name="XLXI_204" orien="R0" />
        <instance x="1488" y="6704" name="XLXI_205" orien="R0" />
        <instance x="544" y="1888" name="XLXI_252" orien="R270" />
        <branch name="XLXN_213">
            <wire x2="576" y1="1824" y2="1824" x1="544" />
        </branch>
        <branch name="XLXN_230">
            <wire x2="1360" y1="928" y2="928" x1="960" />
            <wire x2="1360" y1="928" y2="976" x1="1360" />
            <wire x2="1488" y1="976" y2="976" x1="1360" />
        </branch>
        <branch name="XLXN_231">
            <wire x2="1344" y1="992" y2="992" x1="960" />
            <wire x2="1344" y1="992" y2="1376" x1="1344" />
            <wire x2="1488" y1="1376" y2="1376" x1="1344" />
        </branch>
        <branch name="XLXN_232">
            <wire x2="1328" y1="1056" y2="1056" x1="960" />
            <wire x2="1328" y1="1056" y2="1776" x1="1328" />
            <wire x2="1488" y1="1776" y2="1776" x1="1328" />
        </branch>
        <branch name="XLXN_233">
            <wire x2="1312" y1="1120" y2="1120" x1="960" />
            <wire x2="1312" y1="1120" y2="2176" x1="1312" />
            <wire x2="1488" y1="2176" y2="2176" x1="1312" />
        </branch>
        <branch name="XLXN_234">
            <wire x2="1296" y1="1184" y2="1184" x1="960" />
            <wire x2="1296" y1="1184" y2="2576" x1="1296" />
            <wire x2="1488" y1="2576" y2="2576" x1="1296" />
        </branch>
        <branch name="XLXN_235">
            <wire x2="1280" y1="1248" y2="1248" x1="960" />
            <wire x2="1280" y1="1248" y2="2976" x1="1280" />
            <wire x2="1488" y1="2976" y2="2976" x1="1280" />
        </branch>
        <branch name="XLXN_236">
            <wire x2="1264" y1="1312" y2="1312" x1="960" />
            <wire x2="1264" y1="1312" y2="3376" x1="1264" />
            <wire x2="1488" y1="3376" y2="3376" x1="1264" />
        </branch>
        <branch name="XLXN_237">
            <wire x2="1248" y1="1376" y2="1376" x1="960" />
            <wire x2="1248" y1="1376" y2="3776" x1="1248" />
            <wire x2="1488" y1="3776" y2="3776" x1="1248" />
        </branch>
        <branch name="XLXN_238">
            <wire x2="1232" y1="1440" y2="1440" x1="960" />
            <wire x2="1232" y1="1440" y2="4176" x1="1232" />
            <wire x2="1488" y1="4176" y2="4176" x1="1232" />
        </branch>
        <branch name="XLXN_239">
            <wire x2="1216" y1="1504" y2="1504" x1="960" />
            <wire x2="1216" y1="1504" y2="4576" x1="1216" />
            <wire x2="1488" y1="4576" y2="4576" x1="1216" />
        </branch>
        <branch name="XLXN_240">
            <wire x2="1200" y1="1568" y2="1568" x1="960" />
            <wire x2="1200" y1="1568" y2="4976" x1="1200" />
            <wire x2="1488" y1="4976" y2="4976" x1="1200" />
        </branch>
        <branch name="XLXN_241">
            <wire x2="1184" y1="1632" y2="1632" x1="960" />
            <wire x2="1184" y1="1632" y2="5376" x1="1184" />
            <wire x2="1488" y1="5376" y2="5376" x1="1184" />
        </branch>
        <branch name="XLXN_242">
            <wire x2="1168" y1="1696" y2="1696" x1="960" />
            <wire x2="1168" y1="1696" y2="5776" x1="1168" />
            <wire x2="1488" y1="5776" y2="5776" x1="1168" />
        </branch>
        <branch name="XLXN_243">
            <wire x2="1152" y1="1760" y2="1760" x1="960" />
            <wire x2="1152" y1="1760" y2="6176" x1="1152" />
            <wire x2="1488" y1="6176" y2="6176" x1="1152" />
        </branch>
        <branch name="XLXN_244">
            <wire x2="1136" y1="1824" y2="1824" x1="960" />
            <wire x2="1136" y1="1824" y2="6576" x1="1136" />
            <wire x2="1488" y1="6576" y2="6576" x1="1136" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="984" y="864">R0 is a zero register, it is not  
            writable</text>
        <branch name="WE">
            <wire x2="1424" y1="560" y2="560" x1="240" />
            <wire x2="1424" y1="560" y2="1040" x1="1424" />
            <wire x2="1488" y1="1040" y2="1040" x1="1424" />
            <wire x2="1424" y1="1040" y2="1440" x1="1424" />
            <wire x2="1488" y1="1440" y2="1440" x1="1424" />
            <wire x2="1424" y1="1440" y2="1840" x1="1424" />
            <wire x2="1488" y1="1840" y2="1840" x1="1424" />
            <wire x2="1424" y1="1840" y2="2240" x1="1424" />
            <wire x2="1488" y1="2240" y2="2240" x1="1424" />
            <wire x2="1424" y1="2240" y2="2640" x1="1424" />
            <wire x2="1488" y1="2640" y2="2640" x1="1424" />
            <wire x2="1424" y1="2640" y2="3040" x1="1424" />
            <wire x2="1488" y1="3040" y2="3040" x1="1424" />
            <wire x2="1424" y1="3040" y2="3440" x1="1424" />
            <wire x2="1488" y1="3440" y2="3440" x1="1424" />
            <wire x2="1424" y1="3440" y2="3840" x1="1424" />
            <wire x2="1488" y1="3840" y2="3840" x1="1424" />
            <wire x2="1424" y1="3840" y2="4240" x1="1424" />
            <wire x2="1488" y1="4240" y2="4240" x1="1424" />
            <wire x2="1424" y1="4240" y2="4640" x1="1424" />
            <wire x2="1488" y1="4640" y2="4640" x1="1424" />
            <wire x2="1424" y1="4640" y2="5040" x1="1424" />
            <wire x2="1488" y1="5040" y2="5040" x1="1424" />
            <wire x2="1424" y1="5040" y2="5440" x1="1424" />
            <wire x2="1488" y1="5440" y2="5440" x1="1424" />
            <wire x2="1424" y1="5440" y2="5840" x1="1424" />
            <wire x2="1488" y1="5840" y2="5840" x1="1424" />
            <wire x2="1424" y1="5840" y2="6240" x1="1424" />
            <wire x2="1488" y1="6240" y2="6240" x1="1424" />
            <wire x2="1424" y1="6240" y2="6640" x1="1424" />
            <wire x2="1488" y1="6640" y2="6640" x1="1424" />
        </branch>
        <branch name="CLK">
            <wire x2="1456" y1="640" y2="640" x1="256" />
            <wire x2="1456" y1="640" y2="1072" x1="1456" />
            <wire x2="1776" y1="1072" y2="1072" x1="1456" />
            <wire x2="1456" y1="1072" y2="1472" x1="1456" />
            <wire x2="1776" y1="1472" y2="1472" x1="1456" />
            <wire x2="1456" y1="1472" y2="1872" x1="1456" />
            <wire x2="1776" y1="1872" y2="1872" x1="1456" />
            <wire x2="1456" y1="1872" y2="2272" x1="1456" />
            <wire x2="1776" y1="2272" y2="2272" x1="1456" />
            <wire x2="1456" y1="2272" y2="2672" x1="1456" />
            <wire x2="1776" y1="2672" y2="2672" x1="1456" />
            <wire x2="1456" y1="2672" y2="3072" x1="1456" />
            <wire x2="1776" y1="3072" y2="3072" x1="1456" />
            <wire x2="1456" y1="3072" y2="3472" x1="1456" />
            <wire x2="1776" y1="3472" y2="3472" x1="1456" />
            <wire x2="1456" y1="3472" y2="3872" x1="1456" />
            <wire x2="1776" y1="3872" y2="3872" x1="1456" />
            <wire x2="1456" y1="3872" y2="4272" x1="1456" />
            <wire x2="1776" y1="4272" y2="4272" x1="1456" />
            <wire x2="1456" y1="4272" y2="4672" x1="1456" />
            <wire x2="1776" y1="4672" y2="4672" x1="1456" />
            <wire x2="1456" y1="4672" y2="5072" x1="1456" />
            <wire x2="1776" y1="5072" y2="5072" x1="1456" />
            <wire x2="1456" y1="5072" y2="5472" x1="1456" />
            <wire x2="1776" y1="5472" y2="5472" x1="1456" />
            <wire x2="1456" y1="5472" y2="5872" x1="1456" />
            <wire x2="1776" y1="5872" y2="5872" x1="1456" />
            <wire x2="1456" y1="5872" y2="6272" x1="1456" />
            <wire x2="1776" y1="6272" y2="6272" x1="1456" />
            <wire x2="1456" y1="6272" y2="6672" x1="1456" />
            <wire x2="1776" y1="6672" y2="6672" x1="1456" />
        </branch>
        <branch name="XLXN_471(15:0)">
            <wire x2="2448" y1="3744" y2="3744" x1="2160" />
            <wire x2="2976" y1="1184" y2="1184" x1="2448" />
            <wire x2="2448" y1="1184" y2="2400" x1="2448" />
            <wire x2="2976" y1="2400" y2="2400" x1="2448" />
            <wire x2="2448" y1="2400" y2="3632" x1="2448" />
            <wire x2="2448" y1="3632" y2="3744" x1="2448" />
            <wire x2="2976" y1="3632" y2="3632" x1="2448" />
        </branch>
        <branch name="XLXN_472(15:0)">
            <wire x2="2480" y1="4144" y2="4144" x1="2160" />
            <wire x2="2976" y1="1248" y2="1248" x1="2480" />
            <wire x2="2480" y1="1248" y2="2464" x1="2480" />
            <wire x2="2976" y1="2464" y2="2464" x1="2480" />
            <wire x2="2480" y1="2464" y2="3696" x1="2480" />
            <wire x2="2480" y1="3696" y2="4144" x1="2480" />
            <wire x2="2976" y1="3696" y2="3696" x1="2480" />
        </branch>
        <branch name="XLXN_473(15:0)">
            <wire x2="2512" y1="4544" y2="4544" x1="2160" />
            <wire x2="2976" y1="1312" y2="1312" x1="2512" />
            <wire x2="2512" y1="1312" y2="2528" x1="2512" />
            <wire x2="2976" y1="2528" y2="2528" x1="2512" />
            <wire x2="2512" y1="2528" y2="3760" x1="2512" />
            <wire x2="2512" y1="3760" y2="4544" x1="2512" />
            <wire x2="2976" y1="3760" y2="3760" x1="2512" />
        </branch>
        <branch name="XLXN_475(15:0)">
            <wire x2="2544" y1="4944" y2="4944" x1="2160" />
            <wire x2="2976" y1="1376" y2="1376" x1="2544" />
            <wire x2="2544" y1="1376" y2="2592" x1="2544" />
            <wire x2="2976" y1="2592" y2="2592" x1="2544" />
            <wire x2="2544" y1="2592" y2="3824" x1="2544" />
            <wire x2="2544" y1="3824" y2="4944" x1="2544" />
            <wire x2="2976" y1="3824" y2="3824" x1="2544" />
        </branch>
        <branch name="XLXN_476(15:0)">
            <wire x2="2576" y1="5344" y2="5344" x1="2160" />
            <wire x2="2976" y1="1440" y2="1440" x1="2576" />
            <wire x2="2576" y1="1440" y2="2656" x1="2576" />
            <wire x2="2976" y1="2656" y2="2656" x1="2576" />
            <wire x2="2576" y1="2656" y2="3888" x1="2576" />
            <wire x2="2576" y1="3888" y2="5344" x1="2576" />
            <wire x2="2976" y1="3888" y2="3888" x1="2576" />
        </branch>
        <branch name="XLXN_494(15:0)">
            <wire x2="2608" y1="5744" y2="5744" x1="2160" />
            <wire x2="2976" y1="1504" y2="1504" x1="2608" />
            <wire x2="2608" y1="1504" y2="2720" x1="2608" />
            <wire x2="2976" y1="2720" y2="2720" x1="2608" />
            <wire x2="2608" y1="2720" y2="3952" x1="2608" />
            <wire x2="2608" y1="3952" y2="5744" x1="2608" />
            <wire x2="2976" y1="3952" y2="3952" x1="2608" />
        </branch>
        <branch name="XLXN_478(15:0)">
            <wire x2="2640" y1="6144" y2="6144" x1="2160" />
            <wire x2="2976" y1="1568" y2="1568" x1="2640" />
            <wire x2="2640" y1="1568" y2="2784" x1="2640" />
            <wire x2="2976" y1="2784" y2="2784" x1="2640" />
            <wire x2="2640" y1="2784" y2="4016" x1="2640" />
            <wire x2="2640" y1="4016" y2="6144" x1="2640" />
            <wire x2="2976" y1="4016" y2="4016" x1="2640" />
        </branch>
        <branch name="XLXN_479(15:0)">
            <wire x2="2672" y1="6544" y2="6544" x1="2160" />
            <wire x2="2976" y1="1632" y2="1632" x1="2672" />
            <wire x2="2672" y1="1632" y2="2848" x1="2672" />
            <wire x2="2976" y1="2848" y2="2848" x1="2672" />
            <wire x2="2672" y1="2848" y2="4080" x1="2672" />
            <wire x2="2672" y1="4080" y2="6544" x1="2672" />
            <wire x2="2976" y1="4080" y2="4080" x1="2672" />
        </branch>
        <branch name="RAD2(3:0)">
            <wire x2="2832" y1="240" y2="240" x1="336" />
            <wire x2="2832" y1="240" y2="2912" x1="2832" />
            <wire x2="2976" y1="2912" y2="2912" x1="2832" />
        </branch>
        <branch name="RAD1(3:0)">
            <wire x2="2880" y1="160" y2="160" x1="336" />
            <wire x2="2880" y1="160" y2="1696" x1="2880" />
            <wire x2="2976" y1="1696" y2="1696" x1="2880" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="2048" y="544">(All Zeros)</text>
        <instance x="2976" y="1728" name="Output_1_Data_Selector" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="-1184" type="instance" />
        </instance>
        <branch name="DO1(15:0)">
            <wire x2="3440" y1="672" y2="672" x1="3360" />
        </branch>
        <instance x="2976" y="2944" name="Output_2_Data_Selector" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="32" y="-1184" type="instance" />
        </instance>
        <branch name="DO2(15:0)">
            <wire x2="3440" y1="1888" y2="1888" x1="3360" />
        </branch>
        <branch name="DO3(15:0)">
            <wire x2="3440" y1="3120" y2="3120" x1="3360" />
        </branch>
        <iomarker fontsize="28" x="240" y="560" name="WE" orien="R180" />
        <iomarker fontsize="28" x="256" y="640" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="320" y="400" name="WAD(3:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="480" name="DIN(15:0)" orien="R180" />
        <iomarker fontsize="28" x="3440" y="672" name="DO1(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3440" y="1888" name="DO2(15:0)" orien="R0" />
        <iomarker fontsize="28" x="336" y="160" name="RAD1(3:0)" orien="R180" />
        <iomarker fontsize="28" x="336" y="240" name="RAD2(3:0)" orien="R180" />
        <branch name="RAD3(3:0)">
            <wire x2="2784" y1="320" y2="320" x1="336" />
            <wire x2="2784" y1="320" y2="4144" x1="2784" />
            <wire x2="2976" y1="4144" y2="4144" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="336" y="320" name="RAD3(3:0)" orien="R180" />
        <instance x="2976" y="4176" name="Output_3_Data_Selector" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="32" y="-1184" type="instance" />
        </instance>
        <branch name="XLXN_606(15:0)">
            <wire x2="2192" y1="672" y2="672" x1="2160" />
            <wire x2="2976" y1="672" y2="672" x1="2192" />
            <wire x2="2192" y1="672" y2="1888" x1="2192" />
            <wire x2="2976" y1="1888" y2="1888" x1="2192" />
            <wire x2="2192" y1="1888" y2="3120" x1="2192" />
            <wire x2="2976" y1="3120" y2="3120" x1="2192" />
        </branch>
        <branch name="XLXN_607(15:0)">
            <wire x2="2224" y1="944" y2="944" x1="2160" />
            <wire x2="2224" y1="944" y2="1952" x1="2224" />
            <wire x2="2976" y1="1952" y2="1952" x1="2224" />
            <wire x2="2224" y1="1952" y2="3184" x1="2224" />
            <wire x2="2976" y1="3184" y2="3184" x1="2224" />
            <wire x2="2976" y1="736" y2="736" x1="2224" />
            <wire x2="2224" y1="736" y2="944" x1="2224" />
        </branch>
        <branch name="XLXN_608(15:0)">
            <wire x2="2256" y1="1344" y2="1344" x1="2160" />
            <wire x2="2256" y1="1344" y2="2016" x1="2256" />
            <wire x2="2976" y1="2016" y2="2016" x1="2256" />
            <wire x2="2256" y1="2016" y2="3248" x1="2256" />
            <wire x2="2976" y1="3248" y2="3248" x1="2256" />
            <wire x2="2976" y1="800" y2="800" x1="2256" />
            <wire x2="2256" y1="800" y2="1344" x1="2256" />
        </branch>
        <branch name="XLXN_609(15:0)">
            <wire x2="2288" y1="1744" y2="1744" x1="2160" />
            <wire x2="2288" y1="1744" y2="2080" x1="2288" />
            <wire x2="2976" y1="2080" y2="2080" x1="2288" />
            <wire x2="2288" y1="2080" y2="3312" x1="2288" />
            <wire x2="2976" y1="3312" y2="3312" x1="2288" />
            <wire x2="2976" y1="864" y2="864" x1="2288" />
            <wire x2="2288" y1="864" y2="1744" x1="2288" />
        </branch>
        <branch name="XLXN_610(15:0)">
            <wire x2="2320" y1="2144" y2="2144" x1="2160" />
            <wire x2="2976" y1="2144" y2="2144" x1="2320" />
            <wire x2="2320" y1="2144" y2="3376" x1="2320" />
            <wire x2="2976" y1="3376" y2="3376" x1="2320" />
            <wire x2="2976" y1="928" y2="928" x1="2320" />
            <wire x2="2320" y1="928" y2="2144" x1="2320" />
        </branch>
        <branch name="XLXN_611(15:0)">
            <wire x2="2352" y1="2544" y2="2544" x1="2160" />
            <wire x2="2352" y1="2544" y2="3440" x1="2352" />
            <wire x2="2976" y1="3440" y2="3440" x1="2352" />
            <wire x2="2976" y1="992" y2="992" x1="2352" />
            <wire x2="2352" y1="992" y2="2208" x1="2352" />
            <wire x2="2352" y1="2208" y2="2544" x1="2352" />
            <wire x2="2976" y1="2208" y2="2208" x1="2352" />
        </branch>
        <iomarker fontsize="28" x="3440" y="3120" name="DO3(15:0)" orien="R0" />
        <branch name="XLXN_618(15:0)">
            <wire x2="2384" y1="2944" y2="2944" x1="2160" />
            <wire x2="2384" y1="2944" y2="3504" x1="2384" />
            <wire x2="2976" y1="3504" y2="3504" x1="2384" />
            <wire x2="2976" y1="1056" y2="1056" x1="2384" />
            <wire x2="2384" y1="1056" y2="2272" x1="2384" />
            <wire x2="2384" y1="2272" y2="2944" x1="2384" />
            <wire x2="2976" y1="2272" y2="2272" x1="2384" />
        </branch>
        <branch name="XLXN_619(15:0)">
            <wire x2="2416" y1="3344" y2="3344" x1="2160" />
            <wire x2="2416" y1="3344" y2="3568" x1="2416" />
            <wire x2="2976" y1="3568" y2="3568" x1="2416" />
            <wire x2="2976" y1="1120" y2="1120" x1="2416" />
            <wire x2="2416" y1="1120" y2="2336" x1="2416" />
            <wire x2="2416" y1="2336" y2="3344" x1="2416" />
            <wire x2="2976" y1="2336" y2="2336" x1="2416" />
        </branch>
        <instance x="1840" y="704" name="R0_Data" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="80" y="-160" type="instance" />
        </instance>
    </sheet>
</drawing>