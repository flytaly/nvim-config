if vim.g.vscode then
else
	require("config.mapping")
	require("config.lazy-nvim")
	require("config.options")
	require("config.filetypes")
	require("config.theme")
	require("config.lsp")
	require("config.debug")
	require("neovide")
	require("eslint")
end
