<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDR(15:0)" />
        <signal name="CLK" />
        <signal name="D(31:0)" />
        <port polarity="Input" name="ADDR(15:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="D(31:0)" />
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="352" y="160" name="ADDR(15:0)" orien="R180" />
        <branch name="ADDR(15:0)">
            <wire x2="400" y1="160" y2="160" x1="352" />
        </branch>
        <iomarker fontsize="28" x="256" y="240" name="CLK" orien="R180" />
        <branch name="CLK">
            <wire x2="400" y1="240" y2="240" x1="256" />
        </branch>
        <branch name="D(31:0)">
            <wire x2="560" y1="160" y2="160" x1="480" />
        </branch>
        <iomarker fontsize="28" x="560" y="160" name="D(31:0)" orien="R0" />
    </sheet>
</drawing>