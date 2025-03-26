local present, Path = pcall(require, "plenary.path")
local M = {}

if not present then
	vim.notify("plenary not found", vim.log.levels.WARN)
	return {
		load = function() end,
		save = function() end,
	}
end

-- store data in a json files (per project)
-- based on https://github.com/ThePrimeagen/harpoon/blob/0378a6c428a0bed6a2781d459d7943843f374bce/lua/harpoon/data.lua
--
local data_path = string.format("%s/flytaly-cfg", vim.fn.stdpath("data"))
local ensured_data_path = false

local function ensure_data_path()
	if ensured_data_path then
		return
	end

	local path = Path:new(data_path)
	if not path:exists() then
		path:mkdir()
	end
	ensured_data_path = true
end

local function hash(path)
	return vim.fn.sha256(path)
end

local function get_root_dir()
	return vim.loop.cwd()
end

local function get_fullpath()
	local h = hash(get_root_dir())
	return string.format("%s/%s.json", data_path, h)
end

local function write_data(data)
	ensure_data_path()
	Path:new(get_fullpath()):write(vim.json.encode(data), "w")
end

local function read_data()
	local path = Path:new(get_fullpath())
	local exists = path:exists()

	if not exists then
		return {}
	end

	local out_data = path:read()

	if not out_data or out_data == "" then
		write_data({})
		out_data = "{}"
	end
	local data = vim.json.decode(out_data)
	return data
end

M.save = function(data)
	write_data(data)
end

M.load = function()
	return read_data()
end

return M
