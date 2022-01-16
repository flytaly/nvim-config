require("sidebar-nvim").setup({
	sections = { "git", "diagnostics", "symbols", "todos" },
})

map("n", "<leader>xs", ":SidebarNvimToggle<CR>")
