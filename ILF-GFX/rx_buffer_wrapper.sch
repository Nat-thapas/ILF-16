<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="RST" />
        <signal name="DIN(31:0)" />
        <signal name="WE" />
        <signal name="FULL" />
        <signal name="DO(31:0)" />
        <signal name="RE" />
        <signal name="EMP" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="DIN(31:0)" />
        <port polarity="Input" name="WE" />
        <port polarity="Output" name="FULL" />
        <port polarity="Output" name="DO(31:0)" />
        <port polarity="Input" name="RE" />
        <port polarity="Output" name="EMP" />
        <blockdef name="rx_buffer_fifo">
            <timestamp>2024-11-9T15:59:57</timestamp>
            <rect width="768" x="32" y="32" height="4032" />
            <line x2="32" y1="80" y2="80" x1="0" />
            <line x2="32" y1="112" y2="112" x1="0" />
            <line x2="32" y1="240" y2="240" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="32" y1="464" y2="464" x1="0" />
            <line x2="800" y1="272" y2="272" style="linewidth:W" x1="832" />
            <line x2="800" y1="304" y2="304" x1="832" />
            <line x2="800" y1="496" y2="496" x1="832" />
        </blockdef>
        <block symbolname="rx_buffer_fifo" name="XLXI_1">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="DIN(31:0)" name="din(31:0)" />
            <blockpin signalname="WE" name="wr_en" />
            <blockpin signalname="FULL" name="full" />
            <blockpin signalname="DO(31:0)" name="dout(31:0)" />
            <blockpin signalname="RE" name="rd_en" />
            <blockpin signalname="EMP" name="empty" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="448" y="128" name="XLXI_1" orien="R0">
        </instance>
        <branch name="RST">
            <wire x2="336" y1="656" y2="656" x1="176" />
            <wire x2="448" y1="240" y2="240" x1="336" />
            <wire x2="336" y1="240" y2="656" x1="336" />
        </branch>
        <branch name="WE">
            <wire x2="400" y1="528" y2="528" x1="160" />
            <wire x2="400" y1="400" y2="528" x1="400" />
            <wire x2="448" y1="400" y2="400" x1="400" />
        </branch>
        <branch name="FULL">
            <wire x2="448" y1="592" y2="592" x1="192" />
        </branch>
        <branch name="DO(31:0)">
            <wire x2="1440" y1="400" y2="400" x1="1280" />
        </branch>
        <branch name="RE">
            <wire x2="1328" y1="432" y2="432" x1="1280" />
            <wire x2="1328" y1="432" y2="480" x1="1328" />
            <wire x2="1440" y1="480" y2="480" x1="1328" />
        </branch>
        <branch name="EMP">
            <wire x2="1296" y1="624" y2="624" x1="1280" />
            <wire x2="1440" y1="624" y2="624" x1="1296" />
        </branch>
        <branch name="CLK">
            <wire x2="192" y1="464" y2="464" x1="176" />
            <wire x2="304" y1="464" y2="464" x1="192" />
            <wire x2="448" y1="208" y2="208" x1="304" />
            <wire x2="304" y1="208" y2="464" x1="304" />
        </branch>
        <branch name="DIN(31:0)">
            <wire x2="256" y1="400" y2="400" x1="240" />
            <wire x2="368" y1="400" y2="400" x1="256" />
            <wire x2="448" y1="368" y2="368" x1="368" />
            <wire x2="368" y1="368" y2="400" x1="368" />
        </branch>
        <iomarker fontsize="28" x="240" y="400" name="DIN(31:0)" orien="R180" />
        <iomarker fontsize="28" x="176" y="464" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="160" y="528" name="WE" orien="R180" />
        <iomarker fontsize="28" x="192" y="592" name="FULL" orien="R180" />
        <iomarker fontsize="28" x="176" y="656" name="RST" orien="R180" />
        <iomarker fontsize="28" x="1440" y="480" name="RE" orien="R0" />
        <iomarker fontsize="28" x="1440" y="400" name="DO(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1440" y="624" name="EMP" orien="R0" />
    </sheet>
</drawing>