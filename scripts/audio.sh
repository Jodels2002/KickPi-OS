sudo apt-get -y remove pulseaudio
sudo apt-get -y install pulseaudio

sudo /etc/init.d/alsa-utils reset

sudo apt-get -y install pi-bluetooth
sudo apt-get -y install bluez bluez-firmware
sudo usermod -G bluetooth -a pi
