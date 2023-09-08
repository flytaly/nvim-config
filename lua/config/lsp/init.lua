local present, _ = pcall(require, "lspconfig")
if not present then
	return
end

local presentMason, mason = pcall(require, "mason")
if not presentMason then
	return
end

mason.setup()

local servers = {
	-- LSP servers
	"bash-language-server",
	"css-lsp",
	"diagnostic-languageserver",
	"dockerfile-language-server",
	"eslint-lsp",
	"golangci-lint-langserver",
	"gopls",
	"graphql-language-service-cli",
	"html-lsp",
	"json-lsp",
	"lua-language-server",
	"prisma-language-server",
	"rust-analyzer",
	"sqlls",
	"stylelint-lsp",
	"svelte-language-server",
	"tailwindcss-language-server",
	--[[ "typescript-language-server", ]]
	"yaml-language-server",
	"marksman",
	"texlab",
	"phpactor",
	--[[ "ltex-ls", ]]

	-- DAP
	"delve",
	"node-debug2-adapter",
	"firefox-debug-adapter",
	"chrome-debug-adapter",

	-- linters
	"eslint_d",
	"shellcheck",
	"cspell",

	-- formatters
	"prettierd",
	"shfmt",
}

for _, server_name in pairs(servers) do
	if not require("mason-registry").is_installed(server_name) then
		vim.cmd("MasonInstall " .. server_name)
	end
end

local handlers = require("config.lsp.handlers")
handlers.setup()

local on_attach = handlers.on_attach
local capabilities = handlers.capabilities

require("config.lsp.servers").setup(on_attach, capabilities)
--[[ require("config.lsp.servers.null_ls").setup(on_attach) ]]
require("config.lsp.servers.ls_emmet").setup(capabilities)
