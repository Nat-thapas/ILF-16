<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_33" />
        <signal name="I(0)" />
        <signal name="I(1)" />
        <signal name="I(2)" />
        <signal name="I(3)" />
        <signal name="I(4)" />
        <signal name="I(5)" />
        <signal name="I(6)" />
        <signal name="I(7)" />
        <signal name="F(3:0)" />
        <signal name="E(7:0)" />
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
        <signal name="I(15:0)" />
        <signal name="I(8)" />
        <signal name="I(9)" />
        <signal name="I(10)" />
        <signal name="I(11)" />
        <signal name="T(11:0)" />
        <signal name="T(0)" />
        <signal name="T(1)" />
        <signal name="T(2)" />
        <signal name="T(3)" />
        <signal name="T(4)" />
        <signal name="T(5)" />
        <signal name="T(6)" />
        <signal name="T(7)" />
        <signal name="T(8)" />
        <signal name="T(9)" />
        <signal name="T(10)" />
        <signal name="T(11)" />
        <port polarity="Output" name="F(3:0)" />
        <port polarity="Output" name="E(7:0)" />
        <port polarity="Input" name="I(15:0)" />
        <port polarity="Output" name="T(11:0)" />
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
        <block symbolname="buf" name="XLXI_31">
            <blockpin signalname="I(0)" name="I" />
            <blockpin signalname="T(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_32">
            <blockpin signalname="I(1)" name="I" />
            <blockpin signalname="T(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_33">
            <blockpin signalname="I(2)" name="I" />
            <blockpin signalname="T(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_34">
            <blockpin signalname="I(3)" name="I" />
            <blockpin signalname="T(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_35">
            <blockpin signalname="I(4)" name="I" />
            <blockpin signalname="T(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_36">
            <blockpin signalname="I(5)" name="I" />
            <blockpin signalname="T(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_37">
            <blockpin signalname="I(6)" name="I" />
            <blockpin signalname="T(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_38">
            <blockpin signalname="I(7)" name="I" />
            <blockpin signalname="T(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_39">
            <blockpin signalname="I(8)" name="I" />
            <blockpin signalname="T(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_40">
            <blockpin signalname="I(9)" name="I" />
            <blockpin signalname="T(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_41">
            <blockpin signalname="I(10)" name="I" />
            <blockpin signalname="T(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_42">
            <blockpin signalname="I(11)" name="I" />
            <blockpin signalname="T(11)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1360" y="512" name="XLXI_1" orien="R0" />
        <instance x="1360" y="592" name="XLXI_3" orien="R0" />
        <instance x="1360" y="672" name="XLXI_4" orien="R0" />
        <instance x="1360" y="752" name="XLXI_5" orien="R0" />
        <instance x="1360" y="832" name="XLXI_6" orien="R0" />
        <instance x="1360" y="912" name="XLXI_7" orien="R0" />
        <instance x="1360" y="992" name="XLXI_8" orien="R0" />
        <instance x="1360" y="1072" name="XLXI_10" orien="R0" />
        <instance x="2160" y="512" name="XLXI_15" orien="R0" />
        <instance x="2160" y="592" name="XLXI_16" orien="R0" />
        <instance x="2160" y="672" name="XLXI_17" orien="R0" />
        <instance x="2160" y="752" name="XLXI_18" orien="R0" />
        <bustap x2="1216" y1="480" y2="480" x1="1120" />
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="480" type="branch" />
            <wire x2="1280" y1="480" y2="480" x1="1216" />
            <wire x2="1360" y1="480" y2="480" x1="1280" />
        </branch>
        <bustap x2="1216" y1="560" y2="560" x1="1120" />
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="560" type="branch" />
            <wire x2="1280" y1="560" y2="560" x1="1216" />
            <wire x2="1360" y1="560" y2="560" x1="1280" />
        </branch>
        <bustap x2="1216" y1="640" y2="640" x1="1120" />
        <branch name="I(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="640" type="branch" />
            <wire x2="1280" y1="640" y2="640" x1="1216" />
            <wire x2="1360" y1="640" y2="640" x1="1280" />
        </branch>
        <bustap x2="1216" y1="720" y2="720" x1="1120" />
        <branch name="I(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="720" type="branch" />
            <wire x2="1280" y1="720" y2="720" x1="1216" />
            <wire x2="1360" y1="720" y2="720" x1="1280" />
        </branch>
        <bustap x2="1216" y1="800" y2="800" x1="1120" />
        <branch name="I(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="800" type="branch" />
            <wire x2="1280" y1="800" y2="800" x1="1216" />
            <wire x2="1360" y1="800" y2="800" x1="1280" />
        </branch>
        <bustap x2="1216" y1="880" y2="880" x1="1120" />
        <branch name="I(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="880" type="branch" />
            <wire x2="1280" y1="880" y2="880" x1="1216" />
            <wire x2="1360" y1="880" y2="880" x1="1280" />
        </branch>
        <bustap x2="1216" y1="960" y2="960" x1="1120" />
        <branch name="I(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="960" type="branch" />
            <wire x2="1280" y1="960" y2="960" x1="1216" />
            <wire x2="1360" y1="960" y2="960" x1="1280" />
        </branch>
        <bustap x2="1216" y1="1040" y2="1040" x1="1120" />
        <branch name="I(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="1040" type="branch" />
            <wire x2="1280" y1="1040" y2="1040" x1="1216" />
            <wire x2="1360" y1="1040" y2="1040" x1="1280" />
        </branch>
        <bustap x2="2016" y1="480" y2="480" x1="1920" />
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="480" type="branch" />
            <wire x2="2080" y1="480" y2="480" x1="2016" />
            <wire x2="2160" y1="480" y2="480" x1="2080" />
        </branch>
        <bustap x2="2016" y1="560" y2="560" x1="1920" />
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="560" type="branch" />
            <wire x2="2080" y1="560" y2="560" x1="2016" />
            <wire x2="2160" y1="560" y2="560" x1="2080" />
        </branch>
        <bustap x2="2016" y1="640" y2="640" x1="1920" />
        <branch name="I(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="640" type="branch" />
            <wire x2="2080" y1="640" y2="640" x1="2016" />
            <wire x2="2160" y1="640" y2="640" x1="2080" />
        </branch>
        <bustap x2="2016" y1="720" y2="720" x1="1920" />
        <branch name="I(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="720" type="branch" />
            <wire x2="2080" y1="720" y2="720" x1="2016" />
            <wire x2="2160" y1="720" y2="720" x1="2080" />
        </branch>
        <branch name="F(3:0)">
            <wire x2="2720" y1="400" y2="400" x1="2640" />
            <wire x2="2640" y1="400" y2="480" x1="2640" />
            <wire x2="2640" y1="480" y2="560" x1="2640" />
            <wire x2="2640" y1="560" y2="640" x1="2640" />
            <wire x2="2640" y1="640" y2="720" x1="2640" />
        </branch>
        <branch name="E(7:0)">
            <wire x2="2720" y1="320" y2="320" x1="1840" />
            <wire x2="1840" y1="320" y2="480" x1="1840" />
            <wire x2="1840" y1="480" y2="560" x1="1840" />
            <wire x2="1840" y1="560" y2="640" x1="1840" />
            <wire x2="1840" y1="640" y2="720" x1="1840" />
            <wire x2="1840" y1="720" y2="800" x1="1840" />
            <wire x2="1840" y1="800" y2="880" x1="1840" />
            <wire x2="1840" y1="880" y2="960" x1="1840" />
            <wire x2="1840" y1="960" y2="1040" x1="1840" />
        </branch>
        <bustap x2="1744" y1="1040" y2="1040" x1="1840" />
        <branch name="E(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="1040" type="branch" />
            <wire x2="1664" y1="1040" y2="1040" x1="1584" />
            <wire x2="1744" y1="1040" y2="1040" x1="1664" />
        </branch>
        <bustap x2="1744" y1="960" y2="960" x1="1840" />
        <branch name="E(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="960" type="branch" />
            <wire x2="1664" y1="960" y2="960" x1="1584" />
            <wire x2="1744" y1="960" y2="960" x1="1664" />
        </branch>
        <bustap x2="1744" y1="880" y2="880" x1="1840" />
        <branch name="E(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="880" type="branch" />
            <wire x2="1664" y1="880" y2="880" x1="1584" />
            <wire x2="1744" y1="880" y2="880" x1="1664" />
        </branch>
        <bustap x2="1744" y1="800" y2="800" x1="1840" />
        <branch name="E(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="800" type="branch" />
            <wire x2="1664" y1="800" y2="800" x1="1584" />
            <wire x2="1744" y1="800" y2="800" x1="1664" />
        </branch>
        <bustap x2="1744" y1="720" y2="720" x1="1840" />
        <branch name="E(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="720" type="branch" />
            <wire x2="1664" y1="720" y2="720" x1="1584" />
            <wire x2="1744" y1="720" y2="720" x1="1664" />
        </branch>
        <bustap x2="1744" y1="640" y2="640" x1="1840" />
        <branch name="E(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="640" type="branch" />
            <wire x2="1664" y1="640" y2="640" x1="1584" />
            <wire x2="1744" y1="640" y2="640" x1="1664" />
        </branch>
        <bustap x2="1744" y1="560" y2="560" x1="1840" />
        <branch name="E(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="560" type="branch" />
            <wire x2="1664" y1="560" y2="560" x1="1584" />
            <wire x2="1744" y1="560" y2="560" x1="1664" />
        </branch>
        <bustap x2="1744" y1="480" y2="480" x1="1840" />
        <branch name="E(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1664" y="480" type="branch" />
            <wire x2="1664" y1="480" y2="480" x1="1584" />
            <wire x2="1744" y1="480" y2="480" x1="1664" />
        </branch>
        <bustap x2="2544" y1="720" y2="720" x1="2640" />
        <branch name="F(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="720" type="branch" />
            <wire x2="2464" y1="720" y2="720" x1="2384" />
            <wire x2="2544" y1="720" y2="720" x1="2464" />
        </branch>
        <bustap x2="2544" y1="640" y2="640" x1="2640" />
        <branch name="F(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="640" type="branch" />
            <wire x2="2464" y1="640" y2="640" x1="2384" />
            <wire x2="2544" y1="640" y2="640" x1="2464" />
        </branch>
        <bustap x2="2544" y1="560" y2="560" x1="2640" />
        <branch name="F(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="560" type="branch" />
            <wire x2="2464" y1="560" y2="560" x1="2384" />
            <wire x2="2544" y1="560" y2="560" x1="2464" />
        </branch>
        <bustap x2="2544" y1="480" y2="480" x1="2640" />
        <branch name="F(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="480" type="branch" />
            <wire x2="2464" y1="480" y2="480" x1="2384" />
            <wire x2="2544" y1="480" y2="480" x1="2464" />
        </branch>
        <instance x="560" y="512" name="XLXI_31" orien="R0" />
        <instance x="560" y="592" name="XLXI_32" orien="R0" />
        <instance x="560" y="672" name="XLXI_33" orien="R0" />
        <instance x="560" y="752" name="XLXI_34" orien="R0" />
        <instance x="560" y="832" name="XLXI_35" orien="R0" />
        <instance x="560" y="912" name="XLXI_36" orien="R0" />
        <instance x="560" y="992" name="XLXI_37" orien="R0" />
        <instance x="560" y="1072" name="XLXI_38" orien="R0" />
        <instance x="560" y="1152" name="XLXI_39" orien="R0" />
        <instance x="560" y="1232" name="XLXI_40" orien="R0" />
        <instance x="560" y="1312" name="XLXI_41" orien="R0" />
        <instance x="560" y="1392" name="XLXI_42" orien="R0" />
        <iomarker fontsize="28" x="2720" y="400" name="F(3:0)" orien="R0" />
        <iomarker fontsize="28" x="2720" y="320" name="E(7:0)" orien="R0" />
        <iomarker fontsize="28" x="272" y="160" name="I(15:0)" orien="R180" />
        <bustap x2="416" y1="480" y2="480" x1="320" />
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="480" type="branch" />
            <wire x2="480" y1="480" y2="480" x1="416" />
            <wire x2="560" y1="480" y2="480" x1="480" />
        </branch>
        <bustap x2="416" y1="560" y2="560" x1="320" />
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="560" type="branch" />
            <wire x2="480" y1="560" y2="560" x1="416" />
            <wire x2="560" y1="560" y2="560" x1="480" />
        </branch>
        <bustap x2="416" y1="640" y2="640" x1="320" />
        <branch name="I(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="640" type="branch" />
            <wire x2="480" y1="640" y2="640" x1="416" />
            <wire x2="560" y1="640" y2="640" x1="480" />
        </branch>
        <bustap x2="416" y1="720" y2="720" x1="320" />
        <branch name="I(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="720" type="branch" />
            <wire x2="480" y1="720" y2="720" x1="416" />
            <wire x2="560" y1="720" y2="720" x1="480" />
        </branch>
        <bustap x2="416" y1="800" y2="800" x1="320" />
        <branch name="I(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="800" type="branch" />
            <wire x2="480" y1="800" y2="800" x1="416" />
            <wire x2="560" y1="800" y2="800" x1="480" />
        </branch>
        <bustap x2="416" y1="880" y2="880" x1="320" />
        <branch name="I(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="880" type="branch" />
            <wire x2="480" y1="880" y2="880" x1="416" />
            <wire x2="560" y1="880" y2="880" x1="480" />
        </branch>
        <bustap x2="416" y1="960" y2="960" x1="320" />
        <branch name="I(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="960" type="branch" />
            <wire x2="480" y1="960" y2="960" x1="416" />
            <wire x2="560" y1="960" y2="960" x1="480" />
        </branch>
        <bustap x2="416" y1="1040" y2="1040" x1="320" />
        <branch name="I(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1040" type="branch" />
            <wire x2="480" y1="1040" y2="1040" x1="416" />
            <wire x2="560" y1="1040" y2="1040" x1="480" />
        </branch>
        <bustap x2="416" y1="1120" y2="1120" x1="320" />
        <branch name="I(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1120" type="branch" />
            <wire x2="480" y1="1120" y2="1120" x1="416" />
            <wire x2="560" y1="1120" y2="1120" x1="480" />
        </branch>
        <bustap x2="416" y1="1200" y2="1200" x1="320" />
        <branch name="I(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1200" type="branch" />
            <wire x2="480" y1="1200" y2="1200" x1="416" />
            <wire x2="560" y1="1200" y2="1200" x1="480" />
        </branch>
        <bustap x2="416" y1="1280" y2="1280" x1="320" />
        <branch name="I(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1280" type="branch" />
            <wire x2="480" y1="1280" y2="1280" x1="416" />
            <wire x2="560" y1="1280" y2="1280" x1="480" />
        </branch>
        <bustap x2="416" y1="1360" y2="1360" x1="320" />
        <branch name="I(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="480" y="1360" type="branch" />
            <wire x2="480" y1="1360" y2="1360" x1="416" />
            <wire x2="560" y1="1360" y2="1360" x1="480" />
        </branch>
        <branch name="T(11:0)">
            <wire x2="2720" y1="240" y2="240" x1="1040" />
            <wire x2="1040" y1="240" y2="480" x1="1040" />
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
        </branch>
        <branch name="I(15:0)">
            <wire x2="320" y1="160" y2="160" x1="272" />
            <wire x2="1120" y1="160" y2="160" x1="320" />
            <wire x2="1120" y1="160" y2="480" x1="1120" />
            <wire x2="1120" y1="480" y2="560" x1="1120" />
            <wire x2="1120" y1="560" y2="640" x1="1120" />
            <wire x2="1120" y1="640" y2="720" x1="1120" />
            <wire x2="1120" y1="720" y2="800" x1="1120" />
            <wire x2="1120" y1="800" y2="880" x1="1120" />
            <wire x2="1120" y1="880" y2="960" x1="1120" />
            <wire x2="1120" y1="960" y2="1040" x1="1120" />
            <wire x2="1920" y1="160" y2="160" x1="1120" />
            <wire x2="1920" y1="160" y2="240" x1="1920" />
            <wire x2="1920" y1="240" y2="480" x1="1920" />
            <wire x2="1920" y1="480" y2="560" x1="1920" />
            <wire x2="1920" y1="560" y2="640" x1="1920" />
            <wire x2="1920" y1="640" y2="720" x1="1920" />
            <wire x2="320" y1="160" y2="480" x1="320" />
            <wire x2="320" y1="480" y2="560" x1="320" />
            <wire x2="320" y1="560" y2="640" x1="320" />
            <wire x2="320" y1="640" y2="720" x1="320" />
            <wire x2="320" y1="720" y2="800" x1="320" />
            <wire x2="320" y1="800" y2="880" x1="320" />
            <wire x2="320" y1="880" y2="896" x1="320" />
            <wire x2="320" y1="896" y2="960" x1="320" />
            <wire x2="320" y1="960" y2="1040" x1="320" />
            <wire x2="320" y1="1040" y2="1120" x1="320" />
            <wire x2="320" y1="1120" y2="1200" x1="320" />
            <wire x2="320" y1="1200" y2="1280" x1="320" />
            <wire x2="320" y1="1280" y2="1360" x1="320" />
        </branch>
        <iomarker fontsize="28" x="2720" y="240" name="T(11:0)" orien="R0" />
        <bustap x2="944" y1="480" y2="480" x1="1040" />
        <branch name="T(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="480" type="branch" />
            <wire x2="864" y1="480" y2="480" x1="784" />
            <wire x2="944" y1="480" y2="480" x1="864" />
        </branch>
        <bustap x2="944" y1="560" y2="560" x1="1040" />
        <branch name="T(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="560" type="branch" />
            <wire x2="864" y1="560" y2="560" x1="784" />
            <wire x2="944" y1="560" y2="560" x1="864" />
        </branch>
        <bustap x2="944" y1="640" y2="640" x1="1040" />
        <branch name="T(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="640" type="branch" />
            <wire x2="864" y1="640" y2="640" x1="784" />
            <wire x2="944" y1="640" y2="640" x1="864" />
        </branch>
        <bustap x2="944" y1="720" y2="720" x1="1040" />
        <branch name="T(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="720" type="branch" />
            <wire x2="864" y1="720" y2="720" x1="784" />
            <wire x2="944" y1="720" y2="720" x1="864" />
        </branch>
        <bustap x2="944" y1="800" y2="800" x1="1040" />
        <branch name="T(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="800" type="branch" />
            <wire x2="864" y1="800" y2="800" x1="784" />
            <wire x2="944" y1="800" y2="800" x1="864" />
        </branch>
        <bustap x2="944" y1="880" y2="880" x1="1040" />
        <branch name="T(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="880" type="branch" />
            <wire x2="864" y1="880" y2="880" x1="784" />
            <wire x2="944" y1="880" y2="880" x1="864" />
        </branch>
        <bustap x2="944" y1="960" y2="960" x1="1040" />
        <branch name="T(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="960" type="branch" />
            <wire x2="864" y1="960" y2="960" x1="784" />
            <wire x2="944" y1="960" y2="960" x1="864" />
        </branch>
        <bustap x2="944" y1="1040" y2="1040" x1="1040" />
        <branch name="T(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1040" type="branch" />
            <wire x2="864" y1="1040" y2="1040" x1="784" />
            <wire x2="944" y1="1040" y2="1040" x1="864" />
        </branch>
        <bustap x2="944" y1="1120" y2="1120" x1="1040" />
        <branch name="T(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1120" type="branch" />
            <wire x2="864" y1="1120" y2="1120" x1="784" />
            <wire x2="944" y1="1120" y2="1120" x1="864" />
        </branch>
        <bustap x2="944" y1="1200" y2="1200" x1="1040" />
        <branch name="T(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1200" type="branch" />
            <wire x2="864" y1="1200" y2="1200" x1="784" />
            <wire x2="944" y1="1200" y2="1200" x1="864" />
        </branch>
        <bustap x2="944" y1="1280" y2="1280" x1="1040" />
        <branch name="T(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1280" type="branch" />
            <wire x2="864" y1="1280" y2="1280" x1="784" />
            <wire x2="944" y1="1280" y2="1280" x1="864" />
        </branch>
        <bustap x2="944" y1="1360" y2="1360" x1="1040" />
        <branch name="T(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="864" y="1360" type="branch" />
            <wire x2="864" y1="1360" y2="1360" x1="784" />
            <wire x2="944" y1="1360" y2="1360" x1="864" />
        </branch>
    </sheet>
</drawing>