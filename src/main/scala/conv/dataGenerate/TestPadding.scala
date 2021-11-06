import com.google.gson._
import spinal.core._
import spinal.core.sim._

import java.io.{File, PrintWriter}
import scala.io.Source
import scala.util.Random
//import org


case class TestPaddingConfig(enPadding: Boolean, channelIn: Int, rowNumIn: Int, colNumIn:Int,zeroDara: Int, zeroNum: Int) {

}


class TestPadding(paddingConfig: PaddingConfig, testPaddingConfig: TestPaddingConfig) extends Padding(paddingConfig) {

    def toHexString(width: Int, b: BigInt): String = {
        var s = b.toString(16)
        if (s.length < width) {
            s = "0" * (width - s.length) + s
        }
        s
    }

    def init: Unit = {
        clockDomain.forkStimulus(5)
        clockDomain.forkSimSpeedPrinter()
        io.sData.valid #= false
        io.sData.payload #= 0
        io.mData.ready #= false
        io.start #= false
        io.enPadding #= testPaddingConfig.enPadding
        io.channelIn #= testPaddingConfig.channelIn
        io.rowNumIn #= testPaddingConfig.rowNumIn
        io.colNumIn #= testPaddingConfig.colNumIn
        io.zeroDara #= testPaddingConfig.zeroDara
        io.zeroNum #= testPaddingConfig.zeroNum
        clockDomain.waitSampling(10)
    }


    def in(src: String): Unit = {
        fork{
            for (line <- Source.fromFile(src).getLines) {
                io.sData.payload #= BigInt(line.trim, 16)
                io.sData.valid #= true
                clockDomain.waitSamplingWhere(io.sData.ready.toBoolean)
            }
        }


    }
    def out(dest: String): Unit ={
        val testFile = new PrintWriter(new File(dest))
        while (!io.last.toBoolean) {

            clockDomain.waitSampling()
            io.mData.ready #= Random.nextBoolean()
            if (io.mData.valid.toBoolean && io.mData.ready.toBoolean) {
                io.start #= false
                testFile.write(toHexString(paddingConfig.COMPUTE_CHANNEL_NUM<<1,io.mData.payload.toBigInt) + "\r\n")
            }
        }
        sleep(100)
        testFile.close()
        simSuccess()
    }
}

object TestPadding {



    def main(args: Array[String]): Unit = {

//       // val py =  Runtime.getRuntime().exec("cmd python G:/SpinalStudy/py/paddingMode.py")
//        val proc1 = Runtime.getRuntime().exec("cmd /c G:\\SpinalStudy\\py\\paddingMode.py")
//        proc1.waitFor()

        val json = Source.fromFile("G:/SpinalStudy/simData/config.json").mkString
        val jsonP = new JsonParser().parse(json)
        val enPadding = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("enPadding").getAsBoolean
        val channelIn = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("channelIn").getAsInt
        val zeroDara = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("zeroDara").getAsInt
        val zeroNum = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("zeroNum").getAsInt
        val COMPUTE_CHANNEL_NUM = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("COMPUTE_CHANNEL_NUM").getAsInt
        val DATA_WIDTH = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("DATA_WIDTH").getAsInt
       // val PICTURE_NUM = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("PICTURE_NUM").getAsInt
        val PICTURE_NUM = 1
        val CHANNEL_WIDTH = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("CHANNEL_WIDTH").getAsInt
        val FEATURE_WIDTH = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("FEATURE_WIDTH").getAsInt
        val src_py = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("src_py").getAsString
        val dst_scala = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("dst_scala").getAsString
        val rowNumIn = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("rowNumIn").getAsInt
        val colNumIn = jsonP.getAsJsonObject.get("padding").getAsJsonObject.get("colNumIn").getAsInt


        val paddingConfig = PaddingConfig(DATA_WIDTH,CHANNEL_WIDTH,COMPUTE_CHANNEL_NUM,FEATURE_WIDTH,zeroNum)
        val testPaddingConfig = TestPaddingConfig(enPadding,channelIn,rowNumIn,colNumIn,zeroDara,zeroNum)



        val spinalConfig = new SpinalConfig(
            defaultClockDomainFrequency = FixedFrequency(200 MHz),
            defaultConfigForClockDomains = ClockDomainConfig(resetActiveLevel = HIGH, resetKind = SYNC)
        )
        SimConfig.withWave.withConfig(spinalConfig).compile(new TestPadding(paddingConfig, testPaddingConfig)).doSimUntilVoid { dut =>
            dut.init
            dut.io.start #= true

            dut.in(src_py)
            dut.out(dst_scala)
        }
    }
}
