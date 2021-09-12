import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class load_weight(
                     KERNEL_NUM: Int,
                     WEIGHT_NUM_WIDTH: Int,
                     WEIGHT_ADDR_WIDTH: Int,
                     BIAS_NUM_WIDTH: Int,
                     PARA_DATA_WIDTH: Int,
                     WEIGHT_DATA_WIDTH: Int,
                     BIAS_DATA_WIDTH: Int,
                     SCALE_DATA_WIDTH: Int,
                     SHIFT_DATA_WIDTH: Int,
                     WEIGHT_MEM_WRITE_DEPTH: Int
                 ) extends Component {
    val io = new Bundle {
        val Start_Pa = in Bool()
        val Weight_Single_Num_REG = in Bits (WEIGHT_NUM_WIDTH bits)
        val Bias_Num_REG = in Bits (BIAS_NUM_WIDTH bits)
        val Write_Block_Complete = out Bool() setAsReg()
        val S_Para_Data = slave Stream Bits(PARA_DATA_WIDTH bits)
        val Weight_Addrb = in Bits (WEIGHT_ADDR_WIDTH bits)
        val Data_Out_Weight = out Vec(Bits(WEIGHT_DATA_WIDTH bits), KERNEL_NUM)
        val Bias_Addrb = out Bits (BIAS_NUM_WIDTH bits)
        val Data_Out_Bias = out Bits (BIAS_DATA_WIDTH bits)
        val Data_Out_Scale = out Bits (SCALE_DATA_WIDTH bits)
        val Data_Out_Shift = out Bits (SHIFT_DATA_WIDTH bits)
    }
    noIoPrefix()
    io.S_Para_Data.ready.setAsReg() init (False)

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

        when(isEntering(Copy_Weight)) {
            io.S_Para_Data.ready := True
        } elsewhen (isEntering(IDLE) && isActive(Copy_Shift)) {
            io.S_Para_Data.ready := False
        } otherwise {
            io.S_Para_Data.ready := io.S_Para_Data.ready
        }
        when(isEntering(IDLE) && isActive(Copy_Shift)) {
            io.Write_Block_Complete := True
        } otherwise {
            io.Write_Block_Complete := False
        }

        val En_Weight_Nine_Temp = Bits(KERNEL_NUM bits) setAsReg()
        when(isActive(IDLE)) {
            En_Weight_Nine_Temp := 1
        } elsewhen isActive(Copy_Weight) {
            when(En_Single_Ram_Temp) {
                En_Weight_Nine_Temp := En_Weight_Nine_Temp(KERNEL_NUM - 2 downto (0)) ## En_Weight_Nine_Temp(KERNEL_NUM - 1)
            } otherwise {
                En_Weight_Nine_Temp := En_Weight_Nine_Temp
            }
        } otherwise {
            En_Weight_Nine_Temp := 1
        }
        val En_Wr_Weight = Bool() setAsReg()
        when(isActive(Copy_Weight)) {
            when(io.S_Para_Data.valid) {
                En_Wr_Weight := True
            } otherwise {
                En_Wr_Weight := False
            }
        } otherwise {
            En_Wr_Weight := False
        }
        val En_Weight_Nine = Bits(KERNEL_NUM bits)
        when(En_Wr_Weight) {
            En_Weight_Nine := En_Weight_Nine_Temp
        } otherwise {
            En_Weight_Nine := 0
        }
        val Weight_Addra_Temp = UInt(WEIGHT_ADDR_WIDTH bits) setAsReg()
        when(isActive(Copy_Weight)) {
            when(En_Single_Ram) {
                Weight_Addra_Temp := 0
            } elsewhen io.S_Para_Data.valid {
                Weight_Addra_Temp := Weight_Addra_Temp + 1
            } otherwise {
                Weight_Addra_Temp := Weight_Addra_Temp
            }
        } otherwise {
            Weight_Addra_Temp := 0
        }
        val Weight_Addra = RegNext(Weight_Addra_Temp.asBits)
        val S_Data_One = RegNext(io.S_Para_Data.payload)
        val Compute_3_3_Weight = new Compute_33Weight(WEIGHT_DATA_WIDTH, WEIGHT_ADDR_WIDTH, KERNEL_NUM, PARA_DATA_WIDTH, WEIGHT_MEM_WRITE_DEPTH)
        Compute_3_3_Weight.io.weight_wr <> En_Weight_Nine
        Compute_3_3_Weight.io.weight_addra <> Weight_Addra
        Compute_3_3_Weight.io.weight_data_One <> S_Data_One
        Compute_3_3_Weight.io.weight_addrb <> io.Weight_Addrb
        Compute_3_3_Weight.io.weight_ram_data_out <> io.Data_Out_Weight


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
            .whenIsActive {
                when(En_Weight) {
                    goto(Copy_Scale)
                } otherwise {
                    goto(Copy_Bias)
                }
            }
        Copy_Scale
            .whenIsActive {
                when(En_Weight) {
                    goto(Copy_Shift)
                } otherwise {
                    goto(Copy_Scale)
                }
            }
        Copy_Shift
            .whenIsActive {
                when(En_Weight) {
                    goto(IDLE)
                } otherwise {
                    goto(Copy_Shift)
                }
            }
    }

}
