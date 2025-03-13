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
	-- {
	-- 	"echasnovski/mini.starter",
	-- 	version = "*",
	-- 	config = function()
	-- 		local starter = require("mini.starter")
	-- 		starter.setup({
	-- 			-- Set header
	-- 			header = table.concat({
	-- 				[[██╗   ██╗██╗███╗   ███╗]],
	-- 				[[██║   ██║██║████╗ ████║]],
	-- 				[[██║   ██║██║██╔████╔██║]],
	-- 				[[╚██╗ ██╔╝██║██║╚██╔╝██║]],
	-- 				[[ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	-- 				[[  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	-- 			}, "\n"),
	--
	-- 			footer = "VIM btw",
	--
	-- 			-- Configure item sections
	-- 			items = {
	-- 				starter.sections.sessions(),
	-- 				starter.sections.recent_files(10, true),
	-- 				{ name = "New file", action = "enew", section = "Actions" },
	-- 				{ name = "Quit", action = "qall", section = "Actions" },
	-- 				{ name = "Config", action = "e $MYVIMRC", section = "Config" },
	-- 				{ name = "Plugins", action = "e ~/.config/nvim/lua/plugins.lua", section = "Config" },
	-- 				{ name = "Lazy", action = "Lazy", section = "Config" },
	-- 			},
	--
	-- 			-- Set content hooks
	-- 			content_hooks = {
	-- 				starter.gen_hook.adding_bullet("» "),
	-- 				starter.gen_hook.aligning("center", "center"),
	-- 			},
	--
	-- 			-- Customize colors
	-- 			hooks = {
	-- 				before_render = function()
	-- 					vim.cmd([[
	--                            highlight StarterHeader guifg=#61afef
	--                            highlight StarterSection guifg=#98c379
	--                            highlight StarterItem guifg=#abb2bf
	--                            highlight StarterFooter guifg=#c678dd
	--                        ]])
	-- 				end,
	-- 			},
	--
	-- 			-- Set window parameters
	-- 			window = {
	-- 				margin = 3,
	-- 				padding = { 2, 2, 2, 2 },
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
