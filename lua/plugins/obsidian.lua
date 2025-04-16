return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	keys = {
		{
			"<leader>mo",
			":ObsidianQuickSwitch<CR>",
			desc = "Obsidian: Quick switch to notes",
		},
		{
			"<leader>mp",
			function()
				local current_file = vim.fn.expand("%:p")
				local current_dir = vim.fn.fnamemodify(current_file, ":h")
				local img_name = vim.fn.input("Image name: ", string.format("%s-", os.time()))
				vim.cmd("ObsidianPasteImg " .. current_dir .. "/assets/" .. img_name)
			end,
			desc = "Obsidian: Paste Image",
		},
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/notes/my_notes/",
			},
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Enables completion using nvim_cmp
			nvim_cmp = false,
			-- Enables completion using blink.cmp
			blink = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
			name = "snacks.pick",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			note_mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
			tag_mappings = {
				-- Add tag(s) to current note.
				tag_note = "<C-x>",
				-- Insert a tag at the current location.
				insert_tag = "<C-l>",
			},
		},
		-- Specify how to handle attachments.
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "assets/imgs", -- This is the default

			-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
			---@return string
			img_name_func = function()
				-- Prefix image names with timestamp.
				return string.format("%s", os.time())
			end,

			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
			-- This is the default implementation.
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			-- img_text_func = function(client, path)
			-- 	path = client:vault_relative_path(path) or path
			-- 	return string.format("![%s](%s)", path.name, path)
			-- end,
		},
	},
}
