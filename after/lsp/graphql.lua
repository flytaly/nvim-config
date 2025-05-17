return {
	on_attach = function(client) client.server_capabilities.workspaceSymbolProvider = false end,
}
