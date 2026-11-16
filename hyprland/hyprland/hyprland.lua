-- Hyprland 0.57+ configuration, migrated from hyprland.conf.
-- Kanshi applies the actual monitor profiles after startup.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

local terminal = "kitty"
local fileManager = terminal .. " yazi"
local menu = "wofi --show drun"
local browser = "firefox"

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("qs -c widgets")
    hl.exec_cmd("systemctl --user start hypridle.service")
    hl.exec_cmd("kanshi")
    hl.exec_cmd("sleep 2 && ~/.local/bin/waybar-launch")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("startup_work.sh kitty", { workspace = "1 silent" })
    hl.exec_cmd("startup_work.sh kitty", { workspace = "1 silent" })
    hl.exec_cmd("startup_work.sh kitty", { workspace = "1 silent" })
    hl.exec_cmd("startup_work.sh kitty", { workspace = "2 silent" })
    hl.exec_cmd("startup_work.sh firefox", { workspace = "5 silent" })
    hl.exec_cmd("gtk-launch WebApp-Slack0417", { workspace = "6 silent" })
    hl.exec_cmd("startup_work.sh org.keepassxc.KeePassXC", { workspace = "7 silent" })
    hl.exec_cmd("startup_work.sh 1password", { workspace = "7 silent" })
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.config({
    general = {
        gaps_in = 2, gaps_out = 4, border_size = 1,
        col = {
            active_border = { colors = { "rgba(333dbc43)", "rgba(00ffd985)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true, allow_tearing = false, layout = "dwindle",
    },
    decoration = {
        rounding = 2, rounding_power = 2,
        active_opacity = 1.0, inactive_opacity = 1.0,
        shadow = { enabled = true, range = 4, render_power = 3, color = "rgba(1a1a1aee)" },
        blur = { enabled = true, size = 3, passes = 1, vibrancy = 0.1696 },
    },
    animations = { enabled = true },
    dwindle = { preserve_split = true },
    master = { new_status = "master" },
    misc = { force_default_wallpaper = -1, disable_hyprland_logo = false },
    input = {
        kb_layout = "de", kb_variant = "", kb_model = "", kb_options = "", kb_rules = "",
        numlock_by_default = true, follow_mouse = 1, sensitivity = 0.4,
        touchpad = { natural_scroll = true },
    },
    binds = { allow_workspace_cycles = true },
})

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Application shortcuts.
local function exec(key, command)
    hl.bind("SUPER + " .. key, hl.dsp.exec_cmd(command))
end
exec("Q", terminal)
exec("A", terminal .. " nvim")
exec("Y", terminal .. " k9s")
exec("E", fileManager)
exec("R", menu)
exec("F", browser)
exec("D", "qs -c widgets ipc call peek toggle")
exec("W", "~/.local/bin/waybar-launch")
exec("I", "idea -Dawt.toolkit.name=WLToolkit")
exec("U", "code")
exec("O", "systemctl suspend")
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("CTRL + ALT + SUPER + SHIFT + H", hl.dsp.exit())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

for _, pair in ipairs({
    {"h", "left"}, {"l", "right"}, {"k", "up"}, {"j", "down"},
    {"left", "left"}, {"right", "right"}, {"up", "up"}, {"down", "down"},
}) do
    hl.bind("SUPER + " .. pair[1], hl.dsp.focus({ direction = pair[2] }))
    hl.bind("SUPER + SHIFT + " .. pair[1], hl.dsp.window.move({ direction = pair[2] }))
end

for i = 1, 10 do
    hl.bind("SUPER + " .. (i % 10), hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i, follow = true }))
end
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = true }))
for _, pair in ipairs({
    {"mouse_down", "e+1"}, {"mouse_up", "e-1"},
    {"COMMA", "-1"}, {"PERIOD", "+1"}, {"Minus", "previous"},
}) do
    hl.bind("SUPER + " .. pair[1], hl.dsp.focus({ workspace = pair[2] }))
end

hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

for _, pair in ipairs({
    {"XF86AudioRaiseVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"},
    {"XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"},
    {"XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"},
    {"XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"},
    {"XF86MonBrightnessUp", "brightnessctl s 5%+"},
    {"XF86MonBrightnessDown", "brightnessctl s 5%-"},
}) do
    hl.bind(pair[1], hl.dsp.exec_cmd(pair[2]), { locked = true, repeating = true })
end
for _, pair in ipairs({
    {"XF86AudioNext", "next"}, {"XF86AudioPause", "play-pause"},
    {"XF86AudioPlay", "play-pause"}, {"XF86AudioPrev", "previous"},
}) do
    hl.bind(pair[1], hl.dsp.exec_cmd("playerctl " .. pair[2]), { locked = true })
end
hl.bind("CTRL + ALT + SUPER + SHIFT + comma", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("CTRL + ALT + SUPER + SHIFT + period", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("CTRL + SUPER + L", hl.dsp.exec_cmd("hyprlock"))

hl.window_rule({ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({
    name = "fix-xwayland-drags",
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus = true,
})
hl.window_rule({ name = "move-hyprland-run", match = { class = "hyprland-run" }, move = "20 monitor_h-120", float = true })
