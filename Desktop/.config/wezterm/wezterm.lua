local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Oxocarbon Dark'
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.font = wezterm.font('Sarasa term sc nerd')
config.font_size = 16
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

return config