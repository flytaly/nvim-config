-- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370
local function copy_path(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local results = {
		filepath,
		modify(filepath, ":."),
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}

	vim.ui.select({
		"1. Absolute path: " .. results[1],
		"2. Path relative to CWD: " .. results[2],
		"3. Path relative to HOME: " .. results[3],
		"4. Filename: " .. results[4],
		"5. Filename without extension: " .. results[5],
		"6. Extension of the filename: " .. results[6],
	}, { prompt = "Choose to copy to clipboard:" }, function(choice)
		if choice then
			local i = tonumber(choice:sub(1, 1))
			if i then
				local result = results[i]
				vim.fn.setreg("+", result)
				vim.notify("Copied: " .. result)
			else
				vim.notify("Invalid selection")
			end
		else
			vim.notify("Selection cancelled")
		end
	end)
end

return {
	{
		-- refactor on file rename/move with some LSP
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function() require("lsp-file-operations").setup() end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		keys = {
			{
				"<leader>no",
				function() require("neo-tree.command").execute({ toggle = true }) end,
				desc = "NeoTree: toggle (cwd)",
			},
			{ "<leader>e", "<leader>no", desc = "NeoTree: toggle (cwd)", remap = true },
			{
				"<leader>nf",
				function() require("neo-tree.command").execute({ reveal = true }) end,
				desc = "NeoTree: reveal file",
			},
			{
				"<leader>nb",
				function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end,
				desc = "NeoTree: buffer explorer",
			},
			{
				"<leader>ng",
				function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end,
				desc = "NeoTree: git explorer",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			--
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["Y"] = copy_path,
					},
				},
			})
		end,
	},
}
