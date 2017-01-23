#!/bin/bash

arch () {
	# sudo pacman -Syu
	rm -rf ~/.{'xinitrc','Xresources','vim','zshrc','vimrc'}
	cp -s ~/dotfiles/configs/vim/.vimrc ~/
	cp -r ~/dotfiles/configs/vim/.vim ~/
	ln -s ~/dotfiles/configs/x/.* ~/
	ln -s ~/dotfiles/configs/zsh/.zshrc ~/
	source ~/.zshrc
}
