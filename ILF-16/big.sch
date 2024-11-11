<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="K5_1" />
        <signal name="K5_3" />
        <signal name="K5_5" />
        <signal name="K5_7" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="OSC" />
        <signal name="LED(7:0)" />
        <signal name="BTN1" />
        <signal name="XLXN_16" />
        <port polarity="Input" name="K5_1" />
        <port polarity="Input" name="K5_3" />
        <port polarity="Input" name="K5_5" />
        <port polarity="Input" name="K5_7" />
        <port polarity="Input" name="OSC" />
        <port polarity="Output" name="LED(7:0)" />
        <port polarity="Input" name="BTN1" />
        <blockdef name="ibufds">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-48" x1="0" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <circle r="8" cx="56" cy="-16" />
            <line x2="48" y1="-16" y2="-16" x1="0" />
        </blockdef>
        <blockdef name="receiver">
            <timestamp>2024-11-7T16:42:31</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="rxclk_pll">
            <timestamp>2024-11-7T18:7:18</timestamp>
            <rect width="544" x="32" y="32" height="1056" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="576" y1="80" y2="80" x1="608" />
        </blockdef>
        <block symbolname="ibufds" name="XLXI_2">
            <attr value="TRUE" name="DIFF_TERM">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="K5_1" name="I" />
            <blockpin signalname="K5_3" name="IB" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="ibufds" name="XLXI_4">
            <attr value="TRUE" name="DIFF_TERM">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="K5_5" name="I" />
            <blockpin signalname="K5_7" name="IB" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="receiver" name="SW_RX">
            <blockpin signalname="XLXN_16" name="CLK" />
            <blockpin signalname="BTN1" name="CLR" />
            <blockpin signalname="XLXN_11" name="D" />
            <blockpin signalname="LED(7:0)" name="DATA(7:0)" />
            <blockpin signalname="XLXN_12" name="S" />
        </block>
        <block symbolname="rxclk_pll" name="XLXI_7">
            <blockpin signalname="OSC" name="clk_in1" />
            <blockpin signalname="XLXN_16" name="clk_out1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="K5_1">
            <wire x2="320" y1="240" y2="240" x1="240" />
            <wire x2="320" y1="240" y2="272" x1="320" />
            <wire x2="400" y1="272" y2="272" x1="320" />
        </branch>
        <branch name="K5_3">
            <wire x2="320" y1="336" y2="336" x1="240" />
            <wire x2="400" y1="304" y2="304" x1="320" />
            <wire x2="320" y1="304" y2="336" x1="320" />
        </branch>
        <instance x="400" y="320" name="XLXI_2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="DIFF_TERM" x="0" y="-96" type="instance" />
        </instance>
        <branch name="K5_5">
            <wire x2="320" y1="464" y2="464" x1="240" />
            <wire x2="320" y1="464" y2="496" x1="320" />
            <wire x2="400" y1="496" y2="496" x1="320" />
        </branch>
        <branch name="K5_7">
            <wire x2="320" y1="560" y2="560" x1="240" />
            <wire x2="320" y1="528" y2="560" x1="320" />
            <wire x2="400" y1="528" y2="528" x1="320" />
        </branch>
        <instance x="400" y="544" name="XLXI_4" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="DIFF_TERM" x="0" y="-96" type="instance" />
        </instance>
        <iomarker fontsize="28" x="240" y="240" name="K5_1" orien="R180" />
        <iomarker fontsize="28" x="240" y="336" name="K5_3" orien="R180" />
        <iomarker fontsize="28" x="240" y="464" name="K5_5" orien="R180" />
        <iomarker fontsize="28" x="240" y="560" name="K5_7" orien="R180" />
        <iomarker fontsize="28" x="256" y="768" name="OSC" orien="R180" />
        <branch name="LED(7:0)">
            <wire x2="1824" y1="352" y2="352" x1="1760" />
            <wire x2="1840" y1="352" y2="352" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1840" y="352" name="LED(7:0)" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="640" y1="288" y2="288" x1="624" />
            <wire x2="720" y1="288" y2="288" x1="640" />
            <wire x2="720" y1="288" y2="352" x1="720" />
            <wire x2="1376" y1="352" y2="352" x1="720" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="640" y1="512" y2="512" x1="624" />
            <wire x2="720" y1="512" y2="512" x1="640" />
            <wire x2="1376" y1="416" y2="416" x1="720" />
            <wire x2="720" y1="416" y2="512" x1="720" />
        </branch>
        <instance x="1376" y="576" name="SW_RX" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="144" y="-352" type="instance" />
        </instance>
        <branch name="BTN1">
            <wire x2="1328" y1="544" y2="544" x1="1312" />
            <wire x2="1376" y1="544" y2="544" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1312" y="544" name="BTN1" orien="R180" />
        <branch name="OSC">
            <wire x2="400" y1="768" y2="768" x1="256" />
        </branch>
        <instance x="400" y="688" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_16">
            <wire x2="1024" y1="768" y2="768" x1="1008" />
            <wire x2="1120" y1="768" y2="768" x1="1024" />
            <wire x2="1120" y1="480" y2="768" x1="1120" />
            <wire x2="1376" y1="480" y2="480" x1="1120" />
        </branch>
    </sheet>
</drawing>