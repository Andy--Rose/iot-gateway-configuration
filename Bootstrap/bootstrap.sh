#!bin/bash
#source: Adafruit.com

#Testing
if [ -r ./bootstrap.conf ]; then
	source ./bootstrap.conf
else
	echo "Could not find configuration file ./bootstrap.conf. Exiting."
	exit 1
fi

# Prerequisites
sudo apt-get update
sudo apt-get install npm -y
sudo apt-get install python-dev -y
sudo apt-get install python-rpi.gpio -y
sudo apt-get install python-smbus
sudo apt-get install i2c-tools
sudo apt-get install nodejs
sudo apt-get install git

# Install AWS CLI
sudo pip install awscli

# Add this two modules: i2c-bcm2708 i2c-dev
sudo echo "i2c-bcm2708" >> /etc/modules
sudo echo "i2c-dev" >> /etc/modules

# Check out the RF24 (radio device) library
cd ~
git clone https://github.com/TMRh20/RF24.git
cd RF24/
git submodule init
git submodule update

# Compile the RF24 library from the directory
sudo make install