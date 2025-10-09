return {
	"tamton-aquib/staline.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- Make sure gitsigns is installed
	},
	config = function()
		-- Setup stabline (top bufferline)
		require("stabline").setup({
			font_active = "none",
			stab_start = "  %#Identifier#  ",
			stab_bg = "none",
			stab_left = "",
			inactive_fg = "none",
			fg = "#95c561",
		})

		-- Setup staline (bottom statusline)
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
				},
			},
			mode_colors = {
				n = "#95c561", -- Normal
				i = "#fabd2f", -- Insert
				c = "#fe8019", -- Command
				v = "#ff00ff", -- Visual (this is now magenta)
			},
			defaults = {
				fg = "#ffffff",
				bg = "none",
				true_colors = true,
				line_column = " [%l:%c] ",
				font_active = "none",
			},
		})

		-- Optional: Setup gitsigns
		-- require("gitsigns").setup()
	end,
}
