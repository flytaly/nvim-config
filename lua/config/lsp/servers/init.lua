local lspconfig = require("lspconfig")
local M = {}

M.get_configs = function(on_attach, capabilities)
	return {
		cssls = { settings = { css = { validate = false } } },
		jsonls = require("config.lsp.servers.jsonls"),
		gopls = {
			settings = { gopls = { env = { GOFLAGS = "-tags=windows,linux,unittest" } } },
		},
		sqls = {
			on_attach = function(client, bufnr)
				local ok, sqls = pcall(require, "sqls")
				if ok then
					-- client.resolved_capabilities.execute_command = true
					client.commands = sqls.commands
					sqls.setup({ picker = "telescope" })
				end
				on_attach(client, bufnr)
			end,
		},
		lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
		html = { init_options = { provideFormatter = false } },
		stylelint_lsp = {
			root_dir = lspconfig.util.root_pattern(".stylelintrc", "stylelint.config.js", "package.json"),
			filetypes = { "css" },
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
		},
		graphql = {
			on_attach = function(client)
				client.server_capabilities.workspaceSymbolProvider = false
			end,
		},
	}
end

return M
