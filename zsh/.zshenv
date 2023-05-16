# Default programs
export BROWSER="Librewolf"
export EDITOR="nvim"
export TERMINAL="kitty"
export VISUAL="nvim"
export WM="qtile"

# Language
export LANG=en_US.UTF-8

# $PATH
# https://wiki.archlinux.org/title/zsh#Configuring_$PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# XDG paths
export XDG_APP_HOME="$HOME/.local/share/applications"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_FONT_HOME="$HOME/.local/share/fonts"
export XDG_ICON_HOME="$HOME/.local/share/icons"
export XDG_STATE_HOME="$HOME/.local/state"

# Paths
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"
export ZDOTDIR="$HOME/.config/zsh/"
export XINITRC="$HOME/.config/x11/"
export GIT_CONFIG="#$XDG_CONFIG_HOME/git/config"
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
# set viminfofile=$XDG_CONFIG_HOME/nvim/viminfo

# NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Python
export PATH="/usr/lib/python3.10/site-packages:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Ruby
#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:GEM_HOME/bin"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH=/home/marci/.local/share/cargo/bin:$PATH

# Scripts
#export PATH=$HOME/.local/git/scripts:$PATH
#export PATH=$HOME/.local/git/scripts/malware/ransomware:$PATH

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship

# Spaceship prompt
# export SPACESHIP_CONFIG="$HOME/.config/spaceship/spaceship.zsh"

# SSH
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Fix prompt
export LC_CTYPE=en_US.UTF-8

# Disable files
export LESSHISTFILE=-
