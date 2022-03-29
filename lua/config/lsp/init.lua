local present, _ = pcall(require, "lspconfig")
if not present then
	return
end

local present_lsp_installer, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not present_lsp_installer then
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

local servers = require("config.lsp.servers").get_servers(on_attach)

for serverName, config in pairs(servers) do
	local server_available, server = lsp_installer_servers.get_server(serverName)
	if server_available then
		server:on_ready(function()
			local opts = vim.tbl_deep_extend("force", default_lsp_config, config)
			server:setup(opts)
		end)

		if not server:is_installed() then
			print("installing " .. serverName)
			server:install()
		end
	end
end

require("config.lsp.servers.null_ls").setup(on_attach)
require("config.lsp.servers.ls_emmet").setup(capabilities)
