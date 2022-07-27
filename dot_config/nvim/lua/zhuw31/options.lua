local indent = 2
local cmd = vim.cmd
local opt = vim.opt

vim.g.mapleader = ' '
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

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
  cursorline = true,
}

for opt_k, opt_v in pairs(options) do
  opt[opt_k] = opt_v
end
opt.shortmess:append 'c'

-- Set colorscheme
local colorscheme = 'nord'
local colorscheme_ok = pcall(require, colorscheme)
if colorscheme_ok then
  cmd('colorscheme ' .. colorscheme)
end

-- Highlight when yank
vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = 'YankHighlight',
  pattern = '*',
})

-- windows to close with "q"
cmd [[autocmd FileType help,startuptime,lspinfo,qf nnoremap <buffer><silent> q :close<CR>]]

cmd [[autocmd BufWritePost ~/.local/share/chezmoi/* !chezmoi apply --source-path "%"]]
