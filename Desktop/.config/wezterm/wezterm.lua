local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Mountain'
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.font = wezterm.font('cozetteHiDpi')
config.font_size = 10
config.window_padding = {
  left = 20,
  right = 20,
  top = 25,
  bottom = 5,
}

return config
