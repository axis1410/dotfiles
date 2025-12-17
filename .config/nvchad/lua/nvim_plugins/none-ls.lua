return {
	{
		"nvimtools/none-ls.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"jay-babu/mason-null-ls.nvim",
			"williamboman/mason.nvim",
		},
		config = function()
			local none_ls = require("none-ls")
			
			-- Define the sources first so we can reference them for the automatic installation
			local sources = {
				-- Python formatting
				require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
				require("none-ls.formatting.ruff_format"),
				
				-- JavaScript/TypeScript/JSON/YAML/etc formatting
				none_ls.builtins.formatting.prettier.with({ 
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "html", "json", "yaml", "markdown" },
					extra_args = { "--single-quote", "--tab-width", "4" }
				}),
				
				-- Shell formatting
				none_ls.builtins.formatting.shfmt.with({ args = { "-i", "4" } }),
				
				-- Lua formatting
				none_ls.builtins.formatting.stylua,
				
				-- Diagnostics
				none_ls.builtins.diagnostics.eslint_d,
				none_ls.builtins.diagnostics.yamllint,
			}
			
			-- Extract the source names for automatic installation
			local source_names = {}
			for _, source in ipairs(sources) do
				local name = source._opts and source._opts.name or source.name
				if name then
					table.insert(source_names, name)
				end
			end
			
			-- Add additional tools we want to ensure are installed
			table.insert(source_names, "stylua")
			table.insert(source_names, "ruff")
			table.insert(source_names, "prettier")
			table.insert(source_names, "shfmt")
			
			-- Setup Mason with the collected sources
			require("mason-null-ls").setup({
				ensure_installed = source_names,
				automatic_installation = true,
				handlers = {},
			})

			-- Format on save setup
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			none_ls.setup({
				sources = sources,
				debug = false,
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function() 
								-- Fast formatting without waiting
								vim.lsp.buf.format({
									async = false,
									timeout_ms = 2000,
									filter = function(client)
										-- Use none-ls for formatting over other LSP clients
										return client.name == "none-ls"
									end
								}) 
							end
						})
					end
				end,
			})
		end,
	},
}

