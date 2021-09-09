import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class load_weight(
                     WEIGHT_NUM_WIDTH: Int,
                     BIAS_NUM_WIDTH: Int,
                     PARA_DATA_WIDTH: Int,
                     WEIGHT_DATA_WIDTH: Int,
                     BIAS_DATA_WIDTH: Int,
                     SCALE_DATA_WIDTH: Int,
                     SHIFT_DATA_WIDTH: Int
                 ) extends Component {
    val io = new Bundle {
        val Start_Pa = in Bool()
        val Weight_Single_Num_REG = in Bits (WEIGHT_NUM_WIDTH bits)
        val Bias_Num_REG = in Bits (BIAS_NUM_WIDTH bits)
        val Write_Block_Complete = out Bool() setAsReg()
        val S_Para_Data = slave Stream Bits(PARA_DATA_WIDTH bits)
        val Weight_Addrb = in Bits (BIAS_NUM_WIDTH bits)
        val Data_Out_Weight = out Bits (WEIGHT_DATA_WIDTH bits)
        val Bias_Addrb = out Bits (BIAS_NUM_WIDTH bits)
        val Data_Out_Bias = out Bits (BIAS_DATA_WIDTH bits)
        val Data_Out_Scale = out Bits (SCALE_DATA_WIDTH bits)
        val Data_Out_Shift = out Bits (SHIFT_DATA_WIDTH bits)
    }
    noIoPrefix()
    io.S_Para_Data.ready.setAsReg()

    val fsm = new StateMachine{
        val IDLE = new State() with EntryPoint
        val Copy_Weight = new State()
        val Copy_Bias = new State()
        val Copy_Scale = new State()
        val Copy_Shift = new State()

        IDLE
            .whenIsActive{
                when(io.Start_Pa){
                    goto(Copy_Weight)
                } otherwise {
                    goto(IDLE)
                }
            }
        Copy_Weight
            .whenIsActive{

            }
    }

}
