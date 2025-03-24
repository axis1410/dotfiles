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
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "olimorris/onedarkpro.nvim", priority = 1000, lazy = false },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({})
		end,
	},
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	-- { "decaycs/decay.nvim" },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "shaunsingh/nord.nvim", priority = 1000, lazy = false },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
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
