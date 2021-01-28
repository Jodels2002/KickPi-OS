#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020


#******************************************** #Main Menu ************* ********************************************
#****************************************************************************************************************


HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="Pimiga3000"
TITLE="Pimiga3000 mini Main Menu"
MENU="Please select:"

OPTIONS=(1 "Amiberry - Your Amiga :-) "
         2 "Pimiga3000 Desktop"
         3 "Vice - Your Commodore 64"
         4 "Retropie - Let´s play Games easy")
         

CHOICE=$(dialog --clear \
                --backtitle "$Pimiga3000" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear



case $CHOICE in
        1)
            echo "Pimiga3000 Desktop)"
           
           
            ;;
        2)
            echo "Pimiga3000 Desktop"
          
            ;;
        3)
            echo "Vice - Your Commodore 64"
           
        
            ;;
         4)
            echo "Retropie - Let´s play Games easy4"
           
   
          
            
            ;;
esac
