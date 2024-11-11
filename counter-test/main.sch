<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BTN1" />
        <signal name="LED7" />
        <signal name="LED(3:0)" />
        <port polarity="Input" name="BTN1" />
        <port polarity="Output" name="LED7" />
        <port polarity="Output" name="LED(3:0)" />
        <blockdef name="counter10">
            <timestamp>2024-11-11T9:19:38</timestamp>
            <rect width="512" x="32" y="32" height="384" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="544" y1="80" y2="80" x1="576" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="counter10" name="XLXI_1">
            <blockpin signalname="BTN1" name="clk" />
            <blockpin signalname="LED7" name="thresh0" />
            <blockpin signalname="LED(3:0)" name="q(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="208" name="XLXI_1" orien="R0">
        </instance>
        <branch name="BTN1">
            <wire x2="368" y1="416" y2="416" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="416" name="BTN1" orien="R180" />
        <branch name="LED7">
            <wire x2="976" y1="288" y2="288" x1="944" />
        </branch>
        <iomarker fontsize="28" x="976" y="288" name="LED7" orien="R0" />
        <branch name="LED(3:0)">
            <wire x2="976" y1="352" y2="352" x1="944" />
        </branch>
        <iomarker fontsize="28" x="976" y="352" name="LED(3:0)" orien="R0" />
    </sheet>
</drawing>