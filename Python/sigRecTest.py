import board
import busio
import time
import sys
import getopt
import adafruit_si5351
import sounddevice as sd
import matplotlib.pyplot as plt
import numpy as np
from fractions import Fraction
import config as cfg

# Setting up Runtime tracker
tic = time.clock()

# Setting up sounddevice defaults
# Soundcard is clipping at +/- 1 V
sd.default.samplerate = cfg.fs  #fs = 48000
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

    return;


duration = .2
n = 2
N = int(n * cfg.fs / cfg.freq_bias )

F_2 = np.arange(1000000, 11000000, 1000000)

# Check Arguments

def main(argv):
    HELP_TEXT = 'test.py -s <1 to sweep, dont include for time> -d <duration of time plot, not implemented yet>'
    sweep = False
    try:
        opts, args = getopt.getopt(argv, "h:s:d",['help','sweep','duration'])
    except getopt.GetoptError:
        print(HELP_TEXT)
        sys.exit(2)
    for opt, arg in opts:
        if opt =='-h':
            print(HELP_TEXT)
            sys.exit()
        elif opt in ('-s'):
            sweep = True
        # Can add parameter for Time domain duration later

    # Frequency Sweep
    if(sweep):
        data = []
        print('Sweeping Frequencies')
        # Second set of Frequencies (Lower frequencies more)
        for i in range(len(F_2)):
            set_frequency(2, F_2[i] - cfg.freq_bias)
            set_frequency(1, F_2[i])
            set_frequency(0, F_2[i])

            print('.')
            # Adding print statements to update user
            if(int((len(F_2))/2) == i):
                print('50% done with current freq. sweep')

            # Enable signal and read signals
            si5351.outputs_enabled = True
            time.sleep(1)
            data.extend(sd.rec(N))
                # data[:,0] is Right channel which is REF
                # data[:,1] is Left channel which is TEST
            sd.wait()            
            si5351.outputs_enabled = False

        # s for sample number
        s_plot = np.arange(0, N * len(F_2), 1)
        # Plotting 
        plt.plot(s_plot, data, markersize=1)
        plt.title('Plot of Stereo data as Frequency is sweeped')
        div_plot = np.arange(0, N*len(F_2),N)
        
        # This builds vertical line dividers for plot
        for f in div_plot:
            plt.axvline(x=f,linestyle=':')

        #plt.legend(['Reference','Test']) <- didn't work syntax-ually
        toc = time.clock()
        print(toc-tic)
        plt.show()
        
    # Time Plot
    if(not(sweep)):
        set_frequency(2,5000000-cfg.freq_bias)  # Freq. Local less than Output by 150 Hz
        set_frequency(1,5000000)
        set_frequency(0,5000000)
        si5351.outputs_enabled = True
        data = sd.rec(int(duration * cfg.fs))
        sd.wait()            
        si5351.outputs_enabled = False
        T = 1/cfg.fs
        t = np.arange(0, duration, T)
        print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))

        plt.plot(t, data[:,0], markersize=1)
        plt.title('REF on Left channel: data[:,0]')
        plt.figure()
        plt.plot(t, data[:,1], markersize=1)
        plt.title('TEST on Right channel: data[:,1]')
        toc = time.clock()
        print(toc-tic)
        plt.show()

main(sys.argv[1:])

si5351.outputs_enabled = False



