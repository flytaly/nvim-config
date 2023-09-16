local format = require("config.format")
local filterDTS = require("config.mapping.filter-dts")

local M = {}

M.set_keymaps = function(bufnr)
	-- Mappings
	local function set(mode, lhs, rhs, opts)
		local optsDefault = { noremap = true, silent = true, buffer = bufnr }
		optsDefault = vim.tbl_extend("force", optsDefault, opts)
		vim.keymap.set(mode, lhs, rhs, optsDefault)
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	set({ "n", "v" }, "ga", "<cmd>CodeActionMenu<CR>", { desc = "Code Actions Menu" })
	set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" })
	set("v", "<space>ca", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", { desc = "Code Actions" })

	set("n", "gd", function()
		vim.lsp.buf.definition({ on_list = filterDTS.on_list })
	end, { desc = "Go to definition" })

	set("n", "<C-t>gd", function()
		vim.api.nvim_command("tab split")
		vim.lsp.buf.definition({ on_list = filterDTS.on_list })
	end, { desc = "Go to definition in new tab" })

	set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
	set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
	-- use Trouble for references
	--[[ set("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts) ]]
	set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" })
	set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" })
	set("n", "gD", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Go to diagnostic float" })
	set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })

	set("n", "<leader>gf", function()
		format.format()
	end, { desc = "Format file", buffer = bufnr })

	set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
	set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
	set({ "i", "n" }, "<C-'>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })

	set("n", "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })
	set("n", "<leader>fds", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Dynamic Workspace Symbols" })
end

return M
