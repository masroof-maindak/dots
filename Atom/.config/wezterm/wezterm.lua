local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Everforest Light (Gogh)'
config.enable_tab_bar = false
config.font = wezterm.font 'cozetteHiDpi'
config.font_size = 26
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"

return config
