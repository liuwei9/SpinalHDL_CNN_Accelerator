import spinal.core.{Area, Bits, Bool, Bundle, ClockDomainConfig, Component, False, HIGH, IntToBuilder, Reg, RegInit, SYNC, SpinalConfig, SpinalEnum, True, UInt, binaryOneHot, in, is, log2Up, out, switch, when}
import spinal.lib.{master, slave}

case class PaddingConfig(DATA_WIDTH: Int, PICTURE_NUM: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int) {
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
    val ZERO_NUM = 1 //默认支持padding=1
    val ZERO_NUM_WIDTH = ZERO_NUM.toBinaryString.length
}

object PaddingEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, UPDOWN, LEFT, CENTER, RIGHT, END = newElement
}



case class PaddingFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val leftEnd = Bool()
    val rightEnd = Bool()
    val upDownEnd = Bool()
    val centerEnd = Bool()
    val endEnd = Reg(False)
    val enPadding = Bool()
    val enUpDown = Bool()
    val currentState = Reg(PaddingEnum()) init PaddingEnum.IDLE
    val nextState = PaddingEnum()
    currentState := nextState
    switch(currentState) {
        is(PaddingEnum.IDLE) {
            when(start) {
                nextState := PaddingEnum.INIT
            } otherwise {
                nextState := PaddingEnum.IDLE
            }
        }
        is(PaddingEnum.INIT) {
            when(initEnd) {
                when(enPadding) {
                    nextState := PaddingEnum.LEFT
                } otherwise {
                    nextState := PaddingEnum.CENTER
                }
            } otherwise {
                nextState := PaddingEnum.INIT
            }
        }
        is(PaddingEnum.UPDOWN) {
            when(upDownEnd) {
                nextState := PaddingEnum.RIGHT
            } otherwise {
                nextState := PaddingEnum.UPDOWN
            }
        }
        is(PaddingEnum.LEFT) {
            when(leftEnd) {
                when(enUpDown) {
                    nextState := PaddingEnum.UPDOWN
                } otherwise {
                    nextState := PaddingEnum.CENTER
                }

            } otherwise {
                nextState := PaddingEnum.LEFT
            }
        }
        is(PaddingEnum.CENTER) {
            when(centerEnd) {
                when(enPadding) {
                    nextState := PaddingEnum.RIGHT
                } otherwise {
                    nextState := PaddingEnum.END
                }
            } otherwise {
                nextState := PaddingEnum.CENTER
            }

        }
        is(PaddingEnum.RIGHT) {
            when(rightEnd) {
                nextState := PaddingEnum.END
            } otherwise {
                nextState := PaddingEnum.RIGHT
            }
        }
        is(PaddingEnum.END) {
            when(endEnd) {
                nextState := PaddingEnum.IDLE
            } elsewhen (enPadding) {
                nextState := PaddingEnum.LEFT
            } otherwise {
                nextState := PaddingEnum.CENTER
            }
        }
    }
}

class Padding(paddingConfig: PaddingConfig) extends Component {
    val io = new Bundle {
        val sData = slave Stream (Bits(paddingConfig.STREAM_DATA_WIDTH bits))
        val mData = master Stream (Bits(paddingConfig.STREAM_DATA_WIDTH bits))
        val enPadding = in Bool()
        val channelIn = in UInt (paddingConfig.CHANNEL_WIDTH bits)
        val start = in Bool()
        val rowNumIn = in UInt (paddingConfig.FEATURE_WIDTH bits)
        val rowNumOut = out UInt (paddingConfig.FEATURE_WIDTH bits)
        val zeroDara = in Bits (paddingConfig.DATA_WIDTH bits)
        val zeroNum = in UInt (paddingConfig.ZERO_NUM_WIDTH bits)
    }
    noIoPrefix()
    when(io.enPadding) {
        io.rowNumOut := (io.zeroNum << 1) + io.rowNumIn
    } otherwise {
        io.rowNumOut := io.rowNumIn
    }
    val fsm = PaddingFsm(io.start)
    fsm.enPadding := io.enPadding

    private def assign(dst: Bits, src: Bits, dataWidth: Int): Unit = {
        if (dst.getWidth == dataWidth) dst := src
        else {
            assign(dst(dataWidth - 1 downto 0), src, dataWidth)
            assign(dst(dst.getWidth - 1 downto dataWidth), src, dataWidth)
        }
    }



