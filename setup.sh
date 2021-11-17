#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021

#******************************************** #todo ************* ********************************************
#  - Retropie Amiga - rm CDTV7CD32
#  - 
#  - Pimiga zip & upgrde MF -> Menu
#
#  - RClone Rsync-> update always job - Video Tutorials & more
#  -  Speed up Cronjobs & more




#******************************************** #startup-sequence  :-) ************* ********************************************





sudo cp -R /boot/config.txt /boot/config_backup.txt

clear
echo "Welcome to KickPi-OS"
echo " "
echo " "

     
      sudo apt -y update
      sudo apt-get install -y toilet dialog mc zip unzip
      clear
      toilet "KickPi-OS" --metal
     
      whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1



if    [ ! -d "/media/pi/AMIGA/Shared/" ]; then
	 clear
         toilet "KickPi-OS" --metal
         echo " "
         echo " "
	else
	  clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files will take 2-5 min "
          mkdir /home/$USER/Amiga 
	  cp -rf /media/pi/AMIGA/Shared/* ~/Amiga  
	  
          fi

if    [ ! -d "/media/usb0/Shared/" ]; then
         clear
         toilet "KickPi-OS" --metal
         echo " "
         echo " "
	else
	  clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
          echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files to Amibian will take 2-5 min "
	  cp -rf /media/usb0/Shared/* ~/Amiga  
	  
          fi
	  
sudo chmod -R 777 /home/$USER/Amiga 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin	 
sudo cp -R /boot/config.txt /boot/config_backup.txt

REVCODE=$(sudo cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^ *//g' | sed 's/ *$//g')

if [ "$REVCODE" = "a02082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 1 GB RAM"
	echo "$PIMODEL ($REVCODE)"
	sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

sudo cp -R /home/$USER/KickPi-OS/config/config3b.txt /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2

  
sudo reboot

fi
if [ "$REVCODE" = "a020d3" ]; then
    PIMODEL="Raspberry Pi 3 Model B Plus, 1 GB RAM"
	echo "$PIMODEL ($REVCODE)"
	sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo cp -R /home/$USER/KickPi-OS/config/config3b.txt /boot/config.txt

   
sudo reboot

fi
if [ "$REVCODE" = "9000C1" ]; then
    PIMODEL="Raspberry Pi Zero W"
	echo "$PIMODEL ($REVCODE)"
	sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

sudo raspi-config nonint do_boot_behaviour B2

sudo chmod -R 777 /home/$USER/Amiga 
clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      echo "rebooting now ..."
      
      


sudo reboot

fi


if [ "$REVCODE" = "a22082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 2 GB RAM"
	echo "$PIMODEL ($REVCODE)"
	sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo cp -R /home/$USER/KickPi-OS/config/config3b.txt /boot/config.txt

sudo reboot

fi
	 

cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo chmod -R 777 /home/$USER/Amiga   
if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 64 bit is running..."
      echo "rebooting now ..."
      
      sudo cp -R /home/$USER/KickPi-OS/config/config64.txt /boot/config.txt
    
    else 
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      echo "rebooting now ..."
      
     sudo cp -R /home/$USER/KickPi-OS/config/config.txt /boot/config.txt
   
fi 

 sudo cp -R /home/$USER/KickPi-OS/config/splash.service /etc/systemd/system/splash.service
 sudo cp -R /home/$USER/KickPi-OS/config/splash/Booting.png /etc/systemd/system/Booting.png
 sudo systemctl enable splash
 
 sudo cp -R /home/$USER/KickPi-OS/config/splash.service /etc/systemd/system/update_allways.service
 sudo systemctl enable update_allways
 
 
 sudo cp -R /boot/cmdline.txt /home/pi/Documents/cmdline.txt
 sudo chmod -R 777 /home/pi/Documents/cmdline.txt
 
 
 printf %s " console=tty1 logo.nologo quiet loglevel=0 plymouth.enable=0 vt.global_cursor_default=0 plymouth.ignore-serial-consoles splash fastboot noatime nodiratime noram" >> /home/pi/Documents/cmdline.txt
 sudo cp -Rf  /home/pi/Documents/cmdline.txt /boot/cmdline.txt

sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs
sudo reboot now
