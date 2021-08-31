import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class four2three(
                    S_DATA_WIDTH: Int,
                    M_DATA_WIDTH: Int,
                    CHANNEL_NUM_WIDTH: Int,
                    ROW_COL_DATA_COUNT_WIDTH: Int,
                    MEMORY_DEPTH: Int
                ) extends Component {
    val io = new Bundle {
        val Start = in Bool()
        val StartRow = out Bool() setAsReg() init False
        val Row_Num_After_Padding = in UInt (ROW_COL_DATA_COUNT_WIDTH bits)
        val S_DATA = slave Stream Bits(S_DATA_WIDTH bits)
        val M_DATA = out Bits (S_DATA_WIDTH * 3 bits) setAsReg() init 0
        val M_Ready = in Bool()
        val M_Valid = out Bool() setAsReg() init False
        val M_rd_en = in Bool()
        val M_Addr = in UInt (ROW_COL_DATA_COUNT_WIDTH bits)
        val Channel_In_Num_REG = in Bits (CHANNEL_NUM_WIDTH bits)
    }
    noIoPrefix()
    val Channel_Times = io.Channel_In_Num_REG.asUInt >> 3
    val count_mult = new mul(ROW_COL_DATA_COUNT_WIDTH, Channel_Times.getWidth, ROW_COL_DATA_COUNT_WIDTH,false)
    count_mult.io.A := io.Row_Num_After_Padding
    count_mult.io.B := Channel_Times.asBits


    val fifo = new general_fifo_sync(S_DATA_WIDTH,S_DATA_WIDTH,MEMORY_DEPTH,ROW_COL_DATA_COUNT_WIDTH)
    fifo.io.data_in <> io.S_DATA.payload
    fifo.io.wr_en <> io.S_DATA.valid
    fifo.io.data_in_ready <> io.S_DATA.ready
    fifo.io.m_data_count <> count_mult.io.P.asUInt
    fifo.io.s_data_count <> count_mult.io.P.asUInt


    val f2t_fsm = new StateMachine {
        val IDLE = new State() with EntryPoint
        val INIT = new State()
        val Judge_Fifo = new State()
        val Read = new State()
        val Judge_Compute = new State()
        val Start_Compute = new State()
        val Wait_End = new State()


        val wait_cnt = UInt(6 bits) setAsReg()
        when(isActive(INIT)) {
            wait_cnt := wait_cnt + 1
        } otherwise {
            wait_cnt := 0
        }
        val init_en = Bool()
        when(wait_cnt === 5) {
            init_en := True
        } otherwise {
            init_en := False
        }



        IDLE
            .whenIsActive {
                when(io.Start) {
                    goto(INIT)
                } otherwise goto(IDLE)
            }
        INIT
            .whenIsActive{
                when(init_en){
                    goto(Judge_Fifo)
                } otherwise goto(INIT)
            }
        Judge_Fifo
            .whenIsActive{
                when(fifo.io.data_out_valid){
                    goto(Read)
                } otherwise goto(Judge_Fifo)
            }
    }
}
