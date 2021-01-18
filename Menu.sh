#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Pimiga3000"
TITLE="Title here"
MENU="Please select:"

OPTIONS=(1 "Install Pimiga3000"
         2 "Install Pimiga3000, Retropie & Tools"
         3 "Install Pimiga3000, Pimiga3000 Desktop, Retropie & Tools")

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
            echo "Pimiga3000"
            ;;
        2)
            echo "Pimiga3000, Retropie & Tools"
            ;;
        3)
            echo "Pimiga3000, Pimiga3000 Desktop, Retropie & Tools"
            ;;
esac
