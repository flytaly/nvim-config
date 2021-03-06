local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
	b.formatting.prettier_d_slim,
	b.formatting.stylua,
	b.formatting.trim_whitespace.with({ filetypes = { "tmux", "teal", "zsh", "tridactyl" } }),
	b.formatting.shfmt,
	b.formatting.beautysh,
	-- b.completion.spell.with({ filetypes = { "markdown", "text" } }),
	-- b.diagnostics.codespell,
	-- b.diagnostics.cspell.with({ filetypes = { "markdown", "text" } }),
	b.diagnostics.cspell.with({
		filetypes = { "markdown", "text", "gitcommit" },
		disabled_filetypes = { "nvimtree", "lua" },
	}),
	-- b.diagnostics.write_good,
	-- b.diagnostics.markdownlint,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	-- b.diagnostics.tsc,
	b.code_actions.gitsigns.with({ disabled_filetypes = { "sql" } }),
	b.code_actions.gitrebase.with({ disabled_filetypes = { "sql" } }),
	b.code_actions.refactoring,
	-- b.hover.dictionary,
}

local M = {}
M.setup = function(on_attach)
	require("null-ls").setup({
		on_attach = on_attach,
		debug = false,
		sources = sources,
	})
end

return M
