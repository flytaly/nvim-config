--- nnn
local builtin = require("nnn").builtin
local mappings = {
	{ "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
	{ "<C-s>", builtin.open_in_split }, -- open file(s) in split
	{ "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
	{ "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
	{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
	{ "<C-w>", builtin.cd_to_path }, -- cd to file directory
	{ "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
}
require("nnn").setup({
	-- auto_open = { tabpage = "picker" },
	mappings = mappings,
})

-- " Set custom mappings
-- " nnoremap <silent> <leader>nn :NnnPicker<CR>
map("n", "<leader>ne", ":NnnExplorer %:p:h<CR>", { silent = true })
-- -- " Start n³ in the current file's directory
map("n", "<leader>nn", ":NnnPicker %:p:h<CR>")
