#!/bin/sh

# Compositor
picom --experimental-backends &

# Xresources
xrdb -load ~/.config/xorg/xresources &

# Xmodmap
xmodmap ~/.config/xorg/xmodmap &

# Unclutter
exec unclutter --timeout 3 &

# Status bar
exec slstatus &

# Window manager
exec dwm
