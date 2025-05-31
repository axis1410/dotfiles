return {
	{
		"tamton-aquib/staline.nvim",
		config = function()
			require("staline").setup({
				sections = {
					left = { "  ", "mode", " ", "branch", " ", "file_name", "file_size" },
					mid = { "lsp" },
					right = { "line_column", " ", "progress", " " },
				},
				mode_colors = {
					n = "#986fec",
					i = "#51b4c3",
					c = "#e27d60",
					v = "#4da6ff",
				},
				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c",
					branch_symbol = " ",
				},
			})

			require("stabline").setup({
				style = "slant",
				bg = "#986fec",
				fg = "black",
				stab_right = "",
			})
		end,
	},
}
