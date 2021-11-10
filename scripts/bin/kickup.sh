#!/bin/bash
# Install KickPi-OS
# B.Titze 2021
# KickPi-OS updater
wget -q --spider http://google.com

if [ $? -eq 0 ]; then
sudo apt-get -y update
sudo apt-get -y upgrade
sudo rm -rf /home/$USER/KickPi-OS/
sudo rm -rf /home/$USER/.KickPi-OS/
cd
#sudo apt -y upgrade
git clone --depth=1 https://github.com/Jodels2002/KickPi-OS.git

sudo chmod -R 777 KickPi-OS

/home/$USER/KickPi-OS/scripts/pikickme.sh
else
    whiptail --msgbox " You are not connected to the Internet." 20 50 1
fi
