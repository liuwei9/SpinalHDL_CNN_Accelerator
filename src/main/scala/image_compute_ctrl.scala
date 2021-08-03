import spinal.core._
import spinal.lib.fsm._

class image_compute_ctrl(
                            ROW_COL_DATA_COUNT_WIDTH :Int,
                            FEATURE_MAP_SIZE: Int
                        ) extends Component {
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

        val En_Compute_Column = Bool()
        val COMPUTE_TIMES_CHANNEL_OUT_REG = U"3'b100"
        val Cnt_Channel_Out_Num = UInt(3 bits) setAsReg() init 0
        val Cnt_Column = UInt(ROW_COL_DATA_COUNT_WIDTH bits) setAsReg() init 0
        when(isActive(Compute)){
            when(Cnt_Channel_Out_Num === COMPUTE_TIMES_CHANNEL_OUT_REG -1){
                Cnt_Channel_Out_Num := 0
            } otherwise{
                Cnt_Channel_Out_Num := Cnt_Channel_Out_Num + 1
            }
        } otherwise{
            Cnt_Channel_Out_Num := 0
        }
        when(isActive(Compute)){
            when(Cnt_Channel_Out_Num === COMPUTE_TIMES_CHANNEL_OUT_REG -1){
                io.rd_en_fifo := True
                Cnt_Column := Cnt_Column + 1
            } otherwise{
                io.rd_en_fifo := False
                Cnt_Column := Cnt_Column
            }
        } otherwise{
            io.rd_en_fifo := False
            Cnt_Channel_Out_Num := 0
        }
        when((Cnt_Channel_Out_Num === COMPUTE_TIMES_CHANNEL_OUT_REG - 1) && (Cnt_Column === FEATURE_MAP_SIZE - 3)){
            En_Compute_Column := True
        } otherwise {
            En_Compute_Column := False
        }
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
        Compute
            .whenIsActive{
                when(En_Compute_Column){
                    goto(Judge_Row)
                } otherwise goto(Compute)
            }

    }

}
