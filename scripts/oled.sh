#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #install BW OLED Display  ***********************************
# https://www.raspberrypi-spy.co.uk/2018/04/i2c-oled-display-module-with-raspberry-pi/

# Service Einrichten! https://www.thomaschristlieb.de/ein-python-script-mit-systemd-als-daemon-systemd-tut-garnicht-weh/

sudo raspi-config nonint do_i2c %d

#cd ~
#git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
#cd Adafruit_Python_SSD1306

sudo chmod -R 777 /home/$USER/Adafruit_Python_SSD1306
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

sudo chmod -R 777 /home/$USER/.KickPi-OS/OLED
/home/$USER/.KickPi-OS/OLED
# Test OLED
#i2cdetect -y 1
#echo " Should Say: "3C""
python Amiga.py

#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
# https://luma-oled.readthedocs.io/en/latest/python-usage.html
#***********************************************  #install colour OLED Display  ***********************************

sudo -H pip3 install --upgrade luma.oled
sudo apt-get update
sudo apt-get install python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 -y
sudo -H pip3 install luma.oled
sudo usermod -a -G spi,gpio,i2c pi


