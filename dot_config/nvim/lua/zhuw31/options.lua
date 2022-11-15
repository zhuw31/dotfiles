local indent = 2
local cmd = vim.cmd
local opt = vim.opt

vim.g.mapleader = ' '
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- options
local options = {
  termguicolors = true,
  hidden = true,
  number = true,
  relativenumber = true,
  expandtab = true,
  tabstop = indent,
  shiftwidth = indent,
  smartindent = true,
  autoindent = true,
  foldenable = false,
  matchtime = 2,
  splitright = true,
  splitbelow = true,
  ignorecase = true,
  smartcase = true,
  hlsearch = false,
  switchbuf = { 'useopen', 'usetab' },
  updatetime = 50,
  inccommand = 'split',
  showmode = false,
  completeopt = { 'menu', 'menuone', 'noselect' },
  jumpoptions = 'stack',
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  signcolumn = 'yes:1',
  pumheight = 10,
  list = true,
  backup = false,
  wrap = false,
  writebackup = false,
  scrolloff = 5,
  guicursor = '',
  sidescrolloff = 5,
  swapfile = false,
  mouse = 'n',
  wrapscan = false,
  laststatus = 3,
  clipboard = 'unnamedplus',
  lazyredraw = true,
}

for opt_k, opt_v in pairs(options) do
  opt[opt_k] = opt_v
end
opt.shortmess:append 'c'

-- nord
vim.g.nord_italic = false
vim.g.nord_cursorline_transparent = true

-- Set colorscheme
local colorscheme = 'nord'
local colorscheme_ok = pcall(require, colorscheme)
if colorscheme_ok then
  cmd('colorscheme ' .. colorscheme)
end

local augroup_clear = { clear = true }
-- Highlight when yank
vim.api.nvim_create_augroup('YankHighlight', augroup_clear)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = 'YankHighlight',
  pattern = '*',
})

-- windows to close with "q"
vim.api.nvim_create_augroup('QuickCloseQ', augroup_clear)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'startuptime', 'lspinfo', 'qf' },
  group = 'QuickCloseQ',
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { silent = true })
  end,
})

-- cmd [[autocmd BufWritePost ~/.local/share/chezmoi/* !chezmoi apply --source-path "%"]]
vim.api.nvim_create_augroup('ChezmoiApply', augroup_clear)
vim.api.nvim_create_autocmd('BufWritePost', {
  ---@diagnostic disable-next-line: missing-parameter
  pattern = vim.fn.expand '~/.local/share/chezmoi/' .. '*',
  group = 'ChezmoiApply',
  callback = function(opts)
    os.execute('chezmoi apply --source-path ' .. opts.file)
  end,
})
