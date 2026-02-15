#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
# Optimized Version 2026
#******************************************** #startup-sequence  :-) ************* ********************************************
sudo cp -R /boot/config.txt /boot/config_backup.txt

set -e

echo "Detecting system architecture..."

ARCH=$(uname -m)

if [[ "$ARCH" == "arm"* || "$ARCH" == "aarch64" ]]; then
    SYSTEM_TYPE="ARM"
elif [[ "$ARCH" == "x86_64" || "$ARCH" == "i386" || "$ARCH" == "i686" ]]; then
    SYSTEM_TYPE="X86"
else
    SYSTEM_TYPE="UNKNOWN"
fi

echo "System architecture detected: $SYSTEM_TYPE ($ARCH)"
sleep 2

#********************************************
# Backup boot config (only if exists)
#********************************************
if [ -f /boot/config.txt ]; then
    sudo cp /boot/config.txt /boot/config_backup.txt
fi

clear
echo "Welcome to KickPi-OS"
echo " "
echo " "

#********************************************
# System Update
#********************************************
sudo apt update -y

#********************************************
# Install required packages
#********************************************
sudo apt install -y \
    toilet \
    dialog \
    mc \
    zip \
    unzip \
    wget \
    ntfs-3g

#********************************************
# Ensure user 'pi' exists with sudo rights
#********************************************

echo "Checking for user 'pi'..."

if id "pi" &>/dev/null; then
    echo "User 'pi' already exists."
else
    echo "User 'pi' does not exist. Creating..."
    sudo useradd -m -s /bin/bash pi
fi

echo "Setting password for user 'pi'..."
#echo "pi:03223" | sudo chpasswd

echo "Adding user 'pi' to sudo group..."
sudo usermod -aG sudo pi

echo "Removing password aging restrictions..."
sudo chage -M 99999 pi
sudo chage -m 0 pi
sudo chage -I -1 pi
sudo chage -E -1 pi



echo "Disabling password complexity rules..."
if [ -f /etc/pam.d/common-password ]; then
    sudo sed -i 's/^password\s\+requisite\s\+pam_pwquality.so/#&/' /etc/pam.d/common-password
fi

#********************************************
# Desktop environment changes
#********************************************
sudo apt purge -y lxde lxde-common lxde-core openbox-lxde-session || true
sudo apt purge -y raspberrypi-ui-mods || true



clear
toilet "KickPi-OS" --metal

#********************************************
# File Permissions & Script Deployment
#********************************************
if [ -d "/home/$USER/Amiga" ]; then
    sudo chmod -R 777 /home/$USER/Amiga
fi

if [ -d "/home/$USER/KickPi-OS/scripts" ]; then
    sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
fi

if [ -f "/home/$USER/KickPi-OS/scripts/bashrc" ]; then
    cp /home/$USER/KickPi-OS/scripts/bashrc /home/pi/.bashrc
fi

#********************************************
# Splash Screen Service
#********************************************
if [ -f "/home/$USER/KickPi-OS/config/splash.service" ]; then
    sudo cp /home/$USER/KickPi-OS/config/splash.service /etc/systemd/system/splash.service
    sudo cp /home/$USER/KickPi-OS/config/splash/Booting.png /etc/systemd/system/Booting.png
    sudo systemctl enable splash
fi

#********************************************
# Raspberry Pi specific configuration (only ARM)
#********************************************
if [[ "$SYSTEM_TYPE" == "ARM" ]]; then
    if command -v raspi-config &> /dev/null; then
        sudo raspi-config nonint do_boot_behaviour B2
        sudo raspi-config nonint get_ssh
        sudo raspi-config nonint do_i2c 0
        sudo raspi-config nonint do_expand_rootfs
    fi
fi
sudo apt install -y gnome* || true

echo "Installation complete."
sleep 2

sudo reboot now
