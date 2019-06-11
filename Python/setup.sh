#!/bin/bash

echo "Installing Python Module List"
sudo yes | pip3 install RPI.GPIO
sudo yes | pip3 install adafruit-blinka
sudo yes | pip3 install adafruit-circuitpython-si5351
sudo yes | pip3 install libffi-dev libffi6
sudo yes | pip3 install numpy
sudo yes | pip3 install matplotlib
sudo yes | pip3 install sounddevice

# Last Update 5/23 - Greg






