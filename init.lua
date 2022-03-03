local g = vim.g

-- Leader
g.mapleader = " "

-- Disable filetype plugin, use the new Lua version
g.do_filetype_lua = 1
g.did_load_filetypes = 0

vim.cmd([[set termguicolors]])
vim.cmd([[au BufRead,BufNewFile *.pcss setfiletype css]])
vim.cmd([[au BufRead,BufNewFile *.prisma setfiletype prisma]])

vim.cmd([[
  " highlights yanked text
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END
]])

if not vim.g.vscode then
	require("config.utils")
	require("config.mapping")
	require("config.options")
	require("config.plugins")
	require("config.theme")
	require("config.lsp")
	require("config.debug")
else
	-- vscode extension
end
