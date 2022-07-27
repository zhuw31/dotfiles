local M = {}

function M.setup()
  local toggleterm = require 'toggleterm'
  local terminal = require 'toggleterm.terminal'

  toggleterm.setup {
    size = function(term)
      if term.direction == 'vertical' then
        return vim.o.columns * 0.4
      else
        return 20
      end
    end,
    shade_terminals = false,
    open_mapping = [[<c-t>]],
    insert_mappings = true,
    start_in_insert = true,
    direction = 'vertical',
    float_opts = {
      border = 'rounded',
    },
  }

  local Terminal = terminal.Terminal

  local lazygit = Terminal:new {
    cmd = 'lazygit',
    dir = 'git_dir',
    direction = 'float',
    hidden = true,
  }

  local function lazygit_toggle()
    lazygit:toggle()
  end

  local npm = Terminal:new {
    cmd = 'nr pstart',
    dir = 'git_dir',
    direction = 'float',
    hidden = false,
    count = 5,
  }

  local function npm_toggle()
    npm:toggle()
  end

  vim.keymap.set('n', '<leader>lg', lazygit_toggle)
  vim.keymap.set('n', '<leader>ys', npm_toggle)
end

return M
