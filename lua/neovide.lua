if not vim.g.neovide then
	return
end

vim.g.neovide_cursor_animation_length = 0.07
vim.g.neovide_transparency = 0.96

vim.g.gui_font_default_size = 11
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "JetBrainsMono NFM"
vim.opt.linespace = 1

RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
	vim.g.gui_font_size = vim.g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
	vim.g.gui_font_size = vim.g.gui_font_default_size
	RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

vim.keymap.set({ "n", "i" }, "<C-=>", function()
	ResizeGuiFont(1)
end, { desc = "Increase font size" })
vim.keymap.set({ "n", "i" }, "<C-->", function()
	ResizeGuiFont(-1)
end, { desc = "Decrease font size" })
vim.keymap.set({ "n", "i" }, "<C-BS>", function()
	ResetGuiFont()
end, { desc = "Reset font size" })
