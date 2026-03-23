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
IMAGE_PATH = os.path.join(BASE_PATH, "Amiberry.pbm")

# ********************************************************
# *************  Helpers **********************************
# ********************************************************

def load_font(path, size):
    try:
        return ImageFont.truetype(path, size)
    except Exception:
        print(f"Font nicht gefunden: {path} -> fallback")
        return ImageFont.load_default()

# ********************************************************
# *************  Draw Boot Screen *************************
# ********************************************************

image = Image.new("1", (WIDTH, HEIGHT))
draw = ImageDraw.Draw(image)

draw.rectangle((0, 0, WIDTH, HEIGHT), outline=0, fill=0)

font_big = load_font(FONT1_PATH, 22)
font_logo = load_font(FONT2_PATH, 30)

draw.text((20, 10), "Starting", font=font_big, fill=255)
draw.text((4, 28), "Amiberry", font=font_logo, fill=255)

disp.image(image)
disp.show()

time.sleep(3)

# ********************************************************
# *************  Show Logo *******************************
# ********************************************************

try:
    image = Image.open(IMAGE_PATH).convert("1")
    disp.image(image)
    disp.show()
except Exception as e:
    print(f"Bild konnte nicht geladen werden: {e}")

time.sleep(0.1)
