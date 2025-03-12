local build = "make BUILD_FROM_SOURCE=true"

-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
build = "make BUILD_FROM_SOURCE=true"

if vim.loop.os_uname().sysname == "Windows_NT" then
	build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
end

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	opts = {
		-- add any opts here
		-- for example
		provider = "copilot",
		-- file_selector = { provider = "snacks" },
	},
	build = build,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
