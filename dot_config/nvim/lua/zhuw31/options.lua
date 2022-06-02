local indent = 2
local cmd = vim.cmd
local opt = vim.opt

vim.g.mapleader = ' '
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

-- Disable builtins plugins
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

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
  guicursor = 'a:block',
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

cmd [[autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"]]
