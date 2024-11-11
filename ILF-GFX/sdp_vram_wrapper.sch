<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="WAD(15:0)" />
        <signal name="DIN(3:0)" />
        <signal name="WE" />
        <signal name="RAD(15:0)" />
        <signal name="DO(3:0)" />
        <signal name="WCLK" />
        <signal name="RCLK" />
        <port polarity="Input" name="WAD(15:0)" />
        <port polarity="Input" name="DIN(3:0)" />
        <port polarity="Input" name="WE" />
        <port polarity="Input" name="RAD(15:0)" />
        <port polarity="Output" name="DO(3:0)" />
        <port polarity="Input" name="WCLK" />
        <port polarity="Input" name="RCLK" />
        <blockdef name="sdp_vram">
            <timestamp>2024-11-11T8:46:15</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="32" y1="432" y2="432" style="linewidth:W" x1="0" />
            <line x2="32" y1="624" y2="624" x1="0" />
            <line x2="544" y1="368" y2="368" style="linewidth:W" x1="576" />
        </blockdef>
        <block symbolname="sdp_vram" name="XLXI_1">
            <blockpin signalname="WAD(15:0)" name="addra(15:0)" />
            <blockpin signalname="DIN(3:0)" name="dina(3:0)" />
            <blockpin signalname="WE" name="wea(0:0)" />
            <blockpin signalname="WCLK" name="clka" />
            <blockpin signalname="RAD(15:0)" name="addrb(15:0)" />
            <blockpin signalname="RCLK" name="clkb" />
            <blockpin signalname="DO(3:0)" name="doutb(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="448" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="WAD(15:0)">
            <wire x2="432" y1="208" y2="208" x1="336" />
            <wire x2="448" y1="208" y2="208" x1="432" />
        </branch>
        <branch name="DIN(3:0)">
            <wire x2="432" y1="272" y2="272" x1="304" />
            <wire x2="448" y1="240" y2="240" x1="432" />
            <wire x2="432" y1="240" y2="272" x1="432" />
        </branch>
        <branch name="WE">
            <wire x2="432" y1="336" y2="336" x1="240" />
            <wire x2="448" y1="336" y2="336" x1="432" />
        </branch>
        <branch name="RAD(15:0)">
            <wire x2="432" y1="560" y2="560" x1="336" />
            <wire x2="448" y1="560" y2="560" x1="432" />
        </branch>
        <branch name="DO(3:0)">
            <wire x2="1040" y1="496" y2="496" x1="1024" />
            <wire x2="1120" y1="496" y2="496" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1120" y="496" name="DO(3:0)" orien="R0" />
        <iomarker fontsize="28" x="336" y="560" name="RAD(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="272" name="DIN(3:0)" orien="R180" />
        <iomarker fontsize="28" x="336" y="208" name="WAD(15:0)" orien="R180" />
        <iomarker fontsize="28" x="240" y="336" name="WE" orien="R180" />
        <branch name="WCLK">
            <wire x2="432" y1="400" y2="400" x1="288" />
            <wire x2="448" y1="400" y2="400" x1="432" />
        </branch>
        <branch name="RCLK">
            <wire x2="432" y1="752" y2="752" x1="272" />
            <wire x2="448" y1="752" y2="752" x1="432" />
        </branch>
        <iomarker fontsize="28" x="272" y="752" name="RCLK" orien="R180" />
        <iomarker fontsize="28" x="288" y="400" name="WCLK" orien="R180" />
    </sheet>
</drawing>