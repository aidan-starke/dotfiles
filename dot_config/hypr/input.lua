-- See https://wiki.hypr.land/Configuring/Core/Config-Options/#input

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "dvorak",
        kb_options = "ctrl:nocaps",

        repeat_rate  = 40,
        repeat_delay = 300,

        numlock_by_default = true,

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            clickfinger_behavior = true,
            scroll_factor        = 0.4,
            disable_while_typing = true,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
