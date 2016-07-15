#!/bin/sh
sw_vers | grep "ProductName"

read -p "What OS are you on: (ie mac, linux, windows) " os

if [[ $os == "mac" ]]; then
	echo "*******************************"
	echo "     Preparing Installation    "
	echo "           For $os             "
	echo "*******************************"
	sleep 2s
	echo "*******************************"
	echo "     Preparing Installation    "
	echo "           For $os             "
	echo "*******************************"
	brew install git mongodb neofetch openssl dpkg wget

elif [[ $os == "arch" ]]; then
	echo "Arch"

else
	echo "Please try again!"
fi