local presentCmp, cmp = pcall(require, "cmp")
local presentLspKind, lspKind = pcall(require, "lspkind")
local presentLuaSnip, ls = pcall(require, "luasnip")
local presentCmpNpm, npm = pcall(require, "cmp-npm")

if not presentCmp or not presentLuaSnip then
	return
end

if presentLspKind then
	lspKind.init({})
end

if presentCmpNpm then
	npm.setup({})
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif ls.expand_or_locally_jumpable() then
				ls.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif ls.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
		["<C-j>"] = cmp.mapping(function(fallback)
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { "i" }),
		["<C-l>"] = cmp.mapping(function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { "i" }),
	},
	formatting = {
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			vim_item.kind = lspKind.presets.default[vim_item.kind] .. " " .. vim_item.kind

			-- set a name for each source
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[snp]",
				buffer = "[buf]",
				nvim_lua = "[lua]",
				path = "[path]",
			})[entry.source.name]

			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp", max_item_count = 20 },
		{ name = "fish" },
		{ name = "npm", keyword_length = 4 },
		{ name = "luasnip", max_item_count = 10 },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4, max_item_count = 10 },
	},
	experimental = {
		ghost_text = true,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not presentAutopairs then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
