return {
	"otavioschwanck/arrow.nvim",
	opts = {
		show_icons = true,
		leader_key = "'", -- Recommended to be a single key
		buffer_leader_key = "m", -- Per Buffer Mappings
		mappings = {
			edit = "e",
			delete_mode = "d",
			clear_all_items = "C",
			toggle = "s", -- used as save if separate_save_and_remove is true
			open_vertical = "v",
			open_horizontal = "-",
			quit = "Q",
			remove = "x", -- only used if separate_save_and_remove is true
			next_item = "w",
			prev_item = "q",
		},
	},
}
