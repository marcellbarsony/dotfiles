#!/bin/sh

# [ -f /etc/xprofile ] && . /etc/xprofile
# [ -f ~/dotfiles/xorg/.xprofile ] && . ~/dotfiles/xorg/.xprofile

xrdb -load ~/dotfiles/xorg/xresources &
xmodmap ~/dotfiles/xorg/xmodmap &
exec slstatus &
exec dwm
