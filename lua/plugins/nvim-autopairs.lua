local ok, npairs = pcall(require, "nvim-autopairs")

if not ok then
	return
end

npairs.setup({ fast_wrap = {} })

local Rule = require("nvim-autopairs.rule")
npairs.add_rule(Rule("$$", "$$", "markdown"))
npairs.add_rule(Rule("**", "**", "markdown"))
