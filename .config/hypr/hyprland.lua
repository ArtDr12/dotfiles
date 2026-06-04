-- INITIALIZATION

hl.monitor({output = "eDP-1", mode = "highres", position = "auto", scale = "1"})

hl.monitor({output = "HDMI-A-1", mode = "highres", position = "auto", scale = "1", mirror = "eDP-1"})

hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("lxqt-policykit-agent")
  hl.exec_cmd("awww-daemon & sleep 1 && awww clear 000020")
end)

-- CONFIG

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.28,
        },
        sensitivity = 0,
    },
    general = {
        gaps_in = 3,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = {colors = {"rgba(00b0ffff)", "rgba(005984ff)" }, angle = 90 },
            inactive_border = "rgba(595959ff)",
        },
        layout = "scrolling",
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    gestures = {
        workspace_swipe_distance = 2000,
        workspace_swipe_cancel_ratio = 0.25,
        workspace_swipe_min_speed_to_force = 0,
        workspace_swipe_direction_lock = false,
    }
})

-- ANIMATIONS

hl.curve("myBezier", {type = "bezier", points = {{0.05, 0.7}, {0.1,1}}})
hl.curve("gnomed", {type = "bezier", points = {{0.15, 0}, {0.2, 1}}})

hl.animation({leaf = "windowsIn", enabled = true, speed = 7, bezier = "gnomed", style = "gnomed"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 7, bezier = "myBezier", style = "popin"})
hl.animation({leaf = "windowsMove", enabled = true, speed = 7, bezier = "myBezier"})
hl.animation({leaf = "border", enabled = true, speed = 7, bezier = "myBezier"})
hl.animation({leaf = "fade", enabled = true, speed = 7, bezier = "myBezier"})
hl.animation({leaf = "borderangle", enabled = true, speed = 1, bezier = "myBezier"})
hl.animation({leaf = "workspaces", enabled = true, speed = 7, bezier = "myBezier", style = "slidevert"})
hl.animation({leaf = "specialWorkspace", enabled = true, speed = 7, bezier = "myBezier", style = "fade"})

-- GESTURES

hl.gesture({fingers = 3, direction = "vertical", action = "workspace"})
hl.gesture({fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({direction = "left"})) end})
hl.gesture({fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({direction = "right"})) end})

-- WINDOW RULES

hl.window_rule({match = {fullscreen = 1}, border_color = "rgba(00b0ffff)"})

hl.window_rule({match = {workspace = "special:E1"}, border_color = "rgba(00ff60ff) rgba(008418ff) 90deg"})
hl.window_rule({match = {workspace = "special:E1", fullscreen = 1}, border_color = "rgba(00ff60ff)"})

hl.window_rule({match = {workspace = "special:E2"}, border_color = "rgba(ff00ffff) rgba(840084ff) 90deg"})
hl.window_rule({match = {workspace = "special:E2", fullscreen = 1}, border_color = "rgba(ff00ffff)"})

hl.layer_rule({match = {namespace = "selector"}, no_anim = true})

-- BINDS

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + V", hl.dsp.window.float({action = "toggle"}))
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("$HOME/Scripts/colorpick.sh"))
hl.bind("SUPER + J", hl.dsp.layout("promote"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({mode = "maximized", action = "toggle"}))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle"}))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("hyprshot -zsm window --clipboard-only"))
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("$HOME/Scripts/screentotext.sh"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -zsm region --clipboard-only"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprshot -zm active -m output --clipboard-only"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exit())
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next({next = true}))
hl.bind("ALT + Tab", hl.dsp.window.bring_to_top())
hl.bind("SUPER + K", hl.dsp.exec_cmd("$HOME/Scripts/menu/menu.sh"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("swaync-client --hide-all && hyprctl dismissnotify"))
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd("$HOME/Scripts/dnd.sh"))
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd("$HOME/Scripts/touchpad.sh"))

