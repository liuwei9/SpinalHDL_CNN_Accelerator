import spinal.core._
import spinal.lib._

class data_generate(
                       S_DATA_WIDTH: Int,
                       M_DATA_WIDTH: Int,
                       ROW_COL_DATA_COUNT_WIDTH: Int,
                       CHANNEL_NUM_WIDTH: Int,
                       DATA_WIDTH: Int,
                       ZERO_NUM_WIDTH: Int
                   ) extends Component {

    val io = new Bundle {
        val Start = in Bool()
        val S_DATA = slave Stream Bits(S_DATA_WIDTH bits)
        val M_DATA = master Stream Bits(M_DATA_WIDTH bits)
        val Row_Num_In_REG = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val Padding_REG = in Bool()
        val Zero_Point_REG = in Bits (DATA_WIDTH bits)
        val Zero_Num_REG = in Bits (ZERO_NUM_WIDTH bits)
        val Channel_In_Num_REG = in Bits(CHANNEL_NUM_WIDTH bits)
        val EN_Cin_Select_REG = in Bool()
        val RowNum_After_Padding = out Bits(ROW_COL_DATA_COUNT_WIDTH bits)
    }
    noIoPrefix()
    val Channel_Out_Num = 8
    val PADDING_S_DATA_WIDTH = S_DATA_WIDTH
    val cin_convert = new cin_convert(Channel_Out_Num,S_DATA_WIDTH,PADDING_S_DATA_WIDTH,DATA_WIDTH)
    cin_convert.io.EN_Cin_Select_REG <> io.EN_Cin_Select_REG
    cin_convert.io.S_DATA <> io.S_DATA


}
object data_generate{
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new data_generate(64,64,12,10,8,8))
    }
}
