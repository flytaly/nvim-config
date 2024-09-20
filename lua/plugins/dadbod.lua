return {
	{ "tpope/vim-dadbod", event = "VeryLazy" },
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_execute_on_save = 0
			vim.g.db_ui_save_location = "~/Dropbox/db_ui_queries"
			vim.g.db_ui_tmp_query_location = "~/Dropbox/db_ui_queries/temp/"
		end,
	},
}
