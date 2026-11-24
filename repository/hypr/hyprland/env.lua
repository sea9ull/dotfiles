-- Some default env vars.
--
local home_dir = os.getenv("HOME")

hl.env("LC_ALL", "ja_JP.UTF-8")
hl.env("LANG", "ja_JP.UTF-8")
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS=@im", "fcitx")
hl.env("DefaultIMModule", "fcitx")
hl.env("ZDOTDIR", home_dir .. "/.config/zsh")
hl.env("XCURSOR_SIZE", "24")
hl.env("YDOTOOL_SOCKET", "/tmp/.ydotool_socket")
hl.env("PULSE_SCRIPT", "/etc/xrdp/pulse/default.pa")

-- Default env vars.
-- Wayland
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("OZONE_PLATFORM", "wayland")

-- Applications
-- hl.env("XDG_DATA_DIRS", "$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Themes
hl.env("GDK_BACKEND", "wayland")
hl.env("GDK_SCALE", "1")
hl.env("GDK_DPI_SCALE", "0.5")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")


hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
-- hl.env("WLR_NO_HARDWARE_CURSORS", "1")
-- hl.env("WLR_DRM_DEVICES", "/dev/dri/card1")

hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")


-- ====================
--   RADEON settings
-- ====================
-- hl.env("DRI_PRIME", "1")
-- hl.env("LIBVA_DRIVER_NAME", "radeonsi")
-- hl.env("VDPAU_DRIVER", "radeonsi")
-- hl.env("MESA_LOADER_DRIVER_OVERRIDE", "radeonsi")
-- hl.env("LIBGL_ALWAYS_SOFTWARE", "true")
-- hl.env("GALLIUM_DRIVER", "llvmpipe")
-- hl.env("SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS", "0")
-- hl.env("DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1", "1")
-- hl.env("VK_ICD_FILENAMES", "/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json")
-- hl.env("RADV_PERFTEST", "rt,gpl,nv_ms")
