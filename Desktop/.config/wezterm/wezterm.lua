local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('Maple Mono')
config.font_size = 13.5

wezterm.on (
  'format-tab-title',
  function(tab)
    local tab_bg = "#211d13"
    local accent = "#db930d"
    local text = tab_bg
    if not tab.is_active then
      accent = "#4d3f32"
      text = "#b8a58C"
    end
      return wezterm.format({
        { Background = { Color = tab_bg } },
        { Foreground = { Color = accent } },
        { Text = ' ' .. wezterm.nerdfonts.ple_left_half_circle_thick },
        { Background = { Color = accent } },
        { Foreground = { Color = text } },
        { Text = tostring(tab.tab_index + 1) .. ': ' .. tab.active_pane.title },
        { Background = { Color = tab_bg } },
        { Foreground = { Color = accent } },
        { Text = wezterm.nerdfonts.ple_right_half_circle_thick .. ' '},
      })
  end
)

config.window_close_confirmation = 'NeverPrompt'

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 38

config.colors = {
  tab_bar = {
    background = '#211d13',

    active_tab = {
      bg_color = '#ebe0bb',
      fg_color = '#242015',
      -- "Half", "Normal" or "Bold"
      intensity = 'Bold',
      -- "None", "Single" or "Double"
      underline = 'None',
      -- true/false
      italic = false,
      -- true/false
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = '#211d13',
      fg_color = '#ebe0bb',
      intensity = 'Half',
    },

    inactive_tab_hover = {
      bg_color = '#3a3124',
      fg_color = '#db930d',
      italic = true,
    },
  },
}

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

config.inactive_pane_hsb = {saturation = 1.0, brightness = 1.0}
config.window_padding = {left = 24, right = 24, top = 24, bottom = 24}

return config