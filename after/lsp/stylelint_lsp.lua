return {
	root_dir = require("lspconfig").util.root_pattern(".stylelintrc", "stylelint.config.js", "package.json"),
	filetypes = { "css" },
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
