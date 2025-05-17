if vim.g.vscode then
else
	require("config.mapping")
	require("config.options")
	require("config.lazy-nvim")
	require("config.mason")
	require("config.lsp")
	require("config.filetypes")
	require("config.theme")
	require("config.debug")
	require("config.format").on_save(true)
	require("autocmd")
	require("neovide")
	require("commands")
	require("hypr-switcher")
end
