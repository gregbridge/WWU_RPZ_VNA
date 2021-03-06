'''
Greg Birge
tfPlot.py
Written for WWU_RPZ_VNA board
& ENGR 357 Final Project
'''

import board
import busio
#import sys
#import getopt
import adafruit_si5351
import sounddevice as sd
import matplotlib.pyplot as plt
import numpy as np
import time
from fractions import Fraction
import config as cfg


print('Setup & Pre-calculations..')
# Starting timer to check total run-time
tic = time.clock()
sweep = True

# In case of divide by zero or NA
np.seterr(divide='ignore', invalid='ignore')

# Setting up sounddevice defaults
# Soundcard is clipping at +/- 1 V
duration = 2

sd.default.device = 0
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
        print("Error, base value out of range at frequency {0}".format(freq))
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

# N*T = n * (150 Hz) We will use n = 2
n = 2
N = int(n * cfg.fs / cfg.freq_bias )

# Building e^(2*np.pi*1j*K*n/N) array for all K points
K = np.arange(0, N, 1)
K = K.astype(np.complex64)
print('.')
K *= 2*np.pi*1j*n/N
print('.')
exp_array = np.exp(-K)


REF = []
TST = []


# Clk 0 - REF
# CLK 1 - REF
# CLK 2 - LO_I

# These frequency ranges were from a cut plan to allow the user to specify certain freq ranges
# F_1 = np.arange(100000, 1000000, 50000)            # 50 kHz -> 1MHz, in 25kHz steps 
# F_2 = np.arange(1000000, 11000000, 100000)       # 1 MHz -> 10 MHz, in 1 MHz steps
# F_3 = np.arange(10000000, 100000000, 10000000)    # 10 -> 100 MHz, in 10 MHz

F_2 = np.arange(1000000, 1100000, 3330)       # 1 MHz -> 1.1 MHz, in .01 MHz steps


if(sweep):
    print('Sweeping Frequencies')
    # Second set of Frequencies (Lower frequencies more)
    for i in range(len(F_2)):
        freq_t = time.clock()
        set_frequency(2, F_2[i] - cfg.freq_bias)
        set_frequency(1, F_2[i])
        set_frequency(0, F_2[i])
        freq_t2 = time.clock()

        print('.')
        # Adding print statements to update user
        if(int((len(F_2))/2) == i):
            print('50% done with current freq. sweep')

        # Enable signal and read signals
        si5351.outputs_enabled = True
        time.sleep(1)               # Delay to allow Soundcard Cap to charge
        start  = time.clock()
        data = sd.rec(N, blocking = True)
        
            # data[:,0] is Right channel which is REF
            # data[:,1] is Left channel which is TEST
        #sd.wait()
        stop = time.clock()
        si5351.outputs_enabled = False


        dataR = data[:,0]    # np.fft.fft(data[:,0])
        dataL = data[:,1]    # np.fft.fft(data[:,1])

        REF.append(np.dot(dataR,exp_array)) 
        TST.append(np.dot(dataL,exp_array))
        stop2 = time.clock()

        # These are if the Frequency values are needed
        # REF.append([F_2[i],np.dot(dataR,exp_array)]) 
        # TST.append([F_2[i],np.dot(dataL,exp_array)])

# These were old print statements used for testing    
#print('Time to change freq', freq_t2 - freq_t)    
#print('TIme between SD.rec and sd.wait: ', stop-start)
#print('Time from sd.rec to math', stop2-stop)

# possibly add more loops for other frequency ranges


# One extra sd.wait() just in case likely will remove.
sd.wait()

print('Mathing...')

# Converting to polar and creating magnitude arrays
MAG = 20 * np.log10 (np.abs(TST) / np.abs(REF) )
PHASE = np.angle(TST, deg= True) - np.angle(REF, deg= True)

print('Plotting...')

# Need to format Axes
plt.plot(F_2, MAG, 'r--', markersize=1)
plt.title('Magnitude')
plt.figure()

plt.plot(F_2, PHASE, 'r--', markersize=1)
plt.title('Phase')
toc = time.clock()
print('Runtime of {0} seconds'.format(toc-tic))

plt.show()



# Legacy plots for checking data ----------------------------------------------
#t = np.arange(0, 1, 1/48000)
#plt.plot(t, data, markersize=1)
#plt.figure()

#plt.plot(new_axis, np.abs(data[:,1]), 'ro', markersize=1)
#plt.title('Data on Channel Right In[1]')

#plt.figure()
#plt.plot(new_axis, np.abs(data[:,0]), 'r--', markersize = 1)
#plt.title('Data on Channel Left In[0]')


