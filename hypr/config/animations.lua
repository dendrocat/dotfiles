hl.config({
	animations = {
		enabled = true,
	}
})

-- Curves
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("easeOutBounce", { type = "bezier", points = { { 0, 0.8 }, { 0.4, 1.05 } } })
hl.curve("easeInExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.7, 0 }, { 0.8, 0 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })

-- Rules
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "easeInExpo", style = "gnomed" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "easeInExpo" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "easeInExpo" })

hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "easeInExpo", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "easeOutExpo" })

hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "easeInExpo" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "easeOutExpo" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOutBounce", style = "slidevert" })
