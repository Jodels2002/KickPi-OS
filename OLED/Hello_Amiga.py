#!/usr/bin/env python



from lib_oled96 import ssd1306
from time import sleep
from PIL import ImageFont, ImageDraw, Image
font = ImageFont.load_default()


from smbus import SMBus                  #  These are the only two variant lines !!
i2cbus = SMBus(1)                        #
# 1 = Raspberry Pi but NOT early REV1 board

oled = ssd1306(i2cbus)
draw = oled.canvas   # "draw" onto this canvas, then call display() to send the canvas contents to the hardware.


# Write two lines of text.
font = ImageFont.truetype('FreeSerifItalic.ttf', 26)
draw.text((0, 0),    'Hello',  font=font, fill=1)
draw.text((0, 30), 'World!', font=font, fill=1)
oled.display()


sleep(2)
oled.cls() 
logo = Image.open('pi_logo.png')
draw.bitmap((32, 0), logo, fill=1)

oled.display()
sleep(2)
oled.cls() 
font = ImageFont.truetype('FreeSerifItalic.ttf', 36)
draw.text((5, 0), 'AMIGA', font=font, fill=1)
font = ImageFont.truetype('FreeSerifItalic.ttf', 26)
draw.text((30, 40), '3000', font=font, fill=1)
oled.display()

sleep(8)
oled.cls()      # Oled still on, but screen contents now blacked out
