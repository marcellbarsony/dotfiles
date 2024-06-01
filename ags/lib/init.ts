import gtk from "./gtk"

export default function init() {
    try {
        gtk()
    } catch (error) {
        logError(error)
    }
}
