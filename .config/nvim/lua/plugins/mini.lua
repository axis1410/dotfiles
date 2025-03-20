return {

	{
		"echasnovski/mini.completion",
		version = false,
		config = function()
			require("mini.completion").setup()
		end,
	},
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
			})
		end,
	},
	{
		"echasnovski/mini.statusline",
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup({
				-- Set custom content for sections
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
						local git = statusline.section_git({ trunc_width = 75 })
						local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
						local filename = statusline.section_filename({ trunc_width = 140 })
						local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
						local location = statusline.section_location({ trunc_width = 75 })

						return statusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
							"%<", -- Mark general truncate point
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=", -- Start right alignment
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode_hl, strings = { location } },
						})
					end,
					inactive = function()
						local filename = statusline.section_filename({ trunc_width = 140 })
						return statusline.combine_groups({
							{ hl = "MiniStatuslineInactive", strings = { filename } },
						})
					end,
				},
				-- Use custom colors
				use_icons = true,
				-- Set statusline visibility
				set_vim_settings = true,
			})

			-- Custom highlight groups for better looks
			vim.cmd([[
                highlight MiniStatuslineModeNormal guifg=#1a1b26 guibg=#7aa2f7
                highlight MiniStatuslineModeInsert guifg=#1a1b26 guibg=#9ece6a
                highlight MiniStatuslineModeVisual guifg=#1a1b26 guibg=#bb9af7
                highlight MiniStatuslineModeReplace guifg=#1a1b26 guibg=#f7768e
                highlight MiniStatuslineModeCommand guifg=#1a1b26 guibg=#e0af68
                highlight MiniStatuslineDevinfo guifg=#7aa2f7 guibg=#292e42
                highlight MiniStatuslineFilename guifg=#a9b1d6 guibg=#1a1b26
                highlight MiniStatuslineFileinfo guifg=#a9b1d6 guibg=#1a1b26
                highlight MiniStatuslineInactive guifg=#565f89 guibg=#1a1b26
            ]])
		end,
	},
}
