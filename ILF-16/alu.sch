<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CEA" />
        <signal name="A(15:0)" />
        <signal name="CEB" />
        <signal name="B(15:0)" />
        <signal name="CLK" />
        <signal name="XLXN_11" />
        <port polarity="Input" name="CEA" />
        <port polarity="Input" name="A(15:0)" />
        <port polarity="Input" name="CEB" />
        <port polarity="Input" name="B(15:0)" />
        <port polarity="Input" name="CLK" />
        <blockdef name="fd16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="64" x="320" y="-268" height="24" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="adsu16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="384" y1="-64" y2="-64" x1="240" />
            <line x2="240" y1="-124" y2="-64" x1="240" />
            <rect width="64" x="0" y="-204" height="24" />
            <rect width="64" x="0" y="-332" height="24" />
            <rect width="64" x="384" y="-268" height="24" />
            <line x2="64" y1="-448" y2="-448" x1="128" />
            <line x2="128" y1="-416" y2="-448" x1="128" />
            <line x2="48" y1="-64" y2="-64" x1="128" />
            <line x2="128" y1="-96" y2="-64" x1="128" />
            <line x2="64" y1="-288" y2="-432" x1="64" />
            <line x2="64" y1="-256" y2="-288" x1="128" />
            <line x2="128" y1="-224" y2="-256" x1="64" />
            <line x2="64" y1="-80" y2="-224" x1="64" />
            <line x2="64" y1="-160" y2="-80" x1="384" />
            <line x2="384" y1="-336" y2="-160" x1="384" />
            <line x2="384" y1="-352" y2="-336" x1="384" />
            <line x2="384" y1="-432" y2="-352" x1="64" />
            <line x2="336" y1="-128" y2="-148" x1="336" />
            <line x2="336" y1="-128" y2="-128" x1="384" />
            <line x2="384" y1="-256" y2="-256" x1="448" />
            <line x2="384" y1="-128" y2="-128" x1="448" />
            <line x2="384" y1="-64" y2="-64" x1="448" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="mult">
            <timestamp>2024-9-12T5:37:9</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <block symbolname="fd16ce" name="XLXI_1">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CEA" name="CE" />
            <blockpin signalname="XLXN_11" name="CLR" />
            <blockpin signalname="A(15:0)" name="D(15:0)" />
            <blockpin name="Q(15:0)" />
        </block>
        <block symbolname="fd16ce" name="XLXI_2">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="CEB" name="CE" />
            <blockpin signalname="XLXN_11" name="CLR" />
            <blockpin signalname="B(15:0)" name="D(15:0)" />
            <blockpin name="Q(15:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_11" name="G" />
        </block>
        <block symbolname="adsu16" name="XLXI_6">
            <blockpin name="A(15:0)" />
            <blockpin name="ADD" />
            <blockpin name="B(15:0)" />
            <blockpin name="CI" />
            <blockpin name="CO" />
            <blockpin name="OFL" />
            <blockpin name="S(15:0)" />
        </block>
        <block symbolname="mult" name="XLXI_7">
            <blockpin name="A(15:0)" />
            <blockpin name="B(15:0)" />
            <blockpin name="H(15:0)" />
            <blockpin name="L(15:0)" />
            <blockpin name="Signed" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="416" y="480" name="XLXI_1" orien="R0" />
        <instance x="416" y="960" name="XLXI_2" orien="R0" />
        <branch name="CEA">
            <wire x2="416" y1="288" y2="288" x1="256" />
        </branch>
        <branch name="A(15:0)">
            <wire x2="416" y1="224" y2="224" x1="288" />
        </branch>
        <branch name="CEB">
            <wire x2="416" y1="768" y2="768" x1="256" />
        </branch>
        <branch name="B(15:0)">
            <wire x2="416" y1="704" y2="704" x1="288" />
        </branch>
        <iomarker fontsize="28" x="288" y="224" name="A(15:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="288" name="CEA" orien="R180" />
        <iomarker fontsize="28" x="288" y="704" name="B(15:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="768" name="CEB" orien="R180" />
        <branch name="CLK">
            <wire x2="336" y1="1120" y2="1120" x1="256" />
            <wire x2="336" y1="352" y2="832" x1="336" />
            <wire x2="416" y1="832" y2="832" x1="336" />
            <wire x2="336" y1="832" y2="1120" x1="336" />
            <wire x2="416" y1="352" y2="352" x1="336" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="416" y1="448" y2="448" x1="400" />
            <wire x2="400" y1="448" y2="928" x1="400" />
            <wire x2="416" y1="928" y2="928" x1="400" />
            <wire x2="400" y1="928" y2="960" x1="400" />
        </branch>
        <instance x="336" y="1088" name="XLXI_5" orien="R0" />
        <iomarker fontsize="28" x="256" y="1120" name="CLK" orien="R180" />
        <instance x="1440" y="608" name="XLXI_6" orien="R0" />
        <instance x="1440" y="912" name="XLXI_7" orien="R0">
        </instance>
    </sheet>
</drawing>