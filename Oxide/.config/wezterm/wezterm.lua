local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Oxocarbon Dark'
config.enable_tab_bar = false
config.font = wezterm.font 'IosevkaTermNerdFont'
config.font_size = 13
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"

return config
