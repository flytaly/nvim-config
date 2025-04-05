return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = false },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = {
				enabled = true,
				filter = function(notif)
					-- filter our unwanted notifications from lsp
					if notif.level ~= "info" then
						return true
					end
					return notif.msg ~= "No information available"
				end,
			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
			lazygit = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>:",
				function() Snacks.picker.command_history() end,
				desc = "Command History",
			},
			{
				"<leader>nn",
				function() Snacks.picker.notifications() end,
				desc = "Notification History",
			},
			{
				"<leader>si",
				function() Snacks.picker.icons() end,
				desc = "Icons",
			},
			-- Other
			{
				"<leader>.",
				function() Snacks.scratch() end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>>",
				function() Snacks.scratch.select() end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>nn",
				function() Snacks.notifier.show_history() end,
				desc = "Notification History",
			},
			{
				"<leader>bd",
				function() Snacks.bufdelete() end,
				desc = "Delete Buffer",
			},
			{
				"<leader>gl",
				function() Snacks.lazygit() end,
				desc = "Lazygit",
			},
			{
				"<leader>nh",
				function() Snacks.notifier.hide() end,
				desc = "Dismiss All Notifications",
			},
		},
	},
}
