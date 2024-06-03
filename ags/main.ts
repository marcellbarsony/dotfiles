import { forMonitors } from "lib/utils"
import { Clock } from "widgets/clock"
import { Workspaces } from "widgets/hyprland"

function Left() {
    return Widget.Box({
        spacing: 8,
        children: [
            Workspaces(),
            // ClientTitle(),
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 8,
        children: [
            // Media(),
            // Notification(),
        ],
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            // Volume(),
            // BatteryLabel(),
            Clock(),
            // SysTray(),
        ],
    })
}

function Bar(monitor: number) {
    return Widget.Window({
        name: `bar-${monitor}`,
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        }),
    })
}

App.config({
    // https://github.com/Aylur/ags/blob/main/example/simple-bar/style.css
    style: "./css/style.css",
    windows: [
        ...forMonitors(Bar)
    ],
})

export { }
