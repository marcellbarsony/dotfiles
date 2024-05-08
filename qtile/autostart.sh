#!/bin/sh

# Check if application is running
run() {
  if ! pgrep $1 ; then
      $@&
  fi
}

# Autostart
run alacritty

# X11 [Compositor]
# picom -b &
# picom --experimental-backends &

# Wallapper
# python /home/marci/.local/bin/xwall.py -r
