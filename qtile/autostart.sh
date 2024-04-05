#!/bin/sh

# Check if application is running
run() {
  if ! pgrep $1 ; then
      $@&
  fi
}

# X compositor
picom -b &
# picom --experimental-backends &

# Autostart
run alacritty

# Wallapper
python /home/marci/.local/bin/xwall.py -r
