return {
	"aznhe21/actions-preview.nvim",
	keys = {
		{
			"ga",
			function()
				require("actions-preview").code_actions({
					context = { only = { "source", "refactor", "quickfix" } },
				})
			end,
			mode = { "n", "v" },
			desc = "actions-preview: code actions",
		},
	},
}
