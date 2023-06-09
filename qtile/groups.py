from libqtile.config import Group, Key, ScratchPad, DropDown

from keybindings import *
from variables import *

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Workspaces [named]
# group_names = ' 1 2 3 4 5'.split()
# group_names = ' 一 二 三 四 五'.split()
# groups = [Group(name, layout='max') for name in group_names]
#
# for i, name in enumerate(group_names):
#     indx = str(i + 1)
#     keys += [
#         Key([mod], indx, lazy.group[name].toscreen()),
#         Key([mod, 'shift'], indx, lazy.window.togroup(name))]

# Workspaces
# groups = [
#     Group(" 1 ", layout='Columns'),
#     Group(" 2 ", layout='Columns'),
#     Group(" 3 ", layout='Columns'),
#     Group(" 4 ", layout='Columns'),
#     Group(" 5 ", layout='Columns'),
#     Group(" 6 ", layout='Columns'),
#     Group(" 7 ", layout='Columns'),
#     Group(" 8 ", layout='Columns'),
#     Group(" 9 ", layout='Columns'),
# ]

# ScratchPad
groups.append(
    ScratchPad("scratchpad", [
        DropDown("term", "kitty", x=0.1, y=0.1, height=0.8, width=0.8, opacity=1, warp_pointer=True, on_focus_lost_hide=False)]),
)
