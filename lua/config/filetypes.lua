vim.filetype.add({
	extension = {
		h = function()
			-- Use a lazy heuristic that #including a C++ header means it's a
			-- C++ header
			if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") == 1 then
				return "cpp"
			end
			return "c"
		end,
		csv = "csv",
		cl = "opencl",
		env = "env",
		glsl = "glsl",
		frag = "glsl",
		vert = "glsl",
		pcss = "scss",
		prisma = "prisma",
	},
})
