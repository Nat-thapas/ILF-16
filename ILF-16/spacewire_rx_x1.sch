<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D" />
        <signal name="S" />
        <signal name="XLXN_172" />
        <signal name="XLXN_173" />
        <signal name="XLXN_200" />
        <signal name="XLXN_201" />
        <signal name="XLXN_198" />
        <signal name="XLXN_199" />
        <signal name="RDES(7:0)" />
        <signal name="RDES(7)" />
        <signal name="RDES(6)" />
        <signal name="RDES(5)" />
        <signal name="RDES(4)" />
        <signal name="RDES(3)" />
        <signal name="RDES(2)" />
        <signal name="RDES(1)" />
        <signal name="RDES(0)" />
        <signal name="DES(7)" />
        <signal name="DES(6)" />
        <signal name="DES(5)" />
        <signal name="DES(4)" />
        <signal name="DES(3)" />
        <signal name="DES(2)" />
        <signal name="DES(1)" />
        <signal name="DES(0)" />
        <signal name="XLXN_231" />
        <signal name="XLXN_235" />
        <signal name="XLXN_236" />
        <signal name="CLR" />
        <signal name="XLXN_244" />
        <signal name="XLXN_247" />
        <signal name="XLXN_253" />
        <signal name="XLXN_269" />
        <signal name="XLXN_246" />
        <signal name="XLXN_275" />
        <signal name="XLXN_279" />
        <signal name="DES(7:0)" />
        <signal name="DATA(7:0)" />
        <signal name="CLK" />
        <signal name="XLXN_202" />
        <signal name="XLXN_285" />
        <signal name="XLXN_286" />
        <port polarity="Input" name="D" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="DATA(7:0)" />
        <port polarity="Input" name="CLK" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="sr8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <blockdef name="lut4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="fdce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="fd8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <rect width="64" x="320" y="-268" height="24" />
            <rect width="64" x="0" y="-268" height="24" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="fde">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="fd" name="XLXI_89">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_172" name="D" />
            <blockpin signalname="XLXN_199" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_90">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_173" name="D" />
            <blockpin signalname="XLXN_200" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_91">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_199" name="D" />
            <blockpin signalname="XLXN_198" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_92">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_200" name="D" />
            <blockpin signalname="XLXN_201" name="Q" />
        </block>
        <block symbolname="sr8ce" name="XLXI_104">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_202" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_199" name="SLI" />
            <blockpin signalname="RDES(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="lut4" name="XLXI_103">
            <attr value="6FF6" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 16 h" />
            </attr>
            <blockpin signalname="XLXN_201" name="I0" />
            <blockpin signalname="XLXN_200" name="I1" />
            <blockpin signalname="XLXN_198" name="I2" />
            <blockpin signalname="XLXN_199" name="I3" />
            <blockpin signalname="XLXN_202" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_106">
            <blockpin signalname="RDES(7)" name="I" />
            <blockpin signalname="DES(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_107">
            <blockpin signalname="RDES(6)" name="I" />
            <blockpin signalname="DES(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_108">
            <blockpin signalname="RDES(5)" name="I" />
            <blockpin signalname="DES(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_109">
            <blockpin signalname="RDES(4)" name="I" />
            <blockpin signalname="DES(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_110">
            <blockpin signalname="RDES(3)" name="I" />
            <blockpin signalname="DES(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_111">
            <blockpin signalname="RDES(2)" name="I" />
            <blockpin signalname="DES(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_112">
            <blockpin signalname="RDES(1)" name="I" />
            <blockpin signalname="DES(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_113">
            <blockpin signalname="RDES(0)" name="I" />
            <blockpin signalname="DES(7)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_115">
            <blockpin signalname="XLXN_231" name="G" />
        </block>
        <block symbolname="fdce" name="XLXI_124">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_202" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_253" name="D" />
            <blockpin signalname="XLXN_275" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_125">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_235" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_244" name="D" />
            <blockpin signalname="XLXN_269" name="Q" />
        </block>
        <block symbolname="and2" name="XLXI_127">
            <blockpin signalname="XLXN_202" name="I0" />
            <blockpin signalname="XLXN_275" name="I1" />
            <blockpin signalname="XLXN_235" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_133">
            <blockpin signalname="XLXN_275" name="I" />
            <blockpin signalname="XLXN_253" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_134">
            <blockpin signalname="XLXN_269" name="I" />
            <blockpin signalname="XLXN_244" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_126">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_236" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_247" name="D" />
            <blockpin signalname="XLXN_246" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_136">
            <blockpin signalname="XLXN_246" name="I" />
            <blockpin signalname="XLXN_247" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_137">
            <blockpin signalname="XLXN_202" name="I0" />
            <blockpin signalname="XLXN_269" name="I1" />
            <blockpin signalname="XLXN_275" name="I2" />
            <blockpin signalname="XLXN_236" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_146">
            <blockpin signalname="XLXN_246" name="I0" />
            <blockpin signalname="XLXN_269" name="I1" />
            <blockpin signalname="XLXN_275" name="I2" />
            <blockpin signalname="XLXN_279" name="O" />
        </block>
        <block symbolname="fd8ce" name="XLXI_114">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_286" name="CE" />
            <blockpin signalname="XLXN_231" name="CLR" />
            <blockpin signalname="DES(7:0)" name="D(7:0)" />
            <blockpin signalname="DATA(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="fde" name="XLXI_148">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_285" name="CE" />
            <blockpin signalname="XLXN_279" name="D" />
            <blockpin signalname="XLXN_286" name="Q" />
        </block>
        <block symbolname="or2" name="XLXI_150">
            <blockpin signalname="XLXN_202" name="I0" />
            <blockpin signalname="XLXN_286" name="I1" />
            <blockpin signalname="XLXN_285" name="O" />
        </block>
        <block symbolname="fd" name="D_Stabilizer">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="D" name="D" />
            <blockpin signalname="XLXN_172" name="Q" />
        </block>
        <block symbolname="fd" name="S_Stabilizer">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="S" name="D" />
            <blockpin signalname="XLXN_173" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="D">
            <wire x2="416" y1="304" y2="304" x1="208" />
        </branch>
        <branch name="S">
            <wire x2="416" y1="784" y2="784" x1="208" />
        </branch>
        <instance x="896" y="560" name="XLXI_89" orien="R0" />
        <instance x="896" y="1040" name="XLXI_90" orien="R0" />
        <branch name="XLXN_172">
            <wire x2="896" y1="304" y2="304" x1="800" />
        </branch>
        <branch name="XLXN_173">
            <wire x2="896" y1="784" y2="784" x1="800" />
        </branch>
        <instance x="1456" y="560" name="XLXI_91" orien="R0" />
        <instance x="1456" y="1040" name="XLXI_92" orien="R0" />
        <branch name="XLXN_200">
            <wire x2="1360" y1="784" y2="784" x1="1280" />
            <wire x2="1456" y1="784" y2="784" x1="1360" />
            <wire x2="1360" y1="640" y2="784" x1="1360" />
            <wire x2="1920" y1="640" y2="640" x1="1360" />
            <wire x2="1920" y1="512" y2="640" x1="1920" />
            <wire x2="2016" y1="512" y2="512" x1="1920" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="2120" y="664">(I0 ^ I1) | (I2 ^ I3)</text>
        <instance x="2576" y="1024" name="XLXI_104" orien="R0" />
        <branch name="XLXN_201">
            <wire x2="1952" y1="784" y2="784" x1="1840" />
            <wire x2="1952" y1="576" y2="784" x1="1952" />
            <wire x2="2016" y1="576" y2="576" x1="1952" />
        </branch>
        <branch name="XLXN_198">
            <wire x2="1920" y1="304" y2="304" x1="1840" />
            <wire x2="1920" y1="304" y2="448" x1="1920" />
            <wire x2="2016" y1="448" y2="448" x1="1920" />
        </branch>
        <branch name="XLXN_199">
            <wire x2="1360" y1="304" y2="304" x1="1280" />
            <wire x2="1456" y1="304" y2="304" x1="1360" />
            <wire x2="1360" y1="160" y2="304" x1="1360" />
            <wire x2="1952" y1="160" y2="160" x1="1360" />
            <wire x2="1952" y1="160" y2="384" x1="1952" />
            <wire x2="2016" y1="384" y2="384" x1="1952" />
            <wire x2="2464" y1="160" y2="160" x1="1952" />
            <wire x2="2464" y1="160" y2="704" x1="2464" />
            <wire x2="2576" y1="704" y2="704" x1="2464" />
        </branch>
        <instance x="2016" y="704" name="XLXI_103" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="176" y="-364" type="instance" />
        </instance>
        <branch name="RDES(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3040" y="768" type="branch" />
            <wire x2="3040" y1="768" y2="768" x1="2960" />
            <wire x2="3040" y1="768" y2="800" x1="3040" />
            <wire x2="3040" y1="800" y2="880" x1="3040" />
            <wire x2="3040" y1="880" y2="960" x1="3040" />
            <wire x2="3040" y1="960" y2="1040" x1="3040" />
            <wire x2="3040" y1="1040" y2="1120" x1="3040" />
            <wire x2="3040" y1="1120" y2="1200" x1="3040" />
            <wire x2="3040" y1="1200" y2="1280" x1="3040" />
            <wire x2="3040" y1="1280" y2="1360" x1="3040" />
        </branch>
        <instance x="3280" y="832" name="XLXI_106" orien="R0" />
        <instance x="3280" y="912" name="XLXI_107" orien="R0" />
        <instance x="3280" y="992" name="XLXI_108" orien="R0" />
        <instance x="3280" y="1072" name="XLXI_109" orien="R0" />
        <instance x="3280" y="1152" name="XLXI_110" orien="R0" />
        <instance x="3280" y="1232" name="XLXI_111" orien="R0" />
        <instance x="3280" y="1312" name="XLXI_112" orien="R0" />
        <instance x="3280" y="1392" name="XLXI_113" orien="R0" />
        <bustap x2="3136" y1="800" y2="800" x1="3040" />
        <branch name="RDES(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="800" type="branch" />
            <wire x2="3200" y1="800" y2="800" x1="3136" />
            <wire x2="3280" y1="800" y2="800" x1="3200" />
        </branch>
        <bustap x2="3136" y1="880" y2="880" x1="3040" />
        <branch name="RDES(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="880" type="branch" />
            <wire x2="3200" y1="880" y2="880" x1="3136" />
            <wire x2="3280" y1="880" y2="880" x1="3200" />
        </branch>
        <bustap x2="3136" y1="960" y2="960" x1="3040" />
        <branch name="RDES(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="960" type="branch" />
            <wire x2="3200" y1="960" y2="960" x1="3136" />
            <wire x2="3280" y1="960" y2="960" x1="3200" />
        </branch>
        <bustap x2="3136" y1="1040" y2="1040" x1="3040" />
        <branch name="RDES(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="1040" type="branch" />
            <wire x2="3200" y1="1040" y2="1040" x1="3136" />
            <wire x2="3280" y1="1040" y2="1040" x1="3200" />
        </branch>
        <bustap x2="3136" y1="1120" y2="1120" x1="3040" />
        <branch name="RDES(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="1120" type="branch" />
            <wire x2="3200" y1="1120" y2="1120" x1="3136" />
            <wire x2="3280" y1="1120" y2="1120" x1="3200" />
        </branch>
        <bustap x2="3136" y1="1200" y2="1200" x1="3040" />
        <branch name="RDES(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="1200" type="branch" />
            <wire x2="3200" y1="1200" y2="1200" x1="3136" />
            <wire x2="3280" y1="1200" y2="1200" x1="3200" />
        </branch>
        <bustap x2="3136" y1="1280" y2="1280" x1="3040" />
        <branch name="RDES(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="1280" type="branch" />
            <wire x2="3200" y1="1280" y2="1280" x1="3136" />
            <wire x2="3280" y1="1280" y2="1280" x1="3200" />
        </branch>
        <bustap x2="3136" y1="1360" y2="1360" x1="3040" />
        <branch name="RDES(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3200" y="1360" type="branch" />
            <wire x2="3200" y1="1360" y2="1360" x1="3136" />
            <wire x2="3280" y1="1360" y2="1360" x1="3200" />
        </branch>
        <bustap x2="3664" y1="1360" y2="1360" x1="3760" />
        <branch name="DES(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="1360" type="branch" />
            <wire x2="3600" y1="1360" y2="1360" x1="3504" />
            <wire x2="3664" y1="1360" y2="1360" x1="3600" />
        </branch>
        <bustap x2="3664" y1="1280" y2="1280" x1="3760" />
        <branch name="DES(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="1280" type="branch" />
            <wire x2="3600" y1="1280" y2="1280" x1="3504" />
            <wire x2="3664" y1="1280" y2="1280" x1="3600" />
        </branch>
        <bustap x2="3664" y1="1200" y2="1200" x1="3760" />
        <branch name="DES(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="1200" type="branch" />
            <wire x2="3600" y1="1200" y2="1200" x1="3504" />
            <wire x2="3664" y1="1200" y2="1200" x1="3600" />
        </branch>
        <bustap x2="3664" y1="1120" y2="1120" x1="3760" />
        <branch name="DES(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="1120" type="branch" />
            <wire x2="3600" y1="1120" y2="1120" x1="3504" />
            <wire x2="3664" y1="1120" y2="1120" x1="3600" />
        </branch>
        <bustap x2="3664" y1="1040" y2="1040" x1="3760" />
        <branch name="DES(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="1040" type="branch" />
            <wire x2="3600" y1="1040" y2="1040" x1="3504" />
            <wire x2="3664" y1="1040" y2="1040" x1="3600" />
        </branch>
        <bustap x2="3664" y1="960" y2="960" x1="3760" />
        <branch name="DES(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="960" type="branch" />
            <wire x2="3600" y1="960" y2="960" x1="3504" />
            <wire x2="3664" y1="960" y2="960" x1="3600" />
        </branch>
        <bustap x2="3664" y1="880" y2="880" x1="3760" />
        <branch name="DES(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="880" type="branch" />
            <wire x2="3600" y1="880" y2="880" x1="3504" />
            <wire x2="3664" y1="880" y2="880" x1="3600" />
        </branch>
        <bustap x2="3664" y1="800" y2="800" x1="3760" />
        <branch name="DES(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3600" y="800" type="branch" />
            <wire x2="3600" y1="800" y2="800" x1="3504" />
            <wire x2="3664" y1="800" y2="800" x1="3600" />
        </branch>
        <branch name="XLXN_231">
            <wire x2="4016" y1="1008" y2="1008" x1="3984" />
            <wire x2="3984" y1="1008" y2="1040" x1="3984" />
        </branch>
        <instance x="3920" y="1168" name="XLXI_115" orien="R0" />
        <instance x="2496" y="2240" name="XLXI_124" orien="R0" />
        <instance x="3296" y="2240" name="XLXI_125" orien="R0" />
        <branch name="XLXN_235">
            <wire x2="3296" y1="2048" y2="2048" x1="3264" />
        </branch>
        <instance x="3008" y="2144" name="XLXI_127" orien="R0" />
        <branch name="XLXN_236">
            <wire x2="4176" y1="2048" y2="2048" x1="4144" />
        </branch>
        <branch name="CLR">
            <wire x2="2368" y1="1120" y2="1120" x1="256" />
            <wire x2="2496" y1="1120" y2="1120" x1="2368" />
            <wire x2="2368" y1="1120" y2="2240" x1="2368" />
            <wire x2="2496" y1="2240" y2="2240" x1="2368" />
            <wire x2="3296" y1="2240" y2="2240" x1="2496" />
            <wire x2="4176" y1="2240" y2="2240" x1="3296" />
            <wire x2="2496" y1="992" y2="1120" x1="2496" />
            <wire x2="2576" y1="992" y2="992" x1="2496" />
            <wire x2="2496" y1="2208" y2="2240" x1="2496" />
            <wire x2="3296" y1="2208" y2="2240" x1="3296" />
            <wire x2="4176" y1="2208" y2="2240" x1="4176" />
        </branch>
        <instance x="2800" y="1728" name="XLXI_133" orien="R180" />
        <instance x="3600" y="1728" name="XLXI_134" orien="R180" />
        <branch name="XLXN_244">
            <wire x2="3280" y1="1760" y2="1984" x1="3280" />
            <wire x2="3296" y1="1984" y2="1984" x1="3280" />
            <wire x2="3376" y1="1760" y2="1760" x1="3280" />
        </branch>
        <instance x="4176" y="2240" name="XLXI_126" orien="R0" />
        <instance x="4480" y="1728" name="XLXI_136" orien="R180" />
        <branch name="XLXN_247">
            <wire x2="4160" y1="1760" y2="1984" x1="4160" />
            <wire x2="4176" y1="1984" y2="1984" x1="4160" />
            <wire x2="4256" y1="1760" y2="1760" x1="4160" />
        </branch>
        <instance x="3888" y="2176" name="XLXI_137" orien="R0" />
        <branch name="XLXN_253">
            <wire x2="2480" y1="1760" y2="1984" x1="2480" />
            <wire x2="2496" y1="1984" y2="1984" x1="2480" />
            <wire x2="2576" y1="1760" y2="1760" x1="2480" />
        </branch>
        <branch name="XLXN_269">
            <wire x2="3696" y1="1760" y2="1760" x1="3600" />
            <wire x2="3696" y1="1760" y2="1984" x1="3696" />
            <wire x2="3696" y1="1984" y2="2048" x1="3696" />
            <wire x2="3888" y1="2048" y2="2048" x1="3696" />
            <wire x2="3696" y1="1984" y2="1984" x1="3680" />
            <wire x2="4720" y1="1664" y2="1664" x1="3696" />
            <wire x2="3696" y1="1664" y2="1760" x1="3696" />
        </branch>
        <branch name="XLXN_246">
            <wire x2="4576" y1="1760" y2="1760" x1="4480" />
            <wire x2="4576" y1="1760" y2="1984" x1="4576" />
            <wire x2="4576" y1="1984" y2="1984" x1="4560" />
            <wire x2="4576" y1="1728" y2="1760" x1="4576" />
            <wire x2="4720" y1="1728" y2="1728" x1="4576" />
        </branch>
        <branch name="XLXN_275">
            <wire x2="2896" y1="1760" y2="1760" x1="2800" />
            <wire x2="2896" y1="1760" y2="1984" x1="2896" />
            <wire x2="2896" y1="1984" y2="2016" x1="2896" />
            <wire x2="3008" y1="2016" y2="2016" x1="2896" />
            <wire x2="2896" y1="1984" y2="1984" x1="2880" />
            <wire x2="2896" y1="1600" y2="1760" x1="2896" />
            <wire x2="3728" y1="1600" y2="1600" x1="2896" />
            <wire x2="3728" y1="1600" y2="1984" x1="3728" />
            <wire x2="3888" y1="1984" y2="1984" x1="3728" />
            <wire x2="4720" y1="1600" y2="1600" x1="3728" />
        </branch>
        <instance x="4720" y="1792" name="XLXI_146" orien="R0" />
        <branch name="XLXN_279">
            <wire x2="5456" y1="1664" y2="1664" x1="4976" />
        </branch>
        <branch name="DES(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3840" y="784" type="branch" />
            <wire x2="3760" y1="784" y2="800" x1="3760" />
            <wire x2="3760" y1="800" y2="880" x1="3760" />
            <wire x2="3760" y1="880" y2="960" x1="3760" />
            <wire x2="3760" y1="960" y2="1040" x1="3760" />
            <wire x2="3760" y1="1040" y2="1120" x1="3760" />
            <wire x2="3760" y1="1120" y2="1200" x1="3760" />
            <wire x2="3760" y1="1200" y2="1280" x1="3760" />
            <wire x2="3760" y1="1280" y2="1360" x1="3760" />
            <wire x2="3840" y1="784" y2="784" x1="3760" />
            <wire x2="4016" y1="784" y2="784" x1="3840" />
        </branch>
        <instance x="4016" y="1040" name="XLXI_114" orien="R0" />
        <branch name="DATA(7:0)">
            <wire x2="4480" y1="784" y2="784" x1="4400" />
        </branch>
        <branch name="CLK">
            <wire x2="384" y1="1008" y2="1008" x1="256" />
            <wire x2="864" y1="1008" y2="1008" x1="384" />
            <wire x2="1424" y1="1008" y2="1008" x1="864" />
            <wire x2="2400" y1="1008" y2="1008" x1="1424" />
            <wire x2="2464" y1="1008" y2="1008" x1="2400" />
            <wire x2="2464" y1="1008" y2="1440" x1="2464" />
            <wire x2="3840" y1="1440" y2="1440" x1="2464" />
            <wire x2="2400" y1="1008" y2="2272" x1="2400" />
            <wire x2="2464" y1="2272" y2="2272" x1="2400" />
            <wire x2="3264" y1="2272" y2="2272" x1="2464" />
            <wire x2="4144" y1="2272" y2="2272" x1="3264" />
            <wire x2="5424" y1="2272" y2="2272" x1="4144" />
            <wire x2="416" y1="432" y2="432" x1="384" />
            <wire x2="384" y1="432" y2="528" x1="384" />
            <wire x2="864" y1="528" y2="528" x1="384" />
            <wire x2="1424" y1="528" y2="528" x1="864" />
            <wire x2="384" y1="528" y2="912" x1="384" />
            <wire x2="416" y1="912" y2="912" x1="384" />
            <wire x2="384" y1="912" y2="1008" x1="384" />
            <wire x2="896" y1="432" y2="432" x1="864" />
            <wire x2="864" y1="432" y2="528" x1="864" />
            <wire x2="896" y1="912" y2="912" x1="864" />
            <wire x2="864" y1="912" y2="1008" x1="864" />
            <wire x2="1456" y1="432" y2="432" x1="1424" />
            <wire x2="1424" y1="432" y2="528" x1="1424" />
            <wire x2="1456" y1="912" y2="912" x1="1424" />
            <wire x2="1424" y1="912" y2="1008" x1="1424" />
            <wire x2="2576" y1="896" y2="896" x1="2464" />
            <wire x2="2464" y1="896" y2="1008" x1="2464" />
            <wire x2="2496" y1="2112" y2="2112" x1="2464" />
            <wire x2="2464" y1="2112" y2="2272" x1="2464" />
            <wire x2="3296" y1="2112" y2="2112" x1="3264" />
            <wire x2="3264" y1="2112" y2="2272" x1="3264" />
            <wire x2="4016" y1="912" y2="912" x1="3840" />
            <wire x2="3840" y1="912" y2="1440" x1="3840" />
            <wire x2="4176" y1="2112" y2="2112" x1="4144" />
            <wire x2="4144" y1="2112" y2="2272" x1="4144" />
            <wire x2="5424" y1="1792" y2="2272" x1="5424" />
            <wire x2="5456" y1="1792" y2="1792" x1="5424" />
        </branch>
        <instance x="5456" y="1920" name="XLXI_148" orien="R0" />
        <branch name="XLXN_202">
            <wire x2="2432" y1="512" y2="512" x1="2400" />
            <wire x2="2432" y1="512" y2="832" x1="2432" />
            <wire x2="2576" y1="832" y2="832" x1="2432" />
            <wire x2="2432" y1="832" y2="2048" x1="2432" />
            <wire x2="2496" y1="2048" y2="2048" x1="2432" />
            <wire x2="2432" y1="2048" y2="2304" x1="2432" />
            <wire x2="2896" y1="2304" y2="2304" x1="2432" />
            <wire x2="3728" y1="2304" y2="2304" x1="2896" />
            <wire x2="5040" y1="2304" y2="2304" x1="3728" />
            <wire x2="3008" y1="2080" y2="2080" x1="2896" />
            <wire x2="2896" y1="2080" y2="2304" x1="2896" />
            <wire x2="3888" y1="2112" y2="2112" x1="3728" />
            <wire x2="3728" y1="2112" y2="2304" x1="3728" />
            <wire x2="5040" y1="1824" y2="2304" x1="5040" />
            <wire x2="5088" y1="1824" y2="1824" x1="5040" />
        </branch>
        <instance x="5088" y="1888" name="XLXI_150" orien="R0" />
        <branch name="XLXN_285">
            <wire x2="5392" y1="1792" y2="1792" x1="5344" />
            <wire x2="5456" y1="1728" y2="1728" x1="5392" />
            <wire x2="5392" y1="1728" y2="1792" x1="5392" />
        </branch>
        <branch name="XLXN_286">
            <wire x2="4016" y1="848" y2="848" x1="3872" />
            <wire x2="3872" y1="848" y2="1440" x1="3872" />
            <wire x2="5024" y1="1440" y2="1440" x1="3872" />
            <wire x2="5040" y1="1440" y2="1440" x1="5024" />
            <wire x2="5920" y1="1440" y2="1440" x1="5040" />
            <wire x2="5920" y1="1440" y2="1664" x1="5920" />
            <wire x2="5040" y1="1440" y2="1760" x1="5040" />
            <wire x2="5088" y1="1760" y2="1760" x1="5040" />
            <wire x2="5920" y1="1664" y2="1664" x1="5840" />
        </branch>
        <instance x="416" y="560" name="D_Stabilizer" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="112" y="-416" type="instance" />
        </instance>
        <instance x="416" y="1040" name="S_Stabilizer" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="112" y="-416" type="instance" />
        </instance>
        <iomarker fontsize="28" x="208" y="304" name="D" orien="R180" />
        <iomarker fontsize="28" x="208" y="784" name="S" orien="R180" />
        <iomarker fontsize="28" x="256" y="1008" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="256" y="1120" name="CLR" orien="R180" />
        <iomarker fontsize="28" x="4480" y="784" name="DATA(7:0)" orien="R0" />
    </sheet>
</drawing>