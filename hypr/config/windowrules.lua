-- Picture-in-Picture
hl.window_rule({
	name = "Picture-in-Picture",
	match = {
		title = [[^([Pp]icture[-\s][Ii]n[-\s][Pp]icture)|([Кк]артинка[-\s][Вв][-\s][Кк]артинке).*$]]
	},
	keep_aspect_ratio = true,
	float = true,
	pin = true,
	focus_on_activate = false,
	no_initial_focus = true,
	suppress_event = "activate"
})


-- Flameshot
hl.window_rule({
	match     = { class = "flameshot" },
	no_anim   = true,
	pin       = true,
	float     = true,
	decorate  = false,
	no_blur   = true,
	no_shadow = true,
})
hl.window_rule({
	match = { class = "flameshot", title = "flameshot" },
	move  = { 0, 0 },
})
hl.window_rule({
	match = { class = "flameshot", title = "flameshot-pin" },
	move  = { "cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)" },
})

-- Pavucontrol
hl.window_rule({
	name = "pavucontrol",
	match = { class = ".*org.pulseaudio.pavucontrol.*" },
	float = true,
	center = true,
	size = { 700, 600 },
})

-- Blueman Manager
hl.window_rule({
	name = "blueman-manager",
	match = { class = "blueman-manager" },
	float = true,
	center = true,
	size = { 800, 600 },
})

hl.layer_rule({
    match = {
        namespace = "^(swaync-control-center)$",
    },

    blur = true,
    ignore_alpha = 0.2,
    animation = "slide right",
})

-- Всплывающие уведомления
hl.layer_rule({
    match = {
        namespace = "^(swaync-notification-window)$",
    },

    blur = true,
    ignore_alpha = 0.2,
    animation = "slide right",
})
