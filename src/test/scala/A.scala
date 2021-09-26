import spinal.core._
import spinal.lib._
import xmemory._

class A(K: Int) extends Component {
    if(K == 1){
        val t = in Bool()
        val m = out Bool()
        m := t
    } else {
        val t = in Bits (1 bits)
        val m = out Bits ()
        m := B"2'd1"
    }

}

object A {
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new A(1))
    }
}
