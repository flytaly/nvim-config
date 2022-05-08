local M = {}

M.setup = function(colorscheme)
	local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end
end

return M
