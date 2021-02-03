#!/bin/bash
# Install KickPi-OS
# B.Titze 2020
# KickPi-OS updater

sudo rm -rf /home/$USER/KickPi-OS/
sudo rm -rf /home/$USER/.KickPi-OS/

git clone --depth=1 https://github.com/Jodels2002/KickPi-OS.git

sudo chmod -R 777 KickPi-OS

KickPi-OS/scripts/pikickme.sh
