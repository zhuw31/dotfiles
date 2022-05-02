local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions_status_ok, actions = pcall(require, 'telescope.actions')
if not actions_status_ok then
  return
end

local opts = { silent = true }
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fl', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>', opts)

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      preview = false,
      hidden = true,
    },
    live_grep = {
      theme = 'ivy',
      preview = true,
      hidden = true,
    },
    buffers = {
      theme = 'ivy',
      preview = false,
      hidden = true,
    },
    help_tags = {
      theme = 'dropdown',
    },
    keymaps = {
      theme = 'dropdown',
    },
  },
}

telescope.load_extension 'fzf'
