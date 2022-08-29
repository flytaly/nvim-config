local ok, ws = pcall(require, "workspaces")

if not ok then
	return
end

ws.setup({
	hooks = {
		open = { "NvimTreeOpen", "Telescope find_files" },
	},
})
