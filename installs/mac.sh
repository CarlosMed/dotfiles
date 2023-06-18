#!/bin/bash

# Installation Functions
mac () {
	printf $blue
	echo "*******************************"
	echo "     Preparing Installation    "
	echo "           For $os             "
	echo "*******************************"
	echo $nl
	# sleep 2

	# Installing Homebrew
	printf "%s\n" $blue
	echo "#########################"
	echo "###  Installing Brew  ###"
	echo "#########################"

	printf "%s\n" $green
	if test ! $(which brew); then
		echo "Installing Homebrew..."

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "Homebrew already installed"
	fi

	printf "%s\n" $blue
	echo "#########################"
	echo "###  Installing Brew  ###"
	echo "###      Packages     ###"
	echo "#########################"

	brew install git mongodb neofetch openssl dpkg
}
