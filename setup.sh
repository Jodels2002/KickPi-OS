#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021

#******************************************** #todo ************* ********************************************
#  - Retropie Amiga - rm CDTV7CD32
#  - https://github.com/jaromaz/MacintoshPi     Basilisk
#  -  Speed up Cronjobs & more
#******************************************** #startup-sequence  :-) ************* ********************************************





sudo cp -R /boot/config.txt /boot/config_backup.txt

clear
echo "Welcome to KickPi-OS"
echo " "
echo " "

     
      sudo apt -y update
      sudo apt-get install -y toilet dialog mc zip unzip wget
      # sudo apt-get install -y network-*
      sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
      	sudo apt purge -y raspberrypi-ui-mods 
	# sudo apt purge -y xser* xor* xin*
      	# sudo apt purge -y gnome*
       	LED
	sudo apt-get -y update
	LED_off
	sudo apt-get -y upgrade
	sudo apt -y autoremove
	LED     
	sudo apt install -y gnome-com*
	#sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput xini* 
	#sudo apt install -y xfce4-te*
	#sudo apt install -y chromium-b*
      sudo apt install ntfs-*

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
	 

cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo chmod -R 777 /home/$USER/Amiga   


 sudo cp -R /home/$USER/KickPi-OS/config/splash.service /etc/systemd/system/splash.service
 sudo cp -R /home/$USER/KickPi-OS/config/splash/Booting.png /etc/systemd/system/Booting.png
 sudo systemctl enable splash
 


sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_expand_rootfs
sudo reboot now
