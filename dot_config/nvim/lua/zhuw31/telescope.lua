local telescope = require 'telescope'
local actions = require 'telescope.actions'

local opts = { silent = true, noremap = true }
local function n_map(key, cmd)
  return vim.api.nvim_set_keymap('n', key, cmd, opts)
end

n_map('<leader>ff', '<cmd>Telescope find_files<CR>')
n_map('<leader>fl', '<cmd>Telescope live_grep<CR>')
n_map('<leader>fb', '<cmd>Telescope buffers<CR>')
n_map('<leader>fh', '<cmd>Telescope help_tags<CR>')
n_map('<leader>fk', '<cmd>Telescope keymaps<CR>')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
}
telescope.load_extension 'fzf'
