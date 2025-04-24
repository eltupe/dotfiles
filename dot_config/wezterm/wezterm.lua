local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = 'Github'

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.keys = {
  {
    key = 'K',
    mods = 'CMD|SHIFT',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
}

return config
