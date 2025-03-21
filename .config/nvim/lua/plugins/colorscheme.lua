return {
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
			vim.cmd.colorscheme("onedark")
		end,
	},
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	{ "decaycs/decay.nvim" },
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				borderless_pickers = true,
				saturation = 1,
				cache = true,
				extensions = {
					telescope = true,
				},
			})
		end,
	},
	{ "olimorris/onedarkpro.nvim", priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "shaunsingh/nord.nvim", priority = 1000, lazy = false },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
	{ "neko-night/nvim", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = false, priority = 1000 },
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode").setup({})
		end,
	},
}
