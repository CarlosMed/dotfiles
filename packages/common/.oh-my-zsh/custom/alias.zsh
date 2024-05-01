# Programming
alias c="code"
alias v="nvim"
alias vz="NVIM_APPNAME=nvim-lazyvim nvim"
alias nr="npm run"
alias lz="lazygit"

# Arch shortcuts
alias pacman="_ pacman"
alias stx="startx"
alias xup="xrdb ~/.Xresources"

# Generic
alias huh="alias | grep"
alias lip="ipconfig getifaddr en0"
alias reboot="_ reboot"
alias shutdown="_ shutdown"
alias trash="npx trash-cli"
alias tup="tmux source-file ~/.config/tmux/tmux.conf"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"

# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# View: https://unix.stackexchange.com/questions/532548/how-do-i-apply-the-changes-to-the-zshrc-file-after-editing-it
alias zup="exec zsh"
# alias zup="source ~/.zshrc"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias ls='eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions'

