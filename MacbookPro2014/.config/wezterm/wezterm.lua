local wezterm = require 'wezterm'
local colours = require("colors.rose-pine").colors()
local config = {}

config.colors = colours
config.enable_tab_bar = false
config.font = wezterm.font 'ComicShannsMono Nerd Font'
config.font_size = 12
config.default_cursor_style = 'SteadyUnderline'
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"

return config
