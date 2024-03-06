return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	branch = "harpoon2",
	init = function()
		local harpoon = require("harpoon")
		local nmap = function(key, command, desc)
			vim.keymap.set("n", key, command, { desc = desc })
		end

		harpoon:setup()

		nmap("<leader>`a", function()
			harpoon:list():append()
		end, "harpoon: add file")

		nmap("<leader>`c", function()
			harpoon:list():clear()
		end, "harpoon: clear list")

		nmap("<leader>``", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, "harpoon: toggle quick menu")

		nmap("<leader>1", function()
			harpoon:list():select(1)
		end, "harpoon: go to file 1")
		nmap("<leader>2", function()
			harpoon:list():select(2)
		end, "harpoon: go to file 2")
		nmap("<leader>3", function()
			harpoon:list():select(3)
		end, "harpoon: go to file 3")
		nmap("<leader>4", function()
			harpoon:list():select(4)
		end, "harpoon: go to file 4")
		nmap("<leader>5", function()
			harpoon:list():select(5)
		end, "harpoon: go to file 5")

		nmap("<leader>-", function()
			harpoon:list():prev()
		end, "harpoon: navigate to the previous file")

		nmap("<leader>=", function()
			harpoon:list():next()
		end, "harpoon: navigate to the next file")

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}
