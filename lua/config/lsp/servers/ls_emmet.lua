-- emmet_ls fork https://github.com/pedro757/emmet
-- to install:
-- npm install -g ls_emmet

local present, nvim_lsp = pcall(require, "lspconfig")
if not present then
	return
end

local filetypes = {
	"html",
	"css",
	"scss",
	-- "javascript",
	"javascriptreact",
	-- "typescript",
	"typescriptreact",
	"haml",
	"xml",
	"xsl",
	"pug",
	"slim",
	"sass",
	"stylus",
	"less",
	"sss",
}

local M = {}
M.setup = function(capabilities)
	local config = require("lspconfig.configs")
	if not config.ls_emmet then
		config.ls_emmet = {
			default_config = {
				cmd = { "ls_emmet", "--stdio" },
				filetypes = filetypes,
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
				settings = {},
			},
		}
	end
	nvim_lsp.ls_emmet.setup({ capabilities = capabilities })
end

return M
