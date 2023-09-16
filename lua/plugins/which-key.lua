return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		wk.register({
			f = {
				name = "+Telescope",
				["<space>"] = "Telescope git_files",
				["/"] = "Telescope current_buffer_fuzzy_find",
				b = "Telescope list open buffers",
				f = "Telescope find files",
				g = "Telescope live grep",
				G = "Telescope grep string",
				o = "Telescope file browser",
				t = "Telescope builtins",
				l = {
					name = "+LSP",
					s = "Workspace Symbols",
				},
				n = {
					name = "+NPM",
					s = "Show package versions",
					c = "Hide package versions",
					u = "Update package on line",
					d = "Delete package on line",
					r = "Reinstall",
					p = "Install a different package version",
				},
			},
			g = {
				name = "+LSP",
			},
			x = {
				name = "Trouble",
			},
			d = {
				name = "debug",
				n = "dap: continue",
				b = "dap: toggle breakpoint",
				B = "dap: set conditional breakpoint",
				s = "dap: terminate",
				k = "dap: up",
				j = "dap: down",
				r = "dap: open REPL",
				e = "dap: set_exception_breakpoints",
				a = "dap: attach",
				A = "dap: attach to remote",
				i = "dap.ui.widgets: hover",
				d = "jester.debug",
				_ = "jester.debug_last",
				F = "jester.debug_file",
				t = "dap-go.debug_test",
				["?"] = "dap.ui.widgets: scopes",
				f = "Telescope: dap frames",
				c = "Telescope: dap commands",
				l = "Telescope: dap list_breakpoints",
			},
		}, {
			prefix = "<leader>",
		})

		wk.register({
			g = {
				name = "LSP and TS",
				a = "Code Action",
				d = "Symbol Definition",
				D = "Show Line Diagnostic",
				R = "Symbol References",
				r = "Rename Symbol",
				["]"] = "Next Diagnostic",
				["["] = "Prev Diagnostic",
				O = "TS: Organize Imports",
				FR = "TS: Rename File",
				I = "TS: Import all",
			},
		})

		wk.register({
			gc = "Comment",
			gcc = "Comment line",
			gb = "Comment blockwise",

			-- lsp code help
			K = "Hover",
			["<C-k>"] = "Signature help",

			-- vim-sandwich
			sa = "Add Surrounding Character",
			sd = "Remove Surrounding Character",
			sr = "Replace Surrounding Character",

			--
			["<A-k>"] = "dap.step_out()",
			["<A-l>"] = "dap.step_into()",
			["<A-j>"] = "dap.step_over()",
		})

		wk.setup({})
	end,
}
