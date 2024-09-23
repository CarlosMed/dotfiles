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
	sleep 5

	printf "%s\n" $green
	echo "Installing Packages..."
	sudo pacman -S --needed - < $home/Code/dotfiles/packages/linux/pkglist.txt 

	# Installing oh-my-zsh
	printf "%s\n" $yellow
	echo "#########################"
	echo "###     Installing    ###"
	echo "###     oh-my-zsh     ###"
	echo "#########################"
	sleep 5

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
	sleep 5

	git submodule update --init --recursive
	printf "%s\nSubmodules complete\n\n" $green

	# Installing Yay
	printf "%s" $yellow
	echo "#########################"
	echo "###  Installing Yay   ###"
	echo "###    AUR Manager    ###"
	echo "#########################"
	sleep 5
	
	printf "%s\nCreating and navigatting to temp folder\n" $yellow
	echo ""
	cd $home
	mkdir tmp
	cd tmp

	printf "%s\nClonning and installing yay\n\n" $yellow
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si

	printf "%s\n" $yellow
	echo "#########################"
	echo "###  Installing Yay   ###"
	echo "###     Packages      ###"
	echo "#########################"
	sleep 5

	printf "%s\n" $yellow
	yay --needed - < $home/Code/dotfiles/packages/linux/aur-pkglist.txt 
	printf "%s\nYay installation complete.\n" $yellow
	
	# Preparing Dotfiles
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###     Setting up    ###"
	echo	"###      Dotfiles     ###"
	echo -e "#########################" $normal
	sleep 5

	# Removing .zshrc .oh-my-zsh/custom/* .vimrc
	printf "%s\nRemoving .vimrc, .zshrc, .gitignore .tmux.conf .vim .nvim\n" $red

	rm -rfv $home/.vimrc $home/.zshrc $home/.gitignore $home/.tmux.conf $home/.vim $home/.config/nvim $home/.config/hypr $home/.config/kitty

	# Stowing Dotfiles
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###      Stowing      ###"
	echo 	"###      Dotfiles     ###"
	echo -e "#########################" $normal
	sleep 5

	# Cd'ing into Code folder
	printf "%s\nNavigating into $dot directory\n\n" $green
	cd $dot
	sleep 2

	printf "%sStowing OS common files...\n\n" $green
	# Thanks to the .stowrc file we can just run the below command
	stow .
	# stow -n -t ~/ common --ignore=".oh-my-zsh" -v # Mock Stow

	# Configuring nvidia drivers
	printf "%s\n" $yellow
	echo 	"#########################"
	echo 	"###    Setting Up     ###"
	echo 	"###   Nvidia Drivers  ###"
	echo -e "#########################" $normal
	sleep 5

	printf "%s\nNvidia.conf creationg completed\n" $yellow
	sudo tee /etc/modprobe.d/nvidia.conf <<EOF
options nvidia_drm modeset=1 fbdev=1
EOF
	sleep 5
	
printf "%s\n\nPlease make sure to add MODULES(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...) to /etc/mkinitcpio.conf\n" $red

printf "%s\n\nOnce done please run sudo mkinitcpio -P\n" $red
	sleep 8

	printf "%s\n" $blue
	echo "*******************************"
	echo "     Installation Complete     "
	echo "           For $os             "
	echo "*******************************"
	echo $nl

	printf "%sPlease review below to make sure all stowed links are correct...\n" $green
	sleep 5

	printf "%s\nHome Directory\n" $green
	# LS'ing home directory
	echo $nl
	ls -la $home
	sleep 8

	printf "%s\n.config Directory\n" $green
	# LS'ing home directory
	echo $nl
	ls -la $home/.config
	cd $home
	sleep 8

	# Sourcing zsh to restart the shell
	printf "%s\nRestarting shell...\n\n" $green
	echo $nl

	sleep 3
	exec zsh
}
