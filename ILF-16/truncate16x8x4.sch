<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_4" />
        <signal name="I(15:0)" />
        <signal name="I(0)" />
        <signal name="I(1)" />
        <signal name="I(2)" />
        <signal name="I(3)" />
        <signal name="I(4)" />
        <signal name="I(5)" />
        <signal name="I(6)" />
        <signal name="I(7)" />
        <signal name="E(7:0)" />
        <signal name="F(3:0)" />
        <signal name="E(7)" />
        <signal name="E(6)" />
        <signal name="E(5)" />
        <signal name="E(4)" />
        <signal name="E(3)" />
        <signal name="E(2)" />
        <signal name="E(1)" />
        <signal name="E(0)" />
        <signal name="F(3)" />
        <signal name="F(2)" />
        <signal name="F(1)" />
        <signal name="F(0)" />
        <port polarity="Input" name="I(15:0)" />
        <port polarity="Output" name="E(7:0)" />
        <port polarity="Output" name="F(3:0)" />
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="buf" name="XLXI_1">
            <blockpin signalname="I(0)" name="I" />
            <blockpin signalname="E(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_3">
            <blockpin signalname="I(1)" name="I" />
            <blockpin signalname="E(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="I(2)" name="I" />
            <blockpin signalname="E(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="I(3)" name="I" />
            <blockpin signalname="E(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="I(4)" name="I" />
            <blockpin signalname="E(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="I(5)" name="I" />
            <blockpin signalname="E(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="I(6)" name="I" />
            <blockpin signalname="E(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_10">
            <blockpin signalname="I(7)" name="I" />
            <blockpin signalname="E(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="I(0)" name="I" />
            <blockpin signalname="F(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="I(1)" name="I" />
            <blockpin signalname="F(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="I(2)" name="I" />
            <blockpin signalname="F(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="I(3)" name="I" />
            <blockpin signalname="F(3)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="560" y="432" name="XLXI_1" orien="R0" />
        <instance x="560" y="512" name="XLXI_3" orien="R0" />
        <instance x="560" y="592" name="XLXI_4" orien="R0" />
        <instance x="560" y="672" name="XLXI_5" orien="R0" />
        <instance x="560" y="752" name="XLXI_6" orien="R0" />
        <instance x="560" y="832" name="XLXI_7" orien="R0" />
        <instance x="560" y="912" name="XLXI_8" orien="R0" />
        <instance x="560" y="992" name="XLXI_10" orien="R0" />
        <instance x="1360" y="432" name="XLXI_15" orien="R0" />
        <instance x="1360" y="512" name="XLXI_16" orien="R0" />
        <instance x="1360" y="592" name="XLXI_17" orien="R0" />
        <instance x="1360" y="672" name="XLXI_18" orien="R0" />
        <branch name="I(15:0)">
            <wire x2="320" y1="160" y2="160" x1="272" />
            <wire x2="1120" y1="160" y2="160" x1="320" />
            <wire x2="1120" y1="160" y2="400" x1="1120" />
            <wire x2="1120" y1="400" y2="480" x1="1120" />
            <wire x2="1120" y1="480" y2="560" x1="1120" />
            <wire x2="1120" y1="560" y2="640" x1="1120" />
            <wire x2="320" y1="160" y2="400" x1="320" />
            <wire x2="320" y1="400" y2="480" x1="320" />
            <wire x2="320" y1="480" y2="560" x1="320" />
            <wire x2="320" y1="560" y2="640" x1="320" />
            <wire x2="320" y1="640" y2="720" x1="320" />
            <wire x2="320" y1="720" y2="800" x1="320" />
            <wire x2="320" y1="800" y2="880" x1="320" />
            <wire x2="320" y1="880" y2="960" x1="320" />
        </branch>
        <bustap x2="416" y1="400" y2="400" x1="320" />
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="400" type="branch" />
            <wire x2="480" y1="400" y2="400" x1="416" />
            <wire x2="560" y1="400" y2="400" x1="480" />
        </branch>
        <bustap x2="416" y1="480" y2="480" x1="320" />
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="480" type="branch" />
            <wire x2="480" y1="480" y2="480" x1="416" />
            <wire x2="560" y1="480" y2="480" x1="480" />
        </branch>
        <bustap x2="416" y1="560" y2="560" x1="320" />
        <branch name="I(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="560" type="branch" />
            <wire x2="480" y1="560" y2="560" x1="416" />
            <wire x2="560" y1="560" y2="560" x1="480" />
        </branch>
        <bustap x2="416" y1="640" y2="640" x1="320" />
        <branch name="I(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="640" type="branch" />
            <wire x2="480" y1="640" y2="640" x1="416" />
            <wire x2="560" y1="640" y2="640" x1="480" />
        </branch>
        <bustap x2="416" y1="720" y2="720" x1="320" />
        <branch name="I(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="720" type="branch" />
            <wire x2="480" y1="720" y2="720" x1="416" />
            <wire x2="560" y1="720" y2="720" x1="480" />
        </branch>
        <bustap x2="416" y1="800" y2="800" x1="320" />
        <branch name="I(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="800" type="branch" />
            <wire x2="480" y1="800" y2="800" x1="416" />
            <wire x2="560" y1="800" y2="800" x1="480" />
        </branch>
        <bustap x2="416" y1="880" y2="880" x1="320" />
        <branch name="I(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="880" type="branch" />
            <wire x2="480" y1="880" y2="880" x1="416" />
            <wire x2="560" y1="880" y2="880" x1="480" />
        </branch>
        <bustap x2="416" y1="960" y2="960" x1="320" />
        <branch name="I(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="960" type="branch" />
            <wire x2="480" y1="960" y2="960" x1="416" />
            <wire x2="560" y1="960" y2="960" x1="480" />
        </branch>
        <bustap x2="1216" y1="400" y2="400" x1="1120" />
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="400" type="branch" />
            <wire x2="1280" y1="400" y2="400" x1="1216" />
            <wire x2="1360" y1="400" y2="400" x1="1280" />
        </branch>
        <bustap x2="1216" y1="480" y2="480" x1="1120" />
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="480" type="branch" />
            <wire x2="1280" y1="480" y2="480" x1="1216" />
            <wire x2="1360" y1="480" y2="480" x1="1280" />
        </branch>
        <bustap x2="1216" y1="560" y2="560" x1="1120" />
        <branch name="I(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="560" type="branch" />
            <wire x2="1280" y1="560" y2="560" x1="1216" />
            <wire x2="1360" y1="560" y2="560" x1="1280" />
        </branch>
        <bustap x2="1216" y1="640" y2="640" x1="1120" />
        <branch name="I(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="640" type="branch" />
            <wire x2="1280" y1="640" y2="640" x1="1216" />
            <wire x2="1360" y1="640" y2="640" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="272" y="160" name="I(15:0)" orien="R180" />
        <branch name="F(3:0)">
            <wire x2="1920" y1="320" y2="320" x1="1840" />
            <wire x2="1840" y1="320" y2="400" x1="1840" />
            <wire x2="1840" y1="400" y2="480" x1="1840" />
            <wire x2="1840" y1="480" y2="560" x1="1840" />
            <wire x2="1840" y1="560" y2="640" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1920" y="320" name="F(3:0)" orien="R0" />
        <iomarker fontsize="28" x="1920" y="240" name="E(7:0)" orien="R0" />
        <branch name="E(7:0)">
            <wire x2="1920" y1="240" y2="240" x1="1040" />
            <wire x2="1040" y1="240" y2="400" x1="1040" />
            <wire x2="1040" y1="400" y2="480" x1="1040" />
            <wire x2="1040" y1="480" y2="560" x1="1040" />
            <wire x2="1040" y1="560" y2="640" x1="1040" />
            <wire x2="1040" y1="640" y2="720" x1="1040" />
            <wire x2="1040" y1="720" y2="800" x1="1040" />
            <wire x2="1040" y1="800" y2="880" x1="1040" />
            <wire x2="1040" y1="880" y2="896" x1="1040" />
            <wire x2="1040" y1="896" y2="960" x1="1040" />
        </branch>
        <bustap x2="944" y1="960" y2="960" x1="1040" />
        <branch name="E(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="960" type="branch" />
            <wire x2="864" y1="960" y2="960" x1="784" />
            <wire x2="944" y1="960" y2="960" x1="864" />
        </branch>
        <bustap x2="944" y1="880" y2="880" x1="1040" />
        <branch name="E(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="880" type="branch" />
            <wire x2="864" y1="880" y2="880" x1="784" />
            <wire x2="944" y1="880" y2="880" x1="864" />
        </branch>
        <bustap x2="944" y1="800" y2="800" x1="1040" />
        <branch name="E(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="800" type="branch" />
            <wire x2="864" y1="800" y2="800" x1="784" />
            <wire x2="944" y1="800" y2="800" x1="864" />
        </branch>
        <bustap x2="944" y1="720" y2="720" x1="1040" />
        <branch name="E(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="720" type="branch" />
            <wire x2="864" y1="720" y2="720" x1="784" />
            <wire x2="944" y1="720" y2="720" x1="864" />
        </branch>
        <bustap x2="944" y1="640" y2="640" x1="1040" />
        <branch name="E(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="640" type="branch" />
            <wire x2="864" y1="640" y2="640" x1="784" />
            <wire x2="944" y1="640" y2="640" x1="864" />
        </branch>
        <bustap x2="944" y1="560" y2="560" x1="1040" />
        <branch name="E(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="560" type="branch" />
            <wire x2="864" y1="560" y2="560" x1="784" />
            <wire x2="944" y1="560" y2="560" x1="864" />
        </branch>
        <bustap x2="944" y1="480" y2="480" x1="1040" />
        <branch name="E(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="480" type="branch" />
            <wire x2="864" y1="480" y2="480" x1="784" />
            <wire x2="944" y1="480" y2="480" x1="864" />
        </branch>
        <bustap x2="944" y1="400" y2="400" x1="1040" />
        <branch name="E(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="400" type="branch" />
            <wire x2="864" y1="400" y2="400" x1="784" />
            <wire x2="944" y1="400" y2="400" x1="864" />
        </branch>
        <bustap x2="1744" y1="640" y2="640" x1="1840" />
        <branch name="F(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="640" type="branch" />
            <wire x2="1664" y1="640" y2="640" x1="1584" />
            <wire x2="1744" y1="640" y2="640" x1="1664" />
        </branch>
        <bustap x2="1744" y1="560" y2="560" x1="1840" />
        <branch name="F(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="560" type="branch" />
            <wire x2="1664" y1="560" y2="560" x1="1584" />
            <wire x2="1744" y1="560" y2="560" x1="1664" />
        </branch>
        <bustap x2="1744" y1="480" y2="480" x1="1840" />
        <branch name="F(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="480" type="branch" />
            <wire x2="1664" y1="480" y2="480" x1="1584" />
            <wire x2="1744" y1="480" y2="480" x1="1664" />
        </branch>
        <bustap x2="1744" y1="400" y2="400" x1="1840" />
        <branch name="F(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="400" type="branch" />
            <wire x2="1664" y1="400" y2="400" x1="1584" />
            <wire x2="1744" y1="400" y2="400" x1="1664" />
        </branch>
    </sheet>
</drawing>