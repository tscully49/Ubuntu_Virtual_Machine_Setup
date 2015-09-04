#!/bin/bash
echo "Hello there!"
read -s -p "Enter password for root access : " password
echo ""
echo "$password"

sudo apt-get update
sudo apt-get ugrade
sudo apt-get install fail2ban
sudo apt-get install apache2
sudo apt-get install php5 php-pear

echo ""
echo "----------------------------------------------------------------------"
echo "Don't forget to add your HTTP endpoint to port 80 on your Azure Portal"
echo "----------------------------------------------------------------------"
echo "Everything on your virtual machine is now set up!"

