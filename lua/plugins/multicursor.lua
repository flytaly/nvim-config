return {
	"jake-stewart/multicursor.nvim",
	event = "VeryLazy",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		-- Add cursors above/below the main cursor.
		vim.keymap.set({ "n", "v" }, "<c-up>", function() mc.addCursor("k") end)
		vim.keymap.set({ "n", "v" }, "<c-down>", function() mc.addCursor("j") end)

		-- Add a cursor and jump to the next word under cursor.
		vim.keymap.set({ "n", "v" }, "<c-n>", function() mc.addCursor("*") end)

		-- Jump to the next word under cursor but do not add a cursor.
		-- vim.keymap.set({ "n", "v" }, "<c-s>", function()
		-- 	mc.skipCursor("*")
		-- end)

		-- Rotate the main cursor.
		vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
		vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

		vim.keymap.set({ "n", "v" }, "<leader>xx", mc.deleteCursor, { desc = "Multicursor: delete cursor" })

		-- Add and remove cursors with control + left click.
		vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

		vim.keymap.set("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)

		-- Split visual selections by regex.
		vim.keymap.set("v", "s", mc.splitCursors, { desc = "Multicursor: split visual selection by regex" })
		vim.keymap.set("v", "I", mc.insertVisual, { desc = "Multicursor: insert visual selection" })
		vim.keymap.set("v", "A", mc.appendVisual, { desc = "Multicursor: append visual selection" })
		vim.keymap.set(
			"v",
			"M",
			mc.matchCursors,
			{ desc = "Multicursor: match cursors within visual selection by regex" }
		)

		-- make sure highlights are re-applied when the color scheme changes, otherwise they will be removed
		local function update_hl()
			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { reverse = true })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorMatchPreview", { link = "Search" })
			hl(0, "MultiCursorDisabledCursor", { reverse = true })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("MultiCursorHighlights", { clear = true }),
			pattern = "*",
			callback = function() update_hl() end,
		})

		update_hl()
	end,
}
