local ok, go = pcall(require, "go")

if not ok then
	return
end

go.setup()

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
    group = vim.api.nvim_create_augroup("OrganizeImports", {}),
    callback = function()
        vim.cmd("GoImport")
    end,
})
