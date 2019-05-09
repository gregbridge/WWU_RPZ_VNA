import board
import busio
import adafruit_si5351
import sounddevice as sd
import matplotlib.pyplot as plt
import numpy as np
from fractions import Fraction

# Setting up sounddevice defaults
duration = 2
fs = 48000
sd.default.samplerate = fs
sd.default.channels = 2
sd.default.dtype = 'float32'

PLL = 15
# Create si5351 object
i2c = busio.I2C(board.SCL, board.SDA)
si5351 = adafruit_si5351.SI5351(i2c)

# Configure Phase-Lock Loops for A
si5351.pll_a.configure_integer(PLL)

# Configure Clocks 0 - 2
#si5351.clock_0.configure_integer(si5351.pll_a, 750)
# si5351.clock_1.configure_fractional(
#si5351.clock_2.configure_fractional(si5351.pll_a, 750, 23, 100)

# Rudimentary calculate needed prescaler value
def set_frequency(CLK, freq):
    bus = 25000000 * PLL        # Current 'Bus' Clock
    base = int(bus/freq)
    if((3 > base) or (base > 901)):
        print("Error, base value out of range")
        return;

    frac = (bus/freq) - int(bus/freq)
    x = Fraction(frac).limit_denominator(65534)

    # Conditionals for which CLK to use
    # si5351.outputs_enabled = False
    if(CLK == 1):
        # Clock 1
        si5351.clock_1.configure_fractional(
            si5351.pll_a, base, x.numerator,x.denominator)

    elif(CLK == 2):
        # Clock 2
        si5351.clock_2.configure_fractional(
            si5351.pll_a, base, x.numerator,x.denominator)
    else:
        # Clock 0
        si5351.clock_0.configure_fractional(
            si5351.pll_a, base, x.numerator,x.denominator)

    #si5351.outputs_enabled = True
    return;



# print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))
# print('CLK 2: {0} Hz'.format(si5351.clock_2.frequency))
# Enable output, set false to turn off.
si5351.outputs_enabled = True

base = 750
num = 0
den = 100

dataIn = []
totalSamples = 480
for i in range(5):
    #si5351.outputs_enabled = False
    #si5351.clock_0.configure_fractional(si5351.pll_a, base, 25*i, den)

    # JD suggest using this with np.arrange[4000 1000 4000000] to get evenly space array of freqs
    set_frequency(0,5000000-155)
    #si5351.outputs_enabled = True
    dataIn.extend(sd.rec(int(480/5)))
    sd.wait()


sd.wait()
print(dataIn[0][1])
print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))
dataLeft = [row[0] for row in dataIn]
dataRight = [row[1] for row in dataIn]
t = np.arange(0, .01, 1/48000)

#print(np.fft.fft(dataRight))

plt.plot(t, dataRight, 'ro', markersize=1)

# plt.figure()
# plt.plot(t, dataLeft, 'r--', markersize = 1)

plt.show()


