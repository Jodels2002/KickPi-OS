#!/bin/bash
#***********************************************  #KickPi-OS Retropie content loader  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************
# Test
      #sudo apt-get install -y libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev  build-essential
      sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      sudo apt install -y  geany geany-plugins-common geany-common 

#Todo
#https://archive.org/compress/2020_01_06_fbn/formats=ZIP&file=/2020_01_06_fbn.zip
dialog --stdout --title "NeoGeo from Archiv.org?" \
  --backtitle "Download RetroPi content" \
  --yesno "Yes: Delete, No:  Restore" 7 60
dialog_status=$?
# Do something
if [ "$dialo_status" -eq 0 ]; then
  # The previous dialog was answered Yes
      if [ ! -f /home/$USER/RetroPie/extract_to_sytem_folder.zip ]; then
      clear
      toilet -F gay KickPi-OS 
      toilet -F gay Retropie Romset
      echo " "
      echo " "
      echo "  Add Retropie NeoGeo from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/roms
      wget https://archive.org/compress/2020_01_06_fbn/formats=ZIP&file=/2020_01_06_fbn.zip
      unzip -u /home/$USER/KickPi-OS/Retropie/2020_01_06_fbn.zip
      #rm /home/$USER/KickPi-OS/Retropie/2020_01_06_fbn.zip
      fi
else
  clear
fi 


#https://archive.org/compress/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples/formats=ZIP&file=/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples.zip

#https://archive.org/download/archive_20190819/Romset.zip
#https://archive.org/download/retroarch_bios_pack/extract_to_sytem_folder.zip

cd RetroPi

wget https://archive.org/compress/2020_01_06_fbn/formats=ZIP&file=/2020_01_06_fbn.zip
wget https://archive.org/compress/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples/formats=ZIP&file=/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples.zip
wget https://archive.org/compress/Amiga_WHD_Games
weget https://archive.org/compress/commodore-64-romset-us/formats=ZIP&file=/commodore-64-romset-us.zip

#https://archive.org/compress/Amiga_WHD_Games ;-) 
dialog --stdout --title "Amiga_WHD_Games from Archiv.org?" \
  --backtitle "Download RetroPi content" \
  --yesno "Yes: Delete, No:  Restore" 7 60
dialog_status=$?
# Do something
if [ "$dialo_status" -eq 0 ]; then
  # The previous dialog was answered Yes
      if [ ! -f /home/$USER/RetroPie/extract_to_sytem_folder.zip ]; then
      clear
      toilet -F gay KickPi-OS 
      toilet -F gay Retropie Romset
      echo " "
      echo " "
      echo "  Add Retropie Amiga_WHD_Games from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/roms
      wget https://archive.org/compress/Amiga_WHD_Games
      unzip -u /home/$USER/KickPi-OS/Retropie/Amiga_WHD_Games
      #rm /home/$USER/KickPi-OS/Retropie/Romset.zip
      fi
else
  clear
fi 
