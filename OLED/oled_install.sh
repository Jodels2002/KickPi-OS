#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020

# usr/local/bin/convert image.jpg -resize 128x64\! -depth 2 oled.jpg

whiptail --msgbox " OLED install,...  Please enable the I2C Interface on the Raspberry Pi first! :-)  " 20 60 1

sudo raspi-config
clear
toilet -F gay Pimiga3000
cd ~
git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
cd Adafruit_Python_SSD1306
sudo chmod -R 777 /home/$USER/Adafruit_Python_SSD1306


i2cdetect -y 1

Install_for_Python_3() {
clear
toilet -F gay Pimiga3000
# If you are using Python 3
sudo apt install -y python3-dev
sudo apt install -y python-smbus i2c-tools
sudo apt install -y python3-pil
sudo apt install -y python3-pip
sudo apt install -y python3-setuptools
sudo apt install -y python3-rpi.gpio
install the library for Python 3 :
sudo python3 setup.py install

# Test OLED
cd examples
python3 shapes.py

}

# If you are using Python 2
Install_for_Python_2() {
clear
toilet -F gay Pimiga3000
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
install the library for Python 2 :
sudo python setup.py install

# Test OLED
cd examples
python shapes.py

}



echo " Should Say: "3C"


case $CHOICE in
        1)
            echo "Pimiga3000 OLED install.. Phython2"
            Install_for_Python_2
            
            ;;
        2)
           echo "Pimiga3000 OLED install.. Phython3"
            Install_for_Python_3
      
            ;;
esac




