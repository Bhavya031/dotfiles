local awful = require "awful"
local beautiful = require "beautiful"
local gears = require "gears"

client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  if not awesome.startup then
    awful.client.setslave(c)
  end

  if c.class == "kitty" then
    local i = gears.surface(gears.filesystem.get_configuration_dir() .. "/icons/term.svg")
    c.icon = i._native
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)
