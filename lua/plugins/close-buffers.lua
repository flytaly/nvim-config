vim.keymap.set("n", "<leader>q", function()
	require("close_buffers").delete({ type = "this" }) -- Delete the current buffer
end)
