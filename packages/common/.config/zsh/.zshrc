# zmodload zsh/zprof        # Used to measure ZSH performance

# =========================================================
# Variables
# =========================================================
user="$(whoami)"
ZUTIL=$ZDOTDIR/utils
ZPLUG=$ZDOTDIR/plugins

# =========================================================
# History
# =========================================================
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# =========================================================
# Shell behaviour
# =========================================================
# ---------- GENERAL ----------
export COLORTERM=truecolor

if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

# Enabling vim mode for zsh
export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

# ---------- FASTFETCH ----------
fastfetch

# ---------- YAZI ----------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ---------- BUN ----------
[ -s "/Users/cm/.bun/_bun" ] && source "/Users/cm/.bun/_bun" # bun completions

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# ---------- CARAPACE ----------
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

export PATH="/usr/local/sbin:/opt/nvim-linux64/bin:$HOME/.volta/bin:$HOME/go/bin/:$PATH"
export BAT_THEME="gruvbox-dark"


# =========================================================
# Modular Config Files
# =========================================================

# ---------- Prompt/theme ----------
source "$ZUTIL/theme.zsh"

# ---------- Custom keybindings  ----------
source "$ZUTIL/binding.zsh"

# ---------- Aliases ----------
source "$ZUTIL/alias.zsh"

# ---------- Plugins and plugin manager ----------
eval "$(zoxide init zsh)" # Set up zoxide
source $ZPLUG/fzf.zsh
source $ZPLUG/git.plugin.zsh
source $ZPLUG/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZPLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# zprof # ZSH Performance End
