<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_272" />
        <signal name="XLXN_287(7:0)" />
        <signal name="BTN1" />
        <signal name="BTN2" />
        <signal name="BTN3" />
        <signal name="BTN4" />
        <signal name="BTN5" />
        <signal name="BTN6" />
        <signal name="OSC" />
        <signal name="K1_1" />
        <signal name="K1_3" />
        <signal name="DIP8" />
        <signal name="DIP1" />
        <port polarity="Input" name="BTN1" />
        <port polarity="Input" name="BTN2" />
        <port polarity="Input" name="BTN3" />
        <port polarity="Input" name="BTN4" />
        <port polarity="Input" name="BTN5" />
        <port polarity="Input" name="BTN6" />
        <port polarity="Input" name="OSC" />
        <port polarity="Output" name="K1_1" />
        <port polarity="Output" name="K1_3" />
        <port polarity="Input" name="DIP8" />
        <port polarity="Input" name="DIP1" />
        <blockdef name="transmitter">
            <timestamp>2024-11-7T19:39:50</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="BTN_inputs">
            <timestamp>2024-11-10T15:36:9</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
        </blockdef>
        <block symbolname="transmitter" name="XLXI_114">
            <blockpin signalname="XLXN_272" name="BGN" />
            <blockpin signalname="DIP8" name="CE" />
            <blockpin signalname="OSC" name="CLK" />
            <blockpin signalname="DIP1" name="CLR" />
            <blockpin signalname="K1_1" name="D" />
            <blockpin signalname="XLXN_287(7:0)" name="DATA(7:0)" />
            <blockpin signalname="K1_3" name="S" />
        </block>
        <block symbolname="vcc" name="XLXI_133">
            <blockpin signalname="XLXN_272" name="P" />
        </block>
        <block symbolname="BTN_inputs" name="BTN_inputs_map">
            <blockpin signalname="BTN1" name="BTN1" />
            <blockpin signalname="BTN2" name="BTN2" />
            <blockpin signalname="BTN3" name="BTN3" />
            <blockpin signalname="BTN4" name="BTN4" />
            <blockpin signalname="BTN5" name="BTN5" />
            <blockpin signalname="BTN6" name="BTN6" />
            <blockpin signalname="XLXN_287(7:0)" name="BTNS(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="896" y="880" name="XLXI_114" orien="R0">
        </instance>
        <branch name="XLXN_272">
            <wire x2="896" y1="784" y2="784" x1="864" />
        </branch>
        <instance x="864" y="848" name="XLXI_133" orien="R270" />
        <instance x="336" y="624" name="BTN_inputs_map" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="80" y="-480" type="instance" />
        </instance>
        <branch name="XLXN_287(7:0)">
            <wire x2="800" y1="272" y2="272" x1="720" />
            <wire x2="800" y1="272" y2="592" x1="800" />
            <wire x2="896" y1="592" y2="592" x1="800" />
        </branch>
        <branch name="BTN1">
            <wire x2="336" y1="272" y2="272" x1="272" />
        </branch>
        <branch name="BTN2">
            <wire x2="336" y1="336" y2="336" x1="272" />
        </branch>
        <branch name="BTN3">
            <wire x2="336" y1="400" y2="400" x1="272" />
        </branch>
        <branch name="BTN4">
            <wire x2="336" y1="464" y2="464" x1="272" />
        </branch>
        <branch name="BTN5">
            <wire x2="336" y1="528" y2="528" x1="272" />
        </branch>
        <branch name="BTN6">
            <wire x2="336" y1="592" y2="592" x1="272" />
        </branch>
        <branch name="OSC">
            <wire x2="896" y1="720" y2="720" x1="256" />
        </branch>
        <branch name="K1_1">
            <wire x2="1360" y1="592" y2="592" x1="1280" />
        </branch>
        <branch name="K1_3">
            <wire x2="1360" y1="656" y2="656" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="272" y="272" name="BTN1" orien="R180" />
        <iomarker fontsize="28" x="272" y="336" name="BTN2" orien="R180" />
        <iomarker fontsize="28" x="272" y="400" name="BTN3" orien="R180" />
        <iomarker fontsize="28" x="272" y="464" name="BTN4" orien="R180" />
        <iomarker fontsize="28" x="272" y="528" name="BTN5" orien="R180" />
        <iomarker fontsize="28" x="272" y="592" name="BTN6" orien="R180" />
        <iomarker fontsize="28" x="256" y="720" name="OSC" orien="R180" />
        <iomarker fontsize="28" x="1360" y="592" name="K1_1" orien="R0" />
        <iomarker fontsize="28" x="1360" y="656" name="K1_3" orien="R0" />
        <branch name="DIP8">
            <wire x2="896" y1="656" y2="656" x1="256" />
        </branch>
        <branch name="DIP1">
            <wire x2="880" y1="848" y2="848" x1="256" />
            <wire x2="896" y1="848" y2="848" x1="880" />
        </branch>
        <iomarker fontsize="28" x="256" y="656" name="DIP8" orien="R180" />
        <iomarker fontsize="28" x="256" y="848" name="DIP1" orien="R180" />
    </sheet>
</drawing>