#!/bin/bash

# LED Control PiMiga 3000 B.Titze...
# ...to be finished :-)...möööp
sudo chmod 222 /sys/class/gpio/export /sys/class/gpio/unexport 
echo "out" > /sys/class/gpio/gpio17/direction
echo "1" > /sys/class/gpio/gpio17/value

BASE_GPIO_PATH=/sys/class/gpio

# Assign LEDs & definitions
BLUE=13
GREEN=19
YELLOW=5
ORANGE=26
RED=6
ON="1"
OFF="0"

# exportPin()
{
  if [ ! -e $BASE_GPIO_PATH/gpio$1 ]; then
    echo "$1" > $BASE_GPIO_PATH/export
  fi
}
setOutput()
{
  echo "out" > $BASE_GPIO_PATH/gpio$1/direction
}

# Function set Lights
setLightState()
{
  echo $2 > $BASE_GPIO_PATH/gpio$1/value
}

# Function lights off
allLightsOff()
{
  LightState $BLUE $OFF
  LightState $GREEN $OFF
  LightState $YELLOW $OFF
  LightState $ORANGE $OFF
  LightState $RED $OFF
}

# Export pins so that we can use them
exportPin $BLUE
exportPin $YELLOW
exportPin $RED
exportPin $ORANGE
exportPin $RED

# Set pins as outputs
setOutput $BLUE
setOutput $GREEN
setOutput $YELLOW
setOutput $ORANGE
setOutput $RED

# Shutdown... light´s out
shutdown()
{
  allLightsOff
  exit 0
}

trap shutdown SIGINT

# Turn lights off to begin
allLightsOff

# Main Loop forever...
while [ 1 ]
do
  # Do what you want.... Seq1
  setLightState $BLUE $ON
  setLightState $GREEN $ON
  setLightState $YELLOW $ON
  setLightState $ORANGE $ON
  setLightState $RED $ON
  sleep 3

  # Do what you want.... Seq2
  setLightState $BLUE $ON
  setLightState $GREEN $OFF
  setLightState $YELLOW $OFF
  setLightState $ORANGE $OFF
  setLightState $RED $OFF
  sleep 1

  # Do what you want.... Seq3
  setLightState $BLUE $ON
  setLightState $GREEN $ON
  setLightState $YELLOW $OFF
  setLightState $ORANGE $OFF
  setLightState $RED $OFF
  sleep 5
 
 # Do what you want.... Seq4
  setLightState $BLUE $ON
  setLightState $GREEN $ON
  setLightState $YELLOW $ON
  setLightState $ORANGE $OFF
  setLightState $RED $OFF
  sleep 2

  # Do what you want.... Seq5
  setLightState $BLUE $ON
  setLightState $GREEN $ON
  setLightState $YELLOW $ON
  setLightState $ORANGE $ON
  setLightState $RED $OFF
  
  # Do what you want.... Seq6
  setLightState $BLUE $ON
  setLightState $GREEN $ON
  setLightState $YELLOW $ON
  setLightState $ORANGE $ON
  setLightState $RED $ON
done
