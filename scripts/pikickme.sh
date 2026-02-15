#!/bin/bash
# ==========================================================
# KickPi-OS Unified Installer (Optimized 2026)
# Original: B. Titze 2021
# ==========================================================

set -o pipefail

clear

# ----------------------------------------------------------
# Architektur-Erkennung
# ----------------------------------------------------------
ARCH=$(uname -m)
BITS=$(getconf LONG_BIT)

if [[ "$ARCH" == arm* || "$ARCH" == aarch64 ]]; then
    SYSTEM="ARM"
elif [[ "$ARCH" == x86_64 || "$ARCH" == i386 || "$ARCH" == i686 ]]; then
    SYSTEM="X86"
else
    SYSTEM="UNKNOWN"
fi

if [[ "$SYSTEM" == "ARM" ]] && command -v raspi-config &>/dev/null; then
    RPI=true
else
    RPI=false
fi

echo "Detected System: $SYSTEM ($ARCH / ${BITS}bit)"
sleep 2

# ----------------------------------------------------------
# Basis Vorbereitung
# ----------------------------------------------------------
mkdir -p "$HOME/.backup"
chmod -R 755 "$HOME/KickPi-OS" 2>/dev/null || true

if [ -d "$HOME/KickPi-OS/scripts" ]; then
    sudo cp -rf "$HOME/KickPi-OS/scripts/"* /usr/local/bin/
fi

[ -f /usr/local/bin/uk ] && sudo mv /usr/local/bin/uk /usr/local/bin/u

clear
toilet "KickPi-OS" --metal

echo "Installing KickPi-OS Update System..."

# ----------------------------------------------------------
# Hilfsfunktionen
# ----------------------------------------------------------
raspi_only() {
    if $RPI; then "$@"; fi
}

oled_present() {
    [ -d /OLED/ ]
}

apt_install() {
    sudo apt install -y "$@"
}

apt_update_upgrade() {
    sudo apt update -y
    sudo apt upgrade -y
}

# ----------------------------------------------------------
# OLED Setup
# ----------------------------------------------------------
OLED() {

if ! oled_present; then return; fi

clear
toilet "KickPi-OS" --metal
echo "Configuring OLED..."

raspi_only sudo raspi-config nonint do_i2c 0

apt_install python3 python3-pip python3-dev python3-smbus \
            i2c-tools python3-pil python3-setuptools \
            libffi-dev libssl-dev

sudo python3 -m pip install --upgrade pip setuptools wheel
sudo pip3 install Adafruit-SSD1306 amitools || true

sudo cp -rf "$HOME/KickPi-OS/OLED/" /
sudo chmod -R 755 /OLED/

(crontab -l 2>/dev/null; echo "*/5 * * * * /usr/local/bin/loop.sh") | crontab -

oled_present && KickPi-OS.sh
}

# ----------------------------------------------------------
# Update
# ----------------------------------------------------------
KickPi_OS_Update() {
oled_present && update.sh
apt_update_upgrade
}

# ----------------------------------------------------------
# Desktop
# ----------------------------------------------------------
KickPi_OS_Desktop() {

clear
toilet "KickPi-OS" --metal
echo "Installing Desktop..."

sudo apt purge -y lxde lxde-common lxde-core openbox-lxde-session || true
raspi_only sudo apt purge -y raspberrypi-ui-mods

apt_update_upgrade
sudo apt autoremove -y

apt_install gnome-core xserver-xorg xfce4 xfce4-goodies \
            chromium-browser fs-uae

raspi_only sudo update-rc.d motd remove
}

# ----------------------------------------------------------
# Tools
# ----------------------------------------------------------
KickPi_OS_Tools() {

clear
toilet "KickPi-OS" --metal
echo "Installing Tools..."

apt_install mc zip unzip gparted mednaffe git usbmount \
            geany geany-plugins-common xmlstarlet \
            grafx2 worker

git clone --depth=1 https://github.com/rewtnull/amigafonts "$HOME/amigafonts" || true
sudo cp -rf "$HOME/amigafonts/ttf/"* /usr/share/fonts/truetype/ 2>/dev/null || true
}

