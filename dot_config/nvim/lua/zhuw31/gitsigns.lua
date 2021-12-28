local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

gitsigns.setup {
  current_line_blame = true,
  keymaps = {},
  signs = {
    add = { hl = 'GitSignsAdd', text = '▌' },
    change = { hl = 'GitSignsChange', text = '▌' },
    delete = { hl = 'GitSignsDelete', text = '▌' },
    topdelete = { hl = 'GitSignsDelete', text = '▌' },
    changedelete = { hl = 'GitSignsChange', text = '▌' },
  },
}
