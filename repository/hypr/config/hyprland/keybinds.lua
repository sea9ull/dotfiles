require("hyprland.variables")

local qsScript = "$HOME/.config/quickshell/$qsConfig/scripts"
local hyprScript = "$HOME/.config/hypr/script"
local qsIpcCall = "qs -c $qsConfig ipc call"
local qsIsAlive = qsIpcCall.." TEST_ALIVE"
-- ===================
--  Apps
-- ===================
hl.bind("SUPER + Return", hl.dsp.exec_cmd(TERMINAL), {description = "Terminal"})
hl.bind("SUPER + X", hl.dsp.exec_cmd(FILE_MANAGER), {description = "File manager"})
hl.bind("SUPER + G", hl.dsp.exec_cmd(BROWSER), {description = "Browser"} )
-- hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show drun") )
hl.bind("SUPER + C", hl.dsp.exec_cmd(COLOR_PICKER), {description = "Color Picker"} )
--hl.bind("SUPER + Slash", hl.dsp.exec_cmd("~/bin/launcher") )
hl.bind("SUPER + Slash", hl.dsp.global("quickshell:launcher"), {description = "Toggle Launcher"} )


--# Screenshot, Record, OCR, Color picker, Clipboard history
hl.bind("SUPER + V", hl.dsp.exec_cmd(
 qsIsAlive.." || pkill fuzzel || cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy"), {description = "Clipboard history >> clipboard"} )
hl.bind("SUPER + Period", hl.dsp.exec_cmd(
 qsIsAlive.." || pkill fuzzel || "..hyprScript.."/fuzzel-emoji.sh copy"), {description = "Emoji >> clipboard"} )

-- ===================
--  Window 
-- ===================
-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind("SUPER + CTRL + SHIFT + ALT + Q", hl.dsp.exec_cmd("systemctl poweroff"), {description = "Shutdown"} ) -- # [hidden] Power off

--# Window split ratio
hl.bind("SUPER + Semicolon", hl.dsp.layout("splitratio +0.1"), {repeating = true} )
hl.bind("SUPER + Colon", hl.dsp.layout("splitratio -0.1"), {repeating = true} )
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill(), {description = "Forcefully zap a window"} )
hl.bind("SUPER + Backspace", hl.dsp.window.close(), {description = "Close a window"} )
hl.bind("SUPER + A", hl.dsp.window.float({action = "toggle"}), {description = "Float/Tile"}  )
hl.bind("SUPER + F", hl.dsp.window.fullscreen({"maximized"}, {description = "Maximize"}) )
-- hl.bind("SUPER + F", hl.dsp.window.fullscreen_state({internal = 0, client = 3}, {description = "Fullscreen spoof"}) )
-- hl.bind("SUPER + F", hl.dsp.window.fullscreen({"fullscreen"}, {description = "Fullscreen"}) )
hl.bind("SUPER + S", hl.dsp.window.move({workspace = "special:special", follow = false, description = "Send to scratchpad"}) )
hl.bind("SUPER + Tab", hl.dsp.window.swap({direction = "left"}) )

local toggle_layout = function ()
    local layout = hl.get_config("general:layout")
    if layout == "dwindle" then
        hl.config({general = {layout = "monocle"}})
    else
        hl.config({general = {layout = "dwindle"}})
    end
end
hl.bind("SUPER + Space", toggle_layout, {repeating = false, description="toggle layout"})

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + L", hl.dsp.focus({ workspace = "e+1"}) )
hl.bind("SUPER + H", hl.dsp.focus({ workspace = "e-1"}) )

local cycle_win = function (value)
    is_monocle = hl.get_config("general:layout") == "monocle"
    hl.dispatch(hl.dsp.window.cycle_next({tiled = is_monocle, next = value}))
end

-- hl.bind("SUPER + K", hl.dsp.layout("cycleprev") )
-- hl.bind("SUPER + J", hl.dsp.layout("cyclenext") )
-- hl.bind("SUPER + K", hl.dsp.window.cycle_next({next = true}))
-- hl.bind("SUPER + J", hl.dsp.window.cycle_next())
hl.bind("SUPER + K", function() cycle_win(false) end, {repeating = false, description="prev window"})
hl.bind("SUPER + J", function() cycle_win(true) end, {repeating = false, description="next window"})
--
hl.bind("SUPER + Right", hl.dsp.focus({ workspace = "e+1"}) )
hl.bind("SUPER + Left", hl.dsp.focus({ workspace = "e-1"}) )
-- hl.bind("SUPER + Up", hl.dsp.layout("cycleprev") )
-- hl.bind("SUPER + Down", hl.dsp.layout("cyclenext") )
hl.bind("SUPER + Up", hl.dsp.window.cycle_next({tiled = true, next = false}) )
hl.bind("SUPER + Down", hl.dsp.window.cycle_next({tiled = true}) )
-- hl.bind("SUPER + Left", hl.dsp.focus({direction = "l"}) )
-- hl.bind("SUPER + Right", hl.dsp.focus({direction = "r"}) )
-- hl.bind("SUPER + Up", hl.dsp.focus({direction = "u"}) )
-- hl.bind("SUPER + Down", hl.dsp.focus({dirction = "d"}) )

local numkeys = {"Q","W","E","R","T"}
-- Switch workspaces with mainMod + [0-9]
for i = 1, 5 do
    hl.bind("SUPER + "..numkeys[i], hl.dsp.focus({ workspace = i}) )
    hl.bind("SUPER + "..i,          hl.dsp.focus({ workspace = i}) )
end
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 5 do
    hl.bind("SUPER + SHIFT + "..numkeys[i], hl.dsp.window.move({ workspace = i, follow = false}) )
    hl.bind("SUPER + SHIFT + "..i,          hl.dsp.window.move({ workspace = i, follow = false}) )
end
-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1"}) )
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1"}) )

-- Move/resize windows with mainMod + LMB/RMB/CMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true, description = "Move"} )
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true, description = "Resize"} )
hl.bind("SUPER + mouse:274", hl.dsp.window.drag(), {mouse = true} )


-- --##! Media
-- local mediaNextCommand = "playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"
-- hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(mediaNextCommand), {locked = true, description = "Next track"} )
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd(mediaNextCommand), {locked = true} )
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {locked = true} )
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true} )
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true} )
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(hyprScript.."/brightness.sh increment"), {locked = true, repeating = true} )
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(hyprScript.."/brightness.sh decrement"), {locked = true, repeating = true} )
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"), {locked = true, repeating = true} )
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), {locked = true, repeating = true} )
-- hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), {locked = true} )
-- hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), {locked = true} )
