import spinal.core.{Area, Bits, Bool, Bundle, Component, Device, False, IntToBuilder, Mem, Reg, RegInit, RegNext, SpinalEnum,  True, UInt, Vec, binaryOneHot, default, in, is, log2Up, out, switch, when}
import spinal.lib.{Flow, IMasterSlave, master, slave}

case class FeatureGenerateConfig(DATA_WIDTH: Int, PICTURE_NUM: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, KERNEL_NUM: Int, FEATURE_RAM_ADDR_WIDTH: Int, device: Device) {
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
}

case class FeaturePort(dataWidth: Int, kernelNum: Int) extends Bundle with IMasterSlave {
    val dataOut = Vec(Flow(Bits(dataWidth bits)), kernelNum)
    val ready = Bool()

    override def asMaster(): Unit = {
        out(dataOut)
        in(ready)
    }
}


object FeatureGenerateEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, WAIT2LINE, WRITE, END = newElement
}

case class FeatureGenerateFsm(start: Bool) extends Area {

    val initEnd = Bool()

    val writeLineDone = Bool()
    val wait2LineDone = Bool()
    val endDone = Bool()

    val currentState = Reg(FeatureGenerateEnum()) init FeatureGenerateEnum.IDLE
    val nextState = FeatureGenerateEnum()
    currentState := nextState
    switch(currentState) {
        is(FeatureGenerateEnum.IDLE) {
            when(start) {
                nextState := FeatureGenerateEnum.INIT
            } otherwise {
                nextState := FeatureGenerateEnum.IDLE
            }
        }
        is(FeatureGenerateEnum.INIT) {
            when(initEnd) {
                nextState := FeatureGenerateEnum.WAIT2LINE
            } otherwise {
                nextState := FeatureGenerateEnum.INIT
            }
        }
        is(FeatureGenerateEnum.WAIT2LINE) {
            when(writeLineDone) {
                nextState := FeatureGenerateEnum.END
            } otherwise {
                nextState := FeatureGenerateEnum.WAIT2LINE
            }
        }
        is(FeatureGenerateEnum.WRITE) {
            when(writeLineDone) {
                nextState := FeatureGenerateEnum.END
            } otherwise {
                nextState := FeatureGenerateEnum.WRITE
            }
        }
        is(FeatureGenerateEnum.END) {
            when(wait2LineDone) {
                nextState := FeatureGenerateEnum.WAIT2LINE
            } elsewhen (endDone) {
                nextState := FeatureGenerateEnum.IDLE
            } otherwise {
                nextState := FeatureGenerateEnum.WRITE
            }

        }
    }

}

class FeatureGenerate(featureGenerateConfig: FeatureGenerateConfig) extends Component {

    val io = new Bundle {
        val sData = slave Stream (Bits(featureGenerateConfig.STREAM_DATA_WIDTH bits))
        val mData = master(FeaturePort(featureGenerateConfig.STREAM_DATA_WIDTH, featureGenerateConfig.KERNEL_NUM))
        val rowNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val channelIn = in UInt (featureGenerateConfig.CHANNEL_WIDTH bits)
        val start = in Bool()
    }
    noIoPrefix()

    val fsm = FeatureGenerateFsm(io.start)
    val initEn = RegInit(False) setWhen (fsm.currentState === FeatureGenerateEnum.INIT) clearWhen (fsm.nextState =/= FeatureGenerateEnum.INIT)
    val initCount = counter(initEn, 5, 8)
    when(fsm.currentState === FeatureGenerateEnum.IDLE) {
        initCount.clear
    }
    fsm.initEnd := initCount.valid

    val wrEn = Vec(Bool(), 3)
    val wrAddr = Reg(UInt(featureGenerateConfig.FEATURE_RAM_ADDR_WIDTH bits)) init 0
    val wrData = Bits(featureGenerateConfig.STREAM_DATA_WIDTH bits)
    val rdData = Vec(Bits(featureGenerateConfig.STREAM_DATA_WIDTH bits), 3)
    val rdDataTemp = Vec(Bits(featureGenerateConfig.STREAM_DATA_WIDTH bits), 3)
    val rdAddr = UInt(featureGenerateConfig.FEATURE_RAM_ADDR_WIDTH bits)
    wrData := io.sData.payload
    val mem = Array.tabulate(3)((i) => {
        def gen(): Mem[Bits] = {
            val mem = Mem(Bits(featureGenerateConfig.STREAM_DATA_WIDTH bits), wordCount = scala.math.pow(2, featureGenerateConfig.FEATURE_RAM_ADDR_WIDTH).toInt)
            mem.write(wrAddr, wrData, wrEn(i))
            rdData(i) := mem.readSync(rdAddr)
            mem
        }

        gen()
    })
    for (i <- 0 until 9) {
        io.mData.dataOut(i).payload := rdDataTemp(i / 3)
    }

