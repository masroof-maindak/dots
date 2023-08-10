-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local menubar = require("menubar") -- EVENTUALLY REMOVE THIS WHEN I MAKE AN APP RUNNER WIDGET

local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")



-- {{{ Key bindings
globalkeys = gears.table.join(

    -- Other. Remove eventually.
    awful.key({ mod,           }, "w", function () mymainmenu:show() end,
        {description = "show main menu", group = "awesome"}),
    awful.key({ mod,           }, "s",      hotkeys_popup.show_help,
        {description="show help", group="awesome"}),

    -- Navigation
    awful.key({ mod,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end, {description = "focus next by index", group = "client"}
    ),
    awful.key({ mod,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end, {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ mod, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ mod, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ mod,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ mod,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    -- Standard program
    awful.key({ mod }, "Return", function () awful.spawn(terminal) end,
        {description = "open a terminal", group = "launcher"}
    ),
    awful.key({ mod, "Shift" }, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}
    ),

    -- Workspace cycle.
    awful.key(
        { mod }, "Tab", function() 
            awful.tag.viewnext(s)
        end,
        { description = "next tag", group = "awesome" }
    ),
    awful.key(
        { mod, "Shift" }, "Tab", function() 
            awful.tag.viewprev(s) 
        end,
        { description = "previous tag", group = "awesome" }
    ),

    -- Layout cycle.
    awful.key(
        { mod }, "space", function() 
		    awful.layout.inc(1) 
	    end,
 	    { description = "next layout", group = "awesome" }
	),
    awful.key(
		{ mod, "Shift" }, "space", function() 
			awful.layout.inc(-1) 
		end,
 		{ description = "previous layout", group = "awesome" }
	),

    awful.key({ mod, "Control" }, "n",
        function ()
            local c = awful.client.restore()
            if c then
              c:emit_signal(
                  "request::activate", "key.unminimize", {raise = true}
              )
            end
        end,
    {description = "restore minimized", group = "client"}),

    awful.key(
		{ mod }, "c", 
		function(c) 
			awful.placement.centered(c, { honor_workarea = true }) 
		end,
		{ description = "center window", group = "client" }
	),

    -- Menubar
    awful.key({ mod }, "d", function() menubar.show() end,
        {description = "show the menubar", group = "launcher"}),

    --SCREENSHOTS
    awful.key({mod}, "p", function()
      awful.spawn({ "maim", "-s", string.format("%s/%s.png", os.getenv("HOME"), os.time()) })
    end, {description = "Screenshot selection"}),
    awful.key({mod, "Shift"} , "p", function()
      awful.spawn("shotgun")
    end, {description = "Screenshot"})
)

-- Fullscreen/Quit/Minimize/Maximize/Close/Swap w/ Master
clientkeys = gears.table.join(
    awful.key({ mod }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ mod }, "q",      function (c) c:kill()                         
        end,{description = "close", group = "client"}),
    awful.key(
		{ mod }, "n", 
		function(c)
			client.focus.minimized = true
		end,
    	{ description = "minimize", group = "client" }
	),
	awful.key(
		{ mod }, "m", 
		function(c)
			c.maximized = not c.maximized
			c:raise()
		end,
    	{ description = "toggle maximize", group = "client" }
	),
    awful.key({ mod, "Control" }, "space",  awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
    awful.key({ mod, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) 
        end, {description = "move to master", group = "client"})
)


-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ mod }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   tag:view_only()
                end
        end, {description = "view tag #"..i, group = "tag"}),

        -- Move client to tag.
        awful.key({ mod, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
               end
        end, {description = "move focused client to tag #"..i, group = "tag"}),

        -- Move client to tag and focus it.
        awful.key({ mod, "Control" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                        tag:view_only()
                    end
               end
        end, {description = "move client and shift focus to #"..i, group = "tag"})
        
    )
end


-- Some mouse shit?
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ mod }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ mod }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}