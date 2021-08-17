package xip

import spinal.core._

class xsub(
              A_WIDTH:Int,
              B_WIDTH:Int,
              S_WIDTH:Int,
              clk:ClockDomain
          ) extends BlackBox {
    val io = new Bundle{
        val A = in Bits(A_WIDTH bits)
        val B = in Bits(B_WIDTH bits)
        val S = out Bits(S_WIDTH bits)
        val CLK = in Bool()
    }
    noIoPrefix()
    mapClockDomain(clk ,io.CLK)
//    this.setDefinitionName("b")
//    this.setBlackBoxName("b")
//    this.setName("b")
//
//    override def setDefinitionName(name: String): xsub.this.type = super.setDefinitionName(name+"b")
}
