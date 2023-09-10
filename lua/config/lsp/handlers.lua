local present_aerial, aerial = pcall(require, "aerial")
local format = require("config.format")
local lsp_mapping = require("config.mapping.lsp-keymaps")

local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- virtual_text = false,
		virtual_text = { severity = 1 },
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	if present_aerial then
		aerial.on_attach(client, bufnr)
	end

	format.isEnabled = true
	format.createAutocmd(client, bufnr)

	lsp_mapping.set_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local present_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if present_cmp_nvim_lsp then
	capabilities = cmp_nvim_lsp.default_capabilities()
	--Enable (broadcasting) snippet capability for completion
	capabilities.textDocument.completion.completionItem.snippetSupport = true
end

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

M.capabilities = capabilities

return M
