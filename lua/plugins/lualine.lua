return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local ok, statusline = pcall(require, "arrow.statusline")

		local function arrow()
			if ok then
				return statusline.text_for_statusline_with_icons()
			end
		end

		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { arrow, "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
