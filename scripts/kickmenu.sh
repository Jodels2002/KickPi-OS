#!/bin/bash
# Install KickPi-OS
# B.Titze 2020

clear
if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     echo "Raspberry Pi OS 64 bit is running..."
     
#******************************************** #KickPi-OS 64 Start Menu ******************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="KickPi-OS 64 bit"
TITLE="Main Menu"
MENU="Please select:"

OPTIONS=(1 "Start your Amiberry Amiga"
         2 "Start your KickPi-OS Desktop"
         3 "Start Retropie EmulationStation"
         c "Setup Raspie-Config"
         3 "Shutdown ")
        

CHOICE=$(dialog --clear \
                --backtitle "$KickPi-OS" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   
       
    else 
    #******************************************** #KickPi-OS 32bit Start Menu ***************************************
    #****************************************************************************************************************
   HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="KickPi-OS 64 bit"
TITLE="Main Menu"
MENU="Please select:"

OPTIONS=(1 "Install KickPi-OS light"
         2 "Install KickPi-OS full, Retropie, ..."
         3 "Convert to KickPi-OS, Retropie, OlED & LED ")
        

CHOICE=$(dialog --clear \
                --backtitle "$KickPi-OS" \
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
        cd /$USER/amiberry
         ./amiberry
     
 
            ;;
        
        2)
            clear
            toilet -F gay KickPi-OS Desktop
            startx
            
            ;;
        
        3)
            clear
            toilet -F gay Retropie
            emulationstation   
            ;;
            
                 
          c)
            clear
            toilet -F gay Configure
            sudo raspi-config
            ;;
            
           s)
            clear
            toilet -F gay shutdown
            shutdown
               
           
            ;;  

esac


clear
toilet -F gay KickPi-OS
kickmenu
