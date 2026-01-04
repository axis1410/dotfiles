vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		pcall(require, "core.highlights")
	end,
})
