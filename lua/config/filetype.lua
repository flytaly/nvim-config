-- Disable filetype plugin, use the new Lua version
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 1

local function setfiletype(pattern, filetype)
	vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
		pattern = pattern,
		callback = function()
			vim.bo.filetype = filetype
		end,
	})
end

setfiletype("*.pcss", "css")
setfiletype("*.prisma", "prisma")
