local dap = require("dap")

local M = {}

M.pick_node_attach = {
	-- For this to work you need to make sure the node process is started with the `--inspect` flag.
	name = "Attach to node process",
	type = "node2",
	request = "attach",
	processId = require("dap.utils").pick_process,
}


M.launch_node = {
	name = "Launch node",
	type = "node2",
	request = "launch",
	program = "${file}",
	cwd = vim.fn.getcwd(),
	outFiles = { vim.fn.getcwd() .. "/dist/*.js" },
	sourceMaps = true,
	protocol = "inspector",
	console = "integratedTerminal",
}

M.debug_jest = function(testName, filename)
	print("starting " .. testName .. " in " .. filename)
	dap.run({
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "--inspect-brk", "/usr/local/bin/jest", "--no-coverage", "-t", testName, "--", filename },
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
		console = "integratedTerminal",
		port = 9229,
	})
end

M.attach = function()
	print("attaching")
	dap.run({
		type = "node2",
		request = "attach",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	})
end

M.attach_remote = function()
	print("attaching")
	dap.run({
		type = "node2",
		request = "attach",
		address = "127.0.0.1",
		port = 9229,
		localRoot = vim.fn.getcwd(),
		remoteRoot = "/home/vcap/app",
		sourceMaps = true,
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
	})
end

return M
