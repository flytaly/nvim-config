if vim.g.vscode then
else
	require("config.mapping")
	require("config.lazy-nvim")
	require("config.mason")
	require("config.options")
	require("config.filetypes")
	require("config.theme")
	require("config.lsp")
	require("config.debug")
	require("autocmd")
	require("neovide")
	require("commands")
end
