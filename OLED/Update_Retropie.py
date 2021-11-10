# Copyright (c) 2017 Adafruit Industries
# Author: Tony DiCola & James DeVito
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

import time
import Adafruit_GPIO.SPI as SPI
import Adafruit_SSD1306
from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
import subprocess

RST = None     
DC = 23
SPI_PORT = 0
SPI_DEVICE = 0
disp = Adafruit_SSD1306.SSD1306_128_64(rst=RST)
 
disp.begin()
disp.clear()
disp.display()
# ********************************************************
# *************  Variables  ******************************
# ********************************************************
x = 0
top = 0
width = disp.width
height = disp.height

font = ImageFont.load_default()
# ********************************************************


# ********************************************************
# *************  Draw Boot Sequence  *********************
# ********************************************************

image = Image.new('1', (width, height))
draw = ImageDraw.Draw(image)

draw.rectangle((0,0,width,height), outline=0, fill=0)
draw = ImageDraw.Draw(image)
font = ImageFont.truetype('Display.ttf', 16)
draw.text((8, 0), 'Update...', font=font, fill=1)
font = ImageFont.truetype('Display.ttf', 26)
draw.text((8, 26), 'Retropie', font=font, fill=1)
disp.image(image)
disp.display()
time.sleep(.3)






