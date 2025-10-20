return {
	{ "thembones79/mine-pine", name = "mine-pine", lazy = false, priority = 1000 },
	{ "tiagovla/tokyodark.nvim", lazy = false, priority = 1000 },
	{ "datsfilipe/min-theme.nvim", lazy = false, priority = 1000 },
	{ "github-main-user/lytmode.nvim", lazy = false, priority = 1000 },
	{ "rafamadriz/neon", lazy = false, priority = 1000 },
	{
		"glepnir/zephyr-nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"ray-x/starry.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			italics = {
				comments = true,
				strings = true,
				keywords = true,
			},
			style = {
				name = "mariana",
			},
		},
	},
	{ "embark-theme/vim", lazy = false, priority = 1000, name = "embark" },
	{ "folke/tokyonight.nvim", lazy = false },
	{ "neanias/everforest-nvim", lazy = false },
	{ "rose-pine/neovim", lazy = false, name = "rose-pine" },
	{ "vague2k/vague.nvim" },
	{ "nickkadutskyi/jb.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "deparr/tairiki.nvim", lazy = false, priority = 1000 },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = false, priority = 1000 },
	{ "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
	{ "realbucksavage/riderdark.vim", lazy = false, priority = 1000 },

	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end,
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "medium"
		end,
	},
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
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/edge", lazy = false },
	{ "sainnhe/sonokai", lazy = false },
	{ "decaycs/decay.nvim", lazy = false },
	{ "projekt0n/github-nvim-theme", name = "github-theme" },

	-- { "morhetz/gruvbox", lazy = false, priority = 1000 },
	-- { "shaunsingh/oxocarbon.nvim", lazy = false, priority = 1000 },

	-- { "ss77a/carbonfox.nvim", lazy = false, priority = 1000 },

	-- {
	-- 	"olivercederborg/poimandres.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("poimandres").setup({})
	-- 	end,
	-- },

	-- { "olimorris/onedarkpro.nvim", priority = 1000, lazy = false },
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup({})
	-- 	end,
	-- },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "shaunsingh/nord.nvim", priority = 1000, lazy = false },
	-- { "neko-night/nvim", lazy = false, priority = 1000 },
	-- { "datsfilipe/vesper.nvim", lazy = false, priority = 1000 },

	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.adwaita_darker = false
			vim.g.adwaita_disable_cursorline = false
			vim.g.adwaita_transparent = false
		end,
	},
}
