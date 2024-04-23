return {
	"mhartington/formatter.nvim",
	config = function()
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
				fish = { require("formatter.filetypes.fish").fishindent },
				python = { require("formatter.filetypes.python").black },

				glsl = { prettier }, -- to work install prettier-plugin-glsl and add it to the prettier config: `plugins: ["prettier-plugin-glsl"]`
				svelte = { prettier },
				javascript = { prettier },
				javascriptreact = { prettier },
				typescript = { prettier },
				typescriptreact = { prettier },
				vue = { prettier },
				css = { prettier },
				scss = { prettier },
				less = { prettier },
				html = { prettier },
				json = { prettier },
				jsonc = { prettier },
				yaml = { prettier },
				markdown = { prettier },
				graphql = { prettier },
				handlebars = { prettier },
				svg = { prettier },

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
