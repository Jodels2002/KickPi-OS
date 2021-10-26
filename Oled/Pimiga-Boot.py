#!/usr/bin/env python

# RASPBERRY PI VERSION

# NOTE: You need to have PIL installed for your python at the Pi

from lib_oled96 import ssd1306
from time import sleep
from PIL import ImageFont, ImageDraw, Image
font = ImageFont.load_default()


from smbus import SMBus                  #  These are the only two variant lines !!
i2cbus = SMBus(1)                        #
# 1 = Raspberry Pi but NOT early REV1 board

oled = ssd1306(i2cbus)
draw = oled.canvas   # "draw" onto this canvas, then call display() to send the canvas contents to the hardware.


# Draw some shapes.
# First define some constants to allow easy resizing of shapes.
padding = 2
shape_width = 15
top = padding
bottom = oled.height - padding - 1
# Draw a rectangle of the same size of screen
# draw.rectangle((0, 0, oled.width-1, oled.height-1), outline=1, fill=0)
# Move left to right keeping track of the current x position for drawing shapes.
x = padding

# Draw an ellipse.
#draw.ellipse((x, top, x+shape_width, bottom), outline=1, fill=0)
x += shape_width + padding
# Draw a filled rectangle.
#draw.rectangle((x, top, x+shape_width, bottom), outline=1, fill=1)
x += shape_width + padding
# Draw a triangle.
#draw.polygon([(x, bottom), (x+shape_width/2, top), (x+shape_width, bottom)], outline=1, fill=0)
x += shape_width+padding
# Draw an X.
#draw.line((x, bottom, x+shape_width, top), fill=1)
#draw.line((x, top, x+shape_width, bottom), fill=1)
#x += shape_width+padding

# Load default font.
font = ImageFont.load_default()



font = ImageFont.truetype('FreeSerif.ttf', 30)

# draw.rectangle((0, 0, oled.width-1, oled.height-1), outline=1, fill=0)

draw.text((8, 0), 'Amiga', font=font, fill=1)
font = ImageFont.truetype('bodoni.ttf', 24)
draw.text((0, 10), '', font=font, fill=1)
draw.text((10, 25), 'booting...', font=font, fill=1)
draw.text((0, 30), '', font=font, fill=1)
draw.text((0, 40), '', font=font, fill=1)
draw.text((0, 50), '', font=font, fill=1)
oled.display()


oled.display()
sleep(3)
oled.cls()  

font = ImageFont.truetype('FreeSerif.ttf', 22)
draw.text((x-20, top),    'Starting',  font=font, fill=1)
font = ImageFont.truetype('Righton-Script.ttf', 30)
draw.text((x-44, top+22), 'Amiberry', font=font, fill=1)
oled.display()
sleep(5)

oled.cls() 
logo = Image.open('Amiberry.pbm')
draw.bitmap((0, 0), logo, fill=1)

oled.display()
sleep(3)

oled.cls() 

logo = Image.open('Pimiga.pgm')
draw.bitmap((0, 0), logo, fill=1)
oled.display()



