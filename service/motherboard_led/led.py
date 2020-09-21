import it8297 as it
import time
import sys
import signal
import random
import json

# ---------------------------------------------------------------------------------


def load_colors():
    return json.loads(
            open('/home/vitdevelop/.config/service/motherboard_led/colors.json')
            .read())


c = it.Controller_hidapi()

c.setLedCount(it.LEDS_32)


def exit_cycle(sig, frame):
    c.stopAll()
    sys.exit(0)


signal.signal(signal.SIGINT, exit_cycle)
signal.signal(signal.SIGTERM, exit_cycle)


def save_state():
    pkt = it.PktEffect()
    for i in range(0, 4):
        pkt.setup(0x20 + i, it.EFFECT_STATIC, it.makeColor(255, 255, 255))
        print(i)
        pkt.period0 = 0
        pkt.period1 = 0
        pkt.period2 = 0
        c.sendPacket(pkt)
    c.applyEffect()
    c.saveStateToMCU()


def cycle():
    # c.stopAll()
    colors = load_colors()
    colors_size = len(colors)

    pkt = it.PktEffect()
    fadeIn = 2000
    fadeOut = 0
    hold = 10000
    while True:
        # color = [
        # random.randint(0,255),
        # random.randint(0,255),
        # random.randint(0,255)]
        color = colors[random.randint(0, colors_size)]

        for i in range(0, 4):

            pkt.setup(
                    0x20 + i, it.EFFECT_STATIC,
                    it.makeColor(color[0], color[1], color[2]))
            pkt.period0 = fadeIn        # fade in
            pkt.period1 = fadeOut       # fade out
            # pkt.period2 = hold          # hold

            c.sendPacket(pkt)
        c.applyEffect()
        time.sleep((hold + fadeIn + fadeOut)/1000)


def static_white():
    c.setAllPorts(it.makeColor(0, 0, 0))


def static_black():
    c.setAllPorts(it.makeColor(255, 255, 255))


def slow_pulse():
    pkt = it.PktEffect()
    color = [
            random.randint(1, 255),
            random.randint(1, 255),
            random.randint(1, 255)
            ]
    for i in range(0, 4):

        pkt.setup(
                0x20 + i,
                it.EFFECT_PULSE,
                it.makeColor(color[0], color[1], color[2]))
        pkt.period0 = 5000        # fade in
        pkt.period1 = 5000       # fade out
        pkt.period2 = 20000          # hold
        pkt.min_brightness = 30
        pkt.param0 = 7

        # pkt.param1 = 0
        # pkt.param3 = 0

        c.sendPacket(pkt)
    c.applyEffect()


def leds_up_down(loops=-1,
                 leds=None):
    if leds is None:
        leds = []

    total_leds = len(leds)
    if total_leds == 0:
        return

    singleLed = False
    if total_leds == 1:
        leds = [leds[0], leds[0]]
        total_leds = 2
        singleLed = True

    fadeInTime = int(1000 / total_leds)
    fadeOutTime = int(500 / total_leds)
    sleepTime = (fadeInTime + fadeOutTime) / 1000
    loop = 0
    pkt = it.PktEffect()
    while True:
        if loop == loops:
            return
        else:
            loop += 1

        for i in range(0, total_leds):

            pkt.setup(0x20 + leds[i], it.EFFECT_STATIC, it.makeColor(0, 0, 0))
            pkt.period0 = fadeInTime        # fade in
            pkt.period1 = fadeOutTime       # fade out
            c.sendPacket(pkt)
            if singleLed:
                c.applyEffect()
                time.sleep(sleepTime)

            pkt.setup(
                    0x20 + (leds[0] if i == total_leds - 1 else leds[i + 1]),
                    it.EFFECT_STATIC,
                    it.makeColor(255, 255, 255))

            pkt.period0 = fadeInTime        # fade in
            pkt.period1 = fadeOutTime       # fade out
            c.sendPacket(pkt)
            c.applyEffect()

            time.sleep(sleepTime)


cycle()
# leds_up_down(5, [2])
# slow_pulse()
