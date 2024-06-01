import Gtk from "gi://Gtk?version=3.0"
import Gdk from "gi://Gdk"

export function forMonitors(widget: (monitor: number) => Gtk.Window) {
    const n = Gdk.Display.get_default()?.get_n_monitors() || 1
    return range(n, 0).flatMap(widget)
}
