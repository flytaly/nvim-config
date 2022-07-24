local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local handlers = require("config.lsp.handlers")

handlers.setup()

local on_attach = handlers.on_attach
local capabilities = handlers.capabilities

local default_lsp_config = {
	capabilities = capabilities,
	on_attach = on_attach,
}

local presentMason, mason = pcall(require, "mason")
if not presentMason then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local presentMasonLsp, masonLsp = pcall(require, "mason-lspconfig")
if presentMasonLsp then
	masonLsp.setup({
		ensure_installed = { "delve", "node-debug2-adapter", "typescript-language-server" },
		automatic_installation = true,
	})
end

require("config.lsp.servers").setup(on_attach, default_lsp_config)
require("config.lsp.servers.tsserver").setup()
require("config.lsp.servers.null_ls").setup(on_attach)
require("config.lsp.servers.ls_emmet").setup(capabilities)
