import time
import os
import board
import busio
from PIL import Image, ImageDraw, ImageFont
import adafruit_ssd1306

# ********************************************************
# *************  Display Setup (I2C) **********************
# ********************************************************

WIDTH = 128
HEIGHT = 64

i2c = busio.I2C(board.SCL, board.SDA)
disp = adafruit_ssd1306.SSD1306_I2C(WIDTH, HEIGHT, i2c)

disp.fill(0)
disp.show()

# ********************************************************
# *************  Paths ************************************
# ********************************************************

BASE_PATH = os.path.dirname(os.path.abspath(__file__))

FONT1_PATH = os.path.join(BASE_PATH, "Display.ttf")
FONT2_PATH = os.path.join(BASE_PATH, "Righton-Script.ttf")

# ********************************************************
# *************  Helper ***********************************
# ********************************************************

def load_font(path, size):
    try:
        return ImageFont.truetype(path, size)
    except Exception:
        print(f"Font fehlt: {path} -> fallback")
        return ImageFont.load_default()

# ********************************************************
# *************  Variables *******************************
# ********************************************************

width = WIDTH
height = HEIGHT
x = 0
top = 0

# ********************************************************
# *************  Draw Screen ******************************
# ********************************************************

image = Image.new('1', (width, height))
draw = ImageDraw.Draw(image)

draw.rectangle((0, 0, width, height), outline=0, fill=0)

font_small = load_font(FONT1_PATH, 16)
font_script = load_font(FONT2_PATH, 30)

draw.text((8, 0), 'Update...', font=font_small, fill=255)
draw.text((x + 4, top + 22), 'Amiberry', font=font_script, fill=255)

disp.image(image)
disp.show()

time.sleep(0.3)
