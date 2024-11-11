<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BTNS(15:0)" />
        <signal name="BTN1" />
        <signal name="BTN2" />
        <signal name="BTN3" />
        <signal name="BTN4" />
        <signal name="BTN5" />
        <signal name="BTN6" />
        <signal name="BTNS(15)" />
        <signal name="BTNS(14)" />
        <signal name="BTNS(13)" />
        <signal name="BTNS(12)" />
        <signal name="BTNS(11)" />
        <signal name="BTNS(10)" />
        <signal name="BTNS(9)" />
        <signal name="BTNS(8)" />
        <signal name="BTNS(7)" />
        <signal name="BTNS(6)" />
        <signal name="BTNS(5)" />
        <signal name="BTNS(4)" />
        <signal name="BTNS(3)" />
        <signal name="BTNS(2)" />
        <signal name="BTNS(1)" />
        <signal name="BTNS(0)" />
        <port polarity="Output" name="BTNS(15:0)" />
        <port polarity="Input" name="BTN1" />
        <port polarity="Input" name="BTN2" />
        <port polarity="Input" name="BTN3" />
        <port polarity="Input" name="BTN4" />
        <port polarity="Input" name="BTN5" />
        <port polarity="Input" name="BTN6" />
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <block symbolname="buf" name="XLXI_1">
            <blockpin signalname="BTN1" name="I" />
            <blockpin signalname="BTNS(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_2">
            <blockpin signalname="BTN2" name="I" />
            <blockpin signalname="BTNS(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_3">
            <blockpin signalname="BTN3" name="I" />
            <blockpin signalname="BTNS(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="BTN4" name="I" />
            <blockpin signalname="BTNS(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="BTN5" name="I" />
            <blockpin signalname="BTNS(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="BTN6" name="I" />
            <blockpin signalname="BTNS(5)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="BTNS(6)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_8">
            <blockpin signalname="BTNS(7)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_9">
            <blockpin signalname="BTNS(8)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_10">
            <blockpin signalname="BTNS(9)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_12">
            <blockpin signalname="BTNS(10)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_13">
            <blockpin signalname="BTNS(11)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_14">
            <blockpin signalname="BTNS(12)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="BTNS(13)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_16">
            <blockpin signalname="BTNS(14)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_17">
            <blockpin signalname="BTNS(15)" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="400" y="192" name="XLXI_1" orien="R0" />
        <instance x="400" y="272" name="XLXI_2" orien="R0" />
        <instance x="400" y="352" name="XLXI_3" orien="R0" />
        <instance x="400" y="432" name="XLXI_4" orien="R0" />
        <instance x="400" y="512" name="XLXI_5" orien="R0" />
        <instance x="400" y="592" name="XLXI_6" orien="R0" />
        <instance x="432" y="576" name="XLXI_7" orien="R90" />
        <instance x="432" y="656" name="XLXI_8" orien="R90" />
        <instance x="432" y="736" name="XLXI_9" orien="R90" />
        <instance x="432" y="816" name="XLXI_10" orien="R90" />
        <instance x="432" y="896" name="XLXI_12" orien="R90" />
        <instance x="432" y="976" name="XLXI_13" orien="R90" />
        <instance x="432" y="1056" name="XLXI_14" orien="R90" />
        <instance x="432" y="1136" name="XLXI_15" orien="R90" />
        <instance x="432" y="1216" name="XLXI_16" orien="R90" />
        <instance x="432" y="1296" name="XLXI_17" orien="R90" />
        <branch name="BTNS(15:0)">
            <wire x2="960" y1="160" y2="160" x1="880" />
            <wire x2="880" y1="160" y2="240" x1="880" />
            <wire x2="880" y1="240" y2="320" x1="880" />
            <wire x2="880" y1="320" y2="400" x1="880" />
            <wire x2="880" y1="400" y2="480" x1="880" />
            <wire x2="880" y1="480" y2="560" x1="880" />
            <wire x2="880" y1="560" y2="640" x1="880" />
            <wire x2="880" y1="640" y2="720" x1="880" />
            <wire x2="880" y1="720" y2="800" x1="880" />
            <wire x2="880" y1="800" y2="880" x1="880" />
            <wire x2="880" y1="880" y2="960" x1="880" />
            <wire x2="880" y1="960" y2="1040" x1="880" />
            <wire x2="880" y1="1040" y2="1120" x1="880" />
            <wire x2="880" y1="1120" y2="1200" x1="880" />
            <wire x2="880" y1="1200" y2="1280" x1="880" />
            <wire x2="880" y1="1280" y2="1360" x1="880" />
        </branch>
        <branch name="BTN1">
            <wire x2="384" y1="160" y2="160" x1="272" />
            <wire x2="400" y1="160" y2="160" x1="384" />
        </branch>
        <branch name="BTN2">
            <wire x2="384" y1="240" y2="240" x1="272" />
            <wire x2="400" y1="240" y2="240" x1="384" />
        </branch>
        <branch name="BTN3">
            <wire x2="384" y1="320" y2="320" x1="272" />
            <wire x2="400" y1="320" y2="320" x1="384" />
        </branch>
        <branch name="BTN4">
            <wire x2="384" y1="400" y2="400" x1="272" />
            <wire x2="400" y1="400" y2="400" x1="384" />
        </branch>
        <branch name="BTN5">
            <wire x2="384" y1="480" y2="480" x1="272" />
            <wire x2="400" y1="480" y2="480" x1="384" />
        </branch>
        <branch name="BTN6">
            <wire x2="384" y1="560" y2="560" x1="272" />
            <wire x2="400" y1="560" y2="560" x1="384" />
        </branch>
        <iomarker fontsize="28" x="272" y="160" name="BTN1" orien="R180" />
        <iomarker fontsize="28" x="272" y="240" name="BTN2" orien="R180" />
        <iomarker fontsize="28" x="272" y="320" name="BTN3" orien="R180" />
        <iomarker fontsize="28" x="272" y="400" name="BTN4" orien="R180" />
        <iomarker fontsize="28" x="272" y="480" name="BTN5" orien="R180" />
        <iomarker fontsize="28" x="272" y="560" name="BTN6" orien="R180" />
        <iomarker fontsize="28" x="960" y="160" name="BTNS(15:0)" orien="R0" />
        <bustap x2="784" y1="1360" y2="1360" x1="880" />
        <branch name="BTNS(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1360" type="branch" />
            <wire x2="672" y1="1360" y2="1360" x1="560" />
            <wire x2="784" y1="1360" y2="1360" x1="672" />
        </branch>
        <bustap x2="784" y1="1280" y2="1280" x1="880" />
        <branch name="BTNS(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1280" type="branch" />
            <wire x2="672" y1="1280" y2="1280" x1="560" />
            <wire x2="784" y1="1280" y2="1280" x1="672" />
        </branch>
        <bustap x2="784" y1="1200" y2="1200" x1="880" />
        <branch name="BTNS(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1200" type="branch" />
            <wire x2="672" y1="1200" y2="1200" x1="560" />
            <wire x2="784" y1="1200" y2="1200" x1="672" />
        </branch>
        <bustap x2="784" y1="1120" y2="1120" x1="880" />
        <branch name="BTNS(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1120" type="branch" />
            <wire x2="672" y1="1120" y2="1120" x1="560" />
            <wire x2="784" y1="1120" y2="1120" x1="672" />
        </branch>
        <bustap x2="784" y1="1040" y2="1040" x1="880" />
        <branch name="BTNS(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="1040" type="branch" />
            <wire x2="672" y1="1040" y2="1040" x1="560" />
            <wire x2="784" y1="1040" y2="1040" x1="672" />
        </branch>
        <bustap x2="784" y1="960" y2="960" x1="880" />
        <branch name="BTNS(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="960" type="branch" />
            <wire x2="672" y1="960" y2="960" x1="560" />
            <wire x2="784" y1="960" y2="960" x1="672" />
        </branch>
        <bustap x2="784" y1="880" y2="880" x1="880" />
        <branch name="BTNS(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="880" type="branch" />
            <wire x2="672" y1="880" y2="880" x1="560" />
            <wire x2="784" y1="880" y2="880" x1="672" />
        </branch>
        <bustap x2="784" y1="800" y2="800" x1="880" />
        <branch name="BTNS(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="800" type="branch" />
            <wire x2="672" y1="800" y2="800" x1="560" />
            <wire x2="784" y1="800" y2="800" x1="672" />
        </branch>
        <bustap x2="784" y1="720" y2="720" x1="880" />
        <branch name="BTNS(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="720" type="branch" />
            <wire x2="672" y1="720" y2="720" x1="560" />
            <wire x2="784" y1="720" y2="720" x1="672" />
        </branch>
        <bustap x2="784" y1="640" y2="640" x1="880" />
        <branch name="BTNS(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="672" y="640" type="branch" />
            <wire x2="672" y1="640" y2="640" x1="560" />
            <wire x2="784" y1="640" y2="640" x1="672" />
        </branch>
        <bustap x2="784" y1="560" y2="560" x1="880" />
        <branch name="BTNS(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="560" type="branch" />
            <wire x2="704" y1="560" y2="560" x1="624" />
            <wire x2="784" y1="560" y2="560" x1="704" />
        </branch>
        <bustap x2="784" y1="480" y2="480" x1="880" />
        <branch name="BTNS(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="480" type="branch" />
            <wire x2="704" y1="480" y2="480" x1="624" />
            <wire x2="784" y1="480" y2="480" x1="704" />
        </branch>
        <bustap x2="784" y1="400" y2="400" x1="880" />
        <branch name="BTNS(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="400" type="branch" />
            <wire x2="704" y1="400" y2="400" x1="624" />
            <wire x2="784" y1="400" y2="400" x1="704" />
        </branch>
        <bustap x2="784" y1="320" y2="320" x1="880" />
        <branch name="BTNS(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="320" type="branch" />
            <wire x2="704" y1="320" y2="320" x1="624" />
            <wire x2="784" y1="320" y2="320" x1="704" />
        </branch>
        <bustap x2="784" y1="240" y2="240" x1="880" />
        <branch name="BTNS(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="240" type="branch" />
            <wire x2="704" y1="240" y2="240" x1="624" />
            <wire x2="784" y1="240" y2="240" x1="704" />
        </branch>
        <bustap x2="784" y1="160" y2="160" x1="880" />
        <branch name="BTNS(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="160" type="branch" />
            <wire x2="704" y1="160" y2="160" x1="624" />
            <wire x2="784" y1="160" y2="160" x1="704" />
        </branch>
    </sheet>
</drawing>