#!/bin/bash
# Assign >NIL:  Install KickPi-OS - not for use!!!
# Assign >NIL:  B.Titze 2021


#******************************************** #startup-sequence  :-) ************* ********************************************
#****************************************************************************************************************

clear
echo "Good choise :-) "

      
      sudo rm -rf ~/.KickPi-OS
      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      
      
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
      
      echo " Not the first try... update?"
    
      
fi
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
   
      #sudo reboot
