

sudo adduser pi
sudo usermod pi -a -G pi,adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input,netdev,spi,i2c,gpio
sudo visudo
sudo apt install -y raspberrypi-ui-mods raspberrypi-sys-mods

sudo apt install -y usbmount
sudo apt install task-xfce-desktop -y
