return {
	"mhartington/formatter.nvim",
	config = function()
		local getFormatterName = require("config.format").getFormatterName
		local formatter_list = require("config.format").formatter_list
		local formatters = require("formatter.defaults")

		local function select(filetype)
			return function()
				local override = getFormatterName()
				local selected = (formatter_list[filetype] or {})[1]
				if override ~= nil and override ~= "default" then
					if formatters[override] ~= nil then
						selected = override
					end
				end
				return formatters[selected] and formatters[selected]()
			end
		end

		local filetypeConfig = {}

		for k, v in pairs(formatter_list) do
			filetypeConfig[k] = { select(k) }
		end

		filetypeConfig["*"] = {
			require("formatter.filetypes.any").substitute_trailing_whitespace,
		}

		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = filetypeConfig,
		})
	end,
}
