#!bin/bash

#Testing
testConfFile() {
	if ![ -r ./bootstrap.conf ]; then
		echo "Could not find configuration file ./bootstrap.conf. Exiting."
		exit 1
	fi
}

testConf() {
	test $log || { echo "`$tstamp` Variable log is not set"; exit 1; }
	test $aws-private-key-cli || { echo "`$tstamp` Variable aws-private-key-cli is not set"|tee -a $log; exit 1; }
	test $aws-private-key-iot || { echo "`$tstamp` Variable aws-private-key-iot is not set"|tee -a $log; exit 1; }
}

logit() {
	echo "`$tstamp` $1" | tee -a $log; 
}

installPrereqs() {
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
}

installNodeJSPrereqs() {
	sudo npm install aws-sdk
	sudo npm install aws-iot-device-sdk
}

installRFLibrary() {
	# Check out the RF24 (radio device) library
	cd ~
	git clone https://github.com/TMRh20/RF24.git
	cd RF24/
	git submodule init
	git submodule update
}

updateModules() {
	# Add this two modules: i2c-bcm2708 i2c-dev
	sudo echo "i2c-bcm2708" >> /etc/modules
	sudo echo "i2c-dev" >> /etc/modules

	# Compile the RF24 library from the directory
	sudo make install
}

#============ Main =============
logit "Starting Bootstrap"

# Load and test configuration
logit "Loading configuration file"
testConfFile
source ./bootstrap.conf
testConf

logit "Installing prerequisites"
installPrereqs
installNodeJSPrereqs

logit "Modifying modules file"
#updateModules

logit "Installing RF24 Library"
#installRFLibrary

echo "===================\nInitial setup finished. Next, use 'aws configure' to set up aws cli. Then execute the bootstrap-iot.sh script."

exit 0