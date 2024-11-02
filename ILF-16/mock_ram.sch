<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ADDR(15:0)" />
        <signal name="DIN(15:0)" />
        <signal name="WE" />
        <signal name="CLK" />
        <signal name="DO(15:0)" />
        <port polarity="Input" name="ADDR(15:0)" />
        <port polarity="Input" name="DIN(15:0)" />
        <port polarity="Input" name="WE" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="DO(15:0)" />
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="432" y="160" name="ADDR(15:0)" orien="R180" />
        <branch name="ADDR(15:0)">
            <wire x2="480" y1="160" y2="160" x1="432" />
        </branch>
        <iomarker fontsize="28" x="320" y="320" name="WE" orien="R180" />
        <branch name="WE">
            <wire x2="480" y1="320" y2="320" x1="320" />
        </branch>
        <iomarker fontsize="28" x="336" y="400" name="CLK" orien="R180" />
        <branch name="CLK">
            <wire x2="480" y1="400" y2="400" x1="336" />
        </branch>
        <branch name="DO(15:0)">
            <wire x2="720" y1="160" y2="160" x1="640" />
        </branch>
        <iomarker fontsize="28" x="720" y="160" name="DO(15:0)" orien="R0" />
        <iomarker fontsize="28" x="400" y="240" name="DIN(15:0)" orien="R180" />
        <branch name="DIN(15:0)">
            <wire x2="480" y1="240" y2="240" x1="400" />
        </branch>
    </sheet>
</drawing>