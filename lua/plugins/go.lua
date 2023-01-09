return {
	"ray-x/go.nvim",
	dependencies = "ray-x/guihua.lua",
	ft = "go",
	init = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.go" },
			group = vim.api.nvim_create_augroup("OrganizeImports", {}),
			callback = function()
				vim.cmd("GoImport")
			end,
		})
	end,
	config = function()
		require("go").setup()
	end,
}
