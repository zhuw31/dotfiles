local M = {}

function M.setup()
  local nvim_tree = require 'nvim-tree'
  local events = require 'nvim-tree.events'

  vim.keymap.set('n', '<c-p>', ':NvimTreeToggle<CR>')
  vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')

  nvim_tree.setup {
    disable_netrw = true,
    update_focused_file = { enable = false },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
  }
end

return M
