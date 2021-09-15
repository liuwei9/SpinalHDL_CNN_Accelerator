import spinal.core._
import spinal.lib._
class A extends Component {
    val io = new Bundle{
        val data_in = slave Stream UInt(8 bits)
        val data_out = master Stream UInt(12 bits)

    }
    val cnt = UInt(3 bits)
    when(io.data_in.valid && io.data_in.ready){
        cnt := cnt + 1
    }
    when(cn)
}
object A{
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new A)
    }
}
