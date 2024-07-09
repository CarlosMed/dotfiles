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
	printf "%s" $yellow
	echo "#########################"
	echo "###  Installing Brew  ###"
	echo "#########################"

	printf "%s\n" $green
	if test ! $(which brew); then
		echo "Installing Homebrew..."

		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		echo "Setting Shell Path..."
		(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/carlos.medina/.zprofile && eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo "Homebrew already installed"
	fi

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
	printf "%sNavigating into $dot directory\n\n" $green
	cd $dot
	sleep 2

	printf "%sStowing OS common files...\n\n" $green
	# Thanks to the .stowrc file we can just run the below command
	stow .
	# stow -n -t ~/ common --ignore=".oh-my-zsh" -v # Mock Stow

	# Hushing terminal login in MacOS
	cd $home && touch .hushlogin

	# Preparing MacOS terminal commands
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###     Setting up    ###"
	echo	"###     MacOS Pref    ###"
	echo -e "#########################\n" $normal

	# Installing Missing Submodules 
	printf "%s" $yellow
	echo "#########################"
	echo "###     Installing    ###"
	echo "###     Submodules    ###"
	echo "#########################"
  git submodule update --init --recursive

	# Set macOS preferences - we will run this last because this will reload the shell
	source $packages/mac/.macos

	printf $blue
	echo "*******************************"
	echo "     Installation Complete     "
	echo "           For $os             "
	echo "*******************************"
	echo $nl

	printf "%sPlease review below to make sure all stowed links are correct...\n" $green

	# LS'ing home directory
	echo $nl
	ls -la $home
	cd $home
	sleep 3

	# Sourcing zsh to restart the shell
	printf "%s\nRestarting shell...\n\n" $green
	echo $nl

	sleep 2
	exec zsh
}
