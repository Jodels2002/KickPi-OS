# KickPi‑OS

KickPi‑OS is built for Amiga fans who want to revive the classic Amiga experience on a Raspberry Pi.  
The focus is simple: **easy handling**, **Workbench‑like look & feel**, and a pre‑configured environment that feels familiar and fun.

Included and pre‑configured software:

- **Amiberry**
- **Linux Desktop (Workbench‑style)**
- **RetroPie**
- …plus various helper scripts

> **Note:**  
> For licensing reasons, **Workbench files** and **Kickstart ROMs** are **not included**.

KickPi‑OS is part of my *Amiga 3000 Mini* 3D‑print project, but it’s equally interesting for any Amiga enthusiast who wants a clean, ready‑to‑use setup.

---

## Disclaimer

KickPi‑OS is a **hobby project**.  
Use at your own risk.  
I’m far from being a scripting expert — but it works 😊

**Default login:**  
- **User:** pi  
- **Password:** 03223

Greetings,  
**Bernd**

---

## Recommended Hardware

A **Raspberry Pi 4** or **Pi 400** is strongly recommended for best performance.

---

## Preparation

Install **Raspberry Pi OS (64‑bit)**:



It is a side project of my Amiga 3000 mini to print yourself. But I think it's also interesting for other Amiga friends.

# Disclaimer


The whole thing here is a hobby project. Use at your own risk ;-)
I'm far from being good at scripting ;-) It works

pi: 03223   |  Passwort

Greetings Bernd




# But I definitely recommend a Raspberry 4 or Pi400

.

# Preparation:

Installed Raspberry Pi OS64 bit 

http://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2021-11-08/2021-10-30-raspios-bullseye-arm64.zip



# Optional for Amiga Forever owners:
- Format a USB stick ( FAT32, Volume Label "AMIGA" )
- Copy the "Shared" folder from the Amiga Forever installation
-> "AMIGA/Shared/*here are your Amiga Forever files*"

## Installation

Open a terminal on your Raspberry Pi and run:


sudo rm -rf ~/KickPi-OS
sudo apt install -y git
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


