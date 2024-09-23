local util = require("config.theme.util")

local M = {}

-- Set nvim-cmp colors from rmehri01/onenord.nvim theme
local colors_dark = {
	fg = "#C8D0E0",
	fg_light = "#E5E9F0",
	bg = "#2E3440",
	gray = "#646A76",
	light_gray = "#6C7A96",
	cyan = "#88C0D0",
	blue = "#81A1C1",
	dark_blue = "#5E81AC",
	green = "#A3BE8C",
	light_green = "#8FBCBB",
	dark_red = "#BF616A",
	red = "#D57780",
	light_red = "#DE878F",
	pink = "#E85B7A",
	dark_pink = "#E44675",
	orange = "#D08F70",
	yellow = "#EBCB8B",
	purple = "#B988B0",
	light_purple = "#B48EAD",
	none = "NONE",
}

local colors_light = {
	fg = "#2E3440",
	fg_light = "#4C566A",
	bg = "#F7F8FA",
	gray = "#838FA6",
	light_gray = "#646A76",
	cyan = "#3EA1AD",
	blue = "#3879C5",
	dark_blue = "#1B40A6",
	green = "#48A53D",
	light_green = "#5F9E9D",
	dark_red = "#C53B40",
	red = "#CB4F53",
	light_red = "#D16366",
	pink = "#E85B7A",
	dark_pink = "#E44675",
	orange = "#EE5E25",
	yellow = "#BA793E",
	purple = "#9F4ACA",
	light_purple = "#9665AF",
	none = "NONE",
}

local GetCmpColors = function(colors)
	return {
		CmpItemAbbr = { fg = colors.fg },
		CmpItemAbbrDeprecated = { fg = colors.fg },
		CmpItemAbbrMatch = { fg = colors.blue, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = colors.blue, underline = true },
		CmpItemMenu = { fg = colors.light_gray },
		CmpItemKindText = { fg = colors.orange },
		CmpItemKindMethod = { fg = colors.blue },
		CmpItemKindFunction = { fg = colors.blue },
		CmpItemKindConstructor = { fg = colors.yellow },
		CmpItemKindField = { fg = colors.blue },
		CmpItemKindClass = { fg = colors.yellow },
		CmpItemKindInterface = { fg = colors.yellow },
		CmpItemKindModule = { fg = colors.blue },
		CmpItemKindProperty = { fg = colors.blue },
		CmpItemKindValue = { fg = colors.orange },
		CmpItemKindEnum = { fg = colors.yellow },
		CmpItemKindKeyword = { fg = colors.purple },
		CmpItemKindSnippet = { fg = colors.green },
		CmpItemKindFile = { fg = colors.blue },
		CmpItemKindEnumMember = { fg = colors.cyan },
		CmpItemKindConstant = { fg = colors.orange },
		CmpItemKindStruct = { fg = colors.yellow },
		CmpItemKindTypeParameter = { fg = colors.yellow },
		CmpItemKindCopilot = { fg = colors.green },
	}
end

M.setupColors = function(is_dark)
	local colors = is_dark and colors_dark or colors_light
	for group, color in pairs(GetCmpColors(colors)) do
		util.highlight(group, color)
	end
end

return M
