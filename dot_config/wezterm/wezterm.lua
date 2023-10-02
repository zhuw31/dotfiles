local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Frappe"
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

config.font_size = 12.0
config.line_height = 1.2
config.font = wezterm.font_with_fallback({
  "Liga SFMono Nerd Font",
  "PingFang SC",
  "Apple Color Emoji",
})

config.window_padding = {
  bottom = 0,
  right = 0,
  top = 0,
  left = 0,
}
config.window_decorations = "RESIZE"
config.default_cursor_style = "SteadyUnderline"
config.allow_square_glyphs_to_overflow_width = "Never"
config.use_fancy_tab_bar = false

return config
