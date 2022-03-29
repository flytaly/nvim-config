local lsp_keymaps = require("config.lsp.lsp-keymaps")
local present_aerial, aerial = pcall(require, "aerial")

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

local present_lsp_status, lsp_status = pcall(require, "lsp-status")

if present_lsp_status then
	lsp_status.register_progress()
	lsp_status.config({
		diagnostics = false,
	})
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	if present_lsp_status then
		lsp_status.on_attach(client, bufnr)
	end

	if present_aerial then
		aerial.on_attach(client, bufnr)
	end

	lsp_keymaps.set_default_keymaps(client, bufnr)

	-- if client.resolved_capabilities.document_formatting then
	-- 	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	-- end
end

local present_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()

if present_cmp_nvim_lsp then
	capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
	capabilities.textDocument.completion.completionItem.snippetSupport = true
end

if present_lsp_status then
	capabilities = vim.tbl_deep_extend("keep", capabilities, lsp_status.capabilities)
end

M.capabilities = capabilities

return M
