local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Rosé Pine Dawn (base16)'
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.font = wezterm.font('IosevkaTermNerdFont')
config.font_size = 14
config.window_padding = {
  left = 15,
  right = 15,
  top = 10,
  bottom = 5,
}

return config
