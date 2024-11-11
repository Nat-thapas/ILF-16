<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ID(7:0)" />
        <signal name="ID(3)" />
        <signal name="ID(2)" />
        <signal name="ID(1)" />
        <signal name="ID(0)" />
        <signal name="C(15:0)" />
        <signal name="C(3)" />
        <signal name="C(2)" />
        <signal name="C(1)" />
        <signal name="C(0)" />
        <signal name="A(15:0)" />
        <signal name="A(7)" />
        <signal name="A(6)" />
        <signal name="A(5)" />
        <signal name="A(4)" />
        <signal name="A(3)" />
        <signal name="A(2)" />
        <signal name="A(1)" />
        <signal name="A(0)" />
        <signal name="B(15:0)" />
        <signal name="B(7)" />
        <signal name="B(6)" />
        <signal name="B(5)" />
        <signal name="B(4)" />
        <signal name="B(3)" />
        <signal name="B(2)" />
        <signal name="B(1)" />
        <signal name="B(0)" />
        <signal name="GFX_INST(31:0)" />
        <signal name="GFX_INST(31)" />
        <signal name="GFX_INST(30)" />
        <signal name="GFX_INST(29)" />
        <signal name="GFX_INST(28)" />
        <signal name="GFX_INST(27)" />
        <signal name="GFX_INST(26)" />
        <signal name="GFX_INST(25)" />
        <signal name="GFX_INST(24)" />
        <signal name="GFX_INST(23)" />
        <signal name="GFX_INST(22)" />
        <signal name="GFX_INST(21)" />
        <signal name="GFX_INST(20)" />
        <signal name="GFX_INST(19)" />
        <signal name="GFX_INST(18)" />
        <signal name="GFX_INST(17)" />
        <signal name="GFX_INST(16)" />
        <signal name="GFX_INST(15)" />
        <signal name="GFX_INST(14)" />
        <signal name="GFX_INST(13)" />
        <signal name="GFX_INST(12)" />
        <signal name="GFX_INST(11)" />
        <signal name="GFX_INST(10)" />
        <signal name="GFX_INST(9)" />
        <signal name="GFX_INST(8)" />
        <signal name="GFX_INST(7)" />
        <signal name="GFX_INST(6)" />
        <signal name="GFX_INST(5)" />
        <signal name="GFX_INST(4)" />
        <signal name="GFX_INST(3)" />
        <signal name="GFX_INST(2)" />
        <signal name="GFX_INST(1)" />
        <signal name="GFX_INST(0)" />
        <port polarity="Input" name="ID(7:0)" />
        <port polarity="Input" name="C(15:0)" />
        <port polarity="Input" name="A(15:0)" />
        <port polarity="Input" name="B(15:0)" />
        <port polarity="Output" name="GFX_INST(31:0)" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="ID(3)" name="I" />
            <blockpin signalname="GFX_INST(31)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="ID(2)" name="I" />
            <blockpin signalname="GFX_INST(30)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="ID(1)" name="I" />
            <blockpin signalname="GFX_INST(29)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="ID(0)" name="I" />
            <blockpin signalname="GFX_INST(28)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_8">
            <blockpin signalname="GFX_INST(27)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_9">
            <blockpin signalname="GFX_INST(26)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_10">
            <blockpin signalname="GFX_INST(25)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_11">
            <blockpin signalname="GFX_INST(24)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_12">
            <blockpin signalname="GFX_INST(23)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_13">
            <blockpin signalname="GFX_INST(22)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_14">
            <blockpin signalname="GFX_INST(21)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="GFX_INST(20)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="C(3)" name="I" />
            <blockpin signalname="GFX_INST(19)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="C(2)" name="I" />
            <blockpin signalname="GFX_INST(18)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="C(1)" name="I" />
            <blockpin signalname="GFX_INST(17)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="C(0)" name="I" />
            <blockpin signalname="GFX_INST(16)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_20">
            <blockpin signalname="A(7)" name="I" />
            <blockpin signalname="GFX_INST(15)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_21">
            <blockpin signalname="A(6)" name="I" />
            <blockpin signalname="GFX_INST(14)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_22">
            <blockpin signalname="A(5)" name="I" />
            <blockpin signalname="GFX_INST(13)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_23">
            <blockpin signalname="A(4)" name="I" />
            <blockpin signalname="GFX_INST(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_24">
            <blockpin signalname="A(3)" name="I" />
            <blockpin signalname="GFX_INST(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_25">
            <blockpin signalname="A(2)" name="I" />
            <blockpin signalname="GFX_INST(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_26">
            <blockpin signalname="A(1)" name="I" />
            <blockpin signalname="GFX_INST(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_27">
            <blockpin signalname="A(0)" name="I" />
            <blockpin signalname="GFX_INST(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_28">
            <blockpin signalname="B(7)" name="I" />
            <blockpin signalname="GFX_INST(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_29">
            <blockpin signalname="B(6)" name="I" />
            <blockpin signalname="GFX_INST(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_30">
            <blockpin signalname="B(5)" name="I" />
            <blockpin signalname="GFX_INST(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_31">
            <blockpin signalname="B(4)" name="I" />
            <blockpin signalname="GFX_INST(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_32">
            <blockpin signalname="B(3)" name="I" />
            <blockpin signalname="GFX_INST(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_33">
            <blockpin signalname="B(2)" name="I" />
            <blockpin signalname="GFX_INST(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_34">
            <blockpin signalname="B(1)" name="I" />
            <blockpin signalname="GFX_INST(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_35">
            <blockpin signalname="B(0)" name="I" />
            <blockpin signalname="GFX_INST(0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="3520">
        <iomarker fontsize="28" x="272" y="160" name="ID(7:0)" orien="R180" />
        <branch name="ID(7:0)">
            <wire x2="320" y1="160" y2="160" x1="272" />
            <wire x2="320" y1="160" y2="240" x1="320" />
            <wire x2="320" y1="240" y2="320" x1="320" />
            <wire x2="320" y1="320" y2="400" x1="320" />
        </branch>
        <instance x="560" y="192" name="XLXI_4" orien="R0" />
        <instance x="560" y="272" name="XLXI_5" orien="R0" />
        <instance x="560" y="352" name="XLXI_6" orien="R0" />
        <instance x="560" y="432" name="XLXI_7" orien="R0" />
        <bustap x2="416" y1="160" y2="160" x1="320" />
        <branch name="ID(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="160" type="branch" />
            <wire x2="480" y1="160" y2="160" x1="416" />
            <wire x2="560" y1="160" y2="160" x1="480" />
        </branch>
        <bustap x2="416" y1="240" y2="240" x1="320" />
        <branch name="ID(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="240" type="branch" />
            <wire x2="480" y1="240" y2="240" x1="416" />
            <wire x2="560" y1="240" y2="240" x1="480" />
        </branch>
        <bustap x2="416" y1="320" y2="320" x1="320" />
        <branch name="ID(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="320" type="branch" />
            <wire x2="480" y1="320" y2="320" x1="416" />
            <wire x2="560" y1="320" y2="320" x1="480" />
        </branch>
        <bustap x2="416" y1="400" y2="400" x1="320" />
        <branch name="ID(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="400" type="branch" />
            <wire x2="480" y1="400" y2="400" x1="416" />
            <wire x2="560" y1="400" y2="400" x1="480" />
        </branch>
        <instance x="592" y="416" name="XLXI_8" orien="R90" />
        <instance x="592" y="496" name="XLXI_9" orien="R90" />
        <instance x="592" y="576" name="XLXI_10" orien="R90" />
        <instance x="592" y="656" name="XLXI_11" orien="R90" />
        <instance x="592" y="736" name="XLXI_12" orien="R90" />
        <instance x="592" y="816" name="XLXI_13" orien="R90" />
        <instance x="592" y="896" name="XLXI_14" orien="R90" />
        <instance x="592" y="976" name="XLXI_15" orien="R90" />
        <instance x="560" y="1152" name="XLXI_16" orien="R0" />
        <instance x="560" y="1232" name="XLXI_17" orien="R0" />
        <instance x="560" y="1312" name="XLXI_18" orien="R0" />
        <instance x="560" y="1392" name="XLXI_19" orien="R0" />
        <instance x="560" y="1472" name="XLXI_20" orien="R0" />
        <instance x="560" y="1552" name="XLXI_21" orien="R0" />
        <instance x="560" y="1632" name="XLXI_22" orien="R0" />
        <instance x="560" y="1712" name="XLXI_23" orien="R0" />
        <instance x="560" y="1792" name="XLXI_24" orien="R0" />
        <instance x="560" y="1872" name="XLXI_25" orien="R0" />
        <instance x="560" y="1952" name="XLXI_26" orien="R0" />
        <instance x="560" y="2032" name="XLXI_27" orien="R0" />
        <instance x="560" y="2112" name="XLXI_28" orien="R0" />
        <instance x="560" y="2192" name="XLXI_29" orien="R0" />
        <instance x="560" y="2272" name="XLXI_30" orien="R0" />
        <instance x="560" y="2352" name="XLXI_31" orien="R0" />
        <instance x="560" y="2432" name="XLXI_32" orien="R0" />
        <instance x="560" y="2512" name="XLXI_33" orien="R0" />
        <instance x="560" y="2592" name="XLXI_34" orien="R0" />
        <instance x="560" y="2672" name="XLXI_35" orien="R0" />
        <iomarker fontsize="28" x="272" y="1120" name="C(15:0)" orien="R180" />
        <branch name="C(15:0)">
            <wire x2="320" y1="1120" y2="1120" x1="272" />
            <wire x2="320" y1="1120" y2="1200" x1="320" />
            <wire x2="320" y1="1200" y2="1280" x1="320" />
            <wire x2="320" y1="1280" y2="1360" x1="320" />
        </branch>
        <bustap x2="416" y1="1120" y2="1120" x1="320" />
        <branch name="C(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1120" type="branch" />
            <wire x2="480" y1="1120" y2="1120" x1="416" />
            <wire x2="560" y1="1120" y2="1120" x1="480" />
        </branch>
        <bustap x2="416" y1="1200" y2="1200" x1="320" />
        <branch name="C(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1200" type="branch" />
            <wire x2="480" y1="1200" y2="1200" x1="416" />
            <wire x2="560" y1="1200" y2="1200" x1="480" />
        </branch>
        <bustap x2="416" y1="1280" y2="1280" x1="320" />
        <branch name="C(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1280" type="branch" />
            <wire x2="480" y1="1280" y2="1280" x1="416" />
            <wire x2="560" y1="1280" y2="1280" x1="480" />
        </branch>
        <bustap x2="416" y1="1360" y2="1360" x1="320" />
        <branch name="C(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1360" type="branch" />
            <wire x2="480" y1="1360" y2="1360" x1="416" />
            <wire x2="560" y1="1360" y2="1360" x1="480" />
        </branch>
        <branch name="A(15:0)">
            <wire x2="304" y1="1440" y2="1440" x1="288" />
            <wire x2="320" y1="1440" y2="1440" x1="304" />
            <wire x2="320" y1="1440" y2="1520" x1="320" />
            <wire x2="320" y1="1520" y2="1600" x1="320" />
            <wire x2="320" y1="1600" y2="1680" x1="320" />
            <wire x2="320" y1="1680" y2="1760" x1="320" />
            <wire x2="320" y1="1760" y2="1840" x1="320" />
            <wire x2="320" y1="1840" y2="1920" x1="320" />
            <wire x2="320" y1="1920" y2="2000" x1="320" />
        </branch>
        <bustap x2="416" y1="1440" y2="1440" x1="320" />
        <branch name="A(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1440" type="branch" />
            <wire x2="480" y1="1440" y2="1440" x1="416" />
            <wire x2="560" y1="1440" y2="1440" x1="480" />
        </branch>
        <bustap x2="416" y1="1520" y2="1520" x1="320" />
        <branch name="A(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1520" type="branch" />
            <wire x2="480" y1="1520" y2="1520" x1="416" />
            <wire x2="560" y1="1520" y2="1520" x1="480" />
        </branch>
        <bustap x2="416" y1="1600" y2="1600" x1="320" />
        <branch name="A(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1600" type="branch" />
            <wire x2="480" y1="1600" y2="1600" x1="416" />
            <wire x2="560" y1="1600" y2="1600" x1="480" />
        </branch>
        <bustap x2="416" y1="1680" y2="1680" x1="320" />
        <branch name="A(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1680" type="branch" />
            <wire x2="480" y1="1680" y2="1680" x1="416" />
            <wire x2="560" y1="1680" y2="1680" x1="480" />
        </branch>
        <bustap x2="416" y1="1760" y2="1760" x1="320" />
        <branch name="A(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1760" type="branch" />
            <wire x2="480" y1="1760" y2="1760" x1="416" />
            <wire x2="560" y1="1760" y2="1760" x1="480" />
        </branch>
        <bustap x2="416" y1="1840" y2="1840" x1="320" />
        <branch name="A(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1840" type="branch" />
            <wire x2="480" y1="1840" y2="1840" x1="416" />
            <wire x2="560" y1="1840" y2="1840" x1="480" />
        </branch>
        <bustap x2="416" y1="1920" y2="1920" x1="320" />
        <branch name="A(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1920" type="branch" />
            <wire x2="480" y1="1920" y2="1920" x1="416" />
            <wire x2="560" y1="1920" y2="1920" x1="480" />
        </branch>
        <bustap x2="416" y1="2000" y2="2000" x1="320" />
        <branch name="A(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2000" type="branch" />
            <wire x2="480" y1="2000" y2="2000" x1="416" />
            <wire x2="560" y1="2000" y2="2000" x1="480" />
        </branch>
        <iomarker fontsize="28" x="288" y="2080" name="B(15:0)" orien="R180" />
        <branch name="B(15:0)">
            <wire x2="320" y1="2080" y2="2080" x1="288" />
            <wire x2="320" y1="2080" y2="2160" x1="320" />
            <wire x2="320" y1="2160" y2="2240" x1="320" />
            <wire x2="320" y1="2240" y2="2320" x1="320" />
            <wire x2="320" y1="2320" y2="2400" x1="320" />
            <wire x2="320" y1="2400" y2="2480" x1="320" />
            <wire x2="320" y1="2480" y2="2560" x1="320" />
            <wire x2="320" y1="2560" y2="2640" x1="320" />
        </branch>
        <iomarker fontsize="28" x="288" y="1440" name="A(15:0)" orien="R180" />
        <bustap x2="416" y1="2080" y2="2080" x1="320" />
        <branch name="B(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2080" type="branch" />
            <wire x2="480" y1="2080" y2="2080" x1="416" />
            <wire x2="560" y1="2080" y2="2080" x1="480" />
        </branch>
        <bustap x2="416" y1="2160" y2="2160" x1="320" />
        <branch name="B(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2160" type="branch" />
            <wire x2="480" y1="2160" y2="2160" x1="416" />
            <wire x2="560" y1="2160" y2="2160" x1="480" />
        </branch>
        <bustap x2="416" y1="2240" y2="2240" x1="320" />
        <branch name="B(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2240" type="branch" />
            <wire x2="480" y1="2240" y2="2240" x1="416" />
            <wire x2="560" y1="2240" y2="2240" x1="480" />
        </branch>
        <bustap x2="416" y1="2320" y2="2320" x1="320" />
        <branch name="B(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2320" type="branch" />
            <wire x2="480" y1="2320" y2="2320" x1="416" />
            <wire x2="560" y1="2320" y2="2320" x1="480" />
        </branch>
        <bustap x2="416" y1="2400" y2="2400" x1="320" />
        <branch name="B(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2400" type="branch" />
            <wire x2="480" y1="2400" y2="2400" x1="416" />
            <wire x2="560" y1="2400" y2="2400" x1="480" />
        </branch>
        <bustap x2="416" y1="2480" y2="2480" x1="320" />
        <branch name="B(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2480" type="branch" />
            <wire x2="480" y1="2480" y2="2480" x1="416" />
            <wire x2="560" y1="2480" y2="2480" x1="480" />
        </branch>
        <bustap x2="416" y1="2560" y2="2560" x1="320" />
        <branch name="B(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2560" type="branch" />
            <wire x2="480" y1="2560" y2="2560" x1="416" />
            <wire x2="560" y1="2560" y2="2560" x1="480" />
        </branch>
        <bustap x2="416" y1="2640" y2="2640" x1="320" />
        <branch name="B(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="2640" type="branch" />
            <wire x2="480" y1="2640" y2="2640" x1="416" />
            <wire x2="560" y1="2640" y2="2640" x1="480" />
        </branch>
        <branch name="GFX_INST(31:0)">
            <wire x2="1120" y1="160" y2="160" x1="1040" />
            <wire x2="1040" y1="160" y2="240" x1="1040" />
            <wire x2="1040" y1="240" y2="320" x1="1040" />
            <wire x2="1040" y1="320" y2="400" x1="1040" />
            <wire x2="1040" y1="400" y2="480" x1="1040" />
            <wire x2="1040" y1="480" y2="560" x1="1040" />
            <wire x2="1040" y1="560" y2="640" x1="1040" />
            <wire x2="1040" y1="640" y2="720" x1="1040" />
            <wire x2="1040" y1="720" y2="800" x1="1040" />
            <wire x2="1040" y1="800" y2="880" x1="1040" />
            <wire x2="1040" y1="880" y2="960" x1="1040" />
            <wire x2="1040" y1="960" y2="1040" x1="1040" />
            <wire x2="1040" y1="1040" y2="1120" x1="1040" />
            <wire x2="1040" y1="1120" y2="1200" x1="1040" />
            <wire x2="1040" y1="1200" y2="1280" x1="1040" />
            <wire x2="1040" y1="1280" y2="1360" x1="1040" />
            <wire x2="1040" y1="1360" y2="1440" x1="1040" />
            <wire x2="1040" y1="1440" y2="1456" x1="1040" />
            <wire x2="1040" y1="1456" y2="1520" x1="1040" />
            <wire x2="1040" y1="1520" y2="1600" x1="1040" />
            <wire x2="1040" y1="1600" y2="1680" x1="1040" />
            <wire x2="1040" y1="1680" y2="1760" x1="1040" />
            <wire x2="1040" y1="1760" y2="1840" x1="1040" />
            <wire x2="1040" y1="1840" y2="1920" x1="1040" />
            <wire x2="1040" y1="1920" y2="2000" x1="1040" />
            <wire x2="1040" y1="2000" y2="2080" x1="1040" />
            <wire x2="1040" y1="2080" y2="2160" x1="1040" />
            <wire x2="1040" y1="2160" y2="2240" x1="1040" />
            <wire x2="1040" y1="2240" y2="2320" x1="1040" />
            <wire x2="1040" y1="2320" y2="2400" x1="1040" />
            <wire x2="1040" y1="2400" y2="2416" x1="1040" />
            <wire x2="1040" y1="2416" y2="2480" x1="1040" />
            <wire x2="1040" y1="2480" y2="2560" x1="1040" />
            <wire x2="1040" y1="2560" y2="2640" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1120" y="160" name="GFX_INST(31:0)" orien="R0" />
        <bustap x2="944" y1="160" y2="160" x1="1040" />
        <branch name="GFX_INST(31)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="160" type="branch" />
            <wire x2="864" y1="160" y2="160" x1="784" />
            <wire x2="944" y1="160" y2="160" x1="864" />
        </branch>
        <bustap x2="944" y1="240" y2="240" x1="1040" />
        <branch name="GFX_INST(30)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="240" type="branch" />
            <wire x2="864" y1="240" y2="240" x1="784" />
            <wire x2="944" y1="240" y2="240" x1="864" />
        </branch>
        <bustap x2="944" y1="320" y2="320" x1="1040" />
        <branch name="GFX_INST(29)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="320" type="branch" />
            <wire x2="864" y1="320" y2="320" x1="784" />
            <wire x2="944" y1="320" y2="320" x1="864" />
        </branch>
        <bustap x2="944" y1="400" y2="400" x1="1040" />
        <branch name="GFX_INST(28)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="400" type="branch" />
            <wire x2="864" y1="400" y2="400" x1="784" />
            <wire x2="944" y1="400" y2="400" x1="864" />
        </branch>
        <bustap x2="944" y1="480" y2="480" x1="1040" />
        <branch name="GFX_INST(27)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="480" type="branch" />
            <wire x2="832" y1="480" y2="480" x1="720" />
            <wire x2="944" y1="480" y2="480" x1="832" />
        </branch>
        <bustap x2="944" y1="560" y2="560" x1="1040" />
        <branch name="GFX_INST(26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="560" type="branch" />
            <wire x2="832" y1="560" y2="560" x1="720" />
            <wire x2="944" y1="560" y2="560" x1="832" />
        </branch>
        <bustap x2="944" y1="640" y2="640" x1="1040" />
        <branch name="GFX_INST(25)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="640" type="branch" />
            <wire x2="832" y1="640" y2="640" x1="720" />
            <wire x2="944" y1="640" y2="640" x1="832" />
        </branch>
        <bustap x2="944" y1="720" y2="720" x1="1040" />
        <branch name="GFX_INST(24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="720" type="branch" />
            <wire x2="832" y1="720" y2="720" x1="720" />
            <wire x2="944" y1="720" y2="720" x1="832" />
        </branch>
        <bustap x2="944" y1="800" y2="800" x1="1040" />
        <branch name="GFX_INST(23)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="800" type="branch" />
            <wire x2="832" y1="800" y2="800" x1="720" />
            <wire x2="944" y1="800" y2="800" x1="832" />
        </branch>
        <bustap x2="944" y1="880" y2="880" x1="1040" />
        <branch name="GFX_INST(22)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="880" type="branch" />
            <wire x2="832" y1="880" y2="880" x1="720" />
            <wire x2="944" y1="880" y2="880" x1="832" />
        </branch>
        <bustap x2="944" y1="960" y2="960" x1="1040" />
        <branch name="GFX_INST(21)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="960" type="branch" />
            <wire x2="832" y1="960" y2="960" x1="720" />
            <wire x2="944" y1="960" y2="960" x1="832" />
        </branch>
        <bustap x2="944" y1="1040" y2="1040" x1="1040" />
        <branch name="GFX_INST(20)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="1040" type="branch" />
            <wire x2="832" y1="1040" y2="1040" x1="720" />
            <wire x2="944" y1="1040" y2="1040" x1="832" />
        </branch>
        <bustap x2="944" y1="1120" y2="1120" x1="1040" />
        <branch name="GFX_INST(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1120" type="branch" />
            <wire x2="864" y1="1120" y2="1120" x1="784" />
            <wire x2="944" y1="1120" y2="1120" x1="864" />
        </branch>
        <bustap x2="944" y1="1200" y2="1200" x1="1040" />
        <branch name="GFX_INST(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1200" type="branch" />
            <wire x2="864" y1="1200" y2="1200" x1="784" />
            <wire x2="944" y1="1200" y2="1200" x1="864" />
        </branch>
        <bustap x2="944" y1="1280" y2="1280" x1="1040" />
        <branch name="GFX_INST(17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1280" type="branch" />
            <wire x2="864" y1="1280" y2="1280" x1="784" />
            <wire x2="944" y1="1280" y2="1280" x1="864" />
        </branch>
        <bustap x2="944" y1="1360" y2="1360" x1="1040" />
        <branch name="GFX_INST(16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1360" type="branch" />
            <wire x2="864" y1="1360" y2="1360" x1="784" />
            <wire x2="944" y1="1360" y2="1360" x1="864" />
        </branch>
        <bustap x2="944" y1="1440" y2="1440" x1="1040" />
        <branch name="GFX_INST(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1440" type="branch" />
            <wire x2="864" y1="1440" y2="1440" x1="784" />
            <wire x2="944" y1="1440" y2="1440" x1="864" />
        </branch>
        <bustap x2="944" y1="1520" y2="1520" x1="1040" />
        <branch name="GFX_INST(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1520" type="branch" />
            <wire x2="864" y1="1520" y2="1520" x1="784" />
            <wire x2="944" y1="1520" y2="1520" x1="864" />
        </branch>
        <bustap x2="944" y1="1600" y2="1600" x1="1040" />
        <branch name="GFX_INST(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1600" type="branch" />
            <wire x2="864" y1="1600" y2="1600" x1="784" />
            <wire x2="944" y1="1600" y2="1600" x1="864" />
        </branch>
        <bustap x2="944" y1="1680" y2="1680" x1="1040" />
        <branch name="GFX_INST(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1680" type="branch" />
            <wire x2="864" y1="1680" y2="1680" x1="784" />
            <wire x2="944" y1="1680" y2="1680" x1="864" />
        </branch>
        <bustap x2="944" y1="1760" y2="1760" x1="1040" />
        <branch name="GFX_INST(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1760" type="branch" />
            <wire x2="864" y1="1760" y2="1760" x1="784" />
            <wire x2="944" y1="1760" y2="1760" x1="864" />
        </branch>
        <bustap x2="944" y1="1840" y2="1840" x1="1040" />
        <branch name="GFX_INST(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1840" type="branch" />
            <wire x2="864" y1="1840" y2="1840" x1="784" />
            <wire x2="944" y1="1840" y2="1840" x1="864" />
        </branch>
        <bustap x2="944" y1="1920" y2="1920" x1="1040" />
        <branch name="GFX_INST(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1920" type="branch" />
            <wire x2="864" y1="1920" y2="1920" x1="784" />
            <wire x2="944" y1="1920" y2="1920" x1="864" />
        </branch>
        <bustap x2="944" y1="2000" y2="2000" x1="1040" />
        <branch name="GFX_INST(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2000" type="branch" />
            <wire x2="864" y1="2000" y2="2000" x1="784" />
            <wire x2="944" y1="2000" y2="2000" x1="864" />
        </branch>
        <bustap x2="944" y1="2080" y2="2080" x1="1040" />
        <branch name="GFX_INST(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2080" type="branch" />
            <wire x2="864" y1="2080" y2="2080" x1="784" />
            <wire x2="944" y1="2080" y2="2080" x1="864" />
        </branch>
        <bustap x2="944" y1="2160" y2="2160" x1="1040" />
        <branch name="GFX_INST(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2160" type="branch" />
            <wire x2="864" y1="2160" y2="2160" x1="784" />
            <wire x2="944" y1="2160" y2="2160" x1="864" />
        </branch>
        <bustap x2="944" y1="2240" y2="2240" x1="1040" />
        <branch name="GFX_INST(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2240" type="branch" />
            <wire x2="864" y1="2240" y2="2240" x1="784" />
            <wire x2="944" y1="2240" y2="2240" x1="864" />
        </branch>
        <bustap x2="944" y1="2320" y2="2320" x1="1040" />
        <branch name="GFX_INST(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2320" type="branch" />
            <wire x2="864" y1="2320" y2="2320" x1="784" />
            <wire x2="944" y1="2320" y2="2320" x1="864" />
        </branch>
        <bustap x2="944" y1="2400" y2="2400" x1="1040" />
        <branch name="GFX_INST(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2400" type="branch" />
            <wire x2="864" y1="2400" y2="2400" x1="784" />
            <wire x2="944" y1="2400" y2="2400" x1="864" />
        </branch>
        <bustap x2="944" y1="2480" y2="2480" x1="1040" />
        <branch name="GFX_INST(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2480" type="branch" />
            <wire x2="864" y1="2480" y2="2480" x1="784" />
            <wire x2="944" y1="2480" y2="2480" x1="864" />
        </branch>
        <bustap x2="944" y1="2560" y2="2560" x1="1040" />
        <branch name="GFX_INST(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2560" type="branch" />
            <wire x2="864" y1="2560" y2="2560" x1="784" />
            <wire x2="944" y1="2560" y2="2560" x1="864" />
        </branch>
        <bustap x2="944" y1="2640" y2="2640" x1="1040" />
        <branch name="GFX_INST(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="2640" type="branch" />
            <wire x2="864" y1="2640" y2="2640" x1="784" />
            <wire x2="944" y1="2640" y2="2640" x1="864" />
        </branch>
    </sheet>
</drawing>