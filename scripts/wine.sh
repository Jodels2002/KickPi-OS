
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

sudo apt -y install wine q4wine winbind winetricks playonlinux wine-binfmt dosbox exe-thumbnailer

wine msiexec /i ~/Desktop/A      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
      
      
      cd
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400.msi
      wine msiexec /i ~/Desktop/AmigaForever9Plus.msi
      wine msiexec /i InstallWinUAE4400.msi
      
