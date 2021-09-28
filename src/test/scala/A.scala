import spinal.core._
import spinal.lib._
import xmemory._

class A() extends Component {
    val t = new general_fifo_sync(64,64,1024,12,false)
    t.io.rd_en := False
    t.io.wr_en := False
    t.io.m_data_count := 0
    t.io.s_data_count := 0
    t.io.data_in := 0
    val m = new general_fifo_sync(64,64,2048,12,false)
    m.io.rd_en := False
    m.io.wr_en := False
    m.io.m_data_count := 0
    m.io.s_data_count := 0
    m.io.data_in := 0
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
