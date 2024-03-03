local colorscheme = "ayu-mirage"
-- local colorscheme = "everforest"
-- local colorscheme = "catppuccin-frappe"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end

require("config.theme.cmp").setupColors()
