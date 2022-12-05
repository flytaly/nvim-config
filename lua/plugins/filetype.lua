local filetype_ok, filetype = pcall(require, "filetype")
if not filetype_ok then
	vim.api.nvim_command([[echoerr "Error while loading filetype.nvim"]])
	return
end

filetype.setup({
	overrides = {
		extensions = {
			html = "html",
			pcss = "scss",
			prisma = "prisma",
			frag = "glsl",
			vert = "glsl",
			sh = "sh",
		},
	},
})
