local wz = require 'wezterm'

wz.on('update-right-status', function(window)
  local date = wz.strftime '%a %m-%d %H:%M'

  window:set_right_status(wz.format {
    { Text = wz.nerdfonts.mdi_clock .. ' ' .. date },
  })
end)

return {
  font_size = 20.0,
  font = wz.font_with_fallback {
    { family = 'Inconsolata' },
    { family = 'InconsolataGo Nerd Font' },
    { family = 'Apple Color Emoji' },
  },
  color_scheme = 'nord',
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  native_macos_fullscreen_mode = true,
  keys = {
    { key = 'd', mods = 'CMD', action = wz.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  },
  colors = {
    tab_bar = {
      background = '#2E3440',
      active_tab = {
        bg_color = '#2E3440',
        fg_color = '#8FBCBB',
        intensity = 'Bold',
      },
      inactive_tab = {
        bg_color = '#2E3440',
        fg_color = '#c0c0c0',
      },
      new_tab = {
        bg_color = '#2E3440',
        fg_color = '#c0c0c0',
      },
    },
  },
  audible_bell = 'Disabled',
}
