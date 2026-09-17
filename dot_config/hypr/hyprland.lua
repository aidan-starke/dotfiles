-- Hyprland config - modular layout (Lua, migrated from hyprland.conf)
-- See https://wiki.hypr.land/Configuring/

require("monitors")
require("input")
require("animations")

-- Environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("TERMINAL", "kitty")
hl.env("XDG_MENU_PREFIX", "arch-")

hl.config({
    dwindle = {
        preserve_split = true,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 0,
    },
})

-- DMS startup
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/fix-dolphin-mime.sh")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
end)

-- Window rules
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "float-firefox-pip",
    match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
    float = true,
})

hl.window_rule({
    name  = "float-blueman",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name  = "float-steam",
    match = { class = "^(steam)$" },
    float = true,
})

hl.layer_rule({
    name  = "no-anim-quickshell",
    match = { namespace = "^(quickshell)$" },
    no_anim = true,
})

-- Custom binds (on top of DMS defaults)
hl.bind("SUPER + RETURN",    hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + D",         hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("kitty --title lazydocker lazydocker"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + P",         hl.dsp.window.pseudo())
hl.bind("SUPER + 0",         hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- DMS managed configs (colors, layout, cursor, binds)
require("dms.colors")
require("dms.outputs")
require("dms.layout")
require("dms.cursor")
require("dms.binds")
