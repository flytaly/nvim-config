--- mfussenegger/nvim-dap
local present_dap, dap = pcall(require, "dap")

if not present_dap then
	return
end

require("config.debug.dap_config")
local h = require("config/debug/debug_helpers")

local sign = vim.fn.sign_define

-- catppuccin colors
sign("dapstopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

local set = vim.keymap.set

set("n", "<A-k>", function() dap.step_out() end, { desc = "dap: step out" })

set("n", "<A-l>", function() dap.step_into() end, { desc = "dap: step into" })

set("n", "<A-j>", function() dap.step_over() end, { desc = "dap: step over" })

set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "dap: toggle breakpoint" })

set(
	"n",
	"<leader>dB",
	function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
	{ desc = "dap: set breakpoint" }
)

set("n", "<leader>ds", function() dap.terminate() end, { desc = "dap: terminate" })

set("n", "<leader>dn", function() dap.continue() end, { desc = "dap: continue" })

set("n", "<leader>dk", function() dap.up() end, { desc = "dap: up" })

set("n", "<leader>dj", function() dap.down() end, { desc = "dap: down" })

set("n", "<leader>dr", function() dap.repl.open({}, "vsplit") end, { desc = "dap: open repl" })

set(
	"n",
	"<leader>de",
	function() dap.set_exception_breakpoints({ "all" }) end,
	{ desc = "dap: set exception breakpoints" }
)

set("n", "<leader>da", function() h.attach() end, { desc = "dap: attach" })

set("n", "<leader>dA", function() h.attach_remote() end, { desc = "dap: attach remote" })

set("n", "<leader>di", function() require("dap.ui.widgets").hover() end, { desc = "dap.ui.widgets: hover" })

set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "dap.ui.widgets: scopes" })

------------------------------------------------------
----- Dap Go

vim.api.nvim_create_autocmd("FileType", {
	desc = "Dap Go",
	pattern = "go",
	group = vim.api.nvim_create_augroup("go-test", {}),
	callback = function(opts)
		local present_dap_go, dap_go = pcall(require, "dap-go")
		if present_dap_go then
			vim.keymap.set("n", "<leader>dt", function() dap_go.debug_test() end, { desc = "Dap Go: debug test" })
			dap_go.setup({
				delve = {
					port = "38697",
				},
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
			})
		end
	end,
})

------------------------------------------------------
----- Dap UI
local present_dapui, dapui = pcall(require, "dapui")

if present_dapui then
	dapui.setup()
	set("n", "<leader>du", function() dapui.toggle() end, { desc = "Dap UI: Toggle" })
	set("v", "<A-e>", function() dapui.eval() end, { desc = "Dap UI: Eval" })

	dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
	dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
	dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
else
	print("Dap UI not found")
end

------------------------------------------------------
----- Dap telescope
local present_telescope, telescope = pcall(require, "telescope")

if present_telescope then
	telescope.load_extension("dap")
	set("n", "<leader>df", ":Telescope dap frames<CR>", { desc = "Telescope: dap frames" })
	set("n", "<leader>dc", ":Telescope dap commands<CR>", { desc = "Telescope: dap commands" })
	set("n", "<leader>dl", ":Telescope dap list_breakpoints<CR>", { desc = "Telescope: dap list_breakpoints" })
end
