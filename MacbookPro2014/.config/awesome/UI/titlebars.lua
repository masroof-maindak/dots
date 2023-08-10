local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

--- TITLEBARS
client.connect_signal("request::titlebars", function(c)
        -- buttons for the titlebar
        local buttons = gears.table.join(
            awful.button({ }, 1, function()
                c:emit_signal("request::activate", "titlebar", {raise = true})
                awful.mouse.client.move(c)
            end),
            awful.button({ }, 3, function()
                c:emit_signal("request::activate", "titlebar", {raise = true})
                awful.mouse.client.resize(c)
            end)
        )
    
        awful.titlebar(c, {position = "right"}) : setup {
            { -- Top
                awful.titlebar.widget.closebutton    (c),
                awful.titlebar.widget.floatingbutton (c),
                awful.titlebar.widget.maximizedbutton(c),
                layout = wibox.layout.fixed.vertical
            },
            { -- Middle
                layout = wibox.layout.flex.vertical
            },
            { -- Bottom
                valign = 'bottom',
                awful.titlebar.widget.minimizebutton (c),
                awful.titlebar.widget.ontopbutton (c),
                layout = wibox.layout.fixed.vertical
            },
            layout = wibox.layout.align.vertical
        }
    end)