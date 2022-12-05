local ok, colorscheme = pcall(require, 'catppuccin')

colorscheme.setup {
  flavour = 'frappe',
  background = {
    light = 'latte',
    dark = 'frappe',
  },
}

vim.cmd.colorscheme(colorscheme)
