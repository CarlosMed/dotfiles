#!/bin/bash

# Installation Functions
mac () {
	printf $blue
	echo "*******************************"
	echo "     Preparing Installation    "
	echo "           For $os             "
	echo "*******************************"
	echo $nl
	sleep 3
	
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
	
	# Installing oh-my-zsh
	printf "%s\n" $blue
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

	# Setting up brew packages
	printf "%s\n" $yellow
	echo "#########################"
	echo "###  Installing Brew  ###"
	echo "###      Packages     ###"
	echo "#########################"

	brew tap homebrew/bundle
	brew bundle --file $dot/packages/mac/Brewfile

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
	printf "%sNavigating into $packages directory\n\n" $green
	cd $packages
	sleep 2

	printf "%sStowing OS common files...\n\n" $green
	stow -t ~/ common --ignore=".oh-my-zsh" -v
	# stow -n -t ~/ common --ignore=".oh-my-zsh" -v # Mock Stow

}
