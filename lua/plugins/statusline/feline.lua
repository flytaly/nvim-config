local present_feline, feline = pcall(require, "feline")
if not present_feline then
	return
end

local present_ctp_feline, ctp_feline = pcall(require, "catppuccin.groups.integrations.feline")

if present_ctp_feline then
	-- catppuccin default feline config
	feline.setup({ components = ctp_feline.get() })
else
	local felineColors = require("plugins.statusline.feline-colors")
	local felineComponents = require("plugins.statusline.feline-components")

	feline.setup({
		components = felineComponents.components,
		vi_mode_colors = felineColors.vi_mode_colors,
		theme = felineColors.theme,
	})
end
