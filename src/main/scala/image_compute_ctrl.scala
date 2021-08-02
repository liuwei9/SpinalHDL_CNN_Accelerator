import spinal.core._
import spinal.lib.fsm._

class image_compute_ctrl extends Component {
    val io = new Bundle {
        val Start = in Bool()
        val compute_fifo_ready = in Bool()
        val M_Ready = in Bool()
        val Compute_Complete = out Bool() setAsReg() init(False)
        val Conv_Complete = out Bool()
        val rd_en_fifo = out Bool() setAsReg() init(False)
        val M_Valid = out Bool()
        val weight_select = out Bits(3 bits) setAsReg() init(0)
    }



    val image_cmp_ctrl_fsm = new StateMachine{
        val IDLE = new State() with EntryPoint
        val Judge_Before_Fifo = new State()
        val Judge_After_Fifo = new State()
//        val Load_Weight = new State()
        val Compute = new State()
        val Judge_Row = new State()

        IDLE
            .whenIsActive{
                when(io.Start){
                    goto(Judge_Before_Fifo)
                } otherwise goto(IDLE)
            }
        Judge_Before_Fifo
            .whenIsActive{
                when(io.compute_fifo_ready){
                    goto(Judge_After_Fifo)
                } otherwise goto(Judge_Before_Fifo)
            }
        Judge_After_Fifo
            .whenIsActive{
                when(io.M_Ready){
                    goto(Compute)
                } otherwise goto(Judge_After_Fifo)
            }


    }

}
