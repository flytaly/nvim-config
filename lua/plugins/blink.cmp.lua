local function has_words_before()
	local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	"Saghen/blink.cmp",
	opts_extend = { "sources.default", "cmdline.sources", "term.sources" },
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"kristijanhusak/vim-dadbod-completion",
	},
	opts = {
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				markdown = { "snippets" },
				sql = { "snippets", "dadbod", "buffer" },
			},
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},
		snippets = { preset = "luasnip" },
		keymap = {
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-N>"] = { "select_next", "show" },
			["<C-P>"] = { "select_prev", "show" },
			["<C-U>"] = { "scroll_documentation_up", "fallback" },
			["<C-D>"] = { "scroll_documentation_down", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-j>"] = {
				"snippet_forward",
				function(cmp)
					-- https://github.com/L3MON4D3/LuaSnip/issues/1297#issuecomment-2676137384
					local ls = require("luasnip")
					if ls.expandable() then
						cmp.cancel() -- or cmp.hide()
						vim.schedule(function() ls.expand() end) -- wait for blink to close
						return true -- don't execute next command
					end
				end,
			},
			["<C-k>"] = {
				"snippet_backward",
				function(cmp)
					local ls = require("luasnip")
					if ls.jumpable(-1) then
						ls.jump(-1)
					end
				end,
			},
		},
		completion = {
			list = { selection = { preselect = true, auto_insert = true } },
			menu = {
				auto_show = function() return not vim.tbl_contains({ "text" }, vim.bo.filetype) end,
				border = "rounded",
				draw = {
					align_to = "label", -- or 'none' to disable, or 'cursor' to align to the cursor
					-- Left and right padding, optionally { left, right } for different padding on each side
					padding = 6,
					-- Gap between columns
					gap = 3,
					-- Components to render, grouped by column
					columns = {
						{ "kind_icon", "source_id", gap = 1 },
						{ "label", "label_description", gap = 1 },
					},
					-- Definitions for possible components to render. Each defines:
					--   ellipsis: whether to add an ellipsis when truncating the text
					--   width: control the min, max and fill behavior of the component
					--   text function: will be called for each item
					--   highlight function: will be called only when the line appears on screen
					components = {
						source_id = {
							text = function(ctx)
								local id = ({
									lsp = "[lsp]",
									snippets = "[snp]",
									path = "[path]",
									buffer = "[buf]",
									cmdline = "",
								})[ctx.source_id]
								return id or ctx.source_id
							end,
						},
					},
				},
			},
			accept = { auto_brackets = { enabled = true } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
		},
		cmdline = {
			keymap = {
				["<Tab>"] = { "show", "accept" },
			},
			completion = { menu = { auto_show = true } },
		},
		signature = { enabled = true },
	},
}
