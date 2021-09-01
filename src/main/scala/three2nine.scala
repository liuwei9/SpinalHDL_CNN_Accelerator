import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
class three2nine(
                S_DATA_WIDTH:Int,
                M_DATA_WIDTH:Int,
                CHANNEL_NUM_WIDTH: Int,
                ROW_COL_DATA_COUNT_WIDTH: Int
                ) extends Component {
    val io = new Bundle{
        val Start = in Bool()
        val S_DATA = in Bits(S_DATA_WIDTH bits)
        val S_DATA_Valid = in Bool()
        val S_DATA_Ready = out Bool()
        val S_DATA_Addr = out UInt (ROW_COL_DATA_COUNT_WIDTH bits) setAsReg() init 0
        val Row_Num_After_Padding = in UInt (ROW_COL_DATA_COUNT_WIDTH bits)
        val Channel_In_Num_REG = in Bits (CHANNEL_NUM_WIDTH bits)
        val Row_Compute_Sign = in Bool()
        val M_Data = out Bits (M_DATA_WIDTH bits)
        val M_Ready = in Bool()
        val M_Valid = out Bits (9 bits) setAsReg() init 0
        val S_Ready = out Bool()
    }
    noIoPrefix()



    val t2n_fsm = new StateMachine{
        val IDLE = new State() with EntryPoint
        val Start_Wait = new State()
        val Judge_FIFO = new State()
        val ComputeRow_Read = new State()
        val Judge_LastRow = new State()

        IDLE
            .whenIsActive{
                when(io.Start){
                    goto(Start_Wait)
                } otherwise goto(IDLE)
            }
        Start_Wait
            .whenIsActive {
                when(io.Row_Compute_Sign) {
                    goto(Judge_FIFO)
                } otherwise goto(Start_Wait)

            }
        Judge_FIFO
            .whenIsActive{
                when(io.M_Ready) {
                    goto(ComputeRow_Read)
                } otherwise goto(Judge_FIFO)
            }

    }
}
