return {
	"sidebar-nvim/sidebar.nvim",
	init = function()
		vim.keymap.set("n", "<leader>xs", ":SidebarNvimToggle<CR>")
	end,
	config = function()
		require("sidebar-nvim").setup({
			sections = { "diagnostics", "symbols", "todos" },
		})
	end,
}
