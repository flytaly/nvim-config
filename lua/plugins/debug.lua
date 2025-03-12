return {
	{ "mfussenegger/nvim-dap", event = "VeryLazy" },
	{ "rcarriga/nvim-dap-ui", event = "VeryLazy", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "theHamsta/nvim-dap-virtual-text", event = "VeryLazy", config = true },
	{ "leoluz/nvim-dap-go", event = "VeryLazy" },
	{ "mxsdev/nvim-dap-vscode-js", event = "VeryLazy", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		opt = true,
		build = "npm install --legacy-peer-deps && npm run compile",
		event = "VeryLazy",
	},
	{
		"https://github.com/mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		ft = "python",
		init = function()
			local debugpy = "~/.virtualenvs/debugpy/bin/python"

			require("dap-python").setup(debugpy)

			table.insert(require("dap").configurations.python, {
				type = "python",
				request = "launch",
				name = "Launch with justMyCode=false",
				justMyCode = false,
				program = "${file}",
			})
		end,
	},
}
