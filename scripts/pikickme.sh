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

toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo " "
      echo "Installing KickPi-OS Update System ..."
      echo " "
      	
      sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
      sudo apt purge -y raspberrypi-ui-mods 
	# sudo apt purge -y xser* xor* xin*

	LED     
	sudo apt install -y gnome-com*
	sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput xini* 
	sudo apt install -y xfce4-te*
	sudo apt install -y chromium-b*
	  clear
      	        toilet "KickPi-OS" --metal
      	        echo " "
      	        echo " "
		echo "KickPI-OS ROM Operating System and Libraris" 
		echo "Version V1.5 2020-2021 KickPi-OS "
		echo "No Rights Reserved.  "
		echo ""

	
  # Preconfigure Silent Boot

      mkdir /home/$USER/.backup/profile.d
      sudo mv  /etc/rc.local ~/.backup/
      
      sudo cp -rf /home/$USER/KickPi-OS/config/rc.local /etc/rc.local
      sudo chmod -R 777 /etc/rc.local
      sudo systemctl mask plymouth-start.service
      sudo systemctl mask syslog.service
      sudo systemctl mask cups.service
      sudo systemctl mask cups-browsed.service
            
     cd
      git clone --depth=1 https://github.com/RPi-Distro/raspi-config.git
      sudo chmod -R 777 raspi-config
      sudo cp -rf $HOME/raspi-config/* /usr/bin/
      rm raspi-config

        mkdir $HOME/Desktop
        mkdir $HOME/Downloads
        mkdir $HOME/Documents
        mkdir $HOME/Music
        mkdir $HOME/Pictures
        mkdir $HOME/Videos
      
  
       cd ~/KickPi-OS/
	   unzip -u /home/$USER/KickPi-OS/.pac/data.pac
	   cp -rf /home/$USER/KickPi-OS/data/.config/ /home/$USER/
       cp -rf /home/$USER/KickPi-OS/data/.local/ /home/$USER/ 
                
      sudo chmod -R 777 /home/$USER/KickPi-OS
      sudo rm -rf /home/$USER/.cache
     
	  # Fresh install Amiga Desktop
    

      cd /usr/share/icons/
      
      sudo cp -rf /home/$USER/KickPi-OS/data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip -u  /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      



      cd /home/$USER/KickPi-OS
      git clone --depth=1 https://github.com/x64k/amitk
      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      sudo cp -rf /home/$USER/KickPi-OS/amitk /usr/share/themes
      
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      sudo cp -rf /home/$USER/KickPi-OS/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /home/$USER/KickPi-OS/config/rpd-wallpaper/* /usr/share/backgrounds/
      sudo cp -rf /home/$USER/KickPi-OS/config/rpd-wallpaper/* /usr/share/images/desktop-base/  
      sudo cp -rf /home/$USER/KickPi-OS/config/rpd-wallpaper/16bitMemories.png /usr/share/images/desktop-base/default
   
      sudo chmod -R 777 /usr/share/images/desktop-base/  

setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,uk,de,fr,it,gr,dk
cp -rf ~/KickPi-OS/config/Desktop/* /home/$USER/Desktop/

cd ~/KickPi-OS/
	   unzip -u /home/$USER/KickPi-OS/.pac/data.pac
	   cp -rf /home/$USER/KickPi-OS/data/.config/ /home/$USER/
       cp -rf /home/$USER/KickPi-OS/data/.local/ /home/$USER/ 
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
sudo apt install -y libreoffice
}

# ----------------------------------------------------------
# Video
# ----------------------------------------------------------
KickPi_OS_Video() {
sudo apt install -y gimp
}

# ----------------------------------------------------------
# Internet
# ----------------------------------------------------------
KickPi_OS_Internet() {
sudo apt install -y transmission firefox-esr
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
