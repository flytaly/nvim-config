return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("catppuccin").setup({
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			transparent_background = false,
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				coc_nvim = false,
				lsp_trouble = false,
				cmp = true,
				lsp_saga = false,
				gitgutter = false,
				gitsigns = true,
				telescope = true,
				nvimtree = {
					enabled = true,
					show_root = true,
					transparent_panel = true,
				},
				neotree = {
					enabled = false,
					show_root = true,
					transparent_panel = false,
				},
				dap = {
					enabled = true,
					enable_ui = true,
				},
				which_key = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				dashboard = true,
				neogit = false,
				vim_sneak = false,
				fern = false,
				barbar = false,
				bufferline = true,
				markdown = true,
				lightspeed = false,
				ts_rainbow = false,
				hop = true,
				notify = true,
				telekasten = true,
				symbols_outline = true,
				mini = false,
			},
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme catppuccin-frappe]])
	end,
}
