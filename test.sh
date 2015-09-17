#!/bin/bash
IFS="\n"
read -p "Enter the username for azure account access : " username
read -s -p "Enter password for azure account access : " password
echo ""
unset IFS

# Install applications to the virtual machine through apt-get
sudo apt-get update
sudo apt-get -y ugrade
sudo apt-get -y install fail2ban
sudo apt-get -y install apache2
sudo apt-get -y install php5 php-pear

# Installs the azure cli and its dependencies
sudo apt-get -y install nodejs-legacy
sudo apt-get -y install npm
sudo npm install -g azure-cli

# Login to the azure cli with the username and password given earlier
azure login -p "$password" "$username"
while [ $? -ne 0 ]; do
	IFS="\n"
	echo "Error: Invalid Username/Password Combination..."
	echo ""
	echo "Please re-enter Username/Password OR enter -1 to skip setting up your HTTP endpoint"
	read -p "Enter the username for azure account access : " username
	if [[ "$username" == "-1" ]]; then
		echo ""
		echo "Cancelled the enpoint set up through Microsoft Azure!"
		echo "Your HTTP Endpoint was not set up."
		echo ""
		break
	fi
	read -s -p "Enter password for azure account access : " password
	if [[ "$password" == "-1" ]]; then
		echo ""
		echo "Cancelled the enpoint set up through Microsoft Azure!"
		echo "Your HTTP Endpoint was not set up."
		echo ""
		break
	fi
	echo ""
	unset IFS
	azure login -p "$password" "$username"
done

if [[ "$username" != "-1" && "$password" != "-1" ]]; then
	# Set up the HTTP endpoint without having to go to the portal online
	azure vm endpoint create -n HTTP $HOSTNAME 80 80 #$HOSTNAME is the name of your virtual machine
	azure vm endpoint list $HOSTNAME
fi

echo ""
echo "----------------------------------------------------------------------"
echo "Everything on your virtual machine is now set up!"
