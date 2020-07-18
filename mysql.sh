#!/bin/bash

sudo apt-get update 
sudo apt-get install mysql-server -y
sudo printf "\nn\nn\nY\nY\nY\nY\n" | sudo mysql_secure_installation
