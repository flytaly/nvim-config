--- mfussenegger/nvim-dap
local present_dap, dap = pcall(require, "dap")

if not present_dap then
  return
end

local set = vim.keymap.set


dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/Apps/vscode-node-debug2/out/src/nodeDebug.js" },
}

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })


set("n", "<A-k>", function() dap.step_out() end)
set("n", "<A-l>", function() dap.step_into() end)
set("n", "<A-j>", function() dap.step_over() end)

set("n", "<leader>dh", function() dap.toggle_breakpoint() end)
set("n", "<leader>ds", function() dap.terminate() end)
set("n", "<leader>dn", function() dap.continue() end)
set("n", "<leader>dk", function() dap.up() end)
set("n", "<leader>dj", function() dap.down() end)

set("n", "<leader>dr", function() dap.repl.open({}, 'vsplit') end)
set("n", "<leader>de", function() dap.set_exception_breakpoints({ "all" }) end)
set("n", "<leader>da", function() require('config/debug/debugHelper').attach() end)
set("n", "<leader>dA", function() require('config/debug/debugHelper').attachToRemote() end)
set("n", "<leader>di", function() require('dap.ui.widgets').hover() end)
set("n", "<leader>d?", function()
  local widgets = require 'dap.ui.widgets';
  widgets.centered_float(widgets.scopes)
end)


------------------------------------------------------
----- Dap Go

local present_dap_go, dap_go = pcall(require, "dap-go")

if present_dap_go then
  dap_go.setup()
  set("n", "<leader>dt", function() dap_go.debug_test() end)
end

------------------------------------------------------
----- Dap UI
local present_dapui, dapui = pcall(require, "dapui")

if present_dapui then
  dapui.setup()
  set("n", "<leader>du", function() dapui.toggle() end)
  set("v", "<A-e>", function() dapui.eval() end)

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

end

------------------------------------------------------
----- Dap telescope
local present_telescope, telescope = pcall(require, "telescope")

if present_telescope then
  telescope.load_extension("dap")
  set("n", "<leader>df", ":Telescope dap frames<CR>")
  set("n", "<leader>dc", ":Telescope dap commands<CR>")
  set("n", "<leader>db", ":Telescope dap list_breakpoints<CR>")
end
