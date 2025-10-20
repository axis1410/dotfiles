local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	font = wezterm.font("MonaSpiceNe Nerd Font Mono"),
	dpi = 75,
	max_fps = 120,
	enable_kitty_graphics = true,
	-- color_scheme = "Tomorrow (dark) (terminal.sexy)",
	color_scheme = "Catppuccin Mocha",
	native_macos_fullscreen_mode = true,
	window_background_opacity = 0.75,
	macos_window_background_blur = 90,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
	keys = {
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
	window_decorations = "RESIZE",
}

local function center_window_once(window)
	wezterm.GLOBAL.windows_centered = wezterm.GLOBAL.windows_centered or {}
	local window_id = window:window_id() .. ""
	if wezterm.GLOBAL.windows_centered[window_id] then
		return
	end

	local screen = wezterm.gui.screens().active
	local width = screen.width * 0.85
	local height = screen.height * 0.85

	window:set_inner_size(width, height)

	local dimensions = window:get_dimensions()
	local x = (screen.width - dimensions.pixel_width) / 2
	local y = (screen.height - dimensions.pixel_height) / 2

	wezterm.GLOBAL.windows_centered[window_id] = true

	window:set_position(x, y)
end

wezterm.on("update-status", function(window)
	center_window_once(window)
end)

return config
