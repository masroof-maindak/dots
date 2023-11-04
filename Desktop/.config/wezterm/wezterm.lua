local wezterm = require 'wezterm'
local config = {}

config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

config.font = wezterm.font('Sarasa term sc nerd')
config.font_size = 15

config.color_scheme = "swamp"
config.color_schemes = {
    ["swamp"] = {
        foreground = "#ebe0bb",
        background = "#242015",
        cursor_bg = "#b8a58C",
        cursor_border = "#d2c3a4",
        cursor_fg = "#211d13",
        selection_bg = "#d2c3a4" ,
        selection_fg = "#3a3124",

        ansi = {"#211d13","#a82d56","#7a7653","#db930d", "#91506c","#c1666b", "#508991","#d2c3a4"},
        brights = {"#ebe0bb","#96294d","#736f4e","#e69a0e", "#80465f","#b05d61", "#61a0a8","#d2c3a4"},
    },
}

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

return config