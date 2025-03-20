return {
	"mhartington/formatter.nvim",
	config = function()
		local formatters = require("formatter.defaults")
		local prettier = formatters.prettier
		local biome = formatters.biome
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

				glsl = { formatters.clangformat, prettier }, -- to work install prettier-plugin-glsl and add it to the prettier config: `plugins: ["prettier-plugin-glsl"]`
				javascript = { prettier, biome },
				javascriptreact = { prettier, biome },
				typescript = { prettier, biome },
				typescriptreact = { prettier, biome },
				svelte = { prettier },
				astro = { prettier }, -- prettier-plugin-astro
				vue = { prettier },
				css = { biome, prettier },
				scss = { prettier },
				less = { prettier },
				html = { prettier, biome },
				json = { biome, prettier },
				jsonc = { biome, prettier },
				yaml = { prettier },
				markdown = { prettier },
				graphql = { prettier, biome },
				handlebars = { prettier },
				toml = { prettier },

				["*"] = {
					-- require("formatter.filetypes.any").remove_trailing_whitespace,
					require("formatter.filetypes.any").substitute_trailing_whitespace,
				},
			},
		})
	end,
}
