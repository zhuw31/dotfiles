-- leader key
vim.g.mapleader = " "

local opt = vim.opt

-- misc
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Spell
opt.spelllang = { "en", "cjk" }

-- Split
opt.splitbelow = true
opt.splitright = true

-- State
opt.swapfile = false
opt.undofile = true

-- Tabs and Indent
local indent = 2
opt.expandtab = true
opt.shiftwidth = indent
opt.softtabstop = indent
opt.tabstop = indent

-- Time
opt.timeoutlen = 500
opt.updatetime = 200

-- UI
opt.cmdheight = 0
opt.fillchars = { eob = " ", diff = " " }
opt.laststatus = 0
opt.pumheight = 10
opt.scrolloff = 6
opt.list = true

-- Column
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

-- Wrap
opt.breakindent = true
opt.linebreak = true
opt.whichwrap:append("[,]")
opt.wrap = false

-- Theme
opt.termguicolors = true
-- vim.cmd.colorscheme("catppuccin")

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.diffopt:append("linematch:60")
  opt.shortmess:append("IcC")
end
