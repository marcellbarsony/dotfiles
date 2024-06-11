import { forMonitors } from "lib/utils"
import "lib/session"
import Bar from "src/bar/bar"

App.config({
    style: "./css/style.css",
    // windows: [
    //     ...forMonitors(Bar)
    // ],
    windows: () => [
        ...forMonitors(Bar),
    ],
})
