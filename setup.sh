#source: Adafruit.com

sudo apt-get update

sudo apt-get install python-dev

sudo apt-get install python-rpi.gpio

#add this two modules: i2c-bcm2708 i2c-dev
sudo echo "i2c-bcm2708" >> /etc/modules
sudo echo "i2c-dev" >> /etc/modules

sudo apt-get install python-smbus
sudo apt-get install i2c-tools

sudo apt-get install nodejs

sudo apt-get install git

cd ~
git clone https://github.com/TMRh20/RF24.git
cd RF24/
git submodule init
git submodule update

sudo make install