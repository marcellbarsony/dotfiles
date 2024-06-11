import Gtk from "gi://Gtk?version=3.0"
import Gdk from "gi://Gdk"
import GLib from "gi://GLib?version=2.0"

/* Monitors */
export function range(length: number, start = 1) {
    return Array.from({ length }, (_, i) => i + start)
}

export function forMonitors(widget: (monitor: number) => Gtk.Window) {
    const n = Gdk.Display.get_default()?.get_n_monitors() || 1
    console.log(`forMonitors: ${n}`);
    return range(n, 0).flatMap(widget)
}
