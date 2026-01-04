return {
	{ "folke/tokyonight.nvim", lazy = false },
	{ "rose-pine/neovim", lazy = false, name = "rose-pine" },
	{ "nickkadutskyi/jb.nvim", lazy = false, priority = 100 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{ "deparr/tairiki.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/sonokai", lazy = false },
	{ "Shatur/neovim-ayu", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{ "frenzyexists/aquarium-vim", lazy = false },
	{
		"sainnhe/edge",
		lazy = false,
		config = function()
			vim.g.edge_better_performance = 1
			vim.g.edge_enable_italic = 1
			vim.g.edge_dim_inactive_windows = 1
		end,
	},
	{
		"axis1410/cursor-dark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cursor-dark").setup({
				-- style = "dark-midnight",
				-- transparent = false,
				-- dashboard = true,
			})
		end,
	},

	-- {
	-- 	"ydkulks/cursor-dark.nvim",
	-- 	-- branch = "fix/broken-navigation-binds",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cursor-dark").setup({
	-- 			-- style = "dark-midnight",
	-- 			-- transparent = false,
	-- 			-- dashboard = true,
	-- 		})
	-- 	end,
	-- },

	-- { "neanias/everforest-nvim", lazy = false },
	-- { "decaycs/decay.nvim", lazy = false },
	-- { "nkxxll/ghostty-default-style-dark.nvim", lazy = false, priority = 1000, name = "Ghostty Theme" },
	-- { "thembones79/mine-pine", name = "mine-pine", lazy = false, priority = 1000 },
	-- { "tiagovla/tokyodark.nvim", lazy = false, priority = 1000 },
	-- { "datsfilipe/min-theme.nvim", lazy = false, priority = 1000 },
	-- { "github-main-user/lytmode.nvim", lazy = false, priority = 1000 },
	-- { "olivercederborg/poimandres.nvim", lazy = false, priority = 1000, opts = {} },
	-- { "rafamadriz/neon", lazy = false, priority = 1000 },
	-- { "embark-theme/vim", lazy = false, priority = 1000, name = "embark" },
	-- { "vague2k/vague.nvim" },
	-- { "rebelot/kanagawa.nvim", lazy = false },
	-- { "nyoom-engineering/oxocarbon.nvim", lazy = false, priority = 1000 },
	-- { "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
	-- { "realbucksavage/riderdark.vim", lazy = false, priority = 1000 },
	-- { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
	-- { "projekt0n/github-nvim-theme", name = "github-theme" },

	-- {
	-- 	"glepnir/zephyr-nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- },

	-- {
	-- 	"ray-x/starry.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		italics = {
	-- 			comments = true,
	-- 			strings = true,
	-- 			keywords = true,
	-- 		},
	-- 		style = {
	-- 			name = "mariana",
	-- 		},
	-- 	},
	-- },

	-- {
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup()
	-- 	end,
	-- },

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

				style = "warmer",
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

	-- {
	-- 	"AlexvZyl/nordic.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nordic").load()
	-- 	end,
	-- },

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

	-- { "olimorris/onedarkpro.nvim", priority = 1000, lazy = false, name = "OneDark Pro" },
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

	-- {
	-- 	"Mofiqul/adwaita.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.adwaita_darker = false
	-- 		vim.g.adwaita_disable_cursorline = false
	-- 		vim.g.adwaita_transparent = false
	-- 	end,
	-- },
}
