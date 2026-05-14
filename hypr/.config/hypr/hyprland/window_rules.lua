hl.window_rule({
    name = "telegram-workspace",
    match = {
        initial_class = "org.telegram.desktop"
    },
    workspace = 1
})
hl.window_rule({
    name = "browser-workspace",
    match = {
        initial_class = "firefox"
    },
    workspace = 2
})
hl.window_rule({
    name = "editor-workspace",
    match = {
        initial_class = "dev.zed.Zed",
    },
    workspace = 3
})
