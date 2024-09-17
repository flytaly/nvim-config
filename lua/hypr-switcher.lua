-- Hyperland keyboard layout switcher

if os.getenv("HYPRLAND_INSTANCE_SIGNATURE") == nil then
	return
end

local layouts = {
	["English (US)"] = 0,
	["Russian"] = 1,
}
local en_layout = 0
local keyboard = "my-kmonad-output"
local insert_layout = en_layout

local function get_layout()
	local output = vim.fn.system(
		"hyprctl devices -j | jq -r '.keyboards[] | select(.name == \"" .. keyboard .. "\") | .active_keymap'   "
	)

	output = output:gsub("\n", "")
	return layouts[output] or 0
end

local group = vim.api.nvim_create_augroup("HyperKeyboardSwitcher", { clear = true })

vim.api.nvim_create_autocmd("InsertLeavePre", {
	callback = function()
		insert_layout = get_layout()
		if insert_layout == en_layout then
			return
		end
		vim.fn.system("hyprctl switchxkblayout " .. keyboard .. " " .. en_layout)
	end,
	group = group,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if insert_layout == en_layout then
			return
		end
		vim.fn.system("hyprctl switchxkblayout " .. keyboard .. " " .. insert_layout)
	end,
	group = group,
})
