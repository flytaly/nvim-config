return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			-- size can be a number or function which is passed the current terminal
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-\>]],
			-- -- on_open = fun(t: Terminal), -- function to run when the terminal opens
			-- -- on_close = fun(t: Terminal), -- function to run when the terminal closes
			hide_numbers = true, -- hide the number column in toggleterm buffers
			-- shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = true,
			direction = "horizontal", -- | 'vertical' | 'tab' | 'float',
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell, -- change the default shell

			-- -- This field is only relevant if direction is set to 'float'
			float_opts = {
				--   -- The border key is *almost* the same as 'nvim_open_win'
				--   -- see :h nvim_open_win for details on borders however
				--   -- the 'curved' border is a custom border type
				--   -- not natively supported but implemented in this plugin.
				border = "curved", --'single' | 'double' | 'shadow' | 'curved',
				--   width = number,
				--   height = number,
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		vim.keymap.set("n", [[<a-\>]], ":ToggleTerm direction=vertical<CR>")

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		vim.cmd("autocmd BufWinEnter,WinEnter term://* startinsert")

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			float_opts = {
				border = "double",
			},
			hidden = true,
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>gl",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Lazygit" }
		)
	end,
}
