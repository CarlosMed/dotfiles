#Exports
eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL="nvim"
else
  export EDITOR='nvim'
  export VISUAL="nvim"
fi

# ---------- Pager ----------
export MANPAGER="nvim --clean +Man!"
# export MANPAGER="less -R --use-color -Dd+r -Du+b" # → Use less for man syntax highlighting:

# ---------- GPG ----------
# # Only set GPG_TTY when attached to a terminal; otherwise $(tty)
# returns "not a tty" and breaks pinentry later
if [[ -t 0 ]]; then
  export GPG_TTY="$(tty)"
fi
