local util = {}

-- Highlight the given group according to the color values
function util.highlight(group, colors)
	local style = colors.style and "gui=" .. colors.style or "gui=NONE"
	local fg = colors.fg and "guifg=" .. colors.fg or "guifg=NONE"
	local bg = colors.bg and "guibg=" .. colors.bg or "guibg=NONE"
	local sp = colors.sp and "guisp=" .. colors.sp or ""

	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

	vim.cmd(hl)
	if colors.link then
		vim.cmd("highlight! link " .. group .. " " .. colors.link)
	end
end

return util
