#!/bin/bash
set -e

# -------------------------------------------------------
# KickPi‑OS Installer – Optimierte Version
# -------------------------------------------------------

USER_HOME="/home/$USER"
KICKPI="$USER_HOME/KickPi-OS"
BIT=$(getconf LONG_BIT)

log() {
    echo -e "\n[KickPi‑OS] $1\n"
}

header() {
    clear
    toilet "KickPi‑OS" --metal
    [ -n "$1" ] && toilet "$1" --metal
}

require_dir() {
    [ ! -d "$1" ] && mkdir -p "$1"
}

safe_copy() {
    [ -e "$1" ] && sudo cp -rf "$1" "$2"
}

fix_permissions() {
    sudo chown -R $USER:$USER "$KICKPI"
    sudo chmod -R u+rwX,go+rX "$KICKPI"
}

# -------------------------------------------------------
# OLED Installation
# -------------------------------------------------------

install_oled() {
    header "OLED"

    if [ ! -d "/OLED" ]; then
        log "Aktiviere I2C"
        sudo raspi-config nonint do_i2c 0

        log "Installiere OLED‑Pakete"
        sudo apt install -y python3 python3-pip python3-dev python3-smbus \
            i2c-tools libjpeg-dev libfreetype6-dev libopenjp2-7 libtiff6 \
            libffi-dev libssl-dev

        python3 -m pip install --break-system-packages \
            adafruit-blinka adafruit-circuitpython-ssd1306 pillow

        log "Kopiere OLED‑Dateien"
        sudo cp -rf "$KICKPI/OLED" /

        if [ -f "$KICKPI/conf/rc.local" ]; then
            sudo cp "$KICKPI/conf/rc.local" /etc/
            sudo chmod 755 /etc/rc.local
        fi

        log "Cronjob setzen"
        (crontab -l 2>/dev/null; echo "*/5 * * * * /usr/local/bin/loop.sh") | crontab -
    fi

    log "OLED Installation abgeschlossen"
}

# -------------------------------------------------------
# Desktop Installation
# -------------------------------------------------------

install_desktop() {
    header "Desktop"

    log "Entferne LXDE"
    sudo apt purge -y lxde* raspberrypi-ui-mods

    log "Installiere XFCE"
    sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput

    for d in Desktop Documents Downloads Music Pictures Videos; do
        require_dir "$USER_HOME/$d"
    done

    log "Installiere Amiga‑Themes"
    sudo unzip -o "$KICKPI/data/AMIGAOSLINUX.zip" -d /usr/share/icons/
    sudo cp -rf /usr/share/icons/AMIGAOSLINUX /usr/share/icons/default

    log "Installiere XFWM4‑Themes"
    git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes "$KICKPI/amigaos_xfwm4_themes"
    sudo cp -rf "$KICKPI/amigaos_xfwm4_themes"/* /usr/share/themes/
}

# -------------------------------------------------------
# Tools
# -------------------------------------------------------

install_tools() {
    header "Tools"

    sudo apt install -y mc zip unzip gparted bluez bluez-firmware baobab \
        git usbmount geany geany-plugins-common xmlstarlet \
        build-essential cmake libsdl3-dev libsdl3-image-dev libflac-dev \
        libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev \
        libportmidi-dev libenet-dev libpcap-dev libzstd-dev \
        libcurl4-openssl-dev nlohmann-json3-dev libdbus-1-dev

    log "Installiere Amiga‑Fonts"
    git clone --depth=1 https://github.com/rewtnull/amigafonts "$KICKPI/amigafonts"
    sudo cp -rf "$KICKPI/amigafonts/ttf"/* /usr/share/fonts/truetype/
}

# -------------------------------------------------------
# Amiberry
# -------------------------------------------------------

install_amiberry() {
    header "Amiberry"

    require_dir "$USER_HOME/Amiga"
    require_dir "$USER_HOME/Amiga/conf"

    sudo apt install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 \
        flac mpg123 libmpeg2-4 libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev \
        libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev

    if [ "$BIT" = "64" ]; then
        log "Installiere Amiberry 64‑bit (manuelle Installation erforderlich)"
    else
        log "Installiere Amiberry 32‑bit"
        unzip -o "$KICKPI/Amiga/amiberry-v5.0-rpi4-sdl2-32bit-rpios.zip" -d "$USER_HOME/Amiga"
        unzip -o "$KICKPI/Amiga/amiberry-v5.0-rpi4-dmx-32bit-retropie.zip" -d "$USER_HOME/Amiga"
        cp -rf "$KICKPI/Amiga/conf"/* "$USER_HOME/Amiga/conf/"
    fi
}

# -------------------------------------------------------
# Amiga Grundsystem
# -------------------------------------------------------

configure_amiga() {
    header "Amiga"

    if [ ! -f "$USER_HOME/Amiga/adf/sysinfo.ADF" ]; then
        cp "$KICKPI/Amiga/Amiga.zip" "$USER_HOME"
        unzip -o "$USER_HOME/Amiga.zip" -d "$USER_HOME"
        rm "$USER_HOME/Amiga.zip"

        sudo python3 -m pip install -U pip setuptools
        sudo pip install amitools
    fi
}

# -------------------------------------------------------
# RetroPie
# -------------------------------------------------------

install_retropie() {
    header "RetroPie"

    if [ ! -d "$USER_HOME/RetroPie-Setup" ]; then
        git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git "$USER_HOME/RetroPie-Setup"
        sudo chmod -R 755 "$USER_HOME/RetroPie-Setup"
    fi

    sudo __nodialog=1 "$USER_HOME/RetroPie-Setup/retropie_packages.sh" setup basic_install
}

# -------------------------------------------------------
# Menü
# -------------------------------------------------------

show_menu() {
    dialog --clear \
        --backtitle "KickPi‑OS" \
        --title "Welche Version installieren?" \
        --menu "Bitte auswählen:" 20 70 4 \
        1 "KickPi‑OS Light (nur Desktop)" \
        2 "KickPi‑OS Basic (Desktop + Amiberry)" \
        3 "KickPi‑OS Full (inkl. RetroPie)" \
        2>&1 >/dev/tty
}

# -------------------------------------------------------
# Hauptablauf
# -------------------------------------------------------

main() {
    CHOICE=$(show_menu)

    case $CHOICE in
        1)
            install_oled
            install_tools
            install_desktop
            ;;
        2)
            install_oled
            install_desktop
            install_tools
            install_amiberry
            configure_amiga
            ;;
        3)
            install_oled
            install_desktop
            install_tools
            install_amiberry
            configure_amiga
            install_retropie
            ;;
    esac

    fix_permissions
    log "Installation abgeschlossen!"
}

main
