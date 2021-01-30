#!/bin/bash
# Assign >NIL:  Install PimigaOS - not for use!!!
# Assign >NIL:  B.Titze 2020


#******************************************** #startup-sequence  :-) ************* ********************************************
#****************************************************************************************************************

echo "good choise :-) "
sudo raspi-config nonint do_boot_behaviour B2
echo "Backup Settings...."


      echo " "
      echo "PimigaOS - Have fun :-)"
      sudo cp -R /home/$USER/Pimiga_mini/scripts/* /usr/local/bin
      
      
if [ ! -f /home/$USER/.backup/.bashrc ]; then
      echo "Backup Settings...."
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp  /home/$USER/.bashrc /home/$USER/.backup/.bashrc
      cp  /home/$USER/Pimiga_mini/scripts/.bashrc /home/$USER/.bashrc
      sudo chmod -R 777 ~/.bashrc
      echo " "
      echo " "
      
      fi
      
      echo "Assign >NIL: Okey, rebooting..."
      echo "Relaxe! "
      sudo reboot
