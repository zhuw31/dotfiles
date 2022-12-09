local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')

tree.setup {
  disable_netrw = true,
  update_focused_file = {
    enable = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    ignore = false,
  },
}
