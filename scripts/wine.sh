sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

sudo dpkg --add-architecture i386 && sudo apt update
sudo apt -y install \
      wine \
      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
