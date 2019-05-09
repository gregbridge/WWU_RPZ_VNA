import board
import busio
import adafruit_si5351
import sounddevice as sd
import matplotlib.pyplot as plt
import numpy as np

# Setting up sounddevice defaults
duration = 2
fs = 48000
sd.default.samplerate = fs
sd.default.channels = 2
sd.default.dtype = 'float32'

# Create si5351 object
i2c = busio.I2C(board.SCL, board.SDA)
si5351 = adafruit_si5351.SI5351(i2c)

# Configure Phase-Lock Loops for A 
si5351.pll_a.configure_integer(15)

# Configure Clocks 0 - 2
si5351.clock_0.configure_integer(si5351.pll_a, 750)    
# si5351.clock_1.configure_fractional(
si5351.clock_2.configure_fractional(si5351.pll_a, 750, 23, 100)

# Likely Use clock 2 for reference channel, need to initialize
print('CLK 0: {0} Hz'.format(si5351.clock_0.frequency))
print('CLK 2: {0} Hz'.format(si5351.clock_2.frequency))
# Enable output, set false to turn off.
si5351.outputs_enabled = True



dataIn = sd.rec(480)   # Argument is number of samples to take
sd.wait()
print(dataIn)

dataLeft = [row[0] for row in dataIn]
dataRight = [row[1] for row in dataIn]
t = np.arange(0, .01, 1/48000)

#print(np.fft.fft(dataRight))

plt.plot(t, dataRight, 'ro', markersize=1) 

# plt.figure()
# plt.plot(t, dataLeft, 'r--', markersize = 1)

plt.show()

