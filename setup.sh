#!/bin/bash

# Setting Variabes of Directories
home=$HOME
dot=$home/Code/dotfiles
packages=$dot/packages

. $dot/installs/mac.sh
. $home/Code/dotfiles/installs/arch.sh

blink=$(tput blink)
normal=$(tput sgr0)
green=$(tput setaf 150)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
nl=$(printf "%s\n" $normal)

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

