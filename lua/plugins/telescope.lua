return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"folke/trouble.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"natecraddock/workspaces.nvim",
	},
	init = function()
		vim.keymap.set("n", "<leader><space>", function()
			local ok = pcall(vim.cmd, [[:Telescope git_files]])
			if not ok then
				vim.cmd([[:Telescope find_files]])
			end
		end)
		--[[ vim.keymap.set("n", "<leader><space>", ":Telescope git_files<CR>") ]]
		vim.keymap.set("n", "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>")
		vim.keymap.set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>")
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
		vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
		--[[ vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") ]]
		vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		vim.keymap.set("n", "<leader>fG", ":Telescope grep_string<CR>")
		vim.keymap.set("n", "<leader>fo", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>")
		vim.keymap.set("n", "<leader>ft", ":Telescope builtin<CR>")
		vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>")
		vim.keymap.set("n", "<leader>fc", ":Telescope git_bcommits<CR>")
		vim.keymap.set("n", "<leader>fC", ":Telescope git_commits<CR>")
		vim.keymap.set("n", "<leader>fw", ":Telescope workspaces<CR>")
	end,

	config = function()
		local telescope = require("telescope")

		local trouble_present, trouble = pcall(require, "trouble.providers.telescope")
		if not trouble_present then
			print("trouble is not installed")
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
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("ui-select")
		telescope.load_extension("workspaces")
		telescope.load_extension("live_grep_args")
	end,
}
