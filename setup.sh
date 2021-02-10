#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021


#******************************************** #startup-sequence  :-) ************* ********************************************
AmigaForever=/media/pi/AMIGA/Shared/
#****************************************************************************************************************


clear
echo "Good choise :-) "
echo " "
echo " "

      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo apt -y update
      whiptail --msgbox "Optional:                                                Now insert your * AMIGA * USB stick with the   * Shared * folder into the Raspberry" 20 50 1
      
if [ ! -f /home/$USER/.backup/.bashrc ]; then
      echo "Backup Settings...."
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp  /home/$USER/.bashrc /home/$USER/.backup/.bashrc
      cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
      sudo chmod -R 777 ~/.bashrc
      echo " "
      echo " "
        
fi
      
      
if    [ ! -d "$AmigaForever" ]; then
          clear
          echo "***  AmigaForever files found ***"
	  echo " "
	  echo " "
          echo "... copy files will take 2-5 min "
	  echo " "
          echo " "
          mkdir /home/$USER/Amiga
	  cp -rf /media/pi/AMIGA/Shared/* /home/$USER/Amiga/
	  	    
fi


sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
sudo raspi-config nonint get_config_var gpu_mem_256 /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
sudo chmod -R 777 /home/$USER/Amiga   
#sudo reboot
