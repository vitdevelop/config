-- Hyprland config, migrated from ~/.config/doors/{doorsrc,doorshkrc}
-- (doors was itself ported from ~/.config/bspwm/bspwmrc + ~/.config/sxhkd/sxhkdrc, then from
-- ~/.config/river/init). This file mirrors that same bspwm-flavoured behaviour on Hyprland's
-- Lua config (see https://wiki.hypr.land/configuring/).

-------------------
---- MONITORS -----
-------------------

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("PATH", (os.getenv("PATH") or "") .. ":" .. os.getenv("HOME") .. "/.local/bin")

-- Hyprland imports WAYLAND_DISPLAY/XDG_CURRENT_DESKTOP into the systemd/D-Bus activation
-- environment itself (doors needed this done by hand in doorsrc); only the portal restart is
-- still useful, in case xdg-desktop-portal was already running from a previous session.

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        border_size = 1,
        gaps_in = 10,
        gaps_out = 10,
        layout = "dwindle",
        col = {
            -- same colors as doors/river init: focused 93a1a1, unfocused 586e75
            active_border = "rgba(93a1a1ff)",
            inactive_border = "rgba(586e75ff)",
        },
        -- bspwm/doors did not wrap focus around at the edges
        no_focus_fallback = true,
    },
    decoration = {
        rounding = 0,
    },
    animations = {
        enabled = false,
    },
})

hl.config({
    dwindle = {
        -- dwindle's default force_split=0 (split follows the W/H ratio of the parent) already
        -- mirrors bspwm's automatic_scheme=longest_side, and new windows land as the "second"
        -- child by default, matching bspwm's initial_polarity=second_child
        preserve_split = true,
    },
})

-- idle_timeout was 0 (disabled) in doorsrc, and swayidle was installed but never actually
-- started in its daemon list either; no hypridle is configured here either, to match that.

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:ralt_rshift_toggle,caps:escape,altwin:swap_alt_win",
        repeat_rate = 66,
        repeat_delay = 350,
    },
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- same apps/workspaces as the doors/river/bspwm rules; "silent" keeps the workspace from
-- switching underneath you, matching bspwm's follow=off
hl.window_rule({ name = "firefox-ws",  match = { class = "^(firefox)$" },              workspace = "3 silent" })
hl.window_rule({ name = "chromium-ws", match = { class = "^(chromium)$" },             workspace = "6 silent" })
hl.window_rule({ name = "telegram-ws", match = { class = "^(org.telegram.desktop)$" }, workspace = "9 silent" })
hl.window_rule({ name = "spotify-ws",  match = { class = "^(Spotify)$" },              workspace = "10 silent" })

---------------------
---- KEYBINDINGS ----
---------------------

local mod = "SUPER"

-- terminal / launcher
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + ALT + space", hl.dsp.exec_cmd("rofi -show run"))

-- clipboard history
hl.bind(mod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- close window
hl.bind(mod .. " + W", hl.dsp.window.close())

-- quit hyprland
hl.bind(mod .. " + ALT + Q", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())

-- reload config (also happens automatically on save)
hl.bind(mod .. " + ALT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- restart waybar
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd('pkill -x -u "$USER" waybar; sleep 0.3; setsid waybar -c ~/.config/waybar/config.jsonc >/dev/null 2>&1 &'))

-- fullscreen / floating
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mod .. " + T", hl.dsp.window.float())
hl.bind(mod .. " + S", hl.dsp.window.float())

-- layouts: bspwm's monocle (borderless, gapless, one window fills the area) <-> tiled
hl.bind(mod .. " + M", function()
    hl.config({ general = { layout = "monocle", gaps_in = 0, gaps_out = 0, border_size = 0 } })
end)
hl.bind(mod .. " + SHIFT + M", function()
    hl.config({ general = { layout = "dwindle", gaps_in = 10, gaps_out = 10, border_size = 1 } })
end)

-- focus / swap
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))

-- last workspace / prev / next
hl.bind(mod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + bracketright", hl.dsp.focus({ workspace = "e+1" }))

-- workspaces 1-10 (0 acts as 10, same base-1 layout as bspwm)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i), follow = true }))
end

-- rotate (rotates the split of the focused container; dwindle has no full bspwm-tree rotate)
hl.bind(mod .. " + R", hl.dsp.layout("rotatesplit 90"))
hl.bind(mod .. " + CTRL + R", hl.dsp.layout("rotatesplit -90"))

-- preselect
hl.bind(mod .. " + CTRL + h", hl.dsp.layout("preselect l"))
hl.bind(mod .. " + CTRL + j", hl.dsp.layout("preselect d"))
hl.bind(mod .. " + CTRL + k", hl.dsp.layout("preselect u"))
hl.bind(mod .. " + CTRL + l", hl.dsp.layout("preselect r"))
hl.bind(mod .. " + CTRL + space", hl.dsp.layout("preselect"))

-- resize
hl.bind(mod .. " + ALT + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind(mod .. " + ALT + j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))
hl.bind(mod .. " + ALT + k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind(mod .. " + ALT + l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))

-- mouse move/resize
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- applications
hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + SHIFT + Return", hl.dsp.exec_cmd("alacritty -e vifmrun"))
hl.bind(mod .. " + ALT + SHIFT + Return", hl.dsp.exec_cmd("nautilus"))
hl.bind(mod .. " + SHIFT + I", hl.dsp.exec_cmd("~/.local/idea/bin/idea.sh nosplash"))
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("alacritty -e htop"))
hl.bind(mod .. " + ALT + SHIFT + P", hl.dsp.exec_cmd("alacritty -e glances"))
-- NOTE: doorshkrc also bound "super + shift + m" to `alacritty -e cmus`, but that combo was
-- already claimed above by the tiled-layout bind. Under doors/sxhkd's first-match-wins parsing
-- the cmus bind never actually fired, so it's intentionally not carried over here.

-- lock
hl.bind(mod .. " + ALT + CTRL + Q", hl.dsp.exec_cmd("swaylock -F -f -i /usr/share/backgrounds/archlinux/landscape.jpg"))

-- screenshot
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- audio
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +2%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -2%"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- notifications
hl.bind("CTRL + ALT + space", hl.dsp.exec_cmd("dunstctl close"))
hl.bind("CTRL + SHIFT + space", hl.dsp.exec_cmd("dunstctl close-all"))
hl.bind("CTRL + grave", hl.dsp.exec_cmd("dunstctl history-pop"))

-- menus
hl.bind(mod .. " + ALT + CTRL + 0", hl.dsp.exec_cmd("rofi-poweroff.sh"))
hl.bind(mod .. " + ALT + CTRL + 1", hl.dsp.exec_cmd("rofi-cfg.sh"))hl.bind(mod .. " + ALT + CTRL + 8", hl.dsp.exec_cmd("rofi-theme.sh"))
hl.bind(mod .. " + ALT + CTRL + 9", hl.dsp.exec_cmd("rofi-screen.sh"))

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user restart xdg-desktop-portal")
    hl.exec_cmd("swaybg -i /usr/share/backgrounds/archlinux/landscape.jpg")
    hl.exec_cmd("waybar -c ~/.config/waybar/config.jsonc")
    hl.exec_cmd("kanshi")
    hl.exec_cmd("gammastep")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)
