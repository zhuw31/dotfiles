local wz = require 'wezterm'

wz.on('update-right-status', function(window)
  local date = wz.strftime '%a %m-%d %H:%M'

  window:set_right_status(wz.format {
    { Text = wz.nerdfonts.mdi_clock .. ' ' .. date },
  })
end)

return {
  font_size = 16.0,
  font = wz.font 'sf mono',
  color_scheme = 'nord',

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  keys = {
    { key = 'd', mods = 'CMD', action = wz.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  },
}
