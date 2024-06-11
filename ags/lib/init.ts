import matugen from "./matugen"
import gtk from "./gtk"
import lowBattery from "./battery"
import notifications from "./notifications"

export default function init() {
    try {
        gtk()
        matugen()
        lowBattery()
        notifications()
    } catch (error) {
        logError(error)
    }
}
