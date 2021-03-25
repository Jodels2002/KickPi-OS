#!/bin/bash
#
# Description : Compile cool-retro-term based on QT5
# Author      : Jose Cerrejon Gonzalez (ulysess@gmail_dot._com)
# Version     : 1.0.0 (13/Aug/20)
#
./helper.sh
clear


PACKAGES_DEV=(qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-localstorage qml-module-qtquick-window2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel)
GITHUB_PATH="https://github.com/Swordfish90/cool-retro-term.git"
SHORTCUT_PATH="/usr/share/applications/cool-retro-term.desktop"
ICON_PATH_ORIG="$HOME/sc/cool-retro-term/app/icons/32x32/cool-retro-term.png"
ICON_PATH_DEST="/usr/share/icons/hicolor/32x32/apps/cool-retro-term.png"

runme() {
	if [ ! -f /usr/bin/cool-retro-term ]; then
		echo -e "\nFile does not exist.\n· Something is wrong.\n· Try to install again."
		exit_message
	fi
	
	cool-retro-term
	exit_message
}

fix_icon() {
    echo -e "\nFixing shortcut icon..."
    sudo cp -f "$ICON_PATH_ORIG" "$ICON_PATH_DEST"
    sudo sed -i 's/Icon=cool-retro-term/Icon=\/usr\/share\/icons\/hicolor\/32x32\/apps\/cool-retro-term.png/g' "$SHORTCUT_PATH"
}

compile() {
	sudo apt install -y "${PACKAGES_DEV[@]}"
	mkdir -p "$HOME"/sc && cd "$_"
	echo "Cloning and compiling repo..."
    if [[ ! -d "$HOME"/sc/cool-retro-term ]]; then
	    git clone --recursive "$GITHUB_PATH" cool-retro-term
    fi
    cd "$HOME"/sc/cool-retro-term
    qmake && make -j"$(nproc)" OPTOPT="-march=armv8-a+crc -mtune=cortex-a53"
    sudo make install
    fix_icon
   
    #runme
}

compile64() {
	sudo apt install -y "${PACKAGES_DEV[@]}"
	mkdir -p "$HOME"/sc && cd "$_"
	echo "Cloning and compiling repo..."
    if [[ ! -d "$HOME"/sc/cool-retro-term ]]; then
	    git clone --recursive "$GITHUB_PATH" cool-retro-term
    fi
    cd "$HOME"/sc/cool-retro-term
        qmake 
	make -j8 
        sudo chmod -R 777 /home/$USER/sc/ 
    fix_icon
   
    #runme
}

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""
      compile64
    else 
      clear
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
      toilet "KickPi-OS" --metal
      compile
fi


