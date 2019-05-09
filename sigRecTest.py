import board
import busio
import adafruit_si5351
import sounddevice as sd
import matplotlib.pyplot as plt
import numpy as np
from fractions import Fraction
import config as cfg

# Setting up sounddevice defaults
# Soundcard is clipping at +/- 1 V
duration = 2
#fs = 48000
sd.default.samplerate = cfg.fs
sd.default.channels = cfg.channels # 2
sd.default.dtype = cfg.dtype # 'float32'

PLL = cfg.PLL # 15
# Create si5351 object
i2c = busio.I2C(board.SCL, board.SDA)
si5351 = adafruit_si5351.SI5351(i2c)

# Configure Phase-Lock Loops for A
si5351.pll_a.configure_integer(cfg.PLL)

# Rudimentary Function that sets prescaler value
def set_frequency(CLK, freq):
    bus = 25000000 * PLL        # Current 'Bus' Clock
    base = int(bus/freq)
    if((3 > base) or (base > 901)):
        print("Error, base value out of range")
        return;

    frac = (bus/freq) - int(bus/freq)
    x = Fraction(frac).limit_denominator(65534)

    # Conditionals for which CLK to use
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


duration = 0.05

set_frequency(2,5000000-cfg.freq_bias)  # Freq. Local less than Output by 150 Hz
set_frequency(1,5000000)
set_frequency(0,5000000)


#F = np.arange(1000000, 10000000, 1000000)        # 0 -> 10MHz, in 1Mhz steps 
#dataLeft = []
#dataRight = []

si5351.outputs_enabled = True
data = sd.rec(int(duration * cfg.fs))
sd.wait()            
si5351.outputs_enabled = False


print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))
T = 1/cfg.fs
t = np.arange(0, duration, T)


plt.plot(t, data[:,0], markersize=1)
plt.title('REF on Left channel: data[:,0]')
plt.figure()

plt.plot(t, data[:,1], markersize=1)
plt.title('TEST on Right channel: data[:,1]')

#plt.plot(new_axis, np.abs(dataRight), 'ro', markersize=1)
#plt.title('Data on Channel Right In[1]')

#plt.figure()
#plt.plot(new_axis, np.abs(dataLeft), 'r--', markersize = 1)
#plt.title('Data on Channel Left In[0]')

plt.show()
print('test')
#si5351.outputs_enabled = True



