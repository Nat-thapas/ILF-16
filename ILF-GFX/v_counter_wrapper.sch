<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="CE" />
        <signal name="Q(9:0)" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="CE" />
        <port polarity="Output" name="Q(9:0)" />
        <blockdef name="v_counter">
            <timestamp>2024-11-9T14:59:22</timestamp>
            <rect width="512" x="32" y="32" height="384" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="240" y2="240" x1="0" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="v_counter" name="XLXI_1">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="CE" name="ce" />
            <blockpin signalname="Q(9:0)" name="q(9:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK">
            <wire x2="288" y1="384" y2="384" x1="240" />
            <wire x2="288" y1="336" y2="384" x1="288" />
            <wire x2="368" y1="336" y2="336" x1="288" />
        </branch>
        <branch name="CE">
            <wire x2="320" y1="320" y2="320" x1="224" />
            <wire x2="320" y1="320" y2="368" x1="320" />
            <wire x2="368" y1="368" y2="368" x1="320" />
        </branch>
        <branch name="Q(9:0)">
            <wire x2="960" y1="272" y2="272" x1="944" />
            <wire x2="1040" y1="272" y2="272" x1="960" />
        </branch>
        <iomarker fontsize="28" x="240" y="384" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="224" y="320" name="CE" orien="R180" />
        <iomarker fontsize="28" x="1040" y="272" name="Q(9:0)" orien="R0" />
    </sheet>
</drawing>