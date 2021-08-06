import spinal.core._
import spinal.lib._
class mul_add_simd(
                      KERNEL_NUM: Int,
                      S_DATA_WIDTH: Int,
                      M_DATA_WIDTH: Int
                  ) extends Component {
    val io = new Bundle {
        val dataIn = in Bits (S_DATA_WIDTH bits)
        val weightIn = in Bits (S_DATA_WIDTH bits)
        val dataOut = out UInt  (M_DATA_WIDTH bits)
    }
    noIoPrefix()
    val mul_data_out =  Vec(UInt(M_DATA_WIDTH bits),KERNEL_NUM)
    var mul_list: List[mul_simd] = Nil
    for (_ <- 0 until KERNEL_NUM) {
        mul_list = new mul_simd(S_DATA_WIDTH / KERNEL_NUM, M_DATA_WIDTH) :: mul_list
    }
    mul_list = mul_list.reverse
    for (i <- 0 until KERNEL_NUM) {
        mul_list(i).io.data_in <> io.dataIn(((i + 1) * (S_DATA_WIDTH / KERNEL_NUM) - 1) downto (i * (S_DATA_WIDTH / KERNEL_NUM)))
        mul_list(i).io.weight_in <> io.weightIn(((i + 1) * (S_DATA_WIDTH / KERNEL_NUM) - 1) downto (i * (S_DATA_WIDTH / KERNEL_NUM)))
        mul_data_out(i) := mul_list(i).io.data_out.asUInt

    }
    io.dataOut := mul_data_out.reduceBalancedTree(_+_)
}

object mul_add_simd {
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new mul_add_simd(9, 72, 20))
    }
}