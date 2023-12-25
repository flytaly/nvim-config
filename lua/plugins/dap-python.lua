return {
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
}
