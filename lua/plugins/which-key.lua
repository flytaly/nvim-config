local ok, wk = pcall(require, "which-key")

if not ok then
	return
end

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
	c = {
		a = "Code Actions",
	},
	g = {
		name = "+LSP",
		f = "Format Document",
		s = "Toggle format on save",
	},
	x = {
		name = "bars",
		a = "Aerial toggle",
		s = "Sidebar toggle",
		x = "Trouble toggle",
		w = "Trouble: workspace diagnostics",
		d = "Trouble: document diagnostics",
		q = "Trouble: quickfix",
		l = "Trouble: loclist",
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

wk.setup({
	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false },
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = true,
			z = true,
			g = true,
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	icons = {
		breadcrumb = "»",
		separator = "➜ ",
		group = "+",
	},
	window = {
		border = "none",
		position = "bottom",
		margin = { 0, 0, 0, 0 },
		padding = { 4, 2, 4, 2 },
	},
	layout = {
		height = {
			min = 4,
			max = 25,
		},
		width = {
			min = 20,
			max = 50,
		},
		spacing = 8,
	},
	ignore_missing = false,
	hidden = {
		"<silent>",
		"<cmd>",
		"<Cmd>",
		"<CR>",
		"call",
		"lua",
		"^:",
		"^ ",
	},
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "," },
		n = { "'" },
	},
})
