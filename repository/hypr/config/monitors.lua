-- ====================
-- MONITOR CONFIG
-- ====================
-- See https://wiki.hyprland.org/Configuring/Monitors/
--
-- 共通のフォールバック設定。マシン固有のモニタ設定は
-- hosts/<hostname>/hypr/config/monitors.lua に置くと init.sh が上書きする。

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1"
})
