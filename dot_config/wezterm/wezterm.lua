local wezterm = require("wezterm")

return {
  font_size = 16.0,
  font = wezterm.font_with_fallback({
    { family = "SauceCodePro Nerd Font", weight = "Regular" },
    { family = "SauceCodePro Nerd Font", weight = "Bold" },
  }),
  color_scheme = "tokyonight-day",
  enable_tab_bar = false,
  line_height = 1.2,
  window_padding = {
    bottom = 0,
  },
  window_decorations = "RESIZE",
}
