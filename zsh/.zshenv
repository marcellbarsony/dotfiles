# Default programs
export BROWSER="Firefox"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export TERMINAL="kitty"
export VISUAL="nvim"
export WM="Hyprland"

# Language
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# $PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Paths
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ZDOTDIR="$HOME/.config/zsh/"
export XINITRC="$HOME/.config/x11/"

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

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Python
export PATH="/usr/lib/python3.10/site-packages:$PATH"
export PATH="$HOME/.local/bin:$PATH"

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

# Wayland
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct
export QT_STYLE_OVERRIDE="Adwaita-Dark"
# export XDG_CURRENT_DESKTOP=KDE

# Zellij
export ZELLIJ_AUTO_ATTACH=true

# Disable files
export LESSHISTFILE=-
