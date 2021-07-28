import spinal.core._
import spinal.lib.{master, slave}
class m  extends Component {
    val io = new Bundle {
        val image_Start = in Bool()
        val image_S_DATA = slave Stream Bits(8 bits)
        val image_M_DATA = master Stream Bits(8 bits)
        val image_Row_Num_After_Padding = out UInt (12 bits)
        val image_Last = out (Reg(Bool())) init(False)

    }
    val image_padding = new padding(8,12,640).setDefinitionName("image_padding")
    image_padding.padding_fifo.setDefinitionName("image_padding_fifo")
    image_padding.padding_fifo.fifo.setDefinitionName("image_padding_fifo_sync")
    io.image_Start <> image_padding.io.Start
    io.image_S_DATA <> image_padding.io.S_DATA
    io.image_M_DATA <> image_padding.io.M_DATA
    io.image_Row_Num_After_Padding <> image_padding.io.Row_Num_After_Padding
    io.image_Last <> image_padding.io.Last
}
object m{
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            defaultConfigForClockDomains = ClockDomainConfig(clockEdge = RISING, resetKind = SYNC),
            oneFilePerComponent = true,
            headerWithDate = true

        ).generateVerilog(new m)
    }
}
