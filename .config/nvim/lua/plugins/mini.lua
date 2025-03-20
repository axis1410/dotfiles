return {
	{
		"echasnovski/mini.completion",
		version = false,
		config = function()
			require("mini.completion").setup({

				delay = {
					completion = 100,
					info = 100,
					signature = 50,
				},

				trigger_by_fallback = true,
				tab_direction = "next",
				lsp_completion = {
					source_func = "omnifunc",
					auto_setup = true,
					skip_status_message = false,
				},
				fallback_completion = {
					sources = {
						"path",
						"buffers",
						"dictionary",
						"spell",
					},
				},
				window = {
					info = { border = "single", height = 25, width = 80 },
					signature = { border = "single", height = 25, width = 80 },
				},
				mappings = {
					force_completion = "<C-Space>",
					cancel = "<C-e>",
					confirm = "<CR>",
					select_next = "<Tab>",
					select_prev = "<S-Tab>",
				},
			})

			vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
			vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
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

			local function section_time()
				return os.date("%H:%M")
			end

			local function short_filename(args)
				args = args or {}
				local trunc_width = args.trunc_width or 0
				local filename = statusline.section_filename({ trunc_width = trunc_width })

				filename = filename:gsub(vim.env.HOME, "~")
				filename = filename:gsub("([~%w]/)[^/]+/", "%1../"):gsub("%.%./%.%./%.%./", "../")

				return filename
			end

			statusline.setup({
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
						local git = statusline.section_git({ trunc_width = 75 })
						local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
						local filename = short_filename({ trunc_width = 140 })
						local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
						local location = statusline.section_location({ trunc_width = 75 })
						local time = section_time()

						return statusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
							"%<",
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=",
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = "MiniStatuslineDevinfo", strings = { time } },
							{ hl = mode_hl, strings = { location } },
						})
					end,
					inactive = function()
						local filename = short_filename({ trunc_width = 140 })
						return statusline.combine_groups({
							{ hl = "MiniStatuslineInactive", strings = { filename } },
						})
					end,
				},
				use_icons = true,
				set_vim_settings = true,
			})

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
