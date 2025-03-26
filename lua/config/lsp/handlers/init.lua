local lspconfig = require("lspconfig")
local M = {}
M.get_configs = function()
	return {
		cssls = {
			-- https://github.com/tailwindlabs/tailwindcss/discussions/5258
			-- disable tailwindcss @apply warning
			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		},
		jsonls = require("config.lsp.handlers.jsonls"),
		gopls = {
			settings = { gopls = { env = { GOFLAGS = "-tags=windows,linux,unittest" } } },
		},
		eslint = {
			root_dir = lspconfig.util.root_pattern(
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
				"eslint.config.js",
				"eslint.config.mjs",
				"eslint.config.cjs",
				"eslint.config.ts",
				"eslint.config.mts",
				"eslint.config.cts"
			),
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
			},
			settings = {
				format = { enable = true },
			},
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

		vtsls = {
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			settings = {
				vtsls = {
					tsserver = {
						-- works in vtsls@0.2.2-alpha.1
						-- https://github.com/yioneko/vtsls/issues/148 and
						-- https://github.com/mason-org/mason-registry/issues/5064#issuecomment-2016431978
						globalPlugins = {
							{
								name = "@vue/typescript-plugin",
								location = require("mason-registry")
									.get_package("vue-language-server")
									:get_install_path() .. "/node_modules/@vue/language-server",
								languages = { "vue" },
								configNamespace = "typescript",
								enableForWorkspaceTypeScriptVersions = true,
							},
						},
					},
				},
			},
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
