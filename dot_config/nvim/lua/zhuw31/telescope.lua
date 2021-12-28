local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions_status_ok, actions = pcall(require, 'telescope.actions')
if not actions_status_ok then
  return
end

local utils = require 'zhuw31.utils'

utils.n_map('<leader>ff', '<cmd>Telescope find_files<CR>')
utils.n_map('<leader>fl', '<cmd>Telescope live_grep<CR>')
utils.n_map('<leader>fb', '<cmd>Telescope buffers<CR>')
utils.n_map('<leader>fh', '<cmd>Telescope help_tags<CR>')
utils.n_map('<leader>fk', '<cmd>Telescope keymaps<CR>')

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
