local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.enable_tab_bar = false
config.font = wezterm.font 'IosevkaTerm Nerd Font'
config.font_size = 12
config.default_cursor_style = 'SteadyUnderline'
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"

return config
