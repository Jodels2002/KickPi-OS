#!/usr/bin/env python

# RASPBERRY PI VERSION
# Draw Pic


from lib_oled96 import ssd1306
from time import sleep
from PIL import ImageFont, ImageDraw, Image
font = ImageFont.load_default()


from smbus import SMBus                  #  These are the only two variant lines !!
i2cbus = SMBus(1)                        #
# 1 = Raspberry Pi but NOT early REV1 board

oled = ssd1306(i2cbus)
draw = oled.canvas   # "draw" onto this canvas, then call display() to send the canvas contents to the hardware.
padding = 2
shape_width = 20
top = padding
bottom = oled.height - padding - 1
x = padding



font = ImageFont.load_default()
font = ImageFont.truetype('FreeSerif.ttf', 24)

draw.text((x+10, top),    'Pimiga',  font=font, fill=1)
draw.text((x+10, top+40), ' 3000', font=font, fill=1)
oled.display()
sleep(10)

oled.cls() 

font = ImageFont.load_default()
font = ImageFont.truetype('FreeSerif.ttf', 24)

draw.text((x+10, top),    'Proceed',  font=font, fill=1)
draw.text((x+10, top+40), ' install...', font=font, fill=1)
oled.display()
sleep(10)

#draw.rectangle((0, 0, oled.width-1, oled.height-1), outline=255, fill=1)
oled.cls() 
sleep(1)
logo = Image.open('pi_logo.png')
draw.bitmap((32, 0), logo, fill=1)
oled.display()
sleep(1)

#oled.cls()      # Oled still on, but screen contents now blacked out
