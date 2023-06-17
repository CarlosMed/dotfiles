#!/bin/bash

# Setting Variabes of Directories
home=$HOME
dot=$home/Code/dotfiles
packages=$dot/packages

blink=$(tput blink)
normal=$(tput sgr0)
green=$(tput setaf 150)
red=$(tput setaf 1)
blue=$(tput setaf 4)

clear

# git check
printf "%s\n" $blue
echo "#########################"
echo "###    Checking Git   ###"
echo "#########################"

if [[ $(git --version) ]]; then
	echo "Git already installed"
	# git clone https://github.com/carlosmed/dotfiles.git
fi

clear

read -p "${green}What OS are you on: (ie mac, arch, windows) ${red}" os

if [[ $os == "mac" ]]; then
	clear
	mac

elif [[ $os == "arch" ]]; then
	clear
	arch

else
	echo "Please try again!"
fi

