require("package-info").setup()

-- Show package versions
vim.keymap.set("n", "<leader>fns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })

-- Hide package versions
vim.keymap.set("n", "<leader>fnc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })

-- Update package on line
vim.keymap.set("n", "<leader>fnu", ":lua require('package-info').update()<CR>", { silent = true, noremap = true })

-- Delete package on line
vim.keymap.set("n", "<leader>fnd", ":lua require('package-info').delete()<CR>", { silent = true, noremap = true })

-- Reinstall dependencies
vim.keymap.set("n", "<leader>fnr", ":lua require('package-info').reinstall()<CR>", { silent = true, noremap = true })

-- Install a different package version
vim.keymap.set("n", "<leader>fnp", ":lua require('package-info').change_version()<CR>", { silent = true, noremap = true })
