return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "󰆧",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "󰕘",
			Module = "󰏓",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "󰕘",
			Keyword = "󰌋",
			Snippet = "󰅴",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "󰠳",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "󰂓",
			Operator = "󰆕",
			TypeParameter = "󰊄",
		}

		-- Custom highlight groups
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C792EA" })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#C792EA" })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9EFFFF" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#FFCB6B" })

		local border_opts = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None,FloatBorder:FloatBorder",
		}

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered({
					border = border_opts.border,
					winhighlight = border_opts.winhighlight,
					scrollbar = false,
					col_offset = -3,
					side_padding = 1,
				}),
				documentation = cmp.config.window.bordered({
					border = border_opts.border,
					winhighlight = border_opts.winhighlight,
					max_width = 50,
					max_height = 30,
					side_padding = 1,
				}),
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
				autocomplete = false, -- Disable automatic completion popup
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Manually trigger completion with Ctrl-Space
				["<C-Space>"] = cmp.mapping.complete({}),

				["<C-y>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Kind icons with padding for better alignment
					vim_item.kind = string.format(" %s %s ", kind_icons[vim_item.kind], vim_item.kind)

					-- Add source info with icons
					vim_item.menu = ({
						nvim_lsp = " LSP",
						luasnip = " Snippet",
						buffer = " Buffer",
						path = " Path",
						lazydev = " LazyDev",
					})[entry.source.name]

					-- Set max width of text with ellipsis
					local label_width = 30
					local label = vim_item.abbr
					if #label > label_width then
						vim_item.abbr = vim.fn.strcharpart(label, 0, label_width) .. "…"
					end

					return vim_item
				end,
			},
			-- Enable experimental features
			experimental = {
				ghost_text = {
					hl_group = "Comment",
				},
			},
			-- Add sorting with priority
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})
	end,
}
