return {
	"mhartington/formatter.nvim",
	config = function()
		local prettier_d = require("formatter.defaults").prettierd
		local prettier = require("formatter.defaults").prettier
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = { require("formatter.filetypes.lua").stylua },
				sql = { require("formatter.filetypes.sql").pgformat },
				sh = { require("formatter.filetypes.sh").shfmt },

				glsl = { prettier },
				svelte = { prettier },

				javascript = { prettier_d },
				javascriptreact = { prettier_d },
				typescript = { prettier_d },
				typescriptreact = { prettier_d },
				vue = { prettier_d },
				css = { prettier_d },
				scss = { prettier_d },
				less = { prettier_d },
				html = { prettier_d },
				json = { prettier_d },
				jsonc = { prettier_d },
				yaml = { prettier_d },
				markdown = { prettier_d },
				graphql = { prettier_d },
				handlebars = { prettier_d },
				svg = { prettier_d },

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
