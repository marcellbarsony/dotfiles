rule = {
    matches = {
        {
            { "node.name", "equals", "Dummy-Driver" },
        },
    },
    apply_properties = {
        ["node.description"] = "ALSAcard",
        ["node.nick"] = "ALSAcard"
    },
}

table.insert(alsa_monitor.rules,rule)
