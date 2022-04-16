if not vim.g.vscode then
	require("config.mapping")
	require("config.filetype")
	require("config.options")
	require("config.plugins")
	require("config.theme")
	require("config.lsp")
	require("config.debug")

	vim.cmd([[
  " highlights yanked text
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END
]])
else
	-- vscode extension
end
