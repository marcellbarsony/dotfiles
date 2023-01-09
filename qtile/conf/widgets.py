#!/usr/bin/env python3

from libqtile import bar, widget
from libqtile.config import Screen


class Bar():

    """Docstring for Bar. """

    def exec(self):
        """TODO: to be defined. """

        # Colors
        PRIMARY = '#9A79E6'
        SECONDARY = '#7AA2F7'
        INACTIVE = '#444444'

        # Functions
        def window_name(text):
            """
            TODO: Implement WindowName filter
            """
            valami_list = [" - Chromium", " - Firefox", " - LibreWolf"]
            for string in valami_list:
                text = text.replace(string, "")
                return text

        # Widgets
        widget_defaults = dict(
            font='sans',
            fontsize=13,
            padding=3,
        )
        extension_defaults = widget_defaults.copy()

        # Screens
        screens = [

            # Screen 0: DP-1
            Screen(
                top=bar.Bar([
                    # LEFT
                    # widget.AGroupBox(
                    #     borderwidth=3,
                    #     center_aligne=True,
                    #     disable_drag=True,
                    #     highlight_method='line',
                    #     margin=5,
                    #     padding=0,
                    #     rounded=False
                    #     ),
                    widget.GroupBox(
                        active=PRIMARY,
                        background=None,
                        borderwidth=5,
                        center_aligned=True,
                        disable_drag=True,
                        fontshadow=None,
                        fontsize=15,
                        # foreground='FFFFFF',
                        hide_unused=False,
                        highlight_color=['030009', '4A2996'],
                        highlight_method='line',
                        inactive=INACTIVE,
                        margin=3,
                        # other_current_screen_border='FFFFFF',
                        # other_screen_border='FFFFFF',
                        rounded=False,
                        this_current_screen_border=PRIMARY,
                        this_screen_border=PRIMARY,
                        urgent_border='FF0000',
                        urgent_text='FF0000',
                        ),
                    # widget.CurrentLayoutIcon(
                    #     fmt='{}',
                    #     padding=5,
                    #     scale=0.70,
                    # ),
                    # widget.CurrentLayout(),
                    # widget.Prompt(),
                    # widget.Spacer(),
                    widget.WindowName(
                        background=None,
                        fontsize=14,
                        foreground=PRIMARY,
                        max_chars=500,
                        parse_text=window_name,
                        scroll=False,
                        scroll_delay=5,
                        scroll_interval=0.1,
                        scroll_repeat=True,
                        scroll_step=1,
                        # width=800,
                    ),

                    # RIGHT
                    widget.Spacer(),
                    # Weather
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        # text_closed='☁',
                        text_closed='W',
                        text_opened='[x]',
                        widgets=[
                            widget.OpenWeather(
                                location='Budapest',
                                format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                                foreground=PRIMARY,
                                update_interval=600
                                ),
                        ]
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Updates
                    widget.CheckUpdates(
                        colour_have_updates='22EE44',
                        colour_no_updates=PRIMARY,
                        display_format='{updates}',
                        distro='Arch_Sup',
                        initial_text='Checking updates...',
                        foreground=PRIMARY,
                        no_update_string='No updates',
                        update_interval=3600,
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Active screen
                    # widget.CurrentScreen(
                    #     active_color=PRIMARY,
                    #     active_text='A',
                    #     inactive_color=INACTIVE,
                    #     inactive_text='I'
                    #     ),
                    # widget.Sep(
                    #     foreground=INACTIVE,
                    #     ),
                    # CPU
                    widget.CPU(
                        format='CPU: {load_percent}%',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # RAM
                    widget.Memory(
                        # format='{MemUsed: .0f}{mm} /{MemTotal: .0f}{mm}',
                        format='RAM: {MemUsed:.0f}{mm}',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Battery
                    widget.Battery(
                        battery=0,
                        format='BAT: {percent:2.0%}',
                        foreground=PRIMARY,
                        update_interval=60,
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Time & Date
                    widget.Clock(
                        format='%I:%M %p',
                        foreground=PRIMARY,
                        update_interval=60,
                        ),
                    # System tray
                    widget.Systray(),
                    ],
                    26,
                    border_width=[0, 0, 0, 0],
                    border_color=['000000', '000000', '000000', '000000'],
                    background='#16161E',
                    margin=[3, 5, 0, 5],
                ),
            ),

            # Screen 1: HDMI-2
            Screen(
                top=bar.Bar([
                    # Layout
                    # widget.CurrentLayout(),
                    # Groups
                    widget.GroupBox(
                        active=PRIMARY,
                        background=None,
                        borderwidth=5,
                        center_aligned=True,
                        disable_drag=True,
                        fontshadow=None,
                        fontsize=15,
                        # foreground='FFFFFF',
                        hide_unused=False,
                        highlight_color=['030009', '4A2996'],
                        highlight_method='line',
                        inactive=INACTIVE,
                        margin=3,
                        # other_current_screen_border='FF0000',
                        # other_screen_border='FF0000',
                        rounded=False,
                        this_current_screen_border=PRIMARY,
                        this_screen_border=PRIMARY,
                        urgent_border='FF0000',
                        urgent_text='FF0000',
                        ),
                    # Prompt
                    widget.Prompt(),
                    # Window name
                    widget.WindowName(
                        background=None,
                        fontsize=14,
                        foreground=PRIMARY,
                        max_chars=500,
                        parse_text=window_name,
                        scroll=False,
                        scroll_delay=5,
                        scroll_interval=0.1,
                        scroll_repeat=True,
                        scroll_step=1,
                        # width=800,
                    ),
                    # Key Chord
                    widget.Chord(
                        chords_colors={'launch': ('#ff0000', '#ffffff'), },
                        name_transform=lambda name: name.upper(),
                        ),
                    # Disk Free
                    widget.DF(
                        foreground=PRIMARY,
                        visible_on_warn=False,
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Time & Date
                    widget.Clock(
                        foreground=PRIMARY,
                        format='%a %b-%d',
                        update_interval=60
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Quick exit
                    widget.QuickExit(
                        countdown_format='[ {} seconds ]',
                        countdown_start=5,
                        default_text='[ Shutdown ]',
                        foreground=PRIMARY,
                        ),
                    ],
                    26,
                    border_width=[0, 0, 0, 0],
                    border_color=['000000', '000000', '', '000000'],
                    background='#16161E',
                    margin=[3, 5, 0, 5],
                ),
            ),
        ]
