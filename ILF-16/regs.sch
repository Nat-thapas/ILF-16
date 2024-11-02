<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="RAD1(3:0)" />
        <signal name="RAD2(3:0)" />
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
        <signal name="XLXN_463(15:0)" />
        <signal name="XLXN_466(15:0)" />
        <signal name="XLXN_468(15:0)" />
        <signal name="XLXN_469(15:0)" />
        <signal name="XLXN_470(15:0)" />
        <signal name="XLXN_471(15:0)" />
        <signal name="XLXN_472(15:0)" />
        <signal name="XLXN_473(15:0)" />
        <signal name="XLXN_475(15:0)" />
        <signal name="XLXN_476(15:0)" />
        <signal name="XLXN_478(15:0)" />
        <signal name="XLXN_479(15:0)" />
        <signal name="XLXN_483(15:0)" />
        <signal name="XLXN_484(15:0)" />
        <signal name="XLXN_489(15:0)" />
        <signal name="XLXN_494(15:0)" />
        <signal name="DO1(15:0)" />
        <signal name="DO2(15:0)" />
        <port polarity="Input" name="RAD1(3:0)" />
        <port polarity="Input" name="RAD2(3:0)" />
        <port polarity="Input" name="DIN(15:0)" />
        <port polarity="Input" name="WAD(3:0)" />
        <port polarity="Input" name="WE" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="DO1(15:0)" />
        <port polarity="Output" name="DO2(15:0)" />
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
            <timestamp>2024-9-23T14:4:40</timestamp>
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
            <blockpin signalname="XLXN_483(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_3" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_6">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_135" name="CE" />
            <blockpin signalname="XLXN_4" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_484(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_4" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_8">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_136" name="CE" />
            <blockpin signalname="XLXN_5" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_466(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_9">
            <blockpin signalname="XLXN_5" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_10">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_137" name="CE" />
            <blockpin signalname="XLXN_6" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_489(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_11">
            <blockpin signalname="XLXN_6" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_12">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_138" name="CE" />
            <blockpin signalname="XLXN_7" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_468(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_13">
            <blockpin signalname="XLXN_7" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_14">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_139" name="CE" />
            <blockpin signalname="XLXN_8" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_469(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="XLXN_8" name="G" />
        </block>
        <block symbolname="fd16ce" name="XLXI_16">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_140" name="CE" />
            <blockpin signalname="XLXN_9" name="CLR" />
            <blockpin signalname="DIN(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_470(15:0)" name="Q(15:0)" />
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
            <blockpin signalname="XLXN_463(15:0)" name="GND(15:0)" />
        </block>
        <block symbolname="mux16x1x16tb" name="Output_1_Data_Selector">
            <blockpin signalname="XLXN_463(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_483(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_473(15:0)" name="D10(15:0)" />
            <blockpin signalname="XLXN_475(15:0)" name="D11(15:0)" />
            <blockpin signalname="XLXN_476(15:0)" name="D12(15:0)" />
            <blockpin signalname="XLXN_494(15:0)" name="D13(15:0)" />
            <blockpin signalname="XLXN_478(15:0)" name="D14(15:0)" />
            <blockpin signalname="XLXN_479(15:0)" name="D15(15:0)" />
            <blockpin signalname="XLXN_484(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_466(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_489(15:0)" name="D4(15:0)" />
            <blockpin signalname="XLXN_468(15:0)" name="D5(15:0)" />
            <blockpin signalname="XLXN_469(15:0)" name="D6(15:0)" />
            <blockpin signalname="XLXN_470(15:0)" name="D7(15:0)" />
            <blockpin signalname="XLXN_471(15:0)" name="D8(15:0)" />
            <blockpin signalname="XLXN_472(15:0)" name="D9(15:0)" />
            <blockpin signalname="DO1(15:0)" name="O(15:0)" />
            <blockpin signalname="RAD1(3:0)" name="S(3:0)" />
        </block>
        <block symbolname="mux16x1x16tb" name="Output_2_Data_Selector">
            <blockpin signalname="XLXN_463(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_483(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_473(15:0)" name="D10(15:0)" />
            <blockpin signalname="XLXN_475(15:0)" name="D11(15:0)" />
            <blockpin signalname="XLXN_476(15:0)" name="D12(15:0)" />
            <blockpin signalname="XLXN_494(15:0)" name="D13(15:0)" />
            <blockpin signalname="XLXN_478(15:0)" name="D14(15:0)" />
            <blockpin signalname="XLXN_479(15:0)" name="D15(15:0)" />
            <blockpin signalname="XLXN_484(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_466(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_489(15:0)" name="D4(15:0)" />
            <blockpin signalname="XLXN_468(15:0)" name="D5(15:0)" />
            <blockpin signalname="XLXN_469(15:0)" name="D6(15:0)" />
            <blockpin signalname="XLXN_470(15:0)" name="D7(15:0)" />
            <blockpin signalname="XLXN_471(15:0)" name="D8(15:0)" />
            <blockpin signalname="XLXN_472(15:0)" name="D9(15:0)" />
            <blockpin signalname="DO2(15:0)" name="O(15:0)" />
            <blockpin signalname="RAD2(3:0)" name="S(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="7040">
        <branch name="DIN(15:0)">
            <wire x2="1392" y1="400" y2="400" x1="320" />
            <wire x2="1392" y1="400" y2="864" x1="1392" />
            <wire x2="1776" y1="864" y2="864" x1="1392" />
            <wire x2="1392" y1="864" y2="1264" x1="1392" />
            <wire x2="1776" y1="1264" y2="1264" x1="1392" />
            <wire x2="1392" y1="1264" y2="1664" x1="1392" />
            <wire x2="1776" y1="1664" y2="1664" x1="1392" />
            <wire x2="1392" y1="1664" y2="2064" x1="1392" />
            <wire x2="1776" y1="2064" y2="2064" x1="1392" />
            <wire x2="1392" y1="2064" y2="2464" x1="1392" />
            <wire x2="1776" y1="2464" y2="2464" x1="1392" />
            <wire x2="1392" y1="2464" y2="2864" x1="1392" />
            <wire x2="1776" y1="2864" y2="2864" x1="1392" />
            <wire x2="1392" y1="2864" y2="3264" x1="1392" />
            <wire x2="1776" y1="3264" y2="3264" x1="1392" />
            <wire x2="1392" y1="3264" y2="3664" x1="1392" />
            <wire x2="1776" y1="3664" y2="3664" x1="1392" />
            <wire x2="1392" y1="3664" y2="4064" x1="1392" />
            <wire x2="1776" y1="4064" y2="4064" x1="1392" />
            <wire x2="1392" y1="4064" y2="4464" x1="1392" />
            <wire x2="1776" y1="4464" y2="4464" x1="1392" />
            <wire x2="1392" y1="4464" y2="4864" x1="1392" />
            <wire x2="1776" y1="4864" y2="4864" x1="1392" />
            <wire x2="1392" y1="4864" y2="5264" x1="1392" />
            <wire x2="1776" y1="5264" y2="5264" x1="1392" />
            <wire x2="1392" y1="5264" y2="5664" x1="1392" />
            <wire x2="1776" y1="5664" y2="5664" x1="1392" />
            <wire x2="1392" y1="5664" y2="6064" x1="1392" />
            <wire x2="1776" y1="6064" y2="6064" x1="1392" />
            <wire x2="1392" y1="6064" y2="6464" x1="1392" />
            <wire x2="1776" y1="6464" y2="6464" x1="1392" />
        </branch>
        <branch name="WAD(3:0)">
            <wire x2="432" y1="320" y2="320" x1="320" />
            <wire x2="432" y1="320" y2="784" x1="432" />
            <wire x2="432" y1="784" y2="848" x1="432" />
            <wire x2="432" y1="848" y2="912" x1="432" />
            <wire x2="432" y1="912" y2="976" x1="432" />
        </branch>
        <bustap x2="528" y1="784" y2="784" x1="432" />
        <branch name="WAD(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="784" type="branch" />
            <wire x2="544" y1="784" y2="784" x1="528" />
            <wire x2="576" y1="784" y2="784" x1="544" />
        </branch>
        <bustap x2="528" y1="848" y2="848" x1="432" />
        <branch name="WAD(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="848" type="branch" />
            <wire x2="544" y1="848" y2="848" x1="528" />
            <wire x2="576" y1="848" y2="848" x1="544" />
        </branch>
        <bustap x2="528" y1="912" y2="912" x1="432" />
        <branch name="WAD(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="912" type="branch" />
            <wire x2="544" y1="912" y2="912" x1="528" />
            <wire x2="576" y1="912" y2="912" x1="544" />
        </branch>
        <bustap x2="528" y1="976" y2="976" x1="432" />
        <branch name="WAD(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="976" type="branch" />
            <wire x2="544" y1="976" y2="976" x1="528" />
            <wire x2="576" y1="976" y2="976" x1="544" />
        </branch>
        <instance x="576" y="1872" name="Write_Address_Decoder" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="-1248" type="instance" />
        </instance>
        <branch name="XLXN_3">
            <wire x2="1776" y1="1088" y2="1088" x1="1744" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1776" y1="1488" y2="1488" x1="1744" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1776" y1="1888" y2="1888" x1="1744" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1776" y1="2288" y2="2288" x1="1744" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1776" y1="2688" y2="2688" x1="1744" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1776" y1="3088" y2="3088" x1="1744" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1776" y1="3488" y2="3488" x1="1744" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1776" y1="3888" y2="3888" x1="1744" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1776" y1="4288" y2="4288" x1="1744" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1776" y1="4688" y2="4688" x1="1744" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1776" y1="5088" y2="5088" x1="1744" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1776" y1="5488" y2="5488" x1="1744" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1776" y1="5888" y2="5888" x1="1744" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1776" y1="6288" y2="6288" x1="1744" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1776" y1="6688" y2="6688" x1="1744" />
        </branch>
        <branch name="XLXN_132">
            <wire x2="1776" y1="928" y2="928" x1="1744" />
        </branch>
        <branch name="XLXN_135">
            <wire x2="1776" y1="1328" y2="1328" x1="1744" />
        </branch>
        <branch name="XLXN_136">
            <wire x2="1776" y1="1728" y2="1728" x1="1744" />
        </branch>
        <branch name="XLXN_137">
            <wire x2="1776" y1="2128" y2="2128" x1="1744" />
        </branch>
        <branch name="XLXN_138">
            <wire x2="1776" y1="2528" y2="2528" x1="1744" />
        </branch>
        <branch name="XLXN_139">
            <wire x2="1776" y1="2928" y2="2928" x1="1744" />
        </branch>
        <branch name="XLXN_140">
            <wire x2="1776" y1="3328" y2="3328" x1="1744" />
        </branch>
        <branch name="XLXN_141">
            <wire x2="1776" y1="3728" y2="3728" x1="1744" />
        </branch>
        <branch name="XLXN_142">
            <wire x2="1776" y1="4128" y2="4128" x1="1744" />
        </branch>
        <branch name="XLXN_143">
            <wire x2="1776" y1="4528" y2="4528" x1="1744" />
        </branch>
        <branch name="XLXN_144">
            <wire x2="1776" y1="4928" y2="4928" x1="1744" />
        </branch>
        <branch name="XLXN_145">
            <wire x2="1776" y1="5328" y2="5328" x1="1744" />
        </branch>
        <branch name="XLXN_146">
            <wire x2="1776" y1="5728" y2="5728" x1="1744" />
        </branch>
        <branch name="XLXN_147">
            <wire x2="1776" y1="6128" y2="6128" x1="1744" />
        </branch>
        <branch name="XLXN_148">
            <wire x2="1776" y1="6528" y2="6528" x1="1744" />
        </branch>
        <instance x="1776" y="1120" name="XLXI_4" orien="R0" />
        <instance x="1616" y="1024" name="XLXI_5" orien="R90" />
        <instance x="1776" y="1520" name="XLXI_6" orien="R0" />
        <instance x="1616" y="1424" name="XLXI_7" orien="R90" />
        <instance x="1776" y="1920" name="XLXI_8" orien="R0" />
        <instance x="1616" y="1824" name="XLXI_9" orien="R90" />
        <instance x="1776" y="2320" name="XLXI_10" orien="R0" />
        <instance x="1616" y="2224" name="XLXI_11" orien="R90" />
        <instance x="1776" y="2720" name="XLXI_12" orien="R0" />
        <instance x="1616" y="2624" name="XLXI_13" orien="R90" />
        <instance x="1776" y="3120" name="XLXI_14" orien="R0" />
        <instance x="1616" y="3024" name="XLXI_15" orien="R90" />
        <instance x="1776" y="3520" name="XLXI_16" orien="R0" />
        <instance x="1616" y="3424" name="XLXI_17" orien="R90" />
        <instance x="1776" y="3920" name="XLXI_18" orien="R0" />
        <instance x="1616" y="3824" name="XLXI_19" orien="R90" />
        <instance x="1776" y="4320" name="XLXI_20" orien="R0" />
        <instance x="1616" y="4224" name="XLXI_21" orien="R90" />
        <instance x="1776" y="4720" name="XLXI_22" orien="R0" />
        <instance x="1616" y="4624" name="XLXI_23" orien="R90" />
        <instance x="1776" y="5120" name="XLXI_24" orien="R0" />
        <instance x="1616" y="5024" name="XLXI_25" orien="R90" />
        <instance x="1776" y="5520" name="XLXI_26" orien="R0" />
        <instance x="1616" y="5424" name="XLXI_27" orien="R90" />
        <instance x="1776" y="5920" name="XLXI_28" orien="R0" />
        <instance x="1616" y="5824" name="XLXI_29" orien="R90" />
        <instance x="1776" y="6320" name="XLXI_30" orien="R0" />
        <instance x="1616" y="6224" name="XLXI_31" orien="R90" />
        <instance x="1776" y="6720" name="XLXI_32" orien="R0" />
        <instance x="1616" y="6624" name="XLXI_33" orien="R90" />
        <instance x="1488" y="1024" name="XLXI_190" orien="R0" />
        <instance x="1488" y="1424" name="XLXI_192" orien="R0" />
        <instance x="1488" y="1824" name="XLXI_193" orien="R0" />
        <instance x="1488" y="2224" name="XLXI_194" orien="R0" />
        <instance x="1488" y="2624" name="XLXI_195" orien="R0" />
        <instance x="1488" y="3024" name="XLXI_196" orien="R0" />
        <instance x="1488" y="3424" name="XLXI_197" orien="R0" />
        <instance x="1488" y="3824" name="XLXI_198" orien="R0" />
        <instance x="1488" y="4224" name="XLXI_199" orien="R0" />
        <instance x="1488" y="4624" name="XLXI_200" orien="R0" />
        <instance x="1488" y="5024" name="XLXI_201" orien="R0" />
        <instance x="1488" y="5424" name="XLXI_202" orien="R0" />
        <instance x="1488" y="5824" name="XLXI_203" orien="R0" />
        <instance x="1488" y="6224" name="XLXI_204" orien="R0" />
        <instance x="1488" y="6624" name="XLXI_205" orien="R0" />
        <instance x="544" y="1808" name="XLXI_252" orien="R270" />
        <branch name="XLXN_213">
            <wire x2="576" y1="1744" y2="1744" x1="544" />
        </branch>
        <branch name="XLXN_230">
            <wire x2="1360" y1="848" y2="848" x1="960" />
            <wire x2="1360" y1="848" y2="896" x1="1360" />
            <wire x2="1488" y1="896" y2="896" x1="1360" />
        </branch>
        <branch name="XLXN_231">
            <wire x2="1344" y1="912" y2="912" x1="960" />
            <wire x2="1344" y1="912" y2="1296" x1="1344" />
            <wire x2="1488" y1="1296" y2="1296" x1="1344" />
        </branch>
        <branch name="XLXN_232">
            <wire x2="1328" y1="976" y2="976" x1="960" />
            <wire x2="1328" y1="976" y2="1696" x1="1328" />
            <wire x2="1488" y1="1696" y2="1696" x1="1328" />
        </branch>
        <branch name="XLXN_233">
            <wire x2="1312" y1="1040" y2="1040" x1="960" />
            <wire x2="1312" y1="1040" y2="2096" x1="1312" />
            <wire x2="1488" y1="2096" y2="2096" x1="1312" />
        </branch>
        <branch name="XLXN_234">
            <wire x2="1296" y1="1104" y2="1104" x1="960" />
            <wire x2="1296" y1="1104" y2="2496" x1="1296" />
            <wire x2="1488" y1="2496" y2="2496" x1="1296" />
        </branch>
        <branch name="XLXN_235">
            <wire x2="1280" y1="1168" y2="1168" x1="960" />
            <wire x2="1280" y1="1168" y2="2896" x1="1280" />
            <wire x2="1488" y1="2896" y2="2896" x1="1280" />
        </branch>
        <branch name="XLXN_236">
            <wire x2="1264" y1="1232" y2="1232" x1="960" />
            <wire x2="1264" y1="1232" y2="3296" x1="1264" />
            <wire x2="1488" y1="3296" y2="3296" x1="1264" />
        </branch>
        <branch name="XLXN_237">
            <wire x2="1248" y1="1296" y2="1296" x1="960" />
            <wire x2="1248" y1="1296" y2="3696" x1="1248" />
            <wire x2="1488" y1="3696" y2="3696" x1="1248" />
        </branch>
        <branch name="XLXN_238">
            <wire x2="1232" y1="1360" y2="1360" x1="960" />
            <wire x2="1232" y1="1360" y2="4096" x1="1232" />
            <wire x2="1488" y1="4096" y2="4096" x1="1232" />
        </branch>
        <branch name="XLXN_239">
            <wire x2="1216" y1="1424" y2="1424" x1="960" />
            <wire x2="1216" y1="1424" y2="4496" x1="1216" />
            <wire x2="1488" y1="4496" y2="4496" x1="1216" />
        </branch>
        <branch name="XLXN_240">
            <wire x2="1200" y1="1488" y2="1488" x1="960" />
            <wire x2="1200" y1="1488" y2="4896" x1="1200" />
            <wire x2="1488" y1="4896" y2="4896" x1="1200" />
        </branch>
        <branch name="XLXN_241">
            <wire x2="1184" y1="1552" y2="1552" x1="960" />
            <wire x2="1184" y1="1552" y2="5296" x1="1184" />
            <wire x2="1488" y1="5296" y2="5296" x1="1184" />
        </branch>
        <branch name="XLXN_242">
            <wire x2="1168" y1="1616" y2="1616" x1="960" />
            <wire x2="1168" y1="1616" y2="5696" x1="1168" />
            <wire x2="1488" y1="5696" y2="5696" x1="1168" />
        </branch>
        <branch name="XLXN_243">
            <wire x2="1152" y1="1680" y2="1680" x1="960" />
            <wire x2="1152" y1="1680" y2="6096" x1="1152" />
            <wire x2="1488" y1="6096" y2="6096" x1="1152" />
        </branch>
        <branch name="XLXN_244">
            <wire x2="1136" y1="1744" y2="1744" x1="960" />
            <wire x2="1136" y1="1744" y2="6496" x1="1136" />
            <wire x2="1488" y1="6496" y2="6496" x1="1136" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="984" y="784">R0 is a zero register, it is not writable</text>
        <instance x="1840" y="624" name="R0_Data" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="80" y="-160" type="instance" />
        </instance>
        <branch name="WE">
            <wire x2="1424" y1="480" y2="480" x1="240" />
            <wire x2="1424" y1="480" y2="960" x1="1424" />
            <wire x2="1488" y1="960" y2="960" x1="1424" />
            <wire x2="1424" y1="960" y2="1360" x1="1424" />
            <wire x2="1488" y1="1360" y2="1360" x1="1424" />
            <wire x2="1424" y1="1360" y2="1760" x1="1424" />
            <wire x2="1488" y1="1760" y2="1760" x1="1424" />
            <wire x2="1424" y1="1760" y2="2160" x1="1424" />
            <wire x2="1488" y1="2160" y2="2160" x1="1424" />
            <wire x2="1424" y1="2160" y2="2560" x1="1424" />
            <wire x2="1488" y1="2560" y2="2560" x1="1424" />
            <wire x2="1424" y1="2560" y2="2960" x1="1424" />
            <wire x2="1488" y1="2960" y2="2960" x1="1424" />
            <wire x2="1424" y1="2960" y2="3360" x1="1424" />
            <wire x2="1488" y1="3360" y2="3360" x1="1424" />
            <wire x2="1424" y1="3360" y2="3760" x1="1424" />
            <wire x2="1488" y1="3760" y2="3760" x1="1424" />
            <wire x2="1424" y1="3760" y2="4160" x1="1424" />
            <wire x2="1488" y1="4160" y2="4160" x1="1424" />
            <wire x2="1424" y1="4160" y2="4560" x1="1424" />
            <wire x2="1488" y1="4560" y2="4560" x1="1424" />
            <wire x2="1424" y1="4560" y2="4960" x1="1424" />
            <wire x2="1488" y1="4960" y2="4960" x1="1424" />
            <wire x2="1424" y1="4960" y2="5360" x1="1424" />
            <wire x2="1488" y1="5360" y2="5360" x1="1424" />
            <wire x2="1424" y1="5360" y2="5760" x1="1424" />
            <wire x2="1488" y1="5760" y2="5760" x1="1424" />
            <wire x2="1424" y1="5760" y2="6160" x1="1424" />
            <wire x2="1488" y1="6160" y2="6160" x1="1424" />
            <wire x2="1424" y1="6160" y2="6560" x1="1424" />
            <wire x2="1488" y1="6560" y2="6560" x1="1424" />
        </branch>
        <branch name="CLK">
            <wire x2="1456" y1="560" y2="560" x1="256" />
            <wire x2="1456" y1="560" y2="992" x1="1456" />
            <wire x2="1776" y1="992" y2="992" x1="1456" />
            <wire x2="1456" y1="992" y2="1392" x1="1456" />
            <wire x2="1776" y1="1392" y2="1392" x1="1456" />
            <wire x2="1456" y1="1392" y2="1792" x1="1456" />
            <wire x2="1776" y1="1792" y2="1792" x1="1456" />
            <wire x2="1456" y1="1792" y2="2192" x1="1456" />
            <wire x2="1776" y1="2192" y2="2192" x1="1456" />
            <wire x2="1456" y1="2192" y2="2592" x1="1456" />
            <wire x2="1776" y1="2592" y2="2592" x1="1456" />
            <wire x2="1456" y1="2592" y2="2992" x1="1456" />
            <wire x2="1776" y1="2992" y2="2992" x1="1456" />
            <wire x2="1456" y1="2992" y2="3392" x1="1456" />
            <wire x2="1776" y1="3392" y2="3392" x1="1456" />
            <wire x2="1456" y1="3392" y2="3792" x1="1456" />
            <wire x2="1776" y1="3792" y2="3792" x1="1456" />
            <wire x2="1456" y1="3792" y2="4192" x1="1456" />
            <wire x2="1776" y1="4192" y2="4192" x1="1456" />
            <wire x2="1456" y1="4192" y2="4592" x1="1456" />
            <wire x2="1776" y1="4592" y2="4592" x1="1456" />
            <wire x2="1456" y1="4592" y2="4992" x1="1456" />
            <wire x2="1776" y1="4992" y2="4992" x1="1456" />
            <wire x2="1456" y1="4992" y2="5392" x1="1456" />
            <wire x2="1776" y1="5392" y2="5392" x1="1456" />
            <wire x2="1456" y1="5392" y2="5792" x1="1456" />
            <wire x2="1776" y1="5792" y2="5792" x1="1456" />
            <wire x2="1456" y1="5792" y2="6192" x1="1456" />
            <wire x2="1776" y1="6192" y2="6192" x1="1456" />
            <wire x2="1456" y1="6192" y2="6592" x1="1456" />
            <wire x2="1776" y1="6592" y2="6592" x1="1456" />
        </branch>
        <iomarker fontsize="28" x="240" y="480" name="WE" orien="R180" />
        <iomarker fontsize="28" x="256" y="560" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="336" y="240" name="RAD2(3:0)" orien="R180" />
        <branch name="XLXN_463(15:0)">
            <wire x2="2192" y1="592" y2="592" x1="2160" />
            <wire x2="2896" y1="592" y2="592" x1="2192" />
            <wire x2="2192" y1="592" y2="1808" x1="2192" />
            <wire x2="2896" y1="1808" y2="1808" x1="2192" />
        </branch>
        <branch name="XLXN_468(15:0)">
            <wire x2="2352" y1="2464" y2="2464" x1="2160" />
            <wire x2="2896" y1="912" y2="912" x1="2352" />
            <wire x2="2352" y1="912" y2="2128" x1="2352" />
            <wire x2="2896" y1="2128" y2="2128" x1="2352" />
            <wire x2="2352" y1="2128" y2="2464" x1="2352" />
        </branch>
        <branch name="XLXN_469(15:0)">
            <wire x2="2384" y1="2864" y2="2864" x1="2160" />
            <wire x2="2896" y1="976" y2="976" x1="2384" />
            <wire x2="2384" y1="976" y2="2192" x1="2384" />
            <wire x2="2384" y1="2192" y2="2864" x1="2384" />
            <wire x2="2896" y1="2192" y2="2192" x1="2384" />
        </branch>
        <branch name="XLXN_470(15:0)">
            <wire x2="2416" y1="3264" y2="3264" x1="2160" />
            <wire x2="2896" y1="1040" y2="1040" x1="2416" />
            <wire x2="2416" y1="1040" y2="2256" x1="2416" />
            <wire x2="2416" y1="2256" y2="3264" x1="2416" />
            <wire x2="2896" y1="2256" y2="2256" x1="2416" />
        </branch>
        <instance x="2896" y="1648" name="Output_1_Data_Selector" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="48" y="-1184" type="instance" />
        </instance>
        <branch name="XLXN_489(15:0)">
            <wire x2="2320" y1="2064" y2="2064" x1="2160" />
            <wire x2="2896" y1="2064" y2="2064" x1="2320" />
            <wire x2="2896" y1="848" y2="848" x1="2320" />
            <wire x2="2320" y1="848" y2="2064" x1="2320" />
        </branch>
        <instance x="2896" y="2864" name="Output_2_Data_Selector" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="32" y="-1184" type="instance" />
        </instance>
        <branch name="XLXN_483(15:0)">
            <wire x2="2224" y1="864" y2="864" x1="2160" />
            <wire x2="2224" y1="864" y2="1872" x1="2224" />
            <wire x2="2896" y1="1872" y2="1872" x1="2224" />
            <wire x2="2896" y1="656" y2="656" x1="2224" />
            <wire x2="2224" y1="656" y2="864" x1="2224" />
        </branch>
        <branch name="XLXN_484(15:0)">
            <wire x2="2256" y1="1264" y2="1264" x1="2160" />
            <wire x2="2256" y1="1264" y2="1936" x1="2256" />
            <wire x2="2896" y1="1936" y2="1936" x1="2256" />
            <wire x2="2896" y1="720" y2="720" x1="2256" />
            <wire x2="2256" y1="720" y2="1264" x1="2256" />
        </branch>
        <branch name="XLXN_466(15:0)">
            <wire x2="2288" y1="1664" y2="1664" x1="2160" />
            <wire x2="2288" y1="1664" y2="2000" x1="2288" />
            <wire x2="2896" y1="2000" y2="2000" x1="2288" />
            <wire x2="2896" y1="784" y2="784" x1="2288" />
            <wire x2="2288" y1="784" y2="1664" x1="2288" />
        </branch>
        <branch name="XLXN_471(15:0)">
            <wire x2="2448" y1="3664" y2="3664" x1="2160" />
            <wire x2="2896" y1="1104" y2="1104" x1="2448" />
            <wire x2="2448" y1="1104" y2="2320" x1="2448" />
            <wire x2="2448" y1="2320" y2="3664" x1="2448" />
            <wire x2="2896" y1="2320" y2="2320" x1="2448" />
        </branch>
        <branch name="XLXN_472(15:0)">
            <wire x2="2480" y1="4064" y2="4064" x1="2160" />
            <wire x2="2896" y1="1168" y2="1168" x1="2480" />
            <wire x2="2480" y1="1168" y2="2384" x1="2480" />
            <wire x2="2480" y1="2384" y2="4064" x1="2480" />
            <wire x2="2896" y1="2384" y2="2384" x1="2480" />
        </branch>
        <branch name="XLXN_473(15:0)">
            <wire x2="2512" y1="4464" y2="4464" x1="2160" />
            <wire x2="2896" y1="1232" y2="1232" x1="2512" />
            <wire x2="2512" y1="1232" y2="2448" x1="2512" />
            <wire x2="2512" y1="2448" y2="4464" x1="2512" />
            <wire x2="2896" y1="2448" y2="2448" x1="2512" />
        </branch>
        <branch name="XLXN_475(15:0)">
            <wire x2="2544" y1="4864" y2="4864" x1="2160" />
            <wire x2="2896" y1="1296" y2="1296" x1="2544" />
            <wire x2="2544" y1="1296" y2="2512" x1="2544" />
            <wire x2="2544" y1="2512" y2="4864" x1="2544" />
            <wire x2="2896" y1="2512" y2="2512" x1="2544" />
        </branch>
        <branch name="XLXN_476(15:0)">
            <wire x2="2576" y1="5264" y2="5264" x1="2160" />
            <wire x2="2896" y1="1360" y2="1360" x1="2576" />
            <wire x2="2576" y1="1360" y2="2576" x1="2576" />
            <wire x2="2576" y1="2576" y2="5264" x1="2576" />
            <wire x2="2896" y1="2576" y2="2576" x1="2576" />
        </branch>
        <branch name="XLXN_494(15:0)">
            <wire x2="2608" y1="5664" y2="5664" x1="2160" />
            <wire x2="2896" y1="1424" y2="1424" x1="2608" />
            <wire x2="2608" y1="1424" y2="2640" x1="2608" />
            <wire x2="2608" y1="2640" y2="5664" x1="2608" />
            <wire x2="2896" y1="2640" y2="2640" x1="2608" />
        </branch>
        <branch name="XLXN_478(15:0)">
            <wire x2="2640" y1="6064" y2="6064" x1="2160" />
            <wire x2="2896" y1="1488" y2="1488" x1="2640" />
            <wire x2="2640" y1="1488" y2="2704" x1="2640" />
            <wire x2="2896" y1="2704" y2="2704" x1="2640" />
            <wire x2="2640" y1="2704" y2="6064" x1="2640" />
        </branch>
        <branch name="XLXN_479(15:0)">
            <wire x2="2672" y1="6464" y2="6464" x1="2160" />
            <wire x2="2896" y1="1552" y2="1552" x1="2672" />
            <wire x2="2672" y1="1552" y2="2768" x1="2672" />
            <wire x2="2672" y1="2768" y2="6464" x1="2672" />
            <wire x2="2896" y1="2768" y2="2768" x1="2672" />
        </branch>
        <branch name="RAD2(3:0)">
            <wire x2="2752" y1="240" y2="240" x1="336" />
            <wire x2="2752" y1="240" y2="2832" x1="2752" />
            <wire x2="2896" y1="2832" y2="2832" x1="2752" />
        </branch>
        <branch name="RAD1(3:0)">
            <wire x2="2800" y1="160" y2="160" x1="336" />
            <wire x2="2800" y1="160" y2="1616" x1="2800" />
            <wire x2="2896" y1="1616" y2="1616" x1="2800" />
        </branch>
        <branch name="DO1(15:0)">
            <wire x2="3360" y1="592" y2="592" x1="3280" />
        </branch>
        <branch name="DO2(15:0)">
            <wire x2="3360" y1="1808" y2="1808" x1="3280" />
        </branch>
        <iomarker fontsize="28" x="3360" y="592" name="DO1(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3360" y="1808" name="DO2(15:0)" orien="R0" />
        <iomarker fontsize="28" x="336" y="160" name="RAD1(3:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="320" name="WAD(3:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="400" name="DIN(15:0)" orien="R180" />
        <text style="fontsize:24;fontname:Arial" x="2048" y="464">(All Zeros)</text>
    </sheet>
</drawing>