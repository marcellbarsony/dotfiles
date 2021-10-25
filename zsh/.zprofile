if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep xmonad || startx "$HOME/dotfiles/xorg/.xinitrc"
fi

eval "$(gh completion -s zsh)"