local null_ls = require("null-ls")
local b = null_ls.builtins

local eslint_opts = {
	condition = function(utils)
		return utils.root_has_file(".eslintrc.js")
	end,
	prefer_local = "node_modules/.bin",
	diagnostics_format = "#{m} [#{c}]",
}

local sources = {
	b.formatting.prettier.with({
		-- disabled_filetypes = { "typescript", "typescriptreact" },
	}),
	-- b.diagnostics.eslint_d.with(eslint_opts),
	-- b.formatting.eslint_d.with(eslint_opts),
	-- b.code_actions.eslint_d.with(eslint_opts),

	b.formatting.stylua,
	b.formatting.trim_whitespace.with({ filetypes = { "tmux", "teal", "zsh", "tridactyl" } }),
	b.formatting.shfmt,

	b.diagnostics.write_good,
	-- b.diagnostics.markdownlint,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	b.diagnostics.tsc,
	b.code_actions.gitsigns,
	b.code_actions.gitrebase,
	b.hover.dictionary,
}

local M = {}
M.setup = function(on_attach)
	require("null-ls").setup({
		on_attach = on_attach,
		debug = true,
		sources = sources,
	})
end

return M
