return {
	"b0o/incline.nvim",
	-- event = "VeryLazy",
	config = function()
		require("incline").setup({
			debounce_threshold = { rising = 50, falling = 10 },
			hide = {
				cursorline = false,
			},
			window = {
				padding = 1,
				margin = { horizontal = 0, vertical = 0 },
				placement = { horizontal = "right", vertical = "top" },
			},
			render = function(props)
				local bufname = vim.api.nvim_buf_get_name(props.buf)
				local name = vim.fn.fnamemodify(bufname, ":t")
				if name == "" then
					name = "[No Name]"
				end
				local modified = vim.bo[props.buf].modified and " ●" or ""
				return name .. modified
			end,
		})
	end,
}
