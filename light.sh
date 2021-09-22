#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
#******************************************** #startup-sequence  :-) ************* ********************************************

clear
echo "Welcome to KickPi-OS"
echo " "
echo "Assign >NIL:  Install KickPi-OS"
echo "Assign >NIL:  B.Titze 2021 "

     
      sudo apt -y update
      sudo apt-get install -y toilet dialog mc zip unzip
      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo "rebooting now ..."

mkdir /home/$USER/Amiga   
sudo chmod -R 777 /home/$USER/Amiga 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin	 
sudo cp -R /boot/config.txt /boot/config_backup.txt
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

sudo raspi-config nonint do_boot_behaviour B2



sudo reboot
