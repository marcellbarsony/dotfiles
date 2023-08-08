# https://qtile.readthedocs.io/en/stable/manual/config/groups.html

from libqtile.config import Group, Key
from keybindings import *
from variables import *


# Groups [default]
groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen(),
                desc="Go to group {}".format(i.name),),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False),
                desc="Go to group {} & Move window".format(i.name),),
            #Key([mod, "shift"], i.name, lazy.window.togroup(i.name), 
            #    desc="Move window to group {}".format(i.name)),
        ]
    )

# Groups [named]
#group_names = ' 一 二 三 四 五 六 七 八 九 十'.split()
##group_names = ' A B C D E'.split()
#groups = [Group(name, layout='max') for name in group_names]
#for i, name in enumerate(group_names):
#    indx = str(i + 1)
#    keys += [
#        Key([mod], indx, lazy.group[name].toscreen(),
#            desc="Go to group"),
#        Key([mod, 'shift'], indx, lazy.window.togroup(name, switch_group=True),
#            desc="Go to group & Move window"),
#        #Key([mod, 'shift'], indx, lazy.window.togroup(name),
#        #    desc="Move window"),
#    ]

# Groups
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
