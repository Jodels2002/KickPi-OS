#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
# Optimized Version 2026
#******************************************** #startup-sequence  :-) ************* ********************************************
HOME_DIR="/home/pi"

echo "Detecting system architecture..."

#********************************************
# System Update & Required Packages
#********************************************
echo "Updating system and installing required packages..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y toilet dialog mc zip unzip wget ntfs-3g

#********************************************
# Ensure 'pi' user exists with sudo rights
#********************************************
USER="pi"
PASS="03223"

if ! command -v chpasswd &>/dev/null; then
    echo "chpasswd not found. Installing package..."
    sudo apt-get update
    sudo apt-get install -y passwd
fi

# User anlegen, falls nicht vorhanden
if id "$USER" &>/dev/null; then
    echo "User '$USER' exists. Updating settings..."
else
    echo "Creating user '$USER'..."
    sudo useradd -m -s /bin/bash "$USER"
fi

# Temporär schwache Passwörter erlauben (Debian 13 / PAM)
PAM_FILE="/etc/pam.d/common-password"

echo "Adjusting PAM settings to allow weak password..."
sudo cp "$PAM_FILE" "${PAM_FILE}.bak"

# Entfernt minlen / pwquality Einschränkungen (falls vorhanden)
sudo sed -i 's/\(pam_pwquality.so.*\)/\1 minlen=1/g' "$PAM_FILE"

# Passwort setzen
echo "$USER:$PASS" | sudo chpasswd

# Einstellungen setzen
sudo usermod -aG sudo "$USER"
sudo chage -M 99999 "$USER"
sudo chage -m 0 "$USER"
sudo chage -I -1 "$USER"
sudo chage -E -1 "$USER"

# PAM wieder zurücksetzen
echo "Restoring PAM settings..."
sudo mv "${PAM_FILE}.bak" "$PAM_FILE"

echo "Done."

#********************************************
# Disable password complexity rules
#********************************************
if [ -f /etc/pam.d/common-password ]; then
    sudo sed -i 's/^password\s\+requisite\s\+pam_pwquality.so/#&/' /etc/pam.d/common-password
fi

#********************************************
# Desktop environment cleanup
#********************************************
sudo apt purge -y lxde* openbox* raspberrypi-ui-mods gnome* gdm3 || true

clear
toilet "KickPi-OS" --metal

#********************************************
# File Permissions & Script Deployment
#********************************************
if [ -d "$HOME_DIR/KickPi-OS/scripts" ]; then
    sudo cp -R "$HOME_DIR/KickPi-OS/scripts/"* /usr/local/bin/
    sudo chmod -R 777 /usr/local/bin/
fi

if [ -f "$HOME_DIR/KickPi-OS/scripts/bashrc" ]; then
    sudo cp "$HOME_DIR/KickPi-OS/scripts/bashrc" $HOME_DIR/.bashrc
    sudo chown pi:pi $HOME_DIR/.bashrc
    sudo chmod 777 $HOME_DIR/.bashrc
fi


if [ -f "$HOME_DIR/KickPi-OS/config/splash.service" ]; then
    sudo cp "$HOME_DIR/KickPi-OS/config/splash.service" /etc/systemd/system/splash.service
    sudo cp "$HOME_DIR/KickPi-OS/config/splash/Booting.png" /etc/systemd/system/Booting.png
    sudo systemctl enable splash
    sudo sed -i 's/$/ quiet splash loglevel=0 vt.global_cursor_default=0/' /boot/cmdline.txt
fi

#********************************************
# Raspberry Pi specific configuration
#********************************************
echo "Installing required dependencies..."
sudo apt install -y whiptail lua5.1 alsa-utils

echo "Cloning raspi-config repository..."
git clone https://github.com/RPi-Distro/raspi-config.git

cd raspi-config

echo "Making raspi-config executable..."
chmod +x raspi-config

echo "Installing raspi-config system-wide..."
sudo cp raspi-config /usr/local/bin/

echo "Cleaning up..."
cd ..
rm -rf raspi-config

echo "Done! You can now run 'raspi-config'"


        echo "Applying Raspberry Pi configurations..."
        sudo raspi-config nonint do_boot_behaviour B2      # Console autologin
        sudo raspi-config nonint do_i2c 0                 # Enable I2C
        sudo raspi-config nonint do_expand_rootfs         # Expand root filesystem
        sudo raspi-config nonint get_ssh                  # Check SSH

#********************************************
# Raspberry Pi HDD auf Pin 27
#********************************************
if ! grep -q "^dtparam=act_led_gpio=27" /boot/firmware/config.txt; then
    echo "dtparam=act_led_gpio=27" | sudo tee -a /boot/firmware/config.txt > /dev/null
fi

echo "Final cleanup..."
sudo apt autoremove -y

echo "Installation complete. Rebooting ..."
sleep 1
sudo reboot now
