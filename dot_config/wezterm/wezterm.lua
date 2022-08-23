local wz = require 'wezterm'

wz.on('update-right-status', function(window)
  local date = wz.strftime '%a %m-%d %H:%M'

  window:set_right_status(wz.format {
    { Text = wz.nerdfonts.mdi_clock .. ' ' .. date },
  })
end)

return {
  font_size = 16.0,
  color_scheme = 'nord',

  use_fancy_tab_bar = false,

  keys = {
    { key = 'd', mods = 'CMD', action = wz.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  },
}
