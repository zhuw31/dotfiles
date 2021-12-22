require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  start_in_insert = false,
  insert_mappings = false,
  shade_terminals = false,
  float_opts = {
    width = vim.api.nvim_win_get_width '%',
    height = vim.api.nvim_win_get_height '%',
  },
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
}

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
