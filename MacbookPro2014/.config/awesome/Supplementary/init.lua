local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init ("~/.config/awesome/themes/gruvbox/theme.lua")
beautiful.useless_gap = 10

-- This is used later as the default terminal and editor to run.
terminal = "wezterm"
editor = os.getenv("EDITOR")
editor_cmd = terminal .. " -e " .. editor
mod = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    --normal
    awful.layout.suit.spiral.dwindle, 
    
    --master
    awful.layout.suit.tile,

    --floating
    awful.layout.suit.floating,
}
-- }}}