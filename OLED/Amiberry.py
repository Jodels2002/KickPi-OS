import time
import os
import Adafruit_GPIO.SPI as SPI
import Adafruit_SSD1306
from PIL import Image, ImageDraw, ImageFont

# ********************************************************
# *************  Display Setup  ***************************
# ********************************************************

RST = None
DC = 23
SPI_PORT = 0
SPI_DEVICE = 0

disp = Adafruit_SSD1306.SSD1306_128_64(rst=RST)

disp.begin()
disp.clear()
disp.display()

# ********************************************************
# *************  Paths (WICHTIG!) *************************
# ********************************************************

BASE_PATH = os.path.dirname(os.path.abspath(__file__))

FONT1_PATH = os.path.join(BASE_PATH, "Display.ttf")
FONT2_PATH = os.path.join(BASE_PATH, "Righton-Script.ttf")
IMAGE_PATH = os.path.join(BASE_PATH, "Amiberry.pbm")

# ********************************************************
# *************  Variables  *******************************
# ********************************************************

width = disp.width
height = disp.height
x = 0
top = 0

# ********************************************************
# *************  Safe Font Loader *************************
# ********************************************************

def load_font(path, size):
    try:
        return ImageFont.truetype(path, size)
    except Exception:
        print(f"Font nicht gefunden: {path} -> nutze Default")
        return ImageFont.load_default()

# ********************************************************
# *************  Draw Boot Screen *************************
# ********************************************************

image = Image.new('1', (width, height))
draw = ImageDraw.Draw(image)

disp.clear()
draw.rectangle((0, 0, width, height), outline=0, fill=0)

font_big = load_font(FONT1_PATH, 22)
font_logo = load_font(FONT2_PATH, 30)

draw.text((x + 20, top + 10), 'Starting', font=font_big, fill=1)
draw.text((x + 4, top + 28), 'Amiberry', font=font_logo, fill=1)

disp.image(image)
disp.display()

time.sleep(3)

# ********************************************************
# *************  Show Logo *******************************
# ********************************************************

try:
    image = Image.open(IMAGE_PATH).convert('1')
    disp.image(image)
    disp.display()
except Exception as e:
    print(f"Bild konnte nicht geladen werden: {e}")

time.sleep(0.1)
