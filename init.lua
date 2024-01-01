if vim.g.vscode then
else
	require("config.mapping")
	require("config.options")
	require("config.lazy-nvim")
	require("config.mason")
	require("config.filetypes")
	require("config.theme")
	require("config.lsp")
	require("config.debug")
	require("config.format").onSave(true)
	require("autocmd")
	require("neovide")
	require("commands")
end
