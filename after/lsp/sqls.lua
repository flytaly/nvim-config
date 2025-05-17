return {
	on_attach = function(client, bufnr)
		local ok, sqls = pcall(require, "sqls")
		if ok then
			-- client.resolved_capabilities.execute_command = true
			client.commands = sqls.commands
			sqls.setup({ picker = "telescope" })
		end
	end,
}
