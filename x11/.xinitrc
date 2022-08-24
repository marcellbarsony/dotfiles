#!/bin/sh

# Compositor
picom -b &
#picom --experimental-backends &

# Monitor
#zsh /home/marci/.config/x11/xrandr/marci_home.sh

# Notification
dunst &

# Unclutter
exec unclutter --timeout 3 &

# X11 - Xresources && Xmodmap
#xrdb -load ~/.config/x11/xresources &
#xmodmap ~/.config/x11/xmodmap &

# Wallpaper
xwallpaper --output VGA-1 --maximize $HOME/Documents/Wallpapers/4K/Synthwave/4k_cyberpunk_city.jpg

# Window manager
qtile start
#exec openbox-session
#exec leftwm
