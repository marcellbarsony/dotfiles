# Default programs
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="Librewolf"
export WM="qtile"

# XDG paths
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="$HOME/usr/local/share:/usr/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Paths
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"
export STARSHIP_CONFIG=~/.config/starship/config.toml
export ZDOTDIR="$HOME/.config/zsh/"
export XINITRC="$HOME/.config/x11/"
# export GIT_CONFIG="#$XDG_CONFIG_HOME/git/config"
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
# set viminfofile=$XDG_CONFIG_HOME/nvim/viminfo

# Python
export PATH="/usr/lib/python3.10/site-packages:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH=/home/marci/.local/share/cargo/bin:$PATH

# Scripts
export PATH=$HOME/.local/git/scripts:$PATH
export PATH=$HOME/.local/git/scripts/malware/ransomware:$PATH

# Fix prompt issue
export LC_CTYPE=en_US.UTF-8

# Disable files
export LESSHISTFILE=-
