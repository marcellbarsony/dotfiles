#!/usr/bin/env bash

DIR="/home/$USER/Downloads/screenshots"
FILE=$(date +%Y%m%d-%H%M%S)

if [[ ! -d "$DIR" ]]; then
    mkdir -p "$DIR"
fi

grim -g "$(slurp)" "$DIR"/"$FILE".png

exit 0
