vim.diagnostic.config({
	-- virtual_text = false,
	virtual_text = { severity = 1 },
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

require("config.mapping.lsp-keymaps")
