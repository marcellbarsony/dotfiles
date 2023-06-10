# Hooks
# https://qtile.readthedocs.io/en/stable/manual/config/hooks.html
# https://qtile.readthedocs.io/en/stable/manual/ref/hooks.html

import os
import subprocess
from libqtile import hook


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])
