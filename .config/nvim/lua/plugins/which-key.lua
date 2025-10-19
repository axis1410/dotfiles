return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",

			layout = {
				width = { min = 20, max = 50 },
				spacing = 3,
			},

			win = {
				border = "rounded",
				no_overlap = false,
				padding = { 1, 2 },
				title = true,
				title_pos = "center",
				zindex = 1000,
			},

			column = "right",
			align = "bottom",
			debounce = 200,

			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
		},

		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
