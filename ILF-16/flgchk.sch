<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_42" />
        <signal name="IDX(3:0)" />
        <signal name="IDX(3)" />
        <signal name="IDX(2)" />
        <signal name="IDX(1)" />
        <signal name="IDX(0)" />
        <signal name="FLG(15:0)" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="FLG(0)" />
        <signal name="FLG(1)" />
        <signal name="FLG(2)" />
        <signal name="FLG(3)" />
        <signal name="FLG(4)" />
        <signal name="FLG(5)" />
        <signal name="FLG(6)" />
        <signal name="FLG(7)" />
        <signal name="FLG(8)" />
        <signal name="FLG(9)" />
        <signal name="FLG(10)" />
        <signal name="FLG(11)" />
        <signal name="FLG(12)" />
        <signal name="FLG(13)" />
        <signal name="FLG(14)" />
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_75" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="E" />
        <signal name="FSTATE" />
        <signal name="FLG(15)" />
        <port polarity="Input" name="IDX(3:0)" />
        <port polarity="Input" name="FLG(15:0)" />
        <port polarity="Input" name="E" />
        <port polarity="Output" name="FSTATE" />
        <blockdef name="d4_16e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-1152" height="1088" />
            <line x2="320" y1="-1088" y2="-1088" x1="384" />
            <line x2="320" y1="-1024" y2="-1024" x1="384" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-1024" y2="-1024" x1="0" />
            <line x2="64" y1="-1088" y2="-1088" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
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
        <blockdef name="or16">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-448" y2="-448" x1="0" />
            <line x2="48" y1="-592" y2="-1024" x1="48" />
            <arc ex="112" ey="-592" sx="192" sy="-544" r="88" cx="116" cy="-504" />
            <line x2="48" y1="-496" y2="-496" x1="112" />
            <arc ex="192" ey="-544" sx="112" sy="-496" r="88" cx="116" cy="-584" />
            <line x2="48" y1="-592" y2="-592" x1="112" />
            <arc ex="48" ey="-592" sx="48" sy="-496" r="56" cx="16" cy="-544" />
            <line x2="48" y1="-64" y2="-496" x1="48" />
            <line x2="192" y1="-544" y2="-544" x1="256" />
            <line x2="48" y1="-640" y2="-640" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="48" y1="-384" y2="-384" x1="0" />
            <line x2="48" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-1024" y2="-1024" x1="0" />
            <line x2="48" y1="-960" y2="-960" x1="0" />
            <line x2="48" y1="-896" y2="-896" x1="0" />
            <line x2="48" y1="-832" y2="-832" x1="0" />
            <line x2="48" y1="-768" y2="-768" x1="0" />
            <line x2="48" y1="-704" y2="-704" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <block symbolname="d4_16e" name="XLXI_1">
            <blockpin signalname="IDX(0)" name="A0" />
            <blockpin signalname="IDX(1)" name="A1" />
            <blockpin signalname="IDX(2)" name="A2" />
            <blockpin signalname="IDX(3)" name="A3" />
            <blockpin signalname="E" name="E" />
            <blockpin signalname="XLXN_26" name="D0" />
            <blockpin signalname="XLXN_27" name="D1" />
            <blockpin signalname="XLXN_37" name="D10" />
            <blockpin signalname="XLXN_38" name="D11" />
            <blockpin signalname="XLXN_39" name="D12" />
            <blockpin signalname="XLXN_40" name="D13" />
            <blockpin signalname="XLXN_41" name="D14" />
            <blockpin signalname="XLXN_42" name="D15" />
            <blockpin signalname="XLXN_28" name="D2" />
            <blockpin signalname="XLXN_30" name="D3" />
            <blockpin signalname="XLXN_31" name="D4" />
            <blockpin signalname="XLXN_32" name="D5" />
            <blockpin signalname="XLXN_33" name="D6" />
            <blockpin signalname="XLXN_34" name="D7" />
            <blockpin signalname="XLXN_35" name="D8" />
            <blockpin signalname="XLXN_36" name="D9" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="FLG(0)" name="I0" />
            <blockpin signalname="XLXN_26" name="I1" />
            <blockpin signalname="XLXN_64" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="FLG(1)" name="I0" />
            <blockpin signalname="XLXN_27" name="I1" />
            <blockpin signalname="XLXN_65" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="FLG(2)" name="I0" />
            <blockpin signalname="XLXN_28" name="I1" />
            <blockpin signalname="XLXN_66" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_10">
            <blockpin signalname="FLG(3)" name="I0" />
            <blockpin signalname="XLXN_30" name="I1" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_11">
            <blockpin signalname="FLG(4)" name="I0" />
            <blockpin signalname="XLXN_31" name="I1" />
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="FLG(5)" name="I0" />
            <blockpin signalname="XLXN_32" name="I1" />
            <blockpin signalname="XLXN_69" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_13">
            <blockpin signalname="FLG(6)" name="I0" />
            <blockpin signalname="XLXN_33" name="I1" />
            <blockpin signalname="XLXN_70" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="FLG(7)" name="I0" />
            <blockpin signalname="XLXN_34" name="I1" />
            <blockpin signalname="XLXN_71" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_15">
            <blockpin signalname="FLG(8)" name="I0" />
            <blockpin signalname="XLXN_35" name="I1" />
            <blockpin signalname="XLXN_72" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_16">
            <blockpin signalname="FLG(9)" name="I0" />
            <blockpin signalname="XLXN_36" name="I1" />
            <blockpin signalname="XLXN_73" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_17">
            <blockpin signalname="FLG(10)" name="I0" />
            <blockpin signalname="XLXN_37" name="I1" />
            <blockpin signalname="XLXN_75" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_18">
            <blockpin signalname="FLG(11)" name="I0" />
            <blockpin signalname="XLXN_38" name="I1" />
            <blockpin signalname="XLXN_77" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_19">
            <blockpin signalname="FLG(12)" name="I0" />
            <blockpin signalname="XLXN_39" name="I1" />
            <blockpin signalname="XLXN_78" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_20">
            <blockpin signalname="FLG(13)" name="I0" />
            <blockpin signalname="XLXN_40" name="I1" />
            <blockpin signalname="XLXN_79" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_21">
            <blockpin signalname="FLG(14)" name="I0" />
            <blockpin signalname="XLXN_41" name="I1" />
            <blockpin signalname="XLXN_80" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_22">
            <blockpin signalname="FLG(15)" name="I0" />
            <blockpin signalname="XLXN_42" name="I1" />
            <blockpin signalname="XLXN_81" name="O" />
        </block>
        <block symbolname="or16" name="XLXI_38">
            <blockpin signalname="XLXN_81" name="I0" />
            <blockpin signalname="XLXN_80" name="I1" />
            <blockpin signalname="XLXN_69" name="I10" />
            <blockpin signalname="XLXN_68" name="I11" />
            <blockpin signalname="XLXN_67" name="I12" />
            <blockpin signalname="XLXN_66" name="I13" />
            <blockpin signalname="XLXN_65" name="I14" />
            <blockpin signalname="XLXN_64" name="I15" />
            <blockpin signalname="XLXN_79" name="I2" />
            <blockpin signalname="XLXN_78" name="I3" />
            <blockpin signalname="XLXN_77" name="I4" />
            <blockpin signalname="XLXN_75" name="I5" />
            <blockpin signalname="XLXN_73" name="I6" />
            <blockpin signalname="XLXN_72" name="I7" />
            <blockpin signalname="XLXN_71" name="I8" />
            <blockpin signalname="XLXN_70" name="I9" />
            <blockpin signalname="FSTATE" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <bustap x2="400" y1="240" y2="336" x1="400" />
        <bustap x2="448" y1="240" y2="336" x1="448" />
        <bustap x2="496" y1="240" y2="336" x1="496" />
        <bustap x2="544" y1="240" y2="336" x1="544" />
        <branch name="IDX(3:0)">
            <wire x2="384" y1="240" y2="240" x1="304" />
            <wire x2="400" y1="240" y2="240" x1="384" />
            <wire x2="448" y1="240" y2="240" x1="400" />
            <wire x2="496" y1="240" y2="240" x1="448" />
            <wire x2="544" y1="240" y2="240" x1="496" />
        </branch>
        <branch name="IDX(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="400" y="368" type="branch" />
            <wire x2="400" y1="336" y2="368" x1="400" />
            <wire x2="400" y1="368" y2="656" x1="400" />
            <wire x2="656" y1="656" y2="656" x1="400" />
        </branch>
        <branch name="IDX(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="448" y="368" type="branch" />
            <wire x2="448" y1="336" y2="368" x1="448" />
            <wire x2="448" y1="368" y2="592" x1="448" />
            <wire x2="656" y1="592" y2="592" x1="448" />
        </branch>
        <branch name="IDX(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="496" y="368" type="branch" />
            <wire x2="496" y1="336" y2="368" x1="496" />
            <wire x2="496" y1="368" y2="528" x1="496" />
            <wire x2="656" y1="528" y2="528" x1="496" />
        </branch>
        <branch name="IDX(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="544" y="368" type="branch" />
            <wire x2="544" y1="336" y2="368" x1="544" />
            <wire x2="544" y1="368" y2="464" x1="544" />
            <wire x2="656" y1="464" y2="464" x1="544" />
        </branch>
        <instance x="656" y="1552" name="XLXI_1" orien="R0" />
        <branch name="FLG(15:0)">
            <wire x2="1600" y1="160" y2="160" x1="320" />
            <wire x2="1600" y1="160" y2="512" x1="1600" />
            <wire x2="1600" y1="512" y2="528" x1="1600" />
            <wire x2="1600" y1="528" y2="672" x1="1600" />
            <wire x2="1600" y1="672" y2="832" x1="1600" />
            <wire x2="1600" y1="832" y2="992" x1="1600" />
            <wire x2="1600" y1="992" y2="1152" x1="1600" />
            <wire x2="1600" y1="1152" y2="1312" x1="1600" />
            <wire x2="1600" y1="1312" y2="1472" x1="1600" />
            <wire x2="1600" y1="1472" y2="1632" x1="1600" />
            <wire x2="1600" y1="1632" y2="1792" x1="1600" />
            <wire x2="1600" y1="1792" y2="1952" x1="1600" />
            <wire x2="1600" y1="1952" y2="2112" x1="1600" />
            <wire x2="1600" y1="2112" y2="2272" x1="1600" />
            <wire x2="1600" y1="2272" y2="2432" x1="1600" />
            <wire x2="1600" y1="2432" y2="2592" x1="1600" />
            <wire x2="1600" y1="2592" y2="2752" x1="1600" />
            <wire x2="1600" y1="2752" y2="2912" x1="1600" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="1840" y1="464" y2="464" x1="1040" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1520" y1="528" y2="528" x1="1040" />
            <wire x2="1520" y1="528" y2="608" x1="1520" />
            <wire x2="1840" y1="608" y2="608" x1="1520" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="1488" y1="592" y2="592" x1="1040" />
            <wire x2="1488" y1="592" y2="768" x1="1488" />
            <wire x2="1840" y1="768" y2="768" x1="1488" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1456" y1="656" y2="656" x1="1040" />
            <wire x2="1456" y1="656" y2="928" x1="1456" />
            <wire x2="1840" y1="928" y2="928" x1="1456" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="1424" y1="720" y2="720" x1="1040" />
            <wire x2="1424" y1="720" y2="1088" x1="1424" />
            <wire x2="1840" y1="1088" y2="1088" x1="1424" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="1392" y1="784" y2="784" x1="1040" />
            <wire x2="1392" y1="784" y2="1248" x1="1392" />
            <wire x2="1840" y1="1248" y2="1248" x1="1392" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1360" y1="848" y2="848" x1="1040" />
            <wire x2="1360" y1="848" y2="1408" x1="1360" />
            <wire x2="1840" y1="1408" y2="1408" x1="1360" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="1328" y1="912" y2="912" x1="1040" />
            <wire x2="1328" y1="912" y2="1568" x1="1328" />
            <wire x2="1840" y1="1568" y2="1568" x1="1328" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="1296" y1="976" y2="976" x1="1040" />
            <wire x2="1296" y1="976" y2="1728" x1="1296" />
            <wire x2="1840" y1="1728" y2="1728" x1="1296" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="1264" y1="1040" y2="1040" x1="1040" />
            <wire x2="1264" y1="1040" y2="1888" x1="1264" />
            <wire x2="1840" y1="1888" y2="1888" x1="1264" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="1232" y1="1104" y2="1104" x1="1040" />
            <wire x2="1232" y1="1104" y2="2048" x1="1232" />
            <wire x2="1840" y1="2048" y2="2048" x1="1232" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="1200" y1="1168" y2="1168" x1="1040" />
            <wire x2="1200" y1="1168" y2="2208" x1="1200" />
            <wire x2="1840" y1="2208" y2="2208" x1="1200" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="1168" y1="1232" y2="1232" x1="1040" />
            <wire x2="1168" y1="1232" y2="2368" x1="1168" />
            <wire x2="1840" y1="2368" y2="2368" x1="1168" />
        </branch>
        <branch name="XLXN_40">
            <wire x2="1136" y1="1296" y2="1296" x1="1040" />
            <wire x2="1136" y1="1296" y2="2528" x1="1136" />
            <wire x2="1840" y1="2528" y2="2528" x1="1136" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="1104" y1="1360" y2="1360" x1="1040" />
            <wire x2="1104" y1="1360" y2="2688" x1="1104" />
            <wire x2="1840" y1="2688" y2="2688" x1="1104" />
        </branch>
        <instance x="1840" y="592" name="XLXI_5" orien="R0" />
        <instance x="1840" y="736" name="XLXI_6" orien="R0" />
        <instance x="1840" y="896" name="XLXI_9" orien="R0" />
        <instance x="1840" y="1056" name="XLXI_10" orien="R0" />
        <instance x="1840" y="1216" name="XLXI_11" orien="R0" />
        <instance x="1840" y="1376" name="XLXI_12" orien="R0" />
        <instance x="1840" y="1536" name="XLXI_13" orien="R0" />
        <instance x="1840" y="1696" name="XLXI_14" orien="R0" />
        <instance x="1840" y="1856" name="XLXI_15" orien="R0" />
        <instance x="1840" y="2016" name="XLXI_16" orien="R0" />
        <instance x="1840" y="2176" name="XLXI_17" orien="R0" />
        <instance x="1840" y="2336" name="XLXI_18" orien="R0" />
        <instance x="1840" y="2496" name="XLXI_19" orien="R0" />
        <instance x="1840" y="2656" name="XLXI_20" orien="R0" />
        <instance x="1840" y="2816" name="XLXI_21" orien="R0" />
        <instance x="1840" y="2976" name="XLXI_22" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="1072" y1="1424" y2="1424" x1="1040" />
            <wire x2="1072" y1="1424" y2="2848" x1="1072" />
            <wire x2="1840" y1="2848" y2="2848" x1="1072" />
        </branch>
        <bustap x2="1696" y1="528" y2="528" x1="1600" />
        <branch name="FLG(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="528" type="branch" />
            <wire x2="1760" y1="528" y2="528" x1="1696" />
            <wire x2="1840" y1="528" y2="528" x1="1760" />
        </branch>
        <bustap x2="1696" y1="672" y2="672" x1="1600" />
        <branch name="FLG(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="672" type="branch" />
            <wire x2="1760" y1="672" y2="672" x1="1696" />
            <wire x2="1840" y1="672" y2="672" x1="1760" />
        </branch>
        <bustap x2="1696" y1="832" y2="832" x1="1600" />
        <branch name="FLG(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="832" type="branch" />
            <wire x2="1760" y1="832" y2="832" x1="1696" />
            <wire x2="1840" y1="832" y2="832" x1="1760" />
        </branch>
        <bustap x2="1696" y1="992" y2="992" x1="1600" />
        <branch name="FLG(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="992" type="branch" />
            <wire x2="1760" y1="992" y2="992" x1="1696" />
            <wire x2="1840" y1="992" y2="992" x1="1760" />
        </branch>
        <bustap x2="1696" y1="1152" y2="1152" x1="1600" />
        <branch name="FLG(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1152" type="branch" />
            <wire x2="1760" y1="1152" y2="1152" x1="1696" />
            <wire x2="1840" y1="1152" y2="1152" x1="1760" />
        </branch>
        <bustap x2="1696" y1="1312" y2="1312" x1="1600" />
        <branch name="FLG(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1312" type="branch" />
            <wire x2="1760" y1="1312" y2="1312" x1="1696" />
            <wire x2="1840" y1="1312" y2="1312" x1="1760" />
        </branch>
        <bustap x2="1696" y1="1472" y2="1472" x1="1600" />
        <branch name="FLG(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1472" type="branch" />
            <wire x2="1760" y1="1472" y2="1472" x1="1696" />
            <wire x2="1840" y1="1472" y2="1472" x1="1760" />
        </branch>
        <bustap x2="1696" y1="1632" y2="1632" x1="1600" />
        <branch name="FLG(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1632" type="branch" />
            <wire x2="1760" y1="1632" y2="1632" x1="1696" />
            <wire x2="1840" y1="1632" y2="1632" x1="1760" />
        </branch>
        <bustap x2="1696" y1="1792" y2="1792" x1="1600" />
        <branch name="FLG(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1792" type="branch" />
            <wire x2="1760" y1="1792" y2="1792" x1="1696" />
            <wire x2="1840" y1="1792" y2="1792" x1="1760" />
        </branch>
        <bustap x2="1696" y1="1952" y2="1952" x1="1600" />
        <branch name="FLG(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="1952" type="branch" />
            <wire x2="1760" y1="1952" y2="1952" x1="1696" />
            <wire x2="1840" y1="1952" y2="1952" x1="1760" />
        </branch>
        <bustap x2="1696" y1="2112" y2="2112" x1="1600" />
        <branch name="FLG(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2112" type="branch" />
            <wire x2="1760" y1="2112" y2="2112" x1="1696" />
            <wire x2="1840" y1="2112" y2="2112" x1="1760" />
        </branch>
        <bustap x2="1696" y1="2272" y2="2272" x1="1600" />
        <branch name="FLG(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2272" type="branch" />
            <wire x2="1760" y1="2272" y2="2272" x1="1696" />
            <wire x2="1840" y1="2272" y2="2272" x1="1760" />
        </branch>
        <bustap x2="1696" y1="2432" y2="2432" x1="1600" />
        <branch name="FLG(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2432" type="branch" />
            <wire x2="1760" y1="2432" y2="2432" x1="1696" />
            <wire x2="1840" y1="2432" y2="2432" x1="1760" />
        </branch>
        <bustap x2="1696" y1="2592" y2="2592" x1="1600" />
        <branch name="FLG(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2592" type="branch" />
            <wire x2="1760" y1="2592" y2="2592" x1="1696" />
            <wire x2="1840" y1="2592" y2="2592" x1="1760" />
        </branch>
        <branch name="FLG(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2752" type="branch" />
            <wire x2="1760" y1="2752" y2="2752" x1="1696" />
            <wire x2="1840" y1="2752" y2="2752" x1="1760" />
        </branch>
        <instance x="2640" y="1520" name="XLXI_38" orien="R0" />
        <branch name="XLXN_64">
            <wire x2="2640" y1="496" y2="496" x1="2096" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2128" y1="640" y2="640" x1="2096" />
            <wire x2="2128" y1="560" y2="640" x1="2128" />
            <wire x2="2640" y1="560" y2="560" x1="2128" />
        </branch>
        <branch name="XLXN_66">
            <wire x2="2160" y1="800" y2="800" x1="2096" />
            <wire x2="2160" y1="624" y2="800" x1="2160" />
            <wire x2="2640" y1="624" y2="624" x1="2160" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="2192" y1="960" y2="960" x1="2096" />
            <wire x2="2192" y1="688" y2="960" x1="2192" />
            <wire x2="2640" y1="688" y2="688" x1="2192" />
        </branch>
        <branch name="XLXN_68">
            <wire x2="2224" y1="1120" y2="1120" x1="2096" />
            <wire x2="2224" y1="752" y2="1120" x1="2224" />
            <wire x2="2640" y1="752" y2="752" x1="2224" />
        </branch>
        <branch name="XLXN_69">
            <wire x2="2256" y1="1280" y2="1280" x1="2096" />
            <wire x2="2256" y1="816" y2="1280" x1="2256" />
            <wire x2="2640" y1="816" y2="816" x1="2256" />
        </branch>
        <branch name="XLXN_70">
            <wire x2="2288" y1="1440" y2="1440" x1="2096" />
            <wire x2="2288" y1="880" y2="1440" x1="2288" />
            <wire x2="2640" y1="880" y2="880" x1="2288" />
        </branch>
        <branch name="XLXN_71">
            <wire x2="2320" y1="1600" y2="1600" x1="2096" />
            <wire x2="2320" y1="944" y2="1600" x1="2320" />
            <wire x2="2640" y1="944" y2="944" x1="2320" />
        </branch>
        <branch name="XLXN_72">
            <wire x2="2352" y1="1760" y2="1760" x1="2096" />
            <wire x2="2352" y1="1008" y2="1760" x1="2352" />
            <wire x2="2640" y1="1008" y2="1008" x1="2352" />
        </branch>
        <branch name="XLXN_73">
            <wire x2="2384" y1="1920" y2="1920" x1="2096" />
            <wire x2="2384" y1="1072" y2="1920" x1="2384" />
            <wire x2="2640" y1="1072" y2="1072" x1="2384" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="2416" y1="2080" y2="2080" x1="2096" />
            <wire x2="2416" y1="1136" y2="2080" x1="2416" />
            <wire x2="2640" y1="1136" y2="1136" x1="2416" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="2448" y1="2240" y2="2240" x1="2096" />
            <wire x2="2448" y1="1200" y2="2240" x1="2448" />
            <wire x2="2640" y1="1200" y2="1200" x1="2448" />
        </branch>
        <branch name="XLXN_78">
            <wire x2="2480" y1="2400" y2="2400" x1="2096" />
            <wire x2="2640" y1="1264" y2="1264" x1="2480" />
            <wire x2="2480" y1="1264" y2="2400" x1="2480" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="2512" y1="2560" y2="2560" x1="2096" />
            <wire x2="2512" y1="1328" y2="2560" x1="2512" />
            <wire x2="2640" y1="1328" y2="1328" x1="2512" />
        </branch>
        <branch name="XLXN_80">
            <wire x2="2544" y1="2720" y2="2720" x1="2096" />
            <wire x2="2544" y1="1392" y2="2720" x1="2544" />
            <wire x2="2640" y1="1392" y2="1392" x1="2544" />
        </branch>
        <branch name="XLXN_81">
            <wire x2="2576" y1="2880" y2="2880" x1="2096" />
            <wire x2="2576" y1="1456" y2="2880" x1="2576" />
            <wire x2="2640" y1="1456" y2="1456" x1="2576" />
        </branch>
        <branch name="E">
            <wire x2="640" y1="1424" y2="1424" x1="208" />
            <wire x2="656" y1="1424" y2="1424" x1="640" />
        </branch>
        <iomarker fontsize="28" x="208" y="1424" name="E" orien="R180" />
        <branch name="FSTATE">
            <wire x2="2912" y1="976" y2="976" x1="2896" />
            <wire x2="2960" y1="976" y2="976" x1="2912" />
        </branch>
        <iomarker fontsize="28" x="2960" y="976" name="FSTATE" orien="R0" />
        <iomarker fontsize="28" x="320" y="160" name="FLG(15:0)" orien="R180" />
        <iomarker fontsize="28" x="304" y="240" name="IDX(3:0)" orien="R180" />
        <bustap x2="1696" y1="2752" y2="2752" x1="1600" />
        <bustap x2="1696" y1="2912" y2="2912" x1="1600" />
        <branch name="FLG(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1760" y="2912" type="branch" />
            <wire x2="1760" y1="2912" y2="2912" x1="1696" />
            <wire x2="1840" y1="2912" y2="2912" x1="1760" />
        </branch>
    </sheet>
</drawing>