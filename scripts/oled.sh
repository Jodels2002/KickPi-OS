sudo chmod -R 777 /usr/local/bin/
  
       # sudo apt-get install -y python3-pip
       # pip3 install adafruit-circuitpython-ssd1306
       
       sudo raspi-config nonint do_i2c 0
       # sudo chmod -R 777 /home/$USER/Adafruit_Python_SSD1306
       sudo apt install -y python3
       sudo apt install -y python-dev
       sudo apt install -y python-smbus i2c-tools
       sudo apt install -y python-pil
       sudo apt install -y python-pip
       sudo apt install -y python-setuptools 
       sudo apt install -y python-dev
       sudo apt install -y python-smbus i2c-tools
       sudo apt install -y python-pil
       sudo apt install -y python-pip
       sudo apt install -y python-setuptools 
       cd /home/pi
       sudo python -m pip install --upgrade pip setuptools wheel
       sudo pip install Adafruit-SSD1306
       sudo python -m pip install --upgrade pip setuptools wheel
   
       sudo cp -rf /home/pi/KickPi-OS/OLED/ /
       sudo cp -rf /home/pi/KickPi-OS/conf/rc.local /etc/
       sudo cp -rf /home/pi/KickPi-OS/conf/.bashrc /home/pi/
     
 
       
       sudo chmod -R 777 /OLED/
       sudo chmod -R 777 /usr/local/bin/
       sudo chmod -R 777 /etc/rc.local
       sudo chmod -R 777 /home/pi/.bashrc
       # (crontab -l 2>/dev/null; echo "*/5 * * * * /usr/local/bin/loop.sh") | crontab -
       
       
