# https://www.raspberrypi-spy.co.uk/2018/04/i2c-oled-display-module-with-raspberry-pi/


Screen Size Adjustment
The Adafruit examples assume you have a 128×32 screen. They still run with a 128×64 pixel screen but it is better to change them before you move onto anything more complicated. To do this simply edit the scripts and disable the 128×32 config line by placing a # character at the front, and enable the 128×64 line by deleting the # character from the front. The section in the script should now look like this :

I2C OLED Display Python Examples
This step becomes essential if you want to start creating your own images to display on the screen.

Creating New Images
So you tried image.py example and wondered how you can create your own images? It’s fairly easy if you have an image editing application such as Photoshop or GIMP. I prefer using GIMP because it is free.

Ideally you want the images to be :

128×64 resolution
1-bit colour (i.e. black and white)
By default the image.py example will convert the image to 1-bit but it assumes the resolution is correct.

You’ll notice in the script an alternative line which resizes and converts an image so you can load images without worrying about their size and colour.

Load image and convert to 1-bit color :

image = Image.open('happycat_oled_64.ppm').convert('1')
Load an image, resize and convert to 1-bit :

image = Image.open('example.png').resize((disp.width, disp.height), Image.ANTIALIAS).convert('1')
Which technique you use is up to you. Resizing and converting takes extra processing time so in high performance applications you are better feeding the script images that have already been resized.

Resizing and Converting Images
If you want to load an image or photo then load it into your graphics application and perform the following steps :

Load image
Resize/scale to 128×64
Convert to 1-bit colour (monchrome)
Export as a “.pbm” or “.png” file
Copy to your Pi in the same location as your Python script
Update the Python script to use your new file
The Adafruit example image is a “ppm” file because it is colour although it is converted to monochrome at the point it is displayed on the screen. Adafruit use ppm as the library also supports their colour OLED modules. If you don’t have a colour screen you can switch to pbm or png.

I prefer creating “pbm” files as they are black and white and much smaller files. It also means your Python script doesn’t need to convert them. The library can handle both just make sure you use the correct filename and extension in your scripts.

Increasing I2C Bus Speed
If you are displaying multiple images per second it is worth increasing the bus speed of the interface as it can improve performance. Please see the Change Raspberry Pi I2C Bus Speed post .

Troubleshooting
If your screen isn’t working you should start at the beginning of this tutorial and work through it. Here are some thing to consider :

Did you enable I2C and instal “python-smbus” and “i2c-tools”?
Are the four module connections correct? Did you get SDA and SCL mixed up?
Did “i2cdetect -y 1” give you the address of the display on the I2C bus?
If your screen is using an address other than 0x3c did you adjust the Python script?
Buy a Miniature OLED Screen
These screens are available from a number of retailers so take a look and pick one that is convenient for your location :

