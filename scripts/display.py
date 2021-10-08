#!/usr/bin/env python
# coding=utf-8
# Bibliotheken importieren
from lib_oled96 import ssd1306
from smbus import SMBus
# Display einrichten
i2cbus = SMBus(1)            # 0 = Raspberry Pi 1, 1 = Raspberry Pi > 1
oled = ssd1306(i2cbus)
# Ein paar Abkürzungen, um den Code zu entschlacken
draw = oled.canvas
# Display zum Start löschen
oled.cls()
oled.display()
# Hallo Welt
draw.text((20, 16), "Hallo", fill=1)
draw.text((60, 40), "Welt!", fill=1)
# Ausgaben auf Display schreiben
oled.display()
