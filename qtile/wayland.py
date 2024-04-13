from libqtile import qtile
from libqtile.backend.wayland.inputs import InputConfig

if qtile.core.name == "wayland":
    wl_input_rules = {
        "*": InputConfig(
            left_handed=False,
            pointer_accel=False
        ),
        "type:keyboard": InputConfig(
            kb_layout="us",
            kb_variant="colemak_dh",
            kb_options="caps:capslock"
        ),
    }
