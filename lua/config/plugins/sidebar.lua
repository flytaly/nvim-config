require("sidebar-nvim").setup({
	sections = { "git", "diagnostics", "symbols", "todos" },
})

vim.keymap.set("n", "<leader>xs", ":SidebarNvimToggle<CR>")
