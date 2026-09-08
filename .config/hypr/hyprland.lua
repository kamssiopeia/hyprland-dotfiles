dofile(os.getenv("HOME") .. "/.cache/wal/colors-hyprland.lua")

local scripts = "~/.config/hypr/scripts"
local active_opacity = 0.9
local inactive_opacity = 0.8
local default_opacity = active_opacity .. " " .. inactive_opacity
local modifier = "SUPER"

local terminal = "kitty"
local file_manager = "nemo"
local menu = "~/.config/rofi/launcher.sh"
local webbrowser = "chromium"
local vscode = "code"

-- Monitors
local monitor1 = "desc:LG Electronics LG ULTRAGEAR 507NTVSPB847"
local monitor2 = "desc:LG Electronics LG ULTRAGEAR 307MAPN9MV80"
local monitor3 = "desc:AU Optronics 0x23ED"

hl.monitor({ output = monitor1, mode = "2560x1440@60", position = "0x0", scale = 1 })
hl.monitor({ output = monitor2, mode = "2560x1440@120", position = "2560x0", scale = 1 })
hl.monitor({ output = monitor3, mode = "1920x1080@60", position = "5120x360", scale = 1 })

-- Workspaces
hl.workspace_rule({ workspace = "1", monitor = monitor1, persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = monitor2, persistent = true, default = true })
hl.workspace_rule({ workspace = "3", monitor = monitor3, persistent = true, default = true })

-- Startup apps
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("keepassxc -platform xcb")
    hl.exec_cmd("dropbox")
    hl.exec_cmd("copyq --start-server")
    hl.exec_cmd("solaar -w hide")
    hl.exec_cmd(scripts .. "/init_wallpaper.sh")
end)

-- Env vars
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GTK_THEME", "dracula")

-- Settings
hl.config({
    misc = {
        initial_workspace_tracking = 2,
        force_default_wallpaper = 0
    },
    cursor = {
        no_hardware_cursors = 1
    },
    input = {
        kb_layout = "pl",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = false
        },
        sensitivity = 0,
        accel_profile = "flat",
        scroll_factor = 2.0
    },
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = {
                colors = { color13, color10 },
                angle = 45
            },
            inactive_border = background_transparent30
        },
        layout = "dwindle",
        allow_tearing = false
    },
    render = {
        cm_auto_hdr = 0
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            noise = 0.017,
            contrast = 0.97,
            brightness = 0.8
        },
        shadow = {
            enabled = true,
            range = 15,
            render_power = 3,
            color = background_transparent30
        }
    },
    animations = {
        enabled = true
    },
    dwindle = {
        preserve_split = true
    }
})

-- Animations
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Window rules
hl.window_rule({
    name = "keepassxc-windowrules",
    match = {
        class = "KeePassXC"
    },
    float = true
})

hl.window_rule({
    name = "calendar-webapp-windowrules",
    match = {
        initial_title = "^(calendar\\.google\\.com_\\/calendar)$"
    },
    float = true,
    center = true,
    size = { 1000, 700 }
})

