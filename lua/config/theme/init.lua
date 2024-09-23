-- local colorscheme = "kanagawa-wave"
-- local colorscheme = "everforest"
-- local scheme_dark = "gruvbox-material"
local scheme_dark = "catppuccin-mocha"

local scheme_light = "deepwhite"

local is_dark = true

local function setScheme()
	vim.opt.background = is_dark and "dark" or "light"
	local scheme = is_dark and scheme_dark or scheme_light

	local ok, _ = pcall(vim.cmd.colorscheme, scheme)
	if not ok then
		vim.notify("colorscheme " .. scheme .. " not found!")
	end
	require("config.theme.cmp").setupColors(is_dark)
end

setScheme()

vim.keymap.set("n", "<leader>\\t", function()
	is_dark = not is_dark
	setScheme()
end, { desc = "Toggle dark/light colorschemes" })
