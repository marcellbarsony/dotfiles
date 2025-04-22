from libqtile.config import ScratchPad, DropDown
from variables import terminal
from groups import groups

# {{{ Scratchpads
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
                on_focus_lost_hide=False,
                opacity=1,
                warp_pointer=True,
            ),
        ]
    ),
)
# }}}
