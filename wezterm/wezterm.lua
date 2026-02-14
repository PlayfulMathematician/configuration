local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("Iosevka Nerd Font Mono")
config.font_size = 13
return config
