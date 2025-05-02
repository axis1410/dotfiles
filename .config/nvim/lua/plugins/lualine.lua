-- return {
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		config = function()
-- 			local mode = {
-- 				"mode",
-- 				fmt = function(str)
-- 					return " " .. str
-- 				end,
-- 			}
--
-- 			local hide_in_width = function()
-- 				return vim.fn.winwidth(0) > 100
-- 			end
--
-- 			local diagnostics = {
-- 				"diagnostics",
-- 				sources = { "nvim_diagnostic" },
-- 				sections = { "error", "warn" },
-- 				symbols = { error = " ", warn = " ", info = " ", hint = " " },
-- 				colored = false,
-- 				update_in_insert = false,
-- 				always_visible = false,
-- 				cond = hide_in_width,
-- 			}
--
-- 			local diff = {
-- 				"diff",
-- 				colored = false,
-- 				symbols = { added = " ", modified = " ", removed = " " },
-- 				cond = hide_in_width,
-- 			}
--
-- 			local time = {
-- 				"datetime",
-- 				style = "%I:%M:%S %p",
-- 			}
--
-- 			require("lualine").setup({
-- 				options = {
-- 					icons_enabled = true,
-- 					section_separators = { left = "", right = "" },
-- 					component_separators = { left = "", right = "" },
-- 					disabled_filetypes = { "alpha", "neo-tree" },
-- 					always_divide_middle = true,
-- 				},
-- 				sections = {
-- 					lualine_a = { mode },
-- 					lualine_b = { "branch" },
-- 					lualine_c = {
-- 						{
-- 							"filename",
-- 							path = 1,
-- 							file_status = true,
-- 						},
-- 					},
-- 					lualine_x = {
-- 						diagnostics,
-- 						diff,
-- 						time,
-- 						{ "encoding", cond = hide_in_width },
-- 						{ "filetype", cond = hide_in_width },
-- 					},
-- 					lualine_y = { "location" },
-- 					lualine_z = { "progress" },
-- 				},
-- 				inactive_sections = {
-- 					lualine_a = {},
-- 					lualine_b = {},
-- 					lualine_c = { { "filename", path = 1 } },
-- 					lualine_x = { { "location", padding = 0 } },
-- 					lualine_y = {},
-- 					lualine_z = {},
-- 				},
-- 				tabline = {},
-- 				extensions = { "fugitive" },
-- 			})
-- 		end,
-- 	},

--

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree", "NvimTree" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", icon = "" },
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = " ", modified = "柳", removed = " " },
						colored = true,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						file_status = true,
						newfile_status = true,
						symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]", newfile = " [New]" },
						shorting_target = 40,
					},
					{
						function()
							return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
						color = { fg = "#7aa2f7", gui = "bold" },
						cond = function()
							return vim.fn.winwidth(0) > 80
						end,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						colored = true,
						update_in_insert = false,
						always_visible = false,
					},
					{ "encoding", fmt = string.upper, color = { fg = "#e0af68" } },
					{ "filetype", icon_only = true },
				},
				lualine_y = { "location" },
				lualine_z = {
					{ "progress" },
					{
						function()
							return os.date(" %H:%M")
						end,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]" },
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive", "nvim-tree", "quickfix" },
		})
	end,
}
