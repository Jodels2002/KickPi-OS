# https://www.instructables.com/Raspberry-Pi-Monitoring-System-Via-OLED-Display-Mo/
sudo apt-get install python-smbus
sudo apt-get install i2c-tools

git clone https://github.com/adafruit/Adafruit_Python_SSD1306

sudo chmod -R 777 Adafruit_Python_SSD1306
cd Adafruit_Python_SSD1306
sudo python3 setup.py install
