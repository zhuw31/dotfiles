local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end
local utils = require 'zhuw31.utils'

utils.n_map('<leader>e', '<cmd>NvimTreeToggle<CR>')

vim.g.nvim_tree_icons = {
  default = '',
}

nvim_tree.setup {
  update_focused_file = { enable = true },
}
