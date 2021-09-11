import spinal.core._
import spinal.lib._
class Compute_33Weignt(
                          WEIGHT_DATA_WIDTH: Int,
                          WEIGHT_ADDR_WIDTH: Int,
                          KERNEL_NUM: Int,
                          PARA_DATA_WIDTH: Int
                      ) extends Component {

    val io = new Bundle{
        val weight_data_One = in Bits(PARA_DATA_WIDTH bits)
        val weight_data_Two = in Bits(PARA_DATA_WIDTH bits)
        val weight_data_Three = in Bits(PARA_DATA_WIDTH bits)
        val weight_wr = in Bits(KERNEL_NUM bits)
        val weight_addra = in Bits(WEIGHT_ADDR_WIDTH bits)
        val weight_addrb = in Bits(WEIGHT_ADDR_WIDTH bits)
        val weight_ram_data_out = out Bits(WEIGHT_DATA_WIDTH bits)
    }
}
