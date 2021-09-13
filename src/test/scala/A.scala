import spinal.core._
class A extends Component {
    val temp = Bits(128*9 bits)
    var fifo_list: List[general_fifo_sync] = Nil
    for (_ <- 0 until 9) {
        fifo_list = new general_fifo_sync(64, 128, 2048, 13) :: fifo_list
    }
    fifo_list = fifo_list.reverse

    for (i <- 0 until 9) {
        fifo_list(i).io.wr_en <> True
        fifo_list(i).io.data_in <> 0
        fifo_list(i).io.rd_en <> False
        fifo_list(i).io.m_data_count <> 0
        fifo_list(i).io.s_data_count <> 0
        val a = fifo_list(i).io.data_out.subdivideIn(64 bits).reverse
        val k = Bits(128 bits)
        for (j <- 0 until(128/64)){
            k((j+1)*64 - 1 downto(j*64)) := a(j)
        }
        temp((i + 1) * 128 - 1 downto (i * 128)) := k
    }
}
object A{
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new A)
    }
}
