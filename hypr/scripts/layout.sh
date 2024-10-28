#!/usr/bin/env bash

if [[ $(hyprctl -j getoption general:layout | jaq -r '.str') = "master" ]]; then
    hyprctl keyword general:layout "dwindle"
else
    hyprctl keyword general:layout "master"
fi
