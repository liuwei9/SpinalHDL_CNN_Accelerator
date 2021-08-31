import spinal.core._
import spinal.lib._
import spinal.lib.fsm._
import xmemory.sdpram

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
    val count_mult = new mul(ROW_COL_DATA_COUNT_WIDTH, Channel_Times.getWidth, ROW_COL_DATA_COUNT_WIDTH, false)
    count_mult.io.A := io.Row_Num_After_Padding
    count_mult.io.B := Channel_Times.asBits


    val fifo = new general_fifo_sync(S_DATA_WIDTH, S_DATA_WIDTH, MEMORY_DEPTH, ROW_COL_DATA_COUNT_WIDTH)
    fifo.io.data_in <> io.S_DATA.payload
    fifo.io.wr_en <> io.S_DATA.valid
    fifo.io.data_in_ready <> io.S_DATA.ready
    fifo.io.m_data_count <> count_mult.io.P.asUInt
    fifo.io.s_data_count <> count_mult.io.P.asUInt

    val ram1 = new sdpram(S_DATA_WIDTH, MEMORY_DEPTH, S_DATA_WIDTH, MEMORY_DEPTH, "distributed", 0, clka = this.clockDomain, clkb = this.clockDomain)
    val ram2 = new sdpram(S_DATA_WIDTH, MEMORY_DEPTH, S_DATA_WIDTH, MEMORY_DEPTH, "distributed", 0, clka = this.clockDomain, clkb = this.clockDomain)
    val ram3 = new sdpram(S_DATA_WIDTH, MEMORY_DEPTH, S_DATA_WIDTH, MEMORY_DEPTH, "distributed", 0, clka = this.clockDomain, clkb = this.clockDomain)
    val ram4 = new sdpram(S_DATA_WIDTH, MEMORY_DEPTH, S_DATA_WIDTH, MEMORY_DEPTH, "distributed", 0, clka = this.clockDomain, clkb = this.clockDomain)
    ram1.io.addrb <> io.M_Addr.asBits.resized
    ram2.io.addrb <> io.M_Addr.asBits.resized
    ram3.io.addrb <> io.M_Addr.asBits.resized
    ram4.io.addrb <> io.M_Addr.asBits.resized

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

        val Cnt_Cin = UInt(CHANNEL_NUM_WIDTH bits) setAsReg()
        val EN_Last_Cin = Bool()
        when(Cnt_Cin === Channel_Times - 1) {
            EN_Last_Cin := True
        } otherwise {
            EN_Last_Cin := False
        }
        when(isActive(Read)) {
            when(EN_Last_Cin) {
                Cnt_Cin := 0
            } otherwise {
                Cnt_Cin := Cnt_Cin + 1
            }
        } otherwise {
            Cnt_Cin := 0
        }

        val Cnt_Column = UInt(ROW_COL_DATA_COUNT_WIDTH bits) setAsReg()
        val EN_Read_State = Bool()
        when(Cnt_Column === io.Row_Num_After_Padding - 1) {
            EN_Read_State := True
        } otherwise {
            EN_Read_State := False
        }
        when(isActive(Read)) {
            when(EN_Last_Cin) {
                Cnt_Column := Cnt_Column + 1
            } otherwise {
                Cnt_Column := Cnt_Column
            }
        } otherwise {
            Cnt_Column := 0
        }


        val Cnt_Ram = UInt(2 bits) setAsReg() init 0
        when(isEntering(Judge_Compute)) {
            Cnt_Ram := Cnt_Ram + 1
        } elsewhen isEntering(Start_Compute) {
            Cnt_Ram := Cnt_Ram - 1
        } otherwise (Cnt_Ram := Cnt_Ram)


        IDLE
            .whenIsActive {
                when(io.Start) {
                    goto(INIT)
                } otherwise goto(IDLE)
            }
        INIT
            .whenIsActive {
                when(init_en) {
                    goto(Judge_Fifo)
                } otherwise goto(INIT)
            }
        Judge_Fifo
            .whenIsActive {
                when(fifo.io.data_out_valid) {
                    goto(Read)
                } otherwise goto(Judge_Fifo)
            }
        Read
            .whenIsActive {
                when(EN_Read_State && EN_Last_Cin) {
                    goto(Judge_Compute)
                } otherwise goto(Read)
            }
        Judge_Compute
            .whenIsActive {
                when(Cnt_Ram === 3) {
                    when(io.M_Ready) {
                        goto(Start_Compute)
                    } otherwise goto(Judge_Compute)

                } otherwise goto(Judge_Fifo)
            }
        Start_Compute
            .whenIsActive {

            }

    }
}
