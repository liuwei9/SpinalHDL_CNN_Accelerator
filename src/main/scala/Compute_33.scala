import spinal.core._
import spinal.lib._

class Compute_33(
                    REG_WIDTH: Int,
                    S_DATA_WIDTH: Int,
                    PARA_DATA_WIDTH: Int,
                    M_DATA_WIDTH: Int,
                    DATA_WIDTH: Int,
                    ROW_COL_DATA_COUNT_WIDTH: Int,
                    CHANNEL_NUM_WIDTH: Int,
                    ZERO_NUM_WIDTH: Int,
                    DATA_GENERATE_MEM_DEPTH: Int
                ) extends Component {

    val io = new Bundle {
        //        val Conv_Complete = out Bool()
        //        val Stride_Complete = out Bool()
        //        val Write_Block_Complete = out Bool()
        val Sign = in Bits (3 bits)
        val Reg_4 = in Bits (REG_WIDTH bits)
        val Reg_5 = in Bits (REG_WIDTH bits)
        val Reg_6 = in Bits (REG_WIDTH bits)
        val Reg_7 = in Bits (REG_WIDTH bits)
        val S_DATA = slave Stream Bits(S_DATA_WIDTH bits)
        //        val para_data = slave Stream Bits(PARA_DATA_WIDTH bits)
        //        val M_DATA = master Stream Bits(M_DATA_WIDTH bits)
        //        val Start_Pa = in Bool()
        val Start_Cu = in Bool()
        //        val Last_33 = out Bool()

        val M_DATA = out Bits (M_DATA_WIDTH bits)
        val M_DATA_Valid = out Bits (9 bits)
        val M_DATA_Ready = in Bool()
    }
    noIoPrefix()
    val Cu_Instruction_reg = Bits(REG_WIDTH * 4 bits) setAsReg()
    val Cu_Instruction = Bits(REG_WIDTH * 4 bits) setAsReg()
    Cu_Instruction_reg := RegNext(io.Reg_7 ## io.Reg_6 ## io.Reg_5 ## io.Reg_4)
    val Para_Instruction_reg = Bits(REG_WIDTH * 2 bits) setAsReg()
    val Para_Instruction = Bits(REG_WIDTH * 2 bits) setAsReg()
    Para_Instruction_reg := RegNext(io.Reg_4 ## io.Reg_5)
    switch(io.Sign) {
        is(1) {
            Cu_Instruction := Cu_Instruction_reg
        }
        is(2) {
            Para_Instruction := Para_Instruction_reg
        }
        default {
            Cu_Instruction := Cu_Instruction
            Para_Instruction := Para_Instruction
        }
    }
    val Zero_Point_REG1 = Cu_Instruction(127 downto 120)
    val Zero_Point_REG3 = Cu_Instruction(119 downto 112)
    val EN_Cin_Select_REG = Cu_Instruction(63)
    val Padding_REG = Cu_Instruction(62)
    val Stride_REG = Cu_Instruction(61)
    val Zero_Num_REG = Cu_Instruction(60 downto 58)
    val Row_Num_In_REG = Cu_Instruction(42 downto 32)
    val Channel_In_Num_REG = Cu_Instruction(31 downto 22)
    val Row_Num_Out_REG = Cu_Instruction(21 downto 11)
    val Channel_Out_Num_REG = Cu_Instruction(9 downto 0)
    val Weight_Num_REG = Para_Instruction(62 downto 48)
    val Bias_Num_REG = Para_Instruction(47 downto 40)

    val AFTER_DATA_GENERATE_WIDTH = S_DATA_WIDTH * 9
    val data_generate = new data_generate(S_DATA_WIDTH, AFTER_DATA_GENERATE_WIDTH, ROW_COL_DATA_COUNT_WIDTH, CHANNEL_NUM_WIDTH, DATA_WIDTH, ZERO_NUM_WIDTH, DATA_GENERATE_MEM_DEPTH)
    data_generate.io.S_DATA <> io.S_DATA
    data_generate.io.Row_Num_In_REG <> Row_Num_In_REG
    data_generate.io.Padding_REG <> Padding_REG
    data_generate.io.Zero_Point_REG <> Zero_Point_REG1
    data_generate.io.Zero_Num_REG <> Zero_Num_REG
    data_generate.io.Channel_In_Num_REG <> Channel_In_Num_REG
    data_generate.io.EN_Cin_Select_REG <> EN_Cin_Select_REG
    data_generate.io.M_DATA <> io.M_DATA
    data_generate.io.M_DATA_Ready <> io.M_DATA_Ready
    data_generate.io.M_DATA_Valid <> io.M_DATA_Valid
    data_generate.io.Start <> io.Start_Cu
    //data_generate.io.RowNum_After_Padding

}

object Compute_33 {
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            defaultConfigForClockDomains = ClockDomainConfig(clockEdge = RISING, resetKind = SYNC),
            oneFilePerComponent = true,
            headerWithDate = true,
            targetDirectory = "verilog"

        )generateVerilog(new Compute_33(32,64,64,64*9,8,11,10,3,2048))
    }
}
