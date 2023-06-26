from libqtile import layout
from colors import *


layouts = [
    # Bsp
    # layout.Bsp(),

    # Max
    # layout.Max(
    #    border_focus = '#FFFFFF',
    #    border_normal = '#FFFFFF',
    #    border_width = 3,
    #    margin = [15, 15, 15, 15],
    #    ),

    # Columns
    layout.Columns(
        border_focus=[PRIMARY],
        border_focus_stack=['#000000', PRIMARY],
        border_normal=['#000000'],
        border_normal_stack=['#000000'],
        border_on_single=False,
        border_width=2,
        grow_amount=10,
        insert_position=1,
        margin=[5, 5, 5, 5],
        margin_on_single=0,
        num_columns=2,
        split=True,
        wrap_focus_columns=True,
        wrap_focus_rows=True,
        wrap_focus_stacks=True,
        ),

    # Floating
    # layout.Floating(
    #     border_focus=PRIMARY,
    #     border_normal=['#222255'],
    #     border_width=1,
    #     fullscreen_border_width=3,
    #     max_border_width=3,
    #     ),

    # Matrix
    # layout.Matrix(),

    # MonadTall
    # layout.MonadTall(),

    # MonadWide
    # layout.MonadWide(),

    # RatioTile
    # layout.RatioTile(),

    # Stack
    # layout.Stack(
    #    num_stacks=2
    #    ),

    # Tile
    # layout.Tile(),

    # TreeTab
    # layout.TreeTab(),

    # VerticalTile
    # layout.VerticalTile(),

    # Zoomy
    # layout.Zoomy(),
]
