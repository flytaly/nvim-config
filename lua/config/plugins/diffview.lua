--- sindrets/diffview.nvim
local present, diffview = pcall(require, "diffview")
if not present then
	return
end

diffview.setup({
	file_panel = {
		win_config = {
			position = "left",
		},
	},
})
