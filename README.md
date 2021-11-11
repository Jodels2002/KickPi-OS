# KickPi-OS



KickPi-OS is aimed at Amiga friends who want to revive the Amiga experience on a Raspberry Pi.
The focus of KickPi-OS is easy handling and Workbench like "Look and feel" :-)

Software that is installed and pre-configured:

Amiberry, ClassicWB, Amiga Forever, PiKiss, Retropie ...
* For licensing reasons, the Workbench files and Kickstart Rom files are not included!


#Requirements:

- Raspberry Pi OS 32 bit / 64 bit


It is a side project of my Amiga 3000 mini to print yourself. But I think it's also interesting for other Amiga friends.

# Disclaimer

The whole thing here is a hobby project. Use at your own risk ;-)
I'm far from being good at scripting ;-) It works.

But: if someone has suggestions for improvement, constructive criticism or whatever - bring them on. 
A warm welcome

Greetings Bernd
bernd.titze@me.com

# I like to have a coffee so be so kind and buy me one :-)   

https://paypal.me/BerndTitze68?locale.x=de_DE

# Supported hardware:

Since it is based on a Raspberry Pi OS, it should work on all Raspberry Pi's.


# But I definitely recommend a Raspberry 4 or Pi400

.

# Preparation:

Installed Raspberry Pi OS 32/64 bit or TwisterOS using Raspberry Pi Imager
https://www.raspberrypi.org/software/



# Optional for Amiga Forever owners:
- Format a USB stick ( FAT32, Volume Label "AMIGA" )
- Copy the "Shared" folder from the Amiga Forever installation
-> "AMIGA/Shared/*here are your Amiga Forever files*"

# Installation:
On the Raspberry you open a terminal window and type following commands:

git clone --depth=1 https://github.com/Jodels2002/KickPi-OS.git

sudo chmod -R 777 KickPi-OS

cd KickPi-OS

./setup.sh

# Update

To bring KickPi-OS up to date, just type "u" + return in the command line. 

# RetroPie:
To use Retropie just copy your Bios and Rom files into the (Home) Retropie folder. 
See also: https://retropie.org.uk/docs/First-Installation/


# Used 3rd party tools:


Amiberry:
https://github.com/midwan/amiberry

RetroPie
https://github.com/RetroPie

PiKiss
https://github.com/jmcerrejon/PiKISS


Source of Game:

Internet Archive Archive.org

https://amigaland.de/1318-2

All games are subject to the copyrights of the respective manufacturer, Amigaland.de has a license for all games offered here, which allows these Amiga games to be offered for free download. These games are for private use only and may not be used commercially! 
