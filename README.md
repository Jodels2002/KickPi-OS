# KickPi-OS



KickPi-OS is aimed at Amiga friends who want to revive the Amiga experience on a Raspberry Pi.
The focus of KickPi-OS is easy handling and Workbench like "Look and feel" :-)

Software that is installed and pre-configured:

Amiberry,Linux Desktop, Retropie ...
* For licensing reasons, the Workbench files and Kickstart Rom files are not included!


#Requirements:

- Raspberry Pi 4


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

Installed Raspberry Pi OS64 bit 

http://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2021-11-08/2021-10-30-raspios-bullseye-arm64.zip



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


