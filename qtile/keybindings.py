# https://docs.qtile.org/en/latest/manual/config/lazy.html

from libqtile.config import Key
from libqtile.lazy import lazy
from variables import *
from func_keys import *
from func_audio import audio_increase, audio_decrease, audio_mute

keys = [

    Key([mod], "t", lazy.hide_show_bar(), desc="Bar toggle"),

    # {{{ Audio
    Key([mod], "XF86AudioRaiseVolume", lazy.run(audio_increase), desc="Volume +10%"),
    Key([mod], "XF86AudioLowerVolume", lazy.run(audio_decrease), desc="Volume -10%"),
    Key([mod], "XF86AudioMute", lazy.run(audio_mute), desc="Toggle audio"),
    # }}}

    # Actions {{{1
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    # }}}

    # {{{ Spawn
    Key([mod], "Return", lazy.spawn(terminal), desc="Spawn terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Spawn broswer"),
    Key([mod], "d", lazy.spawn(menu), desc="Spawn menu"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn command prompt"),
    # }}}

    # {{{ Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Next layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Prev layout"),
    # }}}

    # {{{ Window - Actions
    Key([mod],"q", lazy.window.kill(), desc="Kill window"),
    Key([mod],"f", lazy.window.toggle_fullscreen(), lazy.hide_show_bar(), desc="Fullscreen"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="Floating"),
    # }}}

    # {{{ Window - Focus
    Key([mod], "h", lazy.layout.left(), desc="Focus left"),
    Key([mod], "l", lazy.layout.right(), desc="Focus right"),
    Key([mod], "j", lazy.layout.down(), desc="Focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Focus next"),
    # }}}

    # {{{ Window - Move
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move left"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move up"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move right"),
    # }}}

    # {{{ Window - Resize
    Key([mod1], "h", lazy.layout.grow_left(), desc="Grow left"),
    Key([mod1], "l", lazy.layout.grow_right(), desc="Grow right"),
    Key([mod1], "j", lazy.layout.grow_down(), desc="Grow down"),
    Key([mod1], "k", lazy.layout.grow_up(), desc="Grow up"),
    Key([mod], "m", lazy.layout.toggle_split(), desc="Maximize in split"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset windows"),
    # }}}

    # {{{ Scratchpad
    Key([mod], "i", lazy.group["scratchpad"].dropdown_toggle("term"), desc="Scratchpad"),
    # }}}

    # {{{ Groups
    Key([mod, "control"], "j", lazy.screen.prev_group(),   desc="Prev group"),
    Key([mod, "control"], "k", lazy.screen.next_group(),   desc="Next group"),
    Key([mod, "control"], "b", lazy.screen.toggle_group(), desc="Toggle last group"),
    # }}}

    # {{{ Screens
    Key([mod, mod1], "h", lazy.prev_screen(), desc="Focus prev monitor"),
    Key([mod, mod1], "j", lazy.function(window_to_previous_screen), lazy.prev_screen(), desc="Move & Focus prev screen"),
    Key([mod, mod1], "k", lazy.function(window_to_next_screen),     lazy.next_screen(), desc="Move & Focus next screen"),
    Key([mod, mod1], "l", lazy.next_screen(), desc="Focus next monitor"),
    Key([mod], "w", lazy.to_screen(0),  desc="Focus 1st monitor"),
    Key([mod], "e", lazy.to_screen(1),  desc="Focus 2nd monitor"),
    Key([mod], "r", lazy.to_screen(2),  desc="Focus 3rd monitor"),
    Key([mod], "s", lazy.function(switch_screens)),
    # }}}

]
