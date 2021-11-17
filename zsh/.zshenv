# Default programs
export TERMINAL="alacritty"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="Firefox"
export WM="dwm"

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Paths
export ZDOTDIR="$HOME/.config/zsh/"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export XINITRC="$HOME/.config/xorg/"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Disable files
export LESSHISTFILE=-
