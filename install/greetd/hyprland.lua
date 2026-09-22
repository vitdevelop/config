-- Greeter session: Hyprland as the compositor for ReGreet, exits when the greeter exits
-- (migrated from install/greetd/doorsrc)

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:ralt_rshift_toggle,caps:escape,altwin:swap_alt_win",
    },
    general = {
        border_size = 0,
        gaps_in = 0,
        gaps_out = 0,
    },
    decoration = {
        rounding = 0,
    },
    animations = {
        enabled = false,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("regreet; hyprctl dispatch 'hl.dsp.exit()'")
end)
