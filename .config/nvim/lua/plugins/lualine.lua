return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- local function python_venv()
		-- 	local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
		-- 	if venv then
		-- 		return " " .. vim.fn.fnamemodify(venv, ":t")
		-- 	end
		-- 	return ""
		-- end

		-- local function lsp_status()
		-- 	local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
		-- 	if #buf_clients == 0 then
		-- 		return "  No LSP"
		-- 	end
		-- 	local names = {}
		-- 	for _, client in ipairs(buf_clients) do
		-- 		table.insert(names, client.name)
		-- 	end
		-- 	return "  " .. table.concat(names, ", ")
		-- end

		local function cwd()
			return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		end

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree", "NvimTree" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
						separator = { left = "", right = "" },
						color = {
							fg = "#1a1b26",
							-- bg = "#7aa2f7",
							gui = "bold",
						},
					},
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = " ", modified = "柳", removed = " " },
						colored = true,
						cond = hide_in_width,
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
					-- { cwd, color = { fg = "#7aa2f7", gui = "bold" }, cond = hide_in_width },
					-- { python_venv, color = { fg = "#e0af68" }, cond = hide_in_width },
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

					-- { lsp_status, color = { fg = "#9ece6a" }, cond = hide_in_width },

					-- {
					-- 	"fileformat",
					-- 	icons_enabled = true,
					-- 	symbols = { unix = "", dos = "", mac = "" },
					-- 	color = { fg = "#bb9af7" },
					-- },

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
