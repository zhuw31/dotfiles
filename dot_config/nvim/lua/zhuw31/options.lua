local indent = 4
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

g.mapleader = ' '
g.loaded_python_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.python_host_prog = '/usr/bin/python'
g.python3_host_prog = '/usr/local/bin/python3'

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'fzf',
  '2html_plugin',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrw',
  'netrwPlugin',
}
for _, builtin in pairs(disabled_built_ins) do
  g['loaded_' .. builtin] = 1
end

-- Set colorscheme
cmd [[colorscheme tokyonight]]

-- Highlight when yank
cmd [[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
    augroup END
]]

-- options
local options = {
  hidden = false,
  number = true,
  relativenumber = true,
  expandtab = true,
  tabstop = indent,
  shiftwidth = indent,
  smartindent = true,
  foldenable = false,
  matchtime = 2,
  splitright = true,
  splitbelow = true,
  ignorecase = true,
  smartcase = true,
  nohlsearch = true,
  switchbuf = { 'useopen', 'usetab' },
  updatetime = 100,
  inccommand = 'split',
  showmode = false,
  completeopt = { 'menu', 'menuone', 'noselect' },
  jumpoptions = 'stack',
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  signcolumn = 'yes:1',
  pumheight = 10,
  list = [[listchars=tab:\|\ ,trail:·]],
  backup = false,
  wrap = false,
  writebackup = false,
  scrolloff = 5,
  sidescrolloff = 5,
  guicursor = 'a:block',
  swapfile = false,
}

opt.shortmess:append 'c'

for opt_k, opt_v in pairs(options) do
  opt[opt_k] = opt_v
end
