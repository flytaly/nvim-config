----- Telescope
local telescope_actions = require("telescope.actions.set")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

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
	},
	defaults = {
		mappings = {
			i = { ["<c-a>"] = trouble.open_with_trouble },
			n = { ["<c-a>"] = trouble.open_with_trouble },
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

map("n", "<leader><space>", ":Telescope git_files<CR>")
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>fB", ":Telescope buffers<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fG", ":Telescope grep_string<CR>")
map("n", "<leader>fo", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>")
map("n", "<leader>ft", ":Telescope builtin<CR>")
map("n", "<leader>fa", ":Telescope aerial<CR>")