    private def selfClear(in: Bool, en: Bool): Unit = {
        when(en) {
            in := True
        } otherwise {
            in := False
        }
    }

    val initEn = RegInit(False) setWhen (fsm.currentState === PaddingEnum.INIT) clearWhen (fsm.nextState =/= PaddingEnum.INIT)
    val initCount = counter(initEn, 5, 8)
    when(fsm.currentState === PaddingEnum.IDLE) {
        initCount.clear
    }
    fsm.initEnd := initCount.valid

    val stateValid = fsm.currentState =/= PaddingEnum.IDLE && fsm.currentState =/= PaddingEnum.INIT && fsm.currentState =/= PaddingEnum.END
    val channelTimes = io.channelIn >> log2Up(paddingConfig.COMPUTE_CHANNEL_NUM)
    val channelEn = Bool()
    selfClear(channelEn, stateValid && io.mData.valid && io.mData.ready)
    val channelCnt = counter(channelEn, paddingConfig.CHANNEL_WIDTH, channelTimes)
    when(fsm.currentState === PaddingEnum.IDLE) {
        channelCnt.clear
    }

    val columnEn = Bool()
    selfClear(columnEn, stateValid && channelCnt.valid && io.mData.valid && io.mData.ready)
    val columnCnt = counter(columnEn, paddingConfig.FEATURE_WIDTH, io.rowNumOut)
    when(fsm.currentState === PaddingEnum.IDLE) {
        columnCnt.clear
    }
    selfClear(fsm.leftEnd, columnCnt.count === 0 && channelCnt.valid)
    selfClear(fsm.upDownEnd, columnCnt.count === io.rowNumOut - 2 && channelCnt.valid)
    selfClear(fsm.rightEnd, columnCnt.count === io.rowNumOut - 1 && channelCnt.valid)
    when(io.enPadding) {
        selfClear(fsm.centerEnd, columnCnt.count === io.rowNumOut - 2 && channelCnt.valid)
    } otherwise {
        selfClear(fsm.centerEnd, columnCnt.count === io.rowNumOut - 1 && channelCnt.valid)
    }

    val rowEn = Bool()
    selfClear(rowEn, fsm.currentState === PaddingEnum.END)
    val rowCnt = counter(rowEn, paddingConfig.FEATURE_WIDTH, io.rowNumOut)
    when(fsm.currentState === PaddingEnum.IDLE) {
        rowCnt.clear
    }
    selfClear(fsm.enUpDown, rowCnt.count === 0 || rowCnt.count === io.rowNumOut - 1)
    selfClear(fsm.endEnd, rowCnt.valid && columnCnt.valid && channelCnt.valid)

    def >> (featureGenerate: FeatureGenerate): Unit ={
        featureGenerate.io.sData <> io.mData
        featureGenerate.io.rowNumIn := io.rowNumOut
        featureGenerate.io.start := io.start
        featureGenerate.io.channelIn := io.channelIn
    }
    val data_temp = Bits(paddingConfig.STREAM_DATA_WIDTH bits)
    val data_width = paddingConfig.DATA_WIDTH
    when(fsm.currentState =/= PaddingEnum.CENTER) {
        assign(data_temp, io.zeroDara, data_width)
    } otherwise {
        data_temp := io.sData.payload
    }
    val featureDataReady = (fsm.currentState === PaddingEnum.CENTER) && io.mData.ready
    val zeroDataValid = (fsm.currentState === PaddingEnum.LEFT || fsm.currentState === PaddingEnum.UPDOWN || fsm.currentState === PaddingEnum.RIGHT)
    io.sData.ready := featureDataReady
    when(fsm.currentState =/= PaddingEnum.CENTER) {
        io.mData.valid := zeroDataValid
    } otherwise {
        io.mData.valid := io.sData.valid
    }
    io.mData.payload := data_temp

}

object Padding {
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            genVhdlPkg = false,
            defaultConfigForClockDomains = ClockDomainConfig(resetActiveLevel = HIGH, resetKind = SYNC)
        ).generateVhdl(new Padding(PaddingConfig(8, 1, 12, 1, 12))).printPruned()
    }
}
