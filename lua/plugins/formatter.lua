return {
	"mhartington/formatter.nvim",
	config = function()
		local get_overridden_formatter = require("config.format").get_overridden_formatter
		local formatter_list = require("config.format").formatter_list
		local formatters = require("formatter.defaults")
		formatters["stylua"] = require("formatter.filetypes.lua").stylua

		-- select formatter in runtime
		local function select(filetype)
			return function()
				local override = get_overridden_formatter()
				local selected = (formatter_list[filetype] or {})[1]
				if override ~= nil and override ~= "default" then
					if formatters[override] ~= nil then
						selected = override
					end
				end
				if formatters[selected] == nil then
					vim.notify('formatter "' .. selected .. '" not found', vim.log.levels.WARN)
					return
				end
				return formatters[selected]()
			end
		end

		local filetype_config = {}

		for k, v in pairs(formatter_list) do
			filetype_config[k] = { select(k) }
		end

		filetype_config["*"] = {
			require("formatter.filetypes.any").substitute_trailing_whitespace,
		}

		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = filetype_config,
		})
	end,
}
