import spinal.core._
import spinal.lib.fsm._
class image_quan_ctrl(
                         ROW_COL_DATA_COUNT_WIDTH: Int,
                         CHANNEL_OUT_TIMES: Int
                     ) extends Component {
    val io = new Bundle {
        val fifo_valid = in Bool()
        val M_Ready = in Bool()
        val rd_en_fifo = out Bool()
        val para_select = out Bits(CHANNEL_OUT_TIMES bits) setAsReg() init 0
        val M_Valid = out Bool()
    }
    noIoPrefix()

    val image_quan_fsm = new StateMachine{
        val IDLE = new State() with EntryPoint
        val After_Fifo = new State()
        val Compute = new State()


        val Cnt_Cout = UInt(CHANNEL_OUT_TIMES bits) setAsReg() init 0



        IDLE
            .whenIsActive{
                when(io.fifo_valid){
                    goto(After_Fifo)
                } otherwise goto(IDLE)
            }
        After_Fifo
            .whenIsActive{
                when(io.M_Ready){
                    goto(Compute)
                } otherwise goto(After_Fifo)
            }
        Compute
            .whenIsActive{

            }



    }
}

