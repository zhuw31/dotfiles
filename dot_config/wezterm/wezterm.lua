local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Frappe"
config.font_size = 14.0
config.font = wezterm.font_with_fallback({
  "Menlo",
  "PingFang SC",
  "Apple Color Emoji",
})
config.line_height = 1.5
config.window_padding = {
  bottom = 0,
  right = 0,
  top = 8,
  left = 8,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.default_cursor_style = "SteadyUnderline"
config.allow_square_glyphs_to_overflow_width = "Never"

return config
