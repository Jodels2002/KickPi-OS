# https://indibit.de/raspberry-pi-oled-display-128x64-mit-python-ansteuern-i2c/

sudo raspi-config nonint get_i2c
sudo apt-get -y install python-smbus i2c-tools git python-pil

cd /home/pi/

git clone https://github.com/BLavery/lib_oled96
chmod -R 777 lib_oled96

#sudo cp -R /home/$USER/KickPi-OS/config/oled.service /etc/systemd/system/oled.service
#sudo systemctl enable oled

