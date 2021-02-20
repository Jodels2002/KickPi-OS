# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ ! -f /home/$USER/Amiga/conf/default.uae ]; then

 if [ ! -d /home/pi/.backup/splashscreen/ ]; then
#
     clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "  Configure Amiberry quickstart ...     " 
      echo " "
      echo " "
      
      sudo cp -rf /opt/retropie/supplementary/splashscreen/ /home/$USER/.backup/
      sudo cp -rf /home/$USER/KickPi-OS/config/asplashscreen.sh /opt/retropie/supplementary/splashscreen/ 
      
clear
      else 
      clear
      echo " wrong"
      
      sleep 2s
          
      fi     
      
      clear
      toilet -F gay KickPi-OS
      cd /home/$USER/KickPi-OS/Amiga/
      ./amiberry -f /home/$USER/KickPi-OS/Amiga/conf/Kick.uae
      
fi
clear
toilet "KickPi-OS" --metal
echo "KickPI-OS ROM Operating System and Libraris" 
echo "Version V1.1 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo "Type 'd' to boot into Kick-OS Workbench"
echo ""
echo "1.>  "
echo "1.>  ( a ) Amiga                     Start Amiberry" 
echo "1.>  ( d ) KickPi Desktop                          " 
echo "1.>  ( e ) Emulationstation              (RetroPie)" 
echo "1.>  ( r ) Emulationstation Setup                  "
echo "1.>  ( u ) KickPi-OS Update    not in Desktop Mode!"
echo "1.>  ( m ) Kick-OS Menu                            " 
echo "1.>  ( c ) Raspi-Config                            "
echo "1.>  ( s ) Shutdown                                "  
echo ""
