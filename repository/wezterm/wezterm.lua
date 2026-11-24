local wezterm = require 'wezterm'
local act = wezterm.action
local TERMINAL_FONT =wezterm.font { family = 'RictyDiscord NF' }
local TERMINAL_FONT_BOLD =wezterm.font { family = 'RictyDiscord NF', weight = 'Bold' }
local KEY_BINDINGS = {
    {mods = 'LEADER', key = 'r', action = act.ReloadConfiguration},
    {mods = 'ALT', key = 'x', action = act.CloseCurrentTab { confirm = true }},
    {mods = 'ALT', key = 'q', action = act.CloseCurrentPane { confirm = true }},
    {mods = 'ALT', key = 'h', action = act.ActivateTabRelative(-1)},
    {mods = 'ALT', key = 'j', action = act.ActivatePaneDirection 'Next'},
    {mods = 'ALT', key = 'k', action = act.ActivatePaneDirection 'Prev'},
    {mods = 'ALT', key = 'l', action = act.ActivateTabRelative(1)},
    {mods = 'ALT', key = 'z', action = act.SplitPane {top_level = true, direction = 'Down', size = { Percent = 50 }}},
    {mods = 'ALT', key = '-', action = act.SplitPane {top_level = true, direction = 'Right', size = { Percent = 50 }}},
    {mods = 'ALT', key = 'f', action = act.SplitPane {top_level = true, direction = 'Left', size = { Percent = 20 }}},
    {mods = 'ALT', key = '|', action = act.SplitPane {top_level = true, direction = 'Down', size = { Percent = 20 }}},
    {mods = 'ALT', key = 'Tab', action = act.RotatePanes 'Clockwise'},
    {mods = 'LEADER', key = 'Space', action = act.Multiple{act.ActivateCopyMode, act.CopyMode { SetSelectionMode = 'Line' }}},
    {mods = 'LEADER', key = '/', action = {Search = {CaseSensitiveString=''}}},
    {mods = 'LEADER', key = 'p', action = act.Paste },
    {mods = 'LEADER', key = 'g', action = act.QuickSelect},
    {mods = 'LEADER', key = 'o', action = act.SpawnTab 'CurrentPaneDomain'},
    {mods = 'LEADER', key = 'm', action = act.Nop},
    {mods = 'LEADER', key = 'M', action = act.Nop},
    {mods = 'LEADER|SHIFT', key = 'M', action = act.Nop},
    {mods = 'LEADER|CTRL', key = 'f', action = act.SendString '\x06'},
    {mods = 'LEADER', key = 'e', action = act.EmitEvent 'nvim-with-scrollback'},
}
local COPY_BINDINGS = {
    {mods = 'NONE', key = 'Escape', action = act.CopyMode 'Close' },
    {mods = 'NONE', key = 'q', action = act.CopyMode 'Close' },
    {mods = 'NONE', key = 'y', action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' }}},
    {mods = 'NONE', key = '0', action = act.CopyMode 'MoveToStartOfLine'},
    {mods = 'NONE', key = '^', action = act.CopyMode 'MoveToStartOfLineContent'},
    {mods = 'SHIFT', key = '^', action = act.CopyMode 'MoveToStartOfLineContent'},
    {mods = 'NONE', key = '$', action = act.CopyMode 'MoveToEndOfLineContent'},
    {mods = 'SHIFT', key = '$', action = act.CopyMode 'MoveToEndOfLineContent'},
    {mods = 'NONE',  key = 'H', action = act.CopyMode 'MoveToViewportTop'},
    {mods = 'SHIFT', key = 'H', action = act.CopyMode 'MoveToViewportTop'},
    {mods = 'NONE',  key = 'L', action = act.CopyMode 'MoveToViewportBottom'},
    {mods = 'SHIFT', key = 'L', action = act.CopyMode 'MoveToViewportBottom'},
    {mods = 'NONE',  key = 'M', action = act.CopyMode 'MoveToViewportMiddle'}, {mods = 'SHIFT', key = 'M', action = act.CopyMode 'MoveToViewportMiddle'}, {mods = 'NONE', key = 'w', action = act.CopyMode 'MoveForwardWord'}, {mods = 'NONE', key = 'b', action = act.CopyMode 'MoveBackwardWord'}, {mods = 'NONE', key = 'h', action = act.CopyMode 'MoveLeft'}, {mods = 'NONE', key = 'j', action = act.CopyMode 'MoveDown'}, {mods = 'NONE', key = 'k', action = act.CopyMode 'MoveUp'},
    {mods = 'NONE', key = 'l', action = act.CopyMode 'MoveRight'},
    {mods = 'NONE', key = 'LeftArrow', action = act.CopyMode 'MoveLeft'},
    {mods = 'NONE', key = 'RightArrow', action = act.CopyMode 'MoveRight'},
    {mods = 'NONE', key = 'UpArrow', action = act.CopyMode 'MoveUp'},
    {mods = 'NONE', key = 'DownArrow', action = act.CopyMode 'MoveDown'},
    {mods = 'NONE', key = 'v', action = act.CopyMode { SetSelectionMode = 'Cell' }},
    {mods = 'SHIFT', key = 'V', action = act.CopyMode { SetSelectionMode = 'Line' }},
    {mods = 'SHIFT', key = 'V', action = act.CopyMode { SetSelectionMode = 'Line' }},
    {mods = 'CTRL', key = 'u', action = act.CopyMode 'ClearPattern' },
}
local SEARCH_BINDINGS = {
    {mods = 'NONE', key = 'Escape', action = act.CopyMode 'Close' },
    {mods = 'NONE', key = '/', action = act.CopyMode 'Close' },
    {mods = 'CTRL', key = 'q', action = act.CopyMode 'Close' },
    {mods = 'CTRL', key = 'n', action = act.CopyMode 'NextMatch' },
    {mods = 'CTRL', key = 'p', action = act.CopyMode 'PriorMatch' },
    {mods = 'CTRL', key = 'r', action = act.CopyMode 'CycleMatchType' },
    {mods = 'CTRL', key = 'u', action = act.CopyMode 'ClearPattern' },
    {mods = 'NONE', key = 'Enter', action = act.CopyMode 'PriorMatch' },
    {mods = 'NONE', key = 'PageUp', action = act.CopyMode 'PriorMatchPage', },
    {mods = 'NONE', key = 'PageDown', action = act.CopyMode 'NextMatchPage', },
    {mods = 'NONE', key = 'UpArrow', action = act.CopyMode 'PriorMatch' },
    {mods = 'NONE', key = 'DownArrow', action = act.CopyMode 'NextMatch'},
}

local COLOR_BG = '#0d121d'
local COLOR_FG = '#32d31e'
local COLOR_CURSOR = '#a6e22e'
local TAB_BG = 'NONE'
local TAB_ACTIVE = '#32d31e'
local TAB_INACTIVE = '#2f6329'

wezterm.on('format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    -- wezterm.log_info(config)
    local foreground = TAB_INACTIVE
    -- local title = tab.active_pane.title
    -- local title = ' ○'
    local title = '#'
    if tab.is_active then
      foreground = TAB_ACTIVE
      -- title = ' ●'
      title = '@'
    end
    return wezterm.format {
        {Background = { Color = TAB_BG } },
        {Foreground = { Color = foreground } },
        {Attribute={Intensity="Bold"}},
        {Attribute={Italic=true}},
        {Text = title},
    }
  end
)
wezterm.on("nvim-with-scrollback", function(window, pane)
	-- local scrollback = pane:get_lines_as_text()
	-- local name = os.tmpname()
	-- local f = io.open(name, "w+")
	-- f:write(scrollback)
	-- f:flush()
	-- f:close()
	-- window:perform_action(
	-- 	wezterm.action({ SpawnCommandInNewTab = {
	-- 		args = { "nvim", name },
	-- 	} }),
	-- 	pane
	-- )
	-- wezterm.sleep_ms(1000)
	-- os.remove(name)
end)

local REACTIVE_TABBAR = false
-- local REACTIVE_TABBAR = true

return {
    automatically_reload_config = false,
    animation_fps = 1,
    cursor_blink_rate = 0,
    -- cursor_blink_ease_in = 'Constant',
    -- cursor_blink_ease_out = 'Constant',
    -- enable_wayland = enable_wayland(),
    -- https://github.com/wez/wezterm/issues/1772
    enable_wayland = false,
    color_scheme = "Molokai",
    font=TERMINAL_FONT,
    font_size=16,
    warn_about_missing_glyphs = false,
    window_padding = {
        left = 25,
        right = 25,
        top = 20,
        bottom = 15,
    },
    window_frame = {
        font = TERMINAL_FONT_BOLD,
        font_size = 12.0,
        active_titlebar_bg = TAB_BG,
        inactive_titlebar_bg = TAB_BG,
    },
    colors = {
        tab_bar = {
            background = TAB_BG,
            inactive_tab_edge = TAB_BG,
            active_tab = {
                bg_color = TAB_BG,
                fg_color = TAB_ACTIVE,
                strikethrough = false,
                italic = false,
            },
            inactive_tab = {
                bg_color = TAB_BG,
                fg_color = TAB_INACTIVE,
                strikethrough = false,
                italic = false,
            },
            inactive_tab_hover = {
                bg_color = TAB_BG,
                fg_color = TAB_INACTIVE,
                strikethrough = false,
                italic = false,
            },
            new_tab = {
                bg_color = TAB_BG,
                fg_color = TAB_INACTIVE,
                italic = false,
            },
            new_tab_hover = {
                bg_color = TAB_BG,
                fg_color = TAB_INACTIVE,
                italic = false,
            },
        },
        foreground = COLOR_FG,
        background = COLOR_BG,
        cursor_fg = COLOR_BG,
        cursor_bg = COLOR_CURSOR,
        cursor_border = COLOR_CURSOR,
    },
    tab_bar_at_bottom = true,
    default_cursor_style = 'SteadyUnderline',
--    default_cursor_style = 'BlinkingUnderline',
--    window_background_opacity = 0.80,
--    text_background_opacity = 0.80,
    show_tab_index_in_tab_bar = false,
    hide_tab_bar_if_only_one_tab = REACTIVE_TABBAR,
    use_fancy_tab_bar = false,
    tab_bar_style = {
        new_tab = " + ",
        new_tab_hover = " + ",
    },
    disable_default_key_bindings = true,
    leader = {mods = 'CTRL', key = 'f',  timeout_milliseconds = 1000 },
    keys = KEY_BINDINGS,
    key_tables = {
        copy_mode = COPY_BINDINGS,
        search_mode = SEARCH_BINDINGS
    },
    treat_east_asian_ambiguous_width_as_wide=true,
    use_ime = true,
}
