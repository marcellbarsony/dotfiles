// const { start, center, end } = options.bar.layout
const myLabel = Widget.Label({
    label: 'some example content',
})

export default (monitor: number) => Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: ['top', 'left', 'right'],
    child: myLabel,
    // child: Widget.CenterBox({
    //     css: "min-width: 2px; min-height: 2px;",
    //     startWidget: Widget.Box({
    //         hexpand: true,
    //         children: start.bind().as(s => s.map(w => widget[w]())),
    //     }),
    //     centerWidget: Widget.Box({
    //         hpack: "center",
    //         children: center.bind().as(c => c.map(w => widget[w]())),
    //     }),
    //     endWidget: Widget.Box({
    //         hexpand: true,
    //         children: end.bind().as(e => e.map(w => widget[w]())),
    //     }),
    // }),
    // setup: self => self.hook(transparent, () => {
    //     self.toggleClassName("transparent", transparent.value)
    // }),
})
