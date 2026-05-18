-- ==========================
--    Startup Programs
-- ==========================

hl.on("hyprland.start", function ()
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("quickshell")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Graphite-dark-nord-cursors 32")
end)
