import init from "/lib/init"
import Bar from "/widgets/bar/Bar"

import Gio from "gi://Gio"


App.config({
    windows: () => [
        Bar(0),
        Bar(1),
        Bar(2),
        // ...forMonitors(Bar)
    ],
})
