#!/bin/bash

# Installation Functions
arch () {
	printf $blue
	echo "*******************************"
	echo "     Preparing Installation    "
	echo "           For $os             "
	echo "*******************************"
	echo $nl
	sleep 3


	# Installing Packages
	printf "%s" $yellow
	echo "#########################"
	echo "### Installing Linux  ###"
	echo "###     Packages      ###"
	echo "#########################"

	printf "%s\n" $green
	echo "Installing Packages..."
	sudo pacman -S --needed - < $home/Code/dotfiles/packages/linux/pkglist.txt 

	# Installing oh-my-zsh
	printf "%s\n" $yellow
	echo "#########################"
	echo "###     Installing    ###"
	echo "###     oh-my-zsh     ###"
	echo "#########################"

	printf "%s\n" $green
	if ! $(test -d "$home/.oh-my-zsh"); then
		echo "Installing Oh My ZSH"

		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	else
		echo "Oh My ZSH already installed"
	fi

	# Installing Missing Submodules 
	printf "%s\n" $yellow
	echo "#########################"
	echo "###     Installing    ###"
	echo "###     Submodules    ###"
	echo "#########################"

	git submodule update --init --recursive
	printf "%s\nSubmodules complete\n" $green

	# Installing Yay
	# printf "%s" $yellow
	# echo "#########################"
	# echo "###  Installing Yay   ###"
	# echo "###    AUR Manager    ###"
	# echo "#########################"
	
	# echo "Creating and navigating to temp folder\n"
	# cd $home
	# mkdir tmp
	# cd tmp
	# echo "Clonning and installing yay\n"
	# git clone https://aur.archlinux.org/yay.git
	# cd yay
	# makepkg -si
	
	# Preparing Dotfiles
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###     Setting up    ###"
	echo	"###      Dotfiles     ###"
	echo -e "#########################" $normal

	# Removing .zshrc .oh-my-zsh/custom/* .vimrc
	printf "%s\nRemoving .vimrc, .zshrc, .gitignore .tmux.conf .vim .nvim\n" $red

	rm -rfv $home/.vimrc $home/.zshrc $home/.gitignore $home/.tmux.conf $home/.vim $home/.config/nvim $home/.config/hypr $home/.config/kitty

	# Stowing Dotfiles
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###  Stowing Dotfiles ###"
	echo -e "#########################" $normal

	# Cd'ing into Code folder
	printf "%s\nNavigating into $dot directory\n\n" $green
	cd $dot
	sleep 2

	printf "%sStowing OS common files...\n\n" $green
	# Thanks to the .stowrc file we can just run the below command
	stow .
	# stow -n -t ~/ common --ignore=".oh-my-zsh" -v # Mock Stow

	printf "\n" $blue
	echo "*******************************"
	echo "     Installation Complete     "
	echo "           For $os             "
	echo "*******************************"
	echo $nl

	printf "%sPlease review below to make sure all stowed links are correct...\n" $green

	printf "%s\nHome Directory\n" $green
	# LS'ing home directory
	echo $nl
	ls -la $home
	sleep 3

	printf "%s\n.config Directory\n" $green
	# LS'ing home directory
	echo $nl
	ls -la $home/.config
	cd $home
	sleep 3

	# Sourcing zsh to restart the shell
	printf "%s\nRestarting shell...\n\n" $green
	echo $nl

	sleep 2
	exec zsh
}
