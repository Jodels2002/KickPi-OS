#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021

#******************************************** #startup-sequence  :-) ************* ********************************************
sudo cp -R /boot/config.txt /boot/config_backup.txt

clear
echo "Welcome to KickPi-OS"
echo " "
echo " "

     
      sudo apt -y update
      sudo apt-get install -y toilet dialog mc zip unzip wget
      sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
      sudo apt purge -y raspberrypi-ui-mods 
	  sudo apt install -y gnome-com*
      sudo apt install -y ntfs-*

      clear
      toilet "KickPi-OS" --metal
     
sudo chmod -R 777 /home/$USER/Amiga 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin	 
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

 sudo cp -R /home/$USER/KickPi-OS/config/splash.service /etc/systemd/system/splash.service
 sudo cp -R /home/$USER/KickPi-OS/config/splash/Booting.png /etc/systemd/system/Booting.png
 sudo systemctl enable splash
 


sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs
sudo reboot now
