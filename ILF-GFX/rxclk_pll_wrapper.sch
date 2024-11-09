<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="CLKO" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="CLKO" />
        <blockdef name="rxclk_pll">
            <timestamp>2024-11-9T16:25:35</timestamp>
            <rect width="544" x="32" y="32" height="1056" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="576" y1="80" y2="80" x1="608" />
        </blockdef>
        <block symbolname="rxclk_pll" name="XLXI_1">
            <blockpin signalname="CLK" name="clk_in1" />
            <blockpin signalname="CLKO" name="clk_out1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="288" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK">
            <wire x2="288" y1="208" y2="208" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="208" name="CLK" orien="R180" />
        <branch name="CLKO">
            <wire x2="912" y1="208" y2="208" x1="896" />
            <wire x2="960" y1="208" y2="208" x1="912" />
        </branch>
        <iomarker fontsize="28" x="960" y="208" name="CLKO" orien="R0" />
    </sheet>
</drawing>