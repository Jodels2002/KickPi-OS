!/bin/bash
# Assign >NIL:  Install PimigaOS - not for use!!!
# Assign >NIL:  B.Titze 2020


#******************************************** #startup-sequence  :-) ************* ********************************************
#****************************************************************************************************************

echo "good choise :-) "
sudo raspi-config nonint do_boot_behaviour B2
echo "Backup Settings...."


      echo " "
      echo "PimigaOS - Have fun :-)"
 
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp  /home/$USER/.bashrc /home/$USER/.backup/.bashrc
      cp  /home/$USER/Pimiga_mini/scripts/.bashrc /home/$USER/.bashrc
      sudo chmod -R 777 ~/.bashrc
      echo " "
      echo " "
      echo "Assign >NIL: Okey, rebooting..."
      echo " "
      sudo reboot
