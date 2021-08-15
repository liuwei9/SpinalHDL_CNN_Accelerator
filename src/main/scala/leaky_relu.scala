import spinal.core._
import xip._
class leaky_relu(
                    S_DATA_WIDTH: Int,
                    ZERO_POINT_WIDTH: Int,
                    M_DATA_WIDTH: Int
                ) extends Component {

    val io = new Bundle {
        val data_in = in Bits (S_DATA_WIDTH bits)
        val zero_data_in = in Bits (ZERO_POINT_WIDTH bits)
        val data_out = out Bits (M_DATA_WIDTH bits)
    }
    noIoPrefix()
    val DATA_WIDTH_TEMP = 16
    val data_after1 = RegNext(io.data_in.resize(DATA_WIDTH_TEMP bits))
    val sub_zero = new xsub(DATA_WIDTH_TEMP ,ZERO_POINT_WIDTH,DATA_WIDTH_TEMP,this.clockDomain)

}
object leaky_relu{
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new leaky_relu(8,8,8))
    }
}