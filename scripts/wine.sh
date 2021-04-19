sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

sudo dpkg --add-architecture i386 && sudo apt update
sudo apt -y install wine
wine msiexec /i ~/Desktop/A      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine
      
      
      cd
      wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400_x64.msi
      wine msiexec /i ~/Desktop/AmigaForever.msi
      wine msiexec /i InstallWinUAE4400_x64.msi
      
sudo apt -y install coreutils dialog memtest86+ genisoimage genisoimage findutils grub-pc xorriso syslinux os-prober bash passwd sed squashfs-tools live-boot live-config live-config-sysvinit live-boot-initramfs-tools rsync mount laptop-detect util-linux hwdata
