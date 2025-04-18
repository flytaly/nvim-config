local ftMap = {
	python = { "indent" },
}

return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		require("ufo").setup({
			open_fold_hl_timeout = 150,
			provider_selector = function(bufnr, filetype, buftype) return ftMap[filetype] or { "treesitter", "indent" } end,
		})

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	end,
}
