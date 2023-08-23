local wezterm = require 'wezterm'
-- local colours = require("colors.rose-pine").colors()
local config = {}

-- config.colors = colours
config.color_scheme = 'Everblush'
config.enable_tab_bar = false
config.font = wezterm.font 'cozetteHiDpi'
config.font_size = 26
config.default_cursor_style = 'SteadyUnderline'
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"
config.window_padding = {
    left = 40,
    right = 40,
    top = 40,
    bottom = 40,
}  

return config
