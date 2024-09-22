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

	# Installing Homebrew
	printf "%s" $yellow
	echo "#########################"
	echo "### Installing Linux  ###"
	echo "###     Packages      ###"
	echo "#########################"

	printf "%s\n" $green
	echo "Installing Packages..."
	sudo pacman -S - < $dot/packages/linux/pkglist.txt

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

	# Preparing Dotfiles
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###     Setting up    ###"
	echo	"###      Dotfiles     ###"
	echo -e "#########################\n" $normal

	# Removing .zshrc .oh-my-zsh/custom/* .vimrc
	printf "%sRemoving .vimrc, .zshrc, .gitignore .tmux.conf .vim .nvim\n" $red

	rm -rfv $home/.vimrc $home/.zshrc $home/.gitignore $home/.tmux.conf $home/.vim $home/.config/nvim

	# Stowing Dotfiles
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###  Stowing Dotfiles ###"
	echo -e "#########################\n" $normal

	# Cd'ing into Code folder
	printf "%sNavigating into $dot directory\n\n" $green
	cd $dot
	sleep 2

	printf "%sStowing OS common files...\n\n" $green
	# Thanks to the .stowrc file we can just run the below command
	stow .
	# stow -n -t ~/ common --ignore=".oh-my-zsh" -v # Mock Stow

	# Installing Missing Submodules 
	printf "%s\n" $yellow
	echo "#########################"
	echo "###     Installing    ###"
	echo "###     Submodules    ###"
	echo "#########################\n"

	git submodule update --init --recursive
	printf "%sSubmodules complete\n" $green

	printf $blue
	echo "*******************************"
	echo "     Installation Complete     "
	echo "           For $os             "
	echo "*******************************"
	echo $nl

	printf "%sPlease review below to make sure all stowed links are correct...\n" $green

	printf "%sHome Directory\n" $green
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