hl.window_rule({
    name = "satty-windowrules",
    match = {
        title = "satty"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "ai-assistant-webapp-windowrules",
    match = {
        initial_title = "^(gemini\\.google\\.com_/app)$"
    },
    opacity = default_opacity
})

hl.window_rule({
    name = "pavucontrol-windowrules",
    match = {
        title = "^(pavucontrol)$"
    },
    float = true
})

hl.window_rule({
    name = "nm-connection-editor-windowrules",
    match = {
        title = "^(nm-connection-editor)$"
    },
    float = true
})

hl.window_rule({
    name = "copyq-windowrules",
    match = {
        class = "com.github.hluk.copyq"
    },
    float = true
})

hl.window_rule({
    name = "kitty-windowrules",
    match = {
        class = "^(kitty)$"
    },
    opacity = default_opacity
})

hl.window_rule({
    name = "code-windowrules",
    match = {
        class = "code-oss"
    },
    opacity = default_opacity
})

hl.window_rule({
    name = "nemo-windowrules",
    match = {
        class = "nemo"
    },
    opacity = default_opacity
})

hl.window_rule({
    name = "telegram-windowrules",
    match = {
        class = "org.telegram.desktop"
    },
    opacity = default_opacity
})

hl.window_rule({
    name = "chromium-open-files-windowrules",
    match = {
        class = "^(Open Files)$"
    },
    opacity = default_opacity
})

hl.window_rule({
    name = "jetbrains-toolbox-windowrules",
    match = {
        class = "jetbrains-toolbox"
    },
    fullscreen = true
})

-- Keybinds - Use wev to find keycodes
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))                                             -- [CTRL + ALT + T] - Open terminal
hl.bind(modifier .. " + T", hl.dsp.exec_cmd(terminal))                                           -- [MOD + T] - Open terminal
hl.bind(modifier .. " + E", hl.dsp.exec_cmd(file_manager))                                       -- [MOD + E] - Open file manager
hl.bind(modifier .. " + R", hl.dsp.exec_cmd(menu))                                               -- [MOD + R] - Open launcher
hl.bind(modifier .. " + W", hl.dsp.exec_cmd(webbrowser))                                         -- [MOD + W] - Open browser
hl.bind(modifier .. " + C", hl.dsp.exec_cmd(vscode))                                             -- [MOD + C] - Open VSCode
hl.bind(modifier .. " + A", hl.dsp.exec_cmd(scripts .. "/ai_assistant_webapp.sh"))               -- [MOD + A] - Open AI assistant
hl.bind(modifier .. " + Q", hl.dsp.window.close())                                               -- [MOD + Q] - Kill active
hl.bind(modifier .. " + F", hl.dsp.window.float({ action = "toggle" }))                          -- [MOD + F] - Toggle float
hl.bind(modifier .. " + J", hl.dsp.layout("togglesplit"))                                        -- [MOD + J] - Toggle split
hl.bind(modifier .. " + CTRL + P", hl.dsp.exec_cmd(scripts .. "/waybar_reload.sh"))              -- [CTRL + MOD + P] - Reload waybar
hl.bind(modifier .. " + CTRL + code:48", hl.dsp.exec_cmd(scripts .. "/wallpaper_randomizer.sh")) -- [CTRL + MOD + '] - Randomize wallpaper
hl.bind(modifier .. " + code:34", hl.dsp.exec_cmd("~/.config/rofi/wallpaper.sh"))                -- [MOD + [] - Wallpaper picker
hl.bind(modifier .. " + code:35", hl.dsp.exec_cmd("~/.config/rofi/theme.sh"))                    -- [MOD + ]] - Theme picker
hl.bind(modifier .. " + L", hl.dsp.exec_cmd(scripts .. "/lock.sh"))                              -- [MOD + L] - Lock
hl.bind("CTRL + SHIFT + 3", hl.dsp.exec_cmd(scripts .. "/screenshot.sh region false"))           -- [CTRL + SHIFT + 3] - Screenshot of region saved to clipboard
hl.bind("CTRL + SHIFT + 4", hl.dsp.exec_cmd(scripts .. "/screenshot.sh region true"))            -- [CTRL + SHIFT + 4] - Screenshot of region saved to file and clipboard
hl.bind("CTRL + code:49", hl.dsp.exec_cmd("copyq -e \"toggle()\""))                              -- [CTRL + `] - Toggle CopyQ
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd("keepassxc"))                                          -- [CTRL + ALT + K] - Toggle KeePassXC
hl.bind("code:107", hl.dsp.exec_cmd(scripts .. "/screenshot.sh fullscreen true"))                -- [PrtScn] - Screenshot of active screen saved to file and clipboard

-- Move focus between windows
hl.bind(modifier .. " + left", hl.dsp.focus({ direction = "left" }))   -- [MOD + ←] - Move focus left
hl.bind(modifier .. " + right", hl.dsp.focus({ direction = "right" })) -- [MOD + →] - Move focus right
hl.bind(modifier .. " + up", hl.dsp.focus({ direction = "up" }))       -- [MOD + ↑] - Move focus up
hl.bind(modifier .. " + down", hl.dsp.focus({ direction = "down" }))   -- [MOD + ↓] - Move focus down

for i = 1, 10 do
    local key = i % 10
    hl.bind(modifier .. " + " .. key, hl.dsp.focus({ workspace = i }))               -- [MOD + 1..0] - Change workspace
    hl.bind(modifier .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) -- [MOD + SHIFT + 1..0] - Move window to workspace
end

-- Cyclce through workspaces on active monitor
hl.bind("ALT + code:49", hl.dsp.focus({ workspace = "m+1" }))         -- [ALT + `] - Cycle next
hl.bind("ALT + SHIFT + code:49", hl.dsp.focus({ workspace = "m-1" })) -- [ALT + SHIFT + `] - Cycle previous

-- Cycle through workspaces
hl.bind("ALT + TAB", hl.dsp.focus({ workspace = "e+1" }))         -- [ALT + TAB] - Cycle next
hl.bind("ALT + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" })) -- [ALT + SHIFT + TAB] - Cycle previous

-- Move and resize window
hl.bind(modifier .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })   -- [MOD + LMB]
hl.bind(modifier .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- [MOD + RMB]

-- Move window to monitor
hl.bind(modifier .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))   -- [MOD + SHIFT + ←] - Move window to the left
hl.bind(modifier .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" })) -- [MOD + SHIFT + →] - Move window to the right

-- Center window
hl.bind(modifier .. " + backslash", hl.dsp.window.center()) -- [MOD + \] - Center window

-- Maximize window
hl.bind(modifier .. " + SHIFT + up", hl.dsp.window.fullscreen()) -- [MOD + SHIFT + ↑] - Fullscreen app

-- Focus monitor
hl.bind(modifier .. " + SHIFT + A", hl.dsp.focus({ monitor = monitor1 })) -- [MOD + SHIFT + A] - Focus 1st monitor
hl.bind(modifier .. " + SHIFT + S", hl.dsp.focus({ monitor = monitor2 })) -- [MOD + SHIFT + S] - Focus 2nd monitor
hl.bind(modifier .. " + SHIFT + D", hl.dsp.focus({ monitor = monitor3 })) -- [MOD + SHIFT + D] - Focus 3rd monitor

-- Laptop function keys
-- Screen brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- Volume and Media Control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
