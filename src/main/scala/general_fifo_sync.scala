import spinal.core._
import xfifo.fifo_sync

import scala.math.pow
class general_fifo_sync(
                           DATA_WIDTH: Int,
                           MEMORY_DEPTH: Int
                  ) extends Component {
    val fifo_width = DATA_WIDTH
    val fifo_depth = pow(2, log2Up(MEMORY_DEPTH)).toInt
    val fifo = new fifo_sync(fifo_width, fifo_depth, fifo_width, 0, "block", "fwft")
    val io = new Bundle {
        val data_in = in Bits (DATA_WIDTH bits)
        val wr_en = in Bool()
        val data_in_ready = out(Reg(Bool()) init (False))

        val data_out = out Bits (DATA_WIDTH bits)
        val rd_en = in Bool()
        val data_out_valid = out(Reg(Bool()) init (False))
    }
    noIoPrefix()
    fifo.io.wr_en <> io.wr_en
    fifo.io.rd_en <> io.rd_en
    fifo.io.din <> io.data_in
    fifo.io.dout <> io.data_out
    when((!fifo.io.wr_rst_busy) && (U(fifo.io.wr_data_count) < (if (fifo_depth > 10) (fifo_depth - 10) else fifo_depth)) && (!fifo.io.full)) {
        io.data_in_ready := True
    } otherwise (
        io.data_in_ready := False
        )
    when((!fifo.io.rd_rst_busy) && (U(fifo.io.rd_data_count) >= MEMORY_DEPTH)) {
        io.data_out_valid := True
    } otherwise (
        io.data_out_valid := False
        )


}