# ----------------------------------------------------------
# Amiberry 
# ----------------------------------------------------------
KickPi_OS_Amiberry() {


mkdir -p "$HOME/Amiga/conf"

  sudo apt install -y  build-essential git cmake libsdl2-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev libenet-dev libpcap-dev libzstd-dev

if [ "$BITS" == "64" ]; then
    echo "Installing Amiberry 64bit..."
else
    echo "Installing Amiberry 32bit..."
fi
}

# ----------------------------------------------------------
# RetroPie 
# ----------------------------------------------------------
KickPi_OS_Retropie() {



if [ ! -d "$HOME/RetroPie-Setup" ]; then
    git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git "$HOME/RetroPie-Setup"
fi

cd "$HOME/RetroPie-Setup"
sudo __nodialog=1 ./retropie_packages.sh setup basic_install
}

# ----------------------------------------------------------
# Office
# ----------------------------------------------------------
KickPi_OS_Office() {
apt_install libreoffice
}

# ----------------------------------------------------------
# Video
# ----------------------------------------------------------
KickPi_OS_Video() {
apt_install gimp
}

# ----------------------------------------------------------
# Internet
# ----------------------------------------------------------
KickPi_OS_Internet() {
apt_install transmission firefox-esr
}

# ----------------------------------------------------------
# Menü
# ----------------------------------------------------------
HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4

OPTIONS=(
1 "Light (Desktop)"
2 "Basic (Desktop + Amiberry)"
3 "Full (RetroPie + Office + Video)"
)

CHOICE=$(dialog --clear \
--title "KickPi-OS Installer" \
--menu "Select Installation Type" \
$HEIGHT $WIDTH $CHOICE_HEIGHT \
"${OPTIONS[@]}" \
2>&1 >/dev/tty)

clear

# ----------------------------------------------------------
# Ablauf
# ----------------------------------------------------------
OLED
KickPi_OS_Update

case $CHOICE in
1)
    KickPi_OS_Tools
    KickPi_OS_Desktop
    KickPi_OS_Amiberry
    ;;
2)
    KickPi_OS_Desktop
    KickPi_OS_Tools
    KickPi_OS_Amiberry
    KickPi_OS_Internet
    ;;
3)
    KickPi_OS_Desktop
    KickPi_OS_Tools
    KickPi_OS_Amiberry
    KickPi_OS_Retropie
    KickPi_OS_Office
    KickPi_OS_Video
    KickPi_OS_Internet
    ;;
esac

# ----------------------------------------------------------
# Cleanup
# ----------------------------------------------------------
echo "Finalizing..."

raspi_only sudo raspi-config nonint get_ssh

sudo apt -f install -y
sudo apt autoremove -y

rm -rf ~/.cache ~/.local/share/Trash

toilet "KickPi-OS" --metal
echo "Installation complete."

if command -v startx &>/dev/null; then
    echo "Type 'startx' to launch desktop."
else
    echo "Reboot recommended."
fi

if  xset q &>/dev/null; then
cd
clear
toilet "KickPi-OS" --metal
echo "KickPI-OS ROM Operating System and Libraries" 
echo "Version V1.5 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo "Type 'd' to boot into Kick-OS Workbench"
echo ""
echo "1.>  "
echo "1.>  ( a ) Boot to Amiberry if default config exist" 
echo "1.>  ( d ) KickPi Desktop                          " 
echo "1.>  ( e ) Emulationstation              (RetroPie)" 
echo "1.>  ( r ) Emulationstation Setup                  "
echo "1.>  ( u ) KickPi-OS Update                        "
echo "1.>  ( m ) Boot select                             " 
echo "1.>  ( c ) Raspi-Config                            "
echo "1.>  ( s ) Shutdown                                "  
echo ""
	else 

startx
fi
