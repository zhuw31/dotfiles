local fn = vim.fn

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

local packer = require 'packer'

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'dstein64/vim-startuptime'
  use 'shaunsingh/nord.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('zhuw31.telescope').setup()
    end,
  }
  use {
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  }
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('zhuw31.lspconfig').setup()
      end,
    },
    'jose-elias-alvarez/typescript.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'folke/lua-dev.nvim',
    'b0o/schemastore.nvim',
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('zhuw31.cmp').setup()
    end,
  }
  use {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require('zhuw31.lualine').setup()
    end,
  }
  use 'gpanders/editorconfig.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('zhuw31.treesitter').setup()
    end,
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('zhuw31.autopairs').setup()
    end,
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('zhuw31.comment').setup()
    end,
  }
  use 'tpope/vim-surround'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'mzlogin/vim-markdown-toc'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('zhuw31.nvimtree').setup()
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('zhuw31.gitsigns').setup()
    end,
  }
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('zhuw31.toggleterm').setup()
    end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
