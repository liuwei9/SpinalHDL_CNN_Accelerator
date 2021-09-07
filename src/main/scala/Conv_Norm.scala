import spinal.core._
import spinal.lib._

class Conv_Norm(
                   PARA_DATA_WIDTH: Int,
                   S_DATA_WIDTH: Int,
                   M_DATA_WIDTH: Int,
                   ROW_COL_DATA_COUNT_WIDTH: Int,
                   CHANNEL_NUM_WIDTH: Int,
                   WEIGHT_NUM_WIDTH: Int,
                   BIAS_NUM_WIDTH: Int,
                   BIAS_DATA_WIDTH: Int,
                   SCALE_DATA_WIDTH: Int,
                   SHIFT_DATA_WIDTH: Int,
                   CHANNEL_IN_NUM: Int,
                   CHANNEL_OUT_NUM: Int
               ) extends Component {
    val io = new Bundle {
        val Start_Cu = in Bool()
        val Start_Pa = in Bool()
        val para_data = slave Stream Bits(PARA_DATA_WIDTH bits)
        val Write_Block_Complete = out Bool()
        val Compute_Complete = out Bool()
        val S_DATA = in Bits (S_DATA_WIDTH bits)
        val S_DATA_Valid = in Bits (9 bits)
        val S_DATA_Ready = out Bool()
        val M_DATA = master Stream Bits(M_DATA_WIDTH bits)

        val Row_Num_Out_REG = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val RowNum_After_Padding = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val Channel_In_Num_REG = in Bits (CHANNEL_NUM_WIDTH bits)
        val Channel_Out_Num_REG = in Bits (CHANNEL_NUM_WIDTH bits)
        val Weight_Single_Num_REG = in Bits (WEIGHT_NUM_WIDTH)
        val Bias_Num_REG = in Bits (BIAS_NUM_WIDTH bits)
        val Bias_Addrb = in Bits (BIAS_NUM_WIDTH bits)
        val Data_Out_Bias = out Bits (BIAS_DATA_WIDTH bits)
        val Data_Out_Scale = out Bits (SCALE_DATA_WIDTH bits)
        val Data_Out_Shift = out Bits (SHIFT_DATA_WIDTH bits)
    }
    noIoPrefix()
    io.M_DATA.valid.setAsReg()

    val COMPUTE_TIMES_CHANNEL_IN_REG = io.Channel_In_Num_REG >> log2Up(CHANNEL_IN_NUM)
    val COMPUTE_TIMES_CHANNEL_IN_REG_8 = io.Channel_In_Num_REG >> log2Up(3)
    val COMPUTE_TIMES_CHANNEL_OUT_REG = io.Channel_In_Num_REG >> log2Up(CHANNEL_OUT_NUM)
}
