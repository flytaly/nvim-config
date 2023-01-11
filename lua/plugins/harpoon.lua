return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	init = function()
		local nmap = function(key, command, desc)
			vim.keymap.set("n", key, command, { desc = desc })
		end

		nmap("<leader>`a", ':lua require("harpoon.mark").add_file()<CR>', "harpoon: mark file")
		nmap("<leader>``", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "harpoon: view all project marks")
		nmap("<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>', "harpoon: go to file 1")
		nmap("<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>', "harpoon: go to file 2")
		nmap("<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>', "harpoon: go to file 3")
		nmap("<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>', "harpoon: go to file 4")
		nmap("<leader>5", ':lua require("harpoon.ui").nav_file(5)<CR>', "harpoon: go to file 5")
		nmap("<leader>-", ':lua require("harpoon.ui").nav_next()<CR>', "harpoon: navigate to the next file")
		nmap("<leader>=", ':lua require("harpoon.ui").nav_prev()<CR>', "harpoon: navigate to the next file")
	end,
}
