#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020

echo "Enable the I2C Interface on the Raspberry Pi"

sudo raspi-config

# The following libraries may already be installed but run these commands anyway to make sure 
sudo apt install -y python3-dev
sudo apt install -y python-smbus i2c-tools
sudo apt install -y python3-pil
sudo apt install -y python3-pip
sudo apt install -y python3-setuptools
sudo apt install -y python3-rpi.gpio

# If you are using Python 2 then use these commands instead :

#sudo apt install -y python-dev
#sudo apt install -y python-smbus i2c-tools
#sudo apt install -y python-pil
#sudo apt install -y python-pip
#sudo apt install -y python-setuptools 
#sudo apt install -y python-dev
#sudo apt install -y python-smbus i2c-tools
#sudo apt install -y python-pil
#sudo apt install -y python-pip
#sudo apt install -y python-setuptools 

i2cdetect -y 1

echo " Should Say: "3C"

cd ~
git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
cd Adafruit_Python_SSD1306

#install the library for Python 2 :
#sudo python3 setup.py install

#install the library for Python 2 :
#sudo python setup.py install

# Test OLED
cd examples


