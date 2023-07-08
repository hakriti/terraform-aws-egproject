#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip 
sudo apt install unzip 
unzip -o 2135_mini_finance.zip
sudo cp -r 2135_mini_finance/* /var/www/html
sudo service apache2 restart
