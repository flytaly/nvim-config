return {
	"luukvbaal/statuscol.nvim",
	config = function()
		--[[ https://github.com/luukvbaal/statuscol.nvim/issues/27 ]]
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" }, -- fold
				{ text = { "%s" }, click = "v:lua.ScSa" }, -- status
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" }, -- numbers
			},
		})
	end,
}
