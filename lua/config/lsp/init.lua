local present, nvim_lsp = pcall(require, "lspconfig")
if not present then
	return
end

local present_lsp_installer, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not present_lsp_installer then
	return
end

local remaps = require("config.lsp.remaps")
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
local presentLspStatus, lspStatus = pcall(require, "lsp-status")
local presentAerial, aerial = pcall(require, "aerial")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	remaps.set_default_keymaps(client, bufnr)

	if presentLspStatus then
		lspStatus.on_attach(client, bufnr)
	end

	if presentAerial then
		aerial.on_attach(client, bufnr)
		-- nvim_lsp.vimls.setup({
		-- 	on_attach = aerial.on_attach,
		-- })
	end

	-- if client.resolved_capabilities.document_formatting then
	-- 	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	-- end
end

local capabilities = {}

if presentCmpNvimLsp then
	capabilities = vim.tbl_deep_extend(
		"keep",
		capabilities,
		cmpNvimLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	)

	capabilities.textDocument.completion.completionItem.snippetSupport = true
end

local default_lsp_config = {
	capabilities = capabilities,
	on_attach = on_attach,
}

local servers = {
	cssls = require("config.lsp.servers.cssls")(),
	dockerls = {},
	graphql = {},
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
			on_attach = on_attach(client, bufnr)
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

for serverName, config in pairs(servers) do
	local ok, server = lsp_installer_servers.get_server(serverName)
	if ok then
		if not server:is_installed() then
			print("installing " .. serverName)
			server:install()
		end
	end
	server:setup(vim.tbl_deep_extend("force", default_lsp_config, config))
	vim.cmd([[ do User LspAttachBuffers ]])
end

require("config.lsp.servers.null_ls").setup(on_attach)
require("config.lsp.servers.ls_emmet").setup(capabilities)