    private def selfClear(in: Bool, en: Bool): Unit = {
        when(en) {
            in := True
        } otherwise {
            in := False
        }
    }

    val validIn = io.sData.valid && io.sData.ready
    val channelInTimes = io.channelIn >> log2Up(featureGenerateConfig.COMPUTE_CHANNEL_NUM)
    val channelInEn = Bool()
    selfClear(channelInEn, validIn)
    val channelInCnt = counter(channelInEn, featureGenerateConfig.CHANNEL_WIDTH, channelInTimes)
    when(fsm.currentState === FeatureGenerateEnum.IDLE) {
        channelInCnt.clear
    }
    val columnInEn = Bool()
    selfClear(columnInEn, validIn && channelInCnt.valid)
    val columnInCnt = counter(columnInEn, featureGenerateConfig.FEATURE_WIDTH, io.rowNumIn)
    when(fsm.currentState === FeatureGenerateEnum.IDLE) {
        columnInCnt.clear
    }
    selfClear(fsm.writeLineDone, columnInCnt.valid && channelInCnt.valid)
    val rowInEn = Bool()
    selfClear(rowInEn, validIn && channelInCnt.valid && columnInCnt.valid)
    val rowInCnt = counter(rowInEn, featureGenerateConfig.FEATURE_WIDTH, io.rowNumIn)
    when(fsm.currentState === FeatureGenerateEnum.IDLE) {
        rowInCnt.clear
    }
    when(rowInCnt.count < 2) {
        fsm.wait2LineDone := True
    } otherwise {
        fsm.wait2LineDone := False
    }
    selfClear(fsm.endDone, columnInCnt.valid && channelInCnt.valid && rowInCnt.valid)
    val wrCnt = counter(rowInEn, 2, 3)
    when(fsm.currentState === FeatureGenerateEnum.IDLE) {
        wrCnt.clear
    }
    for (i <- 0 until 3) {
        wrEn(i) := (wrCnt.count === i) && validIn
    }
    io.sData.ready := (fsm.currentState === FeatureGenerateEnum.WAIT2LINE | fsm.currentState === FeatureGenerateEnum.WRITE) & io.mData.ready
    val addr = RegNext(io.rowNumIn * channelInTimes)
    when(validIn) {
        wrAddr := wrAddr + 1
        when(wrAddr === addr - 1) {
            wrAddr := 0
        }
    } elsewhen (wrAddr === addr - 1) {
        wrAddr := 0
    } elsewhen (fsm.currentState === FeatureGenerateEnum.IDLE) {
        wrAddr := 0
    }

    rdAddr := wrAddr
    switch(RegNext(wrCnt.count)) {
        for (idx <- 0 until 3) {
            is(idx) {
                rdDataTemp(0) := rdData((idx + 1) % 3)
                rdDataTemp(1) := rdData((idx + 2) % 3)
                rdDataTemp(2) := RegNext(io.sData.payload)
            }
        }
        default {
            rdDataTemp.map(_ := 0)
        }
    }
    val M_Valid = Vec(Bool(), featureGenerateConfig.KERNEL_NUM)
    when(fsm.currentState === FeatureGenerateEnum.WRITE && validIn) {
        for (i <- 0 until 3) {
            when(if (i == 0) columnInCnt.count < io.rowNumIn - (3 - (i + 1)) else columnInCnt.count > (i - 1) && columnInCnt.count < io.rowNumIn - (3 - (i + 1))) {
                M_Valid(i) := True
                M_Valid(i + 3) := True
                M_Valid(i + 6) := True
            } otherwise {
                M_Valid(i) := False
                M_Valid(i + 3) := False
                M_Valid(i + 6) := False
            }
        }
    } otherwise {
        M_Valid.map(_ := False)
    }
    for (i <- 0 until featureGenerateConfig.KERNEL_NUM) {
        io.mData.dataOut(i).valid := RegNext(M_Valid(i))
    }

}
