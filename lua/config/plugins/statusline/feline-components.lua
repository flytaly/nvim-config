local vi_mode_utils = require("feline.providers.vi_mode")

local function diagnostics(severity)
	local count = vim.tbl_count(vim.diagnostic.get(0, { severity = severity }))
	return count ~= 0 and tostring(count) or ""
end

local M = {}

local components = {
	active = {},
	inactive = {},
}

M.components = components

components.active[1] = {
	{
		provider = function()
			local current_text = " " .. vi_mode_utils.get_vim_mode() .. " "
			return current_text
		end,
		hl = function()
			return {
				name = vi_mode_utils.get_mode_highlight_name(),
				bg = vi_mode_utils.get_mode_color(),
				fg = "black",
				style = "bold",
			}
		end,
		right_sep = {
			str = "",
			hl = function()
				return {
					fg = vi_mode_utils.get_mode_color(),
					bg = "black",
				}
			end,
		},
	},
	{
		provider = { name = "file_info", opts = { type = "unique" } },
		hl = {
			fg = "white",
			bg = "black",
		},
		left_sep = { str = " ", hl = { bg = "black" } },
	},

	{
		provider = "git_branch",
		hl = {
			bg = "black",
			style = "bold",
		},
		left_sep = { str = " | ", hl = { bg = "black" } },
	},
	{
		right_sep = {
			str = "",
			hl = {
				fg = "black",
				bg = "bg",
			},
			always_visible = true,
		},
	},
	{
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "bg",
		},
	},
	{
		provider = "git_diff_changed",
		hl = {
			fg = "orange",
			bg = "bg",
		},
	},
	{
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "bg",
		},
	},
}

components.active[2] = {
	{
		provider = function()
			if #vim.lsp.buf_get_clients() > 0 then
				return require("lsp-status").status()
			end
			return ""
		end,
	},
	{
		provider = function()
			return diagnostics(vim.diagnostic.severity.ERROR)
		end,
		hl = { fg = "black", bg = "red" },
		left_sep = {
			str = "",
			hl = {
				fg = "red",
				bg = "bg",
			},
			always_visible = true,
		},
	},
	{
		provider = function()
			return diagnostics(vim.diagnostic.severity.WARN)
		end,
		hl = { fg = "black", bg = "yellow" },
		left_sep = {
			str = "",
			hl = {
				fg = "yellow",
				bg = "red",
			},
			always_visible = true,
		},
	},
	{
		provider = function()
			return diagnostics(vim.diagnostic.severity.HINT)
		end,
		hl = { fg = "black", bg = "cyan" },
		left_sep = {
			str = "",
			hl = {
				fg = "cyan",
				bg = "yellow",
			},
			always_visible = true,
		},
	},
	{
		provider = function()
			return diagnostics(vim.diagnostic.severity.INFO)
		end,
		hl = { fg = "black", bg = "skyblue" },
		left_sep = {
			str = "",
			hl = {
				fg = "skyblue",
				bg = "cyan",
			},
			always_visible = true,
		},
	},
	{
		left_sep = {
			str = "",
			hl = {
				fg = "alt",
				bg = "skyblue",
			},
			always_visible = true,
		},
	},
	{
		provider = {
			name = "file_type",
			opts = {
				case = "lowercase",
			},
		},
		hl = {
			fg = "fg",
			bg = "alt",
			style = "bold",
		},
		right_sep = {
			str = "",
			hl = {
				fg = "NONE",
				bg = "alt",
			},
		},
	},
	{
		provider = "file_encoding",
		hl = {
			fg = "fg",
			bg = "black",
		},
		left_sep = {
			str = "",
			hl = {
				fg = "black",
				bg = "alt",
			},
		},
	},
	{
		provider = "position",
		hl = { bg = "black" },
		left_sep = { { str = " ", hl = { fg = "fg", bg = "black" } } },
		right_sep = { { str = " ", hl = { fg = "fg", bg = "black" } } },
	},
	{
		provider = "line_percentage",
		hl = {
			bg = "black",
			style = "bold",
		},
		left_sep = { { str = " ", hl = { fg = "fg", bg = "black" } } },
		right_sep = { { str = " ", hl = { fg = "fg", bg = "black" } } },
	},
	{
		provider = "scroll_bar",
		hl = {
			fg = "skyblue",
			style = "bold",
			bg = "black",
		},
	},
}

components.inactive[1] = {
	{
		provider = "file_type",
		hl = {
			fg = "black",
			bg = "blue",
			style = "bold",
		},
		left_sep = {
			str = " ",
			hl = {
				fg = "NONE",
				bg = "blue",
			},
		},
		right_sep = {
			{
				str = " ",
				hl = {
					fg = "NONE",
					bg = "blue",
				},
			},
			"slant_right",
		},
	},
	-- Empty component to fix the highlight till the end of the statusline
	{},
}

return M
