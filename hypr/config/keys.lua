local mod = "SUPER"

-- Base apps
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(TERMINAL))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(BROWSER))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(LAUNCHER .. " drun"))

-- Window focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Move focus left" })
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Move focus up" })
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Move focus down" })

-- Widnow resize
hl.bind(mod .. " + CTRL + L", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true, description = "Increase window width with keyboard" })
hl.bind(mod .. " + CTRL + H", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true, description = "Reduce window width with keyboard" })
hl.bind(mod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true, description = "Increase window height with keyboard" })
hl.bind(mod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true, description = "Reduce window height with keyboard" })

-- Window swap
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }), { description = "Swap tiled window right" })
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }), { description = "Swap tiled window left" })
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }), { description = "Swap tiled window up" })
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }), { description = "Swap tiled window down" })

-- Switch workspace
for i = 1, 10 do
	local key = i % 10
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus on workspace " .. i })
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Focus on workspace " .. i })
end

-- Window mods
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle Fullscreen" })
hl.bind(mod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "Toggle Maximize Window" })
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Floating" })
-- hl.bind(mod .. " + ALT + T", function() hl.dispatch(hl.dsp.window.float({ action = "toggle" })); hl.dispatch(hl.dsp.window.pin()) end, { description = "Toggle floating + pinned" })

-- Close window
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Mouse
hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window with the left mouse" })
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window with the right mouse" })
hl.bind("ALT + mouse:274", hl.dsp.window.resize({ keep_aspect_ratio = 1 }), { mouse = true, description = "Resize with aspect ratio window with the middle mouse" })


-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true, description = "Raise volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),      { locked = true, repeating = true, description = "Lower volume" })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true, description = "Mute audio" })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true, description = "Mute microphone" })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true, description = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true, description = "Decrease brightness" })

-- Reload waybar
hl.bind(mod .. " + R", hl.dsp.exec_cmd("(pkill waybar || true) && waybar & disown"), { description = "Reload waybar" })

-- Screenshot
hl.bind("Print", function()
	local mon = hl.get_active_monitor()
	local n = mon and mon.id or 0
	hl.exec_cmd("flameshot screen --number " .. n .. " --edit")
end, { description = "Take screenshot" })

-- Lock screen
hl.bind(mod .. " + F10", hl.dsp.exec_cmd("hyprlock"), { description = "Lock screen" })

-- Cliphistory
hl.bind(mod .. " + V", hl.dsp.exec_cmd(LAUNCHER .. " cliphist"), { description = "Open clipboard history" })
