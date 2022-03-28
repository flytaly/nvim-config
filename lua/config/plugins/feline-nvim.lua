local vi_mode_utils = require("feline.providers.vi_mode")

local function fromhl(hl)
	local result = {}
	local list = vim.api.nvim_get_hl_by_name(hl, true)
	for k, v in pairs(list) do
		local name = k == "background" and "bg" or "fg"
		result[name] = string.format("#%06x", v)
	end
	return result
end

local theme_colors = {
	bg = fromhl("StatusLine").bg or "#16161D",
	alt = fromhl("CursorLine").bg or "#363646",
	fg = fromhl("StatusLine").fg or "#C8C093",
	hint = fromhl("DiagnosticHint").bg or "#6A9589",
	info = fromhl("DiagnosticInfo").bg or "#658594",
	warn = fromhl("DiagnosticWarn").bg or "#FF9E3B",
	err = fromhl("DiagnosticError").bg or "#E82424",
	black = "#223249",
	red = "#FF5D62",
	green = "#98BB6C",
	yellow = "#DCA561",
	blue = "#7FB4CA",
	magenta = "#B48EAD",
	cyan = "#7AA89F",
	white = "#DCD7BA",
	violet = "#957FB8",
	orange = "#DCA561",
}

local colors = theme_colors

local vi_mode_colors = {
	NORMAL = colors.green,
	INSERT = colors.blue,
	VISUAL = colors.violet,
	OP = colors.green,
	BLOCK = colors.blue,
	REPLACE = colors.red,
	["V-REPLACE"] = colors.red,
	ENTER = colors.cyan,
	MORE = colors.cyan,
	SELECT = colors.orange,
	COMMAND = colors.magenta,
	SHELL = colors.green,
	TERM = colors.blue,
	NONE = colors.yellow,
}

local vi_mode_text = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	[""] = "V-BLOCK",
	V = "V-LINE",
	c = "COMMAND",
	no = "UNKNOWN",
	s = "UNKNOWN",
	S = "UNKNOWN",
	ic = "UNKNOWN",
	R = "REPLACE",
	Rv = "UNKNOWN",
	cv = "UNKWON",
	ce = "UNKNOWN",
	r = "REPLACE",
	rm = "UNKNOWN",
	t = "INSERT",
}

local components = {
	active = {},
	inactive = {},
}

components.active[1] = {
	{
		provider = function()
			local current_text = " " .. vi_mode_text[vim.fn.mode()] .. " "
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
			-- "slant_right",
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
		provider = "file_info",
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
		provider = "diagnostic_errors",
		hl = { fg = "red", bg = "bg" },
	},
	{
		provider = "diagnostic_warnings",
		hl = { fg = "yellow", bg = "bg" },
	},
	{
		provider = "diagnostic_hints",
		hl = { fg = "cyan", bg = "bg" },
	},
	{
		provider = "diagnostic_info",
		hl = { fg = "skyblue", bg = "bg" },
	},
	{
		left_sep = {
			str = "",
			hl = {
				fg = "alt",
				bg = "bg",
			},
			always_visible = true,
		},
	},
	{
		provider = "file_type",
		hl = {
			fg = "fg",
			bg = "alt",
			style = "bold",
		},
		right_sep = {
			str = " ",
			hl = {
				fg = "NONE",
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

require("feline").setup({
	components = components,
	vi_mode_colors = vi_mode_colors,
	theme = theme_colors,
})
