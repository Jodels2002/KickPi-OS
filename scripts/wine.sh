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
      
sudo apt -y install coreutils dialog memtest86+ mkisofs genisoimage findutils grub-pc xorriso syslinux os-prober bash passwd sed squashfs-tools live-boot live-config live-config-sysvinit live-boot-initramfs-tools rsync mount laptop-detect util-linux, hwdata