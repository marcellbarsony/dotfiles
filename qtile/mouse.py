# https://qtile.readthedocs.io/en/stable/manual/config/mouse.html

from libqtile.config import Click, Drag
from libqtile import qtile
from libqtile.lazy import lazy
from variables import *


# Mouse callbacks
def open_sysmonitor(): # TODO
    qtile.cmd_spawn(f'kitty --class neofetch --name neofetch sh -c "neofetch; exec bash"')

# TODO
def open_pacman(): # TODO
    qtile.cmd_spawn(f'kitty --class pacman --name pacman sh -c "sudo pacman -Syu; exec bash"')

# Drag floating layouts
mouse = [
    Drag([mod], "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Click([mod], "Button2",
        lazy.window.bring_to_front()),
    Drag([mod], "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
]
