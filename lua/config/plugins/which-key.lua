local wk = require("which-key")

wk.register({
	f = {
		name = "+Telescope",
		["<space>"] = "Telescope git_files",
		b = "Telescope current_buffer_fuzzy_find",
		B = "Telescope list open buffers",
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
			p = "Install a different package version"
		},
	},
	g = {
		name = "+LSP",
		f = "Format Document",
	},
}, {
	prefix = "<leader>",
})

wk.register({
	g = {
		name = "LSP and TS",
		a = "Code Action",
		d = "Symbol Definition",
		D = "Show Line Diagostic",
		r = "Symbol References",
		R = "Rename Symbol",
		["]"] = "Next Diagnostic",
		["["] = "Prev Diagnostic",
		O = "TS: Organize Imports",
		FR = "TS: Rename File",
		I = "TS: Import all",
	},
})

wk.register({
	gc = "Comment linewise",
	gcc = "Comment line",
	gb = "Comment blockwise",

	-- lsp code help
	K = "Hover",
	["<C-k>"] = "Signature help",

	-- vim-sandwich
	sa = "Add Surrounding Character",
	sd = "Remove Surrounding Character",
	sr = "Replace Surrounding Character",
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
		margin = { 0, 0, 0, 0 }, -- TRBL
		padding = { 4, 2, 4, 2 }, -- TRBL
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
