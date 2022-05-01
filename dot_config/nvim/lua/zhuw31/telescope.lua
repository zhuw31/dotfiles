local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions_status_ok, actions = pcall(require, 'telescope.actions')
if not actions_status_ok then
  return
end

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fl', ':Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { silent = true })
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>', { silent = true })

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
      previewer = false,
      hidden = true,
    },
    live_grep = {
      theme = 'ivy',
      previewer = true,
      hidden = true,
    },
    buffers = {
      theme = 'ivy',
      previewer = false,
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
