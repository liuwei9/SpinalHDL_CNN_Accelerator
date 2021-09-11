import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class load_weight(
                     KERNEL_NUM: Int,
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

    val fsm = new StateMachine {
        val IDLE = new State() with EntryPoint
        val Copy_Weight = new State()
        val Copy_Bias = new State()
        val Copy_Scale = new State()
        val Copy_Shift = new State()


        val Cnt_Single_Weight = UInt(WEIGHT_NUM_WIDTH bits) setAsReg()
        val En_Single_Ram = Bool()
        val En_Single_Ram_Temp = Bool() setAsReg()
        //看一眼生成的Verilog
        when(Cnt_Single_Weight === io.Weight_Single_Num_REG.asUInt - 1) {
            En_Single_Ram := True
            En_Single_Ram_Temp := True
        } otherwise {
            En_Single_Ram := False
            En_Single_Ram_Temp := False
        }
        when(isActive(Copy_Weight)) {
            when(En_Single_Ram) {
                Cnt_Single_Weight := 0
            } elsewhen io.S_Para_Data.valid {
                Cnt_Single_Weight := Cnt_Single_Weight + 1
            } otherwise {
                Cnt_Single_Weight := Cnt_Single_Weight
            }
        } otherwise {
            Cnt_Single_Weight := 0
        }

        val Cnt_Ram_Weight_Num = UInt(KERNEL_NUM bits) setAsReg()
        when(isActive(Copy_Weight)) {
            when(En_Single_Ram) {
                Cnt_Ram_Weight_Num := Cnt_Ram_Weight_Num + 1
            } otherwise {
                Cnt_Ram_Weight_Num := Cnt_Ram_Weight_Num
            }
        } otherwise {
            Cnt_Ram_Weight_Num := 0
        }

        val En_Weight = Bool()
        when(Cnt_Single_Weight === io.Weight_Single_Num_REG.asUInt - 1 && Cnt_Ram_Weight_Num === KERNEL_NUM - 1) {
            En_Weight := True
        } otherwise {
            En_Weight := False
        }

        val Cnt_Bias = UInt(BIAS_NUM_WIDTH bits) setAsReg()
        val En_Bias = Bool()
        when(Cnt_Bias === io.Bias_Num_REG.asUInt - 1) {
            En_Bias := True
        } otherwise {
            En_Bias := False
        }
        when(isActive(Copy_Bias)) {
            when(En_Bias) {
                Cnt_Bias := 0
            } elsewhen io.S_Para_Data.valid {
                Cnt_Bias := Cnt_Bias + 1
            } otherwise {
                Cnt_Bias := Cnt_Bias
            }
        } elsewhen isActive(Copy_Scale) {
            when(En_Bias) {
                Cnt_Bias := 0
            } elsewhen io.S_Para_Data.valid {
                Cnt_Bias := Cnt_Bias + 1
            } otherwise {
                Cnt_Bias := Cnt_Bias
            }
        } elsewhen isActive(Copy_Shift) {
            when(En_Bias) {
                Cnt_Bias := 0
            } elsewhen io.S_Para_Data.valid {
                Cnt_Bias := Cnt_Bias + 1
            } otherwise {
                Cnt_Bias := Cnt_Bias
            }
        } otherwise {
            Cnt_Bias := 0
        }


        IDLE
            .whenIsActive {
                when(io.Start_Pa) {
                    goto(Copy_Weight)
                } otherwise {
                    goto(IDLE)
                }
            }
        Copy_Weight
            .whenIsActive {
                when(En_Weight) {
                    goto(Copy_Bias)
                } otherwise {
                    goto(Copy_Weight)
                }
            }
        Copy_Bias
            .whenIsActive{
                when(En_Weight) {
                    goto(Copy_Scale)
                } otherwise {
                    goto(Copy_Bias)
                }
            }
        Copy_Scale
            .whenIsActive{
                when(En_Weight) {
                    goto(Copy_Shift)
                } otherwise {
                    goto(Copy_Scale)
                }
            }
        Copy_Shift
            .whenIsActive{
                when(En_Weight) {
                    goto(IDLE)
                } otherwise {
                    goto(Copy_Shift)
                }
            }
    }

}
