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
BACKTITLE="KickPi-OS 64 bit"
TITLE="Main Menu"
MENU="Please select:"

OPTIONS=(1 "Start your Amiberry Amiga"
         2 "Start your KickPi-OS Desktop"
         c "Setup Raspie-Config"
         u "Update KickPi-OS"
         s "Shutdown ")
        

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
BACKTITLE="KickPi-OS 32 bit"
TITLE="Main Menu"
MENU="Please select:"

OPTIONS=(1 "Start your Amiberry Amiga"
         2 "Start your KickPi-OS Desktop"
         e "Start your RetroPi"
         r "Setup Retropie"
         l "Load more RetroPi
         c "Setup Raspie-Config"
         u "Update KickPi-OS"
         s "Shutdown ")
        
        

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
        
        1)
        clear
        toilet -F gay Amiberry
        cd /home/$USER/Amiga
         ./amiberry
     
 
            ;;
        
        2)
            clear
            toilet -F gay KickPi-OS
            toilet -F gay Desktop
            startx
            
            ;;
        
        3)
            clear
            toilet -F gay Retropie
            emulationstation   
            ;;
            
         e)
            clear
            toilet -F gay Retropie
            emulationstation
            ;;
         l)
            clear
            toilet -F gay Retropi content
            cd /usr/local/bin/
            ./retro_up.sh
            ;;
            
          r)
            clear
            toilet -F gay Retropie Setup
            cd Retropie-Setup
            sudo ./retropie-setup.sh
            ;; 
                 
         c)
            clear
            toilet -F gay Configure
            sudo raspi-config
            ;;
            
         s)
            clear
            toilet -F gay Shutdown
            shutdown -P
             ;;  
         u)
            clear
            toilet -F gay Update
            cd /usr/local/bin/
            ./kickup.sh
             ;;  


esac


clear
toilet -F gay KickPi-OS
cd /usr/local/bin/
./kickup.sh
