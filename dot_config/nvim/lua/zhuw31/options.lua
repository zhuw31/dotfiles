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
  updatetime = 100,
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
  wrap = true,
  writebackup = false,
  scrolloff = 5,
  sidescrolloff = 5,
  swapfile = false,
  mouse = 'n',
}

for opt_k, opt_v in pairs(options) do
  opt[opt_k] = opt_v
end
opt.shortmess:append 'c'

-- Set colorscheme
local colorscheme = 'tokyonight'
local colorscheme_ok = pcall(require, colorscheme)
if colorscheme_ok then
  cmd('colorscheme ' .. colorscheme)
end

-- Highlight when yank
cmd [[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
    augroup END
]]

-- windows to close with "q"
cmd [[autocmd FileType help,startuptime,lspinfo nnoremap <buffer><silent> q :close<CR>]]
