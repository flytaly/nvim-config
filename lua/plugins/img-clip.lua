return {
	"HakonHarnes/img-clip.nvim",
	cmd = "PasteImage",
	opts = {
		dir_path = "assets", -- directory path to save images to, can be relative (cwd or current file) or absolute
		file_name = "%Y-%m-%d-%H-%M-%S", -- file name format (see lua.org/pil/22.1.html)
		url_encode_path = false, -- encode spaces and special characters in file path
		use_absolute_path = false, -- expands dir_path to an absolute path
		prompt_for_file_name = true, -- ask user for file name before saving, leave empty to use default
		show_dir_path_in_prompt = false, -- show dir_path in prompt when prompting for file name
		use_cursor_in_template = true, -- jump to cursor position in template after pasting
		insert_mode_after_paste = true, -- enter insert mode after pasting the markup code
		relative_to_current_file = true, -- make dir_path relative to current file rather than the cwd

		template = "$FILE_PATH", -- default template
	},
	keys = {
		{ "<leader>mp", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
	},
}
