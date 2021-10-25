#!/bin/sh

xrdb -load ~/dotfiles/xorg/xresources &
xmodmap ~/dotfiles/xorg/xmodmap &
exec xmonad