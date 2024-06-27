-- local colorscheme = "kanagawa-wave"
-- local colorscheme = "everforest"
local darkScheme = "gruvbox-material"

local lightScheme = "deepwhite"

local isDark = true

local function setScheme()
	vim.opt.background = isDark and "dark" or "light"
	local scheme = isDark and darkScheme or lightScheme

	local ok, _ = pcall(vim.cmd.colorscheme, scheme)
	if not ok then
		vim.notify("colorscheme " .. scheme .. " not found!")
	end

	require("config.theme.cmp").setupColors()
end

setScheme()

vim.keymap.set("n", "<leader>\\t", function()
	isDark = not isDark
	setScheme()
end, { desc = "Toggle dark/light colorschemes" })
