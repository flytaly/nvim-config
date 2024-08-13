return {
	"mbbill/undotree",
	event = "VeryLazy",
	-- keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree: toggle" } },
	keys = {
		{
			"<leader>u",
			function()
				local ok, NeoTree = pcall(require, "neo-tree.command")
				if ok then
					NeoTree.execute({ action = "close" })
				end
				vim.cmd.UndotreeToggle()
			end,
			desc = "Undotree: toggle",
		},
	},
}
