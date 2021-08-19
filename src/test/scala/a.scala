import spinal.core._
import xip._
class a extends Component {
    val io = new Bundle{
        val A = in Bits(8 bits)
        val B = in Bits(8 bits)
        val S1 = out Bits(8 bits)
        val S2 = out Bits(8 bits)
    }
    noIoPrefix()
    val a1 = new xadd(8,8,8,this.clockDomain,"xadd")//.setDefinitionName("xadd")//BlackBox
    a1.io.A<>io.A
    a1.io.B<>io.B
    a1.io.S<>io.S1
    val a2 = new xsub(8,8,8,this.clockDomain,"xsub")//.setDefinitionName("xsub")//BlackBox
    a2.io.A<>0
    a2.io.B<>0
    a2.io.S<>io.S2
}
object a{
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            defaultConfigForClockDomains = ClockDomainConfig(clockEdge = RISING, resetKind = SYNC),
            oneFilePerComponent = true,
            headerWithDate = true,
            targetDirectory = "test"

        )generateVerilog(new a)
    }
}
