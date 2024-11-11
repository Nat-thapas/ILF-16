<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="SER" />
        <signal name="XLXN_8" />
        <signal name="DATA(7)" />
        <signal name="DATA(6)" />
        <signal name="XLXN_11" />
        <signal name="DATA(5)" />
        <signal name="XLXN_14" />
        <signal name="XLXN_17" />
        <signal name="DATA(4)" />
        <signal name="XLXN_19" />
        <signal name="XLXN_21" />
        <signal name="DATA(3)" />
        <signal name="XLXN_23" />
        <signal name="XLXN_25" />
        <signal name="DATA(2)" />
        <signal name="XLXN_27" />
        <signal name="XLXN_29" />
        <signal name="DATA(1)" />
        <signal name="XLXN_31" />
        <signal name="XLXN_33" />
        <signal name="DATA(0)" />
        <signal name="XLXN_35" />
        <signal name="XLXN_39" />
        <signal name="DATA(7:0)" />
        <signal name="CE" />
        <signal name="BGN" />
        <signal name="STP" />
        <signal name="XLXN_215" />
        <signal name="CLR" />
        <signal name="TXE" />
        <signal name="XLXN_228" />
        <signal name="TXC" />
        <signal name="XLXN_313" />
        <signal name="XLXN_410" />
        <signal name="D" />
        <signal name="S" />
        <signal name="XLXN_284" />
        <signal name="XLXN_285" />
        <signal name="XLXN_287" />
        <signal name="XLXN_289" />
        <signal name="XLXN_291" />
        <signal name="XLXN_292" />
        <signal name="XLXN_301" />
        <signal name="XLXN_304" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="DATA(7:0)" />
        <port polarity="Input" name="CE" />
        <port polarity="Input" name="BGN" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="D" />
        <port polarity="Output" name="S" />
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
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
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
        <blockdef name="fjkce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <block symbolname="fjkce" name="XLXI_75">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_215" name="CLR" />
            <blockpin signalname="BGN" name="J" />
            <blockpin signalname="STP" name="K" />
            <blockpin signalname="TXE" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_15">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_14" name="D" />
            <blockpin signalname="XLXN_11" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_16">
            <blockpin signalname="DATA(5)" name="D0" />
            <blockpin signalname="XLXN_11" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_17">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_19" name="D" />
            <blockpin signalname="XLXN_17" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_18">
            <blockpin signalname="DATA(4)" name="D0" />
            <blockpin signalname="XLXN_17" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_19">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_23" name="D" />
            <blockpin signalname="XLXN_21" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_20">
            <blockpin signalname="DATA(3)" name="D0" />
            <blockpin signalname="XLXN_21" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_27" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_21">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_27" name="D" />
            <blockpin signalname="XLXN_25" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_22">
            <blockpin signalname="DATA(2)" name="D0" />
            <blockpin signalname="XLXN_25" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_23">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_31" name="D" />
            <blockpin signalname="XLXN_29" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_24">
            <blockpin signalname="DATA(1)" name="D0" />
            <blockpin signalname="XLXN_29" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_35" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_25">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_35" name="D" />
            <blockpin signalname="XLXN_33" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_26">
            <blockpin signalname="DATA(0)" name="D0" />
            <blockpin signalname="XLXN_33" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_39" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_27">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_39" name="D" />
            <blockpin signalname="SER" name="Q" />
        </block>
        <block symbolname="m2_1" name="XLXI_14">
            <blockpin signalname="DATA(6)" name="D0" />
            <blockpin signalname="DATA(7)" name="D1" />
            <blockpin signalname="TXE" name="S0" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_109">
            <blockpin signalname="XLXN_215" name="G" />
        </block>
        <block symbolname="fde" name="XLXI_69">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="TXE" name="CE" />
            <blockpin signalname="SER" name="D" />
            <blockpin signalname="XLXN_313" name="Q" />
        </block>
        <block symbolname="fde" name="XLXI_114">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="TXE" name="CE" />
            <blockpin signalname="XLXN_228" name="D" />
            <blockpin signalname="TXC" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_115">
            <blockpin signalname="TXC" name="I" />
            <blockpin signalname="XLXN_228" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_67">
            <blockpin signalname="TXC" name="I0" />
            <blockpin signalname="XLXN_313" name="I1" />
            <blockpin signalname="XLXN_410" name="O" />
        </block>
        <block symbolname="fde" name="XLXI_119">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="TXE" name="CE" />
            <blockpin signalname="XLXN_287" name="D" />
            <blockpin signalname="XLXN_304" name="Q" />
        </block>
        <block symbolname="fde" name="XLXI_120">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_284" name="CE" />
            <blockpin signalname="XLXN_289" name="D" />
            <blockpin signalname="XLXN_301" name="Q" />
        </block>
        <block symbolname="and2" name="XLXI_123">
            <blockpin signalname="TXE" name="I0" />
            <blockpin signalname="XLXN_304" name="I1" />
            <blockpin signalname="XLXN_284" name="O" />
        </block>
        <block symbolname="fde" name="XLXI_121">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_285" name="CE" />
            <blockpin signalname="XLXN_291" name="D" />
            <blockpin signalname="XLXN_292" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_128">
            <blockpin signalname="XLXN_304" name="I" />
            <blockpin signalname="XLXN_287" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_129">
            <blockpin signalname="XLXN_301" name="I" />
            <blockpin signalname="XLXN_289" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_130">
            <blockpin signalname="XLXN_292" name="I" />
            <blockpin signalname="XLXN_291" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_122">
            <blockpin signalname="TXE" name="I0" />
            <blockpin signalname="XLXN_301" name="I1" />
            <blockpin signalname="XLXN_304" name="I2" />
            <blockpin signalname="XLXN_285" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_131">
            <blockpin signalname="XLXN_292" name="I0" />
            <blockpin signalname="XLXN_301" name="I1" />
            <blockpin signalname="XLXN_304" name="I2" />
            <blockpin signalname="STP" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_175">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_313" name="D" />
            <blockpin signalname="D" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_176">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_410" name="D" />
            <blockpin signalname="S" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="10560" height="5440">
        <branch name="DATA(7)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="320" type="branch" />
            <wire x2="848" y1="256" y2="320" x1="848" />
            <wire x2="848" y1="320" y2="544" x1="848" />
            <wire x2="896" y1="544" y2="544" x1="848" />
            <wire x2="1280" y1="544" y2="544" x1="896" />
            <wire x2="1360" y1="544" y2="544" x1="1280" />
        </branch>
        <branch name="DATA(6)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="320" type="branch" />
            <wire x2="1328" y1="256" y2="320" x1="1328" />
            <wire x2="1328" y1="320" y2="480" x1="1328" />
            <wire x2="1360" y1="480" y2="480" x1="1328" />
        </branch>
        <instance x="1776" y="800" name="XLXI_15" orien="R0" />
        <instance x="2240" y="640" name="XLXI_16" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="2240" y1="544" y2="544" x1="2160" />
        </branch>
        <branch name="DATA(5)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2208" y="320" type="branch" />
            <wire x2="2208" y1="256" y2="320" x1="2208" />
            <wire x2="2208" y1="320" y2="480" x1="2208" />
            <wire x2="2240" y1="480" y2="480" x1="2208" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1728" y1="512" y2="512" x1="1680" />
            <wire x2="1728" y1="512" y2="544" x1="1728" />
            <wire x2="1776" y1="544" y2="544" x1="1728" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="3120" y1="544" y2="544" x1="3040" />
        </branch>
        <branch name="DATA(4)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3088" y="320" type="branch" />
            <wire x2="3088" y1="256" y2="320" x1="3088" />
            <wire x2="3088" y1="320" y2="480" x1="3088" />
            <wire x2="3120" y1="480" y2="480" x1="3088" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="2608" y1="512" y2="512" x1="2560" />
            <wire x2="2608" y1="512" y2="544" x1="2608" />
            <wire x2="2656" y1="544" y2="544" x1="2608" />
        </branch>
        <instance x="2656" y="800" name="XLXI_17" orien="R0" />
        <instance x="3120" y="640" name="XLXI_18" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="4000" y1="544" y2="544" x1="3920" />
        </branch>
        <branch name="DATA(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3968" y="320" type="branch" />
            <wire x2="3968" y1="256" y2="320" x1="3968" />
            <wire x2="3968" y1="320" y2="480" x1="3968" />
            <wire x2="4000" y1="480" y2="480" x1="3968" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="3488" y1="512" y2="512" x1="3440" />
            <wire x2="3488" y1="512" y2="544" x1="3488" />
            <wire x2="3536" y1="544" y2="544" x1="3488" />
        </branch>
        <instance x="3536" y="800" name="XLXI_19" orien="R0" />
        <instance x="4000" y="640" name="XLXI_20" orien="R0" />
        <branch name="XLXN_25">
            <wire x2="4880" y1="544" y2="544" x1="4800" />
        </branch>
        <branch name="DATA(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4848" y="320" type="branch" />
            <wire x2="4848" y1="256" y2="320" x1="4848" />
            <wire x2="4848" y1="320" y2="480" x1="4848" />
            <wire x2="4880" y1="480" y2="480" x1="4848" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="4368" y1="512" y2="512" x1="4320" />
            <wire x2="4368" y1="512" y2="544" x1="4368" />
            <wire x2="4416" y1="544" y2="544" x1="4368" />
        </branch>
        <instance x="4416" y="800" name="XLXI_21" orien="R0" />
        <instance x="4880" y="640" name="XLXI_22" orien="R0" />
        <branch name="XLXN_29">
            <wire x2="5760" y1="544" y2="544" x1="5680" />
        </branch>
        <branch name="DATA(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="5728" y="320" type="branch" />
            <wire x2="5728" y1="256" y2="320" x1="5728" />
            <wire x2="5728" y1="320" y2="480" x1="5728" />
            <wire x2="5760" y1="480" y2="480" x1="5728" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="5248" y1="512" y2="512" x1="5200" />
            <wire x2="5248" y1="512" y2="544" x1="5248" />
            <wire x2="5296" y1="544" y2="544" x1="5248" />
        </branch>
        <instance x="5296" y="800" name="XLXI_23" orien="R0" />
        <instance x="5760" y="640" name="XLXI_24" orien="R0" />
        <branch name="XLXN_33">
            <wire x2="6640" y1="544" y2="544" x1="6560" />
        </branch>
        <branch name="DATA(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="6608" y="320" type="branch" />
            <wire x2="6608" y1="256" y2="320" x1="6608" />
            <wire x2="6608" y1="320" y2="480" x1="6608" />
            <wire x2="6640" y1="480" y2="480" x1="6608" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="6128" y1="512" y2="512" x1="6080" />
            <wire x2="6128" y1="512" y2="544" x1="6128" />
            <wire x2="6176" y1="544" y2="544" x1="6128" />
        </branch>
        <instance x="6176" y="800" name="XLXI_25" orien="R0" />
        <instance x="6640" y="640" name="XLXI_26" orien="R0" />
        <branch name="XLXN_39">
            <wire x2="7008" y1="512" y2="512" x1="6960" />
            <wire x2="7008" y1="512" y2="544" x1="7008" />
            <wire x2="7056" y1="544" y2="544" x1="7008" />
        </branch>
        <instance x="7056" y="800" name="XLXI_27" orien="R0" />
        <branch name="DATA(7:0)">
            <wire x2="848" y1="160" y2="160" x1="320" />
            <wire x2="1328" y1="160" y2="160" x1="848" />
            <wire x2="2208" y1="160" y2="160" x1="1328" />
            <wire x2="3088" y1="160" y2="160" x1="2208" />
            <wire x2="3968" y1="160" y2="160" x1="3088" />
            <wire x2="4848" y1="160" y2="160" x1="3968" />
            <wire x2="5728" y1="160" y2="160" x1="4848" />
            <wire x2="6608" y1="160" y2="160" x1="5728" />
        </branch>
        <bustap x2="848" y1="160" y2="256" x1="848" />
        <bustap x2="1328" y1="160" y2="256" x1="1328" />
        <bustap x2="2208" y1="160" y2="256" x1="2208" />
        <bustap x2="3088" y1="160" y2="256" x1="3088" />
        <bustap x2="3968" y1="160" y2="256" x1="3968" />
        <bustap x2="4848" y1="160" y2="256" x1="4848" />
        <bustap x2="5728" y1="160" y2="256" x1="5728" />
        <bustap x2="6608" y1="160" y2="256" x1="6608" />
        <instance x="1360" y="640" name="XLXI_14" orien="R0" />
        <branch name="SER">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="7520" y="544" type="branch" />
            <wire x2="7520" y1="544" y2="544" x1="7440" />
        </branch>
        <iomarker fontsize="28" x="240" y="800" name="CE" orien="R180" />
        <iomarker fontsize="28" x="256" y="880" name="CLK" orien="R180" />
        <instance x="416" y="1664" name="XLXI_75" orien="R0" />
        <branch name="BGN">
            <wire x2="416" y1="1344" y2="1344" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="1344" name="BGN" orien="R180" />
        <branch name="STP">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="240" y="1408" type="branch" />
            <wire x2="416" y1="1408" y2="1408" x1="240" />
        </branch>
        <branch name="XLXN_215">
            <wire x2="416" y1="1632" y2="1632" x1="304" />
        </branch>
        <instance x="176" y="1568" name="XLXI_109" orien="R90" />
        <iomarker fontsize="28" x="320" y="160" name="DATA(7:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="1760" name="CLR" orien="R180" />
        <branch name="SER">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1264" y="1104" type="branch" />
            <wire x2="1296" y1="1104" y2="1104" x1="1264" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1264" y="1232" type="branch" />
            <wire x2="1296" y1="1232" y2="1232" x1="1264" />
        </branch>
        <instance x="1296" y="1360" name="XLXI_69" orien="R0" />
        <instance x="1296" y="1840" name="XLXI_114" orien="R0" />
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1264" y="1712" type="branch" />
            <wire x2="1296" y1="1712" y2="1712" x1="1264" />
        </branch>
        <instance x="1600" y="1360" name="XLXI_115" orien="R180" />
        <branch name="XLXN_228">
            <wire x2="1376" y1="1392" y2="1392" x1="1280" />
            <wire x2="1280" y1="1392" y2="1584" x1="1280" />
            <wire x2="1296" y1="1584" y2="1584" x1="1280" />
        </branch>
        <branch name="TXC">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1584" type="branch" />
            <wire x2="1712" y1="1392" y2="1392" x1="1600" />
            <wire x2="1712" y1="1392" y2="1584" x1="1712" />
            <wire x2="1776" y1="1584" y2="1584" x1="1712" />
            <wire x2="1920" y1="1584" y2="1584" x1="1776" />
            <wire x2="1712" y1="1584" y2="1584" x1="1680" />
        </branch>
        <instance x="1920" y="1648" name="XLXI_67" orien="R0" />
        <branch name="XLXN_313">
            <wire x2="1840" y1="1104" y2="1104" x1="1680" />
            <wire x2="1840" y1="1104" y2="1520" x1="1840" />
            <wire x2="1920" y1="1520" y2="1520" x1="1840" />
            <wire x2="2256" y1="1104" y2="1104" x1="1840" />
        </branch>
        <branch name="XLXN_410">
            <wire x2="2208" y1="1552" y2="1552" x1="2176" />
            <wire x2="2208" y1="1552" y2="1584" x1="2208" />
            <wire x2="2256" y1="1584" y2="1584" x1="2208" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="1232" type="branch" />
            <wire x2="2256" y1="1232" y2="1232" x1="2224" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2224" y="1712" type="branch" />
            <wire x2="2256" y1="1712" y2="1712" x1="2224" />
        </branch>
        <branch name="D">
            <wire x2="2720" y1="1104" y2="1104" x1="2640" />
        </branch>
        <branch name="S">
            <wire x2="2720" y1="1584" y2="1584" x1="2640" />
        </branch>
        <iomarker fontsize="28" x="2720" y="1104" name="D" orien="R0" />
        <iomarker fontsize="28" x="2720" y="1584" name="S" orien="R0" />
        <instance x="736" y="2560" name="XLXI_119" orien="R0" />
        <instance x="1536" y="2560" name="XLXI_120" orien="R0" />
        <instance x="1248" y="2464" name="XLXI_123" orien="R0" />
        <branch name="XLXN_284">
            <wire x2="1536" y1="2368" y2="2368" x1="1504" />
        </branch>
        <branch name="XLXN_285">
            <wire x2="2416" y1="2368" y2="2368" x1="2384" />
        </branch>
        <instance x="2416" y="2560" name="XLXI_121" orien="R0" />
        <instance x="1040" y="2048" name="XLXI_128" orien="R180" />
        <instance x="1840" y="2048" name="XLXI_129" orien="R180" />
        <instance x="2720" y="2048" name="XLXI_130" orien="R180" />
        <branch name="XLXN_287">
            <wire x2="720" y1="2080" y2="2304" x1="720" />
            <wire x2="736" y1="2304" y2="2304" x1="720" />
            <wire x2="816" y1="2080" y2="2080" x1="720" />
        </branch>
        <branch name="XLXN_289">
            <wire x2="1520" y1="2080" y2="2304" x1="1520" />
            <wire x2="1536" y1="2304" y2="2304" x1="1520" />
            <wire x2="1616" y1="2080" y2="2080" x1="1520" />
        </branch>
        <branch name="XLXN_291">
            <wire x2="2496" y1="2080" y2="2080" x1="2400" />
            <wire x2="2400" y1="2080" y2="2304" x1="2400" />
            <wire x2="2416" y1="2304" y2="2304" x1="2400" />
        </branch>
        <instance x="2128" y="2496" name="XLXI_122" orien="R0" />
        <branch name="XLXN_292">
            <wire x2="2816" y1="2080" y2="2080" x1="2720" />
            <wire x2="2816" y1="2080" y2="2304" x1="2816" />
            <wire x2="2816" y1="2304" y2="2304" x1="2800" />
            <wire x2="2816" y1="2048" y2="2080" x1="2816" />
            <wire x2="2960" y1="2048" y2="2048" x1="2816" />
        </branch>
        <branch name="XLXN_301">
            <wire x2="1936" y1="2080" y2="2080" x1="1840" />
            <wire x2="1936" y1="2080" y2="2304" x1="1936" />
            <wire x2="1936" y1="2304" y2="2368" x1="1936" />
            <wire x2="2128" y1="2368" y2="2368" x1="1936" />
            <wire x2="1936" y1="2304" y2="2304" x1="1920" />
            <wire x2="2960" y1="1984" y2="1984" x1="1936" />
            <wire x2="1936" y1="1984" y2="2080" x1="1936" />
        </branch>
        <branch name="XLXN_304">
            <wire x2="1136" y1="2080" y2="2080" x1="1040" />
            <wire x2="1136" y1="2080" y2="2304" x1="1136" />
            <wire x2="1136" y1="2304" y2="2336" x1="1136" />
            <wire x2="1248" y1="2336" y2="2336" x1="1136" />
            <wire x2="1136" y1="2304" y2="2304" x1="1120" />
            <wire x2="1136" y1="1920" y2="2080" x1="1136" />
            <wire x2="1968" y1="1920" y2="1920" x1="1136" />
            <wire x2="1968" y1="1920" y2="2304" x1="1968" />
            <wire x2="2128" y1="2304" y2="2304" x1="1968" />
            <wire x2="2960" y1="1920" y2="1920" x1="1968" />
        </branch>
        <instance x="2960" y="2112" name="XLXI_131" orien="R0" />
        <branch name="STP">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3280" y="1984" type="branch" />
            <wire x2="3280" y1="1984" y2="1984" x1="3216" />
        </branch>
        <branch name="TXE">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1408" type="branch" />
            <wire x2="1008" y1="1840" y2="1840" x1="384" />
            <wire x2="384" y1="1840" y2="2560" x1="384" />
            <wire x2="672" y1="2560" y2="2560" x1="384" />
            <wire x2="1136" y1="2560" y2="2560" x1="672" />
            <wire x2="1968" y1="2560" y2="2560" x1="1136" />
            <wire x2="736" y1="2368" y2="2368" x1="672" />
            <wire x2="672" y1="2368" y2="2560" x1="672" />
            <wire x2="944" y1="1408" y2="1408" x1="800" />
            <wire x2="1008" y1="1408" y2="1408" x1="944" />
            <wire x2="1008" y1="1408" y2="1648" x1="1008" />
            <wire x2="1296" y1="1648" y2="1648" x1="1008" />
            <wire x2="1008" y1="1648" y2="1840" x1="1008" />
            <wire x2="1328" y1="896" y2="896" x1="1008" />
            <wire x2="2208" y1="896" y2="896" x1="1328" />
            <wire x2="3088" y1="896" y2="896" x1="2208" />
            <wire x2="3968" y1="896" y2="896" x1="3088" />
            <wire x2="4848" y1="896" y2="896" x1="3968" />
            <wire x2="5728" y1="896" y2="896" x1="4848" />
            <wire x2="6608" y1="896" y2="896" x1="5728" />
            <wire x2="1008" y1="896" y2="1168" x1="1008" />
            <wire x2="1296" y1="1168" y2="1168" x1="1008" />
            <wire x2="1008" y1="1168" y2="1408" x1="1008" />
            <wire x2="1248" y1="2400" y2="2400" x1="1136" />
            <wire x2="1136" y1="2400" y2="2560" x1="1136" />
            <wire x2="1360" y1="608" y2="608" x1="1328" />
            <wire x2="1328" y1="608" y2="896" x1="1328" />
            <wire x2="2128" y1="2432" y2="2432" x1="1968" />
            <wire x2="1968" y1="2432" y2="2560" x1="1968" />
            <wire x2="2240" y1="608" y2="608" x1="2208" />
            <wire x2="2208" y1="608" y2="896" x1="2208" />
            <wire x2="3120" y1="608" y2="608" x1="3088" />
            <wire x2="3088" y1="608" y2="896" x1="3088" />
            <wire x2="4000" y1="608" y2="608" x1="3968" />
            <wire x2="3968" y1="608" y2="896" x1="3968" />
            <wire x2="4880" y1="608" y2="608" x1="4848" />
            <wire x2="4848" y1="608" y2="896" x1="4848" />
            <wire x2="5760" y1="608" y2="608" x1="5728" />
            <wire x2="5728" y1="608" y2="896" x1="5728" />
            <wire x2="6640" y1="608" y2="608" x1="6608" />
            <wire x2="6608" y1="608" y2="896" x1="6608" />
        </branch>
        <instance x="2256" y="1360" name="XLXI_175" orien="R0" />
        <instance x="2256" y="1840" name="XLXI_176" orien="R0" />
        <branch name="CLR">
            <wire x2="864" y1="1760" y2="1760" x1="256" />
            <wire x2="864" y1="864" y2="1760" x1="864" />
            <wire x2="1744" y1="864" y2="864" x1="864" />
            <wire x2="2624" y1="864" y2="864" x1="1744" />
            <wire x2="3504" y1="864" y2="864" x1="2624" />
            <wire x2="4384" y1="864" y2="864" x1="3504" />
            <wire x2="5264" y1="864" y2="864" x1="4384" />
            <wire x2="6144" y1="864" y2="864" x1="5264" />
            <wire x2="7024" y1="864" y2="864" x1="6144" />
            <wire x2="1776" y1="768" y2="768" x1="1744" />
            <wire x2="1744" y1="768" y2="864" x1="1744" />
            <wire x2="2656" y1="768" y2="768" x1="2624" />
            <wire x2="2624" y1="768" y2="864" x1="2624" />
            <wire x2="3536" y1="768" y2="768" x1="3504" />
            <wire x2="3504" y1="768" y2="864" x1="3504" />
            <wire x2="4416" y1="768" y2="768" x1="4384" />
            <wire x2="4384" y1="768" y2="864" x1="4384" />
            <wire x2="5296" y1="768" y2="768" x1="5264" />
            <wire x2="5264" y1="768" y2="864" x1="5264" />
            <wire x2="6176" y1="768" y2="768" x1="6144" />
            <wire x2="6144" y1="768" y2="864" x1="6144" />
            <wire x2="7056" y1="768" y2="768" x1="7024" />
            <wire x2="7024" y1="768" y2="864" x1="7024" />
        </branch>
        <branch name="CLK">
            <wire x2="352" y1="880" y2="880" x1="256" />
            <wire x2="352" y1="880" y2="1536" x1="352" />
            <wire x2="416" y1="1536" y2="1536" x1="352" />
            <wire x2="352" y1="1536" y2="2528" x1="352" />
            <wire x2="704" y1="2528" y2="2528" x1="352" />
            <wire x2="1504" y1="2528" y2="2528" x1="704" />
            <wire x2="2384" y1="2528" y2="2528" x1="1504" />
            <wire x2="832" y1="880" y2="880" x1="352" />
            <wire x2="736" y1="2432" y2="2432" x1="704" />
            <wire x2="704" y1="2432" y2="2528" x1="704" />
            <wire x2="1712" y1="832" y2="832" x1="832" />
            <wire x2="2592" y1="832" y2="832" x1="1712" />
            <wire x2="3472" y1="832" y2="832" x1="2592" />
            <wire x2="4352" y1="832" y2="832" x1="3472" />
            <wire x2="5232" y1="832" y2="832" x1="4352" />
            <wire x2="6112" y1="832" y2="832" x1="5232" />
            <wire x2="6992" y1="832" y2="832" x1="6112" />
            <wire x2="832" y1="832" y2="880" x1="832" />
            <wire x2="1536" y1="2432" y2="2432" x1="1504" />
            <wire x2="1504" y1="2432" y2="2528" x1="1504" />
            <wire x2="1776" y1="672" y2="672" x1="1712" />
            <wire x2="1712" y1="672" y2="832" x1="1712" />
            <wire x2="2416" y1="2432" y2="2432" x1="2384" />
            <wire x2="2384" y1="2432" y2="2528" x1="2384" />
            <wire x2="2656" y1="672" y2="672" x1="2592" />
            <wire x2="2592" y1="672" y2="832" x1="2592" />
            <wire x2="3536" y1="672" y2="672" x1="3472" />
            <wire x2="3472" y1="672" y2="832" x1="3472" />
            <wire x2="4416" y1="672" y2="672" x1="4352" />
            <wire x2="4352" y1="672" y2="832" x1="4352" />
            <wire x2="5296" y1="672" y2="672" x1="5232" />
            <wire x2="5232" y1="672" y2="832" x1="5232" />
            <wire x2="6176" y1="672" y2="672" x1="6112" />
            <wire x2="6112" y1="672" y2="832" x1="6112" />
            <wire x2="7056" y1="672" y2="672" x1="6992" />
            <wire x2="6992" y1="672" y2="832" x1="6992" />
        </branch>
        <branch name="CE">
            <wire x2="320" y1="800" y2="800" x1="240" />
            <wire x2="320" y1="800" y2="1472" x1="320" />
            <wire x2="416" y1="1472" y2="1472" x1="320" />
            <wire x2="800" y1="800" y2="800" x1="320" />
            <wire x2="1680" y1="800" y2="800" x1="800" />
            <wire x2="2560" y1="800" y2="800" x1="1680" />
            <wire x2="3440" y1="800" y2="800" x1="2560" />
            <wire x2="4320" y1="800" y2="800" x1="3440" />
            <wire x2="5200" y1="800" y2="800" x1="4320" />
            <wire x2="6080" y1="800" y2="800" x1="5200" />
            <wire x2="6960" y1="800" y2="800" x1="6080" />
            <wire x2="1776" y1="608" y2="608" x1="1680" />
            <wire x2="1680" y1="608" y2="800" x1="1680" />
            <wire x2="2656" y1="608" y2="608" x1="2560" />
            <wire x2="2560" y1="608" y2="800" x1="2560" />
            <wire x2="3536" y1="608" y2="608" x1="3440" />
            <wire x2="3440" y1="608" y2="800" x1="3440" />
            <wire x2="4416" y1="608" y2="608" x1="4320" />
            <wire x2="4320" y1="608" y2="800" x1="4320" />
            <wire x2="5296" y1="608" y2="608" x1="5200" />
            <wire x2="5200" y1="608" y2="800" x1="5200" />
            <wire x2="6176" y1="608" y2="608" x1="6080" />
            <wire x2="6080" y1="608" y2="800" x1="6080" />
            <wire x2="7056" y1="608" y2="608" x1="6960" />
            <wire x2="6960" y1="608" y2="800" x1="6960" />
        </branch>
    </sheet>
</drawing>