local ok, ap = pcall(require, "nvim-autopairs")

if not ok then
	return
end

ap.setup({ fast_wrap = {} })
