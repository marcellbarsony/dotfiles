# https://qtile.readthedocs.io/en/stable/manual/config/groups.html

from libqtile.config import ScratchPad, DropDown
from variables import terminal
from groups import groups

# ScratchPads
groups.append(
    ScratchPad("scratchpad",
        [
            DropDown(
                "term",
                terminal,
                x=0.1,
                y=0.1,
                width=0.8,
                height=0.8,
                opacity=1,
                warp_pointer=True,
                on_focus_lost_hide=False
            ),
        ]
    ),
)
