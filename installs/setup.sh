#!/bin/bash
. mac.sh

blink=$(tput blink)
normal=$(tput sgr0)
green=$(tput setaf 150)
red=$(tput setaf 1)
blue=$(tput setaf 4)

clear



read -p "${green}What OS are you on: (ie mac, linux, windows) ${red}" os

if [[ $os == "mac" ]]; then
	clear
	mac

elif [[ $os == "arch" ]]; then
	$os

else
	echo "Please try again!"
fi

