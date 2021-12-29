local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

local terminal_status_ok, terminal = pcall(require, 'toggleterm.terminal')
if not terminal_status_ok then
  return
end

local utils = require 'zhuw31.utils'

toggleterm.setup {
  open_mapping = [[<c-t>]],
  insert_mappings = true,
  start_in_insert = false,
  shade_terminals = false,
  direction = 'horizontal',
  float_opts = {
    width = vim.api.nvim_win_get_width '%',
    height = vim.api.nvim_win_get_height '%',
  },
}

local Terminal = terminal.Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd [[startinsert!]]
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
}

function _lazygit_toggle()
  lazygit:toggle()
end

utils.n_map('<leader>lg', [[<cmd>lua _lazygit_toggle()<CR>]])
