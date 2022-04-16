----- Telescope
local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

local trouble_present, trouble = pcall(require, "trouble.providers.telescope")
if not trouble_present then
	return
end

local telescope_actions = require("telescope.actions.set")

-- https://www.reddit.com/r/neovim/comments/t5qizd/awesome_telescope_nvimtree_mapping/
local open_in_nvim_tree = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local Path = require("plenary.path")
	local actions = require("telescope.actions")

	local entry = action_state.get_selected_entry()[1]
	local entry_path = Path:new(entry):parent():absolute()
	actions._close(prompt_bufnr, true)
	entry_path = Path:new(entry):parent():absolute()
	entry_path = entry_path:gsub("\\", "\\\\")

	vim.cmd("NvimTreeClose")
	vim.cmd("NvimTreeOpen " .. entry_path)

	file_name = nil
	for s in string.gmatch(entry, "[^/]+") do
		file_name = s
	end

	vim.cmd("/" .. file_name)
end

-- https://github.com/nvim-telescope/telescope.nvim/issues/559
local fixfolds = {
	hidden = true,
	attach_mappings = function(_)
		telescope_actions.select:enhance({
			post = function()
				vim.cmd(":normal! zx")
			end,
		})
		return true
	end,
}

telescope.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
	defaults = {
		mappings = {
			i = {
				["<c-a>"] = trouble.open_with_trouble,
				["<c-s>"] = open_in_nvim_tree,
			},
			n = {
				["<c-a>"] = trouble.open_with_trouble,
				["<c-s>"] = open_in_nvim_tree,
			},
		},
	},
	pickers = {
		buffers = fixfolds,
		file_browser = fixfolds,
		find_files = fixfolds,
		git_files = fixfolds,
		grep_string = fixfolds,
		live_grep = fixfolds,
		oldfiles = fixfolds,
	},
})

telescope.load_extension("aerial")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

vim.keymap.set("n", "<leader><space>", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fG", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>fo", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope builtin<CR>")
vim.keymap.set("n", "<leader>fa", ":Telescope aerial<CR>")
