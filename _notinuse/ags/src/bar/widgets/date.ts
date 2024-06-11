import PanelButton from "../PanelButton"
import options from "options"
import GLib from "gi://GLib"

export const clock = Variable(GLib.DateTime.new_now_local(), {
    poll: [1000, () => GLib.DateTime.new_now_local()],
})

const { format, action } = options.bar.date
const time = Utils.derive([clock, format], (c, f) => c.format(f) || "")

export default () => PanelButton({
    window: "datemenu",
    on_clicked: action.bind(),
    child: Widget.Label({
        justification: "center",
        label: time.bind(),
    }),
})
