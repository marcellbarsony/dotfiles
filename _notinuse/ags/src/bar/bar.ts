import options from "options"
import Date from "./widgets/date"

const { transparent, position } = options.bar
const { start, center, end } = options.bar.layout

export type BarWidget = keyof typeof widget

const widget = {
    // battery: BatteryBar,
    // colorpicker: ColorPicker,
    date: Date,
    // launcher: Launcher,
    // media: Media,
    // powermenu: PowerMenu,
    // systray: SysTray,
    // system: SystemIndicators,
    // taskbar: Taskbar,
    // workspaces: Workspaces,
    // screenrecord: ScreenRecord,
    // messages: Messages,
    expander: () => Widget.Box({ expand: true }),
}

export default (monitor: number) => Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: position.bind().as(pos => [pos, "right", "left"]),
    child: Widget.CenterBox({
        startWidget: Widget.Box({
            hexpand: true,
            children: start.bind().as(s => s.map(w => widget[w]())),
        }),
        centerWidget: Widget.Box({
            hpack: "center",
            children: center.bind().as(c => c.map(w => widget[w]())),
        }),
        endWidget: Widget.Box({
            hexpand: true,
            children: end.bind().as(e => e.map(w => widget[w]())),
        }),
    }),
    setup: self => self.hook(transparent, () => {
        self.toggleClassName("transparent", transparent.value)
    }),
})
