local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local handlers = require("config.lsp.handlers")
handlers.setup()

local presentMasonLsp, masonLsp = pcall(require, "mason-lspconfig")
if not presentMasonLsp then
	return
end

local configs = require("config.lsp.servers").get_configs()

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

masonLsp.setup_handlers({
	function(server_name)
		local opts = configs[server_name] or {}
		opts = vim.tbl_deep_extend("force", { capabilities = capabilities }, opts)
		lspconfig[server_name].setup(opts)
	end,
})
