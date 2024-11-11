<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="SYS_CLK" />
        <signal name="TX_CLK" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="SYS_CLK" />
        <port polarity="Output" name="TX_CLK" />
        <blockdef name="sys_tx_clk_pll">
            <timestamp>2024-11-10T10:16:14</timestamp>
            <rect width="544" x="32" y="32" height="1056" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="576" y1="80" y2="80" x1="608" />
            <line x2="576" y1="176" y2="176" x1="608" />
        </blockdef>
        <block symbolname="sys_tx_clk_pll" name="XLXI_1">
            <blockpin signalname="CLK" name="clk_in1" />
            <blockpin signalname="SYS_CLK" name="clk_out1" />
            <blockpin signalname="TX_CLK" name="clk_out2" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="288" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK">
            <wire x2="288" y1="208" y2="208" x1="256" />
        </branch>
        <iomarker fontsize="28" x="256" y="208" name="CLK" orien="R180" />
        <branch name="SYS_CLK">
            <wire x2="912" y1="208" y2="208" x1="896" />
            <wire x2="960" y1="208" y2="208" x1="912" />
        </branch>
        <branch name="TX_CLK">
            <wire x2="912" y1="304" y2="304" x1="896" />
            <wire x2="960" y1="304" y2="304" x1="912" />
        </branch>
        <iomarker fontsize="28" x="960" y="208" name="SYS_CLK" orien="R0" />
        <iomarker fontsize="28" x="960" y="304" name="TX_CLK" orien="R0" />
    </sheet>
</drawing>