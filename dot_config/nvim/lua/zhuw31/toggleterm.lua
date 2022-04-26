local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

local terminal_status_ok, terminal = pcall(require, 'toggleterm.terminal')
if not terminal_status_ok then
  return
end

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

local function float_on_open(term)
  vim.keymap.set('n', 'q', ':close<CR>', { silent = true, buffer = term.bufnr })
end

local lazygit = Terminal:new {
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  hidden = true,
  on_open = float_on_open,
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
  on_open = float_on_open,
}

local function npm_toggle()
  npm:toggle()
end

vim.keymap.set('n', '<leader>lg', lazygit_toggle)
vim.keymap.set('n', '<leader>ps', npm_toggle)
