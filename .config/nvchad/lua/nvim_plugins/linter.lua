return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
			}

			lint.linters.ruff = {
				cmd = "ruff",
				stdin = false,
				args = { "check", "--output-format", "text", "--quiet" },
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat(
					[[%f:%l:%c: %m]],
					{ source = "ruff", severity = vim.diagnostic.severity.WARN }
				),
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
