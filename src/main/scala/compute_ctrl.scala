import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class compute_ctrl(
                      WEIGHT_ADDR_WIDTH: Int,
                      WIDTH_TEMP_ADDR_SIZE: Int,
                      ROW_COL_DATA_COUNT_WIDTH: Int,
                      CHANNEL_NUM_WIDTH: Int
                  ) extends Component {

    val io = new Bundle {
        val Start_Cu = in Bool()
        val Compute_Complete = out Bool() setAsReg()
        val First_Compute_Complete = out Bool()
        val compute_fifo_ready = in Bool()
        val rd_en_fifo = out Bool() setAsReg()
        val M_ready = in Bool()
        val M_Valid = out Bool()
        val weight_addrb = out Bits (WEIGHT_ADDR_WIDTH bits)
        val ram_temp_read_address = out Bits (WIDTH_TEMP_ADDR_SIZE bits)
        val ram_temp_write_address = out Bits (WIDTH_TEMP_ADDR_SIZE bits) setAsReg()
        val COMPUTE_TIMES_CHANNEL_IN_REG = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val COMPUTE_TIMES_CHANNEL_IN_REG_8 = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val COMPUTE_TIMES_CHANNEL_OUT_REG = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val ROW_NUM_CHANNEL_OUT_REG = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val S_Count_Fifo = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val M_Count_Fifo = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)

    }
    noIoPrefix()

    val fsm = new StateMachine {
        val IDLE = new State() with EntryPoint
        val Wait = new State()
        val Judge_Before_Fifo = new State()
        val Judge_After_Fifo = new State()
        val Compute = new State()
        val Judge_Row = new State()


        val wait_cnt = UInt(5 bits) setAsReg()
        val wait_en = Bool()
        when(wait_cnt === 5) {
            wait_en := True
        } otherwise {
            wait_en := False
        }
        when(isActive(Wait)) {
            wait_cnt := wait_cnt + 1
        } otherwise {
            wait_cnt := 0
        }

        val Cnt_Channel_In_Num = UInt(CHANNEL_NUM_WIDTH bits) setAsReg()
        val Cnt_Channel_Out_Num = UInt(CHANNEL_NUM_WIDTH bits) setAsReg()
        when(isActive(Compute)) {
            when(Cnt_Channel_In_Num === io.COMPUTE_TIMES_CHANNEL_IN_REG.asUInt - 1) {
                Cnt_Channel_In_Num := 0
            } otherwise {
                Cnt_Channel_In_Num := Cnt_Channel_In_Num + 1
            }
        } otherwise {
            Cnt_Channel_In_Num := 0
        }
        when(isActive(Compute)) {
            when(Cnt_Channel_In_Num === io.COMPUTE_TIMES_CHANNEL_IN_REG.asUInt - 1) {
                when(Cnt_Channel_Out_Num === io.COMPUTE_TIMES_CHANNEL_OUT_REG.asUInt - 1) {
                    Cnt_Channel_Out_Num := 0
                } otherwise {
                    Cnt_Channel_Out_Num := Cnt_Channel_Out_Num + 1
                }
            } otherwise {
                Cnt_Channel_Out_Num := Cnt_Channel_Out_Num
            }
        } otherwise {
            Cnt_Channel_Out_Num := 0
        }

        IDLE
            .whenIsActive {
                when(io.Start_Cu) {
                    goto(Wait)
                } otherwise goto(IDLE)
            }
        Wait
            .whenIsActive {
                when(wait_en) {
                    goto(Judge_Before_Fifo)
                } otherwise goto(Wait)
            }
        Judge_Before_Fifo
            .whenIsActive {
                when(io.compute_fifo_ready) {
                    goto(Judge_After_Fifo)
                } otherwise goto(Judge_Before_Fifo)
            }
        Judge_After_Fifo
            .whenIsActive {
                when(io.M_ready) {
                    goto(Compute)
                } otherwise goto(Judge_After_Fifo)
            }
        Compute
            .whenIsActive {

            }
    }
}
