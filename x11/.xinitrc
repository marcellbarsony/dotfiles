#!/bin/sh

# Compositor
#picom -b &
#picom --experimental-backends &

# X11 - Xresources && Xmodmap
#xrdb -load ~/.config/x11/xresources &
#xmodmap ~/.config/x11/xmodmap &

# Window Manager
qtile start
