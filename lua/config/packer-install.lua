local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("packer_reload", { clear = true }),
	pattern = "*/plugins/init.lua",
	callback = function()
		vim.cmd([[so %]])
		vim.cmd([[PackerSync]])
	end,
})
