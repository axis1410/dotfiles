-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	dependencies = {
-- 		{
-- 			"L3MON4D3/LuaSnip",
-- 			build = (function()
-- 				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
-- 					return
-- 				end
-- 				return "make install_jsregexp"
-- 			end)(),
-- 			dependencies = {
-- 				{
-- 					"rafamadriz/friendly-snippets",
-- 					config = function()
-- 						require("luasnip.loaders.from_vscode").lazy_load()
-- 					end,
-- 				},
-- 			},
-- 		},
-- 		"saadparwaiz1/cmp_luasnip",
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-path",
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		local luasnip = require("luasnip")
-- 		luasnip.config.setup({})
--
-- 		local kind_icons = {
-- 			Text = "󰉿",
-- 			Method = "m",
-- 			Function = "󰊕",
-- 			Constructor = "",
-- 			Field = "",
-- 			Variable = "󰆧",
-- 			Class = "󰌗",
-- 			Interface = "",
-- 			Module = "",
-- 			Property = "",
-- 			Unit = "",
-- 			Value = "󰎠",
-- 			Enum = "",
-- 			Keyword = "󰌋",
-- 			Snippet = "",
-- 			Color = "󰏘",
-- 			File = "󰈙",
-- 			Reference = "",
-- 			Folder = "󰉋",
-- 			EnumMember = "",
-- 			Constant = "󰇽",
-- 			Struct = "",
-- 			Event = "",
-- 			Operator = "󰆕",
-- 			TypeParameter = "󰊄",
-- 		}
--
-- 		cmp.setup({
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
--
-- 			snippet = {
-- 				expand = function(args)
-- 					luasnip.lsp_expand(args.body)
-- 				end,
-- 			},
-- 			completion = {
-- 				completeopt = "menu,menuone,noinsert",
-- 			},
--
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-n>"] = cmp.mapping.select_next_item(),
-- 				["<C-p>"] = cmp.mapping.select_prev_item(),
-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
--
-- 				-- Add back the CR mapping to accept completions
-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
--
-- 				-- Manually trigger completion with Ctrl-Space
-- 				["<C-Space>"] = cmp.mapping.complete(),
--
-- 				["<C-y>"] = cmp.mapping.confirm({
-- 					behavior = cmp.ConfirmBehavior.Insert,
-- 					select = true,
-- 				}),
--
-- 				["<C-l>"] = cmp.mapping(function()
-- 					if luasnip.expand_or_locally_jumpable() then
-- 						luasnip.expand_or_jump()
-- 					end
-- 				end, { "i", "s" }),
-- 				["<C-h>"] = cmp.mapping(function()
-- 					if luasnip.locally_jumpable(-1) then
-- 						luasnip.jump(-1)
-- 					end
-- 				end, { "i", "s" }),
--
-- 				["<Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_next_item()
-- 					elseif luasnip.expand_or_locally_jumpable() then
-- 						luasnip.expand_or_jump()
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_prev_item()
-- 					elseif luasnip.locally_jumpable(-1) then
-- 						luasnip.jump(-1)
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 			}),
-- 			sources = cmp.config.sources({
-- 				{
-- 					name = "nvim_lsp",
-- 				},
-- 				{
-- 					name = "luasnip",
-- 				},
-- 			}, {
-- 				{
-- 					name = "buffer",
-- 				},
-- 				{
-- 					name = "path",
-- 				},
-- 			}),
-- 			formatting = {
-- 				fields = { "kind", "abbr", "menu" },
-- 				format = function(entry, vim_item)
-- 					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
-- 					vim_item.menu = ({
-- 						nvim_lsp = "[LSP]",
-- 						luasnip = "[Snippet]",
-- 						buffer = "[Buffer]",
-- 						path = "[Path]",
-- 					})[entry.source.name]
-- 					return vim_item
-- 				end,
-- 			},
-- 		})
-- 	end,
-- }

return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		build = "cargo +nightly build --release",
		opts = {
			snippets = {
				expand = function(snippet)
					vim.snippet.expand(snippet.body)
				end,
			},
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			fuzzy = {
				implementation = "prefer_rust",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			keymap = {
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-Space>"] = { "show" },
				["<C-y>"] = { "select_and_accept" },
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},
		},
	},
}
