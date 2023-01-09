return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	ft = "markdown",
	init = function()
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_browser = "firefox"

		vim.keymap.set("n", "<leader>zp", ":MarkdownPreviewToggle<CR>")
	end,
}
