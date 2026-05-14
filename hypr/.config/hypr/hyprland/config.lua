hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1,
        inactive_opacity = 1,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0x1a1a1aee
        },

        blur = {
            enabled = false
        }
    },
    animations = {
        enabled = true
    }
})


hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = true,
    },
})


hl.config({
    input = {
        kb_layout     = "us,ru",
        kb_variant    = "",
        kb_model      = "",
        kb_options    = "",
        kb_rules      = "",

        repeat_rate   = 40,

        follow_mouse  = 1,

        sensitivity   = 0,
        accel_profile = "flat",

        touchpad      = {
            natural_scroll = true,
        },
    },
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    }
})
