local colorizer = require("colorizer")

local langs = { "svelte", "html", "css", "conf", "lua", "scss" }

local conf = {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true,
}

colorizer.setup(langs, conf)
