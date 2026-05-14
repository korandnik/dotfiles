-- general
hl.bind("CONTROL + SHIFT_L", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { locked = true })

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + TAB", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind("SUPER + Q", hl.dsp.window.close("activewindow"))
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + D", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen("fullscreen", "toggle", "activewindow"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("/home/korandnik/.config/hypr/bin/hyprpaper.sh"))

hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("wleave"))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, "toggle", "activewindow" }))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("pkill rofi || rofi -show run"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))

-- audio
hl.bind("SUPER + CTRL + SHIFT + J", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2.5%-"),    { repeating = true })
hl.bind("SUPER + CTRL + SHIFT + K", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2.5%+"),
    { repeating = true })
hl.bind("SUPER + CTRL + SHIFT + H", hl.dsp.exec_cmd("playerctl previous"), { repeating = true })
hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.exec_cmd("playerctl next"), { repeating = true })
hl.bind("SUPER + CTRL + SHIFT + U", hl.dsp.exec_cmd("playerctl play-pause"), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -n2 set 5%+"),
    { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n2 set 5%-"),
    { repeating = true, locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))


-- windows and workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

hl.bind("SUPER + CTRL + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true, window = "activewindow" }),
    { repeating = true })
hl.bind("SUPER + CTRL + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true, window = "activewindow" }),
    { repeating = true })
hl.bind("SUPER + CTRL + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true, window = "activewindow" }),
    { repeating = true })
hl.bind("SUPER + CTRL + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true, window = "activewindow" }),
    { repeating = true })
