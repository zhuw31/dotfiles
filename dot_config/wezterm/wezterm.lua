local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "nord"
config.font_size = 16.0
config.font = wezterm.font("SauceCodePro Nerd Font")
config.line_height = 1.2
config.window_padding = {
  right = 0,
  bottom = 0,
  left = 0,
  top = 0,
}
config.window_decorations = "RESIZE"

return config
