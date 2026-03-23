import time
import board
import busio
import subprocess
from PIL import Image, ImageDraw, ImageFont
import adafruit_ssd1306

# I2C setup (most common for SSD1306)
i2c = busio.I2C(board.SCL, board.SDA)

# Display setup
WIDTH = 128
HEIGHT = 64
disp = adafruit_ssd1306.SSD1306_I2C(WIDTH, HEIGHT, i2c)

# Clear display
disp.fill(0)
disp.show()

# Create image buffer
image = Image.new("1", (WIDTH, HEIGHT))
draw = ImageDraw.Draw(image)

# Fonts
font = ImageFont.load_default()

# Optional fonts (if files exist)
try:
    fontm = ImageFont.truetype('Display.ttf', 12)
    font2 = ImageFont.truetype('default.ttf', 14)
    font_icon = ImageFont.truetype('default.ttf', 20)
    font_text_small = ImageFont.truetype('Display.ttf', 12)
except:
    fontm = font
    font2 = font
    font_icon = font
    font_text_small = font

while True:
    draw.rectangle((0, 0, WIDTH, HEIGHT), outline=0, fill=0)

    def run_cmd(cmd):
        return subprocess.check_output(cmd, shell=True).decode("utf-8")

    IP = run_cmd("hostname -I | cut -d' ' -f1")
    CPU = run_cmd("top -bn1 | grep load | awk '{printf \"CPU %.2f\", $(NF-2)}'")
    MemUsage = run_cmd("free -m | awk 'NR==2{printf \"%.2f%%\", $3*100/$2 }'")
    Disk = run_cmd("df -h | awk '$NF==\"/\"{printf \"%s\", $5}'")
    Temperature = run_cmd("vcgencmd measure_temp |cut -f 2 -d '='")

    # Draw text (icons removed for compatibility)
    draw.text((0, 0), "IP: " + IP, font=font_text_small, fill=255)
    draw.text((0, 16), "Disk: " + Disk, font=fontm, fill=255)
    draw.text((64, 16), CPU, font=fontm, fill=255)
    draw.text((0, 32), "Temp: " + Temperature, font=fontm, fill=255)
    draw.text((64, 32), "Mem: " + MemUsage, font=fontm, fill=255)

    disp.image(image)
    disp.show()
    time.sleep(12)

    # Show images if they exist
    try:
        image = Image.open('Amiberry.pbm').convert('1')
        disp.image(image)
        disp.show()
        time.sleep(8)

        image = Image.open('AmigaLogo.pgm').convert('1')
        disp.image(image)
        disp.show()
        time.sleep(0.4)
    except:
        pass
