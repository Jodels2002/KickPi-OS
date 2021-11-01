#!/bin/bash
#***********************************************  Pimiga-addon install script  ***********************************
# Install Pimiga-addon
# B.Titze 2021
#*************************************************************************************************************       
       sudo cp -rf /home/$USER/Pimiga-addon/Scripts/* /usr/local/bin/
       sudo chmod -R 777 /usr/local/bin/
       
       sudo apt -y update
       sudo apt -y upgrade
       sudo apt-get install -y toilet dialog zip unzip
       sudo apt-get install -y python3-pip
       pip3 install adafruit-circuitpython-ssd1306
       
       sudo raspi-config nonint do_i2c %d
       sudo chmod -R 777 /home/$USER/Adafruit_Python_SSD1306
       sudo apt install -y python3
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
       cd /home/pi
       sudo python -m pip install --upgrade pip setuptools wheel
       sudo pip install Adafruit-SSD1306
       sudo python -m pip install --upgrade pip setuptools wheel
       git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
       cd Adafruit_Python_SSD1306
       sudo python setup.py install
       sudo cp -rf /home/pi/Pimiga-addon/OLED/ /
       sudo cp -rf /home/pi/Pimiga-addon/conf/rc.local /etc/
       sudo cp -rf /home/pi/Pimiga-addon/conf/.bashrc /home/pi/
     
       sudo rm -rf /home/pi/Pimiga-addon/
       
       sudo chmod -R 777 /OLED/
       sudo chmod -R 777 /usr/local/bin/
       sudo chmod -R 777 /etc/rc.local
       sudo chmod -R 777 /home/pi/.bashrc
       sudo reboot now
