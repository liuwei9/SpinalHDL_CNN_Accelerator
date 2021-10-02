import spinal.core._
import spinal.lib._
import xmemory._

class A() extends Component {
    val rd_en = Vec(Bool(),2)
    val rd_en1 = Vec(Bool(),2)
    rd_en(0):=RegNext(True)
    rd_en(1):=RegNext(True)
    rd_en1(0):= ~rd_en(0)
    rd_en1(1):= ~rd_en(1)
}

object A {
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            defaultConfigForClockDomains = ClockDomainConfig(clockEdge = RISING, resetKind = SYNC),
            oneFilePerComponent = true

            //            headerWithDate = true,
//            targetDirectory = "verilog"

        ) generateVerilog(new A)
    }
}
