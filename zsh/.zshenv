# Default programs
export BROWSER="Firefox"
export EDITOR="nvim"
export TERMINAL="alacritty"
export VISUAL="nvim"
export WM="qtile"

# Language
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# $PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# XDG
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
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ZDOTDIR="$HOME/.config/zsh/"
export XINITRC="$HOME/.config/x11/"
export QT_QPA_PLATFORMTHEME=qt5ct
#export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"
#export QT_STYLE_OVERRIDE="Adwaita-Dark"

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Python
export PATH="/usr/lib/python3.10/site-packages:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Ruby
#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:GEM_HOME/bin"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUST_BACKTRACE=1
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$HOME/.local/share/cargo/bin:$PATH"

# Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship

# SSH
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Sudo
export SUDO_PROMPT="$(tput bold setaf 4)[sudo]$(tput sgr0) password for %p: "

# Disable files
export LESSHISTFILE=-
