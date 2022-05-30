local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local events_status_ok, events = pcall(require, 'nvim-tree.events')
if not events_status_ok then
  return
end

vim.keymap.set('n', '<c-p>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')

nvim_tree.setup {
  disable_netrw = true,
  update_focused_file = { enable = false },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
