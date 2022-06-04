require("sidebar-nvim").setup({
	sections = { "diagnostics", "symbols", "todos" },
})

vim.keymap.set("n", "<leader>xs", ":SidebarNvimToggle<CR>")
