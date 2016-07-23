#!/bin/bash

# Installation Functions
mac () {
	printf $red
	echo "*******************************"
	echo "     Preparing Installation    "
	echo "           For $os             "
	echo "*******************************"
	printf $normal
	sleep 2s

	printf "%s\n" $blue
	echo "#########################"
	echo "###  Installing Brew  ###"
	echo "#########################"

	printf "%s\n" $green
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	printf "%s\n" $blue
	echo "#########################"
	echo "###  Installing Brew  ###"
	echo "###      Packages     ###"
	echo "#########################"

	brew install git mongodb neofetch openssl dpkg
}
