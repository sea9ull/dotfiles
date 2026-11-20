-- ====================
-- Device
-- ====================

hl.device({
    name = "kensington-expert-wireless-tb-mouse",
    scroll_method = "on_button_down",
    -- button 8,
    scroll_button = 275,
    -- button 2
    -- scroll_button = 274
    -- middle_button_emulation = true
    sensitivity = 0.5
})

hl.device({
    name = "kensington-expert-mouse",
    scroll_method = "on_button_down",
    -- button 8,
    scroll_button = 275,
    -- button 2
    -- scroll_button = 274
    -- middle_button_emulation = true
    sensitivity = 0.5
})

hl.device({
    name = "elecom-trackball-mouse-huge-trackball-1",
    scroll_method = "on_button_down",
    -- button 8,
    scroll_button = 275,
    -- button 2
    -- scroll_button = 274
    -- middle_button_emulation = true
    sensitivity = 0.5
})

hl.bind("mouse:276", hl.dsp.exec_cmd("ydotool click 0xC1"), {devices = { inclusive = true, list = { "elecom-trackball-mouse-huge-trackball-1"}}})
--hl.bind("mouse:276", hl.dsp.exec_cmd("wtype -k Menu"), {devices = { inclusive = true, list = { "elecom-trackball-mouse-huge-trackball-1"}}})
hl.bind("mouse:277", hl.dsp.window.fullscreen({"maximized"}), {description = "Maximize", devices = { inclusive = true, list = { "elecom-trackball-mouse-huge-trackball-1"}}})
hl.bind("mouse:278", hl.dsp.focus({ workspace = "e+1"}), {devices = { inclusive = true, list = { "elecom-trackball-mouse-huge-trackball-1"}}})
-- hl.bind("mouse:273", hl.dsp.exec_cmd("ydotool click 0xC1"), {devices = { inclusive = true, list = { "elecom-trackball-mouse-huge-trackball-1"}}})
hl.bind("mouse:279", hl.dsp.window.close(), {devices = { inclusive = true, list = { "elecom-trackball-mouse-huge-trackball-1"}}})
