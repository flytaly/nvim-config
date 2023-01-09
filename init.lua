require("config.mapping")

require("config.lazy-nvim-install")
require("lazy").setup("plugins")
require("plugins")

require("config.options")
require("config.filetypes")
require("config.theme")
require("config.lsp")
require("config.debug")
require("neovide")
