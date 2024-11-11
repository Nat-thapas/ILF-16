<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDRA(13:0)" />
        <signal name="ADDR(15:0)" />
        <signal name="ADDR(0)" />
        <signal name="ADDR(1)" />
        <signal name="ADDR(2)" />
        <signal name="ADDR(3)" />
        <signal name="ADDR(4)" />
        <signal name="ADDR(5)" />
        <signal name="ADDR(6)" />
        <signal name="ADDR(7)" />
        <signal name="ADDR(8)" />
        <signal name="ADDR(9)" />
        <signal name="ADDR(10)" />
        <signal name="ADDR(11)" />
        <signal name="ADDRA(11)" />
        <signal name="ADDRA(10)" />
        <signal name="ADDRA(9)" />
        <signal name="ADDRA(8)" />
        <signal name="ADDRA(7)" />
        <signal name="ADDRA(6)" />
        <signal name="ADDRA(5)" />
        <signal name="ADDRA(4)" />
        <signal name="ADDRA(3)" />
        <signal name="ADDRA(2)" />
        <signal name="ADDRA(1)" />
        <signal name="ADDRA(0)" />
        <signal name="CLK" />
        <signal name="ADDRA(12)" />
        <signal name="ADDRA(13)" />
        <signal name="ADDR(12)" />
        <signal name="ADDR(13)" />
        <signal name="DO(31:0)" />
        <port polarity="Input" name="ADDR(15:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="DO(31:0)" />
        <blockdef name="rom">
            <timestamp>2024-11-10T16:57:3</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="rom" name="XLXI_1">
            <blockpin signalname="ADDRA(13:0)" name="addra(13:0)" />
            <blockpin signalname="CLK" name="clka" />
            <blockpin signalname="DO(31:0)" name="douta(31:0)" />
        </block>
        <block symbolname="buf" name="XLXI_2">
            <blockpin signalname="ADDR(0)" name="I" />
            <blockpin signalname="ADDRA(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_3">
            <blockpin signalname="ADDR(1)" name="I" />
            <blockpin signalname="ADDRA(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_4">
            <blockpin signalname="ADDR(2)" name="I" />
            <blockpin signalname="ADDRA(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="ADDR(3)" name="I" />
            <blockpin signalname="ADDRA(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_6">
            <blockpin signalname="ADDR(4)" name="I" />
            <blockpin signalname="ADDRA(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="ADDR(5)" name="I" />
            <blockpin signalname="ADDRA(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="ADDR(6)" name="I" />
            <blockpin signalname="ADDRA(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9">
            <blockpin signalname="ADDR(7)" name="I" />
            <blockpin signalname="ADDRA(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_10">
            <blockpin signalname="ADDR(8)" name="I" />
            <blockpin signalname="ADDRA(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_11">
            <blockpin signalname="ADDR(9)" name="I" />
            <blockpin signalname="ADDRA(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="ADDR(10)" name="I" />
            <blockpin signalname="ADDRA(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="ADDR(11)" name="I" />
            <blockpin signalname="ADDRA(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="ADDR(12)" name="I" />
            <blockpin signalname="ADDRA(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="ADDR(13)" name="I" />
            <blockpin signalname="ADDRA(13)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1488" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="ADDRA(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="208" type="branch" />
            <wire x2="1120" y1="208" y2="240" x1="1120" />
            <wire x2="1120" y1="240" y2="320" x1="1120" />
            <wire x2="1120" y1="320" y2="336" x1="1120" />
            <wire x2="1120" y1="336" y2="400" x1="1120" />
            <wire x2="1120" y1="400" y2="480" x1="1120" />
            <wire x2="1120" y1="480" y2="560" x1="1120" />
            <wire x2="1120" y1="560" y2="640" x1="1120" />
            <wire x2="1120" y1="640" y2="720" x1="1120" />
            <wire x2="1120" y1="720" y2="800" x1="1120" />
            <wire x2="1120" y1="800" y2="880" x1="1120" />
            <wire x2="1120" y1="880" y2="960" x1="1120" />
            <wire x2="1120" y1="960" y2="1040" x1="1120" />
            <wire x2="1120" y1="1040" y2="1120" x1="1120" />
            <wire x2="1120" y1="1120" y2="1200" x1="1120" />
            <wire x2="1120" y1="1200" y2="1280" x1="1120" />
            <wire x2="1280" y1="208" y2="208" x1="1120" />
            <wire x2="1488" y1="208" y2="208" x1="1280" />
        </branch>
        <instance x="640" y="272" name="XLXI_2" orien="R0" />
        <instance x="640" y="352" name="XLXI_3" orien="R0" />
        <instance x="640" y="432" name="XLXI_4" orien="R0" />
        <instance x="640" y="512" name="XLXI_5" orien="R0" />
        <instance x="640" y="592" name="XLXI_6" orien="R0" />
        <instance x="640" y="672" name="XLXI_7" orien="R0" />
        <instance x="640" y="752" name="XLXI_8" orien="R0" />
        <instance x="640" y="832" name="XLXI_9" orien="R0" />
        <instance x="640" y="912" name="XLXI_10" orien="R0" />
        <instance x="640" y="992" name="XLXI_11" orien="R0" />
        <instance x="640" y="1072" name="XLXI_14" orien="R0" />
        <instance x="640" y="1152" name="XLXI_15" orien="R0" />
        <branch name="ADDR(15:0)">
            <wire x2="400" y1="240" y2="240" x1="352" />
            <wire x2="400" y1="240" y2="320" x1="400" />
            <wire x2="400" y1="320" y2="400" x1="400" />
            <wire x2="400" y1="400" y2="480" x1="400" />
            <wire x2="400" y1="480" y2="560" x1="400" />
            <wire x2="400" y1="560" y2="640" x1="400" />
            <wire x2="400" y1="640" y2="720" x1="400" />
            <wire x2="400" y1="720" y2="800" x1="400" />
            <wire x2="400" y1="800" y2="880" x1="400" />
            <wire x2="400" y1="880" y2="960" x1="400" />
            <wire x2="400" y1="960" y2="1024" x1="400" />
            <wire x2="400" y1="1024" y2="1040" x1="400" />
            <wire x2="400" y1="1040" y2="1120" x1="400" />
            <wire x2="400" y1="1120" y2="1200" x1="400" />
            <wire x2="400" y1="1200" y2="1280" x1="400" />
        </branch>
        <bustap x2="496" y1="240" y2="240" x1="400" />
        <branch name="ADDR(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="240" type="branch" />
            <wire x2="560" y1="240" y2="240" x1="496" />
            <wire x2="640" y1="240" y2="240" x1="560" />
        </branch>
        <bustap x2="496" y1="320" y2="320" x1="400" />
        <branch name="ADDR(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="320" type="branch" />
            <wire x2="560" y1="320" y2="320" x1="496" />
            <wire x2="640" y1="320" y2="320" x1="560" />
        </branch>
        <bustap x2="496" y1="400" y2="400" x1="400" />
        <branch name="ADDR(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="400" type="branch" />
            <wire x2="560" y1="400" y2="400" x1="496" />
            <wire x2="640" y1="400" y2="400" x1="560" />
        </branch>
        <bustap x2="496" y1="480" y2="480" x1="400" />
        <branch name="ADDR(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="480" type="branch" />
            <wire x2="560" y1="480" y2="480" x1="496" />
            <wire x2="640" y1="480" y2="480" x1="560" />
        </branch>
        <bustap x2="496" y1="560" y2="560" x1="400" />
        <branch name="ADDR(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="560" type="branch" />
            <wire x2="560" y1="560" y2="560" x1="496" />
            <wire x2="640" y1="560" y2="560" x1="560" />
        </branch>
        <bustap x2="496" y1="640" y2="640" x1="400" />
        <branch name="ADDR(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="640" type="branch" />
            <wire x2="560" y1="640" y2="640" x1="496" />
            <wire x2="640" y1="640" y2="640" x1="560" />
        </branch>
        <bustap x2="496" y1="720" y2="720" x1="400" />
        <branch name="ADDR(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="720" type="branch" />
            <wire x2="560" y1="720" y2="720" x1="496" />
            <wire x2="640" y1="720" y2="720" x1="560" />
        </branch>
        <bustap x2="496" y1="800" y2="800" x1="400" />
        <branch name="ADDR(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="800" type="branch" />
            <wire x2="560" y1="800" y2="800" x1="496" />
            <wire x2="640" y1="800" y2="800" x1="560" />
        </branch>
        <bustap x2="496" y1="880" y2="880" x1="400" />
        <branch name="ADDR(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="880" type="branch" />
            <wire x2="560" y1="880" y2="880" x1="496" />
            <wire x2="640" y1="880" y2="880" x1="560" />
        </branch>
        <bustap x2="496" y1="960" y2="960" x1="400" />
        <branch name="ADDR(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="960" type="branch" />
            <wire x2="560" y1="960" y2="960" x1="496" />
            <wire x2="640" y1="960" y2="960" x1="560" />
        </branch>
        <bustap x2="496" y1="1040" y2="1040" x1="400" />
        <branch name="ADDR(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1040" type="branch" />
            <wire x2="560" y1="1040" y2="1040" x1="496" />
            <wire x2="640" y1="1040" y2="1040" x1="560" />
        </branch>
        <bustap x2="496" y1="1120" y2="1120" x1="400" />
        <branch name="ADDR(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1120" type="branch" />
            <wire x2="560" y1="1120" y2="1120" x1="496" />
            <wire x2="640" y1="1120" y2="1120" x1="560" />
        </branch>
        <bustap x2="1024" y1="1120" y2="1120" x1="1120" />
        <branch name="ADDRA(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1120" type="branch" />
            <wire x2="944" y1="1120" y2="1120" x1="864" />
            <wire x2="1024" y1="1120" y2="1120" x1="944" />
        </branch>
        <bustap x2="1024" y1="1040" y2="1040" x1="1120" />
        <branch name="ADDRA(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1040" type="branch" />
            <wire x2="944" y1="1040" y2="1040" x1="864" />
            <wire x2="1024" y1="1040" y2="1040" x1="944" />
        </branch>
        <bustap x2="1024" y1="960" y2="960" x1="1120" />
        <branch name="ADDRA(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="960" type="branch" />
            <wire x2="944" y1="960" y2="960" x1="864" />
            <wire x2="1024" y1="960" y2="960" x1="944" />
        </branch>
        <bustap x2="1024" y1="880" y2="880" x1="1120" />
        <branch name="ADDRA(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="880" type="branch" />
            <wire x2="944" y1="880" y2="880" x1="864" />
            <wire x2="1024" y1="880" y2="880" x1="944" />
        </branch>
        <bustap x2="1024" y1="800" y2="800" x1="1120" />
        <branch name="ADDRA(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="800" type="branch" />
            <wire x2="944" y1="800" y2="800" x1="864" />
            <wire x2="1024" y1="800" y2="800" x1="944" />
        </branch>
        <bustap x2="1024" y1="720" y2="720" x1="1120" />
        <branch name="ADDRA(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="720" type="branch" />
            <wire x2="944" y1="720" y2="720" x1="864" />
            <wire x2="1024" y1="720" y2="720" x1="944" />
        </branch>
        <bustap x2="1024" y1="640" y2="640" x1="1120" />
        <branch name="ADDRA(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="640" type="branch" />
            <wire x2="944" y1="640" y2="640" x1="864" />
            <wire x2="1024" y1="640" y2="640" x1="944" />
        </branch>
        <bustap x2="1024" y1="560" y2="560" x1="1120" />
        <branch name="ADDRA(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="560" type="branch" />
            <wire x2="944" y1="560" y2="560" x1="864" />
            <wire x2="1024" y1="560" y2="560" x1="944" />
        </branch>
        <bustap x2="1024" y1="480" y2="480" x1="1120" />
        <branch name="ADDRA(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="480" type="branch" />
            <wire x2="944" y1="480" y2="480" x1="864" />
            <wire x2="1024" y1="480" y2="480" x1="944" />
        </branch>
        <bustap x2="1024" y1="400" y2="400" x1="1120" />
        <branch name="ADDRA(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="400" type="branch" />
            <wire x2="944" y1="400" y2="400" x1="864" />
            <wire x2="1024" y1="400" y2="400" x1="944" />
        </branch>
        <bustap x2="1024" y1="320" y2="320" x1="1120" />
        <branch name="ADDRA(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="320" type="branch" />
            <wire x2="944" y1="320" y2="320" x1="864" />
            <wire x2="1024" y1="320" y2="320" x1="944" />
        </branch>
        <bustap x2="1024" y1="240" y2="240" x1="1120" />
        <branch name="ADDRA(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="240" type="branch" />
            <wire x2="944" y1="240" y2="240" x1="864" />
            <wire x2="1024" y1="240" y2="240" x1="944" />
        </branch>
        <branch name="CLK">
            <wire x2="1472" y1="400" y2="400" x1="1376" />
            <wire x2="1488" y1="400" y2="400" x1="1472" />
        </branch>
        <iomarker fontsize="28" x="352" y="240" name="ADDR(15:0)" orien="R180" />
        <iomarker fontsize="28" x="1376" y="400" name="CLK" orien="R180" />
        <instance x="640" y="1232" name="XLXI_16" orien="R0" />
        <instance x="640" y="1312" name="XLXI_17" orien="R0" />
        <bustap x2="1024" y1="1200" y2="1200" x1="1120" />
        <branch name="ADDRA(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1200" type="branch" />
            <wire x2="944" y1="1200" y2="1200" x1="864" />
            <wire x2="1024" y1="1200" y2="1200" x1="944" />
        </branch>
        <bustap x2="1024" y1="1280" y2="1280" x1="1120" />
        <branch name="ADDRA(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="944" y="1280" type="branch" />
            <wire x2="944" y1="1280" y2="1280" x1="864" />
            <wire x2="1024" y1="1280" y2="1280" x1="944" />
        </branch>
        <bustap x2="496" y1="1200" y2="1200" x1="400" />
        <branch name="ADDR(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1200" type="branch" />
            <wire x2="560" y1="1200" y2="1200" x1="496" />
            <wire x2="640" y1="1200" y2="1200" x1="560" />
        </branch>
        <bustap x2="496" y1="1280" y2="1280" x1="400" />
        <branch name="ADDR(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1280" type="branch" />
            <wire x2="560" y1="1280" y2="1280" x1="496" />
            <wire x2="640" y1="1280" y2="1280" x1="560" />
        </branch>
        <branch name="DO(31:0)">
            <wire x2="2160" y1="208" y2="208" x1="2064" />
        </branch>
        <iomarker fontsize="28" x="2160" y="208" name="DO(31:0)" orien="R0" />
    </sheet>
</drawing>