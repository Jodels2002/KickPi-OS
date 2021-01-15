# Install Pimiga - not for use!!!
# B.Titze 2020

# LED all on
# sudo python LED.py

import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.setup(5,GPIO.OUT)
print "LED on"
GPIO.output(5,GPIO.LOW)

GPIO.setup(13,GPIO.OUT)
print "LED on"
GPIO.output(13,GPIO.LOW)

GPIO.setup(6,GPIO.OUT)
print "LED on"
GPIO.output(6,GPIO.LOW)

GPIO.setup(19,GPIO.OUT)
print "LED on"
GPIO.output(19,GPIO.LOW)

GPIO.setup(26,GPIO.OUT)
print "LED on"
GPIO.output(26,GPIO.LOW)




