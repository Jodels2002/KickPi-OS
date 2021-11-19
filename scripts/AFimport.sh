sudo apt install -y msitools
cd /home/pi/Templates/
msiextract /home/pi/Desktop/AmigaForever9Plus.msi

cp -r -f "/home/pi/Templates/Program Files/Cloanto/Amiga Forever/Shared/"* /home/pi/Amiga/
