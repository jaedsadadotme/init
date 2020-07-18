#!/bin/bash

sudo apt-get update 
sudo apt-get install mysql-server -y
sudo mysql_secure_installation <<EOF
y
password
password
y
y
y
y
EOF
