# Import

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# Variables

mod = "mod4"
mod1 = "mod1"
browser= "firefox"
terminal = "alacritty"

# Keys

keys = [

    # Terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Next layout"),
    #Key([mod], "Tab", lazy.prev_layout(), desc="Prev layout"),

    # Floating
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='Floating'),

    # Full screen
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc='Fullscreen'),

    # Kill & Reload
    Key([mod], "q", lazy.window.kill(), desc="Kill window"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload Qtile"),

    # Screen
    Key([mod, "control"], "l", lazy.next_screen(), desc='Move focus to next monitor'),
    Key([mod, "control"], "h", lazy.prev_screen(), desc='Move focus to prev monitor'),

    # Spawn
    Key([mod], "d", lazy.spawn("dmenu_run"), desc="Spawn dmenu"),

    # Spawn cmd
    Key([mod], "r", lazy.spawncmd(), desc="Spawn command via prompt widget"),

    # Windows - Focus
    Key([mod], "h", lazy.layout.left(), desc="Focus left"),
    Key([mod], "l", lazy.layout.right(), desc="Focus right"),
    Key([mod], "j", lazy.layout.down(), desc="Focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Focus other window"),

    # Windows - Move
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move up"),

    # Windows - Resize
    Key([mod1], "h", lazy.layout.grow_left(), desc="Grow left"),
    Key([mod1], "l", lazy.layout.grow_right(), desc="Grow right"),
    Key([mod1], "j", lazy.layout.grow_down(), desc="Grow down"),
    Key([mod1], "k", lazy.layout.grow_up(), desc="Grow up"),
    Key([mod1], "n", lazy.layout.normalize(), desc="Reset sizes"),

    # Workspaces
    Key([mod, "control"], "k", lazy.screen.next_group(), desc="Next workspace"),
    Key([mod, "control"], "j", lazy.screen.prev_group(), desc="Prev workspace"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with multiple stack panes
    Key(
        [mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack",
    ),
]

# Workspaces

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod], i.name, lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
                desc="Move window & switch to group {}".format(i.name),
            ),
        ]
    )

# Layouts

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2),
    layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# Widgets

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# Screens

screens = [

    # Screen 0: DP-1
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.CurrentLayout(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={ "launch": ("#ff0000", "#ffffff"), },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                #widget.QuickExit(),
            ],
            24,
            #border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),

    # Screen 1: HDMI-2
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={ "launch": ("#ff0000", "#ffffff"), },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                #widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Configuration variables

auto_fullscreen = True
auto_minimize = True
bring_front_click = False
cursor_warp = False
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
focus_on_window_activation = "smart"
follow_mouse_focus = False
floating_layout = layout.Floating(
    float_rules=[
        # Run `xprop` to see the wm class and name
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
reconfigure_screens = True
wl_input_rules = None
wmname = "LG3D"
