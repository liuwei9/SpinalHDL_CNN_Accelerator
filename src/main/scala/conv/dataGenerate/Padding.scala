import spinal.core.{Area, Bits, Bool, Bundle, ClockDomainConfig, Component, False, HIGH, IntToBuilder, Reg, RegInit, RegNext, SYNC, SpinalConfig, SpinalEnum, True, UInt, binaryOneHot, in, is, log2Up, out, switch, when}
import spinal.lib.{Counter, master, slave}
import wa.{WaCounter, WaStreamFifo}

case class PaddingConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, ZERO_NUM: Int) {
    val PICTURE_NUM = 1
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
    //    val ZERO_NUM = 5 //默认支持padding=1
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
        val colNumIn = in UInt (paddingConfig.FEATURE_WIDTH bits)
        val colNumOut = out UInt (paddingConfig.FEATURE_WIDTH bits)
        val zeroDara = in Bits (paddingConfig.DATA_WIDTH bits)
        val zeroNum = in UInt (paddingConfig.ZERO_NUM_WIDTH bits)
        val last = out Bool()
    }
    noIoPrefix()
    when(io.enPadding) {
        io.rowNumOut := (io.zeroNum << 1) + io.rowNumIn
        io.colNumOut := (io.zeroNum << 1) + io.colNumIn
    } otherwise {
        io.rowNumOut := io.rowNumIn
        io.colNumOut := io.colNumIn
    }

    val channelTimes: UInt = RegNext(io.channelIn >> log2Up(paddingConfig.COMPUTE_CHANNEL_NUM), 0)


    val fifo = WaStreamFifo(Bits(paddingConfig.STREAM_DATA_WIDTH bits), 4)
    fifo.io.pop <> io.mData


    val fsm = PaddingFsm(io.start)
    fsm.enPadding := io.enPadding
    io.sData.ready <> (fifo.io.push.ready && fsm.currentState === PaddingEnum.CENTER)

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
    val initCount = WaCounter(initEn, 5, 8)
    when(fsm.currentState === PaddingEnum.IDLE) {
        initCount.clear
    }
    fsm.initEnd := initCount.valid


    //    val zeroDada = Bits(paddingConfig.STREAM_DATA_WIDTH bits)
    val zeroValid = Bool()
    //    val zeroReady = !fifo.almost_full
    //    val zeroFire = zeroValid & zeroReady

    when(fsm.currentState === PaddingEnum.CENTER) {
        fifo.io.push.valid := io.sData.valid
        fifo.io.push.payload := io.sData.payload
    } otherwise {
        fifo.io.push.valid := zeroValid
        assign(fifo.io.push.payload, io.zeroDara, paddingConfig.DATA_WIDTH)
    }

    val channelCnt = WaCounter(fifo.io.push.fire, paddingConfig.CHANNEL_WIDTH, channelTimes - 1)
    when(fsm.currentState === PaddingEnum.IDLE) {
        channelCnt.clear
    }
    val colCnt = WaCounter(channelCnt.valid && (fifo.io.push.fire), paddingConfig.FEATURE_WIDTH, io.colNumOut - 1)
    when(fsm.currentState === PaddingEnum.IDLE) {
        colCnt.clear
    }
    val rowCnt = WaCounter(fsm.nextState === PaddingEnum.END, paddingConfig.FEATURE_WIDTH, io.rowNumOut - 1)
    when(fsm.currentState === PaddingEnum.IDLE) {
        rowCnt.clear
    }
    selfClear(zeroValid, fsm.currentState === PaddingEnum.LEFT || fsm.currentState === PaddingEnum.RIGHT || fsm.currentState === PaddingEnum.UPDOWN)
    selfClear(fsm.leftEnd, colCnt.count === io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.rightEnd, colCnt.count === io.colNumOut - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.endEnd, rowCnt.count === io.rowNumOut - 1)
    selfClear(fsm.upDownEnd, colCnt.count === io.colNumOut - io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.centerEnd, colCnt.count === io.colNumOut - io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.enUpDown, rowCnt.count < io.zeroNum || rowCnt.count > io.rowNumOut - io.zeroNum - 1)
    selfClear(io.last, fsm.currentState === PaddingEnum.END && fsm.nextState === PaddingEnum.IDLE)
}

object Padding {
    def main(args: Array[String]): Unit = {
        SpinalConfig(
            genVhdlPkg = false,
            defaultConfigForClockDomains = ClockDomainConfig(resetActiveLevel = HIGH, resetKind = SYNC)
        ).generateVerilog(new Padding(PaddingConfig(8, 1, 12, 8, 12))).printPruned()
    }
}
