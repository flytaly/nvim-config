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
		vim.keymap.set(
			"n",
			"<leader>f/",
			":Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "Telescope: current_buffer_fuzzy_find" }
		)
		vim.keymap.set(
			"n",
			"<leader>/",
			":Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "Telescope: current_buffer_fuzzy_find" }
		)
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Telescope: buffers" })
		vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Telescope: buffers" })
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope: find_files" })
		--[[ vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") ]]
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep_args<CR>", { desc = "Telescope: live grep args" })
		vim.keymap.set(
			"n",
			"<leader>fG",
			":Telescope grep_string<CR>",
			{ desc = "Telescope: grep a word under cursor" }
		)
		vim.keymap.set(
			"n",
			"<leader>fo",
			"<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
			{ desc = "Telescope: file browser" }
		)
		vim.keymap.set("n", "<leader>ft", ":Telescope builtin<CR>", { desc = "Telescope: builtin" })
		vim.keymap.set(
			"n",
			"<leader>fs",
			":Telescope lsp_document_symbols<CR>",
			{ desc = "Telescope: lsp document symbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>fS",
			":Telescope lsp_dynamic_workspace_symbols<CR>",
			{ desc = "Telescope: lsp dynamic workspace symbols" }
		)
		vim.keymap.set("n", "<leader>fc", ":Telescope git_bcommits<CR>", { desc = "Telescope: git buffer commits" })
		vim.keymap.set("n", "<leader>fC", ":Telescope git_commits<CR>", { desc = "Telescope: git commits" })
		vim.keymap.set("n", "<leader>fw", ":Telescope workspaces<CR>", { desc = "Telescope: workspaces" })
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
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			defaults = {
				file_ignore_patterns = { "node_modules/*", "^/usr/*" },
				mappings = {
					i = {
						["<c-a>"] = trouble.open_with_trouble,
						["<c-s>"] = open_in_nvim_tree,
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
					n = {
						["<c-a>"] = trouble.open_with_trouble,
						["<c-s>"] = open_in_nvim_tree,
						["<c-d>"] = require("telescope.actions").delete_buffer,
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
