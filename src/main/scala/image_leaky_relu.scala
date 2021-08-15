import spinal.core._

class image_leaky_relu(
                          S_DATA_WIDTH: Int,
                          ZERO_POINT_WIDTH: Int,
                          M_DATA_WIDTH: Int,
                          COMPUTE_CHANNEL_OUT_NUM: Int
                      ) extends Component {
    val io = new Bundle {
        val data_in = in Bits (S_DATA_WIDTH bits)
        val zero_data_in = in Bits (ZERO_POINT_WIDTH bits)
        val data_out = out Bits (M_DATA_WIDTH bits)
    }
    noIoPrefix()
    for (i <- 0 until COMPUTE_CHANNEL_OUT_NUM) {

    }
}
