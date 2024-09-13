#!/usr/bin/env bash

dir="/home/$USER/tmp/screenshots"
file=$(date +%Y%m%d-%H%M%S)

if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
fi

grim -g "$(slurp)" "$dir"/"$file".png

exit 0
