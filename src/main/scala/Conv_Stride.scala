import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class Conv_Stride(
                     S_DATA_WIDTH: Int,
                     ROW_COL_DATA_COUNT_WIDTH: Int,
                     CHANNEL_NUM_WIDTH: Int,
                     CHANNEL_OUT_NUM: Int
                 ) extends Component {

    val io = new Bundle {
        val Start = in Bool()
        val EN_Stride_REG = in Bool()
        val S_DATA = slave Stream Bits(S_DATA_WIDTH bits)
        val M_DATA = master Stream Bits(S_DATA_WIDTH bits)
        val Row_Num_Out_REG = in Bits (ROW_COL_DATA_COUNT_WIDTH bits)
        val Channel_Out_Num_REG = in Bits (CHANNEL_NUM_WIDTH bits)
    }
    noIoPrefix()

    val EN_Stride = Bool()
    val Start_reg = Delay(io.Start, 2)
    when(Start_reg && io.EN_Stride_REG) {
        EN_Stride := True
    } otherwise {
        EN_Stride := False
    }

    val Channel_Times = io.Channel_Out_Num_REG >> log2Up(CHANNEL_OUT_NUM)

    val fsm = new StateMachine {
        val IDLE = new State() with EntryPoint
        val Stride = new State()


        val Cnt_Cin = UInt(CHANNEL_NUM_WIDTH bits) setAsReg()
        val En_Cin = Bool()
        when(Cnt_Cin === Channel_Times.asUInt - 1) {
            En_Cin := True
        } otherwise {
            En_Cin := False
        }
        when(isActive(Stride)) {
            when(io.S_DATA.valid) {
                when(En_Cin) {
                    Cnt_Cin := 0
                } otherwise {
                    Cnt_Cin := Cnt_Cin + 1
                }
            } otherwise {
                Cnt_Cin := Cnt_Cin
            }
        } otherwise {
            Cnt_Cin := 0
        }

        val Cnt_Col = UInt(ROW_COL_DATA_COUNT_WIDTH bits) setAsReg()
        val En_Col = Bool()
        when(Cnt_Col === io.Row_Num_Out_REG.asUInt - 1) {
            En_Col := True
        } otherwise {
            En_Col := False
        }
        when(isActive(Stride)) {
            when(io.S_DATA.valid) {
                when(En_Col && En_Cin) {
                    Cnt_Col := 0
                } elsewhen En_Cin {
                    Cnt_Col := Cnt_Col + 1
                } otherwise {
                    Cnt_Col := Cnt_Col
                }
            } otherwise {
                Cnt_Col := Cnt_Col
            }
        } otherwise {
            Cnt_Col := 0
        }

        val Cnt_Row = UInt(ROW_COL_DATA_COUNT_WIDTH bits) setAsReg()
        val En_Row = Bool()
        when(Cnt_Row === io.Row_Num_Out_REG.asUInt - 1) {
            En_Row := True
        } otherwise {
            En_Row := False
        }
        when(isActive(Stride)) {
            when(En_Col && En_Cin) {
                Cnt_Row := Cnt_Row + 1
            } otherwise {
                Cnt_Row := Cnt_Row
            }
        } otherwise {
            Cnt_Row := 0
        }


        val Valid_Out = Bool() setAsReg()
        when(isActive(Stride)) {
            when(!Cnt_Col.asBits(0) && (!Cnt_Row.asBits(0)) && io.S_DATA.valid) {
                Valid_Out := True
            } otherwise {
                Valid_Out := False
            }
        } otherwise {
            Valid_Out := False
        }


        IDLE
            .whenIsActive {
                when(EN_Stride) {
                    goto(Stride)
                } otherwise {
                    goto(IDLE)
                }
            }
        Stride
            .whenIsActive {
                when(En_Row && En_Col && En_Cin) {
                    goto(IDLE)
                } otherwise {
                    goto(Stride)
                }
            }
    }

}
