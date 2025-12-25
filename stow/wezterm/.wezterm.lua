-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 14
config.line_height = 1.1515
config.color_scheme = "tokyonight_night"

config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.max_fps = 120

config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "d",
		mods = "CMD | CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD | SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SendString("clear \n"),
	},
}
return config
