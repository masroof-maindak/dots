local awful = require("awful")
local beautiful = require("beautiful")


-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
        -- All clients will match this rule.
        { rule = { }, properties = { 
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap+awful.placement.no_offscreen
            }
        },
    
        -- Floating clients.
        { rule_any = {
            instance = {
            },
            class = {
            },
    
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            },
            role = {
                "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
        }, properties = { floating = true }},
    
    
        -- Add titlebars to normal clients and dialogs
        { rule_any = {type = { "normal", "dialog" }}, properties = { 
            titlebars_enabled = true }
        },
    
        -- WORKSPACE RULES
        { rule = { class = "Code" },
          properties = { screen = 1, tag = "1" } },
        { rule = { class = "Firefox" },
          properties = { screen = 1, tag = "2" } },
        { rule = { class = "discord" },
          properties = { screen = 1, tag = "4" } },
        { rule = { class = "Gthumb" },
          properties = { screen = 1, tag = "5" } },
    }
    -- }}}