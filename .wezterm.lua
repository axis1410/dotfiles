local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
	font_size = 15,
	window_decorations = "RESIZE",
	color_scheme = "Oxocarbon Dark (Gogh)",
	native_macos_fullscreen_mode = true,
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
}
local function center_window_once(window)
	wezterm.GLOBAL.windows_centered = wezterm.GLOBAL.windows_centered or {}
	local window_id = window:window_id() .. ""
	if wezterm.GLOBAL.windows_centered[window_id] then
		return
	end

	local screen = wezterm.gui.screens().active

	-- Set window size to 80% of screen size
	local width = screen.width * 0.95
	local height = screen.height * 0.95

	window:set_inner_size(width, height)

	-- Calculate center position
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
