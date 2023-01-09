return {
	"vuki656/package-info.nvim",
	ft = "json",
	dependencies = "MunifTanjim/nui.nvim",
	init = function()
		-- Show package versions
		vim.keymap.set("n", "<leader>fns", ":lua require('package-info').show()<CR>")

		-- Hide package versions
		vim.keymap.set("n", "<leader>fnc", ":lua require('package-info').hide()<CR>")

		-- Update package on line
		vim.keymap.set("n", "<leader>fnu", ":lua require('package-info').update()<CR>")

		-- Delete package on line
		vim.keymap.set("n", "<leader>fnd", ":lua require('package-info').delete()<CR>")

		-- Reinstall dependencies
		vim.keymap.set("n", "<leader>fnr", ":lua require('package-info').reinstall()<CR>")

		-- Install a different package version
		vim.keymap.set("n", "<leader>fnp", ":lua require('package-info').change_version()<CR>")
	end,
	config = true,
}
