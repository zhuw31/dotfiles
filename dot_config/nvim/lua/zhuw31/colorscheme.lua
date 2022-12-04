-- Set colorscheme
local colorscheme = 'catppuccin'
require(colorscheme).setup {
  flavour = 'frappe',
  background = {
    light = 'latte',
    dark = 'frappe',
  },
}
vim.cmd.colorscheme(colorscheme)
