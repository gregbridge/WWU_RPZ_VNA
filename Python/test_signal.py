import board
import busio
import adafruit_si5351
from fractions import Fraction
import config as cfg
i2c = busio.I2C(board.SCL, board.SDA)
si5351 = adafruit_si5351.SI5351(i2c)


# Configure Phase-Lock Loops for A 
si5351.pll_a.configure_integer(cfg.PLL)

# Configure Clocks 0 - 2
si5351.clock_2.configure_integer(si5351.pll_a, 125)   # Sets pll_a to prescaler: 4

def set_frequency(CLK, freq):
    bus = 25000000 * cfg.PLL        # Current 'Bus' Clock
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

set_frequency(2,5000000-cfg.freq_bias)  # Freq. Local less than Output by 150 Hz
set_frequency(1,5000000)
set_frequency(0,5000000) 
# Likely Use clock 2 for reference channel, need to initialize
print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))
# Enable output, set false to turn off.
si5351.outputs_enabled = True
