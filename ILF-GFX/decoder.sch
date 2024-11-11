<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="INST(31:0)" />
        <signal name="INST(8)" />
        <signal name="INST(10)" />
        <signal name="INST(11)" />
        <signal name="INST(12)" />
        <signal name="INST(13)" />
        <signal name="INST(14)" />
        <signal name="INST(15)" />
        <signal name="INST(0)" />
        <signal name="INST(1)" />
        <signal name="INST(2)" />
        <signal name="INST(3)" />
        <signal name="INST(4)" />
        <signal name="INST(5)" />
        <signal name="INST(6)" />
        <signal name="INST(7)" />
        <signal name="INST(16)" />
        <signal name="INST(17)" />
        <signal name="INST(18)" />
        <signal name="INST(19)" />
        <signal name="CLR(3:0)" />
        <signal name="ADDR(15:0)" />
        <signal name="CLR(3)" />
        <signal name="CLR(2)" />
        <signal name="CLR(1)" />
        <signal name="CLR(0)" />
        <signal name="ADDR(15)" />
        <signal name="ADDR(14)" />
        <signal name="ADDR(13)" />
        <signal name="ADDR(12)" />
        <signal name="ADDR(11)" />
        <signal name="ADDR(10)" />
        <signal name="ADDR(9)" />
        <signal name="ADDR(8)" />
        <signal name="ADDR(7)" />
        <signal name="ADDR(6)" />
        <signal name="ADDR(5)" />
        <signal name="ADDR(4)" />
        <signal name="ADDR(3)" />
        <signal name="ADDR(2)" />
        <signal name="ADDR(1)" />
        <signal name="ADDR(0)" />
        <signal name="INST(9)" />
        <port polarity="Input" name="INST(31:0)" />
        <port polarity="Output" name="CLR(3:0)" />
        <port polarity="Output" name="ADDR(15:0)" />
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="buf" name="XLXI_1">
            <blockpin signalname="INST(8)" name="I" />
            <blockpin signalname="ADDR(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_2">
            <blockpin signalname="INST(9)" name="I" />
            <blockpin signalname="ADDR(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_3">
            <blockpin signalname="INST(10)" name="I" />
            <blockpin signalname="ADDR(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="INST(11)" name="I" />
            <blockpin signalname="ADDR(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="INST(12)" name="I" />
            <blockpin signalname="ADDR(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="INST(13)" name="I" />
            <blockpin signalname="ADDR(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="INST(14)" name="I" />
            <blockpin signalname="ADDR(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="INST(15)" name="I" />
            <blockpin signalname="ADDR(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="INST(16)" name="I" />
            <blockpin signalname="CLR(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="INST(17)" name="I" />
            <blockpin signalname="CLR(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="INST(18)" name="I" />
            <blockpin signalname="CLR(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_20">
            <blockpin signalname="INST(19)" name="I" />
            <blockpin signalname="CLR(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9">
            <blockpin signalname="INST(0)" name="I" />
            <blockpin signalname="ADDR(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_10">
            <blockpin signalname="INST(1)" name="I" />
            <blockpin signalname="ADDR(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_11">
            <blockpin signalname="INST(2)" name="I" />
            <blockpin signalname="ADDR(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_12">
            <blockpin signalname="INST(3)" name="I" />
            <blockpin signalname="ADDR(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_13">
            <blockpin signalname="INST(4)" name="I" />
            <blockpin signalname="ADDR(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="INST(5)" name="I" />
            <blockpin signalname="ADDR(13)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="INST(6)" name="I" />
            <blockpin signalname="ADDR(14)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="INST(7)" name="I" />
            <blockpin signalname="ADDR(15)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="3520">
        <iomarker fontsize="28" x="336" y="160" name="INST(31:0)" orien="R180" />
        <instance x="640" y="192" name="XLXI_1" orien="R0" />
        <instance x="640" y="272" name="XLXI_2" orien="R0" />
        <instance x="640" y="352" name="XLXI_3" orien="R0" />
        <instance x="640" y="432" name="XLXI_4" orien="R0" />
        <instance x="640" y="512" name="XLXI_5" orien="R0" />
        <instance x="640" y="592" name="XLXI_6" orien="R0" />
        <instance x="640" y="672" name="XLXI_7" orien="R0" />
        <instance x="640" y="752" name="XLXI_8" orien="R0" />
        <instance x="640" y="1632" name="XLXI_17" orien="R0" />
        <instance x="640" y="1712" name="XLXI_18" orien="R0" />
        <instance x="640" y="1792" name="XLXI_19" orien="R0" />
        <instance x="640" y="1872" name="XLXI_20" orien="R0" />
        <instance x="640" y="912" name="XLXI_9" orien="R0" />
        <instance x="640" y="992" name="XLXI_10" orien="R0" />
        <instance x="640" y="1072" name="XLXI_11" orien="R0" />
        <instance x="640" y="1152" name="XLXI_12" orien="R0" />
        <instance x="640" y="1232" name="XLXI_13" orien="R0" />
        <instance x="640" y="1312" name="XLXI_14" orien="R0" />
        <instance x="640" y="1392" name="XLXI_15" orien="R0" />
        <instance x="640" y="1472" name="XLXI_16" orien="R0" />
        <bustap x2="496" y1="160" y2="160" x1="400" />
        <branch name="INST(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="160" type="branch" />
            <wire x2="560" y1="160" y2="160" x1="496" />
            <wire x2="640" y1="160" y2="160" x1="560" />
        </branch>
        <bustap x2="496" y1="240" y2="240" x1="400" />
        <branch name="INST(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="240" type="branch" />
            <wire x2="560" y1="240" y2="240" x1="496" />
            <wire x2="640" y1="240" y2="240" x1="560" />
        </branch>
        <bustap x2="496" y1="320" y2="320" x1="400" />
        <branch name="INST(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="320" type="branch" />
            <wire x2="560" y1="320" y2="320" x1="496" />
            <wire x2="640" y1="320" y2="320" x1="560" />
        </branch>
        <bustap x2="496" y1="400" y2="400" x1="400" />
        <branch name="INST(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="400" type="branch" />
            <wire x2="560" y1="400" y2="400" x1="496" />
            <wire x2="640" y1="400" y2="400" x1="560" />
        </branch>
        <bustap x2="496" y1="480" y2="480" x1="400" />
        <branch name="INST(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="480" type="branch" />
            <wire x2="560" y1="480" y2="480" x1="496" />
            <wire x2="640" y1="480" y2="480" x1="560" />
        </branch>
        <bustap x2="496" y1="560" y2="560" x1="400" />
        <branch name="INST(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="560" type="branch" />
            <wire x2="560" y1="560" y2="560" x1="496" />
            <wire x2="640" y1="560" y2="560" x1="560" />
        </branch>
        <bustap x2="496" y1="640" y2="640" x1="400" />
        <branch name="INST(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="640" type="branch" />
            <wire x2="560" y1="640" y2="640" x1="496" />
            <wire x2="640" y1="640" y2="640" x1="560" />
        </branch>
        <bustap x2="496" y1="720" y2="720" x1="400" />
        <branch name="INST(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="720" type="branch" />
            <wire x2="560" y1="720" y2="720" x1="496" />
            <wire x2="640" y1="720" y2="720" x1="560" />
        </branch>
        <bustap x2="496" y1="880" y2="880" x1="400" />
        <branch name="INST(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="880" type="branch" />
            <wire x2="560" y1="880" y2="880" x1="496" />
            <wire x2="640" y1="880" y2="880" x1="560" />
        </branch>
        <bustap x2="496" y1="960" y2="960" x1="400" />
        <branch name="INST(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="960" type="branch" />
            <wire x2="560" y1="960" y2="960" x1="496" />
            <wire x2="640" y1="960" y2="960" x1="560" />
        </branch>
        <bustap x2="496" y1="1040" y2="1040" x1="400" />
        <branch name="INST(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1040" type="branch" />
            <wire x2="560" y1="1040" y2="1040" x1="496" />
            <wire x2="640" y1="1040" y2="1040" x1="560" />
        </branch>
        <bustap x2="496" y1="1120" y2="1120" x1="400" />
        <branch name="INST(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1120" type="branch" />
            <wire x2="560" y1="1120" y2="1120" x1="496" />
            <wire x2="640" y1="1120" y2="1120" x1="560" />
        </branch>
        <bustap x2="496" y1="1200" y2="1200" x1="400" />
        <branch name="INST(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1200" type="branch" />
            <wire x2="560" y1="1200" y2="1200" x1="496" />
            <wire x2="640" y1="1200" y2="1200" x1="560" />
        </branch>
        <bustap x2="496" y1="1280" y2="1280" x1="400" />
        <branch name="INST(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1280" type="branch" />
            <wire x2="560" y1="1280" y2="1280" x1="496" />
            <wire x2="640" y1="1280" y2="1280" x1="560" />
        </branch>
        <bustap x2="496" y1="1360" y2="1360" x1="400" />
        <branch name="INST(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1360" type="branch" />
            <wire x2="560" y1="1360" y2="1360" x1="496" />
            <wire x2="640" y1="1360" y2="1360" x1="560" />
        </branch>
        <bustap x2="496" y1="1440" y2="1440" x1="400" />
        <branch name="INST(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1440" type="branch" />
            <wire x2="560" y1="1440" y2="1440" x1="496" />
            <wire x2="640" y1="1440" y2="1440" x1="560" />
        </branch>
        <bustap x2="496" y1="1600" y2="1600" x1="400" />
        <branch name="INST(16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1600" type="branch" />
            <wire x2="560" y1="1600" y2="1600" x1="496" />
            <wire x2="640" y1="1600" y2="1600" x1="560" />
        </branch>
        <bustap x2="496" y1="1680" y2="1680" x1="400" />
        <branch name="INST(17)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1680" type="branch" />
            <wire x2="560" y1="1680" y2="1680" x1="496" />
            <wire x2="640" y1="1680" y2="1680" x1="560" />
        </branch>
        <bustap x2="496" y1="1760" y2="1760" x1="400" />
        <branch name="INST(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1760" type="branch" />
            <wire x2="560" y1="1760" y2="1760" x1="496" />
            <wire x2="640" y1="1760" y2="1760" x1="560" />
        </branch>
        <branch name="INST(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1840" type="branch" />
            <wire x2="560" y1="1840" y2="1840" x1="496" />
            <wire x2="640" y1="1840" y2="1840" x1="560" />
        </branch>
        <branch name="CLR(3:0)">
            <wire x2="1200" y1="1600" y2="1600" x1="1120" />
            <wire x2="1120" y1="1600" y2="1680" x1="1120" />
            <wire x2="1120" y1="1680" y2="1760" x1="1120" />
            <wire x2="1120" y1="1760" y2="1840" x1="1120" />
        </branch>
        <branch name="ADDR(15:0)">
            <wire x2="1200" y1="160" y2="160" x1="1120" />
            <wire x2="1120" y1="160" y2="240" x1="1120" />
            <wire x2="1120" y1="240" y2="320" x1="1120" />
            <wire x2="1120" y1="320" y2="400" x1="1120" />
            <wire x2="1120" y1="400" y2="480" x1="1120" />
            <wire x2="1120" y1="480" y2="560" x1="1120" />
            <wire x2="1120" y1="560" y2="640" x1="1120" />
            <wire x2="1120" y1="640" y2="720" x1="1120" />
            <wire x2="1120" y1="720" y2="880" x1="1120" />
            <wire x2="1120" y1="880" y2="960" x1="1120" />
            <wire x2="1120" y1="960" y2="1040" x1="1120" />
            <wire x2="1120" y1="1040" y2="1120" x1="1120" />
            <wire x2="1120" y1="1120" y2="1200" x1="1120" />
            <wire x2="1120" y1="1200" y2="1280" x1="1120" />
            <wire x2="1120" y1="1280" y2="1360" x1="1120" />
            <wire x2="1120" y1="1360" y2="1440" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1200" y="160" name="ADDR(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1200" y="1600" name="CLR(3:0)" orien="R0" />
        <bustap x2="1024" y1="1840" y2="1840" x1="1120" />
        <branch name="CLR(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1840" type="branch" />
            <wire x2="944" y1="1840" y2="1840" x1="864" />
            <wire x2="1024" y1="1840" y2="1840" x1="944" />
        </branch>
        <bustap x2="1024" y1="1760" y2="1760" x1="1120" />
        <branch name="CLR(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1760" type="branch" />
            <wire x2="944" y1="1760" y2="1760" x1="864" />
            <wire x2="1024" y1="1760" y2="1760" x1="944" />
        </branch>
        <bustap x2="1024" y1="1680" y2="1680" x1="1120" />
        <branch name="CLR(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1680" type="branch" />
            <wire x2="944" y1="1680" y2="1680" x1="864" />
            <wire x2="1024" y1="1680" y2="1680" x1="944" />
        </branch>
        <bustap x2="1024" y1="1600" y2="1600" x1="1120" />
        <branch name="CLR(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1600" type="branch" />
            <wire x2="944" y1="1600" y2="1600" x1="864" />
            <wire x2="1024" y1="1600" y2="1600" x1="944" />
        </branch>
        <bustap x2="1024" y1="1440" y2="1440" x1="1120" />
        <branch name="ADDR(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1440" type="branch" />
            <wire x2="944" y1="1440" y2="1440" x1="864" />
            <wire x2="1024" y1="1440" y2="1440" x1="944" />
        </branch>
        <bustap x2="1024" y1="1360" y2="1360" x1="1120" />
        <branch name="ADDR(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1360" type="branch" />
            <wire x2="944" y1="1360" y2="1360" x1="864" />
            <wire x2="1024" y1="1360" y2="1360" x1="944" />
        </branch>
        <bustap x2="1024" y1="1280" y2="1280" x1="1120" />
        <branch name="ADDR(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1280" type="branch" />
            <wire x2="944" y1="1280" y2="1280" x1="864" />
            <wire x2="1024" y1="1280" y2="1280" x1="944" />
        </branch>
        <bustap x2="1024" y1="1200" y2="1200" x1="1120" />
        <branch name="ADDR(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1200" type="branch" />
            <wire x2="944" y1="1200" y2="1200" x1="864" />
            <wire x2="1024" y1="1200" y2="1200" x1="944" />
        </branch>
        <bustap x2="1024" y1="1120" y2="1120" x1="1120" />
        <branch name="ADDR(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1120" type="branch" />
            <wire x2="944" y1="1120" y2="1120" x1="864" />
            <wire x2="1024" y1="1120" y2="1120" x1="944" />
        </branch>
        <bustap x2="1024" y1="1040" y2="1040" x1="1120" />
        <branch name="ADDR(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1040" type="branch" />
            <wire x2="944" y1="1040" y2="1040" x1="864" />
            <wire x2="1024" y1="1040" y2="1040" x1="944" />
        </branch>
        <bustap x2="1024" y1="960" y2="960" x1="1120" />
        <branch name="ADDR(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="960" type="branch" />
            <wire x2="944" y1="960" y2="960" x1="864" />
            <wire x2="1024" y1="960" y2="960" x1="944" />
        </branch>
        <bustap x2="1024" y1="880" y2="880" x1="1120" />
        <branch name="ADDR(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="880" type="branch" />
            <wire x2="944" y1="880" y2="880" x1="864" />
            <wire x2="1024" y1="880" y2="880" x1="944" />
        </branch>
        <bustap x2="1024" y1="720" y2="720" x1="1120" />
        <branch name="ADDR(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="720" type="branch" />
            <wire x2="944" y1="720" y2="720" x1="864" />
            <wire x2="1024" y1="720" y2="720" x1="944" />
        </branch>
        <bustap x2="1024" y1="640" y2="640" x1="1120" />
        <branch name="ADDR(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="640" type="branch" />
            <wire x2="944" y1="640" y2="640" x1="864" />
            <wire x2="1024" y1="640" y2="640" x1="944" />
        </branch>
        <bustap x2="1024" y1="560" y2="560" x1="1120" />
        <branch name="ADDR(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="560" type="branch" />
            <wire x2="944" y1="560" y2="560" x1="864" />
            <wire x2="1024" y1="560" y2="560" x1="944" />
        </branch>
        <bustap x2="1024" y1="480" y2="480" x1="1120" />
        <branch name="ADDR(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="480" type="branch" />
            <wire x2="944" y1="480" y2="480" x1="864" />
            <wire x2="1024" y1="480" y2="480" x1="944" />
        </branch>
        <bustap x2="1024" y1="400" y2="400" x1="1120" />
        <branch name="ADDR(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="400" type="branch" />
            <wire x2="944" y1="400" y2="400" x1="864" />
            <wire x2="1024" y1="400" y2="400" x1="944" />
        </branch>
        <bustap x2="1024" y1="320" y2="320" x1="1120" />
        <branch name="ADDR(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="320" type="branch" />
            <wire x2="944" y1="320" y2="320" x1="864" />
            <wire x2="1024" y1="320" y2="320" x1="944" />
        </branch>
        <bustap x2="1024" y1="240" y2="240" x1="1120" />
        <branch name="ADDR(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="240" type="branch" />
            <wire x2="944" y1="240" y2="240" x1="864" />
            <wire x2="1024" y1="240" y2="240" x1="944" />
        </branch>
        <bustap x2="1024" y1="160" y2="160" x1="1120" />
        <branch name="ADDR(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="160" type="branch" />
            <wire x2="944" y1="160" y2="160" x1="864" />
            <wire x2="1024" y1="160" y2="160" x1="944" />
        </branch>
        <branch name="INST(31:0)">
            <wire x2="400" y1="160" y2="160" x1="336" />
            <wire x2="400" y1="160" y2="240" x1="400" />
            <wire x2="400" y1="240" y2="320" x1="400" />
            <wire x2="400" y1="320" y2="400" x1="400" />
            <wire x2="400" y1="400" y2="480" x1="400" />
            <wire x2="400" y1="480" y2="560" x1="400" />
            <wire x2="400" y1="560" y2="640" x1="400" />
            <wire x2="400" y1="640" y2="720" x1="400" />
            <wire x2="400" y1="720" y2="880" x1="400" />
            <wire x2="400" y1="880" y2="960" x1="400" />
            <wire x2="400" y1="960" y2="1040" x1="400" />
            <wire x2="400" y1="1040" y2="1120" x1="400" />
            <wire x2="400" y1="1120" y2="1200" x1="400" />
            <wire x2="400" y1="1200" y2="1280" x1="400" />
            <wire x2="400" y1="1280" y2="1360" x1="400" />
            <wire x2="400" y1="1360" y2="1440" x1="400" />
            <wire x2="400" y1="1440" y2="1600" x1="400" />
            <wire x2="400" y1="1600" y2="1680" x1="400" />
            <wire x2="400" y1="1680" y2="1760" x1="400" />
            <wire x2="400" y1="1760" y2="1840" x1="400" />
        </branch>
        <bustap x2="496" y1="1840" y2="1840" x1="400" />
    </sheet>
</drawing>