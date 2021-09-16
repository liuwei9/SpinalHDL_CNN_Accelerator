import spinal.core._
import spinal.lib._
import xmemory._
class A extends Component {
//    val io = new Bundle{
//        val data_in = slave Stream UInt(8 bits)
//        val data_out = master Stream UInt(12 bits)
//
//    }
//    val cnt = UInt(3 bits)
//    when(io.data_in.valid && io.data_in.ready){
//        cnt := cnt + 1
//    }
//    when(cn)
   val data_ram =  new sdpram(64,409600,64,409600,"distributed",0,"common_clock",this.clockDomain,this.clockDomain)
}
object A{
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new A)
    }
}
