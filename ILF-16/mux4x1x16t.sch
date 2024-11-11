<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="D0(15:0)" />
        <signal name="D1(15:0)" />
        <signal name="D2(15:0)" />
        <signal name="D3(15:0)" />
        <signal name="S1" />
        <signal name="S0" />
        <signal name="O(15:0)" />
        <signal name="D0(0)" />
        <signal name="D1(0)" />
        <signal name="D2(0)" />
        <signal name="D3(0)" />
        <signal name="D0(1)" />
        <signal name="D1(1)" />
        <signal name="D2(1)" />
        <signal name="D3(1)" />
        <signal name="D0(2)" />
        <signal name="D1(2)" />
        <signal name="D2(2)" />
        <signal name="D3(2)" />
        <signal name="D0(3)" />
        <signal name="D1(3)" />
        <signal name="D2(3)" />
        <signal name="D3(3)" />
        <signal name="D0(4)" />
        <signal name="D1(4)" />
        <signal name="D2(4)" />
        <signal name="D3(4)" />
        <signal name="D0(5)" />
        <signal name="D1(5)" />
        <signal name="D2(5)" />
        <signal name="D3(5)" />
        <signal name="D0(6)" />
        <signal name="D1(6)" />
        <signal name="D2(6)" />
        <signal name="D3(6)" />
        <signal name="D0(7)" />
        <signal name="D1(7)" />
        <signal name="D2(7)" />
        <signal name="D3(7)" />
        <signal name="D0(8)" />
        <signal name="D1(8)" />
        <signal name="D2(8)" />
        <signal name="D3(8)" />
        <signal name="D0(9)" />
        <signal name="D1(9)" />
        <signal name="D2(9)" />
        <signal name="D3(9)" />
        <signal name="D0(10)" />
        <signal name="D1(10)" />
        <signal name="D2(10)" />
        <signal name="D3(10)" />
        <signal name="D0(11)" />
        <signal name="D1(11)" />
        <signal name="D2(11)" />
        <signal name="D3(11)" />
        <signal name="D0(12)" />
        <signal name="D1(12)" />
        <signal name="D2(12)" />
        <signal name="D3(12)" />
        <signal name="D0(13)" />
        <signal name="D1(13)" />
        <signal name="D2(13)" />
        <signal name="D3(13)" />
        <signal name="D0(14)" />
        <signal name="D1(14)" />
        <signal name="D2(14)" />
        <signal name="D3(14)" />
        <signal name="D0(15)" />
        <signal name="D1(15)" />
        <signal name="D2(15)" />
        <signal name="D3(15)" />
        <signal name="O(0)" />
        <signal name="O(1)" />
        <signal name="O(2)" />
        <signal name="O(3)" />
        <signal name="O(4)" />
        <signal name="O(5)" />
        <signal name="O(6)" />
        <signal name="O(7)" />
        <signal name="O(8)" />
        <signal name="O(9)" />
        <signal name="O(10)" />
        <signal name="O(11)" />
        <signal name="O(12)" />
        <signal name="O(13)" />
        <signal name="O(14)" />
        <signal name="O(15)" />
        <port polarity="Input" name="D0(15:0)" />
        <port polarity="Input" name="D1(15:0)" />
        <port polarity="Input" name="D2(15:0)" />
        <port polarity="Input" name="D3(15:0)" />
        <port polarity="Input" name="S1" />
        <port polarity="Input" name="S0" />
        <port polarity="Output" name="O(15:0)" />
        <blockdef name="lut6">
            <timestamp>2005-6-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-144" y2="-144" x1="0" />
            <line x2="64" y1="-208" y2="-208" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="64" y1="-304" y2="-304" x1="0" />
        </blockdef>
        <block symbolname="lut6" name="XLXI_1">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(0)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(0)" name="I2" />
            <blockpin signalname="D2(0)" name="I3" />
            <blockpin signalname="D0(0)" name="I5" />
            <blockpin signalname="D1(0)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_33">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(1)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(1)" name="I2" />
            <blockpin signalname="D2(1)" name="I3" />
            <blockpin signalname="D0(1)" name="I5" />
            <blockpin signalname="D1(1)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_34">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(2)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(2)" name="I2" />
            <blockpin signalname="D2(2)" name="I3" />
            <blockpin signalname="D0(2)" name="I5" />
            <blockpin signalname="D1(2)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_35">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(3)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(3)" name="I2" />
            <blockpin signalname="D2(3)" name="I3" />
            <blockpin signalname="D0(3)" name="I5" />
            <blockpin signalname="D1(3)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_36">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(4)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(4)" name="I2" />
            <blockpin signalname="D2(4)" name="I3" />
            <blockpin signalname="D0(4)" name="I5" />
            <blockpin signalname="D1(4)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_37">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(5)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(5)" name="I2" />
            <blockpin signalname="D2(5)" name="I3" />
            <blockpin signalname="D0(5)" name="I5" />
            <blockpin signalname="D1(5)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_38">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(6)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(6)" name="I2" />
            <blockpin signalname="D2(6)" name="I3" />
            <blockpin signalname="D0(6)" name="I5" />
            <blockpin signalname="D1(6)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_39">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(7)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(7)" name="I2" />
            <blockpin signalname="D2(7)" name="I3" />
            <blockpin signalname="D0(7)" name="I5" />
            <blockpin signalname="D1(7)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_40">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(8)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(8)" name="I2" />
            <blockpin signalname="D2(8)" name="I3" />
            <blockpin signalname="D0(8)" name="I5" />
            <blockpin signalname="D1(8)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_41">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(9)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(9)" name="I2" />
            <blockpin signalname="D2(9)" name="I3" />
            <blockpin signalname="D0(9)" name="I5" />
            <blockpin signalname="D1(9)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_42">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(10)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(10)" name="I2" />
            <blockpin signalname="D2(10)" name="I3" />
            <blockpin signalname="D0(10)" name="I5" />
            <blockpin signalname="D1(10)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_43">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(11)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(11)" name="I2" />
            <blockpin signalname="D2(11)" name="I3" />
            <blockpin signalname="D0(11)" name="I5" />
            <blockpin signalname="D1(11)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_44">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(12)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(12)" name="I2" />
            <blockpin signalname="D2(12)" name="I3" />
            <blockpin signalname="D0(12)" name="I5" />
            <blockpin signalname="D1(12)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_45">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(13)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(13)" name="I2" />
            <blockpin signalname="D2(13)" name="I3" />
            <blockpin signalname="D0(13)" name="I5" />
            <blockpin signalname="D1(13)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_46">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(14)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(14)" name="I2" />
            <blockpin signalname="D2(14)" name="I3" />
            <blockpin signalname="D0(14)" name="I5" />
            <blockpin signalname="D1(14)" name="I4" />
        </block>
        <block symbolname="lut6" name="XLXI_47">
            <attr value="F7D5B391E6C4A280" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 64 hexadecimal" />
            </attr>
            <blockpin signalname="O(15)" name="O" />
            <blockpin signalname="S1" name="I0" />
            <blockpin signalname="S0" name="I1" />
            <blockpin signalname="D3(15)" name="I2" />
            <blockpin signalname="D2(15)" name="I3" />
            <blockpin signalname="D0(15)" name="I5" />
            <blockpin signalname="D1(15)" name="I4" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="10560">
        <branch name="D0(15:0)">
            <wire x2="160" y1="240" y2="592" x1="160" />
            <wire x2="160" y1="592" y2="1072" x1="160" />
            <wire x2="160" y1="1072" y2="1552" x1="160" />
            <wire x2="160" y1="1552" y2="2032" x1="160" />
            <wire x2="160" y1="2032" y2="2512" x1="160" />
            <wire x2="160" y1="2512" y2="2992" x1="160" />
            <wire x2="160" y1="2992" y2="3472" x1="160" />
            <wire x2="160" y1="3472" y2="3952" x1="160" />
            <wire x2="160" y1="3952" y2="4432" x1="160" />
            <wire x2="160" y1="4432" y2="4912" x1="160" />
            <wire x2="160" y1="4912" y2="5392" x1="160" />
            <wire x2="160" y1="5392" y2="5872" x1="160" />
            <wire x2="160" y1="5872" y2="6352" x1="160" />
            <wire x2="160" y1="6352" y2="6832" x1="160" />
            <wire x2="160" y1="6832" y2="7312" x1="160" />
            <wire x2="160" y1="7312" y2="7792" x1="160" />
        </branch>
        <branch name="D1(15:0)">
            <wire x2="240" y1="320" y2="640" x1="240" />
            <wire x2="240" y1="640" y2="1120" x1="240" />
            <wire x2="240" y1="1120" y2="1600" x1="240" />
            <wire x2="240" y1="1600" y2="2080" x1="240" />
            <wire x2="240" y1="2080" y2="2560" x1="240" />
            <wire x2="240" y1="2560" y2="3040" x1="240" />
            <wire x2="240" y1="3040" y2="3520" x1="240" />
            <wire x2="240" y1="3520" y2="4000" x1="240" />
            <wire x2="240" y1="4000" y2="4480" x1="240" />
            <wire x2="240" y1="4480" y2="4960" x1="240" />
            <wire x2="240" y1="4960" y2="5440" x1="240" />
            <wire x2="240" y1="5440" y2="5920" x1="240" />
            <wire x2="240" y1="5920" y2="6400" x1="240" />
            <wire x2="240" y1="6400" y2="6880" x1="240" />
            <wire x2="240" y1="6880" y2="7360" x1="240" />
            <wire x2="240" y1="7360" y2="7840" x1="240" />
        </branch>
        <branch name="D2(15:0)">
            <wire x2="320" y1="400" y2="688" x1="320" />
            <wire x2="320" y1="688" y2="1168" x1="320" />
            <wire x2="320" y1="1168" y2="1648" x1="320" />
            <wire x2="320" y1="1648" y2="2128" x1="320" />
            <wire x2="320" y1="2128" y2="2608" x1="320" />
            <wire x2="320" y1="2608" y2="3088" x1="320" />
            <wire x2="320" y1="3088" y2="3568" x1="320" />
            <wire x2="320" y1="3568" y2="4048" x1="320" />
            <wire x2="320" y1="4048" y2="4528" x1="320" />
            <wire x2="320" y1="4528" y2="5008" x1="320" />
            <wire x2="320" y1="5008" y2="5488" x1="320" />
            <wire x2="320" y1="5488" y2="5968" x1="320" />
            <wire x2="320" y1="5968" y2="6448" x1="320" />
            <wire x2="320" y1="6448" y2="6928" x1="320" />
            <wire x2="320" y1="6928" y2="7408" x1="320" />
            <wire x2="320" y1="7408" y2="7888" x1="320" />
        </branch>
        <branch name="D3(15:0)">
            <wire x2="400" y1="480" y2="736" x1="400" />
            <wire x2="400" y1="736" y2="1216" x1="400" />
            <wire x2="400" y1="1216" y2="1696" x1="400" />
            <wire x2="400" y1="1696" y2="2176" x1="400" />
            <wire x2="400" y1="2176" y2="2656" x1="400" />
            <wire x2="400" y1="2656" y2="3136" x1="400" />
            <wire x2="400" y1="3136" y2="3616" x1="400" />
            <wire x2="400" y1="3616" y2="4096" x1="400" />
            <wire x2="400" y1="4096" y2="4576" x1="400" />
            <wire x2="400" y1="4576" y2="5056" x1="400" />
            <wire x2="400" y1="5056" y2="5536" x1="400" />
            <wire x2="400" y1="5536" y2="6016" x1="400" />
            <wire x2="400" y1="6016" y2="6496" x1="400" />
            <wire x2="400" y1="6496" y2="6976" x1="400" />
            <wire x2="400" y1="6976" y2="7456" x1="400" />
            <wire x2="400" y1="7456" y2="7936" x1="400" />
        </branch>
        <branch name="O(15:0)">
            <wire x2="1360" y1="480" y2="480" x1="1280" />
            <wire x2="1280" y1="480" y2="752" x1="1280" />
            <wire x2="1280" y1="752" y2="1232" x1="1280" />
            <wire x2="1280" y1="1232" y2="1712" x1="1280" />
            <wire x2="1280" y1="1712" y2="2192" x1="1280" />
            <wire x2="1280" y1="2192" y2="2672" x1="1280" />
            <wire x2="1280" y1="2672" y2="3152" x1="1280" />
            <wire x2="1280" y1="3152" y2="3632" x1="1280" />
            <wire x2="1280" y1="3632" y2="4112" x1="1280" />
            <wire x2="1280" y1="4112" y2="4592" x1="1280" />
            <wire x2="1280" y1="4592" y2="5072" x1="1280" />
            <wire x2="1280" y1="5072" y2="5552" x1="1280" />
            <wire x2="1280" y1="5552" y2="6032" x1="1280" />
            <wire x2="1280" y1="6032" y2="6512" x1="1280" />
            <wire x2="1280" y1="6512" y2="6992" x1="1280" />
            <wire x2="1280" y1="6992" y2="7472" x1="1280" />
            <wire x2="1280" y1="7472" y2="7952" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="160" y="240" name="D0(15:0)" orien="R270" />
        <iomarker fontsize="28" x="240" y="320" name="D1(15:0)" orien="R270" />
        <iomarker fontsize="28" x="320" y="400" name="D2(15:0)" orien="R270" />
        <iomarker fontsize="28" x="400" y="480" name="D3(15:0)" orien="R270" />
        <iomarker fontsize="28" x="1360" y="480" name="O(15:0)" orien="R0" />
        <branch name="S0">
            <wire x2="656" y1="8160" y2="8160" x1="224" />
            <wire x2="720" y1="800" y2="800" x1="656" />
            <wire x2="656" y1="800" y2="1280" x1="656" />
            <wire x2="720" y1="1280" y2="1280" x1="656" />
            <wire x2="656" y1="1280" y2="1760" x1="656" />
            <wire x2="720" y1="1760" y2="1760" x1="656" />
            <wire x2="656" y1="1760" y2="2240" x1="656" />
            <wire x2="720" y1="2240" y2="2240" x1="656" />
            <wire x2="656" y1="2240" y2="2720" x1="656" />
            <wire x2="720" y1="2720" y2="2720" x1="656" />
            <wire x2="656" y1="2720" y2="3200" x1="656" />
            <wire x2="720" y1="3200" y2="3200" x1="656" />
            <wire x2="656" y1="3200" y2="3680" x1="656" />
            <wire x2="720" y1="3680" y2="3680" x1="656" />
            <wire x2="656" y1="3680" y2="4160" x1="656" />
            <wire x2="720" y1="4160" y2="4160" x1="656" />
            <wire x2="656" y1="4160" y2="4640" x1="656" />
            <wire x2="720" y1="4640" y2="4640" x1="656" />
            <wire x2="656" y1="4640" y2="5120" x1="656" />
            <wire x2="720" y1="5120" y2="5120" x1="656" />
            <wire x2="656" y1="5120" y2="5600" x1="656" />
            <wire x2="720" y1="5600" y2="5600" x1="656" />
            <wire x2="656" y1="5600" y2="6080" x1="656" />
            <wire x2="720" y1="6080" y2="6080" x1="656" />
            <wire x2="656" y1="6080" y2="6560" x1="656" />
            <wire x2="720" y1="6560" y2="6560" x1="656" />
            <wire x2="656" y1="6560" y2="7040" x1="656" />
            <wire x2="720" y1="7040" y2="7040" x1="656" />
            <wire x2="656" y1="7040" y2="7520" x1="656" />
            <wire x2="720" y1="7520" y2="7520" x1="656" />
            <wire x2="656" y1="7520" y2="8000" x1="656" />
            <wire x2="720" y1="8000" y2="8000" x1="656" />
            <wire x2="656" y1="8000" y2="8160" x1="656" />
        </branch>
        <branch name="S1">
            <wire x2="688" y1="8240" y2="8240" x1="224" />
            <wire x2="720" y1="848" y2="848" x1="688" />
            <wire x2="688" y1="848" y2="1328" x1="688" />
            <wire x2="720" y1="1328" y2="1328" x1="688" />
            <wire x2="688" y1="1328" y2="1808" x1="688" />
            <wire x2="720" y1="1808" y2="1808" x1="688" />
            <wire x2="688" y1="1808" y2="2288" x1="688" />
            <wire x2="720" y1="2288" y2="2288" x1="688" />
            <wire x2="688" y1="2288" y2="2768" x1="688" />
            <wire x2="720" y1="2768" y2="2768" x1="688" />
            <wire x2="688" y1="2768" y2="3248" x1="688" />
            <wire x2="720" y1="3248" y2="3248" x1="688" />
            <wire x2="688" y1="3248" y2="3728" x1="688" />
            <wire x2="720" y1="3728" y2="3728" x1="688" />
            <wire x2="688" y1="3728" y2="4208" x1="688" />
            <wire x2="720" y1="4208" y2="4208" x1="688" />
            <wire x2="688" y1="4208" y2="4688" x1="688" />
            <wire x2="720" y1="4688" y2="4688" x1="688" />
            <wire x2="688" y1="4688" y2="5168" x1="688" />
            <wire x2="720" y1="5168" y2="5168" x1="688" />
            <wire x2="688" y1="5168" y2="5648" x1="688" />
            <wire x2="720" y1="5648" y2="5648" x1="688" />
            <wire x2="688" y1="5648" y2="6128" x1="688" />
            <wire x2="720" y1="6128" y2="6128" x1="688" />
            <wire x2="688" y1="6128" y2="6608" x1="688" />
            <wire x2="720" y1="6608" y2="6608" x1="688" />
            <wire x2="688" y1="6608" y2="7088" x1="688" />
            <wire x2="720" y1="7088" y2="7088" x1="688" />
            <wire x2="688" y1="7088" y2="7568" x1="688" />
            <wire x2="720" y1="7568" y2="7568" x1="688" />
            <wire x2="688" y1="7568" y2="8048" x1="688" />
            <wire x2="720" y1="8048" y2="8048" x1="688" />
            <wire x2="688" y1="8048" y2="8240" x1="688" />
        </branch>
        <bustap x2="256" y1="592" y2="592" x1="160" />
        <bustap x2="336" y1="640" y2="640" x1="240" />
        <bustap x2="416" y1="688" y2="688" x1="320" />
        <bustap x2="496" y1="736" y2="736" x1="400" />
        <bustap x2="256" y1="1072" y2="1072" x1="160" />
        <bustap x2="336" y1="1120" y2="1120" x1="240" />
        <bustap x2="416" y1="1168" y2="1168" x1="320" />
        <bustap x2="496" y1="1216" y2="1216" x1="400" />
        <bustap x2="256" y1="1552" y2="1552" x1="160" />
        <bustap x2="336" y1="1600" y2="1600" x1="240" />
        <bustap x2="416" y1="1648" y2="1648" x1="320" />
        <bustap x2="496" y1="1696" y2="1696" x1="400" />
        <bustap x2="256" y1="2032" y2="2032" x1="160" />
        <bustap x2="336" y1="2080" y2="2080" x1="240" />
        <bustap x2="416" y1="2128" y2="2128" x1="320" />
        <bustap x2="496" y1="2176" y2="2176" x1="400" />
        <bustap x2="256" y1="2512" y2="2512" x1="160" />
        <bustap x2="336" y1="2560" y2="2560" x1="240" />
        <bustap x2="416" y1="2608" y2="2608" x1="320" />
        <bustap x2="496" y1="2656" y2="2656" x1="400" />
        <bustap x2="256" y1="2992" y2="2992" x1="160" />
        <bustap x2="336" y1="3040" y2="3040" x1="240" />
        <bustap x2="416" y1="3088" y2="3088" x1="320" />
        <bustap x2="496" y1="3136" y2="3136" x1="400" />
        <bustap x2="256" y1="3472" y2="3472" x1="160" />
        <bustap x2="336" y1="3520" y2="3520" x1="240" />
        <bustap x2="416" y1="3568" y2="3568" x1="320" />
        <bustap x2="496" y1="3616" y2="3616" x1="400" />
        <bustap x2="256" y1="3952" y2="3952" x1="160" />
        <bustap x2="336" y1="4000" y2="4000" x1="240" />
        <bustap x2="416" y1="4048" y2="4048" x1="320" />
        <bustap x2="496" y1="4096" y2="4096" x1="400" />
        <bustap x2="256" y1="4432" y2="4432" x1="160" />
        <bustap x2="336" y1="4480" y2="4480" x1="240" />
        <bustap x2="416" y1="4528" y2="4528" x1="320" />
        <bustap x2="496" y1="4576" y2="4576" x1="400" />
        <bustap x2="256" y1="4912" y2="4912" x1="160" />
        <bustap x2="336" y1="4960" y2="4960" x1="240" />
        <bustap x2="416" y1="5008" y2="5008" x1="320" />
        <bustap x2="496" y1="5056" y2="5056" x1="400" />
        <bustap x2="256" y1="5392" y2="5392" x1="160" />
        <bustap x2="336" y1="5440" y2="5440" x1="240" />
        <bustap x2="416" y1="5488" y2="5488" x1="320" />
        <bustap x2="496" y1="5536" y2="5536" x1="400" />
        <bustap x2="256" y1="5872" y2="5872" x1="160" />
        <bustap x2="336" y1="5920" y2="5920" x1="240" />
        <bustap x2="416" y1="5968" y2="5968" x1="320" />
        <bustap x2="496" y1="6016" y2="6016" x1="400" />
        <bustap x2="256" y1="6352" y2="6352" x1="160" />
        <bustap x2="336" y1="6400" y2="6400" x1="240" />
        <bustap x2="416" y1="6448" y2="6448" x1="320" />
        <bustap x2="496" y1="6496" y2="6496" x1="400" />
        <bustap x2="256" y1="6832" y2="6832" x1="160" />
        <bustap x2="336" y1="6880" y2="6880" x1="240" />
        <bustap x2="416" y1="6928" y2="6928" x1="320" />
        <bustap x2="496" y1="6976" y2="6976" x1="400" />
        <bustap x2="256" y1="7312" y2="7312" x1="160" />
        <bustap x2="336" y1="7360" y2="7360" x1="240" />
        <bustap x2="416" y1="7408" y2="7408" x1="320" />
        <bustap x2="496" y1="7456" y2="7456" x1="400" />
        <bustap x2="256" y1="7792" y2="7792" x1="160" />
        <bustap x2="336" y1="7840" y2="7840" x1="240" />
        <bustap x2="416" y1="7888" y2="7888" x1="320" />
        <bustap x2="496" y1="7936" y2="7936" x1="400" />
        <branch name="D0(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="592" type="branch" />
            <wire x2="560" y1="592" y2="592" x1="256" />
            <wire x2="720" y1="592" y2="592" x1="560" />
        </branch>
        <branch name="D1(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="640" type="branch" />
            <wire x2="560" y1="640" y2="640" x1="336" />
            <wire x2="720" y1="640" y2="640" x1="560" />
        </branch>
        <branch name="D2(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="688" type="branch" />
            <wire x2="560" y1="688" y2="688" x1="416" />
            <wire x2="720" y1="688" y2="688" x1="560" />
        </branch>
        <branch name="D3(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="736" type="branch" />
            <wire x2="560" y1="736" y2="736" x1="496" />
            <wire x2="720" y1="736" y2="736" x1="560" />
        </branch>
        <branch name="D0(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1072" type="branch" />
            <wire x2="560" y1="1072" y2="1072" x1="256" />
            <wire x2="720" y1="1072" y2="1072" x1="560" />
        </branch>
        <branch name="D1(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1120" type="branch" />
            <wire x2="560" y1="1120" y2="1120" x1="336" />
            <wire x2="720" y1="1120" y2="1120" x1="560" />
        </branch>
        <branch name="D2(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1168" type="branch" />
            <wire x2="560" y1="1168" y2="1168" x1="416" />
            <wire x2="720" y1="1168" y2="1168" x1="560" />
        </branch>
        <branch name="D3(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1216" type="branch" />
            <wire x2="560" y1="1216" y2="1216" x1="496" />
            <wire x2="720" y1="1216" y2="1216" x1="560" />
        </branch>
        <branch name="D0(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1552" type="branch" />
            <wire x2="560" y1="1552" y2="1552" x1="256" />
            <wire x2="720" y1="1552" y2="1552" x1="560" />
        </branch>
        <branch name="D1(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1600" type="branch" />
            <wire x2="560" y1="1600" y2="1600" x1="336" />
            <wire x2="720" y1="1600" y2="1600" x1="560" />
        </branch>
        <branch name="D2(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1648" type="branch" />
            <wire x2="560" y1="1648" y2="1648" x1="416" />
            <wire x2="720" y1="1648" y2="1648" x1="560" />
        </branch>
        <branch name="D3(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="1696" type="branch" />
            <wire x2="560" y1="1696" y2="1696" x1="496" />
            <wire x2="720" y1="1696" y2="1696" x1="560" />
        </branch>
        <branch name="D0(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2032" type="branch" />
            <wire x2="560" y1="2032" y2="2032" x1="256" />
            <wire x2="720" y1="2032" y2="2032" x1="560" />
        </branch>
        <branch name="D1(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2080" type="branch" />
            <wire x2="560" y1="2080" y2="2080" x1="336" />
            <wire x2="720" y1="2080" y2="2080" x1="560" />
        </branch>
        <branch name="D2(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2128" type="branch" />
            <wire x2="560" y1="2128" y2="2128" x1="416" />
            <wire x2="720" y1="2128" y2="2128" x1="560" />
        </branch>
        <branch name="D3(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2176" type="branch" />
            <wire x2="560" y1="2176" y2="2176" x1="496" />
            <wire x2="720" y1="2176" y2="2176" x1="560" />
        </branch>
        <branch name="D0(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2512" type="branch" />
            <wire x2="560" y1="2512" y2="2512" x1="256" />
            <wire x2="720" y1="2512" y2="2512" x1="560" />
        </branch>
        <branch name="D1(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2560" type="branch" />
            <wire x2="560" y1="2560" y2="2560" x1="336" />
            <wire x2="720" y1="2560" y2="2560" x1="560" />
        </branch>
        <branch name="D2(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2608" type="branch" />
            <wire x2="560" y1="2608" y2="2608" x1="416" />
            <wire x2="720" y1="2608" y2="2608" x1="560" />
        </branch>
        <branch name="D3(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2656" type="branch" />
            <wire x2="560" y1="2656" y2="2656" x1="496" />
            <wire x2="720" y1="2656" y2="2656" x1="560" />
        </branch>
        <branch name="D0(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="2992" type="branch" />
            <wire x2="560" y1="2992" y2="2992" x1="256" />
            <wire x2="720" y1="2992" y2="2992" x1="560" />
        </branch>
        <branch name="D1(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3040" type="branch" />
            <wire x2="560" y1="3040" y2="3040" x1="336" />
            <wire x2="720" y1="3040" y2="3040" x1="560" />
        </branch>
        <branch name="D2(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3088" type="branch" />
            <wire x2="560" y1="3088" y2="3088" x1="416" />
            <wire x2="720" y1="3088" y2="3088" x1="560" />
        </branch>
        <branch name="D3(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3136" type="branch" />
            <wire x2="560" y1="3136" y2="3136" x1="496" />
            <wire x2="720" y1="3136" y2="3136" x1="560" />
        </branch>
        <branch name="D0(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3472" type="branch" />
            <wire x2="560" y1="3472" y2="3472" x1="256" />
            <wire x2="720" y1="3472" y2="3472" x1="560" />
        </branch>
        <branch name="D1(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3520" type="branch" />
            <wire x2="560" y1="3520" y2="3520" x1="336" />
            <wire x2="720" y1="3520" y2="3520" x1="560" />
        </branch>
        <branch name="D2(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3568" type="branch" />
            <wire x2="560" y1="3568" y2="3568" x1="416" />
            <wire x2="720" y1="3568" y2="3568" x1="560" />
        </branch>
        <branch name="D3(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3616" type="branch" />
            <wire x2="560" y1="3616" y2="3616" x1="496" />
            <wire x2="720" y1="3616" y2="3616" x1="560" />
        </branch>
        <branch name="D0(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="3952" type="branch" />
            <wire x2="560" y1="3952" y2="3952" x1="256" />
            <wire x2="720" y1="3952" y2="3952" x1="560" />
        </branch>
        <branch name="D1(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4000" type="branch" />
            <wire x2="560" y1="4000" y2="4000" x1="336" />
            <wire x2="720" y1="4000" y2="4000" x1="560" />
        </branch>
        <branch name="D2(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4048" type="branch" />
            <wire x2="560" y1="4048" y2="4048" x1="416" />
            <wire x2="720" y1="4048" y2="4048" x1="560" />
        </branch>
        <branch name="D3(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4096" type="branch" />
            <wire x2="560" y1="4096" y2="4096" x1="496" />
            <wire x2="720" y1="4096" y2="4096" x1="560" />
        </branch>
        <branch name="D0(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4432" type="branch" />
            <wire x2="560" y1="4432" y2="4432" x1="256" />
            <wire x2="720" y1="4432" y2="4432" x1="560" />
        </branch>
        <branch name="D1(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4480" type="branch" />
            <wire x2="560" y1="4480" y2="4480" x1="336" />
            <wire x2="720" y1="4480" y2="4480" x1="560" />
        </branch>
        <branch name="D2(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4528" type="branch" />
            <wire x2="560" y1="4528" y2="4528" x1="416" />
            <wire x2="720" y1="4528" y2="4528" x1="560" />
        </branch>
        <branch name="D3(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4576" type="branch" />
            <wire x2="560" y1="4576" y2="4576" x1="496" />
            <wire x2="720" y1="4576" y2="4576" x1="560" />
        </branch>
        <branch name="D0(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4912" type="branch" />
            <wire x2="560" y1="4912" y2="4912" x1="256" />
            <wire x2="720" y1="4912" y2="4912" x1="560" />
        </branch>
        <branch name="D1(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="4960" type="branch" />
            <wire x2="560" y1="4960" y2="4960" x1="336" />
            <wire x2="720" y1="4960" y2="4960" x1="560" />
        </branch>
        <branch name="D2(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5008" type="branch" />
            <wire x2="560" y1="5008" y2="5008" x1="416" />
            <wire x2="720" y1="5008" y2="5008" x1="560" />
        </branch>
        <branch name="D3(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5056" type="branch" />
            <wire x2="560" y1="5056" y2="5056" x1="496" />
            <wire x2="720" y1="5056" y2="5056" x1="560" />
        </branch>
        <branch name="D0(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5392" type="branch" />
            <wire x2="560" y1="5392" y2="5392" x1="256" />
            <wire x2="720" y1="5392" y2="5392" x1="560" />
        </branch>
        <branch name="D1(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5440" type="branch" />
            <wire x2="560" y1="5440" y2="5440" x1="336" />
            <wire x2="720" y1="5440" y2="5440" x1="560" />
        </branch>
        <branch name="D2(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5488" type="branch" />
            <wire x2="560" y1="5488" y2="5488" x1="416" />
            <wire x2="720" y1="5488" y2="5488" x1="560" />
        </branch>
        <branch name="D3(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5536" type="branch" />
            <wire x2="560" y1="5536" y2="5536" x1="496" />
            <wire x2="720" y1="5536" y2="5536" x1="560" />
        </branch>
        <branch name="D0(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5872" type="branch" />
            <wire x2="560" y1="5872" y2="5872" x1="256" />
            <wire x2="720" y1="5872" y2="5872" x1="560" />
        </branch>
        <branch name="D1(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5920" type="branch" />
            <wire x2="560" y1="5920" y2="5920" x1="336" />
            <wire x2="720" y1="5920" y2="5920" x1="560" />
        </branch>
        <branch name="D2(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="5968" type="branch" />
            <wire x2="560" y1="5968" y2="5968" x1="416" />
            <wire x2="720" y1="5968" y2="5968" x1="560" />
        </branch>
        <branch name="D3(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6016" type="branch" />
            <wire x2="560" y1="6016" y2="6016" x1="496" />
            <wire x2="720" y1="6016" y2="6016" x1="560" />
        </branch>
        <branch name="D0(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6352" type="branch" />
            <wire x2="560" y1="6352" y2="6352" x1="256" />
            <wire x2="720" y1="6352" y2="6352" x1="560" />
        </branch>
        <branch name="D1(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6400" type="branch" />
            <wire x2="560" y1="6400" y2="6400" x1="336" />
            <wire x2="720" y1="6400" y2="6400" x1="560" />
        </branch>
        <branch name="D2(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6448" type="branch" />
            <wire x2="560" y1="6448" y2="6448" x1="416" />
            <wire x2="720" y1="6448" y2="6448" x1="560" />
        </branch>
        <branch name="D3(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6496" type="branch" />
            <wire x2="560" y1="6496" y2="6496" x1="496" />
            <wire x2="720" y1="6496" y2="6496" x1="560" />
        </branch>
        <branch name="D0(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6832" type="branch" />
            <wire x2="560" y1="6832" y2="6832" x1="256" />
            <wire x2="720" y1="6832" y2="6832" x1="560" />
        </branch>
        <branch name="D1(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6880" type="branch" />
            <wire x2="560" y1="6880" y2="6880" x1="336" />
            <wire x2="720" y1="6880" y2="6880" x1="560" />
        </branch>
        <branch name="D2(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6928" type="branch" />
            <wire x2="560" y1="6928" y2="6928" x1="416" />
            <wire x2="720" y1="6928" y2="6928" x1="560" />
        </branch>
        <branch name="D3(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="6976" type="branch" />
            <wire x2="560" y1="6976" y2="6976" x1="496" />
            <wire x2="720" y1="6976" y2="6976" x1="560" />
        </branch>
        <branch name="D0(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7312" type="branch" />
            <wire x2="560" y1="7312" y2="7312" x1="256" />
            <wire x2="720" y1="7312" y2="7312" x1="560" />
        </branch>
        <branch name="D1(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7360" type="branch" />
            <wire x2="560" y1="7360" y2="7360" x1="336" />
            <wire x2="720" y1="7360" y2="7360" x1="560" />
        </branch>
        <branch name="D2(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7408" type="branch" />
            <wire x2="560" y1="7408" y2="7408" x1="416" />
            <wire x2="720" y1="7408" y2="7408" x1="560" />
        </branch>
        <branch name="D3(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7456" type="branch" />
            <wire x2="560" y1="7456" y2="7456" x1="496" />
            <wire x2="720" y1="7456" y2="7456" x1="560" />
        </branch>
        <branch name="D0(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7792" type="branch" />
            <wire x2="560" y1="7792" y2="7792" x1="256" />
            <wire x2="720" y1="7792" y2="7792" x1="560" />
        </branch>
        <branch name="D1(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7840" type="branch" />
            <wire x2="560" y1="7840" y2="7840" x1="336" />
            <wire x2="720" y1="7840" y2="7840" x1="560" />
        </branch>
        <branch name="D2(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7888" type="branch" />
            <wire x2="560" y1="7888" y2="7888" x1="416" />
            <wire x2="720" y1="7888" y2="7888" x1="560" />
        </branch>
        <branch name="D3(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="560" y="7936" type="branch" />
            <wire x2="560" y1="7936" y2="7936" x1="496" />
            <wire x2="720" y1="7936" y2="7936" x1="560" />
        </branch>
        <instance x="720" y="944" name="XLXI_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="1424" name="XLXI_33" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="1904" name="XLXI_34" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="2384" name="XLXI_35" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="2864" name="XLXI_36" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="3344" name="XLXI_37" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="3824" name="XLXI_38" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="4304" name="XLXI_39" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="4784" name="XLXI_40" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="5264" name="XLXI_41" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="5744" name="XLXI_42" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="6224" name="XLXI_43" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="6704" name="XLXI_44" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="7184" name="XLXI_45" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="7664" name="XLXI_46" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <instance x="720" y="8144" name="XLXI_47" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
        </instance>
        <bustap x2="1184" y1="752" y2="752" x1="1280" />
        <branch name="O(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="752" type="branch" />
            <wire x2="1152" y1="752" y2="752" x1="1104" />
            <wire x2="1184" y1="752" y2="752" x1="1152" />
        </branch>
        <bustap x2="1184" y1="1232" y2="1232" x1="1280" />
        <branch name="O(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="1232" type="branch" />
            <wire x2="1152" y1="1232" y2="1232" x1="1104" />
            <wire x2="1184" y1="1232" y2="1232" x1="1152" />
        </branch>
        <bustap x2="1184" y1="1712" y2="1712" x1="1280" />
        <branch name="O(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="1712" type="branch" />
            <wire x2="1152" y1="1712" y2="1712" x1="1104" />
            <wire x2="1184" y1="1712" y2="1712" x1="1152" />
        </branch>
        <bustap x2="1184" y1="2192" y2="2192" x1="1280" />
        <branch name="O(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="2192" type="branch" />
            <wire x2="1152" y1="2192" y2="2192" x1="1104" />
            <wire x2="1184" y1="2192" y2="2192" x1="1152" />
        </branch>
        <bustap x2="1184" y1="2672" y2="2672" x1="1280" />
        <branch name="O(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="2672" type="branch" />
            <wire x2="1136" y1="2672" y2="2672" x1="1104" />
            <wire x2="1152" y1="2672" y2="2672" x1="1136" />
            <wire x2="1184" y1="2672" y2="2672" x1="1152" />
        </branch>
        <bustap x2="1184" y1="3152" y2="3152" x1="1280" />
        <branch name="O(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="3152" type="branch" />
            <wire x2="1152" y1="3152" y2="3152" x1="1104" />
            <wire x2="1184" y1="3152" y2="3152" x1="1152" />
        </branch>
        <bustap x2="1184" y1="3632" y2="3632" x1="1280" />
        <branch name="O(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="3632" type="branch" />
            <wire x2="1152" y1="3632" y2="3632" x1="1104" />
            <wire x2="1184" y1="3632" y2="3632" x1="1152" />
        </branch>
        <bustap x2="1184" y1="4112" y2="4112" x1="1280" />
        <branch name="O(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="4112" type="branch" />
            <wire x2="1152" y1="4112" y2="4112" x1="1104" />
            <wire x2="1184" y1="4112" y2="4112" x1="1152" />
        </branch>
        <bustap x2="1184" y1="4592" y2="4592" x1="1280" />
        <branch name="O(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="4592" type="branch" />
            <wire x2="1152" y1="4592" y2="4592" x1="1104" />
            <wire x2="1184" y1="4592" y2="4592" x1="1152" />
        </branch>
        <bustap x2="1184" y1="5072" y2="5072" x1="1280" />
        <branch name="O(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="5072" type="branch" />
            <wire x2="1152" y1="5072" y2="5072" x1="1104" />
            <wire x2="1184" y1="5072" y2="5072" x1="1152" />
        </branch>
        <bustap x2="1184" y1="5552" y2="5552" x1="1280" />
        <branch name="O(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="5552" type="branch" />
            <wire x2="1152" y1="5552" y2="5552" x1="1104" />
            <wire x2="1184" y1="5552" y2="5552" x1="1152" />
        </branch>
        <bustap x2="1184" y1="6032" y2="6032" x1="1280" />
        <branch name="O(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="6032" type="branch" />
            <wire x2="1152" y1="6032" y2="6032" x1="1104" />
            <wire x2="1184" y1="6032" y2="6032" x1="1152" />
        </branch>
        <bustap x2="1184" y1="6512" y2="6512" x1="1280" />
        <branch name="O(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="6512" type="branch" />
            <wire x2="1152" y1="6512" y2="6512" x1="1104" />
            <wire x2="1184" y1="6512" y2="6512" x1="1152" />
        </branch>
        <bustap x2="1184" y1="6992" y2="6992" x1="1280" />
        <branch name="O(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="6992" type="branch" />
            <wire x2="1152" y1="6992" y2="6992" x1="1104" />
            <wire x2="1184" y1="6992" y2="6992" x1="1152" />
        </branch>
        <bustap x2="1184" y1="7472" y2="7472" x1="1280" />
        <branch name="O(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="7472" type="branch" />
            <wire x2="1152" y1="7472" y2="7472" x1="1104" />
            <wire x2="1184" y1="7472" y2="7472" x1="1152" />
        </branch>
        <bustap x2="1184" y1="7952" y2="7952" x1="1280" />
        <branch name="O(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1152" y="7952" type="branch" />
            <wire x2="1152" y1="7952" y2="7952" x1="1104" />
            <wire x2="1184" y1="7952" y2="7952" x1="1152" />
        </branch>
        <iomarker fontsize="28" x="224" y="8160" name="S0" orien="R180" />
        <iomarker fontsize="28" x="224" y="8240" name="S1" orien="R180" />
    </sheet>
</drawing>