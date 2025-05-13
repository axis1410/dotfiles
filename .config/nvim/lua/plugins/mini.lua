return {
	{
		"echasnovski/mini.bracketed",
		version = false,
		config = function()
			require("mini.bracketed").setup()
		end,
	},
	{
		"echasnovski/mini.move",
		version = false,
		config = function()
			require("mini.move").setup({
				mappings = {
					left = "<S-h>",
					right = "<S-l>",
					up = "<S-k>",
					down = "<S-j>",
					line_left = "<S-h>",
					line_right = "<S-l>",
					line_down = "<S-j>",
					line_up = "<S-k>",
				},
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup()
		end,
	},

	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("mini.animate").setup({
				scroll = {
					enable = false,
				},
				cursor = {
					enable = false,
				},
				showkeys = {
					enable = true,
					timeout = 1000,
					width = 25,
					style = {
						position = "br",
						bg = "#1a1b26",
						fg = "#a9b1d6",
						border = "rounded",
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "sa", -- Add surroundings in Normal and Visual modes
					delete = "sd", -- Delete surroundings
					find = "sf", -- Find surroundings (to the right)
					find_left = "sF", -- Find surroundings (to the left)
					highlight = "sh", -- Highlight surroundings
					replace = "sr", -- Replace surroundings
					update_n_lines = "sn", -- Update `n_lines`
				},
			})
		end,
		opts = {
			mappings = {
				add = "sa", -- Add surroundings in Normal and Visual modes
				delete = "sd", -- Delete surroundings
				find = "sf", -- Find surroundings (to the right)
				find_left = "sF", -- Find surroundings (to the left)
				highlight = "sh", -- Highlight surroundings
				replace = "sr", -- Replace surroundings
				update_n_lines = "sn", -- Update `n_lines`
			},
		},
	},
	{
		"echasnovski/mini.starter",
		config = function()
			require("mini.starter").setup({})
		end,
	},
}
