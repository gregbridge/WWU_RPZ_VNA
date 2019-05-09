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


totalSamples = 4800/10
set_frequency(0,5000000-cfg.freq_bias)  # Freq. Local less than Output by 150 Hz
set_frequency(2,5000000)

# dataIn = sd.rec(480)
F = np.arange(1000000, 10000000, 1000000)        # 0 -> 10MHz, in 1Mhz steps 
dataLeft = []
dataRight = []


for i in range(len(F) + 1):
    # Clock 0 is LO_I for switch driving
    # set_frequency(0, F[i] - cfg.freq_bias)
    # Clock 2 is Output signal
    # set_frequency(2, F[i])
    si5351.outputs_enabled = True
    data = sd.rec(int(totalSamples))
    sd.wait()            
    si5351.outputs_enabled = False
    
    dataLeft.extend(np.fft.fftshift(np.fft.fft(data[:,0])/totalSamples))     
    dataRight.extend(np.fft.fftshift(np.fft.fft(data[:,1])/totalSamples))
    
    
# One extra sd.wait() just in case likely will remove.
sd.wait()

print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))
t = np.arange(0, .01, 1/48000)
T = 1/cfg.fs
new_axis = np.arange(-1/(2*T),1/(2*T),1/(T*totalSamples*10))
#print(dataLeft)

plt.plot(t, data, markersize=1)
plt.figure()

plt.plot(new_axis, np.abs(dataRight), 'ro', markersize=1)
plt.title('Data on Channel Right In[1]')

plt.figure()
plt.plot(new_axis, np.abs(dataLeft), 'r--', markersize = 1)
plt.title('Data on Channel Left In[0]')


plt.show()
si5351.outputs_enabled = True



