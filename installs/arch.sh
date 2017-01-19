#!/bin/bash

arch () {
	# sudo pacman -Syu
	rm -rf ~/.{'xinitrc','Xresources','vim','zshrc'}
	cp -r ~/dotfiles/configs/vim/ ~/.vim  
	ln -s ~/dotfiles/configs/x/.* ~/
	ln -s ~/dotfiles/configs/zsh/.zshrc ~/
	source ~/.zshrc
}
