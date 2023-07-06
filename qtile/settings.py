from libqtile import layout
from libqtile.config import Match


auto_fullscreen = True
auto_minimize = False
bring_front_click = False
cursor_warp = True
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
focus_on_window_activation = "smart"
follow_mouse_focus = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
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
