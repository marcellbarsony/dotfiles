#!/bin/sh

# [ -f /etc/xprofile ] && . /etc/xprofile
# [ -f ~/dotfiles/xorg/.xprofile ] && . ~/dotfiles/xorg/.xprofile

# feh --bg-scale ~/Downloads/arch.jpg &

wal -R # Restore last colorscheme
xrdb -load ~/.config/xorg/xresources &
xmodmap ~/.config/xorg/xmodmap &
exec slstatus &
exec dwm
