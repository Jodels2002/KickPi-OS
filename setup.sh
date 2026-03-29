#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
# Optimized Version 2026
#******************************************** #startup-sequence  :-) ************* ********************************************
HOME_DIR="/home/pi"


sudo cp -R /boot/config.txt /boot/config_backup.txt





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
if id "pi" &>/dev/null; then
    echo "User 'pi' exists."
else
    echo "Creating user 'pi'..."
    sudo useradd -m -s /bin/bash pi
    echo "pi:03223" | sudo chpasswd
    sudo usermod -aG sudo pi
    sudo chage -M 99999 pi
    sudo chage -m 0 pi
    sudo chage -I -1 pi
    sudo chage -E -1 pi

    echo "Creating standard user directories..."
    sudo mkdir -p $HOME_DIR/{Dokumente,Bilder,Downloads,Musik,Videos,Desktop,Vorlagen,Öffentlich}
    sudo chown -R pi:pi $HOME_DIR

    if [ -d "/home/$USER/KickPi-OS" ]; then
        echo "Copying KickPi-OS directory..."
        sudo cp -R /home/$USER/KickPi-OS $HOME_DIR/
        sudo chown -R pi:pi $HOME_DIR/KickPi-OS
    fi
fi

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

#********************************************
# Splash Screen Service
#********************************************
if [ -f "$HOME_DIR/KickPi-OS/config/splash.service" ]; then
    sudo cp "$HOME_DIR/KickPi-OS/config/splash.service" /etc/systemd/system/splash.service
    sudo cp "$HOME_DIR/KickPi-OS/config/splash/Booting.png" /etc/systemd/system/Booting.png
    sudo systemctl enable splash
fi

#********************************************
# Raspberry Pi specific configuration
#********************************************
if [[ "$SYSTEM_TYPE" == "ARM" ]]; then
    if command -v raspi-config &> /dev/null; then
        echo "Applying Raspberry Pi configurations..."
        sudo raspi-config nonint do_boot_behaviour B2      # Console autologin
        sudo raspi-config nonint do_i2c 0                 # Enable I2C
        sudo raspi-config nonint do_expand_rootfs         # Expand root filesystem
        sudo raspi-config nonint get_ssh                  # Check SSH
    fi
fi
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
