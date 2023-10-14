# onionLib

Onion library is a free ui library that I made

This is my first ui lib that i have made, and I plan to make more in the future

Made by .tip5 on discord

# Features
Buttons
Sliders
Toggles
Keycodes
Textboxes
Notifications

# Starting the ui
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tip52/onionLib/main/main.lua"))()
local mainWin = Library:Window("OnionLib example")
```
# Tabs
```lua
local tab1 = mainWin:CreateTab({"tab1","http://www.roblox.com/asset/?id=7436811843"}) -- name, icon
```
# Lines
Lines kind of act as a separator between parts of the ui
```lua
tab1:Line("This is a line")
```
# Notifications
```lua
mainWin:Notification({"Title", "Description", 2}) -- Title, description, time
```
# Buttons
```lua
tab1:Button("Get notified",function() --text, callback
  mainWin:Notification({"Notif", "this is notification", 2})
end)
```
# Toggles
```lua
tab1:Toggle("Toggle test",true,function(v) --text, default, callback
  mainWin:Notification({"Notif", tostring(v), 2})
end)
```
# Textboxes
```lua
tab1:TextBox("Select Player",function(v) -- text, callback
  mainWin:Notification({"Notif", tostring(v), 2})
end)
```
# Keycodes
```lua
tab1:Keycode({"Keycode", Enum.KeyCode.E}, function(v) -- text, default key, callback
  local key = tostring(v)
  mainWin:Notification({"Onion Notif", key, 2})
end)
```
# Sliders
```lua
tab1:Slider("This is a slider",{Min = -100, Max = 100, Def = 0},function(v) -- text, minimum, maximum, default, callback
  print("Slider: " .. tostring(v))
end)
```
# Labels
there are 3 types of labels: info, warning, and normal
```lua
tab3:Label("e") -- will default to normal label if no type
tab1:Label("e", "Label")
tab2:Label("e", "Warning")
tab1:Label("e", "Info")
```
# Example ui of all features
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tip52/onionLib/main/main.lua"))()
local mainWin = Library:Window("OnionLib example")
local tab1 = mainWin:CreateTab({"tab1","http://www.roblox.com/asset/?id=7436811843"}) -- name, icon
local tab2 = mainWin:CreateTab({"tab2","http://www.roblox.com/asset/?id=7436811843"}) -- name, icon
tab1:Line("This is a line")
mainWin:Notification({"Title", "Description", 2}) -- Title, description, time
tab1:Button("Get notified",function() --text, callback
    mainWin:Notification({"Notif", "this is notification", 2})
end)
tab1:Toggle("Toggle test",true,function(v) --text, default, callback
    mainWin:Notification({"Notif", tostring(v), 2})
end)
tab1:Toggle("Toggle test",false,function(v) --text, default, callback
    mainWin:Notification({"Notif", tostring(v), 2})
end)
tab1:TextBox("Select Player",function(v) -- text, callback
    mainWin:Notification({"Notif", tostring(v), 2})
end)
tab1:Keycode({"Keycode", Enum.KeyCode.E}, function(v) -- text, default key, callback
    local key = tostring(v)
    mainWin:Notification({"Onion Notif", key, 2})
end)
tab1:Slider("This is a slider",{Min = -100, Max = 100, Def = 0},function(v) -- text, minimum, maximum, default, callback
    print("Slider: " .. tostring(v))
end)
tab1:Label("e") -- will default to normal label if no type
tab1:Label("e", "Label")
tab1:Label("e", "Warning")
tab1:Label("e", "Info")
```
