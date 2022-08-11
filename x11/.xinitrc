#!/bin/sh

# Monitor
#zsh /home/marci/.config/x11/xrandr/marci_home.sh

# Wallpaper
xwallpaper --output VGA-1 --maximize $HOME/Documents/Wallpapers/4K/Synthwave/4k_cyberpunk_city.jpg

# Compositor
# picom --experimental-backends &
picom -b &

# X11 - Xresources
#xrdb -load ~/.config/x11/xresources &

# X11 - Xmodmap
#xmodmap ~/.config/x11/xmodmap &

# Unclutter
exec unclutter --timeout 3 &

# Window manager
qtile start
# exec openbox-session
# exec lefwm
