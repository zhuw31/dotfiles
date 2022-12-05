local ok, colorscheme = pcall(require, 'catppuccin')

if not ok then
  return
end

colorscheme.setup {
  flavour = 'frappe',
  background = {
    light = 'latte',
    dark = 'frappe',
  },
}

vim.cmd.colorscheme 'catppuccin'
