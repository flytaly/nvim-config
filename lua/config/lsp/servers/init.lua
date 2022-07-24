local lspconfig = require("lspconfig")

local setup = function(on_attach, default_lsp_config)
	local configs = {
		cssls = require("config.lsp.servers.cssls")(),
		dockerls = {},
		graphql = {},
		gopls = {},
		golangci_lint_ls = {},
		jsonls = require("config.lsp.servers.jsonls")(),
		bashls = {},
		diagnosticls = {},
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
		-- sqlls = {},
		rust_analyzer = {},
		sumneko_lua = require("config.lsp.servers.sumneko_lua")(),
		tsserver = require("config.lsp.servers.tsserver")(on_attach),
		svelte = {},
		html = {
			init_options = {
				provideFormatter = false,
			},
		},
		tailwindcss = {},
		prismals = {},
		yamlls = {},
		-- emmet_ls = {}, -- doesn't work in JSX so use fork instead
		stylelint_lsp = {
			root_dir = lspconfig.util.root_pattern(".stylelintrc", "stylelint.config.js", "package.json"),
			filetypes = { "css" },
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
		},
		eslint = {
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue",
				"svelte",
			},
		},
	}

	for serverName, config in pairs(configs) do
		local opts = vim.tbl_deep_extend("force", default_lsp_config, config)
		lspconfig[serverName].setup(opts)
	end
end

return { setup = setup }
