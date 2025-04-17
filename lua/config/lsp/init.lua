vim.diagnostic.config({
	-- virtual_text = false,
	virtual_text = { severity = 1 },
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

require("config.mapping.lsp-keymaps")

local presentLspConfig, lspconfig = pcall(require, "lspconfig")
local presentMasonLsp, masonLsp = pcall(require, "mason-lspconfig")

if presentLspConfig and presentMasonLsp then
	local configs = require("config.lsp.handlers").get_configs()

	masonLsp.setup_handlers({
		function(server_name) lspconfig[server_name].setup(configs[server_name] or {}) end,
	})
end
