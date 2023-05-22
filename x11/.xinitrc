#!/bin/sh

# Compositor
picom -b &
#picom --experimental-backends &

# Monitor
zsh /home/marci/.config/x11/xrandr/double.sh

# Unclutter
exec unclutter --timeout 3 &

# Wallpaper
xwallpaper --output eDP1 --maximize $HOME/Pictures/4K/Synthwave/4k_cyberpunk_city.jpg
xwallpaper --output DP1 --maximize $HOME/Pictures/4K/Synthwave/4k_cyberpunk_city.jpg
xwallpaper --output HDMI2 --maximize $HOME/Pictures/4K/Synthwave/4k_cyberpunk_city.jpg

# Notification
# dunst &

# X11 - Xresources && Xmodmap
#xrdb -load ~/.config/x11/xresources &
#xmodmap ~/.config/x11/xmodmap &

# Window Manager
qtile start
