#!/bin/sh

# [ -f /etc/xprofile ] && . /etc/xprofile
# [ -f ~/dotfiles/xorg/.xprofile ] && . ~/dotfiles/xorg/.xprofile

feh --bg-scale ~/Downloads/arch.jpg &

xrdb -load ~/dotfiles/xorg/xresources &
xmodmap ~/dotfiles/xorg/xmodmap &
exec slstatus &
exec dwm
