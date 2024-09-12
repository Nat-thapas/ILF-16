<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CEA" />
        <signal name="A(15:0)" />
        <signal name="CEB" />
        <signal name="B(15:0)" />
        <signal name="CLK" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="OP(3:0)" />
        <signal name="OP(0)" />
        <signal name="OP(1)" />
        <signal name="OP(2)" />
        <signal name="OP(3)" />
        <signal name="CEOP" />
        <signal name="XLXN_23(15:0)" />
        <signal name="XLXN_25(15:0)" />
        <signal name="XLXN_26(15:0)" />
        <signal name="XLXN_27(15:0)" />
        <signal name="XLXN_28(15:0)" />
        <signal name="XLXN_29(15:0)" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_37" />
        <signal name="M(2:0)" />
        <signal name="XLXN_40(15:0)" />
        <signal name="M(0)" />
        <signal name="M(1)" />
        <signal name="M(2)" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62(15:0)" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64(15:0)" />
        <signal name="XLXN_65(15:0)" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68(15:0)" />
        <signal name="XLXN_69(15:0)" />
        <signal name="XLXN_70(15:0)" />
        <signal name="XLXN_71(15:0)" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_74" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83(15:0)" />
        <signal name="XLXN_84(15:0)" />
        <signal name="XLXN_86(15:0)" />
        <signal name="L(15:0)" />
        <signal name="H(15:0)" />
        <signal name="XLXN_89" />
        <signal name="F(13)" />
        <signal name="F(15:0)" />
        <signal name="XLXN_93" />
        <signal name="F(14)" />
        <signal name="XLXN_95(15:0)" />
        <signal name="XLXN_96(15:0)" />
        <signal name="F(0)" />
        <signal name="XLXN_98" />
        <signal name="XLXN_100" />
        <signal name="F(12)" />
        <signal name="F(3)" />
        <signal name="F(1)" />
        <signal name="XLXN_106" />
        <signal name="F(2)" />
        <port polarity="Input" name="CEA" />
        <port polarity="Input" name="A(15:0)" />
        <port polarity="Input" name="CEB" />
        <port polarity="Input" name="B(15:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="OP(3:0)" />
        <port polarity="Input" name="CEOP" />
        <port polarity="Output" name="L(15:0)" />
        <port polarity="Output" name="H(15:0)" />
        <port polarity="Output" name="F(15:0)" />
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
        <blockdef name="adsu16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="384" y1="-64" y2="-64" x1="240" />
            <line x2="240" y1="-124" y2="-64" x1="240" />
            <rect width="64" x="0" y="-204" height="24" />
            <rect width="64" x="0" y="-332" height="24" />
            <rect width="64" x="384" y="-268" height="24" />
            <line x2="64" y1="-448" y2="-448" x1="128" />
            <line x2="128" y1="-416" y2="-448" x1="128" />
            <line x2="48" y1="-64" y2="-64" x1="128" />
            <line x2="128" y1="-96" y2="-64" x1="128" />
            <line x2="64" y1="-288" y2="-432" x1="64" />
            <line x2="64" y1="-256" y2="-288" x1="128" />
            <line x2="128" y1="-224" y2="-256" x1="64" />
            <line x2="64" y1="-80" y2="-224" x1="64" />
            <line x2="64" y1="-160" y2="-80" x1="384" />
            <line x2="384" y1="-336" y2="-160" x1="384" />
            <line x2="384" y1="-352" y2="-336" x1="384" />
            <line x2="384" y1="-432" y2="-352" x1="64" />
            <line x2="336" y1="-128" y2="-148" x1="336" />
            <line x2="336" y1="-128" y2="-128" x1="384" />
            <line x2="384" y1="-256" y2="-256" x1="448" />
            <line x2="384" y1="-128" y2="-128" x1="448" />
            <line x2="384" y1="-64" y2="-64" x1="448" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="mult">
            <timestamp>2024-9-12T5:37:9</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="rshift">
            <timestamp>2024-9-12T10:44:13</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
        </blockdef>
        <blockdef name="lshift">
            <timestamp>2024-9-12T10:44:2</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
        </blockdef>
        <blockdef name="logic">
            <timestamp>2024-9-12T10:34:30</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
        </blockdef>
        <blockdef name="fd4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="mux2x1x16e">
            <timestamp>2024-9-12T11:2:1</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="mux4x1x16e">
            <timestamp>2024-9-12T11:15:18</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-428" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="lut3">
            <timestamp>2007-4-25T21:45:29</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <blockdef name="compm16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-384" height="320" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="and2b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_11" name="G" />
        </block>
        <block symbolname="fd4ce" name="XLXI_11">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CEOP" name="CE" />
            <blockpin signalname="XLXN_11" name="CLR" />
            <blockpin signalname="OP(0)" name="D0" />
            <blockpin signalname="OP(1)" name="D1" />
            <blockpin signalname="OP(2)" name="D2" />
            <blockpin signalname="OP(3)" name="D3" />
            <blockpin signalname="XLXN_57" name="Q0" />
            <blockpin signalname="XLXN_59" name="Q1" />
            <blockpin signalname="XLXN_50" name="Q2" />
            <blockpin signalname="XLXN_63" name="Q3" />
        </block>
        <block symbolname="fd16ce" name="XLXI_2">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CEB" name="CE" />
            <blockpin signalname="XLXN_11" name="CLR" />
            <blockpin signalname="B(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_96(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="fd16ce" name="XLXI_1">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CEA" name="CE" />
            <blockpin signalname="XLXN_11" name="CLR" />
            <blockpin signalname="A(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_95(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="adsu16" name="XLXI_6">
            <blockpin signalname="XLXN_95(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_52" name="ADD" />
            <blockpin signalname="XLXN_96(15:0)" name="B(15:0)" />
            <blockpin signalname="XLXN_58" name="CI" />
            <blockpin signalname="XLXN_61" name="CO" />
            <blockpin signalname="F(14)" name="OFL" />
            <blockpin signalname="XLXN_68(15:0)" name="S(15:0)" />
        </block>
        <block symbolname="mult" name="XLXI_7">
            <blockpin signalname="XLXN_95(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_96(15:0)" name="B(15:0)" />
            <blockpin signalname="H(15:0)" name="H(15:0)" />
            <blockpin signalname="XLXN_69(15:0)" name="L(15:0)" />
            <blockpin signalname="XLXN_57" name="Signed" />
        </block>
        <block symbolname="rshift" name="XLXI_8">
            <blockpin signalname="XLXN_95(15:0)" name="I(15:0)" />
            <blockpin signalname="XLXN_70(15:0)" name="O(15:0)" />
            <blockpin signalname="XLXN_96(15:0)" name="S(15:0)" />
        </block>
        <block symbolname="lshift" name="XLXI_9">
            <blockpin signalname="XLXN_95(15:0)" name="I(15:0)" />
            <blockpin signalname="XLXN_71(15:0)" name="O(15:0)" />
            <blockpin signalname="XLXN_96(15:0)" name="S(15:0)" />
        </block>
        <block symbolname="logic" name="XLXI_10">
            <blockpin signalname="XLXN_95(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_96(15:0)" name="B(15:0)" />
            <blockpin signalname="M(2:0)" name="M(2:0)" />
            <blockpin signalname="XLXN_62(15:0)" name="O(15:0)" />
        </block>
        <block symbolname="inv" name="XLXI_31">
            <blockpin signalname="XLXN_59" name="I" />
            <blockpin signalname="XLXN_52" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_21">
            <blockpin signalname="XLXN_59" name="I" />
            <blockpin signalname="M(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_22">
            <blockpin signalname="XLXN_50" name="I" />
            <blockpin signalname="M(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_20">
            <blockpin signalname="XLXN_57" name="I" />
            <blockpin signalname="M(0)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_35">
            <blockpin signalname="XLXN_59" name="I0" />
            <blockpin signalname="XLXN_57" name="I1" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_36">
            <blockpin signalname="XLXN_59" name="I0" />
            <blockpin signalname="XLXN_61" name="I1" />
            <blockpin signalname="F(13)" name="O" />
        </block>
        <block symbolname="mux2x1x16e" name="XLXI_37">
            <blockpin signalname="XLXN_86(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_62(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_67" name="E" />
            <blockpin signalname="L(15:0)" name="O(15:0)" />
            <blockpin signalname="XLXN_63" name="S" />
        </block>
        <block symbolname="vcc" name="XLXI_38">
            <blockpin signalname="XLXN_67" name="P" />
        </block>
        <block symbolname="mux4x1x16e" name="XLXI_39">
            <blockpin signalname="XLXN_68(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_69(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_70(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_71(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_72" name="E" />
            <blockpin signalname="XLXN_86(15:0)" name="O(15:0)" />
            <blockpin signalname="XLXN_80" name="S0" />
            <blockpin signalname="XLXN_82" name="S1" />
        </block>
        <block symbolname="vcc" name="XLXI_40">
            <blockpin signalname="XLXN_72" name="P" />
        </block>
        <block symbolname="lut3" name="XLXI_41">
            <attr value="B0" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 8 h" />
            </attr>
            <blockpin signalname="XLXN_57" name="I0" />
            <blockpin signalname="XLXN_59" name="I1" />
            <blockpin signalname="XLXN_50" name="I2" />
            <blockpin signalname="XLXN_80" name="O" />
        </block>
        <block symbolname="lut3" name="XLXI_42">
            <attr value="C0" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 8 h" />
            </attr>
            <blockpin signalname="XLXN_57" name="I0" />
            <blockpin signalname="XLXN_59" name="I1" />
            <blockpin signalname="XLXN_50" name="I2" />
            <blockpin signalname="XLXN_82" name="O" />
        </block>
        <block symbolname="compm16" name="XLXI_47">
            <blockpin signalname="XLXN_95(15:0)" name="A(15:0)" />
            <blockpin signalname="XLXN_96(15:0)" name="B(15:0)" />
            <blockpin signalname="F(0)" name="GT" />
            <blockpin signalname="F(2)" name="LT" />
        </block>
        <block symbolname="and2b2" name="XLXI_48">
            <blockpin signalname="F(2)" name="I0" />
            <blockpin signalname="F(0)" name="I1" />
            <blockpin signalname="F(12)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_49">
            <blockpin signalname="F(0)" name="I" />
            <blockpin signalname="F(3)" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_50">
            <blockpin signalname="F(2)" name="I" />
            <blockpin signalname="F(1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="CEA">
            <wire x2="656" y1="288" y2="288" x1="256" />
        </branch>
        <branch name="A(15:0)">
            <wire x2="656" y1="224" y2="224" x1="288" />
        </branch>
        <branch name="CEB">
            <wire x2="656" y1="768" y2="768" x1="256" />
        </branch>
        <branch name="B(15:0)">
            <wire x2="656" y1="704" y2="704" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="224" name="A(15:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="288" name="CEA" orien="R180" />
        <iomarker fontsize="28" x="288" y="704" name="B(15:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="768" name="CEB" orien="R180" />
        <branch name="CLK">
            <wire x2="336" y1="1680" y2="1680" x1="256" />
            <wire x2="656" y1="352" y2="352" x1="336" />
            <wire x2="336" y1="352" y2="832" x1="336" />
            <wire x2="336" y1="832" y2="1504" x1="336" />
            <wire x2="336" y1="1504" y2="1680" x1="336" />
            <wire x2="656" y1="1504" y2="1504" x1="336" />
            <wire x2="656" y1="832" y2="832" x1="336" />
        </branch>
        <instance x="336" y="1808" name="XLXI_5" orien="R0" />
        <iomarker fontsize="28" x="256" y="1680" name="CLK" orien="R180" />
        <instance x="656" y="1632" name="XLXI_11" orien="R0" />
        <instance x="656" y="960" name="XLXI_2" orien="R0" />
        <instance x="656" y="480" name="XLXI_1" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="656" y1="448" y2="448" x1="400" />
            <wire x2="400" y1="448" y2="928" x1="400" />
            <wire x2="400" y1="928" y2="1600" x1="400" />
            <wire x2="400" y1="1600" y2="1680" x1="400" />
            <wire x2="656" y1="1600" y2="1600" x1="400" />
            <wire x2="656" y1="928" y2="928" x1="400" />
        </branch>
        <iomarker fontsize="28" x="288" y="1184" name="OP(3:0)" orien="R180" />
        <branch name="OP(3:0)">
            <wire x2="480" y1="1184" y2="1184" x1="288" />
            <wire x2="480" y1="1184" y2="1248" x1="480" />
            <wire x2="480" y1="1248" y2="1312" x1="480" />
            <wire x2="480" y1="1312" y2="1376" x1="480" />
        </branch>
        <bustap x2="576" y1="1184" y2="1184" x1="480" />
        <branch name="OP(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="592" y="1184" type="branch" />
            <wire x2="592" y1="1184" y2="1184" x1="576" />
            <wire x2="656" y1="1184" y2="1184" x1="592" />
        </branch>
        <bustap x2="576" y1="1248" y2="1248" x1="480" />
        <branch name="OP(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="592" y="1248" type="branch" />
            <wire x2="592" y1="1248" y2="1248" x1="576" />
            <wire x2="656" y1="1248" y2="1248" x1="592" />
        </branch>
        <bustap x2="576" y1="1312" y2="1312" x1="480" />
        <branch name="OP(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="592" y="1312" type="branch" />
            <wire x2="592" y1="1312" y2="1312" x1="576" />
            <wire x2="656" y1="1312" y2="1312" x1="592" />
        </branch>
        <bustap x2="576" y1="1376" y2="1376" x1="480" />
        <branch name="OP(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="592" y="1376" type="branch" />
            <wire x2="592" y1="1376" y2="1376" x1="576" />
            <wire x2="656" y1="1376" y2="1376" x1="592" />
        </branch>
        <branch name="CEOP">
            <wire x2="656" y1="1440" y2="1440" x1="272" />
        </branch>
        <iomarker fontsize="28" x="272" y="1440" name="CEOP" orien="R180" />
        <instance x="1856" y="624" name="XLXI_6" orien="R0" />
        <instance x="1856" y="1184" name="XLXI_8" orien="R0">
        </instance>
        <instance x="1856" y="1424" name="XLXI_9" orien="R0">
        </instance>
        <instance x="1856" y="1728" name="XLXI_10" orien="R0">
        </instance>
        <branch name="M(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1696" type="branch" />
            <wire x2="1632" y1="1696" y2="1696" x1="1616" />
            <wire x2="1664" y1="1696" y2="1696" x1="1632" />
        </branch>
        <branch name="M(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1760" type="branch" />
            <wire x2="1632" y1="1760" y2="1760" x1="1616" />
            <wire x2="1664" y1="1760" y2="1760" x1="1632" />
        </branch>
        <branch name="M(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1632" y="1824" type="branch" />
            <wire x2="1632" y1="1824" y2="1824" x1="1616" />
            <wire x2="1664" y1="1824" y2="1824" x1="1632" />
        </branch>
        <instance x="1616" y="592" name="XLXI_31" orien="R0" />
        <branch name="XLXN_52">
            <wire x2="1856" y1="560" y2="560" x1="1840" />
        </branch>
        <instance x="1584" y="272" name="XLXI_35" orien="R0" />
        <branch name="XLXN_57">
            <wire x2="1152" y1="1184" y2="1184" x1="1040" />
            <wire x2="1152" y1="1184" y2="1696" x1="1152" />
            <wire x2="1152" y1="1696" y2="2256" x1="1152" />
            <wire x2="1152" y1="2256" y2="2656" x1="1152" />
            <wire x2="1376" y1="2656" y2="2656" x1="1152" />
            <wire x2="1376" y1="2256" y2="2256" x1="1152" />
            <wire x2="1392" y1="1696" y2="1696" x1="1152" />
            <wire x2="1152" y1="144" y2="896" x1="1152" />
            <wire x2="1152" y1="896" y2="1184" x1="1152" />
            <wire x2="1856" y1="896" y2="896" x1="1152" />
            <wire x2="1584" y1="144" y2="144" x1="1152" />
        </branch>
        <branch name="XLXN_58">
            <wire x2="1856" y1="176" y2="176" x1="1840" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1184" y1="1248" y2="1248" x1="1040" />
            <wire x2="1184" y1="1248" y2="1760" x1="1184" />
            <wire x2="1184" y1="1760" y2="2192" x1="1184" />
            <wire x2="1184" y1="2192" y2="2592" x1="1184" />
            <wire x2="1376" y1="2592" y2="2592" x1="1184" />
            <wire x2="1376" y1="2192" y2="2192" x1="1184" />
            <wire x2="1392" y1="1760" y2="1760" x1="1184" />
            <wire x2="1184" y1="208" y2="560" x1="1184" />
            <wire x2="1184" y1="560" y2="624" x1="1184" />
            <wire x2="1184" y1="624" y2="1248" x1="1184" />
            <wire x2="2320" y1="624" y2="624" x1="1184" />
            <wire x2="1616" y1="560" y2="560" x1="1184" />
            <wire x2="1584" y1="208" y2="208" x1="1184" />
        </branch>
        <branch name="XLXN_61">
            <wire x2="2320" y1="560" y2="560" x1="2304" />
        </branch>
        <instance x="2320" y="688" name="XLXI_36" orien="R0" />
        <branch name="XLXN_62(15:0)">
            <wire x2="3440" y1="1568" y2="1568" x1="2240" />
            <wire x2="3440" y1="1376" y2="1568" x1="3440" />
            <wire x2="3616" y1="1376" y2="1376" x1="3440" />
        </branch>
        <instance x="3616" y="1536" name="XLXI_37" orien="R0">
        </instance>
        <branch name="XLXN_63">
            <wire x2="1248" y1="1376" y2="1376" x1="1040" />
            <wire x2="1248" y1="1376" y2="1440" x1="1248" />
            <wire x2="3616" y1="1440" y2="1440" x1="1248" />
        </branch>
        <instance x="3568" y="1568" name="XLXI_38" orien="R270" />
        <branch name="XLXN_67">
            <wire x2="3616" y1="1504" y2="1504" x1="3568" />
        </branch>
        <branch name="XLXN_68(15:0)">
            <wire x2="2640" y1="368" y2="368" x1="2304" />
            <wire x2="2640" y1="368" y2="752" x1="2640" />
            <wire x2="2896" y1="752" y2="752" x1="2640" />
        </branch>
        <branch name="XLXN_69(15:0)">
            <wire x2="2560" y1="768" y2="768" x1="2240" />
            <wire x2="2560" y1="768" y2="816" x1="2560" />
            <wire x2="2896" y1="816" y2="816" x1="2560" />
        </branch>
        <branch name="XLXN_70(15:0)">
            <wire x2="2560" y1="1088" y2="1088" x1="2240" />
            <wire x2="2896" y1="880" y2="880" x1="2560" />
            <wire x2="2560" y1="880" y2="1088" x1="2560" />
        </branch>
        <branch name="XLXN_71(15:0)">
            <wire x2="2640" y1="1328" y2="1328" x1="2240" />
            <wire x2="2896" y1="944" y2="944" x1="2640" />
            <wire x2="2640" y1="944" y2="1328" x1="2640" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="2896" y1="1136" y2="1136" x1="2832" />
        </branch>
        <instance x="1376" y="2384" name="XLXI_41" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="192" y="-360" type="instance" />
        </instance>
        <instance x="1376" y="2784" name="XLXI_42" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="192" y="-364" type="instance" />
        </instance>
        <branch name="XLXN_50">
            <wire x2="1216" y1="1312" y2="1312" x1="1040" />
            <wire x2="1216" y1="1312" y2="1824" x1="1216" />
            <wire x2="1216" y1="1824" y2="2128" x1="1216" />
            <wire x2="1216" y1="2128" y2="2528" x1="1216" />
            <wire x2="1376" y1="2528" y2="2528" x1="1216" />
            <wire x2="1376" y1="2128" y2="2128" x1="1216" />
            <wire x2="1392" y1="1824" y2="1824" x1="1216" />
        </branch>
        <branch name="XLXN_82">
            <wire x2="2704" y1="2592" y2="2592" x1="1760" />
            <wire x2="2896" y1="1072" y2="1072" x1="2704" />
            <wire x2="2704" y1="1072" y2="2592" x1="2704" />
        </branch>
        <instance x="2896" y="1168" name="XLXI_39" orien="R0">
        </instance>
        <branch name="XLXN_80">
            <wire x2="2672" y1="2192" y2="2192" x1="1760" />
            <wire x2="2896" y1="1008" y2="1008" x1="2672" />
            <wire x2="2672" y1="1008" y2="2192" x1="2672" />
        </branch>
        <instance x="1856" y="928" name="XLXI_7" orien="R0">
        </instance>
        <instance x="2832" y="1200" name="XLXI_40" orien="R270" />
        <branch name="XLXN_86(15:0)">
            <wire x2="3440" y1="752" y2="752" x1="3280" />
            <wire x2="3440" y1="752" y2="1312" x1="3440" />
            <wire x2="3616" y1="1312" y2="1312" x1="3440" />
        </branch>
        <branch name="L(15:0)">
            <wire x2="4480" y1="1312" y2="1312" x1="4000" />
        </branch>
        <branch name="H(15:0)">
            <wire x2="2464" y1="832" y2="832" x1="2240" />
            <wire x2="2464" y1="832" y2="1200" x1="2464" />
            <wire x2="4480" y1="1200" y2="1200" x1="2464" />
        </branch>
        <iomarker fontsize="28" x="4480" y="1312" name="L(15:0)" orien="R0" />
        <iomarker fontsize="28" x="4480" y="1200" name="H(15:0)" orien="R0" />
        <branch name="F(15:0)">
            <wire x2="4480" y1="1440" y2="1440" x1="4400" />
            <wire x2="4400" y1="1440" y2="1488" x1="4400" />
            <wire x2="4400" y1="1488" y2="1680" x1="4400" />
            <wire x2="4400" y1="1680" y2="1728" x1="4400" />
            <wire x2="4400" y1="1728" y2="1776" x1="4400" />
            <wire x2="4400" y1="1776" y2="1840" x1="4400" />
            <wire x2="4400" y1="1840" y2="1920" x1="4400" />
            <wire x2="4400" y1="1920" y2="2400" x1="4400" />
        </branch>
        <iomarker fontsize="28" x="4480" y="1440" name="F(15:0)" orien="R0" />
        <bustap x2="4304" y1="1440" y2="1440" x1="4400" />
        <branch name="F(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1488" type="branch" />
            <wire x2="4080" y1="592" y2="592" x1="2576" />
            <wire x2="4080" y1="592" y2="1488" x1="4080" />
            <wire x2="4240" y1="1488" y2="1488" x1="4080" />
            <wire x2="4304" y1="1488" y2="1488" x1="4240" />
        </branch>
        <bustap x2="4304" y1="1488" y2="1488" x1="4400" />
        <branch name="F(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1440" type="branch" />
            <wire x2="4112" y1="496" y2="496" x1="2304" />
            <wire x2="4112" y1="496" y2="1440" x1="4112" />
            <wire x2="4240" y1="1440" y2="1440" x1="4112" />
            <wire x2="4304" y1="1440" y2="1440" x1="4240" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="4152" y="1424">OF</text>
        <branch name="M(2:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1696" type="branch" />
            <wire x2="1808" y1="1696" y2="1696" x1="1760" />
            <wire x2="1856" y1="1696" y2="1696" x1="1808" />
            <wire x2="1760" y1="1696" y2="1760" x1="1760" />
            <wire x2="1760" y1="1760" y2="1824" x1="1760" />
        </branch>
        <bustap x2="1664" y1="1696" y2="1696" x1="1760" />
        <bustap x2="1664" y1="1760" y2="1760" x1="1760" />
        <bustap x2="1664" y1="1824" y2="1824" x1="1760" />
        <instance x="1392" y="1728" name="XLXI_20" orien="R0" />
        <instance x="1392" y="1792" name="XLXI_21" orien="R0" />
        <instance x="1392" y="1856" name="XLXI_22" orien="R0" />
        <instance x="1376" y="3264" name="XLXI_47" orien="R0" />
        <branch name="XLXN_95(15:0)">
            <wire x2="1312" y1="224" y2="224" x1="1040" />
            <wire x2="1312" y1="224" y2="304" x1="1312" />
            <wire x2="1856" y1="304" y2="304" x1="1312" />
            <wire x2="1312" y1="304" y2="768" x1="1312" />
            <wire x2="1856" y1="768" y2="768" x1="1312" />
            <wire x2="1312" y1="768" y2="1088" x1="1312" />
            <wire x2="1856" y1="1088" y2="1088" x1="1312" />
            <wire x2="1312" y1="1088" y2="1328" x1="1312" />
            <wire x2="1856" y1="1328" y2="1328" x1="1312" />
            <wire x2="1312" y1="1328" y2="1568" x1="1312" />
            <wire x2="1856" y1="1568" y2="1568" x1="1312" />
            <wire x2="1312" y1="1568" y2="2944" x1="1312" />
            <wire x2="1376" y1="2944" y2="2944" x1="1312" />
        </branch>
        <branch name="XLXN_96(15:0)">
            <wire x2="1344" y1="704" y2="704" x1="1040" />
            <wire x2="1344" y1="704" y2="832" x1="1344" />
            <wire x2="1856" y1="832" y2="832" x1="1344" />
            <wire x2="1344" y1="832" y2="1152" x1="1344" />
            <wire x2="1856" y1="1152" y2="1152" x1="1344" />
            <wire x2="1344" y1="1152" y2="1392" x1="1344" />
            <wire x2="1856" y1="1392" y2="1392" x1="1344" />
            <wire x2="1344" y1="1392" y2="1632" x1="1344" />
            <wire x2="1856" y1="1632" y2="1632" x1="1344" />
            <wire x2="1344" y1="1632" y2="3136" x1="1344" />
            <wire x2="1376" y1="3136" y2="3136" x1="1344" />
            <wire x2="1856" y1="432" y2="432" x1="1344" />
            <wire x2="1344" y1="432" y2="704" x1="1344" />
        </branch>
        <instance x="1920" y="3136" name="XLXI_48" orien="R0" />
        <bustap x2="4304" y1="1680" y2="1680" x1="4400" />
        <bustap x2="4304" y1="1728" y2="1728" x1="4400" />
        <bustap x2="4304" y1="1776" y2="1776" x1="4400" />
        <branch name="F(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1776" type="branch" />
            <wire x2="2864" y1="3040" y2="3040" x1="2176" />
            <wire x2="2864" y1="1776" y2="3040" x1="2864" />
            <wire x2="4240" y1="1776" y2="1776" x1="2864" />
            <wire x2="4304" y1="1776" y2="1776" x1="4240" />
        </branch>
        <instance x="2896" y="1872" name="XLXI_49" orien="R0" />
        <instance x="2896" y="1952" name="XLXI_50" orien="R0" />
        <bustap x2="4304" y1="1840" y2="1840" x1="4400" />
        <branch name="F(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1840" type="branch" />
            <wire x2="4240" y1="1840" y2="1840" x1="3120" />
            <wire x2="4304" y1="1840" y2="1840" x1="4240" />
        </branch>
        <bustap x2="4304" y1="1920" y2="1920" x1="4400" />
        <branch name="F(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1920" type="branch" />
            <wire x2="4240" y1="1920" y2="1920" x1="3120" />
            <wire x2="4304" y1="1920" y2="1920" x1="4240" />
        </branch>
        <branch name="F(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1680" type="branch" />
            <wire x2="1808" y1="3008" y2="3008" x1="1760" />
            <wire x2="1920" y1="3008" y2="3008" x1="1808" />
            <wire x2="2800" y1="2880" y2="2880" x1="1808" />
            <wire x2="1808" y1="2880" y2="3008" x1="1808" />
            <wire x2="2800" y1="1680" y2="1840" x1="2800" />
            <wire x2="2896" y1="1840" y2="1840" x1="2800" />
            <wire x2="2800" y1="1840" y2="2880" x1="2800" />
            <wire x2="4240" y1="1680" y2="1680" x1="2800" />
            <wire x2="4304" y1="1680" y2="1680" x1="4240" />
        </branch>
        <branch name="F(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4240" y="1728" type="branch" />
            <wire x2="1808" y1="3072" y2="3072" x1="1760" />
            <wire x2="1888" y1="3072" y2="3072" x1="1808" />
            <wire x2="1920" y1="3072" y2="3072" x1="1888" />
            <wire x2="2832" y1="2960" y2="2960" x1="1888" />
            <wire x2="1888" y1="2960" y2="3072" x1="1888" />
            <wire x2="2832" y1="1728" y2="1920" x1="2832" />
            <wire x2="2896" y1="1920" y2="1920" x1="2832" />
            <wire x2="2832" y1="1920" y2="2960" x1="2832" />
            <wire x2="4240" y1="1728" y2="1728" x1="2832" />
            <wire x2="4304" y1="1728" y2="1728" x1="4240" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="4152" y="1660">GT</text>
        <text style="fontsize:24;fontname:Arial" x="4156" y="1708">LT</text>
        <text style="fontsize:24;fontname:Arial" x="4152" y="1760">EQ</text>
        <text style="fontsize:24;fontname:Arial" x="4156" y="1820">LE</text>
        <text style="fontsize:24;fontname:Arial" x="4152" y="1900">GE</text>
        <text style="fontsize:24;fontname:Arial" x="4152" y="1472">CB</text>
    </sheet>
</drawing>