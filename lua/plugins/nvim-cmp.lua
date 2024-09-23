return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"kristijanhusak/vim-dadbod-completion",
		"David-Kunz/cmp-npm",
		{ "tzachar/cmp-tabnine", build = "./install.sh" },
	},

	config = function()
		local presentCmp, cmp = pcall(require, "cmp")
		local present_lua_snip, ls = pcall(require, "luasnip")
		local present_cmp_npm, npm = pcall(require, "cmp-npm")

		local icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}

		if not presentCmp or not present_lua_snip then
			return
		end

		if present_cmp_npm then
			npm.setup({})
		end

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local function select_next()
			return function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif ls.expand_or_locally_jumpable() then
					ls.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end

		local function select_prev()
			return function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif ls.jumpable(-1) then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				else
					fallback()
				end
			end
		end

		local function toggle_popup()
			if cmp.visible() then
				cmp.abort()
			else
				cmp.complete()
			end
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					ls.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping({ i = toggle_popup, c = toggle_popup }),
				["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-n>"] = cmp.mapping(select_next()),
				["<Down>"] = cmp.mapping(select_next()),
				["<C-p>"] = cmp.mapping(select_prev()),
				["<Up>"] = cmp.mapping(select_prev()),
				["<C-j>"] = cmp.mapping(function(fallback)
					if ls.expand_or_jumpable() then
						ls.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping(function(fallback)
					if ls.jumpable(-1) then
						ls.jump(-1)
					else
						fallback()
					end
				end, { "i" }),
				["<C-l>"] = cmp.mapping(function(fallback)
					if ls.choice_active() then
						ls.change_choice(1)
					else
						fallback()
					end
				end, { "i" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					end
				end, { "i", "s" }),
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.menu = vim_item.kind
					vim_item.kind = icons[vim_item.kind]

					-- set a name for each source
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[snp]",
						buffer = "[buf]",
						nvim_lua = "[lua]",
						path = "[path]",
						cmp_tabnine = "[tab9]",
					})[entry.source.name]

					return vim_item
				end,
			},
			sources = {
				{ name = "cmp_tabnine" },
				{
					name = "nvim_lsp", --[[, max_item_count = 20 ]]
				},
				{ name = "fish" },
				{ name = "npm", keyword_length = 4 },
				{
					name = "luasnip", --[[ , max_item_count = 10 ]]
				},
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 4, max_item_count = 10 },
				{ name = "nvim_lsp_signature_help" },
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
			sources = cmp.config.sources({
				{ name = "vim-dadbod-completion" },
			}),
		})

		-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})

		local present_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
		if not present_autopairs then
			return
		end

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
