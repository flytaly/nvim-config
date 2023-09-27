return {
	"linty-org/key-menu.nvim",
	config = function()
		vim.o.timeoutlen = 500
		require("key-menu").set("n", "<Space>")
		require("key-menu").set("n", "<Space>f", { desc = "Telescope" })
		require("key-menu").set("n", "<Space>fn", { desc = "npm" })
		require("key-menu").set("n", "<Space>d", { desc = "debug" })
		require("key-menu").set("n", "<Space>h", { desc = "git" })
		require("key-menu").set("n", "<Space>x", { desc = "Trouble" })
		require("key-menu").set("n", "<Space>t", { desc = "Test" })
		require("key-menu").set("n", "<Space>n", { desc = "File explorers" })
		require("key-menu").set("n", "g")
		require("key-menu").set("n", "[")
		require("key-menu").set("n", "]")
		--[[ require("key-menu").set("n", "z") ]]
	end,
}
