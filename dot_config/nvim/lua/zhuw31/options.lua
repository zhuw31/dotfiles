local indent = 2
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
