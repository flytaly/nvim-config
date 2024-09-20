-- Hyprland keyboard layout switcher

if os.getenv("HYPRLAND_INSTANCE_SIGNATURE") == nil then
	return
end

local pkg = "HyprXkbSwitcher"
local group = vim.api.nvim_create_augroup("HyprXkbSwitcher", { clear = true })

local layouts = {
	["English (US)"] = 0,
	["Russian"] = 1,
}

local keyboard = "current" --"my-kmonad-output"
local layout_normal = 0
local layout_insert = layout_normal

local function get_keyboard(keyboards)
	if keyboard == "current" then
		for _, kb in ipairs(keyboards) do
			if kb["main"] == true then
				return kb
			end
		end
	else
		for _, kb in ipairs(keyboards) do
			if kb["name"] == keyboard then
				return kb
			end
		end
	end
end

local function get_layout()
	local output = vim.system({ "hyprctl", "devices", "-j" }, { text = true }):wait().stdout
	if output == "" or output == nil then
		return layout_normal
	end

	local devices = vim.json.decode(output)
	local kb = get_keyboard(devices["keyboards"])
	if kb == nil then
		vim.notify_once("keyboard " .. keyboard .. " not found", vim.log.levels.WARN, { title = pkg })
		return layout_normal
	end
	local layout_name = kb["active_keymap"]

	local layout = layouts[layout_name]
	if layout == nil then
		vim.notify_once("unknown layout name: " .. layout_name, vim.log.levels.WARN, { title = pkg })
		return layout_normal
	end
	return layout
end

vim.api.nvim_create_autocmd("InsertLeavePre", {
	callback = function()
		local ok, result = pcall(get_layout)
		if not ok then
			vim.notify_once("error: " .. result, vim.log.levels.ERROR, { title = pkg })
			return
		end
		layout_insert = result
		if layout_insert ~= layout_normal then
			vim.system({ "hyprctl", "switchxkblayout", keyboard, tostring(layout_normal) })
		end
	end,
	group = group,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if layout_insert ~= layout_normal then
			vim.system({ "hyprctl", "switchxkblayout", keyboard, tostring(layout_insert) })
		end
	end,
	group = group,
})
