return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "go", "gomod" },
	event = { "CmdlineEnter" },
	init = function()
		local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimport()
			end,
			group = format_sync_grp,
		})

		local present, lspconfig = pcall(require, "lspconfig")
		if present then
			lspconfig.gopls.setup({
				gopls_cmd = { "gopls" },
				fillstruct = "gopls",
				dap_debug = true,
				dap_debug_gui = true,
			})
		end
	end,
	config = function()
		require("go").setup()
	end,
}
