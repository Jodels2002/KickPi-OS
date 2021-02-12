#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
#******************************************** #startup-sequence  :-) ************* ********************************************

clear
echo "Welcome to KickPi-OS"
echo " "
echo " "

      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo apt -y update
      whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1

if [ ! -d $HOME/Desktop ]; then
     # PIServer,DietPi, Pimiga.... as Host Distri 

      sudo apt install -y git chromium-browser usbmount gparted synaptic
    
     cd
      git clone --depth=1 https://github.com/RPi-Distro/raspi-config.git
      sudo chmod -R 777 raspi-config
      sudo cp -rf $HOME/raspi-config/* /usr/bin/
      rm raspi-config

        mkdir $HOME/Desktop
        mkdir $HOME/Downloads
        mkdir $HOME/Documents
        mkdir $HOME/Music
        mkdir $HOME/Pictures
        mkdir $HOME/Videos
       
fi      
if [ ! -f /home/$USER/.backup/.bashrc ]; then
      echo "Backup Settings...."
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp  /home/$USER/.bashrc /home/$USER/.backup/.bashrc
      
      sudo chmod -R 777 ~/.bashrc
      echo " "
      echo " "
      fi

if    [ ! -d "/media/pi/AMIGA/Shared/" ]; then
	  clear
	else
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files will take 2-5 min "
          mkdir /home/$USER/Amiga 
	  cp -rf /media/pi/AMIGA/Shared/* ~/Amiga  
	  
          fi

if    [ ! -d "/media/usb0/Shared/" ]; then
          clear
	else
	  clear
          echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files to Amibian will take 2-5 min "
	  cp -rf /media/usb0/Shared/* ~/Amiga  
	  
          fi
	
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo raspi-config nonint get_config_var gpu_mem_256 /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo chmod -R 777 /home/$USER/Amiga   
sudo reboot
