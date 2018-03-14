

# WIMILI
WIMILI is a ~~Windows~~, Mac, and Linux Installation for when i do a
clean install.

## Installing WIMILI
---
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/CarlosMed/dotfiles/master/installs/setup.sh)"
```

## Whats Installed
---
### Configs:
  - [x] Vim config
  - [x] Zshrc config

### Mac:
  - [x] [Homebrew](http://brew.sh/)
  - [x] [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  - [x] [git](http://brewformulas.org/Git)
  - [x] [mongodb](http://brewformulas.org/Mongodb)
  - [x] [neofetch](http://brewformulas.org/Neofetch)
  - [x] [openssl](http://brewformulas.org/Openssl)
  - [x] [dpkg](http://brewformulas.org/Dpkg)

## Using GNU Stow
  1. Install stow if not installed
  1. Navigate to pacakages/[selected package]
  1. run `stow [package folder] -t [location]`
      - The `-t` is used for the target location in which to create the symlink
      - For help and options run `man stow`