local filterDTS = require("config.mapping.filter-dts")

-- Sometimes, lsp returns multiple entries.
-- Use C-] instead. It will call vim.lsp.tagfun which will jump to the first entry.
-- https://github.com/neovim/neovim/issues/28476#issuecomment-2074248691
local function go_to_definition()
	if vim.o.tagfunc ~= "" or #vim.fn.tagfiles() > 0 then
		return "<C-]>"
	end
	vim.lsp.buf.definition({ on_list = filterDTS.on_list })
end

local function set_keymaps(bufnr)
	-- Mappings
	local function set(mode, lhs, rhs, opts)
		local optsDefault = { noremap = true, silent = true, buffer = bufnr }
		optsDefault = vim.tbl_extend("force", optsDefault, opts)
		vim.keymap.set(mode, lhs, rhs, optsDefault)
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	set({ "n", "v" }, "<space>ca", function()
		vim.lsp.buf.code_action({ context = { only = { "source", "refactor", "quickfix" } } })
	end, { desc = "Code Actions" })

	-- swap gd with <C-]>
	set("n", "<C-]>", function()
		vim.lsp.buf.definition()
	end, { expr = true, desc = "Go to definition" })
	set("n", "gd", go_to_definition, { expr = true, desc = "Go to definition (tagfunc)" })

	set("n", "<C-t>gd", function()
		vim.api.nvim_command("tab split")
		go_to_definition()
	end, { desc = "Go to definition in new tab" })

	set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
	set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
	-- use Trouble for references
	--[[ set("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts) ]]
	set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" })
	set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })
	set("n", "gC", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
	set("n", "gD", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic float" })

	set("n", "<leader>af", function()
		if vim.bo.filetype == "go" then
			vim.cmd([[GoFmt]])
		else
			require("config.format").format()
		end
	end, { desc = "Format file", buffer = bufnr })

	set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
	set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
	set({ "i", "n" }, "<C-'>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })
end

-- add mappings after lsp attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttach", {}),
	callback = function(args)
		set_keymaps(args.buf)
	end,
})
