local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local presentMasonLsp, masonLsp = pcall(require, "mason-lspconfig")

if presentMasonLsp then
	local configs = require("config.lsp.handlers").get_configs()

	masonLsp.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup(configs[server_name] or {})
		end,
	})
end

require("config.lsp.settings").setup()
