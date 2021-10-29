import spinal.core.{Area, Bool, False, IntToBuilder, Reg, True, UInt, when}

case class counter(en: Bool, width: Int, cnt: UInt) extends Area {
    val count = Reg(UInt(width bits)) init 0
    val valid = Bool()
    when(count === cnt - 1) {
        valid := True
    } otherwise {
        valid := False
    }
    when(en) {
        count := count + 1
        when(valid) {
            count := 0
        }
    }

    def clear = {
        count := 0
        valid := False
    }
}

