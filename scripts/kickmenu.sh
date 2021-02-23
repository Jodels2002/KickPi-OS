#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

clear
if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     echo "Raspberry Pi OS 64 bit is running..."
     
#******************************************** #KickPi-OS 64 Start Menu ******************************************
#****************************************************************************************************************

HEIGHT=40
WIDTH=70
CHOICE_HEIGHT=8
BACKTITLE="Main"
TITLE="KickPi-OS 64 bit"
MENU="Boot select:"

OPTIONS=(d "Boot to KickPi-OS Desktop"
         a "Boot to Amiga  (Amiberry)"
         c "Boot to Console          "
         u "Update KickPi-OS         "
         s "Shutdown                 ")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITL" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   
       
    else 
    #******************************************** #KickPi-OS 32bit Start Menu ***************************************
    #****************************************************************************************************************

HEIGHT=40
WIDTH=70
CHOICE_HEIGHT=8
BACKTITLE="Main"
TITLE="KickPi-OS 32 bit"
MENU="Boot select:"

OPTIONS=(d "Boot to KickPi-OS Desktop"
         a "Boot to Amiga  (Amiberry)"
         c "Boot to Console          "
         u "Update KickPi-OS         "
         s "Shutdown                 ")
        
        

CHOICE=$(dialog --clear \
                --backtitle "$KickPi-OS 32 bitS" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
fi    

cd ~

clear
toilet -F gay KickPi-OS

case $CHOICE in
        
        #1)
        #clear
        #toilet -F gay Amiberry
        #cd /home/$USER/Amiga
        # ./amiberry
     
 
        #    ;;
        
        d)
          # KickPi-OS Desktop
            clear
            toilet "KickPi-OS" --metal
            
            sudo raspi-config nonint do_boot_behaviour B4
            
            ;;
        
                   
         a)
            clear
            toilet "Retropie" --metal
            list="/etc/splashscreen.list"
            clear
             sudo cp -rf /opt/retropie/supplementary/splashscreen/asplashscreen.sh /home/$USER/.backup
             sudo cp -rf /home/$USER/.KickPi-OS/config/asplashscreen.sh /opt/retropie/supplementary/splashscreen/ 
             sudo chmod -R 777 /opt/retropie/supplementary/splashscreen/ 
             sudo raspi-config nonint do_boot_behaviour B2
             sudo rm /etc/splashscreen.list
      
             sudo touch "/etc/splashscreen.list"
             sudo chmod -R 777 /etc/splashscreen.list
             sudo sed -i '/#KickPi/d' "/etc/splashscreen.list"
             sudo sed -i '$a\' "/etc/splashscreen.list"
             echo "/home/$USER/.KickPi-OS/config/splash/Boot.mp4 #KickPi" >>"/etc/splashscreen.list"
          
             sudo cp -rf /home/$USER/.KickPi-OS/Retropie/bsplashscreen.list  /etc/splashscreen.list
      
             echo " "
             echo " "
             echo "System reboots next time to Amiga" 
             echo " "
             echo "Rebooting now..."
             sleep 7s
             reboot
            ;;
         
            
          c)
            #console
            clear
            toilet "KickPi-OS" --metal
            sudo cp -rf /home/$USER/.backup/asplashscreen.sh /opt/retropie/supplementary/splashscreen/asplashscreen.sh 
            sudo raspi-config nonint do_boot_behaviour B2
            echo " "
            echo " "
            echo "System reboots next time to command line" 
            echo " "
            ;; 
                 
        
         s)
            #shutdown
            clear
            s
            ;;  
         u)
            #update
            clear
            u
            ;;  


esac


clear
toilet "KickPi-OS" --metal
cd /usr/local/bin/

