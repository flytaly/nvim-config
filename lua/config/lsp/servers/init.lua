local lspconfig = require("lspconfig")
local M = {}

M.setup = function(on_attach, capabilities)
	local configs = {
		cssls = require("config.lsp.servers.cssls"),
		jsonls = require("config.lsp.servers.jsonls"),
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
		sumneko_lua = require("config.lsp.servers.sumneko_lua")(on_attach),
		html = { init_options = { provideFormatter = false } },
		stylelint_lsp = {
			root_dir = lspconfig.util.root_pattern(".stylelintrc", "stylelint.config.js", "package.json"),
			filetypes = { "css" },
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
		},
	}

	local presentMasonLsp, masonLsp = pcall(require, "mason-lspconfig")
	if not presentMasonLsp then
		return
	end

	local default = { on_attach = on_attach, capabilities = capabilities }

	masonLsp.setup_handlers({
		function(server_name)
			local opts = configs[server_name] or {}
			opts = vim.tbl_deep_extend("force", default, opts)
			lspconfig[server_name].setup(opts)
		end,
	})
end

return M
