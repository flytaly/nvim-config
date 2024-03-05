return {
	"ckolkey/ts-node-action",
	dependencies = { "nvim-treesitter" },
	init = function()
		vim.keymap.set({ "n" }, "Z", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
	end,
	config = function()
		local ts_node_action = require("ts-node-action")
		local helpers = require("ts-node-action.helpers")

		local padding = {
			[","] = "%s ",
			[":"] = "%s ",
		}

		local toggle_multiline = require("ts-node-action.actions.toggle_multiline")(padding)

		local operators = {
			["!="] = "==",
			["!=="] = "===",
			["=="] = "!=",
			["==="] = "!==",
			[">"] = "<",
			["<"] = ">",
			[">="] = "<=",
			["<="] = ">=",
		}

		local function toggle_operator(node)
			local replacement = {}

			for child, _ in node:iter_children() do
				local text = helpers.node_text(child)
				if operators[text] then
					table.insert(replacement, operators[text])
				else
					table.insert(replacement, text)
				end
			end

			return table.concat(replacement, " ")
		end

		local js = {
			["true"] = function()
				return "false"
			end,
			["false"] = function()
				return "true"
			end,
			["array"] = toggle_multiline,
			["object"] = toggle_multiline,
			["object_pattern"] = toggle_multiline,
			["object_type"] = toggle_multiline,
			["formal_parameters"] = toggle_multiline,
			["argument_list"] = toggle_multiline,
			["method_parameters"] = toggle_multiline,
			["binary_expression"] = toggle_operator,
		}

		ts_node_action.setup({
			typescript = js,
			typescriptreact = js,
			javascript = js,
			javascriptreact = js,
			svelte = js,
			vue = js,
		})
	end,
}
