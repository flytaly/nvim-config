local M = {}

function M.fromhl(hl)
	local result = {}
	local list = vim.api.nvim_get_hl_by_name(hl, true)
	for k, v in pairs(list) do
		local name = k == "background" and "bg" or "fg"
		if type(v) == "number" then
			result[name] = string.format("#%06x", v)
		end
	end
	return result
end

local fromhl = M.fromhl

M.theme = {
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
	yellow = "#FF9E3B",
	blue = "#7FB4CA",
	magenta = "#B48EAD",
	cyan = "#7AA89F",
	white = "#DCD7BA",
	violet = "#957FB8",
	orange = "#DCA561",
	skyblue = "#658594",
}

local colors = M.theme

M.vi_mode_colors = {
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

return M
