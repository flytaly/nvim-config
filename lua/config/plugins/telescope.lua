----- Telescope
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-a>"] = trouble.open_with_trouble },
			n = { ["<c-a>"] = trouble.open_with_trouble },
		},
	},
})

map("n", "<leader><space>", ":Telescope git_files<CR>")
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>fB", ":Telescope buffers<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fG", ":Telescope grep_string<CR>")
map("n", "<leader>fo", ":Telescope file_browser<CR>")
map("n", "<leader>ft", ":Telescope builtin<CR>")
