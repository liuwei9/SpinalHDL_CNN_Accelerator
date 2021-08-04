import spinal.core._

class mul(
             A_WIDTH: Int,
             B_WIDTH: Int
         ) extends Component {

    val io = new Bundle {
        val A = in Bits (A_WIDTH bits)
        val B = in Bits (B_WIDTH bits)
        val P = out Bits ((A_WIDTH + B_WIDTH) bits)

    }
    noIoPrefix()
        val A_q = io.A.asUInt
        A_q.addAttribute("use_dsp", "yes")
        val B_q = io.B.asUInt
        B_q.addAttribute("use_dsp", "yes")
        val A_qq = RegNext(A_q)
        A_qq.addAttribute("use_dsp", "yes")
        val B_qq = RegNext(B_q)
        B_qq.addAttribute("use_dsp", "yes")
        val P_q = RegNext(A_qq * B_qq)
        P_q.addAttribute("use_dsp", "yes")
        val P_qq = RegNext(P_q)
        P_qq.addAttribute("use_dsp", "yes")
        io.P <> P_qq.asBits

}

object mul {
    def main(args: Array[String]): Unit = {
        SpinalVerilog(new mul(8, 8))
    }
}
