<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CE" />
        <signal name="TC" />
        <signal name="Q(10:0)" />
        <signal name="CLK" />
        <port polarity="Input" name="CE" />
        <port polarity="Output" name="TC" />
        <port polarity="Output" name="Q(10:0)" />
        <port polarity="Input" name="CLK" />
        <blockdef name="h_counter">
            <timestamp>2024-11-11T9:28:3</timestamp>
            <rect width="512" x="32" y="32" height="384" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="240" y2="240" x1="0" />
            <line x2="544" y1="80" y2="80" x1="576" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="h_counter" name="XLXI_1">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="CE" name="ce" />
            <blockpin signalname="TC" name="thresh0" />
            <blockpin signalname="Q(10:0)" name="q(10:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="CE">
            <wire x2="240" y1="320" y2="320" x1="224" />
            <wire x2="320" y1="320" y2="320" x1="240" />
            <wire x2="320" y1="320" y2="368" x1="320" />
            <wire x2="368" y1="368" y2="368" x1="320" />
        </branch>
        <branch name="TC">
            <wire x2="960" y1="208" y2="208" x1="944" />
            <wire x2="1024" y1="208" y2="208" x1="960" />
            <wire x2="1040" y1="208" y2="208" x1="1024" />
        </branch>
        <branch name="Q(10:0)">
            <wire x2="960" y1="272" y2="272" x1="944" />
            <wire x2="1024" y1="272" y2="272" x1="960" />
            <wire x2="1040" y1="272" y2="272" x1="1024" />
        </branch>
        <branch name="CLK">
            <wire x2="256" y1="400" y2="400" x1="240" />
            <wire x2="288" y1="400" y2="400" x1="256" />
            <wire x2="288" y1="336" y2="400" x1="288" />
            <wire x2="368" y1="336" y2="336" x1="288" />
        </branch>
        <instance x="368" y="128" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="240" y="400" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="224" y="320" name="CE" orien="R180" />
        <iomarker fontsize="28" x="1040" y="208" name="TC" orien="R0" />
        <iomarker fontsize="28" x="1040" y="272" name="Q(10:0)" orien="R0" />
    </sheet>
</drawing>