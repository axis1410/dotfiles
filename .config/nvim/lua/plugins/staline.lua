return {
	"tamton-aquib/staline.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		require("stabline").setup({
			font_active = "none",
			stab_start = "  %#Identifier#  ",
			stab_bg = "none",
			stab_left = "",
			inactive_fg = "none",
			fg = "#95c561",
		})

		require("staline").setup({
			sections = {
				left = {
					"  ",
					"mode",
					" ",
					"branch",

					function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return string.format(
								"  +%s ~%s -%s",
								gitsigns.added or 0,
								gitsigns.changed or 0,
								gitsigns.removed or 0
							)
						end
						return ""
					end,
				},
				mid = {},
				right = {
					"lsp",
					" ",
					"line_column",
					" ",
					"cwd",
					" ",
					function()
						local path = vim.fn.expand("%:.")
						return path ~= "" and path or "[No Name]"
					end,
				},
			},
			mode_colors = {
				n = "#95c561",
				i = "#fabd2f",
				c = "#fe8019",
				v = "#ff00ff",
			},
			defaults = {
				fg = "#ffffff",
				bg = "none",
				true_colors = true,
				line_column = " [%l:%c] ",
				font_active = "none",
			},
		})
	end,
}
