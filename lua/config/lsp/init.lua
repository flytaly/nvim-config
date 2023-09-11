local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local handlers = require("config.lsp.handlers")
handlers.setup()

local presentMasonLsp, masonLsp = pcall(require, "mason-lspconfig")
if not presentMasonLsp then
	return
end

local configs = require("config.lsp.servers").get_configs(handlers.on_attach)

local default = { on_attach = handlers.on_attach, capabilities = handlers.capabilities }

masonLsp.setup_handlers({
	function(server_name)
		local opts = configs[server_name] or {}
		opts = vim.tbl_deep_extend("force", default, opts)
		lspconfig[server_name].setup(opts)
	end,
})

require("config.lsp.servers.null_ls").setup(handlers.on_attach)
require("config.lsp.servers.ls_emmet")
