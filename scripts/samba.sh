#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021 SAMBA 
#*************************************************************************************************************


 if [ ! -f /etc/samba/smb.conf ]; then
  
  sudo apt-get install -y samba samba-common-bin
  
   # sudo chmod -R 777  /etc/samba/smb.conf 
   # sudo smbpasswd -a pi
   # Hostname KickPi
  
  sudo cp  -rf  /opt/KickPi-OS/config/smb.conf /etc/samba/smb.conf 
  sudo /etc/init.d/samba restart
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo "Share: 	"
      echo "\\KickPi "
      
      echo "User:	pi"
      echo "Please set a Passwort:"
      sudo smbpasswd -a pi
      echo " "
    
      echo " you have to reboot now..."
      echo " " 
  
  
  fi
  
