<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDR(15:0)" />
        <signal name="DIN(3:0)" />
        <signal name="WE" />
        <signal name="CLK" />
        <signal name="DO(3:0)" />
        <port polarity="Input" name="ADDR(15:0)" />
        <port polarity="Input" name="DIN(3:0)" />
        <port polarity="Input" name="WE" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="DO(3:0)" />
        <blockdef name="vram">
            <timestamp>2024-11-9T15:6:59</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="vram" name="XLXI_1">
            <blockpin signalname="ADDR(15:0)" name="addra(15:0)" />
            <blockpin signalname="DIN(3:0)" name="dina(3:0)" />
            <blockpin signalname="WE" name="wea(0:0)" />
            <blockpin signalname="CLK" name="clka" />
            <blockpin signalname="DO(3:0)" name="douta(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="ADDR(15:0)">
            <wire x2="368" y1="208" y2="208" x1="352" />
        </branch>
        <branch name="DIN(3:0)">
            <wire x2="352" y1="272" y2="272" x1="304" />
            <wire x2="368" y1="240" y2="240" x1="352" />
            <wire x2="352" y1="240" y2="272" x1="352" />
        </branch>
        <branch name="WE">
            <wire x2="352" y1="336" y2="336" x1="240" />
            <wire x2="368" y1="336" y2="336" x1="352" />
        </branch>
        <branch name="CLK">
            <wire x2="352" y1="400" y2="400" x1="256" />
            <wire x2="368" y1="400" y2="400" x1="352" />
        </branch>
        <branch name="DO(3:0)">
            <wire x2="960" y1="208" y2="208" x1="944" />
            <wire x2="1040" y1="208" y2="208" x1="960" />
        </branch>
        <iomarker fontsize="28" x="240" y="336" name="WE" orien="R180" />
        <iomarker fontsize="28" x="256" y="400" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="304" y="272" name="DIN(3:0)" orien="R180" />
        <iomarker fontsize="28" x="352" y="208" name="ADDR(15:0)" orien="R180" />
        <iomarker fontsize="28" x="1040" y="208" name="DO(3:0)" orien="R0" />
    </sheet>
</drawing>