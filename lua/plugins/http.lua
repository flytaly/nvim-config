return {
	"mistweaverco/kulala.nvim",
	opts = {},
	keys = {
		{
			"<leader>rr",
			function() require("kulala").run() end,
			desc = "Kulala: run - runs the current request",
		},
		{
			"<leader>rt",
			function() require("kulala").toggle_view() end,
			desc = "Kulala: toggletoggle_view - toggles between the body and headers view of the last run request",
		},
		{
			"<leader>rc",
			function() require("kulala").copy() end,
			desc = "Kulala: copy - copies the current request (as cURL command) to the clipboard.",
		},
		{
			"<leader>rq",
			function() require("kulala").close() end,
			desc = "Kulala: close",
		},
	},
}
