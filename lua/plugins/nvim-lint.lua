return {
	"https://github.com/mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "cspell" },
			-- javascript = { "eslint" },
			sh = { "shellcheck" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
