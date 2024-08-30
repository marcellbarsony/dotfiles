#!/bin/sh

# Xresources && Xmodmap
#xrdb -load ~/.config/x11/xresources &
#xmodmap ~/.config/x11/xmodmap &

# Unclutter
# exec unclutter --timeout 3 &

# Window Manager
qtile start
