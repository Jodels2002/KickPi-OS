#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
# https://indibit.de/raspberry-pi-oled-display-128x64-mit-python-ansteuern-i2c/
# sudo nano /boot/config.txt -> dtparam=i2c_arm=on,i2c_arm_baudrate=400000
#git clone https://github.com/rm-hull/luma.examples.git
#git clone git clone https://github.com/BLavery/lib_oled96
#git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
whiptail --msgbox " OLED install,...  Please enable the I2C Interface on the Raspberry Pi first! :-)   


Please also increase speed with: sudo nano /boot/config.txt -> dtparam=i2c_arm=on,i2c_arm_baudrate=400000 " 20 60 1

sudo raspi-config
clear
toilet -F gay Pimiga3000
cd ~








i2cdetect -y 1
echo " Should Say: "3C" "

#Install_for_Python_3() {
clear
toilet -F gay Pimiga3000
# If you are using Python 3

sudo apt install -y python3-dev
sudo apt install -y python-smbus i2c-tools
sudo apt install -y python3-pil
sudo apt install -y python3-pip
sudo apt install -y python3-setuptools
sudo apt install -y python3-rpi.gpio
sudo apt install -y python-dev
sudo apt install -y python-smbus i2c-tools
sudo apt install -y python-pil
sudo apt install -y python-pip
sudo apt install -y python-setuptools 
sudo apt install -y python-dev
sudo apt install -y python-smbus i2c-tools
sudo apt install -y python-pil
sudo apt install -y python-pip
sudo apt install -y python-setuptools 



clear
toilet -F gay Pimiga3000

install the library for Python 2 :
sudo python setup.py install

# Test OLED

git clone https://github.com/BLavery/lib_oled96


cd /home/pi/lib_oled96/
sudo chmod -R 777 /home/pi/lib_oled96/







