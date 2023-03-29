local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'nord'
config.font_size = 16.0
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.enable_tab_bar = false
config.line_height = 1.2
config.window_padding = {
  right = 0,
  bottom = 0,
  left = 0,
  top = 0,
}
config.window_decorations = "RESIZE"

return config
