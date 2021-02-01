#!/bin/bash
# Assign >NIL:  Install PiKickOS - not for use!!!
# Assign >NIL:  B.Titze 2020


#******************************************** #startup-sequence  :-) ************* ********************************************
#****************************************************************************************************************

clear
echo "Good choise :-) "

sudo raspi-config nonint do_boot_behaviour B2
echo "Backup Settings...."


      echo " "
      echo "PiKickOS - Have fun :-)"
      sudo rm -rf ~/.backup
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
      
      fi
     
  
  
   
      sudo reboot
