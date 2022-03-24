local present, luasnip = pcall(require, "luasnip")
if not present then
	return
end

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	store_selection_keys = "<Leader>cc",
})

require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snip" })
require("luasnip.loaders.from_vscode").lazy_load()

-- luasnip.filetype_extend("javascriptreact", { "html" })
-- luasnip.filetype_extend("typescriptreact", { "html" })
luasnip.filetype_extend("all", { "_" })
