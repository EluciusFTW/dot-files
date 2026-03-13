local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.font_size = 14
config.line_height = 1.1515
config.color_scheme = "tokyonight_night"

config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.max_fps = 120

config.leader = {
	key = "Space",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

config.keys = {
	{
		key = "w",
		mods = "SUPER",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "d",
		mods = "SUPER | SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.SendString("clear \n"),
	},
	{ key = "-", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{ key = "h", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "l", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "k", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "j", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({
		name = "resize_pane",
		one_shot = false,
	}) },

	{ key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
		-- Press Escape or Enter to exit resize mode
		{ key = "Escape", action = act.PopKeyTable },
		{ key = "Enter", action = act.PopKeyTable },
	},
}

return config
