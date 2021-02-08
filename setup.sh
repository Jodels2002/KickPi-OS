#!/bin/bash
# Assign >NIL:  Install KickPi-OS - not for use!!!
# Assign >NIL:  B.Titze 2021


#******************************************** #startup-sequence  :-) ************* ********************************************
#****************************************************************************************************************

clear
echo "Good choise :-) "

      
      sudo rm -rf ~/.KickPi-OS
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo apt -y update
      
      if [ ! -f /home/$USER/.backup/.bashrc ]; then
      echo "Backup Settings...."
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp  /home/$USER/.bashrc /home/$USER/.backup/.bashrc
      cp  /home/$USER/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
      sudo chmod -R 777 ~/.bashrc
      echo " "
      echo " "
      
      else
      
      echo "Everything is fine... :-)"
    
      fi
      
      if [[ ! -d "/media/pi/AMIGA/Shared/" ]]; then
          clear
          echo "AmigaForever found "
          echo "... just a second... "
          mkdir /home/$USER/Amiga
          cp -rf /media/pi/AMIGA/Shared/* /home/$USER/Amiga
	    
      fi


sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
sudo raspi-config nonint get_config_var gpu_mem_256 /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
   
sudo reboot
