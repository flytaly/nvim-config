local colorscheme = "kanagawa-wave"
-- local colorscheme = "everforest"
-- local colorscheme = "catppuccin-frappe"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end

require("config.theme.cmp").setupColors()

local darkScheme = colorscheme
local lightScheme = "deepwhite"
local current = darkScheme

-- local colorscheme = "everforest"
vim.keymap.set("n", "<leader>\\t", function()
	current = current == darkScheme and lightScheme or darkScheme
	vim.cmd("colorscheme " .. current)
end, { desc = "Toggle dark/light colorschemes" })
