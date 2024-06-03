import Gtk from "gi://Gtk?version=3.0"
import Gdk from "gi://Gdk"
import GLib from "gi://GLib?version=2.0"
import icons, { substitutes } from "./icons"

/**
 * @returns [start...length]
 */
export function range(length: number, start = 1) {
    return Array.from({ length }, (_, i) => i + start)
}

export function forMonitors(widget: (monitor: number) => Gtk.Window) {
    const n = Gdk.Display.get_default()?.get_n_monitors() || 1
    console.log(`forMonitors: ${n}`);
    return range(n, 0).flatMap(widget)
}

/*
 * sh
 */
export async function sh(cmd: string | string[]) {
    return Utils.execAsync(cmd).catch(err => {
        console.error(typeof cmd === "string" ? cmd : cmd.join(" "), err)
        return ""
    })
}


/**
  * @returns substitute icon || name || fallback icon
  */
export function icon(name: string | null, fallback = icons.missing) {
    if (!name)
        return fallback || ""

    if (GLib.file_test(name, GLib.FileTest.EXISTS))
        return name

    const icon = (substitutes[name] || name)
    if (Utils.lookUpIcon(icon))
        return icon

    print(`no icon substitute "${icon}" for "${name}", fallback: "${fallback}"`)
    return fallback
}
