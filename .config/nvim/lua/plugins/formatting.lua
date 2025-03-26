return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fr",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,

			mode = "",
			desc = "Format Buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			go = { "golines", "gofumpt", "goimports" },
			python = { "ruff", "ruff_organize_imports", "ruff_format" },
			lua = { "stylua" },
			toml = { "pyproject-fmt" },
		},
		format_on_save = {
			lsp_format = true,
			async = false,
			timeout_ms = 500,
		},
		formatters = {
			ruff = {
				prepend_args = { "--config", vim.fn.expand("~/.config/nvim/ruff.toml") },
			},
			ruff_format = {
				prepend_args = { "--config", vim.fn.expand("~/.config/nvim/ruff.toml") },
			},
			ruff_organize_imports = {
				prepend_args = { "--config", vim.fn.expand("~/.config/nvim/ruff.toml") },
			},
		},
	},
}
