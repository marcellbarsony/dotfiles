#!/bin/sh

# [ -f /etc/xprofile ] && . /etc/xprofile
# [ -f ~/dotfiles/xorg/.xprofile ] && . ~/dotfiles/xorg/.xprofile

# jfeh --bg-scale ~/Downloads/arch.jpg &

xrdb -load ~/.config/xorg/xresources &
xmodmap ~/.config/xorg/xmodmap &
exec slstatus &
exec dwm
