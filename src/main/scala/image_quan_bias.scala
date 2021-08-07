import spinal.core._
import spinal.lib._
class image_quan_bias (
                          FEATURE_MAP_SIZE:Int,
                          S_DATA_WIDTH: Int,
                          ROW_COL_DATA_COUNT_WIDTH:Int,
                          CHANNEL_OUT_TIMES:Int
                      )extends Component {
    val io = new Bundle{
        val S_DATA = slave Stream Bits(S_DATA_WIDTH bits)
        val rd_en_fifo = in Bool()
        val bias_data_in = in Bits(S_DATA_WIDTH bits)
        val fifo_valid = out Bool()
        val M_Data = out Bits(S_DATA_WIDTH bits)
    }
    noIoPrefix()
    val bias_fifo = new general_fifo_sync(S_DATA_WIDTH,FEATURE_MAP_SIZE*CHANNEL_OUT_TIMES,ROW_COL_DATA_COUNT_WIDTH)
    bias_fifo.io.data_in <> io.S_DATA.payload
    bias_fifo.io.wr_en <> io.S_DATA.valid
    bias_fifo.io.data_in_ready <> io.S_DATA.ready
    bias_fifo.io.rd_en <> io.rd_en_fifo
    bias_fifo.io.data_out_valid <> io.fifo_valid
    //后期改参数传
    bias_fifo.io.m_data_count <> FEATURE_MAP_SIZE*CHANNEL_OUT_TIMES
    val data_out_fifo_delay = Delay(bias_fifo.io.data_out,2)
}
