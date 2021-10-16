if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx "$HOME/dotfiles/xorg/.xinitrc"
fi

eval "$(gh completion -s zsh)"