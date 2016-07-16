#!/bin/sh

blink=$(tput blink)
normal=$(tput sgr0)
green=$(tput setaf 150)
red=$(tput setaf 1)
blue=$(tput setaf 4)

clear

# INstallation Functions
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

	brew install git mongodb neofetch openssl dpkg wget
}

# gitv=$(git --version | grep "git version")

if [[ $(git --version) ]]; then
	return sh -c "curl -fsSL https://raw.githubusercontent.com/CarlosMed/dotfiles/master/scripts/install.sh"
else
	"Not working"
fi

# read -p "${green}What OS are you on: (ie mac, linux, windows) ${red}" os

# if [[ $os == "mac" ]]; then
# 	clear
# 	mac

# elif [[ $os == "arch" ]]; then
# 	$os
# else
# 	echo "Please try again!"
# fi

