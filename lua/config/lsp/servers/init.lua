local lspconfig = require("lspconfig")
local M = {}
M.get_configs = function()
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
			end,
		},
		tsserver = {
			init_options = {
				hostInfo = "neovim",
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = (function()
							if os.getenv("PNPM_HOME") then
								return os.getenv("PNPM_HOME") .. "/global/5/node_modules/@vue/typescript-plugin"
							end
							return ""
						end)(),
						languages = { "typescript", "vue", "javascript" },
					},
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json", "jsonc" },
		},
		lua_ls = {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						-- Tells lua_ls where to find all the Lua files that you have loaded
						-- for your neovim configuration.
						-- library = {
						-- 	"${3rd}/luv/library",
						-- 	unpack(vim.api.nvim_get_runtime_file("", true)),
						-- },
						-- If lua_ls is really slow on your computer, you can try this instead:
						library = { vim.env.VIMRUNTIME },
					},
					completion = {
						callSnippet = "Replace",
					},
					-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
					diagnostics = { disable = { "missing-fields" } },
				},
			},
		},
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