hl.bind("xf86monbrightnessdown", hl.dsp.exec_cmd("brightnessctl s 5%-"), {locked = true, repeating = true})
hl.bind("xf86monbrightnessup", hl.dsp.exec_cmd("brightnessctl s 5%+"), {locked = true, repeating = true})
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("wpctl set-volume -l 3 @DEFAULT_AUDIO_SINK@ 2.5%+"), {locked = true, repeating = true})
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("wpctl set-volume -l 3 @DEFAULT_AUDIO_SINK@ 2.5%-"), {locked = true, repeating = true})
hl.bind("xf86audiomute", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"), {locked = true, repeating = true})
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -zsm region"))

hl.bind("SUPER + left", hl.dsp.focus({direction = "left"}))
hl.bind("SUPER + right", hl.dsp.focus({direction = "right"}))
hl.bind("SUPER + up", hl.dsp.focus({direction = "up"}))
hl.bind("SUPER + down", hl.dsp.focus({direction = "down"}))
hl.bind("SUPER + CTRL + left", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + CTRL + right", hl.dsp.layout("swapcol r"))

hl.bind("SUPER + 1", hl.dsp.focus({workspace = 1}))
hl.bind("SUPER + 2", hl.dsp.focus({workspace = 2}))
hl.bind("SUPER + 3", hl.dsp.focus({workspace = 3}))
hl.bind("SUPER + 4", hl.dsp.focus({workspace = 4}))
hl.bind("SUPER + 5", hl.dsp.focus({workspace = 5}))
hl.bind("SUPER + 6", hl.dsp.focus({workspace = 6}))
hl.bind("SUPER + 7", hl.dsp.focus({workspace = 7}))
hl.bind("SUPER + 8", hl.dsp.focus({workspace = 8}))
hl.bind("SUPER + 9", hl.dsp.focus({workspace = 9}))
hl.bind("SUPER + 0", hl.dsp.focus({workspace = 10}))
hl.bind("SUPER + TAB", hl.dsp.focus({workspace = "+1"}))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({workspace = -1}))

hl.bind("SUPER + CTRL + 1", hl.dsp.window.move({workspace = 1, follow = false}))
hl.bind("SUPER + CTRL + 2", hl.dsp.window.move({workspace = 2, follow = false}))
hl.bind("SUPER + CTRL + 3", hl.dsp.window.move({workspace = 3, follow = false}))
hl.bind("SUPER + CTRL + 4", hl.dsp.window.move({workspace = 4, follow = false}))
hl.bind("SUPER + CTRL + 5", hl.dsp.window.move({workspace = 5, follow = false}))
hl.bind("SUPER + CTRL + 6", hl.dsp.window.move({workspace = 6, follow = false}))
hl.bind("SUPER + CTRL + 7", hl.dsp.window.move({workspace = 7, follow = false}))
hl.bind("SUPER + CTRL + 8", hl.dsp.window.move({workspace = 8, follow = false}))
hl.bind("SUPER + CTRL + 9", hl.dsp.window.move({workspace = 9, follow = false}))
hl.bind("SUPER + CTRL + 0", hl.dsp.window.move({workspace = 10, follow = false}))
hl.bind("SUPER + CTRL + TAB", hl.dsp.window.move({workspace = "+1", follow = false}))
hl.bind("SUPER + CTRL + SHIFT + TAB", hl.dsp.window.move({workspace = -1, follow = false}))

hl.bind("SUPER + W", hl.dsp.workspace.toggle_special("E1"))
hl.bind("SUPER + SHIFT + W", hl.dsp.workspace.toggle_special("E2"))
hl.bind("SUPER + CTRL + W", hl.dsp.window.move({workspace = "special:E1", follow = false}))
hl.bind("SUPER + CTRL + SHIFT + W", hl.dsp.window.move({workspace = "special:E2", follow = false}))

hl.bind("SUPER + mouse_down", hl.dsp.focus({workspace = -1}))
hl.bind("SUPER + mouse_up", hl.dsp.focus({workspace = "+1"}))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
