local nvim_lsp = require("lspconfig")

local get_servers = function(on_attach)
	return {
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
					client.resolved_capabilities.execute_command = true
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
		html = {},
		tailwindcss = {},
		prismals = {},
		yamlls = {},
		-- emmet_ls = {}, -- doesn't work in JSX so use fork instead
		stylelint_lsp = {
			root_dir = nvim_lsp.util.root_pattern(".stylelintrc", "stylelint.config.js", "package.json"),
			filetypes = { "css" },
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
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
end

return { get_servers = get_servers }
