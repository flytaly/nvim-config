-- emmet_ls fork https://github.com/pedro757/emmet
-- to install: npm install -g ls_emmet
local filetypes = {
	"html",
	"css",
	"scss",
	"javascriptreact",
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function()
		vim.lsp.start({
			name = "emmet_ls",
			cmd = { "ls_emmet", "--stdio" },
			root_dir = vim.loop.cwd(),
		})
	end,
})
