local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruvbox light, soft (base16)'
config.enable_tab_bar = false
config.font = wezterm.font 'ProggyClean Nerd Font'
config.font_size = 18
config.window_close_confirmation = 'NeverPrompt'

return config
