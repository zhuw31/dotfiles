local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
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
    preview = false,
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      hidden = true,
    },
    live_grep = {
      theme = 'ivy',
      preview = true,
      hidden = true,
    },
    buffers = {
      theme = 'ivy',
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
