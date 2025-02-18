#!/bin/bash

#This script is to add user
read -p "Enter username" username
echo "you entered $username"
sudo useradd -m $username
echo "new user added"
