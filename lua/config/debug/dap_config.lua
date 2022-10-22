local dap = require("dap")

local M = {}

dap.set_log_level("TRACE")

dap.adapters.node2 = function(cb)
	cb({ type = "executable", command = "node-debug2-adapter" })
end

dap.adapters.firefox = function(cb)
	cb({ type = "executable", command = "firefox-debug-adapter" })
end

dap.adapters.chrome = function(cb)
	cb({ type = "executable", command = "chrome-debug-adapter" })
end

local pick_node_attach = {
	-- For this to work you need to make sure the node process is started with the `--inspect` flag.
	name = "Attach to node process",
	type = "node2",
	request = "attach",
	processId = require("dap.utils").pick_process,
}

local attach_firefox = {
	name = "Attach to Firefox",
	type = "firefox",
	request = "attach",
}

local attach_chrome = {
	name = "Attach to Chrome",
	type = "chrome",
	request = "attach",
	port = 9222,
}

local launch_firefox = {
	name = "Launch Firefox",
	type = "firefox",
	request = "launch",
	reAttach = true,
	sourceMaps = true,
	protocol = "inspector",
	url = "http://localhost:5173",
	webRoot = "${workspaceFolder}",
	firefoxExecutable = "/usr/bin/firefox",
}

local launch_chrome = {
	name = "Launch Chrome",
	type = "chrome",
	request = "launch",
	reAttach = true,
	sourceMaps = true,
	protocol = "inspector",
	url = "http://localhost:5173",
	webRoot = "${workspaceFolder}",
	runtimeExecutable = "/usr/bin/google-chrome-stable",
}

local launch_node = {
	name = "Launch Node",
	type = "node2",
	request = "launch",
	program = "${file}",
	cwd = vim.fn.getcwd(),
	outFiles = { vim.fn.getcwd() .. "/dist/*.js" },
	sourceMaps = true,
	protocol = "inspector",
	console = "integratedTerminal",
}

require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

local vscode_launch = {
	type = "pwa-node",
	request = "launch",
	name = "[dap-vscode] Launch file",
	program = "${file}",
	cwd = "${workspaceFolder}",
}

local vscode_attach = {
	type = "pwa-node",
	request = "attach",
	name = "[dap-vscode] Attach",
	processId = require("dap.utils").pick_process,
	cwd = "${workspaceFolder}",
}

local vscode_jest = {
	type = "pwa-node",
	request = "launch",
	name = "[dap-vscode] Debug Jest Tests",
	-- trace = true, -- include debugger info
	runtimeExecutable = "node",
	runtimeArgs = {
		"./node_modules/jest/bin/jest.js",
		"--runInBand",
	},
	rootPath = "${workspaceFolder}",
	cwd = "${workspaceFolder}",
	console = "integratedTerminal",
	internalConsoleOptions = "neverOpen",
}

local js = {
	launch_node,
	launch_firefox,
	launch_chrome,
	pick_node_attach,
	attach_firefox,
	attach_chrome,
	vscode_launch,
	vscode_attach,
	vscode_jest,
}

dap.configurations.javascript = js
dap.configurations.typescript = js
