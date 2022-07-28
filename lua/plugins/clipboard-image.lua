-- https://github.com/ekickx/clipboard-image.nvim
--

local ok, clipboard_image = pcall(require, "clipboard-image")
if not ok then
	return
end

local function getDirName()
	local fname = vim.fn.expand("%")
	if fname == nil then
		return "img"
	end
	fname = string.gsub(fname, ".md$", "")
	if fname == nil or fname == "" then
		return "img"
	else
		return fname .. "_img"
	end
end

clipboard_image.setup({
	default = {
		-- img_dir = "img",
		img_dir = getDirName,
		img_dir_txt = getDirName,
		img_name = function()
			vim.fn.inputsave()
			local name = vim.fn.input("Name: ")
			vim.fn.inputrestore()

			if name == nil or name == "" then
				return os.date("%y-%m-%d-%H-%M-%S")
			end
			return name
		end,
		affix = "%s",
	},
})
