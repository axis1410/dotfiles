return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local dashboard = require("dashboard")

			local time = os.date("%H:%M")
			local v = vim.version()
			local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

			local function get_system_info()
				local handle = io.popen("uname -s 2>/dev/null")
				if not handle then
					return "Unknown"
				end
				local os = handle:read("*a"):gsub("\n", "")
				handle:close()
				return os
			end

			dashboard.setup({
				theme = "doom",
				hide = {
					statusline = true,
					tabline = true,
					winbar = true,
				},
				config = {
					header = {
						[[                                                                              ]],
						[[                                                                              ]],
						[[                                                                              ]],
						[[                                                                              ]],
						[[                                                                              ]],
						[[                                                                              ]],
						[[=================     ===============     ===============   ========  ========]],
						[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
						[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
						[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
						[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
						[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
						[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
						[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
						[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
						[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
						[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
						[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
						[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
						[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
						[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
						[[||.=='    _-'                                                     `' |  /==.||]],
						[[=='    _-'                        N E O V I M                         \/   `==]],
						[[\   _-'                                                                `-_   /]],
						[[ `''                                                                      ``' ]],
					},

					center = {
						-- {
						-- 	icon = " ",
						-- 	icon_hl = "GitSignsAdd",
						-- 	desc = "New File",
						-- 	desc_hl = "Text",
						-- 	key = "e",
						-- 	key_hl = "GitSignsAdd",
						-- 	action = "enew",
						-- },
						{
							icon = "󰮗 ",
							icon_hl = "GitSignsAdd",
							desc = "Find File",
							desc_hl = "Text",
							key = "f",
							key_hl = "GitSignsAdd",
							action = "Telescope find_files",
						},
						{
							icon = " ",
							icon_hl = "GitSignsAdd",
							desc = "Find Text",
							desc_hl = "Text",
							key = "t",
							key_hl = "GitSignsAdd",
							action = "Telescope live_grep",
						},
						{
							icon = "󰗼 ",
							icon_hl = "GitSignsAdd",
							desc = "Quit",
							desc_hl = "Text",
							key = "q",
							key_hl = "GitSignsAdd",
							action = "qa",
						},
						{
							icon = "󰏘 ",
							icon_hl = "GitSignsAdd",
							desc = "Change Theme",
							desc_hl = "Text",
							key = "c",
							key_hl = "GitSignsAdd",
							action = "Telescope colorscheme",
						},
					},
					footer = {
						" " .. time .. " ",
						version .. " | " .. get_system_info(),
						" " .. "Rip and Tear" .. " ",
					},
				},
			})
		end,
	},
}
