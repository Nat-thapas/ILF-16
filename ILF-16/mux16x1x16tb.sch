<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(15:0)" />
        <signal name="XLXN_2(15:0)" />
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_4(15:0)" />
        <signal name="D0(15:0)" />
        <signal name="D1(15:0)" />
        <signal name="D2(15:0)" />
        <signal name="D3(15:0)" />
        <signal name="D4(15:0)" />
        <signal name="D5(15:0)" />
        <signal name="D6(15:0)" />
        <signal name="D7(15:0)" />
        <signal name="D8(15:0)" />
        <signal name="D9(15:0)" />
        <signal name="D10(15:0)" />
        <signal name="D11(15:0)" />
        <signal name="D12(15:0)" />
        <signal name="D13(15:0)" />
        <signal name="D14(15:0)" />
        <signal name="D15(15:0)" />
        <signal name="S(3)" />
        <signal name="S(2)" />
        <signal name="S(0)" />
        <signal name="S(1)" />
        <signal name="S(3:0)" />
        <signal name="O(15:0)" />
        <port polarity="Input" name="D0(15:0)" />
        <port polarity="Input" name="D1(15:0)" />
        <port polarity="Input" name="D2(15:0)" />
        <port polarity="Input" name="D3(15:0)" />
        <port polarity="Input" name="D4(15:0)" />
        <port polarity="Input" name="D5(15:0)" />
        <port polarity="Input" name="D6(15:0)" />
        <port polarity="Input" name="D7(15:0)" />
        <port polarity="Input" name="D8(15:0)" />
        <port polarity="Input" name="D9(15:0)" />
        <port polarity="Input" name="D10(15:0)" />
        <port polarity="Input" name="D11(15:0)" />
        <port polarity="Input" name="D12(15:0)" />
        <port polarity="Input" name="D13(15:0)" />
        <port polarity="Input" name="D14(15:0)" />
        <port polarity="Input" name="D15(15:0)" />
        <port polarity="Input" name="S(3:0)" />
        <port polarity="Output" name="O(15:0)" />
        <blockdef name="mux4x1x16t">
            <timestamp>2024-9-23T13:43:49</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <block symbolname="mux4x1x16t" name="ML1">
            <blockpin signalname="D0(15:0)" name="D0(15:0)" />
            <blockpin signalname="D1(15:0)" name="D1(15:0)" />
            <blockpin signalname="D2(15:0)" name="D2(15:0)" />
            <blockpin signalname="D3(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_1(15:0)" name="O(15:0)" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
        </block>
        <block symbolname="mux4x1x16t" name="ML2">
            <blockpin signalname="D4(15:0)" name="D0(15:0)" />
            <blockpin signalname="D5(15:0)" name="D1(15:0)" />
            <blockpin signalname="D6(15:0)" name="D2(15:0)" />
            <blockpin signalname="D7(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="O(15:0)" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
        </block>
        <block symbolname="mux4x1x16t" name="ML3">
            <blockpin signalname="D8(15:0)" name="D0(15:0)" />
            <blockpin signalname="D9(15:0)" name="D1(15:0)" />
            <blockpin signalname="D10(15:0)" name="D2(15:0)" />
            <blockpin signalname="D11(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_3(15:0)" name="O(15:0)" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
        </block>
        <block symbolname="mux4x1x16t" name="ML4">
            <blockpin signalname="D12(15:0)" name="D0(15:0)" />
            <blockpin signalname="D13(15:0)" name="D1(15:0)" />
            <blockpin signalname="D14(15:0)" name="D2(15:0)" />
            <blockpin signalname="D15(15:0)" name="D3(15:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="O(15:0)" />
            <blockpin signalname="S(0)" name="S0" />
            <blockpin signalname="S(1)" name="S1" />
        </block>
        <block symbolname="mux4x1x16t" name="MH1">
            <blockpin signalname="XLXN_1(15:0)" name="D0(15:0)" />
            <blockpin signalname="XLXN_2(15:0)" name="D1(15:0)" />
            <blockpin signalname="XLXN_3(15:0)" name="D2(15:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="D3(15:0)" />
            <blockpin signalname="O(15:0)" name="O(15:0)" />
            <blockpin signalname="S(2)" name="S0" />
            <blockpin signalname="S(3)" name="S1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1(15:0)">
            <wire x2="1136" y1="272" y2="272" x1="880" />
        </branch>
        <branch name="XLXN_2(15:0)">
            <wire x2="912" y1="752" y2="752" x1="880" />
            <wire x2="912" y1="336" y2="752" x1="912" />
            <wire x2="1136" y1="336" y2="336" x1="912" />
        </branch>
        <branch name="XLXN_3(15:0)">
            <wire x2="944" y1="1232" y2="1232" x1="880" />
            <wire x2="944" y1="400" y2="1232" x1="944" />
            <wire x2="1136" y1="400" y2="400" x1="944" />
        </branch>
        <branch name="XLXN_4(15:0)">
            <wire x2="976" y1="1712" y2="1712" x1="880" />
            <wire x2="976" y1="464" y2="1712" x1="976" />
            <wire x2="1136" y1="464" y2="464" x1="976" />
        </branch>
        <branch name="D0(15:0)">
            <wire x2="496" y1="272" y2="272" x1="304" />
        </branch>
        <branch name="D1(15:0)">
            <wire x2="496" y1="336" y2="336" x1="304" />
        </branch>
        <branch name="D2(15:0)">
            <wire x2="496" y1="400" y2="400" x1="304" />
        </branch>
        <branch name="D3(15:0)">
            <wire x2="496" y1="464" y2="464" x1="304" />
        </branch>
        <branch name="D4(15:0)">
            <wire x2="496" y1="752" y2="752" x1="304" />
        </branch>
        <branch name="D5(15:0)">
            <wire x2="496" y1="816" y2="816" x1="304" />
        </branch>
        <branch name="D6(15:0)">
            <wire x2="496" y1="880" y2="880" x1="304" />
        </branch>
        <branch name="D7(15:0)">
            <wire x2="496" y1="944" y2="944" x1="304" />
        </branch>
        <branch name="D8(15:0)">
            <wire x2="496" y1="1232" y2="1232" x1="304" />
        </branch>
        <branch name="D9(15:0)">
            <wire x2="496" y1="1296" y2="1296" x1="304" />
        </branch>
        <branch name="D10(15:0)">
            <wire x2="496" y1="1360" y2="1360" x1="320" />
        </branch>
        <branch name="D11(15:0)">
            <wire x2="496" y1="1424" y2="1424" x1="320" />
        </branch>
        <branch name="D12(15:0)">
            <wire x2="496" y1="1712" y2="1712" x1="320" />
        </branch>
        <branch name="D13(15:0)">
            <wire x2="496" y1="1776" y2="1776" x1="320" />
        </branch>
        <branch name="D14(15:0)">
            <wire x2="496" y1="1840" y2="1840" x1="320" />
        </branch>
        <branch name="D15(15:0)">
            <wire x2="496" y1="1904" y2="1904" x1="320" />
        </branch>
        <instance x="496" y="624" name="ML1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-224" type="instance" />
        </instance>
        <instance x="496" y="1104" name="ML2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-224" type="instance" />
        </instance>
        <instance x="496" y="1584" name="ML3" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-224" type="instance" />
        </instance>
        <instance x="496" y="2064" name="ML4" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-224" type="instance" />
        </instance>
        <instance x="1136" y="624" name="MH1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="224" y="-224" type="instance" />
        </instance>
        <iomarker fontsize="28" x="320" y="1904" name="D15(15:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="1840" name="D14(15:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="1776" name="D13(15:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="1712" name="D12(15:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="1424" name="D11(15:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="1360" name="D10(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="1296" name="D9(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="1232" name="D8(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="944" name="D7(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="880" name="D6(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="816" name="D5(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="752" name="D4(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="464" name="D3(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="400" name="D2(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="336" name="D1(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="272" name="D0(15:0)" orien="R180" />
        <iomarker fontsize="28" x="272" y="2240" name="S(3:0)" orien="R180" />
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="400" y="2128" type="branch" />
            <wire x2="400" y1="528" y2="1008" x1="400" />
            <wire x2="400" y1="1008" y2="1488" x1="400" />
            <wire x2="400" y1="1488" y2="1968" x1="400" />
            <wire x2="496" y1="1968" y2="1968" x1="400" />
            <wire x2="400" y1="1968" y2="2128" x1="400" />
            <wire x2="400" y1="2128" y2="2144" x1="400" />
            <wire x2="496" y1="1488" y2="1488" x1="400" />
            <wire x2="496" y1="1008" y2="1008" x1="400" />
            <wire x2="496" y1="528" y2="528" x1="400" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="2128" type="branch" />
            <wire x2="496" y1="592" y2="592" x1="464" />
            <wire x2="464" y1="592" y2="1072" x1="464" />
            <wire x2="496" y1="1072" y2="1072" x1="464" />
            <wire x2="464" y1="1072" y2="1552" x1="464" />
            <wire x2="496" y1="1552" y2="1552" x1="464" />
            <wire x2="464" y1="1552" y2="2032" x1="464" />
            <wire x2="496" y1="2032" y2="2032" x1="464" />
            <wire x2="464" y1="2032" y2="2128" x1="464" />
            <wire x2="464" y1="2128" y2="2144" x1="464" />
        </branch>
        <branch name="S(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1104" y="2128" type="branch" />
            <wire x2="1136" y1="592" y2="592" x1="1104" />
            <wire x2="1104" y1="592" y2="2128" x1="1104" />
            <wire x2="1104" y1="2128" y2="2144" x1="1104" />
        </branch>
        <branch name="S(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="2128" type="branch" />
            <wire x2="1136" y1="528" y2="528" x1="1040" />
            <wire x2="1040" y1="528" y2="2128" x1="1040" />
            <wire x2="1040" y1="2128" y2="2144" x1="1040" />
        </branch>
        <bustap x2="1040" y1="2240" y2="2144" x1="1040" />
        <bustap x2="1104" y1="2240" y2="2144" x1="1104" />
        <bustap x2="400" y1="2240" y2="2144" x1="400" />
        <bustap x2="464" y1="2240" y2="2144" x1="464" />
        <branch name="S(3:0)">
            <wire x2="400" y1="2240" y2="2240" x1="272" />
            <wire x2="464" y1="2240" y2="2240" x1="400" />
            <wire x2="1040" y1="2240" y2="2240" x1="464" />
            <wire x2="1104" y1="2240" y2="2240" x1="1040" />
        </branch>
        <branch name="O(15:0)">
            <wire x2="1536" y1="272" y2="272" x1="1520" />
            <wire x2="1600" y1="272" y2="272" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1600" y="272" name="O(15:0)" orien="R0" />
    </sheet>
</drawing>