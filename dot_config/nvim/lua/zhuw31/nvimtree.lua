vim.g.nvim_tree_icons = {
  default = '',
}

local opts = { silent = true, noremap = true }
local function n_map(key, cmd)
  return vim.api.nvim_set_keymap('n', key, cmd, opts)
end

n_map('<leader>e', '<cmd>NvimTreeToggle<CR>')

require('nvim-tree').setup {
  update_focused_file = { enable = true },
}
