return {
	{ "folke/tokyonight.nvim", lazy = false },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "soft"
		end,
	},
	{ "sainnhe/edge", lazy = false },
	{ "sainnhe/sonokai", lazy = false },
	{ "rose-pine/neovim", lazy = false, name = "rose-pine" },
	-- { "morhetz/gruvbox", lazy = false, priority = 1000 },
	-- { "shaunsingh/oxocarbon.nvim", lazy = false, priority = 1000 },
	-- { "decaycs/decay.nvim" },

	-- { "projekt0n/github-nvim-theme", name = "github-theme" },
	-- { "ss77a/carbonfox.nvim", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({

				style = "darker",
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},
			})
		end,
	},
	{
		"vague2k/vague.nvim",
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({})
		end,
	},

	-- { "olimorris/onedarkpro.nvim", priority = 1000, lazy = false },
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup({})
	-- 	end,
	-- },
	-- {
	-- 	dir = vim.fn.stdpath("config") .. "/lua/plugins/themes/vercel.lua",
	-- 	name = "midnight_noir",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("lua.plugins.themes.vercel").setup()
	-- 	end,
	-- },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "shaunsingh/nord.nvim", priority = 1000, lazy = false },
	-- { "neko-night/nvim", lazy = false, priority = 1000 },
	-- { "nyoom-engineering/oxocarbon.nvim", lazy = false, priority = 1000 },
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("vscode").setup({})
	-- 	end,
	-- },
}
