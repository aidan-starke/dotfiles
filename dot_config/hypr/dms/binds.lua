-- Converted from dms/binds.conf during the .conf -> .lua migration.
-- (bind = plain, binde = repeating, bindl = locked, bindel = repeating+locked)

-- === Application Launchers ===
hl.bind("SUPER + T",      hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + space",  hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("SUPER + V",      hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER + M",      hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind("SUPER + comma",  hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind("SUPER + N",      hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind("SUPER + Y",      hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind("SUPER + TAB",    hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind("SUPER + escape", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

-- === Cheat sheet ===
hl.bind("SUPER + SHIFT + Slash", hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"))

-- === Security ===
hl.bind("SUPER + ALT + L",      hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind("SUPER + SHIFT + E",    hl.dsp.exit())
hl.bind("CTRL + ALT + Delete",  hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))

-- === Audio Controls ===
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), { repeating = true, locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("dms ipc call audio mute"),        { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("dms ipc call audio micmute"),     { locked = true })
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("dms ipc call mpris playPause"),   { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("dms ipc call mpris playPause"),   { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("dms ipc call mpris previous"),    { locked = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("dms ipc call mpris next"),        { locked = true })

-- === Brightness Controls ===
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd('dms ipc call brightness increment 5 ""'), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd('dms ipc call brightness decrement 5 ""'), { repeating = true, locked = true })

-- === Window Management ===
hl.bind("SUPER + W",         hl.dsp.window.close())
hl.bind("SUPER + F",         hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + SHIFT + T", hl.dsp.window.float())

-- === Focus Navigation ===
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + H",     hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J",     hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K",     hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L",     hl.dsp.focus({ direction = "r" }))

-- === Window Movement ===
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + H",     hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + J",     hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + K",     hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + L",     hl.dsp.window.move({ direction = "r" }))

-- === Column Navigation ===
hl.bind("SUPER + Home", hl.dsp.focus({ window = "first" }))
hl.bind("SUPER + End",  hl.dsp.focus({ window = "last" }))

-- === Monitor Navigation ===
hl.bind("SUPER + CTRL + left",  hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ monitor = "r" }))
hl.bind("SUPER + CTRL + H",     hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + CTRL + J",     hl.dsp.focus({ monitor = "d" }))
hl.bind("SUPER + CTRL + K",     hl.dsp.focus({ monitor = "u" }))
hl.bind("SUPER + CTRL + L",     hl.dsp.focus({ monitor = "r" }))

-- === Move to Monitor ===
hl.bind("SUPER + SHIFT + CTRL + left",  hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + CTRL + down",  hl.dsp.window.move({ monitor = "d" }))
hl.bind("SUPER + SHIFT + CTRL + up",    hl.dsp.window.move({ monitor = "u" }))
hl.bind("SUPER + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind("SUPER + SHIFT + CTRL + H",     hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + CTRL + J",     hl.dsp.window.move({ monitor = "d" }))
hl.bind("SUPER + SHIFT + CTRL + K",     hl.dsp.window.move({ monitor = "u" }))
hl.bind("SUPER + SHIFT + CTRL + L",     hl.dsp.window.move({ monitor = "r" }))

-- === Workspace Navigation ===
hl.bind("SUPER + Page_Down",    hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + Page_Up",      hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + U",            hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + I",            hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + down",  hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + up",    hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + U",     hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + I",     hl.dsp.window.move({ workspace = "e-1" }))

-- === Move Workspaces ===
hl.bind("SUPER + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + Page_Up",   hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + SHIFT + U",         hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + I",         hl.dsp.window.move({ workspace = "e-1" }))

-- === Mouse Wheel Navigation ===
hl.bind("SUPER + mouse_down",        hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",          hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + CTRL + mouse_up",   hl.dsp.window.move({ workspace = "e-1" }))

-- === Numbered Workspaces ===
for i = 1, 9 do
    hl.bind("SUPER + " .. i,             hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i }))
end

-- === Column Management ===
hl.bind("SUPER + bracketleft",  hl.dsp.layout("preselect l"))
hl.bind("SUPER + bracketright", hl.dsp.layout("preselect r"))

-- Percent resizes: hl.dsp.window.resize() only takes pixel numbers,
-- so compute pixels from the active window/monitor size at press time.
local function resize_by_percent(px, py)
    return function()
        local w = hl.get_active_window()
        if w == nil then return end
        hl.dispatch(hl.dsp.window.resize({
            x = math.floor(w.size.x * px / 100),
            y = math.floor(w.size.y * py / 100),
            relative = true,
        }))
    end
end

-- === Sizing & Layout ===
hl.bind("SUPER + R",        hl.dsp.layout("togglesplit"))
hl.bind("SUPER + CTRL + F", function() -- was: resizeactive, exact 100%
    local w = hl.get_active_window()
    if w == nil or w.monitor == nil then return end
    hl.dispatch(hl.dsp.window.resize({ x = w.monitor.size.width, y = w.monitor.size.height, relative = false }))
end)

-- === Move/resize windows with mainMod + LMB/RMB and dragging ===
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

hl.bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind("SUPER + code:21", hl.dsp.window.resize({ x = 100,  y = 0, relative = true }), { description = "Shrink window left" })

-- === Manual Sizing ===
hl.bind("SUPER + minus",         resize_by_percent(-10, 0), { repeating = true })
hl.bind("SUPER + equal",         resize_by_percent(10, 0),  { repeating = true })
hl.bind("SUPER + SHIFT + minus", resize_by_percent(0, -10), { repeating = true })
hl.bind("SUPER + SHIFT + equal", resize_by_percent(0, 10),  { repeating = true })

-- === Screenshots ===
hl.bind("Print",        hl.dsp.exec_cmd("dms screenshot"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("ALT + Print",  hl.dsp.exec_cmd("dms screenshot window"))

-- === Screen Recording ===
hl.bind("SUPER + Print",        hl.dsp.exec_cmd([[bash -c 'wf-recorder -f ~/Videos/recording-$(date +%Y%m%d-%H%M%S).mp4']]))
hl.bind("SUPER + CTRL + Print", hl.dsp.exec_cmd("killall -s SIGINT wf-recorder"))

-- === System Controls ===
-- dpms is not meant to be dispatched directly from a bind; the wiki recommends a oneshot timer
hl.bind("SUPER + SHIFT + P", function()
    hl.timer(function()
        hl.dispatch(hl.dsp.dpms({ action = "toggle" }))
    end, { timeout = 500, type = "oneshot" })
end)
