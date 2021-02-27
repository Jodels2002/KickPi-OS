# Install Pimiga - not for use!!!
# B.Titze 2020

# Status LED
# LED Orange GPIO 14
# LED Red GPIO 15


# Power LED Blue
# LED Blue GPIO 5

# LED Red GPIO 26
# LED Orange GPIO 19
# LED Yellow GPIO 13
# LED Green GPIO 6
# LED Blue GPIO 5
# LED Ambient Blue GPIO 11
# PWR-LED (green)
# dtoverlay = pwr-led, gpio = 17 (3.3V)
# HDD LED (orange)
# dtoverlay = act-led, gpio = 27
# LED all on
# sudo python LED.py

import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

# Status LED
GPIO.setup(14,GPIO.OUT)
#print ("LED Orange Front on")
GPIO.output(14,GPIO.LOW)

GPIO.setup(15,GPIO.LOW)
#print ("LED Orange Front on")
GPIO.output(15,GPIO.LOW)


# Power LED Blue
GPIO.setup(11,GPIO.OUT)
#print ("LED Blue on")
GPIO.output(11,GPIO.HIGH)

GPIO.setup(5,GPIO.OUT)
#print ("LED Blue on")
GPIO.output(5,GPIO.HIGH)

GPIO.setup(13,GPIO.OUT)
#print ("LED Yellow on")
GPIO.output(13,GPIO.LOW)

GPIO.setup(6,GPIO.OUT)
#print ("LED Green on")
GPIO.output(6,GPIO.LOW)

GPIO.setup(19,GPIO.OUT)
#print ("LED Orange on")
GPIO.output(19,GPIO.LOW)

GPIO.setup(26,GPIO.OUT)
#print ("LED Red on")
GPIO.output(26,GPIO.LOW)




