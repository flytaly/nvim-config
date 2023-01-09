return {
	"ekickx/clipboard-image.nvim",
	ft = "markdown",
	init = function()
		vim.keymap.set("n", "<leader>mp", "<cmd>PasteImg<CR>")
	end,
	config = function()
		local clipboard_image = require("clipboard-image")

		local function getAbsDirName()
			local fname = vim.fn.expand("%:p:r") --:help filename-modifiers
			if fname == nil or fname == "" then
				return "img"
			end
			return fname .. "_img"
		end

		local function getRelativeDirName()
			return vim.fn.expand("%:t:r") .. "_img"
		end

		clipboard_image.setup({
			default = {
				-- img_dir = "img",
				img_dir = getAbsDirName,
				img_dir_txt = getRelativeDirName,
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
	end,
}
