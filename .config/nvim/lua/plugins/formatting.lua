-- return {
-- 	"stevearc/conform.nvim",
-- 	event = { "BufWritePre" },
-- 	cmd = { "ConformInfo" },
-- 	keys = {
-- 		{
-- 			"<leader>fr",
-- 			function()
-- 				require("conform").format({ async = true, lsp_fallback = true })
-- 			end,
-- 			mode = "",
-- 			desc = "Format buffer",
-- 		},
-- 	},
-- 	opts = {
-- 		formatters_by_ft = {
-- 			javascript = { "prettier" },
-- 			typescript = { "prettier" },
-- 			javascriptreact = { "prettier" },
-- 			typescriptreact = { "prettier" },
-- 			vue = { "prettier" },
-- 			css = { "prettier" },
-- 			html = { "prettier" },
-- 			json = { "prettier" },
-- 			yaml = { "prettier" },
-- 			markdown = { "prettier" },
-- 			go = { "golines", "gofumpt", "goimports" },
-- 			python = { "ruff", "ruff_organize_imports", "ruff_format" },
-- 		},
-- 		format_on_save = {
-- 			timeout_ms = 500,
-- 			lsp_fallback = true,
-- 		},
-- 	},
-- }

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
		},
		format_on_save = {
			lsp_format = true,
			async = false,
			timeout_ms = 500,
		},
	},
}
