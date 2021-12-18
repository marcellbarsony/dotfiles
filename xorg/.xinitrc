#!/bin/sh

# Monitor
zsh /home/marci/.config/xorg/xrandr/marci_home.sh

# Compositor
picom --experimental-backends &

# Wallpaper
xwallpaper --screen 0 --maximize $HOME/Downloads/Wallpapers/4K/Synthwave/4k_cyberpunk_city.jpg

# X11 - Xresources
#xrdb -load ~/.config/xorg/xresources &

# X11 - Xmodmap
#xmodmap ~/.config/xorg/xmodmap &

# Unclutter
exec unclutter --timeout 3 &

# Window manager
exec leftwm
